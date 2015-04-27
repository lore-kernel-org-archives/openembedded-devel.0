Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1B373D76
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 18:45:13 +0000 (UTC)
Received: by widdi4 with SMTP id di4so110885528wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 11:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GAPcJitSHkta3D/r14HB/bpeKafrFUfY8BV5cZD4IB4=;
	b=KMk8W8YCOQRYtr6zkC3ZOV36F5n7Cw5KcvY0+RpN5MubvsBOTllHQcD05wepfz1o+N
	gOPpe1bEm7AFpusfELM1F02Vwas95Yv02nQBYRjd/ipFTiMytDIUWJyHGBXF0jP/CRhN
	jhsgqY3BhbzxXJbxUCKTNyoQHRhfxF5P1Ne4R2fpnIqYtIhhNajSir2mvqgIeH03XX6z
	PulGzbShgKbdbSXE9qwgvbgsCwhV7ZOzs4IimhipM1rfpG0Lw3t2UrpnCjDH4ZBLf+rt
	EyeYGPKUDxIj3KaAclcPq2pprR6x5tT3DToBvIute+vU+Y7iahi4YmT8ilnUBbojZJWY
	HwZw==
X-Received: by 10.194.2.16 with SMTP id 16mr24776460wjq.46.1430160314901;
	Mon, 27 Apr 2015 11:45:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ch2sm12767100wib.18.2015.04.27.11.45.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 11:45:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 20:46:07 +0200
Message-Id: <1430160369-3099-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1430160369-3099-1-git-send-email-Martin.Jansa@gmail.com>
References: <1430160369-3099-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][dizzy][PATCH 2/4] libsecret: add missing dependency on intltool-native
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
X-List-Received-Date: Mon, 27 Apr 2015 18:45:16 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb b/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
index dca3350..06e94bd 100644
--- a/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
+++ b/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
 inherit gnomebase gtk-doc
 
-DEPENDS = "glib-2.0 libgcrypt"
+DEPENDS = "glib-2.0 libgcrypt intltool-native"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
2.3.5


