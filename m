Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6446476E02
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:53:48 +0000 (UTC)
Received: by wicgk12 with SMTP id gk12so11936452wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 07:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zUaDICz6y9ZsWyDlg7ai4DJdtV58n/RQRIcXzX2v+QQ=;
	b=Nn3a1C5PKMKcFOUP84rIugo8aVwtqvYytuN8XkpW1lq1nzFQdj6FMeDN2wB7Vajyeo
	BFNDb9lAmmgk11eOK6dItS5yyj3gGMpkHQGeOvi/SU8vCGlb9WdfSWPckvVbaqa8/5Bz
	a40lrejax9jHygVUxbpYoMW0k/c/Cw00Ud+9nNEL+Jsaq9oZ1czs+sgrhqrcGOdthRgi
	7XLLlSVy+DlA1ai4J09NtOU/EVTGTov5KgU9b11p2jeio+Z/KXqd8PF2zI7yHFiU9/KU
	59jVHi+htWOaUvuGbl3loWaDaZ7YVVRLHxvTKPSIT2qIC5KE2ab8LmOrNdbhXfsRWPE7
	H6kQ==
X-Received: by 10.180.21.169 with SMTP id w9mr20032291wie.73.1440687229037;
	Thu, 27 Aug 2015 07:53:49 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	p5sm12973681wiy.17.2015.08.27.07.53.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 07:53:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2015 16:53:14 +0200
Message-Id: <1440687197-26742-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440687197-26742-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440687197-26742-1-git-send-email-schnitzeltony@googlemail.com>
Subject: [PATCH 2/5] xfce4-icon-theme: remove
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
X-List-Received-Date: Thu, 27 Aug 2015 14:53:51 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* replaced by rodent-icon-theme

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb

diff --git a/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb b/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
deleted file mode 100644
index 1e4b06b..0000000
--- a/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "xfce4 icon theme rodent"
-SECTION = "x11/wm"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "intltool-native xfce4-dev-tools-native"
-
-inherit xfce
-
-SRC_URI = "http://archive.xfce.org/src/art/${BPN}/${@'${PV}'[0:3]}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "73ce2977b84f634a6a6c5d9c27e336db"
-SRC_URI[sha256sum] = "d4786692d56b8a563f66a5f260f1f13ade11e86c78cbcb25a9f9a5fc47cf66fa"
-
-FILES_${PN} += "${datadir}/xfce4/mime"
-- 
2.1.0


