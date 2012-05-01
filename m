Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPBdc-0001j6-G6
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2012 13:53:00 +0200
Received: by wera1 with SMTP id a1so2634400wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 May 2012 04:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=4KtZADjp7YVCMbVJc2VoTOKZqMfeuqRRyqmZGSLpstA=;
	b=cdaybpFMK1stw6SYUiYCeENaCMB345r/JdaQM9iSXIpWIDk48jpqugMiEJt0nDrqdX
	hCFM0qSuThji+JWipxxT6Ot2Lp5zWepRNGQE0EunYBczBMVJJt7949etDrUy7EnUqwJd
	fQ/w0kJ6ks25iHweY23CUaJZAEDlwvSsCmbqF9van86/tNoyedwswhht0B8sEuogdFoP
	fQCEIojVPFoo5KxgGmOnLWVy0dSeIRX/KdjzO93fjfugxOSd2XO4Ilm0qguDj0U87AUb
	iKd8k3MerJe8q22MJI+i7sWjPeY1TigKgnNlDx7wPup1KKcvPdKvP4LXbgmWjiFKhe9p
	//ww==
Received: by 10.180.93.196 with SMTP id cw4mr4567523wib.19.1335872597625;
	Tue, 01 May 2012 04:43:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex2sm56750715wib.8.2012.05.01.04.43.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 04:43:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 May 2012 13:43:10 +0200
Message-Id: <1335872590-4387-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 10/10] xorg: remove BBCLASSEXTENDs for gtk+-native they should be in oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2012 11:53:00 -0000

This reverts commit 1ab99af784f5f1564f28f6afc4718d630b42a606.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-lib/libxcomposite_0.4.3.bbappend          |    1 -
 .../xorg-lib/libxcursor_1.1.13.bbappend            |    1 -
 .../xorg-lib/libxdamage_1.1.3.bbappend             |    1 -
 .../xorg-lib/libxfixes_5.0.bbappend                |    1 -
 .../xorg-lib/libxrandr_1.3.2.bbappend              |    1 -
 .../xorg-proto/compositeproto_0.4.2.bbappend       |    1 -
 .../xorg-proto/damageproto_1.2.1.bbappend          |    1 -
 .../xorg-proto/fixesproto_5.0.bbappend             |    1 -
 .../xorg-proto/randrproto_1.3.2.bbappend           |    1 -
 9 files changed, 0 insertions(+), 9 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.13.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxdamage_1.1.3.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxrandr_1.3.2.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xorg-proto/compositeproto_0.4.2.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xorg-proto/damageproto_1.2.1.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xorg-proto/randrproto_1.3.2.bbappend

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bbappend
deleted file mode 100644
index d6f5869..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND += "native"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.13.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.13.bbappend
deleted file mode 100644
index d6f5869..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.13.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND += "native"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxdamage_1.1.3.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxdamage_1.1.3.bbappend
deleted file mode 100644
index d6f5869..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libxdamage_1.1.3.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND += "native"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bbappend
deleted file mode 100644
index d6f5869..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND += "native"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxrandr_1.3.2.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxrandr_1.3.2.bbappend
deleted file mode 100644
index d6f5869..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libxrandr_1.3.2.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND += "native"
diff --git a/meta-oe/recipes-graphics/xorg-proto/compositeproto_0.4.2.bbappend b/meta-oe/recipes-graphics/xorg-proto/compositeproto_0.4.2.bbappend
deleted file mode 100644
index d6f5869..0000000
--- a/meta-oe/recipes-graphics/xorg-proto/compositeproto_0.4.2.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND += "native"
diff --git a/meta-oe/recipes-graphics/xorg-proto/damageproto_1.2.1.bbappend b/meta-oe/recipes-graphics/xorg-proto/damageproto_1.2.1.bbappend
deleted file mode 100644
index d6f5869..0000000
--- a/meta-oe/recipes-graphics/xorg-proto/damageproto_1.2.1.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND += "native"
diff --git a/meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bbappend b/meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bbappend
deleted file mode 100644
index d6f5869..0000000
--- a/meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND += "native"
diff --git a/meta-oe/recipes-graphics/xorg-proto/randrproto_1.3.2.bbappend b/meta-oe/recipes-graphics/xorg-proto/randrproto_1.3.2.bbappend
deleted file mode 100644
index d6f5869..0000000
--- a/meta-oe/recipes-graphics/xorg-proto/randrproto_1.3.2.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND += "native"
-- 
1.7.8.6



