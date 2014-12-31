Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 23197601F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Dec 2014 08:25:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55416173"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Dec 2014 16:22:35 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBV8PSfb009840
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Dec 2014 16:25:28 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 31 Dec 2014 16:26:00 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Dec 2014 16:22:06 +0800
Message-ID: <1420014126-30814-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH] opensaf: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Dec 2014 08:26:03 -0000
Content-Type: text/plain

OpenSAF is an open source implementation of the SAF AIS specification

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../opensaf/install-samples-from-srcdir.patch      | 11 ++++++
 .../recipes-daemons/opensaf/opensaf_4.5.0.bb       | 40 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/install-samples-from-srcdir.patch
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/install-samples-from-srcdir.patch b/meta-networking/recipes-daemons/opensaf/opensaf/install-samples-from-srcdir.patch
new file mode 100644
index 0000000..016b64f
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/install-samples-from-srcdir.patch
@@ -0,0 +1,11 @@
+--- opensaf-4.5.0.orig/Makefile.am	2014-12-31 14:45:54.088797989 +0800
++++ opensaf-4.5.0/Makefile.am	2014-12-31 14:45:08.328796688 +0800
+@@ -219,7 +219,7 @@ install-data-local:
+ 	$(mkinstalldirs) $(DESTDIR)$(pkgpiddir)
+ 	$(mkinstalldirs) $(DESTDIR)$(lockdir)
+ 	$(mkinstalldirs) $(DESTDIR)$(pkglocalstatedir)
+-	cp -R samples/ $(DESTDIR)$(pkgdatadir)
++	cp -R $(srcdir)/samples/ $(DESTDIR)$(pkgdatadir)
+ 
+ install-data-hook:
+ 	@for i in $$(grep -lr -e 'xxLIBDIRxx' -e 'xxLOGDIRxx' -e 'xxCLCCLIDIRxx' $(DESTDIR)$(pkgimmxml_svcdir)/*.xml) ; do \
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
new file mode 100644
index 0000000..a58de5c
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
@@ -0,0 +1,40 @@
+SUMMARY = "OpenSAF is an open source implementation of the SAF AIS specification"
+DESCRIPTION = "OpenSAF is an open source project established to develop a base platform \
+middleware consistent with Service Availability Forum (SA Forum) \
+specifications, under the LGPLv2.1 license. The OpenSAF Foundation was \
+established by leading Communications and Enterprise Computing Companies to \
+facilitate the OpenSAF Project and to accelerate the adoption of the OpenSAF \
+code base in commercial products. \
+The OpenSAF project was launched in mid 2007 and has been under development by \
+an informal group of supporters of the OpenSAF initiative. The OpenSAF \
+Foundation was founded on January 22nd 2008 with Emerson Network Power, \
+Ericsson, Nokia Siemens Networks, HP and Sun Microsystems as founding members."
+HOMEPAGE = "http://www.opensaf.org"
+
+inherit autotools useradd systemd pkgconfig
+
+SRC_URI = "http://jaist.dl.sourceforge.net/project/opensaf/releases/${BPN}-${PV}.tar.gz \
+           file://install-samples-from-srcdir.patch"
+
+SRC_URI[md5sum] = "534c0a99438a62c4c8dda56cfa67300c"
+SRC_URI[sha256sum] = "2f5ba57fe67e94099c0df82d0a0dd207b5c583c93030035ba354c97b5471b590"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7"
+
+DEPENDS = "libxml2 python"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "-f -r opensaf"
+USERADD_PARAM_${PN} =  "-r -g opensaf -d ${datadir}/opensaf/ -s ${sbindir}/nologin -c \"OpenSAF\" opensaf"
+
+SYSTEMD_SERVICE_${PN} += "opensafd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+FILES_${PN} += "/run"
+
+INSANE_SKIP_${PN} = "dev-so"
+
+do_install_append() {
+    rm -rf "${D}${localstatedir}/run"
+}
-- 
1.9.1


