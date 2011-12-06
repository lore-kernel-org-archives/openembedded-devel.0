Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXruO-0004Wz-GE
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:05:56 +0100
Received: by mail-ey0-f175.google.com with SMTP id c1so1374062eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=IoHl1QkWtdpGdpvwY3DFKn9yd5J+wYhFd3523VwPlDg=;
	b=g4Sh/pG10yASeeNPPXpN8HC7WRJbEMTlaLPGC2cwI7kaxCR5nPt8Wsz4F51xqcxoHe
	dN70Fu7uDd/vQAnWtuwM+THkiXs2yLVAGzn82Z4GDlN2yaDyqM7CktBBuEm6mqZGaXtQ
	e198XyckOydWGsBRU7RoXxaL+PvREAiftMyPw=
Received: by 10.213.3.131 with SMTP id 3mr2202762ebn.104.1323165551681;
	Tue, 06 Dec 2011 01:59:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 17sm58118475eej.3.2011.12.06.01.59.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:59:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:57:14 +0100
Message-Id: <a096d83f165d3ac28a228faa35d888c96af832d0.1323165311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
References: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323165311.git.Martin.Jansa@gmail.com>
References: <cover.1323165311.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-efl 15/16] python-elementary: temporary fix to get it build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2011 10:09:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ementary-temporary-fix-for-build-breakage.patch |   49 ++++++++++++++++++++
 .../python/python-elementary_svn.bb                |    4 +-
 2 files changed, 52 insertions(+), 1 deletions(-)
 create mode 100644 meta-efl/recipes-devtools/python/python-elementary/0001-python-elementary-temporary-fix-for-build-breakage.patch

diff --git a/meta-efl/recipes-devtools/python/python-elementary/0001-python-elementary-temporary-fix-for-build-breakage.patch b/meta-efl/recipes-devtools/python/python-elementary/0001-python-elementary-temporary-fix-for-build-breakage.patch
new file mode 100644
index 0000000..ef61c99
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-elementary/0001-python-elementary-temporary-fix-for-build-breakage.patch
@@ -0,0 +1,49 @@
+From 61b8233c582bcb1786bfcafa984abfd523fedcca Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 1 Dec 2011 22:07:38 +0100
+Subject: [PATCH] python-elementary: temporary fix for build breakage
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ .../include/elementary/c_elementary.pxd            |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/include/elementary/c_elementary.pxd b/include/elementary/c_elementary.pxd
+index 16535c5..09986f8 100644
+--- a/include/elementary/c_elementary.pxd
++++ b/include/elementary/c_elementary.pxd
+@@ -169,13 +169,13 @@ cdef extern from "Elementary.h":
+         evas.c_evas.Eina_Bool hover_top
+         evas.c_evas.Eina_Bool hover_bottom
+ 
+-    ctypedef char *(*GenlistItemLabelGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
++    ctypedef char *(*GenlistItemTextGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
+     ctypedef evas.c_evas.Evas_Object *(*GenlistItemIconGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
+     ctypedef evas.c_evas.Eina_Bool (*GenlistItemStateGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
+     ctypedef void (*GenlistItemDelFunc)(void *data, evas.c_evas.Evas_Object *obj)
+ 
+     ctypedef struct Elm_Genlist_Item_Class_Func:
+-        GenlistItemLabelGetFunc label_get
++        GenlistItemTextGetFunc text_get
+         GenlistItemIconGetFunc content_get
+         GenlistItemStateGetFunc state_get
+         GenlistItemDelFunc del_ "del"
+@@ -184,13 +184,13 @@ cdef extern from "Elementary.h":
+         char *item_style
+         Elm_Genlist_Item_Class_Func func
+ 
+-    ctypedef char *(*GengridItemLabelGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
++    ctypedef char *(*GengridItemTextGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
+     ctypedef evas.c_evas.Evas_Object *(*GengridItemIconGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
+     ctypedef evas.c_evas.Eina_Bool (*GengridItemStateGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
+     ctypedef void (*GengridItemDelFunc)(void *data, evas.c_evas.Evas_Object *obj)
+ 
+     ctypedef struct Elm_Gengrid_Item_Class_Func:
+-        GengridItemLabelGetFunc label_get
++        GengridItemTextGetFunc text_get
+         GengridItemIconGetFunc content_get
+         GengridItemStateGetFunc state_get
+         GengridItemDelFunc del_ "del"
+-- 
+1.7.8.rc4
+
diff --git a/meta-efl/recipes-devtools/python/python-elementary_svn.bb b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
index fd4ea6d..37a8ffa 100644
--- a/meta-efl/recipes-devtools/python/python-elementary_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
@@ -1,7 +1,9 @@
 require python-efl.inc
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "elementary python-evas"
 RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
+
+SRC_URI += " file://0001-python-elementary-temporary-fix-for-build-breakage.patch"
-- 
1.7.8



