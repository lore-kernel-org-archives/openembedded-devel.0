Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id A37B46084B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:51 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id p61so6674593wes.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=thQqXZtLdeOtnf0xRuBVHPs1UM6kfyXusw8jqpXtnrA=;
	b=TUOJK/UjtzxziAiuBryeesVzemXWmTkIe3yX6hx4dH9HaJkUBCrvrQzwWG5lKoED5a
	hXXCTxQyzffivfgr1eY2QRtFFvFc3gnhRvPVHCDX7ZD3pF/8/ZOWcfMZzkh+pUeQWTVb
	l85NiapZ13DICTMOKvaspKKPFb8gTy2UKOD59WX0ZMfXUFv1r6I4RK5/rmczUVIr++Hv
	KstjcszpVlik7qkVpETWRmXEH/OI6hhQK0S0EUa3JJ17zRoEgl3CgARq8Zv1p0l0UdId
	DS+J6UvGeuzn2K4llGEKXaZ7lDgsiHf2Hu1MlcY0cIETbrImdtVrZuD8ojwZ1YDmVWek
	Yy2Q==
X-Received: by 10.180.103.227 with SMTP id fz3mr21551966wib.29.1396372492138; 
	Tue, 01 Apr 2014 10:14:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y51sm41879933eeu.0.2014.04.01.10.14.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:34 +0200
Message-Id: <1396372434-10710-26-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 26/46] libbonobo: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
index 9f08577..db1db5d 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "x11/gnome/libs"
 DEPENDS = "glib-2.0 orbit2 intltool-native libxml2"
 
-inherit gnome
+inherit gnomebase
 
 SRC_URI += "file://gtk-doc.m4 \
             file://gtk-doc.make \
-- 
1.9.1


