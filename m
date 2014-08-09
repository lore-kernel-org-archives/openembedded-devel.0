Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id E73D570AA3
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:49 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so6706384wgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gznQvdAlI4gEDWm/QdrYT2L/VFJUsYMGfBlhb5+aHjU=;
	b=B+RoeiU5ymtNeUz4V+L3fxS43O/jMEx0Oc57YOs3mWsQtqRz2HSMZmkImIbCSeTtLe
	r7P/7JQP/fYAFvygmjdBx0sjGoM0+Sjx1JoufIUZ6OSoXKcKvT3DTZ5tm0nX/o7ylHbf
	E1pFTr+QK+pU0MEi1TQiheAvdpj3M2Di3NxKBJzQfQabo0W6Oh4jPsKxJuPibY9y8L25
	O1U8PVuxRJ6D2F8q4aqxmA62+6vBWt2SHNUse9yhDIKc6Mit4iK5iAccZJrMrM0Zh0z/
	TPTkxDYYvQvtMnez4biPBmJi+ycNCQiUV6PZJegBMgLyCOrr5QX/smid5qDSH9+KzKA9
	HOZA==
X-Received: by 10.180.73.139 with SMTP id l11mr11570348wiv.30.1407600530734;
	Sat, 09 Aug 2014 09:08:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	10sm25527706wjx.26.2014.08.09.09.08.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:40 +0200
Message-Id: <1407600537-10857-19-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 19/36] gnome-themes: remove unrecognized configure options
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:50 -0000

* fixes following QA warning:
  gnome-themes-2.32.1: gnome-themes: configure was passed unrecognised
    options: --disable-hicolor-check [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index 6664bfa..a2b7e0c 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -8,7 +8,7 @@ SECTION = "x11/gnome"
 DEPENDS = "gtk-engines icon-naming-utils icon-naming-utils-native glib-2.0 intltool-native libxml-simple-perl-native"
 RDEPENDS_${PN} = "gnome-icon-theme"
 
-EXTRA_OECONF += "--enable-all-themes --disable-hicolor-check \
+EXTRA_OECONF += "--enable-all-themes \
     --with-iconmap=${STAGING_LIBDIR_NATIVE}/icon-naming-utils/icon-name-mapping \
 "
 
-- 
2.0.4


