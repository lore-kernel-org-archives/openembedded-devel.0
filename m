Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 076B176DE9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 10:34:13 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so50741600wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zUaDICz6y9ZsWyDlg7ai4DJdtV58n/RQRIcXzX2v+QQ=;
	b=NL1rEir2Qb9seuQY/81IxfxUiBa1QHZlo4KqrigtVq5s0xmA9quRAZAhPwNOIfH+8U
	+W+j8x8R3cDM3hSrI7U+kpLGZzNtiUE1ezvkKD4PsmkRssOL6eLFwuN+OuAodorxjFee
	U2FfGriMFKcK7eDkl2Rw9VrUij8URSoOW+0/Oywghz+Rf68T8LxEobnpQrSA/yrZTMwY
	gJTFxNe1NHFpZIRTo1ncf1Ca6RQVGE0dLewak+vPTv/2Okk26lzZs83TI6lvSUDYQ/98
	hQou2YEB95sKsN1B7tgp/vLcXI4VnsLtwTPkH1xWQUhQE96iA39kOMHhIaV/YRB6s1EB
	4q3Q==
X-Received: by 10.194.117.199 with SMTP id kg7mr19985421wjb.49.1440930853515; 
	Sun, 30 Aug 2015 03:34:13 -0700 (PDT)
Received: from localhost.localdomain (p54AA5C5E.dip0.t-ipconnect.de.
	[84.170.92.94]) by smtp.googlemail.com with ESMTPSA id
	h9sm16778522wjx.20.2015.08.30.03.34.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Aug 2015 03:34:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Aug 2015 12:33:56 +0200
Message-Id: <1440930840-3459-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440930840-3459-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440930840-3459-1-git-send-email-schnitzeltony@googlemail.com>
Subject: [PATCHv2 2/6] xfce4-icon-theme: remove
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
X-List-Received-Date: Sun, 30 Aug 2015 10:34:16 -0000

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


