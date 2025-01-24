Return-Path: <ts@ferncast.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0ADC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 14:15:33 +0000 (UTC)
Received: from smtprelay05.ispgateway.de (smtprelay05.ispgateway.de [80.67.31.97])
 by mx.groups.io with SMTP id smtpd.web11.12803.1737728125388941997
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 06:15:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: ferncast.de, ip: 80.67.31.97, mailfrom: ts@ferncast.de)
Received: from [78.35.245.211] (helo=ferncast-thomas.fritz.box)
	by smtprelay05.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <ts@ferncast.de>)
	id 1tbKSt-000000005rB-3wqg;
	Fri, 24 Jan 2025 15:15:19 +0100
From: Thomas Schlien <ts@ferncast.de>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Schlien <ts@ferncast.de>
Subject: [meta-multimedia][PATCH] rtmpdump: update 2.4 -> v2.6
Date: Fri, 24 Jan 2025 15:14:29 +0100
Message-ID: <20250124141428.3358694-2-ts@ferncast.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Df-Sender: dHNAZmVybmNhc3QuZGU=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 14:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115060

- remove fix-racing-build-issue.patch since it is included upstream

Signed-off-by: Thomas Schlien <ts@ferncast.de>
---
 .../rtmpdump/fix-racing-build-issue.patch      | 18 ------------------
 .../{rtmpdump_2.4.bb => rtmpdump_2.6.bb}       |  4 ++--
 2 files changed, 2 insertions(+), 20 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch
 rename meta-multimedia/recipes-multimedia/rtmpdump/{rtmpdump_2.4.bb => rtmpdump_2.6.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch
deleted file mode 100644
index 6e11c9752e..0000000000
--- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Make sure libdir (SODIR) is created when running parallel make.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
-Index: git/librtmp/Makefile
-===================================================================
---- git.orig/librtmp/Makefile
-+++ git/librtmp/Makefile
-@@ -115,6 +115,7 @@ install_base:	librtmp.a librtmp.pc
- 	cp librtmp.3 $(MANDIR)/man3
- 
- install_so:	librtmp$(SO_EXT)
-+	-mkdir -p $(SODIR)
- 	cp librtmp$(SO_EXT) $(SODIR)
- 	$(INSTALL_IMPLIB)
- 	cd $(SODIR); ln -sf librtmp$(SO_EXT) librtmp.$(SOX)
diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
rename to meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
index ba2e5195e9..1d2abb3d68 100644
--- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "gnutls zlib"
 
 PV .= "+git"
-SRCREV = "fa8646daeb19dfd12c181f7d19de708d623704c0"
+SRCREV = "6f6bb1353fc84f4cc37138baa99f586750028a01"
 SRC_URI = " \
     git://git.ffmpeg.org/rtmpdump;branch=master \
-    file://fix-racing-build-issue.patch"
+"
 
 S = "${WORKDIR}/git"
 

