Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OyrxL-0003K9-3O
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 21:59:50 +0200
Received: by ewy7 with SMTP id 7so588265ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 12:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=klpttHhB0lqdlL6OPTv9TjrdhJhRVY/83KOhBuN7eFo=;
	b=qS0L452YjZO5K3V1gaHooNpHW8GUZ3hJWEE1Q4P2ugxPWwV/jvOnHKoeLjSDB5L3dw
	C//JPmmVtskabRd0xXhbn3yXEf0w0NrfEg8sScpdHxDyXZIMfcw39fpbSzmkAPUWYTzQ
	Zy2oq7swdZsd2REahn1SGUYnHbgJ56IpOcYnc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=a0kehHV0hoBWImCYw6pbUD9EX4tEgs3G/A8r+MuBp/3nq/sUCaUuGPD3BY9AtuBKVL
	x/UFcdX4cLb1qH0w90ZYVSC32eqrv8Tt+3fiEvpiORw8RBFqmUMOi2rj3qzIkrXXJ46k
	sLXyxbXHrIy/iUGwgfg1lr2pb/6hRSduaiKms=
Received: by 10.213.9.76 with SMTP id k12mr7033390ebk.95.1285271974225;
	Thu, 23 Sep 2010 12:59:34 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id u9sm1760592eeh.17.2010.09.23.12.59.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Sep 2010 12:59:33 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Sep 2010 21:59:29 +0200
Message-Id: <1285271969-17472-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] directfb-1.1.1: remove
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
X-List-Received-Date: Thu, 23 Sep 2010 19:59:50 -0000

code is from 2008, not pinned
src tarball is not available any more
(see http://www.directfb.org/downloads/Old/)
lastest version we have is 1.4.2

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

We might consider also removing 1.0.0, 1.1.0 and the lower 1.2.x versions

 .../directfb-1.1.1/fix-pkgconfig-cflags.patch      |   47 --------------------
 recipes/directfb/directfb_1.1.1.bb                 |   30 ------------
 2 files changed, 0 insertions(+), 77 deletions(-)
 delete mode 100644 recipes/directfb/directfb-1.1.1/fix-pkgconfig-cflags.patch
 delete mode 100644 recipes/directfb/directfb_1.1.1.bb

diff --git a/recipes/directfb/directfb-1.1.1/fix-pkgconfig-cflags.patch b/recipes/directfb/directfb-1.1.1/fix-pkgconfig-cflags.patch
deleted file mode 100644
index 745c561..0000000
--- a/recipes/directfb/directfb-1.1.1/fix-pkgconfig-cflags.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Index: DirectFB-1.1.1/directfb-internal.pc.in
-===================================================================
---- DirectFB-1.1.1.orig/directfb-internal.pc.in	2007-08-07 21:43:00.000000000 +0200
-+++ DirectFB-1.1.1/directfb-internal.pc.in	2008-07-17 21:00:47.424654304 +0200
-@@ -2,10 +2,10 @@
- exec_prefix=@exec_prefix@
- moduledir=@MODULEDIR@
- moduledirname=@MODULEDIRNAME@
--includedir=@INTERNALINCLUDEDIR@
-+includedir=@includedir@
- 
- Name: DirectFB-Internal
- Description: Third party module support package for DirectFB.
- Version: @VERSION@
- Requires: directfb = @VERSION@
--Cflags: @DFB_INTERNAL_CFLAGS@ -I@INTERNALINCLUDEDIR@
-+Cflags: @DFB_INTERNAL_CFLAGS@ -I${includedir}/directfb -I${includedir}
-Index: DirectFB-1.1.1/directfb.pc.in
-===================================================================
---- DirectFB-1.1.1.orig/directfb.pc.in	2007-12-15 16:23:16.000000000 +0100
-+++ DirectFB-1.1.1/directfb.pc.in	2008-07-17 20:59:58.044985193 +0200
-@@ -9,4 +9,4 @@
- Requires: fusion direct
- Libs: -L${libdir} -ldirectfb @THREADLIB@ @OSX_LIBS@
- Libs.private: -L${libdir} @DYNLIB@ @ZLIB_LIBS@
--Cflags: @THREADFLAGS@ -I@INCLUDEDIR@
-+Cflags: @THREADFLAGS@ -I${includedir}/directfb
-Index: DirectFB-1.1.1/lib/fusion/fusion.pc.in
-===================================================================
---- DirectFB-1.1.1.orig/lib/fusion/fusion.pc.in	2007-08-07 21:43:00.000000000 +0200
-+++ DirectFB-1.1.1/lib/fusion/fusion.pc.in	2008-07-17 20:58:07.051338866 +0200
-@@ -8,4 +8,4 @@
- Version: @VERSION@
- Requires: direct
- Libs: -L${libdir} -lfusion
--Cflags: -I@INCLUDEDIR@
-+Cflags: -I${includedir}/directfb -I${includedir}
-Index: DirectFB-1.1.1/lib/voodoo/voodoo.pc.in
-===================================================================
---- DirectFB-1.1.1.orig/lib/voodoo/voodoo.pc.in	2007-08-07 21:43:00.000000000 +0200
-+++ DirectFB-1.1.1/lib/voodoo/voodoo.pc.in	2008-07-17 20:58:07.054671842 +0200
-@@ -8,4 +8,4 @@
- Version: @VERSION@
- Requires: direct
- Libs: -L${libdir} -lvoodoo
--Cflags: -I@INCLUDEDIR@
-+Cflags: -I${includedir}/directfb -I${includedir}
diff --git a/recipes/directfb/directfb_1.1.1.bb b/recipes/directfb/directfb_1.1.1.bb
deleted file mode 100644
index 573e319..0000000
--- a/recipes/directfb/directfb_1.1.1.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-require directfb.inc
-
-RV = "1.1-0"
-PR = "r0"
-
-DEPENDS += "sysfsutils"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = " \
-    http://www.directfb.org/downloads/Old/DirectFB-${PV}.tar.gz \
-    file://fix-pkgconfig-cflags.patch \
-    file://fix-font-missing-char.patch \
-    file://mkdfiff.patch \
-    file://dont-use-linux-config.patch \
-    file://ts_lib_autotools.patch \
-"
-
-EXTRA_OECONF = "\
-  --enable-freetype=yes \
-  --enable-zlib \
-  --with-gfxdrivers=none \
-  --disable-libmpeg3 \
-  --disable-sdl \
-  --disable-vnc \
-  --disable-x11 \
-"
-
-SRC_URI[md5sum] = "c75255049ca8d5c69afe4db58f603028"
-SRC_URI[sha256sum] = "f12ec5f0864d85268a8d67e4919cb7f3d7f0e06ed6cc278c952f6c342673d931"
-- 
1.6.4.2



