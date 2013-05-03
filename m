Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UYDzN-00074D-Vo
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 13:17:23 +0200
Received: by mail-ea0-f178.google.com with SMTP id m14so712939eaj.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 03:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=TBnuj3NQ7NoYAYcnBkZVT/46JbaQ+GKrUUOAEe06eSY=;
	b=Fhv4nCk4vGW4DJkcg+OuAeEoYBocz9s8Fhfh+4Jw4CwbfajikQXtUbijUeBIs6HXgS
	+RbOqp+t0aMVuP1WbqFHarDSka7YFKBXQjVgibTnz30qdJI7/9U96y+eyIRrgKfb6Hmg
	vAvpWq8d6cbStEe5rKTHAP38XUBHD/5zDiTs8CqjQxL+lu56qblrikCk6EoA4zqKJejI
	IgDYeBX6KIH26Fr4uGq0L1w0OwjRcXTbe7orO8BOwpWCN8vMUFmUyxSdN6HUpJOnc2dc
	dFiNFhG5X37rjDRzQDTroRcjIRisxQSy5cxsFb7ENAtUip3/Hmwmqh2MUB9XoKXoOPyf
	P+nQ==
X-Received: by 10.14.127.5 with SMTP id c5mr12661007eei.45.1367578767352;
	Fri, 03 May 2013 03:59:27 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id n7sm15205167eeo.0.2013.05.03.03.59.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 03 May 2013 03:59:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 May 2013 12:56:58 +0200
Message-Id: <1367578619-19890-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1367578619-19890-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367578619-19890-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/master 2/3] orbit2: update to latest stable / fix build with glib 2.36
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
X-List-Received-Date: Fri, 03 May 2013 11:17:31 -0000
X-List-Received-Date: Fri, 03 May 2013 11:17:31 -0000
X-List-Received-Date: Fri, 03 May 2013 11:17:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

license change of FSF address only

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-src-Makefile.am-fix-build-with-glib-2.36.patch |   34 ++++++++++++++++++++
 .../configure-lossage.patch                        |    0
 .../{orbit2-2.14.17 => orbit2}/pkgconfig-fix.patch |    0
 .../{orbit2_2.14.17.bb => orbit2_2.14.19.bb}       |   16 +++++----
 4 files changed, 43 insertions(+), 7 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2/0001-linc2-src-Makefile.am-fix-build-with-glib-2.36.patch
 rename meta-gnome/recipes-gnome/orbit2/{orbit2-2.14.17 => orbit2}/configure-lossage.patch (100%)
 rename meta-gnome/recipes-gnome/orbit2/{orbit2-2.14.17 => orbit2}/pkgconfig-fix.patch (100%)
 rename meta-gnome/recipes-gnome/orbit2/{orbit2_2.14.17.bb => orbit2_2.14.19.bb} (68%)

diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2/0001-linc2-src-Makefile.am-fix-build-with-glib-2.36.patch b/meta-gnome/recipes-gnome/orbit2/orbit2/0001-linc2-src-Makefile.am-fix-build-with-glib-2.36.patch
new file mode 100644
index 0000000..daf7464
--- /dev/null
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2/0001-linc2-src-Makefile.am-fix-build-with-glib-2.36.patch
@@ -0,0 +1,34 @@
+From 10bd8094e1d94e5c737791c7f4b6b844f535c120 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 3 May 2013 10:00:16 +0200
+Subject: [PATCH] linc2/src/Makefile.am: fix build with glib 2.36
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [1]
+
+[1] https://bugzilla.gnome.org/show_bug.cgi?id=696900
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ linc2/src/Makefile.am |    3 +--
+ 1 files changed, 1 insertions(+), 2 deletions(-)
+
+diff --git a/linc2/src/Makefile.am b/linc2/src/Makefile.am
+index 357a2dd..ba0e347 100644
+--- a/linc2/src/Makefile.am
++++ b/linc2/src/Makefile.am
+@@ -12,8 +12,7 @@ INCLUDES =                         \
+ 	-I$(top_builddir)/linc2/include  \
+ 	-I$(top_srcdir)/linc2/include    \
+ 	$(LINC_CFLAGS)             \
+-	$(WARN_CFLAGS)             \
+-	-DG_DISABLE_DEPRECATED
++	$(WARN_CFLAGS)
+ 
+ if OS_WIN32
+ else
+-- 
+1.7.6.5
+
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2-2.14.17/configure-lossage.patch b/meta-gnome/recipes-gnome/orbit2/orbit2/configure-lossage.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/orbit2/orbit2-2.14.17/configure-lossage.patch
rename to meta-gnome/recipes-gnome/orbit2/orbit2/configure-lossage.patch
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2-2.14.17/pkgconfig-fix.patch b/meta-gnome/recipes-gnome/orbit2/orbit2/pkgconfig-fix.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/orbit2/orbit2-2.14.17/pkgconfig-fix.patch
rename to meta-gnome/recipes-gnome/orbit2/orbit2/pkgconfig-fix.patch
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
similarity index 68%
rename from meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
rename to meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
index 3b6342b..74b6c12 100644
--- a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
@@ -1,16 +1,18 @@
 DESCRIPTION = "CORBA ORB"
 SECTION = "x11/gnome/libs"
 LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SRC_NAME = "ORBit2"
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-SRC_URI = "${GNOME_MIRROR}/${SRC_NAME}/${SHRT_VER}/${SRC_NAME}-${PV}.tar.bz2 \
-           file://configure-lossage.patch \
-           file://pkgconfig-fix.patch"
-SRC_URI[md5sum] = "10bfb957fa4a8935a0b4afaee7d71df7"
-SRC_URI[sha256sum] = "62bfce3f678f9347a19c766944e8aef7b89bc32b25ac23eb3e4c25929ce8974c"
+SRC_URI = " \
+    ${GNOME_MIRROR}/${SRC_NAME}/${SHRT_VER}/${SRC_NAME}-${PV}.tar.bz2 \
+    file://configure-lossage.patch \
+    file://pkgconfig-fix.patch \
+    file://0001-linc2-src-Makefile.am-fix-build-with-glib-2.36.patch \
+"
+SRC_URI[md5sum] = "7082d317a9573ab338302243082d10d1"
+SRC_URI[sha256sum] = "55c900a905482992730f575f3eef34d50bda717c197c97c08fa5a6eafd857550"
 
-PR = "r5"
 BBCLASSEXTEND = "native"
 
 IDL_COMPILER_DEPENDS = "orbit2-native"
-- 
1.7.6.5



