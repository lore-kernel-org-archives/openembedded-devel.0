Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4373E65CD5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 May 2014 20:38:23 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id la4so679557vcb.41
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 May 2014 13:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YwGRO8EWrf4K/VeH7BUgf8d6ifHKvIKvM4ODs1hHiyk=;
	b=RYIbqKUtcQBWNlDrBDSfOwSeHzsSCzf/Q1dVzQbIDhrbDPvEE20g7K+fVAgsheZuLz
	MCw6OdfxC/hhlk8y64r1Opf78lXHMtJlOAQ1YUhtXs97lOu7GILm2t8rsq9QSjJGrFJ1
	z+bjxEmBFmOKbo0RY8Q9xzDvsvhD4qSKPh9TZ6jJEfyVDGc4MJatYBuqSlVcOE70AH5B
	zYa+T3DGAdgaU2R0lGS7riV+bGxlU6GGJ9FjfS0KxE7vYqYDIuQIG1FtUcHv1tR5F6xp
	bMpMVwPOCQgIXhbbbwH9SvhqD4+26OD1eTnMefg0FhTlKqfo8MH1D/lt1dlfZGBRA+y0
	F/pw==
X-Received: by 10.221.62.131 with SMTP id xa3mr24477805vcb.13.1399235904572;
	Sun, 04 May 2014 13:38:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	un13sm13616696vdb.10.2014.05.04.13.38.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 May 2014 13:38:23 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 May 2014 22:38:41 +0200
Message-Id: <1399235921-2828-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][WIP][PATCH] gcr: add libgcrypt dependency
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
X-List-Received-Date: Sun, 04 May 2014 20:38:25 -0000

* otherwise it tries to use libraries from wrong sysroot or sometimes
  it fails in do_configure already with:
  | configure.ac:160: warning: macro 'AM_PATH_LIBGCRYPT' not found in   library
  | autoreconf: running:   /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/autoconf   --force
  | configure.ac:160: error: possibly undefined macro: AM_PATH_LIBGCRYPT

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
index c71f5a4..f30fcf1 100644
--- a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
+++ b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "gtk+3 p11-kit glib-2.0"
+DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt"
 
 inherit autotools gnomebase gtk-icon-cache gtk-doc
 
-- 
1.9.1


