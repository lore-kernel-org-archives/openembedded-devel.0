Return-Path: <kory.maincent@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D2BC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 09:56:19 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.6146.1667901370624448670
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Nov 2022 01:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OuSZ8/WC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: kory.maincent@bootlin.com)
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6A27340008;
	Tue,  8 Nov 2022 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667901368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R4yY/PF/lhI3EXOaG6BtW2QKkPx7+Tmag5ZHiv1uQPk=;
	b=OuSZ8/WCr546iNaf3dTSPmDhDE+LqsrSCyBKjMItOVnTmgyu4b13HfsCr7Fk48BOCOYT6A
	shT/ov6uPY1PjMOGdTpDURI7VSpfaeELYZ7MANsehUHapSq2TggqyKWaZKePeSjoWqlKG8
	iTlFP40y3iXpy8R80ml9yzxuBJQowLS7SqHMY5xHRdQVsrXNc5IKANOYRHE9x7baZDYt5C
	wy0TD/Z4kw7khL2TGwsitXkUlSmURUSFG9QVHXAUnYcDlHckU63t1QUgzhh15MHo/8TlUJ
	N+WyiUPRXgMmW+koDbdNF7elpwb6QGti9wgVjgq2kB9Wi+z/uCmQzhsWHAPspA==
From: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	thomas.petazzoni@bootlin.com,
	Kory Maincent <kory.maincent@bootlin.com>
Subject: [meta-oe][PATCH] openocd: fix build error
Date: Tue,  8 Nov 2022 10:56:06 +0100
Message-Id: <20221108095606.563730-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Nov 2022 09:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99490

From: Kory Maincent <kory.maincent@bootlin.com>

The update of RANLIB environment to "ranlib -D" in OE caused an error in
the openocd executable check. Indeed it is not compatible with a
environment compound with the tool name and a parameter.

cc.tcl:272: Error: wrong # args: should be "find-executable name"
configure: error: ./configure.gnu failed for jimtcl

This patch fixes it by patching openocd executable test to check the first
word of the environment only.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 ...p-cc-check-tools-check-only-the-name.patch | 30 +++++++++++++++++++
 .../recipes-devtools/openocd/openocd_git.bb   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-autosetup-cc-check-tools-check-only-the-name.patch

diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-autosetup-cc-check-tools-check-only-the-name.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-autosetup-cc-check-tools-check-only-the-name.patch
new file mode 100644
index 000000000..165c658d0
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd/0001-autosetup-cc-check-tools-check-only-the-name.patch
@@ -0,0 +1,30 @@
+From 29e8dfae4593c91f11d7ea31a4722a6d82f6c950 Mon Sep 17 00:00:00 2001
+From: Kory Maincent <kory.maincent@bootlin.com>
+Date: Wed, 2 Nov 2022 16:39:30 +0100
+Subject: [PATCH] autosetup: cc-check-tools: check only the name of the tool
+ without its params
+
+Update the tool existence check. Test only the first word of the
+args to keep only the executable without its parameters.
+
+Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
+---
+ autosetup/cc.tcl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/jimtcl/autosetup/cc.tcl b/jimtcl/autosetup/cc.tcl
+index 585d259..4c87854 100644
+--- a/jimtcl/autosetup/cc.tcl
++++ b/jimtcl/autosetup/cc.tcl
+@@ -264,7 +264,7 @@ proc cc-check-tools {args} {
+ 	foreach tool $args {
+ 		set TOOL [string toupper $tool]
+ 		set exe [get-env $TOOL [get-define cross]$tool]
+-		if {[find-executable {*}$exe]} {
++		if {[find-executable {*}[regexp -inline {\S+} $exe]]} {
+ 			define $TOOL $exe
+ 			continue
+ 		}
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 1503bb675..06d77b6a9 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl;branch=master \
     git://repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl;branch=master \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink;branch=master \
+    file://0001-autosetup-cc-check-tools-check-only-the-name.patch \
 "
 
 SRCREV_FORMAT = "openocd"
-- 
2.25.1


