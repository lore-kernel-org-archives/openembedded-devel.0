Return-Path: <urs@bytesatwork.ch>
Received: from bytesatwork.ch (bytesatwork.ch [91.135.72.15])
	by mail.openembedded.org (Postfix) with ESMTP id 2001B6C76F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2014 09:48:34 +0000 (UTC)
Received: from mars.bytesatwork.ch (8-89.61-188.cust.bluewin.ch [188.61.89.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested) (Authenticated sender: urs)
	by bytesatwork.ch (Postfix) with ESMTPSA id 20CBACC18D3A;
	Mon, 27 Jan 2014 10:40:25 +0100 (CET)
From: =?UTF-8?q?Urs=20F=C3=A4ssler?= <urs@bytesatwork.ch>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jan 2014 10:48:02 +0100
Message-Id: <1390816082-17372-1-git-send-email-urs@bytesatwork.ch>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] v4l-utils: removed dependency to x11, no need for it
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
X-List-Received-Date: Mon, 27 Jan 2014 09:48:35 -0000

---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
index 6737870..0f6157f 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
 
 PR = "r2"
 
-DEPENDS = "jpeg virtual/libx11"
+DEPENDS = "jpeg"
 
 inherit autotools gettext
 
-- 
1.7.10.4


