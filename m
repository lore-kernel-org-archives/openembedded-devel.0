Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.5493.1621575392756938532
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 22:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.194, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 37AC840003;
	Fri, 21 May 2021 05:36:29 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][PATCH v2] ctags: Use PACKAGECONFIG for build options
Date: Thu, 20 May 2021 22:35:49 -0700
Message-Id: <20210521053549.2365381-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the dependencies optional via PACKAGECONFIG where possible to make
it easier for users to enable or disable them as desired. Set the new
PACKAGECONFIG defaults to recreate what was built previously.

The configure script does not have a manpages option, resulting in a
warning:
	ctags-5.9.20210502.0-r0 do_configure: QA Issue: ctags: invalid PACKAGECONFIG: manpages [invalid-packageconfig]

The configure script detects if rst2man.py is available, and enables
creating the man pages if found. Add python3-docutils-native as a
dependency only when documentation is requested.

Remove commented code which looks like leftover debugging. The binary is
installed as expected.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../ctags/ctags_5.9.20210502.0.bb               | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb
index aca0502db..273d6e573 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb
@@ -14,12 +14,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-DEPENDS += "libxml2 jansson libyaml python3-docutils-native"
 SRCREV = "6df08b82d4845d1b9420d9268f24d5db16ee4480"
 SRC_URI = "git://github.com/universal-ctags/ctags"
 
 S = "${WORKDIR}/git"
 
-#do_install() {
-#    install -Dm 755 ${B}/ctags ${D}${bindir}/ctags
-#}
+PACKAGECONFIG ??= " \
+    readcmd \
+    xml \
+    json \
+    yaml \
+"
+PACKAGECONFIG[readcmd] = "--enable-readcmd,--disable-readcmd"
+PACKAGECONFIG[etags] = "--enable-etags,--disable-etags"
+PACKAGECONFIG[xml] = "--enable-xml,--disable-xml,libxml2"
+PACKAGECONFIG[json] = "--enable-json,--disable-json,jansson"
+PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
+PACKAGECONFIG[yaml] = "--enable-yaml,--disable-yaml,libyaml"
+PACKAGECONFIG[manpages] = ",,python3-docutils-native"
-- 
2.26.3

