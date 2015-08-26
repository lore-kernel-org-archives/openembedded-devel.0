Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4476973F96
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 13:59:50 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so45893425wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 06:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WdNpX1IhkogmlXYl4XeKci5T7RdWFfYryXJI39da6+o=;
	b=iT8Lwavp1YAAkKUxj9TPwSmYgBGOYuo42i6CcSZ9TYaNKlezhnA+7XLOPO0p0+nplb
	nWRrimf0hvB0GPWgo4h4efZxdNjrQWEw63UoNEYx3ZgCDdYYQGAa/lHtFUJwFBRVCIZs
	xZltanV05e5vq2H5XrEQBlbtNCsVWfajxAS5FfF7wJMXkVnfQA8aPeNr8VuAP2eRRlmM
	5z1x2o8XTiwavWTsIVt/gHvtHUBN3S0iVv2BBB/fwCpQslsXbEuf4g8DRnHr8MRZ3Stj
	c++MLk+jSSOZgRFUkg0jsQMGRoIXMNbZqCHK2HnqSD0COTvAE+unibEjagAZ+2EtTPKz
	XnwA==
X-Received: by 10.194.22.33 with SMTP id a1mr58736108wjf.90.1440597590166;
	Wed, 26 Aug 2015 06:59:50 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id p5sm7755056wiy.17.2015.08.26.06.59.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Aug 2015 06:59:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Aug 2015 15:59:58 +0200
Message-Id: <1440597598-21246-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1439279859-1815-14-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-14-git-send-email-schnitzeltony@googlemail.com>
Subject: [meta-xfce][PATCH] xfce4-icon-theme: remove
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
X-List-Received-Date: Wed, 26 Aug 2015 13:59:51 -0000

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
2.5.0


