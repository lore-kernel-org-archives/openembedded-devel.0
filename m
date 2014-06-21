Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id B58C470274
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 09:19:15 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id u57so4837522wes.33
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 02:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TcZTOQATqqv47mUCrQVPC5UG+YwjQ5HChFIxtVdxIXY=;
	b=N60Qfs4jb8AhI7Sbye4ldNEew3akThrXPx5RV8W3YBRE07BA0bU+3PvKDAReVYCJBG
	Fihxm2Nf1tX8ynFHcgxLqF6utvo3TiNGs+Lwgg97w2+j38c2oqW+TCTqdJIxjbF/h9NO
	ZrgsFi5TK2Bv1gI5CsrIwsOfu4G4Za9SRVukQHSlLHTVCSz/70ZvO3/CBwq13MFibHyn
	1OszMyKiHYbolC56EVSw2Ex8WgqQGa4kHSphRjxDvFpwDAKWn+3UHyuhBq+8oH0H9n8V
	b9vYC6UzWhk0Sc0XYkpHCM11hbIC95ERUE6Srs1dvLlrZhyI9CZwenpaXXE2Ddt+Zg+/
	i4sg==
X-Received: by 10.180.94.37 with SMTP id cz5mr10120643wib.19.1403342356673;
	Sat, 21 Jun 2014 02:19:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex4sm12458244wic.2.2014.06.21.02.19.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 02:19:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 11:19:04 +0200
Message-Id: <1403342349-11180-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 07/12] glade3: add missing dependency on gnome-common and libxml2
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
X-List-Received-Date: Sat, 21 Jun 2014 09:19:17 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/glade/glade3_3.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
index eec40e4..3f93eba 100644
--- a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gnash"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
                     file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7"
-DEPENDS = "gtk+ gnome-doc-utils-native"
+DEPENDS = "gtk+ gnome-doc-utils-native gnome-common libxml2"
 
 PR = "r1"
 
-- 
2.0.0


