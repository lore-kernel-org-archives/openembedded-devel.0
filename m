Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id D56616C4DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 00:52:28 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id C6E241C004F;
	Wed, 21 Nov 2018 13:52:27 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2018 13:52:19 +1300
Message-Id: <20181121005220.22091-6-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181121005220.22091-1-douglas.royds@taitradio.com>
References: <20181120063718.28683-1-douglas.royds@taitradio.com>
	<20181121005220.22091-1-douglas.royds@taitradio.com>
Subject: [meta-oe][PATCH v2 5/6] net-snmp: Reproducibility: Set NETSNMP_CONFIGURE_OPTIONS null
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2018 00:52:29 -0000

To avoid build host paths being written into binaries,
accept a null NETSNMP_CONFIGURE_OPTIONS from the environment.

Upstream-Status: Submitted https://sourceforge.net/p/net-snmp/patches/1384/
Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 ...bility-accept-configure-options-from-env.patch | 15 +++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.8.bb    |  2 ++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-accept-configure-options-from-env.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-accept-configure-options-from-env.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-accept-configure-options-from-env.patch
new file mode 100644
index 000000000..b0dbf5ad3
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-accept-configure-options-from-env.patch
@@ -0,0 +1,15 @@
+Reproducible build: To avoid build host paths being written into binaries,
+accept NETSNMP_CONFIGURE_OPTIONS from the environment.
+NETSNMP_CONFIGURE_OPTIONS can be set either null or to a fixed value.
+
+--- net-snmp-5.8.original/configure.ac	2018-11-20 17:41:39.926529072 +1300
++++ net-snmp-5.8/configure.ac	2018-11-20 17:54:44.488180224 +1300
+@@ -28,7 +28,7 @@
+ #
+ # save the configure arguments
+ #
+-AC_DEFINE_UNQUOTED(NETSNMP_CONFIGURE_OPTIONS,"$ac_configure_args",
++AC_DEFINE_UNQUOTED(NETSNMP_CONFIGURE_OPTIONS,"${NETSNMP_CONFIGURE_OPTIONS-$ac_configure_args}",
+   [configure options specified])
+ CONFIGURE_OPTIONS="\"$ac_configure_args\""
+ AC_SUBST(CONFIGURE_OPTIONS)
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index f556c5898..2a0d88ab2 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -25,6 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
            file://net-snmp-fix-for-disable-des.patch \
            file://reproducibility-have-printcap.patch \
+           file://reproducibility-accept-configure-options-from-env.patch \
            "
 SRC_URI[md5sum] = "6aae5948df7efde626613d6a4b3cd9d4"
 SRC_URI[sha256sum] = "c6291385b8ed84f05890fe4197005daf7e7ee7b082c2e390fa114a9477a56042"
@@ -70,6 +71,7 @@ CACHED_CONFIGUREVARS = " \
     lt_cv_shlibpath_overrides_runpath=yes \
     ac_cv_path_UNAMEPROG=${base_bindir}/uname \
     ac_cv_file__etc_printcap=no \
+    NETSNMP_CONFIGURE_OPTIONS= \
 "
 export PERLPROG="${bindir}/env perl"
 PERLPROG_append = "${@bb.utils.contains('PACKAGECONFIG', 'perl', ' -I${WORKDIR}', '', d)}"
-- 
2.17.1


