Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1D88D70341
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 14:01:55 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so3030514wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 07:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ehG5y5rfnZK3oCzU5G/5Xth61n02IdUdUL24+MEX2/4=;
	b=WxYTN6vuxY1tUznrq0Ce2q/AahUvKt243bwgEJTH4LGpNWNdtGhxAl41IaXzEo5Ixf
	irvfXoNq4JMC7m+oMGAPzcY50RjhGvIXMAXw3BvrSpL7gAIqYlxmwHFjBXKK06tEXlYz
	NmMNzMQw/AV9ZXuf6farPSPVfE8owakp02M/11p+Hw+VtSQvwoBKVEkFhtNeOvVCQWDl
	ZNC4oEnqHwrvV8w3zXZDauKT+rFCzXC+U47RWKC/E+kmtKNf8yypad0q/j/ZVgGNJZnl
	Tdqb6TNAsFPOIsdYFog4+feNdbtH4yfcwwC980VwXbR7mnNahPpvUk1qBGQtcRm1+Rqf
	//bw==
X-Received: by 10.194.89.36 with SMTP id bl4mr2871193wjb.126.1407679316681;
	Sun, 10 Aug 2014 07:01:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kw1sm32296977wjb.19.2014.08.10.07.01.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 07:01:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 16:02:21 +0200
Message-Id: <1407679345-31695-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407679345-31695-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407679345-31695-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/7] gtksourceview2: add dependency on libxml2
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
X-List-Received-Date: Sun, 10 Aug 2014 14:01:57 -0000

* fixes floating dependency:
  gtksourceview2-2.10.5: gtksourceview2 rdepends on libxml2, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
index df4d472..c745e34 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://projects.gnome.org/gtksourceview/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+"
+DEPENDS = "gtk+ libxml2"
 
 PNAME = "gtksourceview"
 
-- 
2.0.4


