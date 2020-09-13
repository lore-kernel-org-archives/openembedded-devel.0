Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.36352.1599996453650471968
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2020 04:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.193, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7720D240005;
	Sun, 13 Sep 2020 11:27:29 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][PATCH v2] consolation: Add recipe
Date: Sun, 13 Sep 2020 04:27:10 -0700
Message-Id: <20200913112710.1364324-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Consolation is a daemon that provide copy-paste and scrolling support to
the Linux console.

It is based on the libinput library and supports all pointer devices and
settings provided by this library,

Similar software include gpm and jamd.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../consolation/consolation_0.0.8.bb          | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/consolation/consolation_0.0.8.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2e84576ca..d4489e2a4 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -685,6 +685,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     c-ares \
     cmark \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit gobject-introspection-data", "colord", "", d)} \
+    consolation \
     cpprest \
     ctapi-common \
     dfu-util \
diff --git a/meta-oe/recipes-support/consolation/consolation_0.0.8.bb b/meta-oe/recipes-support/consolation/consolation_0.0.8.bb
new file mode 100644
index 000000000..90bd560c4
--- /dev/null
+++ b/meta-oe/recipes-support/consolation/consolation_0.0.8.bb
@@ -0,0 +1,29 @@
+SUMMARY = "copy-paste for the Linux console"
+DESCRIPTION = "Consolation is a daemon that provides copy-paste and scrolling \
+support to the Linux console. It is based on the libinput library and \
+supports all pointer devices and settings provided by this library. Similar \
+software include gpm and jamd."
+HOMEPAGE = "https://salsa.debian.org/consolation-team/consolation"
+SECTION = "console/utils"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=73ca626e1d9048abfc7d599370650827"
+
+DEPENDS = " \
+    libevdev \
+    libinput \
+    udev \
+"
+
+SRC_URI = "git://salsa.debian.org/consolation-team/consolation.git"
+SRCREV = "4581eaece6e49fa2b687efbdbe23b2de452e7902"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig systemd
+
+do_install_append() {
+    install -d ${D}${systemd_system_unitdir}
+    install -m 644 ${B}/consolation.service ${D}${systemd_system_unitdir}
+}
+
+SYSTEMD_SERVICE_${PN} = "consolation.service"
-- 
2.26.2

