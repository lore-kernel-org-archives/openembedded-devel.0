Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9168873F5B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 05:34:48 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so143453278ied.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 22:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IS3+x0/rbnLSvNzabpZ6LVC4Z4uA9DI3TxaxHS7LvSU=;
	b=1FJoShkoPBiYGgJiuptet/GxFKH0/q+BHh3Tdj6N1aPr8nnV6H4CqWFWDiMQSM9Mxn
	gUJ7HRBVnWetn2fqtuJvmdqF6sFh7ieyFZVjZ4YdRb3HeOSj5iJl2zg1rGHRBzFFHhD6
	r3rgbUfgbzUFFaPOdd3cVrLkKULWgKjOKmc4eETDDn8eu189jH4cH1499c5pZ3BrWiOx
	oSjPkAWbpeBXiqpaKQX6IRw5Jb2KJbT6QBl1tjm1SSTAOHLTy/S6muHbec2PNbhQmxg5
	V80tekETE5B+qqr0B9LJAlHHCadWFmnrnVYZXmaY+BYtlW9Q5yDAJ0otOhOPc5XznU+w
	Xr4A==
X-Received: by 10.43.116.196 with SMTP id fj4mr1211884icc.38.1431408889607;
	Mon, 11 May 2015 22:34:49 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id r4sm627130igh.9.2015.05.11.22.34.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 May 2015 22:34:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2015 22:34:42 -0700
Message-Id: <1431408883-7222-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431408883-7222-1-git-send-email-raj.khem@gmail.com>
References: <1431408883-7222-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/2] libbonoboui: Fix build with gcc5
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
X-List-Received-Date: Tue, 12 May 2015 05:34:48 -0000

This is required to remove non-existing include paths which
gcc-5 detects and is fussy about

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/bonobo/files/gcc5.patch      | 12 ++++++++++++
 meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb |  3 +++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/bonobo/files/gcc5.patch

diff --git a/meta-gnome/recipes-gnome/bonobo/files/gcc5.patch b/meta-gnome/recipes-gnome/bonobo/files/gcc5.patch
new file mode 100644
index 0000000..f7528ad
--- /dev/null
+++ b/meta-gnome/recipes-gnome/bonobo/files/gcc5.patch
@@ -0,0 +1,12 @@
+Index: libbonoboui-2.24.5/tools/browser/Makefile.am
+===================================================================
+--- libbonoboui-2.24.5.orig/tools/browser/Makefile.am
++++ libbonoboui-2.24.5/tools/browser/Makefile.am
+@@ -2,7 +2,6 @@ INCLUDES =	\
+ 	-DBONOBO_BROWSER_DATADIR=\""$(datadir)"\"	\
+         -DBONOBO_SUPPORT_LOCALEDIR=\""$(datadir)/locale"\"        \
+ 	-I$(srcdir) -I$(top_srcdir) 			\
+-	-I$(top_srcdir)/bonobo-browser			\
+ 	$(BONOBOUI_CFLAGS)				\
+ 	$(WARN_CFLAGS)
+ 
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
index 6c2d67a..f3e37a9 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
@@ -4,6 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 inherit gnomebase pkgconfig gtk-doc
+
+SRC_URI += "file://gcc5.patch"
+
 SRC_URI[archive.md5sum] = "853be8e28aaa4ce48ba60be7d9046bf4"
 SRC_URI[archive.sha256sum] = "fab5f2ac6c842d949861c07cb520afe5bee3dce55805151ce9cd01be0ec46fcd"
 
-- 
2.1.4


