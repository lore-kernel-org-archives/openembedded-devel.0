Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.30555.1599963137880307456
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2020 19:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.199, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1FBFBFF804;
	Sun, 13 Sep 2020 02:12:14 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][PATCH] consolation: Add recipe
Date: Sat, 12 Sep 2020 19:11:42 -0700
Message-Id: <20200913021142.1262266-1-robert.joslyn@redrectangle.org>
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
 .../consolation/consolation_0.0.8.bb          | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/consolation/consolation_0.0.8.bb

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

