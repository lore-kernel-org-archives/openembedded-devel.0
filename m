Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id CE7256B8D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 06:37:31 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 3825D2202D2;
	Tue, 20 Nov 2018 19:37:31 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 19:37:17 +1300
Message-Id: <20181120063718.28683-5-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181120063718.28683-1-douglas.royds@taitradio.com>
References: <20181120063718.28683-1-douglas.royds@taitradio.com>
Subject: [meta-oe][PATCH 4/5] net-snmp: Reproducibility: Don't check build host for /etc/printcap
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
X-List-Received-Date: Tue, 20 Nov 2018 06:37:32 -0000

Don't check for /etc/printcap on the build machine when cross-compiling.
Use AC_CHECK_FILE to set the cached variable ac_cv_file__etc_printcap instead.
When cross-compiling, this variable should be set in the environment to "yes" or
"no" as appropriate for the target platform.

I have taken the simple expedient of setting ac_cv_file__etc_printcap=no.
If this proves to be a problem, we can easily add a new variable, HAS_PRINTCAP.

Upstream-Status: Submitted https://sourceforge.net/p/net-snmp/patches/1385/
Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 .../reproducibility-have-printcap.patch       | 19 +++++++++++++++++++
 .../net-snmp/net-snmp_5.8.bb                  |  2 ++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch
new file mode 100644
index 000000000..4316c7a71
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch
@@ -0,0 +1,19 @@
+Reproducible build: Don't check for /etc/printcap on the build machine when
+cross-compiling. Use AC_CHECK_FILE to set the cached variable
+ac_cv_file__etc_printcap instead. When cross-compiling, this variable should be
+set in the environment to "yes" or "no" as appropriate for the target platform.
+
+--- net-snmp-5.8.original/configure.d/config_os_misc4	2018-11-20 17:05:03.986274522 +1300
++++ net-snmp-5.8/configure.d/config_os_misc4	2018-11-20 17:08:32.250700448 +1300
+@@ -116,9 +116,9 @@
+ 	[Path to the lpstat command])
+     AC_DEFINE(HAVE_LPSTAT, 1, [Set if the lpstat command is available])
+ fi
+-if test -r /etc/printcap; then
++AC_CHECK_FILE([/etc/printcap],
+     AC_DEFINE(HAVE_PRINTCAP, 1, [Set if /etc/printcap exists])
+-fi
++)
+ 
+ 
+ #       Check ps args
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 4b1267b3c..08015c67b 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -24,6 +24,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://0004-configure-fix-incorrect-variable.patch \
            file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
            file://net-snmp-fix-for-disable-des.patch \
+           file://reproducibility-have-printcap.patch \
            "
 SRC_URI[md5sum] = "6aae5948df7efde626613d6a4b3cd9d4"
 SRC_URI[sha256sum] = "c6291385b8ed84f05890fe4197005daf7e7ee7b082c2e390fa114a9477a56042"
@@ -68,6 +69,7 @@ CACHED_CONFIGUREVARS = " \
     ac_cv_ETC_MNTTAB=/etc/mtab \
     lt_cv_shlibpath_overrides_runpath=yes \
     ac_cv_path_UNAMEPROG=${base_bindir}/uname \
+    ac_cv_file__etc_printcap=no \
 "
 export PERLPROG="${bindir}/env perl"
 PERLPROG_append = "${@bb.utils.contains('PACKAGECONFIG', 'perl', ' -I${WORKDIR}', '', d)}"
-- 
2.17.1


