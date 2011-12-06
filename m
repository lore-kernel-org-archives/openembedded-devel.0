Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXruH-0004Wz-SJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:05:53 +0100
Received: by mail-ey0-f175.google.com with SMTP id c1so1374062eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fFAYK+FoHSfbuP0uLZFpgSU7CWxHmIDIRdifdrVepIs=;
	b=wKVtwf1TQHJES7K3uxEER+cJUsdifummPITaCZj2qVBAo6+AC4Uv2vuC32bd8GvloU
	G2dsh7haxz5E8c76cciwDXisVMaQPI9l3Y7T3gWbJ4JWBdlf3X1BxdqCmFvOBKSgU/80
	zyJPqihnisWryYZRRNHPyCUyCZ8xvdDv71PQs=
Received: by 10.213.29.147 with SMTP id q19mr2097896ebc.45.1323165544373;
	Tue, 06 Dec 2011 01:59:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 53sm8015423eef.2.2011.12.06.01.59.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:59:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:57:13 +0100
Message-Id: <b75436e2829cffd5e9fd0e49a363388f0c5430c6.1323165311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
References: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323165311.git.Martin.Jansa@gmail.com>
References: <cover.1323165311.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-efl 14/16] libeflvala: try to fix build
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
X-List-Received-Date: Tue, 06 Dec 2011 10:05:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...a-update-genlist-gengrid-callbacks-s-labe.patch |   97 ++++++++++++++++++++
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |    4 +-
 2 files changed, 100 insertions(+), 1 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/libeflvala/0001-BINDINS-vala-update-genlist-gengrid-callbacks-s-labe.patch

diff --git a/meta-efl/recipes-efl/efl/libeflvala/0001-BINDINS-vala-update-genlist-gengrid-callbacks-s-labe.patch b/meta-efl/recipes-efl/efl/libeflvala/0001-BINDINS-vala-update-genlist-gengrid-callbacks-s-labe.patch
new file mode 100644
index 0000000..90c0de6
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/libeflvala/0001-BINDINS-vala-update-genlist-gengrid-callbacks-s-labe.patch
@@ -0,0 +1,97 @@
+From 3e51778fdba36c81204b9eca81e67624c6401972 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 1 Dec 2011 17:28:38 +0100
+Subject: [PATCH] BINDINS/vala: update genlist/gengrid callbacks
+ s/label_get/text_get/g
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ BINDINGS/vala/examples/elementary/genlist.vala |    2 +-
+ BINDINGS/vala/vapi/elementary.vapi             |   16 ++++++++--------
+ 2 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/examples/elementary/genlist.vala b/examples/elementary/genlist.vala
+index b9fb42b..3a4a3b1 100644
+--- a/examples/elementary/genlist.vala
++++ b/examples/elementary/genlist.vala
+@@ -53,7 +53,7 @@ public class T.Genlist : T.Abstract
+     public static string getText( Elm.Object obj, string part )
+     {
+         int number = (int)obj;
+-        debug( "label_get: %p", obj );
++        debug( "text_get: %p", obj );
+         return "This is list item #%d".printf( number );
+     }
+     public static Elm.Object? getContent( Elm.Object obj, string part )
+diff --git a/vapi/elementary.vapi b/vapi/elementary.vapi
+index 8a6cc17..90b50f5c7 100644
+--- a/vapi/elementary.vapi
++++ b/vapi/elementary.vapi
+@@ -842,7 +842,7 @@ public class MenuItem
+     public Elm.Object object_get();
+     public void label_set( string label );
+     //public void del_cb_set( ... );
+-    public unowned string label_get();
++    public unowned string text_get();
+     public void icon_set( Elm.Object icon );
+     public void disabled_set( bool disabled );
+     public void* item_data_get();
+@@ -908,7 +908,7 @@ public class Slider : Elm.Object
+     public Slider( Elm.Object? parent );
+ 
+     public void label_set( string label );
+-    public unowned string label_get();
++    public unowned string text_get();
+     public void icon_set( Elm.Object icon );
+     public Elm.Object icon_get();
+     public void span_size_set( Evas.Coord size );
+@@ -931,8 +931,8 @@ public enum GenlistItemFlags
+     SUBITEMS,
+ }
+ 
+-[CCode (cname = "Elm_Gen_Item_Label_Get_Cb", has_target = false)]
+-public delegate string GenlistItemLabelGetFunc( Elm.Object obj, string part );
++[CCode (cname = "Elm_Gen_Item_Text_Get_Cb", has_target = false)]
++public delegate string GenlistItemTextGetFunc( Elm.Object obj, string part );
+ [CCode (cname = "Elm_Gen_Item_Content_Get_Cb", has_target = false)]
+ public delegate Elm.Object? GenlistItemContentGetFunc( Elm.Object obj, string part );
+ [CCode (cname = "Elm_Gen_Item_State_Get_Cb", has_target = false)]
+@@ -944,7 +944,7 @@ public delegate void GenlistItemDelFunc( Elm.Object obj );
+ [CCode (cname = "Elm_Gen_Item_Class_Func", destroy_function = "")]
+ public struct GenlistItemClassFunc
+ {
+-    public GenlistItemLabelGetFunc text_get;
++    public GenlistItemTextGetFunc text_get;
+     public GenlistItemContentGetFunc content_get;
+     public GenlistItemStateGetFunc state_get;
+     public GenlistItemDelFunc del;
+@@ -1027,7 +1027,7 @@ public class Check : Elm.Object
+     public Check( Elm.Object? parent );
+ 
+     public void label_set( string label );
+-    public unowned string label_get();
++    public unowned string text_get();
+     public void icon_set( Elm.Object icon );
+     public Elm.Object icon_get();
+     public void state_set( bool state );
+@@ -1044,7 +1044,7 @@ public class Radio : Elm.Object
+     public Radio( Elm.Object? parent );
+ 
+     public void label_set( string label );
+-    public unowned string label_get();
++    public unowned string text_get();
+     public void icon_set( Elm.Object icon );
+     public Elm.Object icon_get();
+     public void group_add( Elm.Object group );
+@@ -1256,7 +1256,7 @@ public class ListItem
+     public void selected_set( bool selected );
+     public void show();
+     public void* data_get();
+-    public unowned string label_get();
++    public unowned string text_get();
+     public void label_set( string label );
+     public Elm.Object icon_get();
+     public void icon_set( Elm.Object icon );
+-- 
+1.7.8.rc4
+
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index f70f953..e2450aa 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -12,7 +12,9 @@ SRCNAME = "vala"
 
 inherit e-base autotools pkgconfig vala
 
-SRC_URI = "${E_SVN}/trunk/BINDINGS;module=${SRCNAME};proto=http"
+SRC_URI = "${E_SVN}/trunk/BINDINGS;module=${SRCNAME};proto=http \
+  file://0001-BINDINS-vala-update-genlist-gengrid-callbacks-s-labe.patch \
+"
 S = "${WORKDIR}/${SRCNAME}"
 
 PACKAGES =+ "${PN}-examples"
-- 
1.7.8



