Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UWnYZ-0001ld-GO
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 14:52:08 +0200
Received: by mail-ea0-f174.google.com with SMTP id g14so1160259eak.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2013 05:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=gF+AnOmszDJAvWNssjbYF30i+YE8T3aTN0NOg/hkTVU=;
	b=rNCGxVK3awkfqNm0nKP5AVZAhuyhmI/xQ3GcERe+6S5tXVlTRrQ9HQ0tDJBM5JniGs
	xRHNrtEbD85rdVHY4aJ/kNrH/f9e9xpDakbXTX5RZslxy3UwOCRd6jf2gn+NVpPHMoPj
	VVCThlkGEzB8KATWpdiEOFt2VfbTJZKxQ2AGEKJClFZzmy5QNenzArNTcm9zD0bTOOGO
	MIO5zWU3ACIGD90oueefxkZqrF+L8DfEc8LQz/FbJe+u6J+i6HFRbT59xSYTidPhghTG
	H9XUj4pgb8g/jOwvU7GJ+Ikf9IdN3F3TGC6KeNCPW5mxaqDd7vMQE0oRdKeWIkac6h2b
	8NJQ==
X-Received: by 10.15.23.69 with SMTP id g45mr28608272eeu.25.1367238834779;
	Mon, 29 Apr 2013 05:33:54 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204]) by mx.google.com with ESMTPSA id
	r10sm14784232eez.10.2013.04.29.05.33.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 05:33:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Apr 2013 14:31:25 +0200
Message-Id: <1367238685-16855-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1367238685-16855-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367238685-16855-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome 5/5] libgnome: fix compile
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
X-List-Received-Date: Mon, 29 Apr 2013 12:52:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error message was:
| gnome-program.c: In function 'gnome_program_init_common':
| gnome-program.c:2067:2: error: implicit declaration of function 'g_atexit' [-Werror=implicit-function-declaration]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...nome-Makefile.am-allow-deprecated-symbols.patch |   35 ++++++++++++++++++++
 .../recipes-gnome/libgnome/libgnome_2.32.1.bb      |    3 +-
 2 files changed, 37 insertions(+), 1 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-allow-deprecated-symbols.patch

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-allow-deprecated-symbols.patch b/meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-allow-deprecated-symbols.patch
new file mode 100644
index 0000000..b658303
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-allow-deprecated-symbols.patch
@@ -0,0 +1,35 @@
+From ce1cd20fceea7dbcc5b983d94de771461eccf7cf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 29 Apr 2013 14:17:13 +0200
+Subject: [PATCH] libgnome/Makefile.am: allow deprecated symbols
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+fixes:
+
+| gnome-program.c: In function 'gnome_program_init_common':
+| gnome-program.c:2067:2: error: implicit declaration of function 'g_atexit' [-Werror=implicit-function-declaration]
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ libgnome/Makefile.am |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/libgnome/Makefile.am b/libgnome/Makefile.am
+index 9c8cd3e..aa01f6c 100644
+--- a/libgnome/Makefile.am
++++ b/libgnome/Makefile.am
+@@ -17,7 +17,6 @@ INCLUDES = \
+ 	-I$(srcdir)/..						\
+ 	$(WARN_CFLAGS)						\
+ 	$(LIBGNOME_CFLAGS)					\
+-	-DG_DISABLE_DEPRECATED					\
+ 	-DLIBGNOME_PREFIX=\""$(prefix)"\"			\
+ 	-DLIBGNOME_LIBDIR=\""$(libdir)"\"			\
+ 	-DLIBGNOME_DATADIR=\""$(datadir)"\"			\
+-- 
+1.7.6.5
+
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
index 0813973..325912f 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
@@ -5,10 +5,11 @@ SECTION = "x11/gnome/libs"
 
 inherit gnome lib_package
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[archive.md5sum] = "a4345e6087ae6195d65a4674ffdca559"
 SRC_URI[archive.sha256sum] = "b2c63916866485793b87398266dd7778548c1734923c272a94d84ee011b6f7a4"
+SRC_URI += "file://0001-libgnome-Makefile.am-allow-deprecated-symbols.patch"
 
 DEPENDS += "libcanberra gconf-native gnome-vfs libbonobo esound"
 
-- 
1.7.6.5



