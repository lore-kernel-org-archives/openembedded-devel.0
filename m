Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8L56-0005S8-N8
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 23:18:08 +0200
Received: by bwz19 with SMTP id 19so2739012bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 May 2009 14:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Z+WTgrKZbh4hJIxWG+Dtx90uDcCpv1e+EGgoUfF9i3g=;
	b=SMbKwOgp+u1cqGJDybyRQl7XR/5SvWBHZAxZkIZ8YyT5zM+U1Muosxelv8Hk718U4m
	EssB8ObjOuajQuPl9KKKqKi4jfC7jhdlAJUgx9gto5SpYVhNGKG9S8QahjSEISSZvkwL
	SnbMogutzF1Z+TMJSx5jWD4Qyj4xWSIiix6z8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=GYD1DNW/diEttcN1DvcfsEGp/pvGTIjqpmQgHdi6xBRIOhTavaoMI4DxutlT6ggL8y
	ooeJ//UcYeexfdSwd/dHyQ7CRmgdtngoumuSN1GKU1GkQLIe9QS+m/zK51zyiJsKR28t
	k5XQX2DYixypuCn2PsHUrjJxtSqdi/vFzlztg=
Received: by 10.103.240.15 with SMTP id s15mr3226536mur.102.1243199410977;
	Sun, 24 May 2009 14:10:10 -0700 (PDT)
Received: from localhost ([80.249.91.57])
	by mx.google.com with ESMTPS id 23sm1358273mum.35.2009.05.24.14.10.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 24 May 2009 14:10:10 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2009 00:10:07 +0300
Message-Id: <1243199407-28031-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
Subject: [PATCH] directfb: added new version 1.2.8
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
X-List-Received-Date: Sun, 24 May 2009 21:18:08 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 conf/checksums.ini                                 |    4 +++
 .../directfb/directfb-1.2.8/ts_lib_autotools.patch |   22 ++++++++++++++++
 recipes/directfb/directfb_1.2.8.bb                 |   27 ++++++++++++++++++++
 3 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100644 recipes/directfb/directfb-1.2.8/ts_lib_autotools.patch
 create mode 100644 recipes/directfb/directfb_1.2.8.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 964f728..47ba123 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -226,6 +226,10 @@ sha256=80ab8e34246a280bc380020cf331bcc0014cf816380cee3935ad455c108e661e
 md5=59ca16f600e96c8c104a485ff7c322c6
 sha256=80ab8e34246a280bc380020cf331bcc0014cf816380cee3935ad455c108e661e
 
+[http://directfb.org/downloads/Core/DirectFB-1.2.8.tar.gz]
+md5=ac13d21682aa368df4e177ae5b51ad2d
+sha256=cbf94eb10e9c305c81b24e298e55c7825df5ab9060d82443f7b9734f760f859d
+
 [http://www.directfb.org/downloads/Extras/DirectFB-examples-0.9.25.tar.gz]
 md5=835e850fddba8d8214d39ddd0646c3e8
 sha256=f83af60d53ab4319e5d71a4459cc10464ffd683efabacd6bd773bb807f8771fa
diff --git a/recipes/directfb/directfb-1.2.8/ts_lib_autotools.patch b/recipes/directfb/directfb-1.2.8/ts_lib_autotools.patch
new file mode 100644
index 0000000..7c34b56
--- /dev/null
+++ b/recipes/directfb/directfb-1.2.8/ts_lib_autotools.patch
@@ -0,0 +1,22 @@
+---
+ configure.in |    7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+Index: DirectFB-1.2.8/configure.in
+===================================================================
+--- DirectFB-1.2.8.orig/configure.in
++++ DirectFB-1.2.8/configure.in
+@@ -1288,8 +1288,11 @@ fi
+ 
+ enable_tslib=no
+ if test "$checkfor_tslib" = "yes"; then
+-  PKG_CHECK_MODULES([TSLIB], [tslib-0.0], [enable_tslib=yes], [enable_tslib=no,
+-    AC_MSG_WARN([*** no tslib -- tslib driver will not be built.])])
++  PKG_CHECK_MODULES([TSLIB], [tslib-1.0 >= 1.0.0], [enable_tslib=yes], [enable_tslib=no])
++  if test "$enable_tslib" = "no"; then
++    PKG_CHECK_MODULES([TSLIB], [tslib-0.0], [enable_tslib=yes], [enable_tslib=no,
++      AC_MSG_WARN([*** no tslib -- tslib driver will not be built.])])
++  fi
+ fi
+ 
+ enable_ucb1x00_ts=no
diff --git a/recipes/directfb/directfb_1.2.8.bb b/recipes/directfb/directfb_1.2.8.bb
new file mode 100644
index 0000000..bf0b95e
--- /dev/null
+++ b/recipes/directfb/directfb_1.2.8.bb
@@ -0,0 +1,27 @@
+require directfb.inc
+
+RV = "1.2-0"
+
+DEPENDS += "sysfsutils"
+
+SRC_URI = " \
+    http://directfb.org/downloads/Core/DirectFB-${PV}.tar.gz \
+    file://directfb-1.2.x-fix-pkgconfig-cflags.patch;patch=1 \
+    file://mkdfiff.patch;patch=1 \
+    file://dont-use-linux-config.patch;patch=1 \
+    file://ts_lib_autotools.patch;patch=1 \
+"
+
+EXTRA_OECONF = "\
+  --enable-freetype=yes \
+  --enable-zlib \
+  --with-gfxdrivers=none \
+  --disable-libmpeg3 \
+  --disable-sdl \
+  --disable-vnc \
+  --disable-x11 \
+"
+
+LDFLAGS_append = ""
+
+LEAD_SONAME = "libdirectfb-1.2.so.0"
-- 
1.6.3.1



