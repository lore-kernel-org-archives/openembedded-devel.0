Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8CDF670A7F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:45 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so6922977wev.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hWI2VbvSp+Th7guv/wM5J4cL/Bm0mUdd5yVsfr2Ky/M=;
	b=N7/gTAs7QESpP8RXR0qJZ7qULl23o9RmlJ0OCiiB7zvBXuNfhAxCuCCMOQi4DGtOre
	A4DZUR2VIEi3yvRp5Eo/qd2BQtUIqvlji+7iszbII64GodO7umkojw4tclsrTy1j45QS
	NEGaKQiqh2VvsUFjrPwXQsJurw0piysaPw05joFGw7J8R7lZxrT0wmgS4SVsdPRC/EHy
	CFeNuAaQ0xtiyfgyFZE/Iwh57GvGYh+zinox+0ijDirLmLncxUtgX/dO4iN8q65B/+5I
	mkPd1g42WqnI2+wm3ho82PAyyRXRx56w/vPxh+MPq15tlNTTVRCGu70BmqWmF9I98f49
	JPRw==
X-Received: by 10.194.237.5 with SMTP id uy5mr12315110wjc.98.1407600527066;
	Sat, 09 Aug 2014 09:08:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ca8sm25553560wjc.0.2014.08.09.09.08.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:37 +0200
Message-Id: <1407600537-10857-16-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 16/36] libgnomecanvas: inherit only gnomebase
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:47 -0000

* fixes following QA warning:
  libgnomecanvas-2.30.3: libgnomecanvas: configure was passed
    unrecognised options: --disable-schemas-install
    [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
index 22b3bf4..fd8f689 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 SECTION = "x11/gnome/libs"
 
-inherit gnome gtk-doc
+inherit gnomebase gtk-doc
 
 # intltool to provide IT_PROG_INTLTOOL
 # configure: line 12654: syntax error near unexpected token `0.35.0'
-- 
2.0.4


