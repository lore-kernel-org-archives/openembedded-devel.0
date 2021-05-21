Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.3547.1621560300844604752
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 18:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.199, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3E21AFF803;
	Fri, 21 May 2021 01:24:57 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][PATCH] ctags: Recipe cleanup
Date: Thu, 20 May 2021 18:23:42 -0700
Message-Id: <20210521012342.2205595-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The configure script does not have a manpages option, resulting in a
warning:
	ctags-5.9.20210502.0-r0 do_configure: QA Issue: ctags: invalid PACKAGECONFIG: manpages [invalid-packageconfig]

Since there does not seem to be any man pages or documentation related
configuration options, remove the manpages class.

Remove commented code which looks like leftover debugging. The binary is
installed as expected.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb
index aca0502db..c0ffe9be6 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb
@@ -12,14 +12,10 @@ HOMEPAGE = "https://ctags.io/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-inherit autotools-brokensep pkgconfig manpages
+inherit autotools-brokensep pkgconfig
 
 DEPENDS += "libxml2 jansson libyaml python3-docutils-native"
 SRCREV = "6df08b82d4845d1b9420d9268f24d5db16ee4480"
 SRC_URI = "git://github.com/universal-ctags/ctags"
 
 S = "${WORKDIR}/git"
-
-#do_install() {
-#    install -Dm 755 ${B}/ctags ${D}${bindir}/ctags
-#}
-- 
2.26.3

