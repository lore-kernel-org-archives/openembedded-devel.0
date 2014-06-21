Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id E79DF609BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 09:19:15 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id cc10so1849423wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HzPEWZ6FVW85Hf964CpmzkyO+49O30AHZhddNoj8pkY=;
	b=VY2JuueD4MO0I7gz1Khe66d1e4ZR53zKpsdm/eHlzfkCPkmnEyqWMn44g/95vNu2ZV
	47KJrOnaJe7dFA/YPLcm3QXghX8lt5u7vFTKTSL5MwBfAl70GZCt7sqNYqMdmHgUgESI
	hUHsN/VUcn1ioWgRtAlzl36ohuBdeODxOYviTdPymLx6OVxlecyCPOArTs9y9BX8zqAd
	SzMt2pkXkVi3RlZK3WjwFbDOZo8OFLki3dFhHVUYMEwM6WUpUsr5Cdmh5mnc5/qhJcPl
	7Dn66bG1V6kAL5ta/FcILgNQ0WApr0snDuVCPtx/7RHwAMlpfUN17+HRhEB+xkAir2v2
	BEfA==
X-Received: by 10.194.189.137 with SMTP id gi9mr10443301wjc.31.1403342355609; 
	Sat, 21 Jun 2014 02:19:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o10sm21179419wjy.0.2014.06.21.02.19.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 02:19:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 11:19:03 +0200
Message-Id: <1403342349-11180-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 06/12] polkit-gnome: add missing dependency on gnome-common
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
X-List-Received-Date: Sat, 21 Jun 2014 09:19:16 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb b/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
index c6017c7..f018773 100644
--- a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
+++ b/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
@@ -2,7 +2,7 @@ SUMMARY = "GNOME Authentication Agent for PolicyKit"
 DESCRIPTION = "PolicyKit-gnome provides an Authentication Agent for PolicyKit that integrates well with the GNOME desktop environment"
 HOMEPAGE = "http://www.packagekit.org/"
 BUGTRACKER = "http://bugzilla.gnome.org/"
-DEPENDS = "polkit dbus-glib gconf gtk+ intltool-native"
+DEPENDS = "polkit dbus-glib gconf gtk+ intltool-native gnome-common"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74579fab173e4c5e12aac0cd83ee98ec \
                     file://src/main.c;beginline=1;endline=20;md5=aba145d1802f2329ba561e3e48ecb795"
-- 
2.0.0


