Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id B456770276
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 14:01:54 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so3036129wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 07:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A+RGjGu9MiGfNmzL/lKAKSlxP49ju7H3yRZAdNG0QWQ=;
	b=s3XM3/M51stL8QRgtBVYGUsMzYeoxvQ0zjJIevk9iY0QlaFRxzh/FFnBxIT42SmNSQ
	0gE+EONxkLxF6yyTP71rE0XIKn2mLw0u/nFhvjx+0qXju7phlZLbOry1IFrq1dZCaOiz
	8oz2ArEV6KjGWYDOCGqRBVhpN42fKRIyqGgLMiZzQg2ypulGIFNTg78GmgHJ7uQKCvcP
	dgoWRfr1qJ/MznigxuHvwH9eJLwjrkSfenIuAkCJG5jvr2cPrPq+k9OOBFbE9tTWACS2
	KWxG6ugmwXOBEES6Yo2K9IZyORW5Z9qWqzTGvYB5TUxM9x56Wxlc6a6Hg9npjzy16WIK
	HT0A==
X-Received: by 10.180.205.212 with SMTP id li20mr12910355wic.2.1407679315354; 
	Sun, 10 Aug 2014 07:01:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pj6sm32294989wjb.21.2014.08.10.07.01.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 07:01:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 16:02:20 +0200
Message-Id: <1407679345-31695-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407679345-31695-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407679345-31695-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/7] dconf: add dependency on libxml2
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
X-List-Received-Date: Sun, 10 Aug 2014 14:01:56 -0000

* fixes floating dependency:
  dconf-0.18.0: dconf-editor rdepends on libxml2, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
index 38b2789..2b6f15e 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
@@ -9,7 +9,7 @@ SRC_URI[archive.md5sum] = "69a12ed68893f2e1e81ac4e531bc1515"
 SRC_URI[archive.sha256sum] = "109b1bc6078690af1ed88cb144ef5c5aee7304769d8bdc82ed48c3696f10c955"
 GNOME_COMPRESS_TYPE = "xz"
 
-DEPENDS = "glib-2.0 gtk+3"
+DEPENDS = "glib-2.0 gtk+3 libxml2"
 
 inherit vala gtk-doc
 
-- 
2.0.4


