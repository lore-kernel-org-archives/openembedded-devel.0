Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 24683769A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 17:29:42 +0000 (UTC)
Received: by wijp11 with SMTP id p11so20478864wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 10:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=8yqgmQeh/UgZdQYmWy2sNymxN3IgD8knvxaZfGrQtoU=;
	b=fsXt4xwkC53iyOZl2N4V4/3YZwYpRhGbi6Fg5CS0KLvugw8zCrBgwfUrd1R1ElkN64
	4dxsEWYdT4s74vtZMTjyxzo1g5LkQnKdhIchNK5GYWI9oeKjNFdvTGoiUk3qQqFuGkRO
	O0/CAga2WpxvTRWxKqDmdNQJgdjHqbd246Qi0rgA62XXNxAlbQg2lGlOT9FXU6rCpbUr
	qjqrZxkVrzW0GRUdlddurFx7oeBa6Nl7wgk4HxzngiWtji7Ww5WTBuSAHotIYxDqM9qZ
	1pS0pz+vlcgkZg2z93JFYo47r3/HL9foQKxxTHTERV6je8uoVDqKxXX2bvTkJE2OoYQt
	ZnvA==
X-Received: by 10.180.11.1 with SMTP id m1mr6337369wib.69.1445016582638;
	Fri, 16 Oct 2015 10:29:42 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	qq4sm23628014wjc.14.2015.10.16.10.29.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 16 Oct 2015 10:29:41 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <EF7FAD29-F71D-47BE-A5CD-4468EAB38461@gmail.com>
Date: Fri, 16 Oct 2015 19:29:38 +0200
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-java][PATCH 3/5] openjdk-6: remove
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
X-List-Received-Date: Fri, 16 Oct 2015 17:29:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Since OpenJDK-6 is not maintained anymore, it's more reasonable to move =
to OpenJDK-8 instead
of sticking at unmaintained, upstream not supported VM version.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../build-hacks-native.patch                       |   15 -
 .../disable-library-checks.patch                   |  141 ---
 .../icedtea-ecj-disable-compilation.patch          |  513 ---------
 .../icedtea-ecj-fix-freetype.patch                 |   13 -
 .../icedtea-ecj-fix-zlib.patch                     |   61 --
 .../icedtea-fix-jar-path.patch                     |   13 -
 .../icedtea-hotspot-dont-return-booleans.patch     |   12 -
 .../icedtea-hotspot-make-arch-sane-for-x86.patch   | 1130 =
--------------------
 .../icedtea-jdk-avoid-cdef-collision.patch         |  203 ----
 .../icedtea-jdk-sane-x86-arch.patch                |  216 ----
 .../icedtea-native-vsyscall.patch                  |   43 -
 ...njdk-remove-currency-data-generation-expi.patch |   25 -
 .../icedtea-sane-x86-arch-name.patch               |   38 -
 .../icedtea-unbreak-float.patch                    |   18 -
 recipes-core/icedtea/icedtea6-native.inc           |  215 ----
 recipes-core/icedtea/icedtea6-native_1.8.11.bb     |   68 --
 .../openjdk/openjdk-6-6b24/build-hacks.patch       |   79 --
 .../openjdk-6-6b24/cacao-arm-ucontext.patch        |   24 -
 .../openjdk/openjdk-6-6b24/cacao-libtoolize.patch  |   12 -
 .../openjdk-6-6b24/cacao-loadavg-makefile.patch    |   13 -
 .../openjdk/openjdk-6-6b24/cacao-loadavg.patch     |   27 -
 .../openjdk-6-6b24/fix_hotspot_crosscompile.patch  |   51 -
 .../openjdk-6-6b24/icedtea-crosscompile-fix.patch  |  270 -----
 .../openjdk-6-6b24/icedtea-fix-xrender.patch       |   13 -
 .../openjdk-6-6b24/icedtea-hostbuildcc.patch       |   12 -
 .../icedtea-hotspot-dlvsym-uclibc.patch            |   16 -
 .../icedtea-hotspot-glibc-version.patch            |   23 -
 .../openjdk-6-6b24/icedtea-hotspot-isfinte.patch   |   15 -
 .../openjdk-6-6b24/icedtea-hotspot-isnanf.patch    |   21 -
 .../openjdk-6-6b24/icedtea-hotspot-loadavg.patch   |   28 -
 .../openjdk-6-6b24/icedtea-jdk-iconv-uclibc.patch  |   39 -
 .../icedtea-jdk-powerpc-atomic64.patch             |   65 --
 .../icedtea-jdk-remove-unused-backtrace.patch      |   41 -
 .../icedtea-jdk-rmi-crosscompile.patch             |   13 -
 .../icedtea-jdk-sizers-crosscompile-hack.patch     |   61 --
 .../openjdk-6-6b24/icedtea-jdk-unpack-uclibc.patch |   12 -
 .../openjdk-6-6b24/icedtea-launcher-stdc++.patch   |   13 -
 .../openjdk-6-6b24/icedtea-libnet-renaming.patch   |  148 ---
 .../openjdk-6-6b24/icedtea-remove_werror.patch     |   14 -
 .../icedtea-shark-arm-linux-cpu-detection.patch    |  113 --
 .../openjdk-6-6b24/icedtea-unbreak-float.patch     |   18 -
 .../openjdk-6-6b24/icedtea-zero-hotspotfix.patch   |   41 -
 recipes-core/openjdk/openjdk-6-6b24/jvm.cfg        |   43 -
 .../openjdk/openjdk-6-6b27/build-hacks.patch       |   86 --
 .../openjdk-6-6b27/fix_hotspot_crosscompile.patch  |   51 -
 .../openjdk-6-6b27/icedtea-crosscompile-fix.patch  |  469 --------
 .../openjdk-6-6b27/icedtea-disable-sane-alsa.patch |   34 -
 .../openjdk/openjdk-6-6b32/build-hacks.patch       |  119 ---
 .../openjdk-6-6b32/icedtea-crosscompile-fix.patch  |  280 -----
 .../openjdk-6-6b32/icedtea-disable-sane-alsa.patch |   12 -
 .../openjdk-6-6b32/icedtea-hostbuildcc.patch       |   12 -
 .../icedtea-jdk-rmi-crosscompile.patch             |   13 -
 ...njdk-remove-currency-data-generation-expi.patch |   25 -
 .../openjdk-6-6b32/icedtea-remove_werror.patch     |   16 -
 .../openjdk-6-6b32/icedtea-zero-hotspotfix.patch   |   41 -
 recipes-core/openjdk/openjdk-6-common.inc          |  396 -------
 recipes-core/openjdk/openjdk-6-release-6b24.inc    |  149 ---
 recipes-core/openjdk/openjdk-6-release-6b27.inc    |   31 -
 recipes-core/openjdk/openjdk-6-release-6b32.inc    |   36 -
 recipes-core/openjdk/openjdk-6/build-hacks.patch   |   31 -
 .../openjdk-6/cacao-disable-stackbase-check.patch  |   12 -
 .../openjdk/openjdk-6/cacao-libtoolize.patch       |   18 -
 .../openjdk/openjdk-6/cacao-vfp-compat.patch       |   37 -
 recipes-core/openjdk/openjdk-6/fix-llvm-libs.patch |   13 -
 .../openjdk-6/fix_hotspot_crosscompile.patch       |   94 --
 .../openjdk-6/icedtea-crosscompile-fix.patch       |  229 ----
 .../openjdk-6/icedtea-fix-jar-command.patch        |   13 -
 .../openjdk/openjdk-6/icedtea-hasgettransfer.patch |  131 ---
 .../openjdk/openjdk-6/icedtea-hostbuildcc.patch    |   12 -
 .../openjdk-6/icedtea-hotspot-glibc-version.patch  |   23 -
 .../openjdk-6/icedtea-hotspot-isfinte.patch        |   15 -
 .../openjdk/openjdk-6/icedtea-hotspot-isnanf.patch |   21 -
 .../openjdk-6/icedtea-hotspot-loadavg.patch        |   28 -
 .../openjdk-6/icedtea-jdk-RTLD_NOLOAD.patch        |   13 -
 .../openjdk-6/icedtea-jdk-iconv-uclibc.patch       |   39 -
 .../icedtea-jdk-remove-unused-backtrace.patch      |   41 -
 .../openjdk-6/icedtea-jdk-unpack-uclibc.patch      |   12 -
 .../openjdk-6/icedtea-launcher-stdc++.patch        |   13 -
 .../openjdk-6/icedtea-libnet-renaming.patch        |  148 ---
 .../openjdk/openjdk-6/icedtea-llvm_headers.patch   |   29 -
 .../openjdk/openjdk-6/icedtea-remove_werror.patch  |   14 -
 .../openjdk/openjdk-6/icedtea-unbreak-float.patch  |   18 -
 recipes-core/openjdk/openjdk-6/jvm.cfg             |   41 -
 .../openjdk/openjdk-6/mkbc_returncode.patch        |   11 -
 .../openjdk-6/shark-arm-linux-cpu-detection.patch  |  113 --
 .../openjdk/openjdk-6/shark-build-openjdkdir.patch |   13 -
 .../openjdk/openjdk-6/zero-cmpswap-long.patch      |   20 -
 recipes-core/openjdk/openjdk-6_6b24-1.11.9.bb      |   10 -
 recipes-core/openjdk/openjdk-6_6b24_hg.bb          |   12 -
 recipes-core/openjdk/openjdk-6_6b27-1.12.8.bb      |    6 -
 recipes-core/openjdk/openjdk-6_6b32-1.13.4.bb      |    6 -
 recipes-images/images/java-test-image.bb           |    1 -
 92 files changed, 6956 deletions(-)
 delete mode 100644 =
recipes-core/icedtea/icedtea6-native-1.8.11/build-hacks-native.patch
 delete mode 100644 =
recipes-core/icedtea/icedtea6-native-1.8.11/disable-library-checks.patch
 delete mode 100644 =
recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-ecj-disable-compilatio=
n.patch
 delete mode 100644 =
recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-ecj-fix-freetype.patch=

 delete mode 100644 =
recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-ecj-fix-zlib.patch
 delete mode 100644 =
recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-fix-jar-path.patch
 delete mode 100644 =
recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-hotspot-dont-return-bo=
oleans.patch
 delete mode 100644 =
recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-hotspot-make-arch-sane=
-for-x86.patch
 delete mode 100644 =
recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-jdk-avoid-cdef-collisi=
on.patch
 delete mode 100644 =
recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-jdk-sane-x86-arch.patc=
h
 delete mode 100644 =
recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-native-vsyscall.patch
 delete mode 100644 =
recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-openjdk-remove-currenc=
y-data-generation-expi.patch
 delete mode 100644 =
recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-sane-x86-arch-name.pat=
ch
 delete mode 100644 =
recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-unbreak-float.patch
 delete mode 100644 recipes-core/icedtea/icedtea6-native.inc
 delete mode 100644 recipes-core/icedtea/icedtea6-native_1.8.11.bb
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/build-hacks.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/cacao-arm-ucontext.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/cacao-libtoolize.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/cacao-loadavg-makefile.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/cacao-loadavg.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/fix_hotspot_crosscompile.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-crosscompile-fix.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-fix-xrender.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-hostbuildcc.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-dlvsym-uclibc.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-glibc-version.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-isfinte.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-isnanf.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-loadavg.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-iconv-uclibc.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-powerpc-atomic64.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-remove-unused-backtrace.pa=
tch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-rmi-crosscompile.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-sizers-crosscompile-hack.p=
atch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-unpack-uclibc.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-libnet-renaming.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-remove_werror.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-shark-arm-linux-cpu-detection.=
patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-unbreak-float.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch
 delete mode 100644 recipes-core/openjdk/openjdk-6-6b24/jvm.cfg
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b27/build-hacks.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b27/fix_hotspot_crosscompile.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b27/icedtea-crosscompile-fix.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b27/icedtea-disable-sane-alsa.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b32/build-hacks.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b32/icedtea-crosscompile-fix.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b32/icedtea-disable-sane-alsa.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b32/icedtea-hostbuildcc.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b32/icedtea-jdk-rmi-crosscompile.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b32/icedtea-openjdk-remove-currency-data-g=
eneration-expi.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b32/icedtea-remove_werror.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6-6b32/icedtea-zero-hotspotfix.patch
 delete mode 100644 recipes-core/openjdk/openjdk-6-common.inc
 delete mode 100644 recipes-core/openjdk/openjdk-6-release-6b24.inc
 delete mode 100644 recipes-core/openjdk/openjdk-6-release-6b27.inc
 delete mode 100644 recipes-core/openjdk/openjdk-6-release-6b32.inc
 delete mode 100644 recipes-core/openjdk/openjdk-6/build-hacks.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/cacao-disable-stackbase-check.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/cacao-libtoolize.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/cacao-vfp-compat.patch
 delete mode 100644 recipes-core/openjdk/openjdk-6/fix-llvm-libs.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/fix_hotspot_crosscompile.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-crosscompile-fix.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-fix-jar-command.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-hasgettransfer.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-hostbuildcc.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-hotspot-glibc-version.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-hotspot-isfinte.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-hotspot-isnanf.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-hotspot-loadavg.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-jdk-RTLD_NOLOAD.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-jdk-iconv-uclibc.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-jdk-remove-unused-backtrace.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-jdk-unpack-uclibc.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-launcher-stdc++.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-libnet-renaming.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-llvm_headers.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-remove_werror.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/icedtea-unbreak-float.patch
 delete mode 100644 recipes-core/openjdk/openjdk-6/jvm.cfg
 delete mode 100644 recipes-core/openjdk/openjdk-6/mkbc_returncode.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/shark-arm-linux-cpu-detection.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/shark-build-openjdkdir.patch
 delete mode 100644 =
recipes-core/openjdk/openjdk-6/zero-cmpswap-long.patch
 delete mode 100644 recipes-core/openjdk/openjdk-6_6b24-1.11.9.bb
 delete mode 100644 recipes-core/openjdk/openjdk-6_6b24_hg.bb
 delete mode 100644 recipes-core/openjdk/openjdk-6_6b27-1.12.8.bb
 delete mode 100644 recipes-core/openjdk/openjdk-6_6b32-1.13.4.bb

diff --git =
a/recipes-core/icedtea/icedtea6-native-1.8.11/build-hacks-native.patch =
b/recipes-core/icedtea/icedtea6-native-1.8.11/build-hacks-native.patch
deleted file mode 100644
index 9432d03..0000000
--- =
a/recipes-core/icedtea/icedtea6-native-1.8.11/build-hacks-native.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: icedtea6-1.6.1/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.6.1.orig/Makefile.am	2009-12-24 11:38:06.582572265 =
+0100
-+++ icedtea6-1.6.1/Makefile.am	2009-12-24 11:57:27.159578486 +0100
-@@ -265,6 +265,10 @@
- 	FT2_LIB=3D"$(FREETYPE2_LIBS)" \
- 	ALT_PARALLEL_COMPILE_JOBS=3D"$(PARALLEL_JOBS)" \
- 	HOTSPOT_BUILD_JOBS=3D"$(PARALLEL_JOBS)" \
-+        OE_CFLAGS=3D"$(OE_CFLAGS)" \
-+        OE_CPPFLAGS=3D"$(OE_CPPFLAGS)" \
-+        OE_CXXFLAGS=3D"$(OE_CXXFLAGS)" \
-+        OE_LDFLAGS=3D"$(OE_LDFLAGS)" \
- 	JAVAC=3D"" \
- 	RHINO_JAR=3D"$(RHINO_JAR)" \
- 	JAR_KNOWS_ATFILE=3D"$(JAR_KNOWS_ATFILE)" \
diff --git =
a/recipes-core/icedtea/icedtea6-native-1.8.11/disable-library-checks.patch=
 =
b/recipes-core/icedtea/icedtea6-native-1.8.11/disable-library-checks.patch=

deleted file mode 100644
index 23b8bed..0000000
--- =
a/recipes-core/icedtea/icedtea6-native-1.8.11/disable-library-checks.patch=

+++ /dev/null
@@ -1,141 +0,0 @@
-Index: icedtea6-1.7/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.7.orig/configure.ac	2010-01-26 04:52:18.000000000 =
+0100
-+++ icedtea6-1.7/configure.ac	2010-02-08 12:05:51.354556052 +0100
-@@ -205,9 +205,9 @@
- fi
-=20
- dnl pkgconfig cannot be used to find these headers and libraries.
--AC_CHECK_HEADERS([cups/cups.h cups/ppd.h],[]
--	,[AC_MSG_ERROR("CUPS headers were not found -
--	try installing cups-devel.")])
-+#AC_CHECK_HEADERS([cups/cups.h cups/ppd.h],[]
-+#	,[AC_MSG_ERROR("CUPS headers were not found -
-+#	try installing cups-devel.")])
- AC_CHECK_HEADERS([X11/X.h],[]
- 	,[AC_MSG_ERROR("xorg headers were not found -
- 	try installing xorg-x11-proto-devel.")])
-@@ -239,12 +239,12 @@
- AC_SUBST(XT_LIBS)
-=20
- dnl Check for libXp headers and libraries.
--PKG_CHECK_MODULES(XP, xp,[XP_FOUND=3Dyes],[XP_FOUND=3Dno])
--if test "x${XP_FOUND}" =3D xno
--then
--  AC_MSG_ERROR([Could not find Xp - \
--  Try installing libXp-devel.])
--fi
-+#PKG_CHECK_MODULES(XP, xp,[XP_FOUND=3Dyes],[XP_FOUND=3Dno])
-+#if test "x${XP_FOUND}" =3D xno
-+#then
-+#  AC_MSG_ERROR([Could not find Xp - \
-+#  Try installing libXp-devel.])
-+#fi
- AC_SUBST(XP_CFLAGS)
- AC_SUBST(XP_LIBS)
-=20
-@@ -258,16 +258,16 @@
- AC_SUBST(X11_CFLAGS)
- AC_SUBST(X11_LIBS)
-=20
--dnl Check for libXinerama headers and libraries.
--PKG_CHECK_MODULES(XINERAMA, xinerama,[XINERAMA_FOUND=3Dyes]
--	,[XINERAMA_FOUND=3Dno])
--if test "x${XINERAMA_FOUND}" =3D xno
--then
--  AC_MSG_ERROR([Could not find Xinerama - \
--  Try installing libXinerama-devel.])
--fi
--AC_SUBST(XINERAMA_CFLAGS)
--AC_SUBST(XINERAMA_LIBS)
-+#dnl Check for libXinerama headers and libraries.
-+#PKG_CHECK_MODULES(XINERAMA, xinerama,[XINERAMA_FOUND=3Dyes]
-+#	,[XINERAMA_FOUND=3Dno])
-+#if test "x${XINERAMA_FOUND}" =3D xno
-+#then
-+#  AC_MSG_ERROR([Could not find Xinerama - \
-+#  Try installing libXinerama-devel.])
-+#fi
-+#AC_SUBST(XINERAMA_CFLAGS)
-+#AC_SUBST(XINERAMA_LIBS)
-=20
- if test "x${ENABLE_XRENDER}" =3D "xyes"
- then
-@@ -341,26 +341,26 @@
-   AC_CONFIG_FILES([tapset/jstack.stp])
- fi
-=20
--dnl Check for libpng headers and libraries.
--PKG_CHECK_MODULES(LIBPNG, libpng,[LIBPNG_FOUND=3Dyes]
--	,[LIBPNG_FOUND=3Dno])
--if test "x${LIBPNG_FOUND}" =3D xno
--then
--  AC_MSG_ERROR([Could not find libpng - \
--  Try installing libpng-devel.])
--fi
--AC_SUBST(LIBPNG_CFLAGS)
--AC_SUBST(LIBPNG_LIBS)
--
--dnl Check for libXtst headers and libraries.
--PKG_CHECK_MODULES(XTST, xtst,[XTST_FOUND=3Dyes],[XTST_FOUND=3Dno])
--if test "x${XTST_FOUND}" =3D xno
--then
--  AC_MSG_ERROR([Could not find Xtst - \
--  Try installing libXtst-devel.])
--fi
--AC_SUBST(XTST_CFLAGS)
--AC_SUBST(XTST_LIBS)
-+#dnl Check for libpng headers and libraries.
-+#PKG_CHECK_MODULES(LIBPNG, libpng,[LIBPNG_FOUND=3Dyes]
-+#	,[LIBPNG_FOUND=3Dno])
-+#if test "x${LIBPNG_FOUND}" =3D xno
-+#then
-+#  AC_MSG_ERROR([Could not find libpng - \
-+#  Try installing libpng-devel.])
-+#fi
-+#AC_SUBST(LIBPNG_CFLAGS)
-+#AC_SUBST(LIBPNG_LIBS)
-+
-+#dnl Check for libXtst headers and libraries.
-+#PKG_CHECK_MODULES(XTST, xtst,[XTST_FOUND=3Dyes],[XTST_FOUND=3Dno])
-+#if test "x${XTST_FOUND}" =3D xno
-+#then
-+#  AC_MSG_ERROR([Could not find Xtst - \
-+#  Try installing libXtst-devel.])
-+#fi
-+#AC_SUBST(XTST_CFLAGS)
-+#AC_SUBST(XTST_LIBS)
-=20
- dnl Check for freetype2 headers and libraries.
- PKG_CHECK_MODULES(FREETYPE2, freetype2,[FREETYPE2_FOUND=3Dyes]
-@@ -373,18 +373,18 @@
- AC_SUBST(FREETYPE2_CFLAGS)
- AC_SUBST(FREETYPE2_LIBS)
-=20
--dnl Check for alsa headers and libraries (only required for Linux).
--if test "x${BUILD_OS_DIR}" =3D "xlinux"
--then
--  PKG_CHECK_MODULES(ALSA, alsa,[ALSA_FOUND=3Dyes],[ALSA_FOUND=3Dno])
--  if test "x${ALSA_FOUND}" =3D xno
--  then
--    AC_MSG_ERROR([Could not find alsa - \
--    Try installing alsa-lib-devel.])
--  fi
--AC_SUBST(ALSA_CFLAGS)
--AC_SUBST(ALSA_LIBS)
--fi
-+#dnl Check for alsa headers and libraries (only required for Linux).
-+#if test "x${BUILD_OS_DIR}" =3D "xlinux"
-+#then
-+#  PKG_CHECK_MODULES(ALSA, alsa,[ALSA_FOUND=3Dyes],[ALSA_FOUND=3Dno])
-+#  if test "x${ALSA_FOUND}" =3D xno
-+#  then
-+#    AC_MSG_ERROR([Could not find alsa - \
-+#    Try installing alsa-lib-devel.])
-+#  fi
-+#AC_SUBST(ALSA_CFLAGS)
-+#AC_SUBST(ALSA_LIBS)
-+#fi
-=20
- if test "x${enable_pulse_java}" =3D "xyes"
- then
diff --git =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-ecj-disable-compilat=
ion.patch =
b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-ecj-disable-compilat=
ion.patch
deleted file mode 100644
index cd0f68a..0000000
--- =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-ecj-disable-compilat=
ion.patch
+++ /dev/null
@@ -1,513 +0,0 @@
-Index: openjdk/jdk/make/sun/awt/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/sun/awt/Makefile	2009-04-24 =
09:33:55.000000000 +0200
-+++ openjdk/jdk/make/sun/awt/Makefile	2009-09-29 13:57:14.446815782 =
+0200
-@@ -180,7 +180,8 @@
- include $(BUILDDIR)/common/Mapfile-vers.gmk
- include $(BUILDDIR)/common/Library.gmk
-=20
--build: fontconfigs
-+#build: fontconfigs
-+build:
-=20
-=20
- ifeq ($(PLATFORM), windows)
-@@ -535,9 +536,9 @@
-             -I$(PLATFORM_SRC)/native/$(PKGDIR) \
- 	    $(EVENT_MODEL)
-=20
--ifeq ($(PLATFORM), linux)
--LDFLAGS +=3D -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
--endif
-+#ifeq ($(PLATFORM), linux)
-+#LDFLAGS +=3D -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
-+#endif
-=20
- LDFLAGS +=3D -L$(LIBDIR)/$(LIBARCH)/$(TSOBJDIR) \
- 	   $(AWT_RUNPATH)
-Index: openjdk/jdk/make/javax/sound/jsoundalsa/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/javax/sound/jsoundalsa/Makefile	=
2009-09-29 13:48:34.534565581 +0200
-+++ openjdk/jdk/make/javax/sound/jsoundalsa/Makefile	2009-09-29 =
13:57:14.446815782 +0200
-@@ -44,34 +44,35 @@
- # Files
- #
-=20
--FILES_c =3D \
--	Utilities.c \
--	$(DAUDIOFILES_c) \
--	$(MIDIFILES_c) \
--	$(PORTFILES_c)
-+#FILES_c =3D \
-+#	Utilities.c \
-+#	$(DAUDIOFILES_c) \
-+#	$(MIDIFILES_c) \
-+#	$(PORTFILES_c)
-=20
- # platform dependent files
--FILES_c +=3D \
--	PLATFORM_API_LinuxOS_ALSA_CommonUtils.c   \
--	PLATFORM_API_LinuxOS_ALSA_PCM.c     \
--	PLATFORM_API_LinuxOS_ALSA_PCMUtils.c   \
--	PLATFORM_API_LinuxOS_ALSA_MidiIn.c  \
--	PLATFORM_API_LinuxOS_ALSA_MidiOut.c \
--	PLATFORM_API_LinuxOS_ALSA_MidiUtils.c \
--	PLATFORM_API_LinuxOS_ALSA_Ports.c
--
--FILES_export =3D \
--	$(DAUDIOFILES_export) \
--	$(MIDIFILES_export) \
--	$(PORTFILES_export)
-+#FILES_c +=3D \
-+#	PLATFORM_API_LinuxOS_ALSA_CommonUtils.c   \
-+#	PLATFORM_API_LinuxOS_ALSA_PCM.c     \
-+#	PLATFORM_API_LinuxOS_ALSA_PCMUtils.c   \
-+#	PLATFORM_API_LinuxOS_ALSA_MidiIn.c  \
-+#	PLATFORM_API_LinuxOS_ALSA_MidiOut.c \
-+#	PLATFORM_API_LinuxOS_ALSA_MidiUtils.c \
-+#	PLATFORM_API_LinuxOS_ALSA_Ports.c
-+
-+FILES_export =3D
-+#FILES_export =3D \
-+#	$(DAUDIOFILES_export) \
-+#	$(MIDIFILES_export) \
-+#	$(PORTFILES_export)
-=20
--OTHER_LDLIBS +=3D -lasound
-+#OTHER_LDLIBS +=3D -lasound
-=20
- CPPFLAGS +=3D \
--	-DUSE_DAUDIO=3DTRUE \
--	-DUSE_PORTS=3DTRUE  \
--	-DUSE_PLATFORM_MIDI_OUT=3DTRUE \
--	-DUSE_PLATFORM_MIDI_IN=3DTRUE \
-+	-DUSE_DAUDIO=3DFALSE \
-+	-DUSE_PORTS=3DFALSE  \
-+	-DUSE_PLATFORM_MIDI_OUT=3DFALSE \
-+	-DUSE_PLATFORM_MIDI_IN=3DFALSE \
- 	-I$(SHARE_SRC)/native/com/sun/media/sound
-=20
- #
-Index: openjdk/jdk/make/sun/splashscreen/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/sun/splashscreen/Makefile	2009-09-29 =
13:48:33.738565601 +0200
-+++ openjdk/jdk/make/sun/splashscreen/Makefile	2009-09-29 =
13:57:14.446815782 +0200
-@@ -32,7 +32,8 @@
- #
- # Files
- #
--include FILES_c.gmk
-+#include FILES_c.gmk
-+FILES_c =3D=20
-=20
- FILES_java =3D \
-     java/awt/SplashScreen.java
-@@ -62,9 +63,9 @@
- CFLAGS +=3D -DSPLASHSCREEN -DPNG_NO_MMX_CODE
-=20
- ifneq ($(PLATFORM), windows)
--  CFLAGS +=3D -DWITH_X11
--  CPPFLAGS +=3D -I$(OPENWIN_HOME)/include =
-I$(OPENWIN_HOME)/include/X11/extensions
--  OTHER_LDLIBS +=3D -L$(OPENWIN_LIB) -lX11 -lXext $(LIBM) -lpng -ljpeg =
-lgif -lz -lpthread
-+#  CFLAGS +=3D -DWITH_X11
-+#  CPPFLAGS +=3D -I$(OPENWIN_HOME)/include =
-I$(OPENWIN_HOME)/include/X11/extensions
-+#  OTHER_LDLIBS +=3D -L$(OPENWIN_LIB) -lX11 -lXext $(LIBM) -lpng =
-ljpeg -lgif -lz -lpthread
- else # PLATFORM
-   CFLAGS +=3D -DWITH_WIN32
-   OTHER_LDLIBS +=3D kernel32.lib user32.lib gdi32.lib=20
-@@ -79,7 +80,7 @@
- vpath %.c   $(SHARE_SRC)/native/$(PKGDIR)/image/jpeg
- vpath %.c   $(PLATFORM_SRC)/native/$(PKGDIR)/splashscreen
-=20
--CPPFLAGS +=3D -I$(PLATFORM_SRC)/native/$(PKGDIR)/splashscreen =
-I$(SHARE_SRC)/native/$(PKGDIR)/splashscreen
-+#CPPFLAGS +=3D -I$(PLATFORM_SRC)/native/$(PKGDIR)/splashscreen =
-I$(SHARE_SRC)/native/$(PKGDIR)/splashscreen
-=20
- ifeq ($(PLATFORM), linux)
-   ifeq ($(ARCH_DATA_MODEL), 64)
-Index: openjdk/jdk/make/sun/xawt/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/sun/xawt/Makefile	2009-04-24 =
09:33:56.000000000 +0200
-+++ openjdk/jdk/make/sun/xawt/Makefile	2009-09-29 13:57:14.446815782 =
+0200
-@@ -41,15 +41,16 @@
- #
- # Files
- #
--include FILES_c_unix.gmk
--include FILES_export_unix.gmk
-+#include FILES_c_unix.gmk
-+FILES_c =3D=20
-+#include FILES_export_unix.gmk
- AUTO_FILES_JAVA_DIRS =3D sun/awt/X11
- AUTO_JAVA_PRUNE =3D WrapperGenerator.java
-=20
- LDFLAGS +=3D -L$(OPENWIN_LIB)
-=20
- ifeq ($(PLATFORM), linux)
--LDFLAGS +=3D -lpthread
-+#LDFLAGS +=3D -lpthread
- dummy :=3D $(shell $(MKDIR) -p $(LIB_LOCATION))
- endif
-=20
-@@ -86,16 +87,19 @@
- vpath %.c   $(PLATFORM_SRC)/native/sun/java2d/opengl
- vpath %.c   $(PLATFORM_SRC)/native/sun/java2d/x11
-=20
--OTHER_LDLIBS =3D $(LIBM) -lawt -lXext -lX11 -ldl \
--                   $(LDFLAGS_COMMON) $(AWT_RUNPATH) $(OTHER_LDFLAGS) =
-lXtst -lXi
-+#OTHER_LDLIBS =3D $(LIBM) -lawt -lXext -lX11 -ldl \
-+#                   $(LDFLAGS_COMMON) $(AWT_RUNPATH) $(OTHER_LDFLAGS) =
-lXtst -lXi
-=20
- ifeq  ($(PLATFORM), solaris)
- CPPFLAGS +=3D -DFUNCPROTO=3D15
- dummy :=3D $(shell $(MKDIR) -p $(LIB_LOCATION))
- endif
-=20
--CPPFLAGS +=3D -I$(CUPS_HEADERS_PATH)
-+#CPPFLAGS +=3D -I$(CUPS_HEADERS_PATH)
-=20
-+# Normally we would like to patch these includes away but
-+# we need them for the successfull compilation of the sizer
-+# executables.
- CPPFLAGS +=3D -DXAWT -DXAWT_HACK \
-         -I$(TEMPDIR)/../../sun.awt/awt/CClassHeaders \
-         -I$(PLATFORM_SRC)/native/sun/awt \
-@@ -124,10 +128,10 @@
-=20
- ifeq ($(PLATFORM), linux)
- # Allows for builds on Debian GNU Linux, X11 is in a different place=20=

--  CPPFLAGS +=3D -I/usr/X11R6/include/X11/extensions \
--              -I/usr/include/X11/extensions \
--              -I$(MOTIF_DIR)/include \
--              -I$(OPENWIN_HOME)/include=20
-+#  CPPFLAGS +=3D -I/usr/X11R6/include/X11/extensions \
-+#              -I/usr/include/X11/extensions \
-+#              -I$(MOTIF_DIR)/include \
-+#              -I$(OPENWIN_HOME)/include=20
- endif
-=20
- ifeq ($(PLATFORM), solaris)
-@@ -238,18 +242,20 @@
- 	    $(SIZER_DIR) $(XLIBTYPES) "sizer" $(subst .,,$(suffix =
$(basename $@)))
-=20
- $(SIZES): $(SIZERS)
--	@if [ "$(DOHACK)$@" =3D "true$(PREDEFINED_SIZES)" ]; then \
--	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
--	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
--	    $(CHMOD) +w $@;\
--	else	\
--	    $(ECHO) GENERATING $@; \
--	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
--	fi
--	@if [ "$(DOCOMPARE)$(suffix $@)" =3D "true.64" ]; then \
--	    $(ECHO) COMPARING $@ and =
$(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
--	    $(DIFF) $@ $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
--	fi=09
-+	touch $(SIZES)
-+#
-+#	@if [ "$(DOHACK)$@" =3D "true$(PREDEFINED_SIZES)" ]; then \
-+#	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
-+#	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
-+#	    $(CHMOD) +w $@;\
-+#	else	\
-+#	    $(ECHO) GENERATING $@; \
-+#	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
-+#	fi
-+#	@if [ "$(DOCOMPARE)$(suffix $@)" =3D "true.64" ]; then \
-+#	    $(ECHO) COMPARING $@ and =
$(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
-+#	    $(DIFF) $@ $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
-+#	fi=09
-=20
- $(TEMPDIR)/.gen.wrappers: $(SIZES) $(WRAPPER_GENERATOR_CLASS) =
$(XLIBTYPES)
- 	$(BOOT_JAVA_CMD) -cp $(WRAPPER_GENERATOR_TEMPDIR) =
WrapperGenerator \
-Index: openjdk/jdk/make/sun/jawt/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/sun/jawt/Makefile	2009-09-29 =
13:48:34.186565471 +0200
-+++ openjdk/jdk/make/sun/jawt/Makefile	2009-09-29 13:57:14.446815782 =
+0200
-@@ -36,7 +36,8 @@
- ifeq ($(PLATFORM), windows)
- FILES_cpp =3D jawt.cpp
- else # PLATFORM
--FILES_c =3D jawt.c
-+FILES_c =3D=20
-+#FILES_c =3D jawt.c
- endif # PLATFORM
-=20
- FILES_h =3D $(INCLUDEDIR)/jawt.h \
-Index: openjdk/jdk/make/sun/jpeg/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/sun/jpeg/Makefile	2009-09-29 =
13:48:33.726565626 +0200
-+++ openjdk/jdk/make/sun/jpeg/Makefile	2009-09-29 13:57:14.446815782 =
+0200
-@@ -37,7 +37,8 @@
- #
- # Files
- #
--include FILES_c.gmk
-+FILES_c =3D=20
-+#include FILES_c.gmk
-=20
- AUTO_FILES_JAVA_DIRS =3D sun/awt/image com/sun/imageio/plugins/jpeg
-=20
-Index: openjdk/jdk/make/common/shared/Defs-java.gmk
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/common/shared/Defs-java.gmk	2009-09-29 =
13:48:55.954565215 +0200
-+++ openjdk/jdk/make/common/shared/Defs-java.gmk	2009-09-29 =
13:57:14.446815782 +0200
-@@ -36,14 +36,14 @@
- # Memory related -J flags that all uses of java tools should use.
- #
- JAVA_MEM_FLAGS   =3D -Xmx$(MAX_VM_MEMORY)m
--ifneq (,$(filter $(ARCH), ia64 s390))
-+#ifneq (,$(filter $(ARCH), ia64 s390))
-   # Special flags for javac on ia64 to work around a VM problem with
-   #   bad code generation during inlining (what version had this =
problem?):
-   #   Suspect this may not be needed anymore.
--  JAVA_MEM_FLAGS   +=3D -Xms$(MAX_VM_MEMORY)m -XX:-Inline
--else
--  JAVA_MEM_FLAGS   +=3D -Xms$(MIN_VM_MEMORY)m -XX:PermSize=3D32m =
-XX:MaxPermSize=3D160m
--endif
-+#  JAVA_MEM_FLAGS   +=3D -Xms$(MAX_VM_MEMORY)m -XX:-Inline
-+#else
-+#  JAVA_MEM_FLAGS   +=3D -Xms$(MIN_VM_MEMORY)m -XX:PermSize=3D32m =
-XX:MaxPermSize=3D160m
-+#endif
-=20
- #=20
- # All java tools (javac, javah, and javadoc) run faster with certain =
java
-Index: openjdk/jdk/src/share/classes/java/awt/GraphicsEnvironment.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- =
openjdk.orig/jdk/src/share/classes/java/awt/GraphicsEnvironment.java	=
2009-04-24 09:34:04.000000000 +0200
-+++ openjdk/jdk/src/share/classes/java/awt/GraphicsEnvironment.java	=
2009-09-29 13:57:14.450815511 +0200
-@@ -113,7 +113,7 @@
-      * @since 1.4
-      */
-     public static boolean isHeadless() {
--        return getHeadlessProperty();
-+        return true;
-     }
-=20
-     /**
-Index: openjdk/corba/make/common/Defs.gmk
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/corba/make/common/Defs.gmk	2009-04-24 =
09:30:19.000000000 +0200
-+++ openjdk/corba/make/common/Defs.gmk	2009-09-29 13:57:14.450815511 =
+0200
-@@ -444,11 +444,11 @@
- # Tool flags
- #
- ASFLAGS         =3D $(ASFLAGS_$(VARIANT)) $(ASFLAGS_COMMON) =
$(OTHER_ASFLAGS)
--CFLAGS          =3D $(CFLAGS_$(VARIANT)/BYFILE)   $(CFLAGS_COMMON) =
$(OTHER_CFLAGS)
--CXXFLAGS        =3D $(CXXFLAGS_$(VARIANT)/BYFILE) $(CXXFLAGS_COMMON) =
$(OTHER_CXXFLAGS)
--CPPFLAGS        =3D $(CPPFLAGS_$(VARIANT)) $(CPPFLAGS_COMMON) =
$(OTHER_CPPFLAGS) \
-+CFLAGS          =3D $(CFLAGS_$(VARIANT)/BYFILE)   $(CFLAGS_COMMON) =
$(OTHER_CFLAGS) $(OE_CFLAGS)
-+CXXFLAGS        =3D $(CXXFLAGS_$(VARIANT)/BYFILE) $(CXXFLAGS_COMMON) =
$(OTHER_CXXFLAGS) $(OE_CXXFLAGS)
-+CPPFLAGS        =3D $(CPPFLAGS_$(VARIANT)) $(CPPFLAGS_COMMON) =
$(OTHER_CPPFLAGS) $(OE_CPPFLAGS) \
- 		  $(DEFINES) $(OPTIONS:%=3D-D%)
--LDFLAGS         =3D $(LDFLAGS_$(VARIANT)) $(LDFLAGS_COMMON) =
$(OTHER_LDFLAGS)
-+LDFLAGS         =3D $(LDFLAGS_$(VARIANT)) $(LDFLAGS_COMMON) =
$(OTHER_LDFLAGS) $(OE_LDFLAGS)
- LDLIBS          =3D $(OTHER_LDLIBS) $(LDLIBS_$(VARIANT)) =
$(LDLIBS_COMMON)
- LINTFLAGS       =3D $(LINTFLAGS_$(VARIANT)) $(LINTFLAGS_COMMON) \
- 		  $(OTHER_LINTFLAGS)
-Index: openjdk/jdk/make/common/Defs.gmk
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/common/Defs.gmk	2009-09-29 =
13:48:33.590565061 +0200
-+++ openjdk/jdk/make/common/Defs.gmk	2009-09-29 13:57:14.450815511 =
+0200
-@@ -662,11 +662,11 @@
- # Tool flags
- #
- ASFLAGS         =3D $(ASFLAGS_$(VARIANT)) $(ASFLAGS_COMMON) =
$(OTHER_ASFLAGS)
--CFLAGS          =3D $(CFLAGS_$(VARIANT)/BYFILE)   $(CFLAGS_COMMON) =
$(OTHER_CFLAGS)
--CXXFLAGS        =3D $(CXXFLAGS_$(VARIANT)/BYFILE) $(CXXFLAGS_COMMON) =
$(OTHER_CXXFLAGS)
--CPPFLAGS        =3D $(CPPFLAGS_$(VARIANT)) $(CPPFLAGS_COMMON) =
$(OTHER_CPPFLAGS) \
-+CFLAGS          =3D $(CFLAGS_$(VARIANT)/BYFILE)   $(CFLAGS_COMMON) =
$(OTHER_CFLAGS) $(OE_CFLAGS)
-+CXXFLAGS        =3D $(CXXFLAGS_$(VARIANT)/BYFILE) $(CXXFLAGS_COMMON) =
$(OTHER_CXXFLAGS) $(OE_CXXFLAGS)
-+CPPFLAGS        =3D $(CPPFLAGS_$(VARIANT)) $(CPPFLAGS_COMMON) =
$(OTHER_CPPFLAGS) $(OE_CPPFLAGS) \
- 		  $(DEFINES) $(OPTIONS:%=3D-D%)
--LDFLAGS         =3D $(LDFLAGS_$(VARIANT)) $(LDFLAGS_COMMON) =
$(OTHER_LDFLAGS)
-+LDFLAGS         =3D $(LDFLAGS_$(VARIANT)) $(LDFLAGS_COMMON) =
$(OTHER_LDFLAGS) $(OE_LDFLAGS)
- LDLIBS          =3D $(OTHER_LDLIBS) $(LDLIBS_$(VARIANT)) =
$(LDLIBS_COMMON)
- LINTFLAGS       =3D $(LINTFLAGS_$(VARIANT)) $(LINTFLAGS_COMMON) \
- 		  $(OTHER_LINTFLAGS)
-Index: openjdk/hotspot/make/linux/makefiles/vm.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/hotspot/make/linux/makefiles/vm.make	2009-09-29 =
13:48:34.098565716 +0200
-+++ openjdk/hotspot/make/linux/makefiles/vm.make	2009-09-29 =
13:57:14.450815511 +0200
-@@ -170,6 +170,7 @@
- LIBS_VM   +=3D $(LLVM_LIBS)
- endif
-=20
-+LFLAGS_VM =3D $(OE_LDFLAGS)
- LINK_VM =3D $(LINK_LIB.c)
-=20
- # rule for building precompiled header
-Index: openjdk/jdk/src/solaris/native/sun/awt/CUPSfuncs.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/src/solaris/native/sun/awt/CUPSfuncs.c	=
2009-04-24 09:34:34.000000000 +0200
-+++ openjdk/jdk/src/solaris/native/sun/awt/CUPSfuncs.c	2009-09-29 =
13:57:14.450815511 +0200
-@@ -26,8 +26,10 @@
- #include <jni.h>
- #include <jni_util.h>
- #include <dlfcn.h>
-+#if 0
- #include <cups/cups.h>
- #include <cups/ppd.h>
-+#endif
-=20
- //#define CUPS_DEBUG
-=20
-@@ -37,6 +39,7 @@
- #define DPRINTF(x, y)
- #endif
-=20
-+#if 0
- typedef const char* (*fn_cupsServer)(void);
- typedef int (*fn_ippPort)(void);
- typedef http_t* (*fn_httpConnect)(const char *, int);
-@@ -56,7 +59,7 @@
- fn_ppdClose j2d_ppdClose;
- fn_ppdFindOption j2d_ppdFindOption;
- fn_ppdPageSize j2d_ppdPageSize;
--
-+#endif
-=20
- /*
-  * Initialize library functions.
-@@ -65,6 +68,7 @@
- JNIEXPORT jboolean JNICALL
- Java_sun_print_CUPSPrinter_initIDs(JNIEnv *env,
-                                          jobject printObj) {
-+#if 0
-   void *handle =3D dlopen("libcups.so.2", RTLD_LAZY | RTLD_GLOBAL);
-=20
-   if (handle =3D=3D NULL) {
-@@ -131,6 +135,8 @@
-   }
-=20
-   return JNI_TRUE;
-+#endif
-+	return JNI_FALSE;
- }
-=20
- /*
-@@ -141,6 +147,7 @@
- Java_sun_print_CUPSPrinter_getCupsServer(JNIEnv *env,
-                                          jobject printObj)
- {
-+#if 0
-     jstring cServer =3D NULL;
-     const char* server =3D j2d_cupsServer();
-     if (server !=3D NULL) {
-@@ -152,6 +159,8 @@
-         }
-     }
-     return cServer;
-+#endif
-+	return NULL;
- }
-=20
- /*
-@@ -162,8 +171,11 @@
- Java_sun_print_CUPSPrinter_getCupsPort(JNIEnv *env,
-                                          jobject printObj)
- {
-+#if 0
-     int port =3D j2d_ippPort();
-     return (jint) port;
-+#endif
-+	return 0;
- }
-=20
-=20
-@@ -177,6 +189,7 @@
-                                       jstring server,
-                                       jint port)
- {
-+#if 0
-     const char *serverName;
-     serverName =3D (*env)->GetStringUTFChars(env, server, NULL);
-     if (serverName !=3D NULL) {
-@@ -187,6 +200,7 @@
-             return JNI_TRUE;
-         }
-     }
-+#endif
-     return JNI_FALSE;
- }
-=20
-@@ -199,6 +213,7 @@
-                                          jobject printObj,
-                                          jstring printer)
- {
-+#if 0
-     ppd_file_t *ppd;
-     ppd_option_t *optionTray, *optionPage;
-     ppd_choice_t *choice;
-@@ -304,6 +319,8 @@
-     j2d_ppdClose(ppd);
-     unlink(filename);
-     return nameArray;
-+#endif
-+	return NULL;
- }
-=20
-=20
-@@ -315,6 +332,7 @@
-                                          jobject printObj,
-                                          jstring printer)
- {
-+#if 0
-     ppd_file_t *ppd;
-     ppd_option_t *option;
-     ppd_choice_t *choice;
-@@ -374,4 +392,6 @@
-     j2d_ppdClose(ppd);
-     unlink(filename);
-     return sizeArray;
-+#endif
-+	return NULL;
- }
-Index: =
openjdk/jdk/src/share/classes/sun/java2d/SunGraphicsEnvironment.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- =
openjdk.orig/jdk/src/share/classes/sun/java2d/SunGraphicsEnvironment.java	=
2009-04-24 09:34:17.000000000 +0200
-+++ =
openjdk/jdk/src/share/classes/sun/java2d/SunGraphicsEnvironment.java	=
2009-09-29 13:57:14.454815276 +0200
-@@ -244,6 +244,8 @@
-                  * that might be specified.
-                  */
-                 fontConfig =3D createFontConfiguration();
-+								if =
(fontConfig =3D=3D null)
-+									=
return null;
-                 getPlatformFontPathFromFontConfig();
-=20
-                 String extraFontPath =3D =
fontConfig.getExtraFontPath();
-Index: =
openjdk/jdk/src/solaris/classes/sun/awt/X11GraphicsEnvironment.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- =
openjdk.orig/jdk/src/solaris/classes/sun/awt/X11GraphicsEnvironment.java	=
2009-04-24 09:34:33.000000000 +0200
-+++ openjdk/jdk/src/solaris/classes/sun/awt/X11GraphicsEnvironment.java	=
2009-09-29 13:57:14.454815276 +0200
-@@ -899,7 +899,8 @@
-=20
-     // Implements SunGraphicsEnvironment.createFontConfiguration.
-     protected FontConfiguration createFontConfiguration() {
--        return new MFontConfiguration(this);
-+//        return new MFontConfiguration(this);
-+			return null;
-     }
-     public FontConfiguration
-         createFontConfiguration(boolean preferLocaleFonts,
-Index: openjdk/jdk/make/launchers/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/launchers/Makefile	2009-09-29 =
13:48:33.490815135 +0200
-+++ openjdk/jdk/make/launchers/Makefile	2009-09-29 =
13:57:14.454815276 +0200
-@@ -57,7 +57,7 @@
- endif
- # Run MAKE $@ for all generic launchers
- define make-all-launchers
--$(call make-launcher, appletviewer, sun.applet.Main, , )
-+#$(call make-launcher, appletviewer, sun.applet.Main, , )
- $(call make-launcher, apt, com.sun.tools.apt.Main, , )
- $(call make-launcher, extcheck, com.sun.tools.extcheck.Main, , )
- $(call make-launcher, idlj, =
com.sun.tools.corba.se.idl.toJavaPortable.Compile, , )
-@@ -93,7 +93,7 @@
-   -J-Dcom.sun.CORBA.activation.Port=3D1049 \
-   -J-Dcom.sun.CORBA.POA.ORBServerId=3D1, )
- $(call make-launcher, pack200, com.sun.java.util.jar.pack.Driver, , =
--pack)
--$(call make-launcher, policytool, sun.security.tools.PolicyTool, , )
-+#$(call make-launcher, policytool, sun.security.tools.PolicyTool, , )
- $(call make-launcher, rmic, sun.rmi.rmic.Main, , )
- $(call make-launcher, rmid, sun.rmi.server.Activation, , )
- $(call make-launcher, rmiregistry, sun.rmi.registry.RegistryImpl, , )
diff --git =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-ecj-fix-freetype.pat=
ch =
b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-ecj-fix-freetype.pat=
ch
deleted file mode 100644
index 3420fbd..0000000
--- =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-ecj-fix-freetype.pat=
ch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: openjdk/jdk/make/tools/freetypecheck/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/tools/freetypecheck/Makefile	2009-09-29 =
13:48:33.590565061 +0200
-+++ openjdk/jdk/make/tools/freetypecheck/Makefile	2009-09-29 =
14:00:04.470566156 +0200
-@@ -45,7 +45,7 @@
-   FT_OPTIONS  =3D $(CFLAGS)
- endif
-=20
--FT_OPTIONS +=3D -I$(FT_HEADERS) -I$(FT_HEADERS)/freetype2
-+FT_OPTIONS +=3D -I$(FT_HEADERS) -I$(FT_HEADERS)/freetype2 =
$(FREETYPE2_CFLAGS) $(FREETYPE2_LIBS) $(FREETYPE2_HEADERS)
- FT_OPTIONS +=3D $(XARCH)
-=20
- #add runtime library search path
diff --git =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-ecj-fix-zlib.patch =
b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-ecj-fix-zlib.patch
deleted file mode 100644
index eff7e48..0000000
--- =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-ecj-fix-zlib.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Index: openjdk/jdk/make/com/sun/java/pack/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/com/sun/java/pack/Makefile	2009-09-29 =
13:48:34.538565136 +0200
-+++ openjdk/jdk/make/com/sun/java/pack/Makefile	2009-09-29 =
14:00:26.226565853 +0200
-@@ -80,7 +80,7 @@
-   OTHER_LDLIBS +=3D $(JVMLIB)
- endif
-=20
--OTHER_LDLIBS +=3D -lz
-+OTHER_LDLIBS +=3D -L$(libdir) -lz
- CXXFLAGS_DBG +=3D -DFULL
- CXXFLAGS_OPT +=3D -DPRODUCT
- CXXFLAGS_COMMON +=3D -DFULL
-Index: openjdk/jdk/make/common/Defs.gmk
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/common/Defs.gmk	2009-09-29 =
13:57:14.450815511 +0200
-+++ openjdk/jdk/make/common/Defs.gmk	2009-09-29 14:00:26.226565853 =
+0200
-@@ -289,7 +289,7 @@
-=20
- endif # PROGRAM
-=20
--LDLIBS_COMMON +=3D $(EXTRA_LIBS)
-+LDLIBS_COMMON +=3D $(EXTRA_LIBS) -L$(libdir)
-=20
- #
- # Default is to build, not import native binaries
-@@ -425,7 +425,7 @@
- CLASSDESTDIR =3D $(CLASSBINDIR)
- endif
-=20
--INCLUDES =3D -I. -I$(CLASSHDRDIR) \
-+INCLUDES =3D -I$(includedir) -I. -I$(CLASSHDRDIR) \
- 	$(patsubst %,-I%,$(subst $(CLASSPATH_SEPARATOR), ,$(VPATH.h))) =
$(OTHER_INCLUDES)
- OTHER_CPPFLAGS =3D $(INCLUDES)
-=20
-Index: openjdk/jdk/make/common/Program.gmk
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/common/Program.gmk	2009-09-29 =
13:48:33.914565255 +0200
-+++ openjdk/jdk/make/common/Program.gmk	2009-09-29 =
14:00:26.226565853 +0200
-@@ -73,7 +73,7 @@
- # itself, as with all the Windows libraries.
- #
- ifneq (,$(findstring $(PLATFORM), linux solaris))	# UNIX systems
--    LDFLAGS +=3D -L $(LIBDIR)/$(LIBARCH)/jli
-+    LDFLAGS +=3D -L $(LIBDIR)/$(LIBARCH)/jli -L $(libdir)
-     OTHER_LDLIBS +=3D -ljli
-     ifeq ($(PLATFORM), solaris)
- 	ifeq ($(ARCH_DATA_MODEL), 32)
-Index: openjdk/jdk/make/java/jli/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/java/jli/Makefile	2009-09-29 =
13:48:33.806565054 +0200
-+++ openjdk/jdk/make/java/jli/Makefile	2009-09-29 14:00:26.230565844 =
+0200
-@@ -61,7 +61,7 @@
- ifneq (,$(findstring $(PLATFORM), linux solaris))	# UNIX systems
- 	LIB_LOCATION =3D $(LIBDIR)/$(LIBARCH)/jli
- 	# Guarantee very limited dependencies
--	LDLIBS =3D -lz -lc=20
-+	LDLIBS =3D -L$(libdir) -lz -lc
- endif
-=20
- ifeq ($(PLATFORM), windows)
diff --git =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-fix-jar-path.patch =
b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-fix-jar-path.patch
deleted file mode 100644
index 57543fb..0000000
--- =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-fix-jar-path.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: icedtea6-1.8.11/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.8.11.orig/Makefile.am	2011-12-20 00:49:21.000000000 =
+0100
-+++ icedtea6-1.8.11/Makefile.am	2011-12-20 01:07:08.431134312 =
+0100
-@@ -1877,7 +1877,7 @@
- stamps/rewrite-rhino.stamp: stamps/rewriter.stamp $(RHINO_JAR)
- if WITH_RHINO
- 	mkdir -p rhino/rhino.{old,new}
--	(cd rhino/rhino.old ; jar xf $(RHINO_JAR))
-+	(cd rhino/rhino.old ; $(ICEDTEA_BOOT_DIR)/bin/jar xf =
$(RHINO_JAR))
- 	$(ICEDTEA_BOOT_DIR)/bin/java -cp $(abs_top_builddir)/rewriter \
- 	  com.redhat.rewriter.ClassRewriter \
- 	  $(abs_top_builddir)/rhino/rhino.old =
$(abs_top_builddir)/rhino/rhino.new \
diff --git =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-hotspot-dont-return-=
booleans.patch =
b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-hotspot-dont-return-=
booleans.patch
deleted file mode 100644
index 73f90b3..0000000
--- =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-hotspot-dont-return-=
booleans.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -Nurd openjdk/hotspot/src/share/vm/opto/loopnode.cpp =
openjdk/hotspot/src/share/vm/opto/loopnode.cpp
---- openjdk/hotspot/src/share/vm/opto/loopnode.cpp	2012-10-05 =
14:18:19.725747261 +0200
-+++ openjdk/hotspot/src/share/vm/opto/loopnode.cpp	2012-10-05 =
14:18:40.751035242 +0200
-@@ -534,7 +534,7 @@
- Node* CountedLoopNode::match_incr_with_optional_truncation(
-                       Node* expr, Node** trunc1, Node** trunc2, const =
TypeInt** trunc_type) {
-   // Quick cutouts:
--  if (expr =3D=3D NULL || expr->req() !=3D 3)  return false;
-+  if (expr =3D=3D NULL || expr->req() !=3D 3)  return NULL;
-=20
-   Node *t1 =3D NULL;
-   Node *t2 =3D NULL;
diff --git =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-hotspot-make-arch-sa=
ne-for-x86.patch =
b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-hotspot-make-arch-sa=
ne-for-x86.patch
deleted file mode 100644
index 9d7b9bb..0000000
--- =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-hotspot-make-arch-sa=
ne-for-x86.patch
+++ /dev/null
@@ -1,1130 +0,0 @@
-=46rom b8a51665ada45e3beb0823c03c025d5514f5e745 Mon Sep 17 00:00:00 =
2001
-From: woglinde <woglinde@rhein.zuhause.netz>
-Date: Thu, 22 Oct 2009 16:35:25 +0200
-Subject: [PATCH] hotspot: make arch sane for x86
-
-diff --git openjdk/hotspot/agent/make/saenv.sh =
openjdk/hotspot/agent/make/saenv.sh
-index 38e0f78..64c8410 100644
---- openjdk/hotspot/agent/make/saenv.sh
-+++ openjdk/hotspot/agent/make/saenv.sh
-@@ -43,9 +43,9 @@ if [ "$OS" =3D "Linux" ]; then
-      OPTIONS=3D"-Dsa.library.path=3D$SA_LIBPATH"
-      CPU=3Damd64
-    else
--     SA_LIBPATH=3D$STARTDIR/../src/os/linux/i386:$STARTDIR/linux/i386
-+     SA_LIBPATH=3D$STARTDIR/../src/os/linux/x86:$STARTDIR/linux/x86
-      OPTIONS=3D"-Dsa.library.path=3D$SA_LIBPATH"
--     CPU=3Di386
-+     CPU=3Dx86
-    fi
- else
-    SA_LIBPATH=3D$STARTDIR/../src/os/solaris/proc/`uname =
-p`:$STARTDIR/solaris/`uname -p`
-diff --git openjdk/hotspot/make/defs.make =
openjdk/hotspot/make/defs.make
-index 83ddd1a..c20c7eb 100644
---- openjdk/hotspot/make/defs.make
-+++ openjdk/hotspot/make/defs.make
-@@ -207,7 +207,7 @@ ifneq ($(OSNAME),windows)
-     ifdef LP64
-       BUILDARCH =3D amd64
-     else
--      BUILDARCH =3D i486
-+      BUILDARCH =3D x86
-     endif
-   endif
-   ifeq ($(BUILDARCH), sparc)
-@@ -218,7 +218,7 @@ ifneq ($(OSNAME),windows)
-=20
-   # LIBARCH is 1:1 mapping from BUILDARCH
-   LIBARCH         =3D $(LIBARCH/$(BUILDARCH))
--  LIBARCH/i486    =3D i386
-+  LIBARCH/x86     =3D x86
-   LIBARCH/amd64   =3D amd64
-   LIBARCH/sparc   =3D sparc
-   LIBARCH/sparcv9 =3D sparcv9
-diff --git openjdk/hotspot/make/jprt.config =
openjdk/hotspot/make/jprt.config
-index bc82543..4a1ef4e 100644
---- openjdk/hotspot/make/jprt.config
-+++ openjdk/hotspot/make/jprt.config
-@@ -111,7 +111,7 @@ elif [ "${osname}" =3D Linux ] ; then
-     # LINUX: X86, AMD64
-     osarch=3D`uname -m`
-     if [ "${osarch}" =3D i686 ] ; then
--	linux_arch=3Di586
-+	linux_arch=3Dx86
-     elif [ "${osarch}" =3D x86_64 ] ; then
- 	linux_arch=3Damd64
-     fi
-diff --git openjdk/hotspot/make/jprt.properties =
openjdk/hotspot/make/jprt.properties
-index eb2ce82..7193de0 100644
---- openjdk/hotspot/make/jprt.properties
-+++ openjdk/hotspot/make/jprt.properties
-@@ -70,7 +70,7 @@ jprt.my.solaris.x64.jdk6u10=3Dsolaris_x64_5.10
- jprt.my.solaris.x64.jdk6u14=3Dsolaris_x64_5.10
- =
jprt.my.solaris.x64=3D${jprt.my.solaris.x64.${jprt.tools.default.release}}=

-=20
--jprt.my.linux.i586=3Dlinux_i586
-+jprt.my.linux.x86=3Dlinux_x86
- jprt.my.linux.x64=3Dlinux_x64
- jprt.my.windows.i586=3Dwindows_i586
- jprt.my.windows.x64=3Dwindows_x64
-@@ -201,30 +201,30 @@ jprt.my.solaris.i586.test.targets=3D \
-     ${jprt.my.solaris.i586}-{product|fastdebug}-{c1|c2}-scimark_2, \
-     ${jprt.my.solaris.i586}-{product|fastdebug}-{c1|c2}-scimark_3
-=20
--jprt.my.linux.i586.test.targets =3D \
--    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-jvm98, \
--    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-scimark, \
--    ${jprt.my.linux.i586}-product-c1-runThese_Xcomp, \
--    ${jprt.my.linux.i586}-product-c1-runThese_Xcomp_2, \
--    ${jprt.my.linux.i586}-product-c1-runThese_Xcomp_3, \
--    ${jprt.my.linux.i586}-fastdebug-c1-runThese_Xshare, \
--    ${jprt.my.linux.i586}-fastdebug-c2-runThese_Xcomp, \
--    ${jprt.my.linux.i586}-fastdebug-c2-runThese_Xcomp_2, \
--    =
${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_default, \
--    =
${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_SerialGC, \
--    =
${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_ParallelGC, \
--    =
${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_ParNewGC, \
--    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_CMS, \
--    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_default, \
--    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_SerialGC, \
--    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_ParallelGC, \
--    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_ParNewGC, \
--    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_CMS, \
--    ${jprt.my.linux.i586}-{product|fastdebug}-c1-jbb_default, \
--    ${jprt.my.linux.i586}-{product|fastdebug}-c1-jbb_ParallelGC, \
--    ${jprt.my.linux.i586}-{product|fastdebug}-c1-jbb_CMS, \
--    ${jprt.my.linux.i586}-{product|fastdebug}-c2-scimark_2, \
--    ${jprt.my.linux.i586}-{product|fastdebug}-c2-scimark_3
-+jprt.my.linux.x86.test.targets =3D \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-jvm98, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-scimark, \
-+    ${jprt.my.linux.x86}-product-c1-runThese_Xcomp, \
-+    ${jprt.my.linux.x86}-product-c1-runThese_Xcomp_2, \
-+    ${jprt.my.linux.x86}-product-c1-runThese_Xcomp_3, \
-+    ${jprt.my.linux.x86}-fastdebug-c1-runThese_Xshare, \
-+    ${jprt.my.linux.x86}-fastdebug-c2-runThese_Xcomp, \
-+    ${jprt.my.linux.x86}-fastdebug-c2-runThese_Xcomp_2, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_default, =
\
-+    =
${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_SerialGC, \
-+    =
${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_ParallelGC, \
-+    =
${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_ParNewGC, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_CMS, \
-+    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_default, \
-+    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_SerialGC, \
-+    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_ParallelGC, \
-+    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_ParNewGC, \
-+    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_CMS, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-c1-jbb_default, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-c1-jbb_ParallelGC, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-c1-jbb_CMS, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-c2-scimark_2, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-c2-scimark_3
-=20
- jprt.my.linux.x64.test.targets =3D \
-     ${jprt.my.linux.x64}-{product|fastdebug}-c2-jvm98, \
-@@ -294,7 +294,7 @@ jprt.test.targets =3D \
-   ${jprt.my.solaris.sparcv9.test.targets}, \
-   ${jprt.my.solaris.i586.test.targets}, \
-   ${jprt.my.solaris.x64.test.targets}, \
--  ${jprt.my.linux.i586.test.targets}, \
-+  ${jprt.my.linux.x86.test.targets}, \
-   ${jprt.my.linux.x64.test.targets}, \
-   ${jprt.my.windows.i586.test.targets}, \
-   ${jprt.my.windows.x64.test.targets}
-diff --git openjdk/hotspot/make/linux/build.sh =
openjdk/hotspot/make/linux/build.sh
-index e317fdd..5d3b1ff 100644
---- openjdk/hotspot/make/linux/build.sh
-+++ openjdk/hotspot/make/linux/build.sh
-@@ -43,7 +43,7 @@ esac
-=20
- case `uname -m` in
-   i386|i486|i586|i686)
--    mach=3Di386
-+    mach=3Dx86
-     ;;
-   *)
-     echo "Unsupported machine: " `uname -m`
-diff --git openjdk/hotspot/make/linux/makefiles/buildtree.make =
openjdk/hotspot/make/linux/makefiles/buildtree.make
-index add9823..cbbf81f 100644
---- openjdk/hotspot/make/linux/makefiles/buildtree.make
-+++ openjdk/hotspot/make/linux/makefiles/buildtree.make
-@@ -30,7 +30,7 @@
- # The macros ARCH, GAMMADIR, OS_FAMILY and VARIANT must be defined in =
the
- # environment or on the command-line:
- #
--# ARCH		- sparc, i486, ... HotSpot cpu and os_cpu source =
directory
-+# ARCH		- sparc, x86, ... HotSpot cpu and os_cpu source =
directory
- # BUILDARCH     - build directory
- # LIBARCH       - the corresponding directory in JDK/JRE
- # GAMMADIR	- top of workspace
-@@ -316,7 +316,7 @@ NO_JAVA_HOME_MSG	=3D \
- DATA_MODE =3D $(DATA_MODE/$(BUILDARCH))
- JAVA_FLAG =3D $(JAVA_FLAG/$(DATA_MODE))
-=20
--DATA_MODE/i486    =3D 32
-+DATA_MODE/x86     =3D 32
- DATA_MODE/sparc   =3D 32
- DATA_MODE/sparcv9 =3D 64
- DATA_MODE/amd64   =3D 64
-diff --git openjdk/hotspot/make/linux/makefiles/cscope.make =
openjdk/hotspot/make/linux/makefiles/cscope.make
-index 113d4f8..d3f06cb 100644
---- openjdk/hotspot/make/linux/makefiles/cscope.make
-+++ openjdk/hotspot/make/linux/makefiles/cscope.make
-@@ -78,7 +78,7 @@ endif
- # Processor-specific files for other processors are excluded by =
default.  Use
- # CS_CPU=3Dx to include platform-specific files for other platforms.
- ifndef	CS_CPU
--CS_CPU		=3D i486 sparc amd64 ia64
-+CS_CPU		=3D x86 sparc amd64 ia64
- CS_PRUNE_CPU	=3D $(patsubst %,-o -name '*%*',$(filter-out =
${SRCARCH},${CS_CPU}))
- endif
-=20
-diff --git openjdk/hotspot/make/linux/makefiles/defs.make =
openjdk/hotspot/make/linux/makefiles/defs.make
-index 9131c79..138dfb3 100644
---- openjdk/hotspot/make/linux/makefiles/defs.make
-+++ openjdk/hotspot/make/linux/makefiles/defs.make
-@@ -85,6 +85,14 @@ ifeq ($(ARCH), sparc)
-   HS_ARCH          =3D sparc
- endif
-=20
-+# x86
-+ifeq ($(findstring 86,$(ARCH)), 86)
-+  ARCH_DATA_MODEL  =3D 32
-+  PLATFORM         =3D linux-x86
-+  VM_PLATFORM      =3D linux_x86
-+  HS_ARCH          =3D x86
-+endif
-+
- # x86_64
- ifeq ($(ARCH), x86_64)=20
-   ifeq ($(ARCH_DATA_MODEL), 64)
-@@ -95,22 +103,12 @@ ifeq ($(ARCH), x86_64)
-     HS_ARCH         =3D x86
-   else
-     ARCH_DATA_MODEL =3D 32
--    PLATFORM        =3D linux-i586
--    VM_PLATFORM     =3D linux_i486
-+    PLATFORM        =3D linux-x86
-+    VM_PLATFORM     =3D linux_x86
-     HS_ARCH         =3D x86
--    # We have to reset ARCH to i686 since SRCARCH relies on it
--    ARCH            =3D i686  =20
-   endif
- endif
-=20
--# i686
--ifeq ($(ARCH), i686)
--  ARCH_DATA_MODEL  =3D 32
--  PLATFORM         =3D linux-i586
--  VM_PLATFORM      =3D linux_i486
--  HS_ARCH          =3D x86
--endif
--
- JDK_INCLUDE_SUBDIR=3Dlinux
-=20
- # FIXUP: The subdirectory for a debug build is NOT the same on all =
platforms
-diff --git openjdk/hotspot/make/linux/makefiles/sparcWorks.make =
openjdk/hotspot/make/linux/makefiles/sparcWorks.make
-index 0a9f75b..2e29bb9 100644
---- openjdk/hotspot/make/linux/makefiles/sparcWorks.make
-+++ openjdk/hotspot/make/linux/makefiles/sparcWorks.make
-@@ -30,7 +30,7 @@ CC  =3D cc
- AS  =3D $(CC) -c
-=20
- ARCHFLAG =3D $(ARCHFLAG/$(BUILDARCH))
--ARCHFLAG/i486    =3D -m32
-+ARCHFLAG/x86    =3D -m32
- ARCHFLAG/amd64   =3D -m64
-=20
- CFLAGS     +=3D $(ARCHFLAG)
-diff --git openjdk/hotspot/make/linux/platform_i486 =
openjdk/hotspot/make/linux/platform_i486
-deleted file mode 100644
-index 610ac91..0000000
---- openjdk/hotspot/make/linux/platform_i486
-+++ /dev/null
-@@ -1,15 +0,0 @@
--os_family =3D linux
--
--arch =3D x86
--
--arch_model =3D x86_32
--
--os_arch =3D linux_x86
--
--os_arch_model =3D linux_x86_32
--
--lib_arch =3D i386
--
--compiler =3D gcc
--
--sysdefs =3D -DLINUX -D_GNU_SOURCE -DIA32
-diff --git openjdk/hotspot/make/linux/platform_i486.suncc =
openjdk/hotspot/make/linux/platform_i486.suncc
-index 325a3fe..717fc75 100644
---- openjdk/hotspot/make/linux/platform_i486.suncc
-+++ openjdk/hotspot/make/linux/platform_i486.suncc
-@@ -8,10 +8,10 @@ os_arch =3D linux_x86
-=20
- os_arch_model =3D linux_x86_32
-=20
--lib_arch =3D i386
-+lib_arch =3D x86
-=20
- compiler =3D sparcWorks
-=20
--gnu_dis_arch =3D i386
-+gnu_dis_arch =3D x86
-=20
- sysdefs =3D -DLINUX -DSPARC_WORKS -D_GNU_SOURCE -DIA32
-diff --git openjdk/hotspot/make/linux/platform_x86 =
openjdk/hotspot/make/linux/platform_x86
-new file mode 100644
-index 0000000..5c613fe
---- /dev/null
-+++ openjdk/hotspot/make/linux/platform_x86
-@@ -0,0 +1,15 @@
-+os_family =3D linux
-+
-+arch =3D x86
-+
-+arch_model =3D x86_32
-+
-+os_arch =3D linux_x86
-+
-+os_arch_model =3D linux_x86_32
-+
-+lib_arch =3D x86
-+
-+compiler =3D gcc
-+
-+sysdefs =3D -DLINUX -D_GNU_SOURCE -DIA32
-diff --git openjdk/hotspot/src/os/linux/vm/os_linux.cpp =
openjdk/hotspot/src/os/linux/vm/os_linux.cpp
-index b2b3162..a4bbe70 100644
---- openjdk/hotspot/src/os/linux/vm/os_linux.cpp
-+++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp
-@@ -164,7 +164,7 @@ bool os::have_special_privileges() {
- // i386: 224, ia64: 1105, amd64: 186, sparc 143
- #ifdef __ia64__
- #define SYS_gettid 1105
--#elif __i386__
-+#elif __x86__
- #define SYS_gettid 224
- #elif __amd64__
- #define SYS_gettid 186
-@@ -181,7 +181,7 @@ static char cpu_arch[] =3D ZERO_LIBARCH;
- #elif defined(IA64)
- static char cpu_arch[] =3D "ia64";
- #elif defined(IA32)
--static char cpu_arch[] =3D "i386";
-+static char cpu_arch[] =3D "x86";
- #elif defined(AMD64)
- static char cpu_arch[] =3D "amd64";
- #elif defined(SPARC)
-diff --git openjdk/hotspot/src/share/tools/hsdis/Makefile =
openjdk/hotspot/src/share/tools/hsdis/Makefile
-index 6bdf4b8..fd43c6e 100644
---- openjdk/hotspot/src/share/tools/hsdis/Makefile
-+++ openjdk/hotspot/src/share/tools/hsdis/Makefile
-@@ -32,7 +32,7 @@ BINUTILS	=3D $(shell cd =
../../../../..;pwd)/binutils-2.17-$(LIBARCH)
- endif
-=20
- # Default arch; it is changed below as needed.
--ARCH		=3D i386
-+ARCH		=3D x86
- OS		=3D $(shell uname)
-=20
- CPPFLAGS	+=3D -I$(BINUTILS)/include -I$(BINUTILS)/bfd
-@@ -87,7 +87,7 @@ endif	# SunOS
- LIBARCH		=3D $(ARCH)
- ifdef		LP64
- LIBARCH64/sparc	=3D sparcv9
--LIBARCH64/i386	=3D amd64
-+LIBARCH64/x86	=3D amd64
- LIBARCH64	=3D $(LIBARCH64/$(ARCH))
- ifneq		($(LIBARCH64),)
- LIBARCH		=3D $(LIBARCH64)
-diff --git openjdk/hotspot/src/share/tools/hsdis/hsdis.c =
openjdk/hotspot/src/share/tools/hsdis/hsdis.c
-index 75b7efe..62c692b 100644
---- openjdk/hotspot/src/share/tools/hsdis/hsdis.c
-+++ openjdk/hotspot/src/share/tools/hsdis/hsdis.c
-@@ -383,8 +383,8 @@ static void print_help(struct hsdis_app_data* =
app_data,
-   else
-     disassembler_usage(stderr); /* better than nothing */
-   (*printf_callback)(printf_stream, "  mach=3D<arch>   select =
disassembly mode\n");
--#if defined(LIBARCH_i386) || defined(LIBARCH_amd64)
--  (*printf_callback)(printf_stream, "  mach=3Di386     select 32-bit =
mode\n");
-+#if defined(LIBARCH_x86) || defined(LIBARCH_amd64)
-+  (*printf_callback)(printf_stream, "  mach=3Dx86      select 32-bit =
mode\n");
-   (*printf_callback)(printf_stream, "  mach=3Dx86-64   select 64-bit =
mode\n");
-   (*printf_callback)(printf_stream, "  suffix        always print =
instruction suffix\n");
- #endif
-@@ -406,7 +406,7 @@ static const bfd_arch_info_type* =
find_arch_info(const char* arch_name) {
- static const char* native_arch_name() {
-   const char* res =3D HOTSPOT_LIB_ARCH;
- #ifdef LIBARCH_amd64
--    res =3D "i386:x86-64";
-+    res =3D "x86:x86-64";
- #endif
- #ifdef LIBARCH_sparc
-     res =3D "sparc:v8plusb";
-diff --git openjdk/hotspot/test/Makefile openjdk/hotspot/test/Makefile
-index 2596d85..c2f3eb9 100644
---- openjdk/hotspot/test/Makefile
-+++ openjdk/hotspot/test/Makefile
-@@ -33,14 +33,14 @@ ifeq ($(OSNAME), SunOS)
-   PLATFORM =3D solaris
-   ARCH =3D $(shell uname -p)
-   ifeq ($(ARCH), i386)
--    ARCH=3Di586
-+    ARCH=3Dx86
-   endif
- endif
- ifeq ($(OSNAME), Linux)
-   PLATFORM =3D linux
-   ARCH =3D $(shell uname -m)
--  ifeq ($(ARCH), i386)
--    ARCH =3D i586
-+  ifeq ($(findstring 86,$(ARCH)), 86)
-+    ARCH =3D x86
-   endif
- endif
- ifeq ($(OSNAME), Windows_NT)
-@@ -55,7 +55,7 @@ ifeq ($(OSNAME), Windows_NT)
-       ifeq ($(word 1, $(PROCESSOR_IDENTIFIER)),EM64T)
-         ARCH =3D x64
-       else
--        ARCH =3D i586
-+        ARCH =3D x86
-       endif
-     endif
-   endif
-diff --git openjdk/hotspot/agent/make/saenv.sh =
openjdk/hotspot/agent/make/saenv.sh
-index 38e0f78..64c8410 100644
---- openjdk/hotspot/agent/make/saenv.sh
-+++ openjdk/hotspot/agent/make/saenv.sh
-@@ -43,9 +43,9 @@ if [ "$OS" =3D "Linux" ]; then
-      OPTIONS=3D"-Dsa.library.path=3D$SA_LIBPATH"
-      CPU=3Damd64
-    else
--     SA_LIBPATH=3D$STARTDIR/../src/os/linux/i386:$STARTDIR/linux/i386
-+     SA_LIBPATH=3D$STARTDIR/../src/os/linux/x86:$STARTDIR/linux/x86
-      OPTIONS=3D"-Dsa.library.path=3D$SA_LIBPATH"
--     CPU=3Di386
-+     CPU=3Dx86
-    fi
- else
-    SA_LIBPATH=3D$STARTDIR/../src/os/solaris/proc/`uname =
-p`:$STARTDIR/solaris/`uname -p`
-diff --git openjdk/hotspot/agent/src/os/linux/LinuxDebuggerLocal.c =
openjdk/hotspot/agent/src/os/linux/LinuxDebuggerLocal.c
-index c4ca7de..54c12ca 100644
---- openjdk/hotspot/agent/src/os/linux/LinuxDebuggerLocal.c
-+++ openjdk/hotspot/agent/src/os/linux/LinuxDebuggerLocal.c
-@@ -29,7 +29,7 @@
- #define amd64 1
- #endif
-=20
--#ifdef i386
-+#ifdef x86
- #include "sun_jvm_hotspot_debugger_x86_X86ThreadContext.h"
- #endif
-=20
-@@ -295,7 +295,7 @@ JNIEXPORT jlongArray JNICALL =
Java_sun_jvm_hotspot_debugger_linux_LinuxDebuggerLo
-   }
-=20
- #undef NPRGREG
--#ifdef i386
-+#ifdef x86
- #define NPRGREG sun_jvm_hotspot_debugger_x86_X86ThreadContext_NPRGREG
- #endif
- #ifdef ia64
-@@ -314,7 +314,7 @@ JNIEXPORT jlongArray JNICALL =
Java_sun_jvm_hotspot_debugger_linux_LinuxDebuggerLo
-=20
- #undef REG_INDEX
-=20
--#ifdef i386
-+#ifdef x86
- #define REG_INDEX(reg) =
sun_jvm_hotspot_debugger_x86_X86ThreadContext_##reg
-=20
-   regs[REG_INDEX(GS)]  =3D (uintptr_t) gregs.xgs;
-@@ -333,7 +333,7 @@ JNIEXPORT jlongArray JNICALL =
Java_sun_jvm_hotspot_debugger_linux_LinuxDebuggerLo
-   regs[REG_INDEX(CS)]  =3D (uintptr_t) gregs.xcs;
-   regs[REG_INDEX(SS)]  =3D (uintptr_t) gregs.xss;
-=20
--#endif /* i386 */
-+#endif /* x86 */
-=20
- #if ia64
-   regs =3D (*env)->GetLongArrayElements(env, array, &isCopy);
-diff --git openjdk/hotspot/agent/src/os/linux/Makefile =
openjdk/hotspot/agent/src/os/linux/Makefile
-index a16f3a7..85fecb1 100644
---- openjdk/hotspot/agent/src/os/linux/Makefile
-+++ openjdk/hotspot/agent/src/os/linux/Makefile
-@@ -22,7 +22,7 @@
- # =20
- #
-=20
--ARCH :=3D $(shell if ([ `uname -m` =3D "ia64" ])  ; then echo ia64 ; =
elif ([ `uname -m` =3D "x86_64" ]) ; then echo amd64; elif ([ `uname -m` =
=3D "sparc64" ]) ; then echo sparc; else echo i386 ; fi )
-+ARCH :=3D $(shell if ([ `uname -m` =3D "ia64" ])  ; then echo ia64 ; =
elif ([ `uname -m` =3D "x86_64" ]) ; then echo amd64; elif ([ `uname -m` =
=3D "sparc64" ]) ; then echo sparc; else echo x86 ; fi )
- GCC      =3D gcc$(GCC_SUFFIX)
-=20
- JAVAH    =3D ${JAVA_HOME}/bin/javah
-diff --git openjdk/hotspot/agent/src/os/linux/ps_core.c =
openjdk/hotspot/agent/src/os/linux/ps_core.c
-index 3562f2d..47ab01b 100644
---- openjdk/hotspot/agent/src/os/linux/ps_core.c
-+++ openjdk/hotspot/agent/src/os/linux/ps_core.c
-@@ -540,7 +540,7 @@ static bool core_handle_prstatus(struct =
ps_prochandle* ph, const char* buf, size
-=20
-    if (is_debug()) {
-       print_debug("integer regset\n");
--#ifdef i386
-+#ifdef x86
-       // print the regset
-       print_debug("\teax =3D 0x%x\n", newthr->regs.eax);
-       print_debug("\tebx =3D 0x%x\n", newthr->regs.ebx);
-diff --git openjdk/hotspot/make/defs.make =
openjdk/hotspot/make/defs.make
-index 83ddd1a..c20c7eb 100644
---- openjdk/hotspot/make/defs.make
-+++ openjdk/hotspot/make/defs.make
-@@ -207,7 +207,7 @@ ifneq ($(OSNAME),windows)
-     ifdef LP64
-       BUILDARCH =3D amd64
-     else
--      BUILDARCH =3D i486
-+      BUILDARCH =3D x86
-     endif
-   endif
-   ifeq ($(BUILDARCH), sparc)
-@@ -218,7 +218,7 @@ ifneq ($(OSNAME),windows)
-=20
-   # LIBARCH is 1:1 mapping from BUILDARCH
-   LIBARCH         =3D $(LIBARCH/$(BUILDARCH))
--  LIBARCH/i486    =3D i386
-+  LIBARCH/x86     =3D x86
-   LIBARCH/amd64   =3D amd64
-   LIBARCH/sparc   =3D sparc
-   LIBARCH/sparcv9 =3D sparcv9
-diff --git openjdk/hotspot/make/jprt.config =
openjdk/hotspot/make/jprt.config
-index bc82543..4a1ef4e 100644
---- openjdk/hotspot/make/jprt.config
-+++ openjdk/hotspot/make/jprt.config
-@@ -111,7 +111,7 @@ elif [ "${osname}" =3D Linux ] ; then
-     # LINUX: X86, AMD64
-     osarch=3D`uname -m`
-     if [ "${osarch}" =3D i686 ] ; then
--	linux_arch=3Di586
-+	linux_arch=3Dx86
-     elif [ "${osarch}" =3D x86_64 ] ; then
- 	linux_arch=3Damd64
-     fi
-diff --git openjdk/hotspot/make/jprt.properties =
openjdk/hotspot/make/jprt.properties
-index eb2ce82..7193de0 100644
---- openjdk/hotspot/make/jprt.properties
-+++ openjdk/hotspot/make/jprt.properties
-@@ -70,7 +70,7 @@ jprt.my.solaris.x64.jdk6u10=3Dsolaris_x64_5.10
- jprt.my.solaris.x64.jdk6u14=3Dsolaris_x64_5.10
- =
jprt.my.solaris.x64=3D${jprt.my.solaris.x64.${jprt.tools.default.release}}=

-=20
--jprt.my.linux.i586=3Dlinux_i586
-+jprt.my.linux.x86=3Dlinux_x86
- jprt.my.linux.x64=3Dlinux_x64
- jprt.my.windows.i586=3Dwindows_i586
- jprt.my.windows.x64=3Dwindows_x64
-@@ -201,30 +201,30 @@ jprt.my.solaris.i586.test.targets=3D \
-     ${jprt.my.solaris.i586}-{product|fastdebug}-{c1|c2}-scimark_2, \
-     ${jprt.my.solaris.i586}-{product|fastdebug}-{c1|c2}-scimark_3
-=20
--jprt.my.linux.i586.test.targets =3D \
--    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-jvm98, \
--    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-scimark, \
--    ${jprt.my.linux.i586}-product-c1-runThese_Xcomp, \
--    ${jprt.my.linux.i586}-product-c1-runThese_Xcomp_2, \
--    ${jprt.my.linux.i586}-product-c1-runThese_Xcomp_3, \
--    ${jprt.my.linux.i586}-fastdebug-c1-runThese_Xshare, \
--    ${jprt.my.linux.i586}-fastdebug-c2-runThese_Xcomp, \
--    ${jprt.my.linux.i586}-fastdebug-c2-runThese_Xcomp_2, \
--    =
${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_default, \
--    =
${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_SerialGC, \
--    =
${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_ParallelGC, \
--    =
${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_ParNewGC, \
--    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_CMS, \
--    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_default, \
--    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_SerialGC, \
--    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_ParallelGC, \
--    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_ParNewGC, \
--    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_CMS, \
--    ${jprt.my.linux.i586}-{product|fastdebug}-c1-jbb_default, \
--    ${jprt.my.linux.i586}-{product|fastdebug}-c1-jbb_ParallelGC, \
--    ${jprt.my.linux.i586}-{product|fastdebug}-c1-jbb_CMS, \
--    ${jprt.my.linux.i586}-{product|fastdebug}-c2-scimark_2, \
--    ${jprt.my.linux.i586}-{product|fastdebug}-c2-scimark_3
-+jprt.my.linux.x86.test.targets =3D \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-jvm98, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-scimark, \
-+    ${jprt.my.linux.x86}-product-c1-runThese_Xcomp, \
-+    ${jprt.my.linux.x86}-product-c1-runThese_Xcomp_2, \
-+    ${jprt.my.linux.x86}-product-c1-runThese_Xcomp_3, \
-+    ${jprt.my.linux.x86}-fastdebug-c1-runThese_Xshare, \
-+    ${jprt.my.linux.x86}-fastdebug-c2-runThese_Xcomp, \
-+    ${jprt.my.linux.x86}-fastdebug-c2-runThese_Xcomp_2, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_default, =
\
-+    =
${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_SerialGC, \
-+    =
${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_ParallelGC, \
-+    =
${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_ParNewGC, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_CMS, \
-+    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_default, \
-+    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_SerialGC, \
-+    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_ParallelGC, \
-+    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_ParNewGC, \
-+    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_CMS, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-c1-jbb_default, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-c1-jbb_ParallelGC, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-c1-jbb_CMS, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-c2-scimark_2, \
-+    ${jprt.my.linux.x86}-{product|fastdebug}-c2-scimark_3
-=20
- jprt.my.linux.x64.test.targets =3D \
-     ${jprt.my.linux.x64}-{product|fastdebug}-c2-jvm98, \
-@@ -294,7 +294,7 @@ jprt.test.targets =3D \
-   ${jprt.my.solaris.sparcv9.test.targets}, \
-   ${jprt.my.solaris.i586.test.targets}, \
-   ${jprt.my.solaris.x64.test.targets}, \
--  ${jprt.my.linux.i586.test.targets}, \
-+  ${jprt.my.linux.x86.test.targets}, \
-   ${jprt.my.linux.x64.test.targets}, \
-   ${jprt.my.windows.i586.test.targets}, \
-   ${jprt.my.windows.x64.test.targets}
-diff --git openjdk/hotspot/make/linux/build.sh =
openjdk/hotspot/make/linux/build.sh
-index e317fdd..5d3b1ff 100644
---- openjdk/hotspot/make/linux/build.sh
-+++ openjdk/hotspot/make/linux/build.sh
-@@ -43,7 +43,7 @@ esac
-=20
- case `uname -m` in
-   i386|i486|i586|i686)
--    mach=3Di386
-+    mach=3Dx86
-     ;;
-   *)
-     echo "Unsupported machine: " `uname -m`
-diff --git openjdk/hotspot/make/linux/makefiles/buildtree.make =
openjdk/hotspot/make/linux/makefiles/buildtree.make
-index add9823..cbbf81f 100644
---- openjdk/hotspot/make/linux/makefiles/buildtree.make
-+++ openjdk/hotspot/make/linux/makefiles/buildtree.make
-@@ -30,7 +30,7 @@
- # The macros ARCH, GAMMADIR, OS_FAMILY and VARIANT must be defined in =
the
- # environment or on the command-line:
- #
--# ARCH		- sparc, i486, ... HotSpot cpu and os_cpu source =
directory
-+# ARCH		- sparc, x86, ... HotSpot cpu and os_cpu source =
directory
- # BUILDARCH     - build directory
- # LIBARCH       - the corresponding directory in JDK/JRE
- # GAMMADIR	- top of workspace
-@@ -316,7 +316,7 @@ NO_JAVA_HOME_MSG	=3D \
- DATA_MODE =3D $(DATA_MODE/$(BUILDARCH))
- JAVA_FLAG =3D $(JAVA_FLAG/$(DATA_MODE))
-=20
--DATA_MODE/i486    =3D 32
-+DATA_MODE/x86     =3D 32
- DATA_MODE/sparc   =3D 32
- DATA_MODE/sparcv9 =3D 64
- DATA_MODE/amd64   =3D 64
-diff --git openjdk/hotspot/make/linux/makefiles/cscope.make =
openjdk/hotspot/make/linux/makefiles/cscope.make
-index 113d4f8..d3f06cb 100644
---- openjdk/hotspot/make/linux/makefiles/cscope.make
-+++ openjdk/hotspot/make/linux/makefiles/cscope.make
-@@ -78,7 +78,7 @@ endif
- # Processor-specific files for other processors are excluded by =
default.  Use
- # CS_CPU=3Dx to include platform-specific files for other platforms.
- ifndef	CS_CPU
--CS_CPU		=3D i486 sparc amd64 ia64
-+CS_CPU		=3D x86 sparc amd64 ia64
- CS_PRUNE_CPU	=3D $(patsubst %,-o -name '*%*',$(filter-out =
${SRCARCH},${CS_CPU}))
- endif
-=20
-diff --git openjdk/hotspot/make/linux/makefiles/defs.make =
openjdk/hotspot/make/linux/makefiles/defs.make
-index 9131c79..138dfb3 100644
---- openjdk/hotspot/make/linux/makefiles/defs.make
-+++ openjdk/hotspot/make/linux/makefiles/defs.make
-@@ -85,6 +85,14 @@ ifeq ($(ARCH), sparc)
-   HS_ARCH          =3D sparc
- endif
-=20
-+# x86
-+ifeq ($(findstring 86,$(ARCH)), 86)
-+  ARCH_DATA_MODEL  =3D 32
-+  PLATFORM         =3D linux-x86
-+  VM_PLATFORM      =3D linux_x86
-+  HS_ARCH          =3D x86
-+endif
-+
- # x86_64
- ifeq ($(ARCH), x86_64)=20
-   ifeq ($(ARCH_DATA_MODEL), 64)
-@@ -95,22 +103,12 @@ ifeq ($(ARCH), x86_64)
-     HS_ARCH         =3D x86
-   else
-     ARCH_DATA_MODEL =3D 32
--    PLATFORM        =3D linux-i586
--    VM_PLATFORM     =3D linux_i486
-+    PLATFORM        =3D linux-x86
-+    VM_PLATFORM     =3D linux_x86
-     HS_ARCH         =3D x86
--    # We have to reset ARCH to i686 since SRCARCH relies on it
--    ARCH            =3D i686  =20
-   endif
- endif
-=20
--# i686
--ifeq ($(ARCH), i686)
--  ARCH_DATA_MODEL  =3D 32
--  PLATFORM         =3D linux-i586
--  VM_PLATFORM      =3D linux_i486
--  HS_ARCH          =3D x86
--endif
--
- JDK_INCLUDE_SUBDIR=3Dlinux
-=20
- # FIXUP: The subdirectory for a debug build is NOT the same on all =
platforms
-diff --git openjdk/hotspot/make/linux/makefiles/gcc.make =
openjdk/hotspot/make/linux/makefiles/gcc.make
-index a2c24bc..27bad01 100644
---- openjdk/hotspot/make/linux/makefiles/gcc.make
-+++ openjdk/hotspot/make/linux/makefiles/gcc.make
-@@ -77,7 +77,7 @@ CFLAGS +=3D -fcheck-new
- CFLAGS +=3D -g
-=20
- ARCHFLAG =3D $(ARCHFLAG/$(BUILDARCH))
--ARCHFLAG/i486    =3D -m32 -march=3Di586
-+ARCHFLAG/x86    =3D -m32
- ARCHFLAG/amd64   =3D -m64
- ARCHFLAG/ia64    =3D
- ARCHFLAG/sparc   =3D -m32 -mcpu=3Dv9
-diff --git openjdk/hotspot/make/linux/makefiles/sparcWorks.make =
openjdk/hotspot/make/linux/makefiles/sparcWorks.make
-index 0a9f75b..2e29bb9 100644
---- openjdk/hotspot/make/linux/makefiles/sparcWorks.make
-+++ openjdk/hotspot/make/linux/makefiles/sparcWorks.make
-@@ -30,7 +30,7 @@ CC  =3D cc
- AS  =3D $(CC) -c
-=20
- ARCHFLAG =3D $(ARCHFLAG/$(BUILDARCH))
--ARCHFLAG/i486    =3D -m32
-+ARCHFLAG/x86    =3D -m32
- ARCHFLAG/amd64   =3D -m64
-=20
- CFLAGS     +=3D $(ARCHFLAG)
-diff --git openjdk/hotspot/make/linux/platform_i486 =
openjdk/hotspot/make/linux/platform_i486
-deleted file mode 100644
-index 610ac91..0000000
---- openjdk/hotspot/make/linux/platform_i486
-+++ /dev/null
-@@ -1,15 +0,0 @@
--os_family =3D linux
--
--arch =3D x86
--
--arch_model =3D x86_32
--
--os_arch =3D linux_x86
--
--os_arch_model =3D linux_x86_32
--
--lib_arch =3D i386
--
--compiler =3D gcc
--
--sysdefs =3D -DLINUX -D_GNU_SOURCE -DIA32
-diff --git openjdk/hotspot/make/linux/platform_i486.suncc =
openjdk/hotspot/make/linux/platform_i486.suncc
-deleted file mode 100644
-index 325a3fe..0000000
---- openjdk/hotspot/make/linux/platform_i486.suncc
-+++ /dev/null
-@@ -1,17 +0,0 @@
--os_family =3D linux
--
--arch =3D x86
--
--arch_model =3D x86_32
--
--os_arch =3D linux_x86
--
--os_arch_model =3D linux_x86_32
--
--lib_arch =3D i386
--
--compiler =3D sparcWorks
--
--gnu_dis_arch =3D i386
--
--sysdefs =3D -DLINUX -DSPARC_WORKS -D_GNU_SOURCE -DIA32
-diff --git openjdk/hotspot/make/linux/platform_x86 =
openjdk/hotspot/make/linux/platform_x86
-new file mode 100644
-index 0000000..5c613fe
---- /dev/null
-+++ openjdk/hotspot/make/linux/platform_x86
-@@ -0,0 +1,15 @@
-+os_family =3D linux
-+
-+arch =3D x86
-+
-+arch_model =3D x86_32
-+
-+os_arch =3D linux_x86
-+
-+os_arch_model =3D linux_x86_32
-+
-+lib_arch =3D x86
-+
-+compiler =3D gcc
-+
-+sysdefs =3D -DLINUX -D_GNU_SOURCE -DIA32
-diff --git openjdk/hotspot/make/linux/platform_x86.suncc =
openjdk/hotspot/make/linux/platform_x86.suncc
-new file mode 100644
-index 0000000..717fc75
---- /dev/null
-+++ openjdk/hotspot/make/linux/platform_x86.suncc
-@@ -0,0 +1,17 @@
-+os_family =3D linux
-+
-+arch =3D x86
-+
-+arch_model =3D x86_32
-+
-+os_arch =3D linux_x86
-+
-+os_arch_model =3D linux_x86_32
-+
-+lib_arch =3D x86
-+
-+compiler =3D sparcWorks
-+
-+gnu_dis_arch =3D x86
-+
-+sysdefs =3D -DLINUX -DSPARC_WORKS -D_GNU_SOURCE -DIA32
-diff --git openjdk/hotspot/src/os/linux/launcher/java_md.c =
openjdk/hotspot/src/os/linux/launcher/java_md.c
-index 50a86cd..48141be 100644
---- openjdk/hotspot/src/os/linux/launcher/java_md.c
-+++ openjdk/hotspot/src/os/linux/launcher/java_md.c
-@@ -56,8 +56,8 @@
-  * models is supported, then DUAL_MODE is defined.  When DUAL_MODE is
-  * defined, the architecture names for the narrow and wide version of
-  * the architecture are defined in BIG_ARCH and SMALL_ARCH.  Currently
-- * only Solaris on sparc/sparcv9 and i586/amd64 is DUAL_MODE; linux
-- * i586/amd64 could be defined as DUAL_MODE but that is not the
-+ * only Solaris on sparc/sparcv9 and x86/amd64 is DUAL_MODE; linux
-+ * x86/amd64 could be defined as DUAL_MODE but that is not the
-  * current policy.
-  */
-=20
-@@ -75,8 +75,8 @@
-=20
- #else /* 32-bit data model */
-=20
--#  ifdef i586
--#    define ARCH "i386"
-+#  ifdef x86
-+#    define ARCH "x86"
- #  elif defined(__sparc)
- #    define ARCH "sparc"
- #  endif
-@@ -90,7 +90,7 @@
- #    define SMALL_ARCH "sparc"
- #  else
- #    define BIG_ARCH "amd64"
--#    define SMALL_ARCH "i386"
-+#    define SMALL_ARCH "x86"
- #  endif
- #  include <sys/systeminfo.h>
- #  include <sys/elf.h>
-@@ -1103,7 +1103,7 @@ void PrintMachineDependentOptions() {
-  * This code is somewhat more confused with #ifdef's than we'd
-  * like because this file is used by both Solaris and Linux
-  * platforms, and so needs to be parameterized for SPARC and
-- * i586 hardware.  The other Linux platforms (amd64 and ia64)
-+ * x86 hardware.  The other Linux platforms (amd64 and ia64)
-  * don't even ask this question, because they only come with
-  * server JVMs.  */
-=20
-@@ -1168,11 +1168,11 @@ solaris_sparc_ServerClassMachine(void) {
-=20
- #endif /* __sun && __sparc */
-=20
--#if defined(__sun) && defined(i586)
-+#if defined(__sun) && defined(x86)
-=20
- /*
-  * A utility method for asking the CPU about itself.
-- * There's a corresponding version of linux-i586
-+ * There's a corresponding version of linux-x86
-  * because the compilers are different.
-  */
- void
-@@ -1218,13 +1218,13 @@ get_cpuid(uint32_t arg,
- #endif
- }
-=20
--#endif /* __sun && i586 */
-+#endif /* __sun && x86 */
-=20
--#if defined(__linux__) && defined(i586)
-+#if defined(__linux__) && defined(x86)
-=20
- /*
-  * A utility method for asking the CPU about itself.
-- * There's a corresponding version of solaris-i586
-+ * There's a corresponding version of solaris-x86
-  * because the compilers are different.
-  */
- void
-@@ -1286,11 +1286,11 @@ get_cpuid(uint32_t arg,
- #endif
- }
-=20
--#endif /* __linux__ && i586 */
-+#endif /* __linux__ && x86 */
-=20
--#ifdef i586
-+#ifdef x86
- /*
-- * Routines shared by solaris-i586 and linux-i586.
-+ * Routines shared by solaris-x86 and linux-x86.
-  */
-=20
- enum HyperThreadingSupport_enum {
-@@ -1430,11 +1430,11 @@ physical_processors(void) {
-   return result;
- }
-=20
--#endif /* i586 */
-+#endif /* x86 */
-=20
--#if defined(__sun) && defined(i586)
-+#if defined(__sun) && defined(x86)
-=20
--/* The definition of a server-class machine for solaris-i586/amd64 */
-+/* The definition of a server-class machine for solaris-x86/amd64 */
- jboolean
- solaris_i586_ServerClassMachine(void) {
-   jboolean            result            =3D JNI_FALSE;
-@@ -1463,11 +1463,11 @@ solaris_i586_ServerClassMachine(void) {
-   return result;
- }
-=20
--#endif /* __sun && i586 */
-+#endif /* __sun && x86 */
-=20
--#if defined(__linux__) && defined(i586)
-+#if defined(__linux__) && defined(x86)
-=20
--/* The definition of a server-class machine for linux-i586 */
-+/* The definition of a server-class machine for linux-x86 */
- jboolean
- linux_i586_ServerClassMachine(void) {
-   jboolean            result            =3D JNI_FALSE;
-@@ -1496,7 +1496,7 @@ linux_i586_ServerClassMachine(void) {
-   return result;
- }
-=20
--#endif /* __linux__ && i586 */
-+#endif /* __linux__ && x86 */
-=20
- /* Dispatch to the platform-specific definition of "server-class" */
- jboolean
-@@ -1504,9 +1504,9 @@ ServerClassMachine(void) {
-   jboolean result =3D JNI_FALSE;
- #if   defined(__sun) && defined(__sparc)
-   result =3D solaris_sparc_ServerClassMachine();
--#elif defined(__sun) && defined(i586)
-+#elif defined(__sun) && defined(x86)
-   result =3D solaris_i586_ServerClassMachine();
--#elif defined(__linux__) && defined(i586)
-+#elif defined(__linux__) && defined(x86)
-   result =3D linux_i586_ServerClassMachine();
- #else
-   if (_launcher_debug) {
-diff --git openjdk/hotspot/src/os/linux/vm/os_linux.cpp =
openjdk/hotspot/src/os/linux/vm/os_linux.cpp
-index b2b3162..a4bbe70 100644
---- openjdk/hotspot/src/os/linux/vm/os_linux.cpp
-+++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp
-@@ -164,7 +164,7 @@ bool os::have_special_privileges() {
- // i386: 224, ia64: 1105, amd64: 186, sparc 143
- #ifdef __ia64__
- #define SYS_gettid 1105
--#elif __i386__
-+#elif __x86__
- #define SYS_gettid 224
- #elif __amd64__
- #define SYS_gettid 186
-@@ -181,7 +181,7 @@ static char cpu_arch[] =3D ZERO_LIBARCH;
- #elif defined(IA64)
- static char cpu_arch[] =3D "ia64";
- #elif defined(IA32)
--static char cpu_arch[] =3D "i386";
-+static char cpu_arch[] =3D "x86";
- #elif defined(AMD64)
- static char cpu_arch[] =3D "amd64";
- #elif defined(SPARC)
-diff --git openjdk/hotspot/src/share/tools/hsdis/Makefile =
openjdk/hotspot/src/share/tools/hsdis/Makefile
-index 6bdf4b8..fd43c6e 100644
---- openjdk/hotspot/src/share/tools/hsdis/Makefile
-+++ openjdk/hotspot/src/share/tools/hsdis/Makefile
-@@ -32,7 +32,7 @@ BINUTILS	=3D $(shell cd =
../../../../..;pwd)/binutils-2.17-$(LIBARCH)
- endif
-=20
- # Default arch; it is changed below as needed.
--ARCH		=3D i386
-+ARCH		=3D x86
- OS		=3D $(shell uname)
-=20
- CPPFLAGS	+=3D -I$(BINUTILS)/include -I$(BINUTILS)/bfd
-@@ -87,7 +87,7 @@ endif	# SunOS
- LIBARCH		=3D $(ARCH)
- ifdef		LP64
- LIBARCH64/sparc	=3D sparcv9
--LIBARCH64/i386	=3D amd64
-+LIBARCH64/x86	=3D amd64
- LIBARCH64	=3D $(LIBARCH64/$(ARCH))
- ifneq		($(LIBARCH64),)
- LIBARCH		=3D $(LIBARCH64)
-diff --git openjdk/hotspot/src/share/tools/hsdis/hsdis.c =
openjdk/hotspot/src/share/tools/hsdis/hsdis.c
-index 75b7efe..62c692b 100644
---- openjdk/hotspot/src/share/tools/hsdis/hsdis.c
-+++ openjdk/hotspot/src/share/tools/hsdis/hsdis.c
-@@ -383,8 +383,8 @@ static void print_help(struct hsdis_app_data* =
app_data,
-   else
-     disassembler_usage(stderr); /* better than nothing */
-   (*printf_callback)(printf_stream, "  mach=3D<arch>   select =
disassembly mode\n");
--#if defined(LIBARCH_i386) || defined(LIBARCH_amd64)
--  (*printf_callback)(printf_stream, "  mach=3Di386     select 32-bit =
mode\n");
-+#if defined(LIBARCH_x86) || defined(LIBARCH_amd64)
-+  (*printf_callback)(printf_stream, "  mach=3Dx86      select 32-bit =
mode\n");
-   (*printf_callback)(printf_stream, "  mach=3Dx86-64   select 64-bit =
mode\n");
-   (*printf_callback)(printf_stream, "  suffix        always print =
instruction suffix\n");
- #endif
-@@ -406,7 +406,7 @@ static const bfd_arch_info_type* =
find_arch_info(const char* arch_name) {
- static const char* native_arch_name() {
-   const char* res =3D HOTSPOT_LIB_ARCH;
- #ifdef LIBARCH_amd64
--    res =3D "i386:x86-64";
-+    res =3D "x86:x86-64";
- #endif
- #ifdef LIBARCH_sparc
-     res =3D "sparc:v8plusb";
-diff --git openjdk/hotspot/src/share/vm/adlc/Test/i486.ad =
openjdk/hotspot/src/share/vm/adlc/Test/i486.ad
-deleted file mode 100644
-index e69de29..0000000
-diff --git openjdk/hotspot/src/share/vm/adlc/Test/x86.ad =
openjdk/hotspot/src/share/vm/adlc/Test/x86.ad
-new file mode 100644
-index 0000000..e69de29
-diff --git openjdk/hotspot/test/Makefile openjdk/hotspot/test/Makefile
-index 2596d85..c2f3eb9 100644
---- openjdk/hotspot/test/Makefile
-+++ openjdk/hotspot/test/Makefile
-@@ -33,14 +33,14 @@ ifeq ($(OSNAME), SunOS)
-   PLATFORM =3D solaris
-   ARCH =3D $(shell uname -p)
-   ifeq ($(ARCH), i386)
--    ARCH=3Di586
-+    ARCH=3Dx86
-   endif
- endif
- ifeq ($(OSNAME), Linux)
-   PLATFORM =3D linux
-   ARCH =3D $(shell uname -m)
--  ifeq ($(ARCH), i386)
--    ARCH =3D i586
-+  ifeq ($(findstring 86,$(ARCH)), 86)
-+    ARCH =3D x86
-   endif
- endif
- ifeq ($(OSNAME), Windows_NT)
-@@ -55,7 +55,7 @@ ifeq ($(OSNAME), Windows_NT)
-       ifeq ($(word 1, $(PROCESSOR_IDENTIFIER)),EM64T)
-         ARCH =3D x64
-       else
--        ARCH =3D i586
-+        ARCH =3D x86
-       endif
-     endif
-   endif
---=20
-1.6.5
-
-diff --git openjdk/hotspot/make/linux/makefiles/i486.make =
b/hotspot/make/linux/makefiles/i486.make
-deleted file mode 100644
-index 9dd0b44..0000000
---- openjdk/hotspot/make/linux/makefiles/i486.make
-+++ /dev/null
-@@ -1,36 +0,0 @@
--#
--# Copyright 1999-2008 Sun Microsystems, Inc.  All Rights Reserved.
--# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
--#
--# This code is free software; you can redistribute it and/or modify it
--# under the terms of the GNU General Public License version 2 only, as
--# published by the Free Software Foundation.
--#
--# This code is distributed in the hope that it will be useful, but =
WITHOUT
--# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
--# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public =
License
--# version 2 for more details (a copy is included in the LICENSE file =
that
--# accompanied this code).
--#
--# You should have received a copy of the GNU General Public License =
version
--# 2 along with this work; if not, write to the Free Software =
Foundation,
--# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
--#
--# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa =
Clara,
--# CA 95054 USA or visit www.sun.com if you need additional information =
or
--# have any questions.
--# =20
--#
--
--# TLS helper, assembled from .s file
--# Not included in includeDB because it has no dependencies
--Obj_Files +=3D linux_x86_32.o
--
--# The copied fdlibm routines in sharedRuntimeTrig.o must not be =
optimized
--OPT_CFLAGS/sharedRuntimeTrig.o =3D $(OPT_CFLAGS/NOOPT)
--# The copied fdlibm routines in sharedRuntimeTrans.o must not be =
optimized
--OPT_CFLAGS/sharedRuntimeTrans.o =3D $(OPT_CFLAGS/NOOPT)
--# Must also specify if CPU is little endian
--CFLAGS +=3D -DVM_LITTLE_ENDIAN
--
--OPT_CFLAGS/compactingPermGenGen.o =3D -O1
-diff --git openjdk/hotspot/make/linux/makefiles/x86.make =
openjdk/hotspot/make/linux/makefiles/x86.make
-new file mode 100644
-index 0000000..9dd0b44
---- /dev/null
-+++ openjdk/hotspot/make/linux/makefiles/x86.make
-@@ -0,0 +1,36 @@
-+#
-+# Copyright 1999-2008 Sun Microsystems, Inc.  All Rights Reserved.
-+# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
-+#
-+# This code is free software; you can redistribute it and/or modify it
-+# under the terms of the GNU General Public License version 2 only, as
-+# published by the Free Software Foundation.
-+#
-+# This code is distributed in the hope that it will be useful, but =
WITHOUT
-+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
-+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public =
License
-+# version 2 for more details (a copy is included in the LICENSE file =
that
-+# accompanied this code).
-+#
-+# You should have received a copy of the GNU General Public License =
version
-+# 2 along with this work; if not, write to the Free Software =
Foundation,
-+# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
-+#
-+# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa =
Clara,
-+# CA 95054 USA or visit www.sun.com if you need additional information =
or
-+# have any questions.
-+# =20
-+#
-+
-+# TLS helper, assembled from .s file
-+# Not included in includeDB because it has no dependencies
-+Obj_Files +=3D linux_x86_32.o
-+
-+# The copied fdlibm routines in sharedRuntimeTrig.o must not be =
optimized
-+OPT_CFLAGS/sharedRuntimeTrig.o =3D $(OPT_CFLAGS/NOOPT)
-+# The copied fdlibm routines in sharedRuntimeTrans.o must not be =
optimized
-+OPT_CFLAGS/sharedRuntimeTrans.o =3D $(OPT_CFLAGS/NOOPT)
-+# Must also specify if CPU is little endian
-+CFLAGS +=3D -DVM_LITTLE_ENDIAN
-+
-+OPT_CFLAGS/compactingPermGenGen.o =3D -O1
-
diff --git =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-jdk-avoid-cdef-colli=
sion.patch =
b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-jdk-avoid-cdef-colli=
sion.patch
deleted file mode 100644
index 023ce4d..0000000
--- =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-jdk-avoid-cdef-colli=
sion.patch
+++ /dev/null
@@ -1,203 +0,0 @@
-Fixes collisions with standard namespace
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
-
-Index: openjdk/hotspot/src/share/vm/opto/addnode.cpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/share/vm/opto/addnode.cpp	2010-02-16 =
19:11:09.000000000 -0800
-+++ openjdk/hotspot/src/share/vm/opto/addnode.cpp	2012-07-30 =
15:54:25.999551792 -0700
-@@ -27,8 +27,6 @@
- #include "incls/_precompiled.incl"
- #include "incls/_addnode.cpp.incl"
-=20
--#define MAXFLOAT        ((float)3.40282346638528860e+38)
--
- // Classic Add functionality.  This covers all the usual 'add' =
behaviors for
- // an algebraic ring.  Add-integer, add-float, add-double, and =
binary-or are
- // all inherited from this class.  The various identity values are =
supplied
-Index: openjdk/hotspot/src/share/vm/prims/jniCheck.cpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/share/vm/prims/jniCheck.cpp	2010-02-16 =
19:11:10.000000000 -0800
-+++ openjdk/hotspot/src/share/vm/prims/jniCheck.cpp	2012-07-30 =
16:05:20.779549364 -0700
-@@ -80,7 +80,7 @@
-     if (env !=3D xenv) {                                               =
    \
-       NativeReportJNIFatalError(thr, warn_wrong_jnienv);               =
  \
-     }                                                                  =
  \
--    __ENTRY(result_type, header, thr)
-+    VM_ENTRY_BASE(result_type, header, thr)
-=20
-=20
- #define UNCHECKED() (unchecked_jni_NativeInterface)
-Index: openjdk/hotspot/src/share/vm/prims/jvmtiEnter.xsl
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/share/vm/prims/jvmtiEnter.xsl	2010-02-16 =
19:11:10.000000000 -0800
-+++ openjdk/hotspot/src/share/vm/prims/jvmtiEnter.xsl	2012-07-30 =
16:03:50.491550815 -0700
-@@ -424,7 +424,7 @@
-     <xsl:value-of select=3D"$space"/>
-     <xsl:text>ThreadInVMfromNative __tiv(current_thread);</xsl:text>
-     <xsl:value-of select=3D"$space"/>
--    <xsl:text>__ENTRY(jvmtiError, </xsl:text>
-+    <xsl:text>VM_ENTRY_BASE(jvmtiError, </xsl:text>
-     <xsl:apply-templates select=3D"." mode=3D"functionid"/>
-     <xsl:text> , current_thread)</xsl:text>
-     <xsl:value-of select=3D"$space"/>
-Index: openjdk/hotspot/src/share/vm/prims/jvmtiEnv.cpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/share/vm/prims/jvmtiEnv.cpp	2010-02-16 =
19:11:10.000000000 -0800
-+++ openjdk/hotspot/src/share/vm/prims/jvmtiEnv.cpp	2012-07-30 =
16:04:03.683550594 -0700
-@@ -126,7 +126,7 @@
-     // from native so as to resolve the jthread.
-=20
-     ThreadInVMfromNative __tiv(current_thread);
--    __ENTRY(jvmtiError, JvmtiEnv::GetThreadLocalStorage , =
current_thread)
-+    VM_ENTRY_BASE(jvmtiError, JvmtiEnv::GetThreadLocalStorage , =
current_thread)
-     debug_only(VMNativeEntryWrapper __vew;)
-=20
-     oop thread_oop =3D JNIHandles::resolve_external_guard(thread);
-Index: openjdk/hotspot/src/share/vm/prims/jvmtiExport.cpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/share/vm/prims/jvmtiExport.cpp	2010-02-16 =
19:11:10.000000000 -0800
-+++ openjdk/hotspot/src/share/vm/prims/jvmtiExport.cpp	2012-07-30 =
15:59:43.175550785 -0700
-@@ -345,7 +345,7 @@
-     JavaThread* current_thread =3D (JavaThread*) =
ThreadLocalStorage::thread();
-     // transition code: native to VM
-     ThreadInVMfromNative __tiv(current_thread);
--    __ENTRY(jvmtiEnv*, JvmtiExport::get_jvmti_interface, =
current_thread)
-+    VM_ENTRY_BASE(jvmtiEnv*, JvmtiExport::get_jvmti_interface, =
current_thread)
-     debug_only(VMNativeEntryWrapper __vew;)
-=20
-     JvmtiEnv *jvmti_env =3D JvmtiEnv::create_a_jvmti(version);
-Index: openjdk/hotspot/src/share/vm/runtime/interfaceSupport.hpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/share/vm/runtime/interfaceSupport.hpp	=
2010-02-16 19:11:10.000000000 -0800
-+++ openjdk/hotspot/src/share/vm/runtime/interfaceSupport.hpp	=
2012-07-30 16:36:53.391544578 -0700
-@@ -46,7 +46,7 @@
-   }
- };
-=20
--// InterfaceSupport provides functionality used by the __LEAF and =
__ENTRY
-+// InterfaceSupport provides functionality used by the VM_LEAF_BASE =
and VM_ENTRY_BASE
- // macros. These macros are used to guard entry points into the VM and
- // perform checks upon leave of the VM.
-=20
-@@ -391,7 +391,7 @@
-=20
- // LEAF routines do not lock, GC or throw exceptions
-=20
--#define __LEAF(result_type, header)                                  \
-+#define VM_LEAF_BASE(result_type, header)                              =
    \
-   TRACE_CALL(result_type, header)                                    \
-   debug_only(NoHandleMark __hm;)                                     \
-   /* begin of body */
-@@ -399,7 +399,7 @@
-=20
- // ENTRY routines may lock, GC and throw exceptions
-=20
--#define __ENTRY(result_type, header, thread)                         \
-+#define VM_ENTRY_BASE(result_type, header, thread)                     =
    \
-   TRACE_CALL(result_type, header)                                    \
-   HandleMarkCleaner __hm(thread);                                    \
-   Thread* THREAD =3D thread;                                           =
\
-@@ -421,20 +421,20 @@
- #define IRT_ENTRY(result_type, header)                               \
-   result_type header {                                               \
-     ThreadInVMfromJava __tiv(thread);                                \
--    __ENTRY(result_type, header, thread)                             \
-+    VM_ENTRY_BASE(result_type, header, thread)                         =
    \
-     debug_only(VMEntryWrapper __vew;)
-=20
-=20
- #define IRT_LEAF(result_type, header)                                \
-   result_type header {                                               \
--    __LEAF(result_type, header)                                      \
-+    VM_LEAF_BASE(result_type, header)                                  =
    \
-     debug_only(No_Safepoint_Verifier __nspv(true);)
-=20
-=20
- #define IRT_ENTRY_NO_ASYNC(result_type, header)                      \
-   result_type header {                                               \
-     ThreadInVMfromJavaNoAsyncException __tiv(thread);                \
--    __ENTRY(result_type, header, thread)                             \
-+    VM_ENTRY_BASE(result_type, header, thread)                         =
    \
-     debug_only(VMEntryWrapper __vew;)
-=20
- // Another special case for nmethod_entry_point so the nmethod that =
the
-@@ -445,7 +445,7 @@
-   result_type header {                                               \
-     nmethodLocker _nmlock(nm);                                       \
-     ThreadInVMfromJavaNoAsyncException __tiv(thread);                  =
              \
--    __ENTRY(result_type, header, thread)
-+    VM_ENTRY_BASE(result_type, header, thread)
-=20
- #define IRT_END }
-=20
-@@ -455,20 +455,20 @@
- #define JRT_ENTRY(result_type, header)                               \
-   result_type header {                                               \
-     ThreadInVMfromJava __tiv(thread);                                \
--    __ENTRY(result_type, header, thread)                             \
-+    VM_ENTRY_BASE(result_type, header, thread)                         =
    \
-     debug_only(VMEntryWrapper __vew;)
-=20
-=20
- #define JRT_LEAF(result_type, header)                                \
-   result_type header {                                               \
--  __LEAF(result_type, header)                                        \
-+  VM_LEAF_BASE(result_type, header)                                    =
    \
-   debug_only(JRT_Leaf_Verifier __jlv;)
-=20
-=20
- #define JRT_ENTRY_NO_ASYNC(result_type, header)                      \
-   result_type header {                                               \
-     ThreadInVMfromJavaNoAsyncException __tiv(thread);                \
--    __ENTRY(result_type, header, thread)                             \
-+    VM_ENTRY_BASE(result_type, header, thread)                         =
    \
-     debug_only(VMEntryWrapper __vew;)
-=20
- // Same as JRT Entry but allows for return value after the safepoint
-@@ -501,7 +501,7 @@
-     assert( !VerifyJNIEnvThread || (thread =3D=3D Thread::current()), =
"JNIEnv is only valid in same thread"); \
-     ThreadInVMfromNative __tiv(thread);                              \
-     debug_only(VMNativeEntryWrapper __vew;)                          \
--    __ENTRY(result_type, header, thread)
-+    VM_ENTRY_BASE(result_type, header, thread)
-=20
-=20
- // Ensure that the VMNativeEntryWrapper constructor, which can cause
-@@ -521,7 +521,7 @@
-   result_type JNICALL header {                                \
-     JavaThread* thread=3DJavaThread::thread_from_jni_environment(env); =
\
-     assert( !VerifyJNIEnvThread || (thread =3D=3D Thread::current()), =
"JNIEnv is only valid in same thread"); \
--    __LEAF(result_type, header)
-+    VM_LEAF_BASE(result_type, header)
-=20
-=20
- // Close the routine and the extern "C"
-@@ -537,7 +537,7 @@
-     JavaThread* thread=3DJavaThread::thread_from_jni_environment(env); =
\
-     ThreadInVMfromNative __tiv(thread);                              \
-     debug_only(VMNativeEntryWrapper __vew;)                          \
--    __ENTRY(result_type, header, thread)
-+    VM_ENTRY_BASE(result_type, header, thread)
-=20
-=20
- #define JVM_ENTRY_NO_ENV(result_type, header)                        \
-@@ -546,7 +546,7 @@
-     JavaThread* thread =3D (JavaThread*)ThreadLocalStorage::thread();  =
\
-     ThreadInVMfromNative __tiv(thread);                              \
-     debug_only(VMNativeEntryWrapper __vew;)                          \
--    __ENTRY(result_type, header, thread)
-+    VM_ENTRY_BASE(result_type, header, thread)
-=20
-=20
- #define JVM_QUICK_ENTRY(result_type, header)                         \
-@@ -562,7 +562,7 @@
- extern "C" {                                                         \
-   result_type JNICALL header {                                       \
-     VM_Exit::block_if_vm_exited();                                   \
--    __LEAF(result_type, header)
-+    VM_LEAF_BASE(result_type, header)
-=20
-=20
- #define JVM_END } }
diff --git =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-jdk-sane-x86-arch.pa=
tch =
b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-jdk-sane-x86-arch.pa=
tch
deleted file mode 100644
index af8b33e..0000000
--- =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-jdk-sane-x86-arch.pa=
tch
+++ /dev/null
@@ -1,216 +0,0 @@
-=46rom 662e11a8b6017f39ceb6d00dcdbfe11473b56174 Mon Sep 17 00:00:00 =
2001
-From: woglinde <woglinde@rhein.zuhause.netz>
-Date: Fri, 23 Oct 2009 18:06:43 +0200
-Subject: [PATCH] sane-arch2
-
----
- openjdk/jdk/make/common/shared/Compiler-gcc.gmk |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: openjdk/jdk/make/common/shared/Compiler-gcc.gmk
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/common/shared/Compiler-gcc.gmk.orig	=
2010-04-22 12:04:08.000000000 +0200
-+++ openjdk/jdk/make/common/shared/Compiler-gcc.gmk	2010-04-22 =
12:13:53.335169757 +0200
-@@ -85,8 +85,8 @@
-     REQUIRED_CC_VER =3D 3.2
-     REQUIRED_GCC_VER =3D 3.2.*
-   endif
--  ifeq ($(ARCH), i586)
--    # i586
-+  ifeq ($(ARCH), x86)
-+    # x86
-     REQUIRED_CC_VER =3D 3.2
-     REQUIRED_GCC_VER =3D 3.2.1*
-     REQUIRED_GCC_VER_INT =3D 3.2.1-7a
-Index: openjdk/jdk/src/solaris/bin/i586/jvm.cfg
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/solaris/bin/i586/jvm.cfg	2010-02-17 =
04:14:46.000000000 +0100
-+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
-@@ -1,38 +0,0 @@
--# Copyright 2001-2004 Sun Microsystems, Inc.  All Rights Reserved.
--# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
--#
--# This code is free software; you can redistribute it and/or modify it
--# under the terms of the GNU General Public License version 2 only, as
--# published by the Free Software Foundation.  Sun designates this
--# particular file as subject to the "Classpath" exception as provided
--# by Sun in the LICENSE file that accompanied this code.
--#
--# This code is distributed in the hope that it will be useful, but =
WITHOUT
--# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
--# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public =
License
--# version 2 for more details (a copy is included in the LICENSE file =
that
--# accompanied this code).
--#
--# You should have received a copy of the GNU General Public License =
version
--# 2 along with this work; if not, write to the Free Software =
Foundation,
--# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
--#
--# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa =
Clara,
--# CA 95054 USA or visit www.sun.com if you need additional information =
or
--# have any questions.
--#
--# List of JVMs that can be used as an option to java, javac, etc.
--# Order is important -- first in this list is the default JVM.
--# NOTE that this both this file and its format are UNSUPPORTED and
--# WILL GO AWAY in a future release.
--#
--# You may also select a JVM in an arbitrary location with the
--# "-XXaltjvm=3D<jvm_dir>" option, but that too is unsupported
--# and may not be available in a future release.
--#
---client IF_SERVER_CLASS -server
---server KNOWN
---hotspot ALIASED_TO -client
---classic WARN
---native ERROR
---green ERROR
-Index: openjdk/jdk/src/solaris/bin/x86/jvm.cfg
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ openjdk/jdk/src/solaris/bin/x86/jvm.cfg	2010-04-22 =
12:12:10.545603344 +0200
-@@ -0,0 +1,38 @@
-+# Copyright 2001-2004 Sun Microsystems, Inc.  All Rights Reserved.
-+# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
-+#
-+# This code is free software; you can redistribute it and/or modify it
-+# under the terms of the GNU General Public License version 2 only, as
-+# published by the Free Software Foundation.  Sun designates this
-+# particular file as subject to the "Classpath" exception as provided
-+# by Sun in the LICENSE file that accompanied this code.
-+#
-+# This code is distributed in the hope that it will be useful, but =
WITHOUT
-+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
-+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public =
License
-+# version 2 for more details (a copy is included in the LICENSE file =
that
-+# accompanied this code).
-+#
-+# You should have received a copy of the GNU General Public License =
version
-+# 2 along with this work; if not, write to the Free Software =
Foundation,
-+# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
-+#
-+# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa =
Clara,
-+# CA 95054 USA or visit www.sun.com if you need additional information =
or
-+# have any questions.
-+#
-+# List of JVMs that can be used as an option to java, javac, etc.
-+# Order is important -- first in this list is the default JVM.
-+# NOTE that this both this file and its format are UNSUPPORTED and
-+# WILL GO AWAY in a future release.
-+#
-+# You may also select a JVM in an arbitrary location with the
-+# "-XXaltjvm=3D<jvm_dir>" option, but that too is unsupported
-+# and may not be available in a future release.
-+#
-+-client IF_SERVER_CLASS -server
-+-server KNOWN
-+-hotspot ALIASED_TO -client
-+-classic WARN
-+-native ERROR
-+-green ERROR
-Index: openjdk/jdk/make/common/shared/Platform.gmk
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/common/shared/Platform.gmk.orig	2010-04-22 =
12:04:08.000000000 +0200
-+++ openjdk/jdk/make/common/shared/Platform.gmk	2010-04-22 =
12:16:43.848486263 +0200
-@@ -56,8 +56,8 @@
- #     OS_VENDOR                   company name
- #     TEMP_DISK                   /tmp or C:/temp
- #     ARCH_DATA_MODEL             32 or 64
--#     ARCH                        sparc, sparcv9, i586, amd64, or ia64
--#     ARCH_FAMILY                 sparc or i586
-+#     ARCH                        sparc, sparcv9, x86, amd64, or ia64
-+#     ARCH_FAMILY                 sparc or x86
- #     ARCHPROP                    sparc or x86
- #     ARCH_VM_SUBDIR              jre/bin, jre/lib/sparc, etc.
- #     LIBARCH                     sparc, sparcv9, i386, amd64, or ia64
-@@ -124,7 +124,7 @@
-     processor :=3D $(shell uname -p)
-     archExpr =3D case "$(processor)" in  \
-                 i[3-9]86) \
--                    echo i586 \
-+                    echo 586 \
-                     ;; \
-                 sparc*)  \
-                     echo sparc \
-@@ -200,7 +200,7 @@
-   endif
-   archExpr =3D case "$(mach)" in \
-                 i[3-9]86) \
--                    echo i586 \
-+                    echo x86 \
-                     ;; \
-                 ia64) \
-                     echo ia64 \
-@@ -237,7 +237,7 @@
-       ARCH=3Dsparcv9
-     endif
-   else
--    # i586 is 32-bit, amd64 is 64-bit
-+    # x86 is 32-bit, amd64 is 64-bit
-     ifndef ARCH_DATA_MODEL
-       ifeq ($(ARCH), alpha)
-         ARCH_DATA_MODEL=3D64
-@@ -248,7 +248,7 @@
-       ifeq ($(ARCH), arm)
-         ARCH_DATA_MODEL=3D32
-       endif
--      ifeq ($(ARCH), i586)
-+      ifeq ($(ARCH), x86)
-         ARCH_DATA_MODEL=3D32
-       endif
-       ifeq ($(ARCH), ia64)
-@@ -281,12 +281,7 @@
-     endif
-   endif
-=20
--  # Need to maintain the jre/lib/i386 location for 32-bit Intel
--  ifeq ($(ARCH), i586)
--    LIBARCH =3D i386
--  else
--    LIBARCH =3D $(ARCH)
--  endif
-+  LIBARCH =3D $(ARCH)
-=20
-   # Value of Java os.arch property
-   ARCHPROP  =3D $(LIBARCH)
-@@ -378,8 +373,8 @@
-     REQUIRED_WINDOWS_VERSION=3D2000 or Unknown
-     #REQUIRED_WINDOWS_VERSION=3DXP Professional
-     # LIBARCH is used to preserve the jre/lib/i386 directory name for =
32-bit intel
--    ARCH=3Di586
--    LIBARCH=3Di386
-+    ARCH=3Dx86
-+    LIBARCH=3Dx86
-     # Value of Java os.arch property
-     ARCHPROP=3Dx86
-   endif
-Index: =
icedtea6-1.8.11/openjdk/jdk/src/share/native/com/sun/media/sound/SoundDefs=
.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/native/com/sun/media/sound/SoundDefs.h	=
2011-11-12 18:26:21.867320576 +0100
-+++ openjdk/jdk/src/share/native/com/sun/media/sound/SoundDefs.h	=
2011-11-12 19:42:57.310058108 +0100
-@@ -36,7 +36,7 @@
- #define X_ALPHA         1
- #define X_AMD64         2
- #define X_ARM           3
--#define X_I586          4
-+#define X_X86           4
- #define X_IA64          5
- #define X_M68K          6
- #define X_MIPS          7
-Index: icedtea6-1.8.11/openjdk-ecj/jdk/make/javax/sound/SoundDefs.gmk
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/javax/sound/SoundDefs.gmk	2011-11-12 =
18:26:21.870653670 +0100
-+++ openjdk/jdk/make/javax/sound/SoundDefs.gmk	2011-11-12 =
20:00:37.693679490 +0100
-@@ -70,9 +70,9 @@
-     CPPFLAGS +=3D -DX_ARCH=3DX_ARM
-   endif # ARCH arm
-=20
--  ifeq ($(ARCH), i586)
--    CPPFLAGS +=3D -DX_ARCH=3DX_I586
--  endif # ARCH i586
-+  ifeq ($(ARCH), x86)
-+    CPPFLAGS +=3D -DX_ARCH=3DX_X86
-+  endif # ARCH x86
-=20
-   ifeq ($(ARCH), ia64)
-     CPPFLAGS +=3D -DX_ARCH=3DX_IA64
diff --git =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-native-vsyscall.patc=
h =
b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-native-vsyscall.patc=
h
deleted file mode 100644
index 936b211..0000000
--- =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-native-vsyscall.patc=
h
+++ /dev/null
@@ -1,43 +0,0 @@
-Fixes the following compile time error when compiling =
icedtea6-native-1.8.11-r5.3 on a Fedora 20, x86_64:
-os_linux.cpp: In function 'int sched_getcpu_syscall()':
-os_linux.cpp:2431:60: error: expression cannot be used as a function
-   vgetcpu_t vgetcpu =3D (vgetcpu_t)VSYSCALL_ADDR(__NR_vgetcpu);
-
-Fix taken from:
-http://hg.openjdk.java.net/jdk6/jdk6/hotspot/rev/9447b2fb6fcf
-
-Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
-
---- openjdk/hotspot/src/os/linux/vm/os_linux.cpp.orig	2014-10-15 =
14:57:39.681794315 +0200
-+++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2014-10-15 =
15:41:32.398109645 +0200
-@@ -54,10 +54,6 @@
- # include <sys/shm.h>
- # include <link.h>
-=20
--#if __x86_64__
--#include <asm/vsyscall.h>
--#endif
--
- #define MAX_PATH    (2 * K)
-=20
- // for timer info max values which include all bits
-@@ -2427,10 +2423,19 @@
-   int retval =3D -1;
-=20
- #if __x86_64__
-+// Unfortunately we have to bring all these macros here from =
vsyscall.h
-+// to be able to compile on old linuxes.
-+# define __NR_vgetcpu 2
-+# define VSYSCALL_START (-10UL << 20)
-+# define VSYSCALL_SIZE 1024
-+# define VSYSCALL_ADDR(vsyscall_nr) =
(VSYSCALL_START+VSYSCALL_SIZE*(vsyscall_nr))
-   typedef long (*vgetcpu_t)(unsigned int *cpu, unsigned int *node, =
unsigned long *tcache);
-   vgetcpu_t vgetcpu =3D (vgetcpu_t)VSYSCALL_ADDR(__NR_vgetcpu);
-   retval =3D vgetcpu(&cpu, NULL, NULL);
- #elif __i386__
-+# ifndef SYS_getcpu
-+# define SYS_getcpu 318
-+# endif
-   retval =3D syscall(SYS_getcpu, &cpu, NULL, NULL);
- #endif
-=20
diff --git =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-openjdk-remove-curre=
ncy-data-generation-expi.patch =
b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-openjdk-remove-curre=
ncy-data-generation-expi.patch
deleted file mode 100644
index eabee67..0000000
--- =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-openjdk-remove-curre=
ncy-data-generation-expi.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-=46rom 5f5ed54f7f1ed82583f0f42abfa2625a93e96dd9 Mon Sep 17 00:00:00 =
2001
-From: Alex Gonzalez <alex.gonzalez@digi.com>
-Date: Wed, 31 Dec 2014 15:04:10 +0100
-Subject: [PATCH] icedtea: openjdk: remove currency data generation =
expiration
- date.
-
-Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
----
- .../src/build/tools/generatecurrencydata/GenerateCurrencyData.java     =
| 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git =
a/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData=
.java =
b/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData=
.java
-index 29201c25909a..f66f523de5bd 100644
---- =
a/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData=
.java
-+++ =
b/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData=
.java
-@@ -281,9 +281,6 @@ public class GenerateCurrencyData {
-             checkCurrencyCode(newCurrency);
-             String timeString =3D currencyInfo.substring(4, length - =
4);
-             long time =3D format.parse(timeString).getTime();
--            if (Math.abs(time - System.currentTimeMillis()) > ((long) =
10) * 365 * 24 * 60 * 60 * 1000) {
--                throw new RuntimeException("time is more than 10 years =
from present: " + time);
--            }
-             specialCaseCutOverTimes[specialCaseCount] =3D time;
-             specialCaseOldCurrencies[specialCaseCount] =3D =
oldCurrency;
-             =
specialCaseOldCurrenciesDefaultFractionDigits[specialCaseCount] =3D =
getDefaultFractionDigits(oldCurrency);
diff --git =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-sane-x86-arch-name.p=
atch =
b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-sane-x86-arch-name.p=
atch
deleted file mode 100644
index b4c6857..0000000
--- =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-sane-x86-arch-name.p=
atch
+++ /dev/null
@@ -1,38 +0,0 @@
-Index: icedtea6-1.8/acinclude.m4
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.8.orig/acinclude.m4	2010-04-10 21:58:40.000000000 =
+0200
-+++ icedtea6-1.8/acinclude.m4	2010-04-22 10:09:42.752587915 +0200
-@@ -9,11 +9,11 @@
-       ARCHFLAG=3D"-m64"
-       ;;
-     i?86)
--      BUILD_ARCH_DIR=3Di586
--      INSTALL_ARCH_DIR=3Di386
--      JRE_ARCH_DIR=3Di386
-+      BUILD_ARCH_DIR=3Dx86
-+      INSTALL_ARCH_DIR=3Dx86
-+      JRE_ARCH_DIR=3Dx86
-       ARCH_PREFIX=3D${LINUX32}
--      CROSS_TARGET_ARCH=3Di386
-+      CROSS_TARGET_ARCH=3Dx86
-       ARCHFLAG=3D"-m32"
-       ;;
-     alpha*)
-@@ -765,7 +765,7 @@
-   ZERO_LIBARCH=3D"${INSTALL_ARCH_DIR}"
-   dnl can't use AC_CHECK_SIZEOF on multilib
-   case "${ZERO_LIBARCH}" in
--    i386|ppc|s390|sparc)
-+    x86|ppc|s390|sparc)
-       ZERO_BITSPERWORD=3D32
-       ;;
-     amd64|ppc64|s390x|sparc64)
-@@ -777,7 +777,7 @@
-   esac
-   AC_C_BIGENDIAN([ZERO_ENDIANNESS=3D"big"], =
[ZERO_ENDIANNESS=3D"little"])
-   case "${ZERO_LIBARCH}" in
--    i386)
-+    x86)
-       ZERO_ARCHDEF=3D"IA32"
-       ;;
-     ppc*)
diff --git =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-unbreak-float.patch =
b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-unbreak-float.patch
deleted file mode 100644
index 9f875de..0000000
--- =
a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-unbreak-float.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Index: openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h	=
2010-02-02 13:49:39.972718207 +0100
-+++ openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h	=
2010-02-02 13:50:04.635639302 +0100
-@@ -27,13 +27,11 @@
-=20
- #include "jfdlibm.h"
-=20
--#ifdef __NEWVALID       /* special setup for Sun test regime */
- #if defined(i386) || defined(i486) || \
-         defined(intel) || defined(x86) || \
-         defined(i86pc) || defined(_M_IA64) || defined(ia64)
- #define _LITTLE_ENDIAN
- #endif
--#endif
-=20
- #ifdef _LITTLE_ENDIAN
- #define __HI(x) *(1+(int*)&x)
diff --git a/recipes-core/icedtea/icedtea6-native.inc =
b/recipes-core/icedtea/icedtea6-native.inc
deleted file mode 100644
index 43377ce..0000000
--- a/recipes-core/icedtea/icedtea6-native.inc
+++ /dev/null
@@ -1,215 +0,0 @@
-DESCRIPTION =3D "Harness to build the source code from OpenJDK using =
Free Software build tools"
-HOMEPAGE =3D "http://icedtea.classpath.org"
-LICENSE  =3D "GPL-2.0-with-classpath-exception"
-INC_PR =3D "r5"
-
-DEPENDS =3D "virtual/javac-native virtual/java-native classpath-native =
\
-	   xalan-j-native xerces-j-native rhino-native \
-	   ant-native \
-           libx11-native xproto-native libxt-native libxext-native \
-	   freetype-native zlib-native giflib-native jpeg-native \
-           zip-native \
-	  "
-
-inherit native java autotools
-
-JAVA_HOME[unexport] =3D "1"
-
-# No parallel build yet.
-PARALLEL_MAKE =3D ""
-
-# openjdk-ecj looks in /usr/include and /usr/lib for freetype by =
default.
-export ALT_FREETYPE_HEADERS_PATH =3D "${STAGING_INCDIR}/freetype2"
-export ALT_FREETYPE_LIB_PATH =3D "${STAGING_LIBDIR}"
-
-# Configure options compatible with Cacao >=3D 0.99 only!
-EXTRA_OECONF =3D "\
-	--with-parallel-jobs=3D1 \
-	--disable-docs \
-	--disable-pulse-java \
-	--disable-plugin \
-	--disable-xrender \
-	\
-	--with-ecj=3D${STAGING_BINDIR_NATIVE}/ecj-bootstrap \
-	\
-	--with-ecj-jar=3D${STAGING_DATADIR_JAVA_NATIVE}/ecj-bootstrap.jar =
\
-	--with-java=3D${STAGING_BINDIR_NATIVE}/java \
-	--with-javac=3D${STAGING_BINDIR_NATIVE}/ecj-bootstrap \
-	--with-javah=3D${STAGING_BINDIR_NATIVE}/gjavah \
-	--with-jar=3D${STAGING_BINDIR_NATIVE}/fastjar \
-	--with-rmic=3D${STAGING_BINDIR_NATIVE}/grmic \
-	--with-xalan2-jar=3D${STAGING_DATADIR_NATIVE}/java/xalan2.jar \
-	=
--with-xalan2-serializer-jar=3D${STAGING_DATADIR_NATIVE}/java/serializer.j=
ar \
-	--with-xerces2-jar=3D${STAGING_DATADIR_NATIVE}/java/xercesImpl.jar=
 \
-	--with-rhino=3D${STAGING_DATADIR_NATIVE}/java/rhino.jar \
-	--with-openjdk-src-dir=3D${WORKDIR}/openjdk-src-dir \
-	--with-gcj-home=3D${WORKDIR}/fake-jdk \
-	\
-	--enable-openjdk-cross-compilation \
-  "
-
-JDK_DIR =3D "icedtea6-native"
-
-JDK_INSTALL_DIR =3D "${D}/${libdir_jvm}/${JDK_DIR}"
-
-do_configure_prepend() {
-
-        case "${TARGET_ARCH}" in
-                x86_64)
-                        libarch=3Damd64
-                ;;
-                i386|i486|i586|i686)
-                        libarch=3Dx86
-                ;;
-                *)
-                        arch=3D${TARGET_ARCH}
-                        libarch=3D${TARGET_ARCH}
-                ;;
-        esac
-=20
-	chmod -R ug+w ${WORKDIR}/openjdk-src-dir
-	(cd ${WORKDIR}/openjdk-src-dir && sh ${S}/fsg.sh)
-
-	# Automatically copy everything that starts with "icedtea" and =
ends with
-	# ".patch" into the patches directory.
-	find ${WORKDIR} -maxdepth 1 -name "icedtea*.patch" -exec cp {} =
${S}/patches \;
-
-	# Prepare JDK-like directory with Classpath' files which we can =
treat as a
-	# SYSTEM_GCJ_DIR afterwards.
-	mkdir -p ${WORKDIR}/fake-jdk/jre/lib/
-	ln -sf ${STAGING_DATADIR_NATIVE}/classpath/glibj.zip =
${WORKDIR}/fake-jdk/jre/lib/rt.jar
-
-	mkdir -p ${WORKDIR}/fake-jdk/include
-	for i in ${STAGING_INCDIR_NATIVE}/classpath/* ;do
-		test -r $i | continue;
-		bn=3D`basename $i`
-		ln -sf $i ${WORKDIR}/fake-jdk/include/$bn;
-	done
-}
-
-do_configure_append() {
-	oe_runmake patch-ecj
-
-	for F in openjdk-ecj/jdk/make/common/shared/Compiler-gcc.gmk =
openjdk-ecj/corba/make/common/shared/Compiler-gcc.gmk ;
-	do
-		sed -i \
-			-e"s|\$(COMPILER_PATH)gcc\$(GCC_SUFFIX)|${CC}|" =
\
-			-e"s|\$(COMPILER_PATH)gcc\$(GCC_SUFFIX) =
-E|${CPP}|" \
-			-e"s|\$(COMPILER_PATH)g++\$(GCC_SUFFIX)|${CXX}|" =
\
-			-e"s|-mimpure-text||" \
-			$F
-	done
-
-	for F in openjdk-ecj/hotspot/make/linux/makefiles/gcc.make =
openjdk-ecj/hotspot/agent/src/os/linux/Makefile ;
-	do
-		sed -i \
-			-e"s|gcc\$(GCC_SUFFIX)|${CC}|" \
-			-e"s|g++\$(GCC_SUFFIX)|${CXX}|" \
-			$F
-	done
-}
-
-EXTRA_OEMAKE =3D ' \
-                ZIPEXE=3D"${STAGING_BINDIR_NATIVE}/zip" \
-               '
-
-do_compile() {
-	# OpenJDK uses slightly different names for certain arches. We =
need to know
-	#	this to create some files which are expected by the =
build.
-	case "${TARGET_ARCH}" in
-		x86_64)
-			arch=3Damd64
-			libarch=3Damd64
-		;;
-		i386|i486|i586|i686)
-			arch=3Dx86
-			libarch=3Dx86
-		;;
-		*)
-			arch=3D${TARGET_ARCH}
-			libarch=3D${TARGET_ARCH}
-		;;
-	esac
-
-        install -d =
openjdk-ecj/control/build/linux-$arch/hotspot/import/jre/lib
-        if [ $libarch !=3D $arch ]; then
-                # Something is strange with the directoy naming. =
OpenJDK uses both variants.
-                ln -sf $libarch =
openjdk-ecj/control/build/linux-$arch/hotspot/import/jre/lib/$arch
-        fi
-
-
-	# First build hotspot to get a libjvm.so
-	bbnote "1/2 Building Hotspot"
-	oe_runmake hotspot
-
-	# Remove the strange recursive symlink that is created here (If =
it is not there, then just skip this).
-	rm -f bootstrap/ecj/jre/lib/$libarch || true
-
-	# Copy libjvm.so for target into bootstrap/jdk1.6.0/jre/lib
-	install -d bootstrap/ecj/jre/lib/$libarch
-	cp =
openjdk-ecj/build/linux-$arch/j2sdk-image/jre/lib/$libarch/server/libjvm.s=
o bootstrap/ecj/jre/lib/$libarch
-
-	# OpenJDK build expects these files to exist (by creating those =
files we pretend
-	# that stuff was compiled)
-	common_dir=3Dopenjdk-ecj/build/linux-$arch/tmp/sun
-	for D in javax.sound/jsoundalsa sun.awt.X11/xawt sun.awt/jawt;
-	do
-		bbnote "creating $common_dir/$D/obj64/.files_compiled"
-		install -d $common_dir/$D/obj64
-		touch $common_dir/$D/obj64/.files_compiled
-
-		bbnote "creating $common_dir/$D/obj/.files_compiled"
-		install -d $common_dir/$D/obj
-		touch $common_dir/$D/obj/.files_compiled
-	done
-
-        # now use the jni.h from the hotspot
-        #cp=20
-
-	bbnote "2/2 Running make icedtea-against-ecj"
-        # Now cross-compile bootstrap JDK
-        rm stamps/icedtea-against-ecj.stamp stamps/icedtea-ecj.stamp || =
true
-        oe_runmake icedtea-against-ecj
-=09
-	# Creates a nice symlink which allows us to reach the created =
files easily.
-	oe_runmake stamps/bootstrap-directory-symlink.stamp
-}
-
-do_install() {
-	case "${TARGET_ARCH}" in
-		x86_64)
-			JDK_ARCH=3Damd64
-		;;
-		i386|i486|i586|i686)
-			JDK_ARCH=3Dx86
-		;;
-		*)
-			JDK_ARCH=3D${TARGET_ARCH}
-		;;
-	esac
-
-	install -d ${JDK_INSTALL_DIR}
-
-	for F in bootstrap/icedtea/bin bootstrap/icedtea/include =
bootstrap/icedtea/jre bootstrap/icedtea/lib
-	do
-		cp -RL $F ${JDK_INSTALL_DIR}
-	done
-
-	install -d ${JDK_INSTALL_DIR}/include/hpi
-	cp openjdk-ecj/jdk/src/solaris/hpi/export/*.h =
${JDK_INSTALL_DIR}/include/hpi
-	cp openjdk-ecj/jdk/src/share/hpi/export/*.h =
${JDK_INSTALL_DIR}/include/hpi
-
-	install -d ${JDK_INSTALL_DIR}/include/javavm
-	cp openjdk-ecj/jdk/src/share/javavm/export/*.h =
${JDK_INSTALL_DIR}/include/javavm
-	cp openjdk-ecj/jdk/src/solaris/javavm/export/*.h =
${JDK_INSTALL_DIR}/include/javavm
-
-	install -d ${JDK_INSTALL_DIR}/generated
-	cp generated/sun/awt/X11/generator/sizer.32 =
${JDK_INSTALL_DIR}/generated
-
-	# Fix libjvm.so dependency of libfontmanager.so
-	ln -sf server/libjvm.so =
${JDK_INSTALL_DIR}/jre/lib/${JDK_ARCH}/libjvm.so
-	ln -sf server/libjvm.so =
${JDK_INSTALL_DIR}/jre/lib/${JDK_ARCH}/libjvm.so.0
-
-	# Fix missing write permissions on the files.
-	chmod ug+w -R ${JDK_INSTALL_DIR}
-}
diff --git a/recipes-core/icedtea/icedtea6-native_1.8.11.bb =
b/recipes-core/icedtea/icedtea6-native_1.8.11.bb
deleted file mode 100644
index 78d24e6..0000000
--- a/recipes-core/icedtea/icedtea6-native_1.8.11.bb
+++ /dev/null
@@ -1,68 +0,0 @@
-# Note: DO NOT USE THIS PACKAGE. While the build is fine, the resulting =
JDK
-# is unable to compile itself yet (some issue with the built-in XML =
parser).
-require ${PN}.inc
-
-FILESPATH =3D. "${FILE_DIRNAME}/icedtea6-native-${PV}:"
-
-LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"
-
-PR =3D "${INC_PR}.3"
-
-SRC_URI =3D "\
-	=
http://icedtea.wildebeest.org/download/source/icedtea6-${PV}.tar.gz;name=3D=
iced \
-	=
http://download.java.net/openjdk/jdk6/promoted/b18/openjdk-6-src-b18-16_fe=
b_2010.tar.gz;subdir=3Dopenjdk-src-dir;name=3Dojdk \
-        ${JAXWS_URI} \
-        ${JAF_URI} \
-        ${JAXP_URI} \
-	file://disable-library-checks.patch \
-	file://build-hacks-native.patch \
-	file://icedtea-sane-x86-arch-name.patch \
-        file://icedtea-fix-jar-path.patch \
-        =
file://icedtea-openjdk-remove-currency-data-generation-expi.patch;patchdir=
=3D../openjdk-src-dir \
-	${ICEDTEA_PATCHES} \
-	"
-SRC_URI[ojdk.md5sum] =3D "94db01691ab38f98b7d42b2ebf4d5c0b"
-SRC_URI[ojdk.sha256sum] =3D =
"778ea7b323aaa24d3c6e8fe32b8bb0f49040d9e86271859077ada9f9ee3c8ebf"
-SRC_URI[iced.md5sum] =3D "e0edfb08a4eedf1b9f1cef26a9bd4ab4"
-SRC_URI[iced.sha256sum] =3D =
"6eb418ec0609080a71bda16896124d6e1ac23b2f54af52e05fc22c719e12ca29"
-
-JAXWS_URI =3D =
"http://icedtea.wildebeest.org/download/source/drops/jdk6-jaxws-2009_10_27=
.zip;name=3Djaxws"
-SRC_URI[jaxws.md5sum] =3D "3ea5728706169498b722b898a1008acf"
-SRC_URI[jaxws.sha256sum] =3D =
"155ff3be83c980e197621a2fbf7ee34e8e0f536489351a5865cf0e52206245e2"
-
-JAF_URI =3D =
"http://icedtea.wildebeest.org/download/source/drops/jdk6-jaf-2009_10_27.z=
ip;name=3Djaf"
-SRC_URI[jaf.md5sum] =3D "7a50bb540a27cdd0001885630088b758"
-SRC_URI[jaf.sha256sum] =3D =
"fdc51476fc6bcc69ea1f099f33e84601a126bfa8b11c8fa11c25dc574345aa9f"
-
-JAXP_URI =3D =
"http://download.java.net/jaxp/openjdk/jdk6/jdk6-jaxp-2009_10_13.zip;name=3D=
jaxp"
-SRC_URI[jaxp.md5sum] =3D "a2f7b972124cd776ff71e7754eb9a429"
-SRC_URI[jaxp.sha256sum] =3D =
"8714d55de18db48ca9da0ee986202005082f44cf4c215da8683342b70e61792b"
-
-
-ICEDTEA_PATCHES =3D "\
-	file://icedtea-ecj-disable-compilation.patch;apply=3Dno \
-	file://icedtea-ecj-fix-freetype.patch;apply=3Dno \
-	file://icedtea-ecj-fix-zlib.patch;apply=3Dno \
-        file://icedtea-hotspot-make-arch-sane-for-x86.patch;apply=3Dno =
\
-        file://icedtea-jdk-sane-x86-arch.patch;apply=3Dno \
-        file://icedtea-unbreak-float.patch;apply=3Dno \
-        file://icedtea-jdk-avoid-cdef-collision.patch;apply=3Dno \
-	file://icedtea-hotspot-dont-return-booleans.patch;apply=3Dno \
-	file://icedtea-native-vsyscall.patch;apply=3Dno \
-	"
-
-export DISTRIBUTION_PATCHES =3D "\
-	patches/icedtea-ecj-disable-compilation.patch \
-	patches/icedtea-ecj-fix-freetype.patch \
-	patches/icedtea-ecj-fix-zlib.patch \
-	patches/icedtea-hotspot-make-arch-sane-for-x86.patch \
-        patches/icedtea-jdk-sane-x86-arch.patch \
-	patches/icedtea-unbreak-float.patch \
-        patches/icedtea-jdk-avoid-cdef-collision.patch \
-	patches/icedtea-hotspot-dont-return-booleans.patch \
-	patches/icedtea-native-vsyscall.patch \
-	"
-
-EXTRA_OECONF +=3D " =
--with-jaxws-drop-zip=3D${DL_DIR}/jdk6-jaxws-2009_10_27.zip \
-                  --with-jaf-drop-zip=3D${DL_DIR}/jdk6-jaf-2009_10_27.zip=
 \
-                  =
--with-jaxp-drop-zip=3D${DL_DIR}/jdk6-jaxp-2009_10_13.zip "
diff --git a/recipes-core/openjdk/openjdk-6-6b24/build-hacks.patch =
b/recipes-core/openjdk/openjdk-6-6b24/build-hacks.patch
deleted file mode 100644
index 8812cf2..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/build-hacks.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-Index: icedtea6/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6.orig/Makefile.am	2011-12-21 21:24:25.000000000 +0100
-+++ icedtea6/Makefile.am	2011-12-21 22:50:11.649227590 +0100
-@@ -538,6 +538,11 @@
- 	JAVAC=3D"" \
- 	JAVA_HOME=3D"" \
- 	JDK_HOME=3D"" \
-+        OE_CFLAGS=3D"$(OE_CFLAGS)" \
-+        OE_CPPFLAGS=3D"$(OE_CPPFLAGS)" \
-+        OE_CXXFLAGS=3D"$(OE_CXXFLAGS)" \
-+        OE_LDFLAGS=3D"$(OE_LDFLAGS)" \
-+        OE_LAUNCHER_LDFLAGS=3D"$(OE_LAUNCHER_LDFLAGS)" \
- 	DISTRIBUTION_ID=3D"$(DIST_ID)" \
- 	DERIVATIVE_ID=3D"$(ICEDTEA_NAME) =
$(PACKAGE_VERSION)$(ICEDTEA_REV)" \
- 	DEBUG_CLASSFILES=3D"true" \
-@@ -1851,12 +1856,16 @@
- if BUILD_JAMVM
- 	cd jamvm/jamvm && \
- 	LDFLAGS=3D"-Xlinker -z -Xlinker noexecstack" \
--	./autogen.sh --with-java-runtime-library=3Dopenjdk \
--	  --prefix=3D$(abs_top_builddir)/jamvm/install ; \
--	$(MAKE) ; \
--	$(MAKE) install
-+       $(ARCH_PREFIX) ./autogen.sh --with-java-runtime-library=3Dopenjdk=
 \
-+	  --prefix=3D/usr/lib \
-+	  --host=3D$(host_alias) \
-+	  --build=3D$(build_alias) \
-+	  --target=3D$(target_alias)  \
-+	  --with-libtool-sysroot=3D${ALT_FREETYPE_LIB_PATH} ; \
-+	$(ARCH_PREFIX) $(MAKE) ; \
-+	$(ARCH_PREFIX) $(MAKE) install =
DESTDIR=3D$(abs_top_builddir)/jamvm/install
- 	mkdir -p =
$(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/serv=
er
--	cp $(abs_top_builddir)/jamvm/install/lib/libjvm.so =
$(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/serv=
er
-+	cp $(abs_top_builddir)/jamvm/install/usr/lib/lib/libjvm.so =
$(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/serv=
er
- 	ln -sf server =
$(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/clie=
nt
- 	touch =
$(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/serv=
er/Xusage.txt
- 	ln -sf client/libjvm.so =
$(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/libj=
sig.so
-@@ -1874,7 +1883,7 @@
- stamps/add-jamvm.stamp: stamps/icedtea.stamp stamps/jamvm.stamp
- if ADD_JAMVM_BUILD
- 	mkdir -p $(BUILD_JRE_ARCH_DIR)/jamvm
--	install -m 644 jamvm/install/lib/libjvm.so \
-+	install -m 644 jamvm/install/usr/lib/lib/libjvm.so \
- 		$(BUILD_JRE_ARCH_DIR)/jamvm/
- 	printf -- '-jamvm KNOWN\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
- else
-@@ -1918,6 +1927,7 @@
- 	  --host=3D$(host_alias) \
- 	  --build=3D$(build_alias) \
- 	  --target=3D$(target_alias) \
-+	  --with-libtool-sysroot=3D${ALT_FREETYPE_LIB_PATH} \
- 	  --prefix=3D$(abs_top_builddir)/cacao/install \
- 	  --with-java-runtime-library=3Dopenjdk \
- 	  --with-java-runtime-library-prefix=3D$(abs_top_builddir)/openjdk=
 \
-@@ -1984,7 +1994,7 @@
- # configure script arguments, quoted in single quotes
- CONFIGURE_ARGS =3D @CONFIGURE_ARGS@
- ADD_ZERO_CONFIGURE_ARGS =3D \
--	--with-jdk-home=3D$(BUILD_OUTPUT_DIR)/j2sdk-image \
-+	--with-jdk-home=3D$(abs_top_builddir)/bootstrap/jdk1.6.0 \
- 	--enable-zero
- if ADD_SHARK_BUILD
- ADD_ZERO_CONFIGURE_ARGS +=3D \
-Index: icedtea6/javac.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6.orig/javac.in	2011-12-21 21:24:30.000000000 +0100
-+++ icedtea6/javac.in	2011-12-21 22:44:25.860460813 +0100
-@@ -45,7 +45,9 @@
-     my @CLASSPATH =3D ('@ECJ_JAR@');
-     push @CLASSPATH, split /:/, $ENV{"CLASSPATH"} if exists =
$ENV{"CLASSPATH"};
-     $ENV{"CLASSPATH"} =3D join ':', @CLASSPATH;
--    exec '@JAVA@', 'org.eclipse.jdt.internal.compiler.batch.Main', =
@ecj_parms, @ecj_args;
-+    # Compiling hotspot-tools consumes tons of memory and exceeds any =
default
-+    # limits for jamvm and cacao.
-+    exec '@JAVA@', '-Xmx1024m', =
'org.eclipse.jdt.internal.compiler.batch.Main', @ecj_parms, @ecj_args;
- }
- else
- {
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/cacao-arm-ucontext.patch =
b/recipes-core/openjdk/openjdk-6-6b24/cacao-arm-ucontext.patch
deleted file mode 100644
index c21fcf1..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/cacao-arm-ucontext.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Index: cacao-a567bcb7f589/src/vm/jit/arm/linux/md-os.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- cacao-a567bcb7f589/src/vm/jit/arm/linux/md-os.c	2013-01-26 =
21:30:54.206581090 +0100
-+++ cacao-a567bcb7f589/src/vm/jit/arm/linux/md-os.c	2013-01-26 =
21:31:34.406991316 +0100
-@@ -28,19 +28,7 @@
-=20
- #include <stdint.h>
-=20
--#define ucontext broken_glibc_ucontext
--#define ucontext_t broken_glibc_ucontext_t
- #include <ucontext.h>
--#undef ucontext
--#undef ucontext_t
--
--typedef struct ucontext {
--   unsigned long     uc_flags;
--   struct ucontext  *uc_link;
--   stack_t           uc_stack;
--   struct sigcontext uc_mcontext;
--   sigset_t          uc_sigmask;
--} ucontext_t;
-=20
- #define scontext_t struct sigcontext
-=20
diff --git a/recipes-core/openjdk/openjdk-6-6b24/cacao-libtoolize.patch =
b/recipes-core/openjdk/openjdk-6-6b24/cacao-libtoolize.patch
deleted file mode 100644
index 484cb10..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/cacao-libtoolize.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: icedtea6/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6.orig/Makefile.am	2011-12-21 22:58:23.000000000 +0100
-+++ icedtea6/Makefile.am	2011-12-21 23:00:21.405887186 +0100
-@@ -1922,6 +1922,7 @@
- if BUILD_CACAO
- if !USE_SYSTEM_CACAO
- 	cd cacao/cacao && \
-+	rm -f libtool && \
- 	./autogen.sh && \
- 	$(ARCH_PREFIX) ./configure \
- 	  --host=3D$(host_alias) \
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/cacao-loadavg-makefile.patch =
b/recipes-core/openjdk/openjdk-6-6b24/cacao-loadavg-makefile.patch
deleted file mode 100644
index 95cb802..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/cacao-loadavg-makefile.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: icedtea6-1.11.5/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.11.5.orig/Makefile.am	2013-01-27 21:47:24.609119623 =
+0100
-+++ icedtea6-1.11.5/Makefile.am	2013-01-27 21:49:31.250516775 =
+0100
-@@ -1993,6 +1993,8 @@
- if BUILD_CACAO
- if !USE_SYSTEM_CACAO
- 	cd cacao/cacao && \
-+	patch -p1 -N < $(abs_top_srcdir)/patches/cacao-loadavg.patch && =
\
-+	patch -p1 -N < =
$(abs_top_srcdir)/patches/cacao-arm-ucontext.patch && \
- 	rm -f libtool && \
- 	./autogen.sh && \
- 	$(ARCH_PREFIX) ./configure \
diff --git a/recipes-core/openjdk/openjdk-6-6b24/cacao-loadavg.patch =
b/recipes-core/openjdk/openjdk-6-6b24/cacao-loadavg.patch
deleted file mode 100644
index 0fc1a81..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/cacao-loadavg.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Index: cacao-cff92704c4e0/src/vm/os.hpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- cacao-cff92704c4e0/src/vm/os.hpp	2011-12-08 13:40:45.000000000 =
+0100
-+++ cacao-cff92704c4e0/src/vm/os.hpp	2011-12-20 11:42:36.985633921 =
+0100
-@@ -425,7 +425,21 @@
- #if defined(HAVE_GETLOADAVG)
- 	return ::getloadavg(loadavg, nelem);
- #else
--# error getloadavg not available
-+        FILE *LOADAVG;
-+        double avg[3] =3D { 0.0, 0.0, 0.0 };
-+        int i, res =3D -1;;
-+
-+        if ((LOADAVG =3D fopen("/proc/loadavg", "r"))) {
-+                fscanf(LOADAVG, "%lf %lf %lf", &avg[0], &avg[1], =
&avg[2]);
-+                res =3D 0;
-+                fclose(LOADAVG);
-+        }
-+
-+        for (i =3D 0; (i < nelem) && (i < 3); i++) {
-+                loadavg[i] =3D avg[i];
-+        }
-+
-+        return res;
- #endif
- }
-=20
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/fix_hotspot_crosscompile.patch =
b/recipes-core/openjdk/openjdk-6-6b24/fix_hotspot_crosscompile.patch
deleted file mode 100644
index bef699f..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/fix_hotspot_crosscompile.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Index: icedtea6/acinclude.m4
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6.orig/acinclude.m4	2011-12-20 02:25:50.000000000 +0100
-+++ icedtea6/acinclude.m4	2011-12-20 18:02:08.340386576 +0100
-@@ -928,6 +928,21 @@
-   AC_SUBST(ALT_CACAO_SRC_DIR)
- ])
-=20
-+AC_DEFUN([AC_CHECK_WITH_CC_FOR_BUILD],
-+[
-+  AC_MSG_CHECKING(for compiler used for subsidiary programs)
-+  AC_ARG_WITH([cc-for-build],
-+              [AS_HELP_STRING(--with-cc-for-build,specify the compiler =
for subsidiary (helper) programs)],
-+  [
-+    CC_FOR_BUILD=3D"${withval}"
-+  ],
-+  [
-+    CC_FOR_BUILD=3D"\$(CC)"
-+  ])
-+  AC_MSG_RESULT(${CC_FOR_BUILD})
-+  AC_SUBST(CC_FOR_BUILD)
-+])
-+
- AC_DEFUN([IT_WITH_GCJ],
- [
-   AC_MSG_CHECKING([whether to compile ecj natively])
-Index: icedtea6/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6.orig/Makefile.am	2011-12-20 17:59:27.000000000 +0100
-+++ icedtea6/Makefile.am	2011-12-20 18:04:32.972312064 +0100
-@@ -538,6 +538,7 @@
- 	JAVAC=3D"" \
- 	JAVA_HOME=3D"" \
- 	JDK_HOME=3D"" \
-+	CC_FOR_BUILD=3D"$(CC_FOR_BUILD)" \
-         OE_CFLAGS=3D"$(OE_CFLAGS)" \
-         OE_CPPFLAGS=3D"$(OE_CPPFLAGS)" \
-         OE_CXXFLAGS=3D"$(OE_CXXFLAGS)" \
-Index: icedtea6/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6.orig/configure.ac	2011-12-20 02:25:50.000000000 +0100
-+++ icedtea6/configure.ac	2011-12-20 18:03:04.534043885 +0100
-@@ -18,6 +18,8 @@
- AC_PROG_CC
- AC_PROG_CXX
-=20
-+AC_CHECK_WITH_CC_FOR_BUILD
-+
- IT_FIND_TOOL([MAKE], [make])
- IT_FIND_TOOL([GZIP], [gzip])
- IT_FIND_TOOL([ANT], [ant])
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-crosscompile-fix.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-crosscompile-fix.patch
deleted file mode 100644
index f268290..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-crosscompile-fix.patch
+++ /dev/null
@@ -1,270 +0,0 @@
-Index: openjdk/jdk/make/sun/awt/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/sun/awt/Makefile	2009-01-24 =
17:54:57.000000000 +0100
-+++ openjdk/jdk/make/sun/awt/Makefile	2009-01-24 17:55:07.000000000 =
+0100
-@@ -509,10 +509,10 @@
- #
-=20
- ifeq ($(PLATFORM), linux)
--CPPFLAGS +=3D -I$(MOTIF_DIR)/include \
--            -I$(OPENWIN_HOME)/include \
--            -I$(OPENWIN_HOME)/include/X11/extensions \
--            -I$(PLATFORM_SRC)/native/$(PKGDIR)/font=20
-+#CPPFLAGS +=3D -I$(MOTIF_DIR)/include \
-+#            -I$(OPENWIN_HOME)/include \
-+#            -I$(OPENWIN_HOME)/include/X11/extensions \
-+CPPFLAGS +=3D  -I$(PLATFORM_SRC)/native/$(PKGDIR)/font=20
- endif
- CPPFLAGS +=3D -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
-             -I$(SHARE_SRC)/native/$(PKGDIR)/../font \
-@@ -536,7 +536,7 @@
- 	    $(EVENT_MODEL)
-=20
- ifeq ($(PLATFORM), linux)
--LDFLAGS +=3D -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
-+#LDFLAGS +=3D -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
- endif
-=20
- LDFLAGS +=3D -L$(LIBDIR)/$(LIBARCH)/$(TSOBJDIR) \
-Index: openjdk/jdk/make/sun/awt/mawt.gmk
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/sun/awt/mawt.gmk	2009-01-24 =
17:54:57.000000000 +0100
-+++ openjdk/jdk/make/sun/awt/mawt.gmk	2009-01-24 17:55:07.000000000 =
+0100
-@@ -194,8 +194,8 @@
- CPPFLAGS +=3D -I$(CUPS_HEADERS_PATH)
-=20
- ifndef HEADLESS
--CPPFLAGS +=3D -I$(OPENWIN_HOME)/include=20
--LDFLAGS  +=3D -L$(OPENWIN_LIB)
-+#CPPFLAGS +=3D -I$(OPENWIN_HOME)/include=20
-+#LDFLAGS  +=3D -L$(OPENWIN_LIB)
-=20
- endif # !HEADLESS
-=20
-@@ -223,8 +223,8 @@
-=20
- ifeq ($(PLATFORM), linux)
- # Checking for the X11/extensions headers at the additional location
--  CPPFLAGS +=3D -I/X11R6/include/X11/extensions \
--              -I/usr/include/X11/extensions
-+#  CPPFLAGS +=3D -I/X11R6/include/X11/extensions \
-+#              -I/usr/include/X11/extensions
- endif
-=20
- ifeq ($(PLATFORM), solaris)
-Index: openjdk/jdk/make/sun/xawt/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/sun/xawt/Makefile	2009-01-24 =
17:54:57.000000000 +0100
-+++ openjdk/jdk/make/sun/xawt/Makefile	2009-01-24 17:55:07.000000000 =
+0100
-@@ -123,11 +123,12 @@
-         -I$(PLATFORM_SRC)/native/sun/awt=20
-=20
- ifeq ($(PLATFORM), linux)
-+# Very unsuitable for cross-compilation.
- # Allows for builds on Debian GNU Linux, X11 is in a different place=20=

--  CPPFLAGS +=3D -I/usr/X11R6/include/X11/extensions \
--              -I/usr/include/X11/extensions \
--              -I$(MOTIF_DIR)/include \
--              -I$(OPENWIN_HOME)/include=20
-+#  CPPFLAGS +=3D -I/usr/X11R6/include/X11/extensions \
-+#              -I/usr/include/X11/extensions \
-+#              -I$(MOTIF_DIR)/include \
-+#              -I$(OPENWIN_HOME)/include=20
- endif
-=20
- ifeq ($(PLATFORM), solaris)
-Index: openjdk/hotspot/make/linux/makefiles/vm.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/hotspot/make/linux/makefiles/vm.make	2009-01-24 =
17:54:57.000000000 +0100
-+++ openjdk/hotspot/make/linux/makefiles/vm.make	2009-01-24 =
17:55:07.000000000 +0100
-@@ -170,6 +170,7 @@
- LIBS_VM   +=3D $(LLVM_LIBS)
- endif
-=20
-+LFLAGS_VM +=3D $(OE_LDFLAGS)
- LINK_VM =3D $(LINK_LIB.c)
-=20
- # rule for building precompiled header
-Index: openjdk/hotspot/make/linux/makefiles/buildtree.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/hotspot/make/linux/makefiles/buildtree.make	=
2009-01-24 17:54:57.000000000 +0100
-+++ openjdk/hotspot/make/linux/makefiles/buildtree.make	=
2009-01-24 17:55:07.000000000 +0100
-@@ -343,7 +343,7 @@
- 	echo "rm -f Queens.class"; \
- 	echo "\$${JAVA_HOME}/bin/javac -d . =
$(GAMMADIR)/make/test/Queens.java"; \
- 	echo '[ -f gamma_g ] && { gamma=3Dgamma_g; }'; \
--	echo './$${gamma:-gamma} $(TESTFLAGS) Queens < /dev/null'; \
-+	echo 'echo Silently skipping the execution of the gamma =
program'; \
- 	) > $@
- 	$(QUIETLY) chmod +x $@
-=20
-Index: openjdk/corba/make/common/Defs-linux.gmk
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/corba/make/common/Defs-linux.gmk	2009-01-24 =
17:54:57.000000000 +0100
-+++ openjdk/corba/make/common/Defs-linux.gmk	2009-01-24 =
17:55:07.000000000 +0100
-@@ -82,9 +82,9 @@
- CC_NO_OPT      =3D
-=20
- ifeq ($(PRODUCT), java)
--    _OPT =3D $(CC_HIGHER_OPT)
-+    _OPT =3D $(OE_CFLAGS)
- else
--    _OPT =3D $(CC_LOWER_OPT)
-+    _OPT =3D $(OE_CFLAGS)
-     CPPFLAGS_DBG    +=3D -DLOGGING=20
- endif
-=20
-@@ -94,7 +94,7 @@
- #    as the default.
- CFLAGS_REQUIRED_alpha   +=3D -mieee -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_amd64   +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
--CFLAGS_REQUIRED_arm     +=3D -D_LITTLE_ENDIAN
-+CFLAGS_REQUIRED_arm     +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_hppa    +=3D
- CFLAGS_REQUIRED_i586    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_ia64    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
-@@ -221,7 +221,7 @@
- #
- # -L paths for finding and -ljava
- #
--LDFLAGS_OPT     =3D -Xlinker -O1
-+LDFLAGS_OPT     =3D $(OE_LDFLAGS)
- LDFLAGS_COMMON +=3D -L$(LIBDIR)/$(LIBARCH)
- LDFLAGS_COMMON +=3D =
-Wl,-soname=3D$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
-=20
-Index: openjdk/jdk/make/common/Defs-linux.gmk
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/common/Defs-linux.gmk	2009-01-24 =
17:54:57.000000000 +0100
-+++ openjdk/jdk/make/common/Defs-linux.gmk	2009-01-24 =
17:55:07.000000000 +0100
-@@ -92,9 +92,9 @@
- CC_NO_OPT      =3D
-=20
- ifeq ($(PRODUCT), java)
--    _OPT =3D $(CC_HIGHER_OPT)
-+    _OPT =3D $(OE_CFLAGS)
- else
--    _OPT =3D $(CC_LOWER_OPT)
-+    _OPT =3D $(OE_CFLAGS)
-     CPPFLAGS_DBG    +=3D -DLOGGING=20
- endif
-=20
-@@ -104,7 +104,7 @@
- #    as the default.
- CFLAGS_REQUIRED_alpha   +=3D -mieee -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_amd64   +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
--CFLAGS_REQUIRED_arm     +=3D -D_LITTLE_ENDIAN
-+CFLAGS_REQUIRED_arm     +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_hppa    +=3D
- CFLAGS_REQUIRED_i586    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_ia64    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
-@@ -231,7 +231,7 @@
- #
- # -L paths for finding and -ljava
- #
--LDFLAGS_OPT     =3D -Xlinker -O1
-+LDFLAGS_OPT     =3D $(OE_LDFLAGS)
- LDFLAGS_COMMON +=3D -L$(LIBDIR)/$(LIBARCH)
- LDFLAGS_COMMON +=3D =
-Wl,-soname=3D$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
-=20
-Index: openjdk/hotspot/make/linux/makefiles/gcc.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/hotspot/make/linux/makefiles/gcc.make	2009-01-24 =
17:54:57.000000000 +0100
-+++ openjdk/hotspot/make/linux/makefiles/gcc.make	2009-01-24 =
17:55:07.000000000 +0100
-@@ -119,7 +119,7 @@
- CFLAGS_WARN/BYFILE =3D =
$(CFLAGS_WARN/$@)$(CFLAGS_WARN/DEFAULT$(CFLAGS_WARN/$@))=20
-=20
- # The flags to use for an Optimized g++ build
--OPT_CFLAGS +=3D -O3
-+OPT_CFLAGS +=3D $(OE_CFLAGS)
-=20
- # Hotspot uses very unstrict aliasing turn this optimization off
- OPT_CFLAGS +=3D -fno-strict-aliasing
-@@ -148,7 +148,7 @@
- endif
-=20
- # Enable linker optimization
--LFLAGS +=3D -Xlinker -O1
-+LFLAGS +=3D $(OE_LDFLAGS)
-=20
- # Use $(MAPFLAG:FILENAME=3Dreal_file_name) to specify a map file.
- MAPFLAG =3D -Xlinker --version-script=3DFILENAME
-Index: openjdk/hotspot/make/linux/makefiles/launcher.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/hotspot/make/linux/makefiles/launcher.make	=
2009-01-24 17:55:19.000000000 +0100
-+++ openjdk/hotspot/make/linux/makefiles/launcher.make	2009-01-24 =
17:56:05.000000000 +0100
-@@ -44,7 +44,7 @@
-   LIBS_LAUNCHER             +=3D $(STATIC_STDCXX) $(LIBS)
- else
-   LAUNCHER.o                 =3D launcher.o
--  LFLAGS_LAUNCHER           +=3D -L `pwd`
-+  LFLAGS_LAUNCHER           +=3D -L `pwd` $(OE_LAUNCHER_LDFLAGS) =
$(OE_LDFLAGS)
-   LIBS_LAUNCHER             +=3D -l$(JVM) $(LIBS) -lstdc++
- endif
-=20
-Index: icedtea6-1.8.5/build/openjdk/jdk/make/sun/xawt/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/sun/xawt/Makefile	2011-03-14 14:17:03.926207269 =
+0100
-+++ openjdk/jdk/make/sun/xawt/Makefile	2011-03-14 14:30:11.956186631 =
+0100
-@@ -245,7 +245,7 @@
- 	    $(CHMOD) +w $@;\
- 	else	\
- 	    $(ECHO) GENERATING $@; \
--	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
-+	    $(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
- 	fi
- 	@if [ "$(DOCOMPARE)$(suffix $@)" =3D "true.64" ]; then \
- 	    $(ECHO) COMPARING $@ and =
$(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
-diff --git openjdk/jdk/make/launchers/Makefile.launcher =
openjdk/jdk/make/launchers/Makefile.launcher
-index f59a9d6..6edc880 100644
---- openjdk/jdk/make/launchers/Makefile.launcher
-+++ openjdk/jdk/make/launchers/Makefile.launcher
-@@ -152,7 +152,7 @@ endif
- ifeq ($(GUI_TOOL),true)
-   ifneq ($(PLATFORM), windows)
-     # Anything with a GUI needs X11 to be linked in.
--    OTHER_LDLIBS +=3D -L$(OPENWIN_LIB) -lX11
-+    OTHER_LDLIBS +=3D -lX11
-   endif
- endif
-=20
-diff --git openjdk/jdk/make/sun/jawt/Makefile =
openjdk/jdk/make/sun/jawt/Makefile
-index 2021434..9035da7 100644
---- openjdk/jdk/make/sun/jawt/Makefile
-+++ openjdk/jdk/make/sun/jawt/Makefile
-@@ -98,8 +98,7 @@ else # PLATFORM
- #
- # Other extra flags needed for compiling.
- #
--CPPFLAGS +=3D -I$(OPENWIN_HOME)/include \
--	    -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
-+CPPFLAGS +=3D -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
-             -I$(SHARE_SRC)/native/$(PKGDIR)/image \
- 	    -I$(SHARE_SRC)/native/$(PKGDIR)/image/cvutils \
- 	    -I$(SHARE_SRC)/native/$(PKGDIR)/alphacomposite \
-diff --git openjdk/jdk/make/sun/splashscreen/Makefile =
openjdk/jdk/make/sun/splashscreen/Makefile
-index 6693e2a..58d05f1 100644
---- openjdk/jdk/make/sun/splashscreen/Makefile
-+++ openjdk/jdk/make/sun/splashscreen/Makefile
-@@ -63,8 +63,7 @@ CFLAGS +=3D -DSPLASHSCREEN -DPNG_NO_MMX_CODE
-=20
- ifneq ($(PLATFORM), windows)
-   CFLAGS +=3D -DWITH_X11
--  CPPFLAGS +=3D -I$(OPENWIN_HOME)/include =
-I$(OPENWIN_HOME)/include/X11/extensions
--  OTHER_LDLIBS +=3D -L$(OPENWIN_LIB) -lX11 -lXext $(LIBM) -lpng -ljpeg =
-lgif -lz -lpthread
-+  OTHER_LDLIBS +=3D -lX11 -lXext $(LIBM) -lpng -ljpeg -lgif -lz =
-lpthread
- else # PLATFORM
-   CFLAGS +=3D -DWITH_WIN32
-   OTHER_LDLIBS +=3D kernel32.lib user32.lib gdi32.lib=20
-diff --git openjdk/jdk/make/sun/xawt/Makefile =
openjdk/jdk/make/sun/xawt/Makefile
-index 440699b..ffa177d 100644
---- openjdk/jdk/make/sun/xawt/Makefile
-+++ openjdk/jdk/make/sun/xawt/Makefile
-@@ -46,8 +46,6 @@ include FILES_export_unix.gmk
- AUTO_FILES_JAVA_DIRS =3D sun/awt/X11
- AUTO_JAVA_PRUNE =3D WrapperGenerator.java
-=20
--LDFLAGS +=3D -L$(OPENWIN_LIB)
--
- # For Xrender extension.
- ifeq ($(PLATFORM), solaris)
- LDFLAGS +=3D -L/usr/openwin/sfw/lib$(ISA_DIR) =
-R/usr/openwin/sfw/lib$(ISA_DIR)
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-fix-xrender.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-fix-xrender.patch
deleted file mode 100644
index 4bd8b2c..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-fix-xrender.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: openjdk/jdk/src/solaris/native/sun/java2d/x11/XRSurfaceData.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/src/solaris/native/sun/java2d/x11/XRSurfaceData.c	=
2011-10-19 16:56:03.014276748 +0200
-+++ openjdk/jdk/src/solaris/native/sun/java2d/x11/XRSurfaceData.c	=
2011-10-19 16:57:19.942658211 +0200
-@@ -29,7 +29,7 @@
- #include "X11SurfaceData.h"
-=20
- /*#include <xcb/xcb.h>*/
--#include <Xrender.h>
-+#include <X11/extensions/Xrender.h>
-=20
- #ifndef RepeatNone  /* added in 0.10 */
- #define RepeatNone    0
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-hostbuildcc.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-hostbuildcc.patch
deleted file mode 100644
index 5f2c98b..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-hostbuildcc.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: openjdk/hotspot/make/linux/makefiles/rules.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/make/linux/makefiles/rules.make	2010-02-02 =
02:22:33.201668748 +0100
-+++ openjdk/hotspot/make/linux/makefiles/rules.make	2010-02-02 =
02:23:08.480415783 +0100
-@@ -39,6 +39,7 @@
- # $(CC) is the c compiler (cc/gcc), $(CCC) is the c++ compiler =
(CC/g++).
- C_COMPILE       =3D $(CC) $(CPPFLAGS) $(CFLAGS)
- CC_COMPILE      =3D $(CCC) $(CPPFLAGS) $(CFLAGS)
-+CC_HOST_COMPILE  =3D $(BUILD_CC) $(CPPFLAGS) $(CFLAGS)
-=20
- AS.S            =3D $(AS) $(ASFLAGS)
-=20
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-dlvsym-uclibc.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-dlvsym-uclibc.patch
deleted file mode 100644
index 657f722..0000000
--- =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-dlvsym-uclibc.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Index: openjdk/hotspot/src/os/linux/vm/os_linux.cpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2011-12-20 =
19:15:05.000000000 +0100
-+++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2011-12-20 =
19:18:22.411503442 +0100
-@@ -2593,10 +2593,7 @@
- // If we are running with earlier version, which did not have symbol =
versions,
- // we should use the base version.
- void* os::Linux::libnuma_dlsym(void* handle, const char *name) {
--  void *f =3D dlvsym(handle, name, "libnuma_1.1");
--  if (f =3D=3D NULL) {
--    f =3D dlsym(handle, name);
--  }
-+  void *f =3D dlsym(handle, name);
-   return f;
- }
-=20
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-glibc-version.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-glibc-version.patch
deleted file mode 100644
index faa90ea..0000000
--- =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-glibc-version.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Index: icedtea6-1.8/build/openjdk/hotspot/src/os/linux/vm/os_linux.cpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 =
22:22:13.696298239 +0200
-+++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 =
22:24:15.308790737 +0200
-@@ -49,7 +49,6 @@
- # include <string.h>
- # include <syscall.h>
- # include <sys/sysinfo.h>
--# include <gnu/libc-version.h>
- # include <sys/ipc.h>
- # include <sys/shm.h>
- # include <link.h>
-@@ -544,9 +543,7 @@
-      os::Linux::set_glibc_version(str);
-   } else {
-      // _CS_GNU_LIBC_VERSION is not supported, try =
gnu_get_libc_version()
--     static char _gnu_libc_version[32];
--     jio_snprintf(_gnu_libc_version, sizeof(_gnu_libc_version),
--              "glibc %s %s", gnu_get_libc_version(), =
gnu_get_libc_release());
-+     static char _gnu_libc_version[32] =3D "2.9";
-      os::Linux::set_glibc_version(_gnu_libc_version);
-   }
-=20
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-isfinte.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-isfinte.patch
deleted file mode 100644
index 7c5da59..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-isfinte.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: =
icedtea6-1.8/build/openjdk/hotspot/src/share/vm/utilities/globalDefinition=
s_gcc.hpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	=
2010-06-09 21:41:28.576131825 +0200
-+++ openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	=
2010-06-09 21:41:55.555711815 +0200
-@@ -235,8 +235,8 @@
-=20
- // Checking for finiteness
-=20
--inline int g_isfinite(jfloat  f)                 { return finite(f); }
--inline int g_isfinite(jdouble f)                 { return finite(f); }
-+inline int g_isfinite(jfloat  f)                 { return isfinite(f); =
}
-+inline int g_isfinite(jdouble f)                 { return isfinite(f); =
}
-=20
-=20
- // Wide characters
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-isnanf.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-isnanf.patch
deleted file mode 100644
index 494e965..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-isnanf.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Index: =
icedtea6-1.8/build/openjdk/hotspot/src/share/vm/utilities/globalDefinition=
s_gcc.hpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	=
2010-06-09 21:47:12.695674808 +0200
-+++ openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	=
2010-06-09 21:48:08.699007491 +0200
-@@ -220,14 +220,14 @@
- // checking for nanness
- #ifdef SOLARIS
- #ifdef SPARC
--inline int g_isnan(float  f) { return isnanf(f); }
-+inline int g_isnan(float  f) { return __isnanf(f); }
- #else
- // isnanf() broken on Intel Solaris use isnand()
- inline int g_isnan(float  f) { return isnand(f); }
- #endif
- inline int g_isnan(double f) { return isnand(f); }
- #elif LINUX
--inline int g_isnan(float  f) { return isnanf(f); }
-+inline int g_isnan(float  f) { return __isnanf(f); }
- inline int g_isnan(double f) { return isnan(f); }
- #else
- #error "missing platform-specific definition here"
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-loadavg.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-loadavg.patch
deleted file mode 100644
index 7da41fd..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-hotspot-loadavg.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Index: icedtea6-1.8/build/openjdk/hotspot/src/os/linux/vm/os_linux.cpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 =
22:16:09.406334411 +0200
-+++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 =
22:19:38.952152043 +0200
-@@ -4325,7 +4325,22 @@
- // Linux doesn't yet have a (official) notion of processor sets,
- // so just return the system wide load average.
- int os::loadavg(double loadavg[], int nelem) {
--  return ::getloadavg(loadavg, nelem);
-+
-+	FILE *LOADAVG;
-+	double avg[3] =3D { 0.0, 0.0, 0.0 };
-+	int i, res =3D -1;;
-+
-+	if ((LOADAVG =3D fopen("/proc/loadavg", "r"))) {
-+		fscanf(LOADAVG, "%lf %lf %lf", &avg[0], &avg[1], =
&avg[2]);
-+		res =3D 0;
-+		fclose(LOADAVG);
-+	}
-+
-+	for (i =3D 0; (i < nelem) && (i < 3); i++) {
-+		loadavg[i] =3D avg[i];
-+	}
-+
-+	return res;
- }
-=20
- void os::pause() {
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-iconv-uclibc.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-iconv-uclibc.patch
deleted file mode 100644
index 68f8581..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-iconv-uclibc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Index: openjdk/jdk/make/java/npt/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/java/npt/Makefile	2010-06-13 15:11:02.598512448 =
+0200
-+++ openjdk/jdk/make/java/npt/Makefile	2010-06-13 15:11:28.504759286 =
+0200
-@@ -65,6 +65,8 @@
- # We don't want to link against -ljava
- JAVALIB=3D
-=20
-+LDLIBS +=3D -liconv
-+
- # Add -export options to explicitly spell exported symbols
- ifeq ($(PLATFORM), windows)
-   OTHER_LCF +=3D -export:nptInitialize -export:nptTerminate
-Index: icedtea6-1.8/openjdk-ecj/jdk/make/java/instrument/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/java/instrument/Makefile	2010-06-13 =
15:12:14.688505195 +0200
-+++ openjdk/jdk/make/java/instrument/Makefile	2010-06-13 =
15:12:32.641425670 +0200
-@@ -123,6 +123,8 @@
- # We don't want to link against -ljava
- JAVALIB=3D
-=20
-+LDLIBS +=3D -liconv
-+
- #
- # Add to ambient vpath so we pick up the library files
- #
-Index: openjdk/jdk/make/sun/splashscreen/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/sun/splashscreen/Makefile	2010-06-13 =
15:12:48.951840824 +0200
-+++ openjdk/jdk/make/sun/splashscreen/Makefile	2010-06-13 =
15:13:01.191422891 +0200
-@@ -55,6 +55,8 @@
-=20
- JAVALIB=3D
-=20
-+LDLIBS +=3D -liconv
-+
- #
- # C Flags
- #
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-powerpc-atomic64.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-powerpc-atomic64.patch
deleted file mode 100644
index cc5e4e8..0000000
--- =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-powerpc-atomic64.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-http://mail.openjdk.java.net/pipermail/zero-dev/2010-June/000346.html
-
-this cute C code does the same thing on powerpc as the assembly code =
that
-was here before. If the compiler was built with the SPE extensions =
instead
-of traditional FPU and double operations are performed in HW then we =
are
-one step further: The compiler turns this into evldd & evstdd. Voila :)
-
-This C code could also be activated on s390. The compiler turns this =
into
-a single mvc instruction which does the copy operation. I don't know if
-mvc's copy ability is atomic _or_ not and therefore I leave it as it.
-
-Signed-off-by: Sebastian Andrzej Siewior <bigeasy at linutronix.de>
-
-./openjdk-src-dir/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp
-Index: openjdk/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp.org	=
2011-11-14 14:07:32.000000000 -0800
-+++ openjdk/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp	=
2012-07-19 07:28:26.208405923 -0700
-@@ -25,6 +25,16 @@
-=20
- #ifndef OS_CPU_LINUX_ZERO_VM_OS_LINUX_ZERO_HPP
- #define OS_CPU_LINUX_ZERO_VM_OS_LINUX_ZERO_HPP
-+#if defined(PPC) && !defined(_LP64)
-+
-+#ifndef __NO_FPRS__
-+#define ATOMIC64_COPY_THROUGH_DOUBLE 1
-+
-+#elif defined(__SPE__) && !defined(_SOFT_DOUBLE)
-+#define ATOMIC64_COPY_THROUGH_DOUBLE 1
-+
-+#endif
-+#endif
-=20
-   static void setup_fpu() {}
-=20
-@@ -36,12 +46,23 @@
-=20
-   // Atomically copy 64 bits of data
-   static void atomic_copy64(volatile void *src, volatile void *dst) {
--#if defined(PPC) && !defined(_LP64)
--    double tmp;
--    asm volatile ("lfd  %0, 0(%1)\n"
--                  "stfd %0, 0(%2)\n"
--                  : "=3Df"(tmp)
--                  : "b"(src), "b"(dst));
-+#if ATOMIC64_COPY_THROUGH_DOUBLE
-+  /*
-+   * In order to copy 8 bytes atomicly we rely on the trick that some
-+   * architectures can load and store a double as a single operation.
-+   * gcc picks the correct opcode here and with optimization turned on
-+   * all temporary assignments are gone.                       - =
bigeasy
-+   */
-+   union {
-+          double *d;
-+          volatile void *v;
-+   } s, d;
-+
-+   s.v =3D src;
-+   d.v =3D dst;
-+
-+   *d.d =3D *s.d;
-+
- #elif defined(S390) && !defined(_LP64)
-     double tmp;
-     asm volatile ("ld  %0, 0(%1)\n"
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-remove-unused-backtrace.=
patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-remove-unused-backtrace.=
patch
deleted file mode 100644
index 5423fde..0000000
--- =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-remove-unused-backtrace.=
patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Index: openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c	2010-08-05 =
16:45:56.607257503 +0200
-+++ openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c	2010-08-05 =
16:47:19.727254686 +0200
-@@ -27,9 +27,6 @@
- #include <X11/Xutil.h>
- #include <X11/Xos.h>
- #include <X11/Xatom.h>
--#ifdef __linux__
--#include <execinfo.h>
--#endif
-=20
- #include <jvm.h>
- #include <jni.h>
-@@ -689,26 +686,6 @@
-     return ret;
- }
-=20
--#ifdef __linux__
--void print_stack(void)
--{
--  void *array[10];
--  size_t size;
--  char **strings;
--  size_t i;
--
--  size =3D backtrace (array, 10);
--  strings =3D backtrace_symbols (array, size);
--
--  fprintf (stderr, "Obtained %zd stack frames.\n", size);
--
--  for (i =3D 0; i < size; i++)
--     fprintf (stderr, "%s\n", strings[i]);
--
--  free (strings);
--}
--#endif
--
- Window get_xawt_root_shell(JNIEnv *env) {
-   static jclass classXRootWindow =3D NULL;
-   static jmethodID methodGetXRootWindow =3D NULL;
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-rmi-crosscompile.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-rmi-crosscompile.patch
deleted file mode 100644
index acd3e1e..0000000
--- =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-rmi-crosscompile.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git openjdk/jdk/make/com/sun/jmx/Makefile =
openjdk/jdk/make/com/sun/jmx/Makefile
-index bdc1f8f..76f0c00 100644
---- openjdk/jdk/make/com/sun/jmx/Makefile
-+++ openjdk/jdk/make/com/sun/jmx/Makefile
-@@ -102,7 +102,7 @@ FILES_ties   =3D $(subst =
javax/management/remote/rmi/,javax/management/remote/rmi/
- # when available, we need to run with latest rmic version available. =
rmic=20
- # launch tool not built at this stage but we can invoke via rmi class.
-=20
--RMIC_JAVA =3D $(OUTPUTDIR)/bin/java
-+RMIC_JAVA =3D $(BOOTDIR)/bin/java
- # need to treat 64bit solaris differently
- ifeq ($(PLATFORM)-$(LIBARCH), solaris-amd64)
- RMIC_JAVA =3D $(OUTPUTDIR)/bin/amd64/java
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-sizers-crosscompile-hack=
.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-sizers-crosscompile-hack=
.patch
deleted file mode 100644
index 54d6a19..0000000
--- =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-sizers-crosscompile-hack=
.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Disable xawt and jawt along with sizes generation which does not work =
well if
-you cant generated sizes in cross env. So for architectures which dont =
have
-working qemu this is an option
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Inappropriate [Cross-compile specific hack]
-
---- openjdk/jdk/make/sun/xawt/Makefile.khem	2012-07-21 =
23:54:47.396405922 -0700
-+++ openjdk/jdk/make/sun/xawt/Makefile	2012-07-21 23:55:52.032405922 =
-0700
-@@ -245,18 +245,19 @@
- 	    $(SIZER_DIR) $(XLIBTYPES) "sizer" $(subst .,,$(suffix =
$(basename $@)))
-=20
- $(SIZES): $(SIZERS)
--	@if [ "$(DOHACK)$@" =3D "true$(PREDEFINED_SIZES)" ]; then \
--	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
--	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
--	    $(CHMOD) +w $@;\
--	else	\
--	    $(ECHO) GENERATING $@; \
--	    $(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
--	fi
--	@if [ "$(DOCOMPARE)$(suffix $@)" =3D "true.64" ]; then \
--	    $(ECHO) COMPARING $@ and =
$(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
--	    $(DIFF) $@ $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
--	fi=09
-+	touch $(SIZES)
-+#	@if [ "$(DOHACK)$@" =3D "true$(PREDEFINED_SIZES)" ]; then \
-+#	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
-+#	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
-+#	    $(CHMOD) +w $@;\
-+#	else	\
-+#	    $(ECHO) GENERATING $@; \
-+#	    $(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
-+#	fi
-+#	@if [ "$(DOCOMPARE)$(suffix $@)" =3D "true.64" ]; then \
-+#	    $(ECHO) COMPARING $@ and =
$(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
-+#	    $(DIFF) $@ $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
-+#	fi=09
-=20
- $(TEMPDIR)/.gen.wrappers: $(SIZES) $(WRAPPER_GENERATOR_CLASS) =
$(XLIBTYPES)
- 	$(BOOT_JAVA_CMD) -cp $(WRAPPER_GENERATOR_TEMPDIR) =
WrapperGenerator \
---- openjdk/jdk/make/sun/Makefile.khem	2011-11-14 14:11:40.000000000 =
-0800
-+++ openjdk/jdk/make/sun/Makefile	2012-07-22 00:42:04.980409296 =
-0700
-@@ -50,7 +50,7 @@
-     MOTIF_SUBDIRS   =3D motif12 motif21
-   endif
-   HEADLESS_SUBDIR =3D headless
--  XAWT_SUBDIR     =3D xawt
-+  XAWT_SUBDIR     =3D
- endif
-=20
- ifndef OPENJDK
-@@ -65,7 +65,7 @@
- 	  awt splashscreen $(XAWT_SUBDIR) $(MOTIF_SUBDIRS) \
-           $(HEADLESS_SUBDIR) $(DGA_SUBDIR) \
- 	  font jpeg cmm applet rmi beans $(JDBC_SUBDIR) \
--	  jawt text nio launcher management $(ORG_SUBDIR) \
-+	  text nio launcher management $(ORG_SUBDIR) \
-           native2ascii serialver tools jconsole
-=20
- all build clean clobber::
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-unpack-uclibc.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-unpack-uclibc.patch
deleted file mode 100644
index 40564f0..0000000
--- =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-unpack-uclibc.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: openjdk/jdk/make/com/sun/java/pack/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/com/sun/java/pack/Makefile	2010-06-13 =
15:25:21.548426411 +0200
-+++ openjdk/jdk/make/com/sun/java/pack/Makefile	2010-06-13 =
15:25:43.858007543 +0200
-@@ -103,6 +103,7 @@
-   OTHER_LDLIBS +=3D $(LIBCXX) -lc
- # setup the list of libraries to link in...
- ifeq ($(PLATFORM), linux)
-+  OTHER_LDLIBS  +=3D -lpthread
- ifeq ("$(CC_VER_MAJOR)", "3")
-   OTHER_LDLIBS  +=3D -Wl,-Bstatic -lgcc_eh -Wl,-Bdynamic
- endif
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.patch
deleted file mode 100644
index b97745d..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: openjdk/hotspot/make/linux/makefiles/launcher.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/make/linux/makefiles/launcher.make	2011-12-20 =
10:33:37.000000000 +0100
-+++ openjdk/hotspot/make/linux/makefiles/launcher.make	2011-12-20 =
10:37:54.055022618 +0100
-@@ -51,7 +51,7 @@
- else
-   LAUNCHER.o                 =3D launcher.o
-   LFLAGS_LAUNCHER           +=3D -L `pwd`
--  LIBS_LAUNCHER             +=3D -l$(JVM) $(LIBS)
-+  LIBS_LAUNCHER             +=3D -l$(JVM) $(LIBS) -lstdc++
-   ifeq ($(SHARK_BUILD), true)
-     LFLAGS_LAUNCHER +=3D $(LLVM_LDFLAGS)
-     LIBS_LAUNCHER   +=3D $(LLVM_LIBS)
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-libnet-renaming.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-libnet-renaming.patch
deleted file mode 100644
index 024969d..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-libnet-renaming.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-Index: openjdk/jdk/make/java/net/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/java/net/Makefile	2010-07-05 12:28:58.476625401 =
+0200
-+++ openjdk/jdk/make/java/net/Makefile	2010-07-05 12:29:11.876625138 =
+0200
-@@ -25,7 +25,7 @@
-=20
- BUILDDIR =3D ../..
- PACKAGE =3D java.net
--LIBRARY =3D net
-+LIBRARY =3D javanet
- PRODUCT =3D sun
- include $(BUILDDIR)/common/Defs.gmk
-=20
-Index: openjdk/jdk/make/java/nio/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/java/nio/Makefile	2010-07-05 12:31:27.046626250 =
+0200
-+++ openjdk/jdk/make/java/nio/Makefile	2010-07-05 12:32:06.647874890 =
+0200
-@@ -139,11 +139,11 @@
- endif
- ifeq ($(PLATFORM), linux)
- COMPILER_WARNINGS_FATAL=3Dtrue
--OTHER_LDLIBS +=3D -L$(LIBDIR)/$(LIBARCH) -ljava -lnet -lpthread -ldl
-+OTHER_LDLIBS +=3D -L$(LIBDIR)/$(LIBARCH) -ljava -ljavanet -lpthread =
-ldl
- endif
- ifeq ($(PLATFORM), solaris)
- OTHER_LDLIBS +=3D $(JVMLIB) $(LIBSOCKET) -lposix4 -ldl \
--		-L$(LIBDIR)/$(LIBARCH) -ljava -lnet
-+		-L$(LIBDIR)/$(LIBARCH) -ljava -ljavanet
- endif # PLATFORM
-=20
- #
-Index: =
openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.jav=
a
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- =
openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.jav=
a	2010-07-05 17:40:56.467876415 +0200
-+++ =
openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.jav=
a	2010-07-05 17:41:43.326628410 +0200
-@@ -58,7 +58,7 @@
-      */
-     static {
-         java.security.AccessController.doPrivileged(
--                  new sun.security.action.LoadLibraryAction("net"));
-+                  new =
sun.security.action.LoadLibraryAction("javanet"));
-     }
-=20
-     /**
-Index: =
openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java	=
2010-07-05 17:41:01.027875484 +0200
-+++ openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java	=
2010-07-05 17:41:56.826626386 +0200
-@@ -74,7 +74,7 @@
-      */
-     static {
-         java.security.AccessController.doPrivileged(
--                  new sun.security.action.LoadLibraryAction("net"));
-+                  new =
sun.security.action.LoadLibraryAction("javanet"));
-     }
-=20
-     /**
-Index: openjdk/jdk/src/share/classes/java/net/DatagramPacket.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/classes/java/net/DatagramPacket.java	=
2010-07-05 17:41:02.017875980 +0200
-+++ openjdk/jdk/src/share/classes/java/net/DatagramPacket.java	=
2010-07-05 17:42:06.057875677 +0200
-@@ -47,7 +47,7 @@
-      */
-     static {
-         java.security.AccessController.doPrivileged(
--                  new sun.security.action.LoadLibraryAction("net"));
-+                  new =
sun.security.action.LoadLibraryAction("javanet"));
-         init();
-     }
-=20
-Index: openjdk/jdk/src/share/classes/java/net/InetAddress.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/classes/java/net/InetAddress.java	=
2010-07-05 17:41:02.756626429 +0200
-+++ openjdk/jdk/src/share/classes/java/net/InetAddress.java	=
2010-07-05 17:42:15.997875786 +0200
-@@ -230,7 +230,7 @@
-     static {
-         preferIPv6Address =3D =
java.security.AccessController.doPrivileged(
-             new =
GetBooleanAction("java.net.preferIPv6Addresses")).booleanValue();
--        AccessController.doPrivileged(new LoadLibraryAction("net"));
-+        AccessController.doPrivileged(new =
LoadLibraryAction("javanet"));
-         init();
-     }
-=20
-Index: openjdk/jdk/src/share/classes/java/net/NetworkInterface.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/classes/java/net/NetworkInterface.java	=
2010-07-05 17:41:03.547875282 +0200
-+++ openjdk/jdk/src/share/classes/java/net/NetworkInterface.java	=
2010-07-05 17:42:22.647875475 +0200
-@@ -52,7 +52,7 @@
-     private boolean virtual =3D false;
-=20
-     static {
--        AccessController.doPrivileged(new LoadLibraryAction("net"));
-+        AccessController.doPrivileged(new =
LoadLibraryAction("javanet"));
-         init();
-     }
-=20
-Index: =
openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java	=
2010-07-05 17:41:04.306628153 +0200
-+++ openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java	=
2010-07-05 17:42:32.666627264 +0200
-@@ -89,7 +89,7 @@
-                 }});
-         if (b !=3D null && b.booleanValue()) {
-             java.security.AccessController.doPrivileged(
--                      new =
sun.security.action.LoadLibraryAction("net"));
-+                      new =
sun.security.action.LoadLibraryAction("javanet"));
-             hasSystemProxies =3D init();
-         }
-     }
-Index: =
henning/bug/com.buglabs.build.oe/tmp/work/armv7a-angstrom-linux-gnueabi/op=
enjdk-6-jre-6b18-1.8-r3.3/openjdk-src-dir/jdk/src/share/classes/sun/nio/ch=
/Util.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/classes/sun/nio/ch/Util.java	2010-07-05 =
17:41:05.086626745 +0200
-+++ openjdk/jdk/src/share/classes/sun/nio/ch/Util.java	2010-07-05 =
17:42:39.266626410 +0200
-@@ -354,7 +354,7 @@
-                 return;
-             loaded =3D true;
-             java.security.AccessController
--                .doPrivileged(new =
sun.security.action.LoadLibraryAction("net"));
-+                .doPrivileged(new =
sun.security.action.LoadLibraryAction("javanet"));
-             java.security.AccessController
-                 .doPrivileged(new =
sun.security.action.LoadLibraryAction("nio"));
-             // IOUtil must be initialized; Its native methods are =
called from
-Index: =
openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java=

-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- =
openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java=
	2010-07-05 17:41:05.896626691 +0200
-+++ =
openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java=
	2010-07-05 17:42:45.606625991 +0200
-@@ -244,7 +244,7 @@
-=20
-     static {
-         java.security.AccessController.doPrivileged(
--            new sun.security.action.LoadLibraryAction("net"));
-+            new sun.security.action.LoadLibraryAction("javanet"));
-     }
-=20
- }
-Index: =
henning/bug/com.buglabs.build.oe/tmp/work/armv7a-angstrom-linux-gnueabi/op=
enjdk-6-jre-6b18-1.8-r3.3/openjdk-src-dir/jdk/src/windows/classes/sun/net/=
dns/ResolverConfigurationImpl.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- =
openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java=
	2010-07-05 17:41:06.786627210 +0200
-+++ =
openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java=
	2010-07-05 17:42:51.926627747 +0200
-@@ -160,7 +160,7 @@
-=20
-     static {
-         java.security.AccessController.doPrivileged(
--            new sun.security.action.LoadLibraryAction("net"));
-+            new sun.security.action.LoadLibraryAction("javanet"));
-         init0();
-=20
-         // start the address listener thread
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-remove_werror.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-remove_werror.patch
deleted file mode 100644
index f2ad035..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-remove_werror.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: openjdk/hotspot/make/linux/makefiles/gcc.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/make/linux/makefiles/gcc.make	2010-02-02 =
16:11:35.758533706 +0100
-+++ openjdk/hotspot/make/linux/makefiles/gcc.make	2010-02-02 =
16:11:42.761456458 +0100
-@@ -98,9 +98,6 @@
-   CFLAGS +=3D -pipe
- endif
-=20
--# Compiler warnings are treated as errors
--WARNINGS_ARE_ERRORS =3D -Werror
--
- # Except for a few acceptable ones
- # Since GCC 4.3, -Wconversion has changed its meanings to warn these =
implicit
- # conversions which might affect the values. To avoid that, we need to =
turn
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-shark-arm-linux-cpu-detectio=
n.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-shark-arm-linux-cpu-detectio=
n.patch
deleted file mode 100644
index f40bc51..0000000
--- =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-shark-arm-linux-cpu-detectio=
n.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-Index: openjdk/hotspot/src/share/vm/shark/sharkCompiler.cpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/hotspot/src/share/vm/shark/sharkCompiler.cpp	=
2010-07-14 16:42:48.412103129 +0200
-+++ openjdk/hotspot/src/share/vm/shark/sharkCompiler.cpp	=
2010-07-14 16:50:51.680282178 +0200
-@@ -32,6 +32,96 @@
-=20
- #if SHARK_LLVM_VERSION >=3D 27
- namespace {
-+
-+#if defined(__arm__) && defined(__linux__)
-+#include <fcntl.h>
-+#include <linux/auxvec.h>
-+#include <asm/hwcap.h>
-+#define VECBUFF_SIZE 32
-+
-+bool TestARMLinuxHWCAP(int feature) {
-+  int fd;
-+  unsigned vecs[VECBUFF_SIZE];
-+  unsigned *p;
-+  int i, n;
-+  int rc;
-+
-+  rc =3D 0;
-+  fd =3D open("/proc/self/auxv", O_RDONLY);
-+  if (fd < 0) return 0;
-+  do {
-+    n =3D read(fd, vecs, VECBUFF_SIZE * sizeof(unsigned));
-+    p =3D vecs;
-+    i =3D n/8;
-+    while (--i >=3D0) {
-+      unsigned tag =3D *p++;
-+      unsigned value =3D *p++;
-+      if (tag =3D=3D 0) goto fini;
-+      if(tag =3D=3D AT_HWCAP && (value & feature)) {
-+        rc =3D 1;
-+        goto fini;
-+      }
-+    }
-+  } while (n =3D=3D VECBUFF_SIZE * sizeof(unsigned));
-+fini:
-+  close(fd);
-+  return rc;
-+}
-+
-+char* TestARMLinuxAT(int auxvec) {
-+  int fd;
-+  unsigned vecs[VECBUFF_SIZE];
-+  unsigned *p;
-+  int i, n;
-+  char* rc;
-+
-+  rc =3D 0;
-+  fd =3D open("/proc/self/auxv", O_RDONLY);
-+  if (fd < 0) return 0;
-+  do {
-+    n =3D read(fd, vecs, VECBUFF_SIZE * sizeof(unsigned));
-+    p =3D vecs;
-+    i =3D n/8;
-+    while (--i >=3D0) {
-+      unsigned tag =3D *p++;
-+      unsigned value =3D *p++;
-+      if (tag =3D=3D 0) goto fini;
-+      if(tag =3D=3D (unsigned) auxvec ) {
-+        rc =3D (char*)value;
-+        goto fini;
-+      }
-+    }
-+  } while (n =3D=3D VECBUFF_SIZE * sizeof(unsigned));
-+fini:
-+  close(fd);
-+  return rc;
-+}
-+
-+bool getARMHostCPUFeatures(StringMap<bool> &Features) {
-+  // FIXME LLVM PR6561 // =
Features["neon"]=3DTestARMLinuxHWCAP(HWCAP_NEON);
-+  Features["thumb2"]=3DTestARMLinuxHWCAP(HWCAP_THUMBEE);
-+  Features["vfp2"]=3DTestARMLinuxHWCAP(HWCAP_VFP);
-+
-+  std::string testArchKey(TestARMLinuxAT(AT_PLATFORM));
-+
-+  StringMap<std::string> archLinuxToLLVMMap;
-+  archLinuxToLLVMMap["v4l"]=3D"v4t";
-+  archLinuxToLLVMMap["v5l"]=3D"v5t";
-+  archLinuxToLLVMMap["v6l"]=3D"v6";
-+  // FIXME change this from v6 to v7a when LLVM PR7048 have been fixed
-+  archLinuxToLLVMMap["v7l"]=3D"v6";
-+
-+  llvm::StringMapIterator<std::string> =
resultIterator(archLinuxToLLVMMap.find(
-+                                                      testArchKey));
-+  if(resultIterator->first()) {
-+    std::string arch(resultIterator->second);
-+    Features[arch]=3Dtrue;
-+  }
-+
-+  return true;
-+}
-+#endif
-+
-   cl::opt<std::string>
-   MCPU("mcpu");
-=20
-@@ -64,7 +154,11 @@
- #if SHARK_LLVM_VERSION >=3D 27
-   // Finetune LLVM for the current host CPU.
-   StringMap<bool> Features;
-+#if defined(__arm__) && defined(__linux__)
-+  bool gotCpuFeatures =3D getARMHostCPUFeatures(Features);
-+#else
-   bool gotCpuFeatures =3D llvm::sys::getHostCPUFeatures(Features);
-+#endif
-   std::string cpu("-mcpu=3D" + llvm::sys::getHostCPUName());
-=20
-   std::vector<const char*> args;
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-unbreak-float.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-unbreak-float.patch
deleted file mode 100644
index 9f875de..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-unbreak-float.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Index: openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h	=
2010-02-02 13:49:39.972718207 +0100
-+++ openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h	=
2010-02-02 13:50:04.635639302 +0100
-@@ -27,13 +27,11 @@
-=20
- #include "jfdlibm.h"
-=20
--#ifdef __NEWVALID       /* special setup for Sun test regime */
- #if defined(i386) || defined(i486) || \
-         defined(intel) || defined(x86) || \
-         defined(i86pc) || defined(_M_IA64) || defined(ia64)
- #define _LITTLE_ENDIAN
- #endif
--#endif
-=20
- #ifdef _LITTLE_ENDIAN
- #define __HI(x) *(1+(int*)&x)
diff --git =
a/recipes-core/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch =
b/recipes-core/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch
deleted file mode 100644
index ba738d6..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Index: openjdk/hotspot/make/linux/makefiles/zeroshark.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/make/linux/makefiles/zeroshark.make	=
2011-12-20 18:24:38.000000000 +0100
-+++ openjdk/hotspot/make/linux/makefiles/zeroshark.make	=
2011-12-20 18:31:22.584884637 +0100
-@@ -32,13 +32,20 @@
- Obj_Files +=3D thumb2.o
-=20
- CFLAGS +=3D -DHOTSPOT_ASM
-+CCFLAGS +=3D -DHOTSPOT_ASM
-+
-+ifeq ($(CROSS_COMPILATION), true)
-+	C_COMPILE_FOR_MKBC =3D $(CC_FOR_BUILD)
-+else
-+	C_COMPILE_FOR_MKBC =3D $(C_COMPILE)
-+endif
-=20
- cppInterpreter_arm.o:	offsets_arm.s bytecodes_arm.s
- thumb2.o:		offsets_arm.s
-=20
- offsets_arm.s:	mkoffsets
- 	@echo Generating assembler offsets
--	./mkoffsets > $@
-+	$(QEMU) ./mkoffsets > $@
-=20
- bytecodes_arm.s: bytecodes_arm.def mkbc
- 	@echo Generatine ARM assembler bytecode sequences
-@@ -46,12 +53,12 @@
-=20
- mkbc:	$(GAMMADIR)/tools/mkbc.c
- 	@echo Compiling mkbc tool
--	$(CC_COMPILE) -o $@ $< $(COMPILE_DONE)
-+	$(C_COMPILE_FOR_MKBC) -o $@ $< $(COMPILE_DONE)
-=20
- mkoffsets:	asm_helper.cpp
- 	@echo Compiling offset generator
- 	$(QUIETLY) $(REMOVE_TARGET)
--	$(CC_COMPILE) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) -static -fuse-ld=3Dbfd -DSTATIC_OFFSETS -o $@ $< =
$(COMPILE_DONE)
-=20
- endif
-=20
diff --git a/recipes-core/openjdk/openjdk-6-6b24/jvm.cfg =
b/recipes-core/openjdk/openjdk-6-6b24/jvm.cfg
deleted file mode 100644
index ea97cda..0000000
--- a/recipes-core/openjdk/openjdk-6-6b24/jvm.cfg
+++ /dev/null
@@ -1,43 +0,0 @@
-# Copyright 2003 Sun Microsystems, Inc.  All Rights Reserved.
-# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
-#
-# This code is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License version 2 only, as
-# published by the Free Software Foundation.  Sun designates this
-# particular file as subject to the "Classpath" exception as provided
-# by Sun in the LICENSE file that accompanied this code.
-#
-# This code is distributed in the hope that it will be useful, but =
WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# version 2 for more details (a copy is included in the LICENSE file =
that
-# accompanied this code).
-#
-# You should have received a copy of the GNU General Public License =
version
-# 2 along with this work; if not, write to the Free Software =
Foundation,
-# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa =
Clara,
-# CA 95054 USA or visit www.sun.com if you need additional information =
or
-# have any questions.
-#
-#=20
-# List of JVMs that can be used as an option to java, javac, etc.
-# Order is important -- first in this list is the default JVM.
-# NOTE that this both this file and its format are UNSUPPORTED and
-# WILL GO AWAY in a future release.
-#
-# You may also select a JVM in an arbitrary location with the
-# "-XXaltjvm=3D<jvm_dir>" option, but that too is unsupported
-# and may not be available in a future release.
-#
--server ERROR
--client IGNORE
--hotspot ERROR
--classic WARN
--native ERROR
--green ERROR
--zero ALIASED_TO -server
--shark ERROR
--cacao ERROR
--jamvm ERROR
diff --git a/recipes-core/openjdk/openjdk-6-6b27/build-hacks.patch =
b/recipes-core/openjdk/openjdk-6-6b27/build-hacks.patch
deleted file mode 100644
index 1ecdef6..0000000
--- a/recipes-core/openjdk/openjdk-6-6b27/build-hacks.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-Index: icedtea6-1.12.4/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.12.4.orig/Makefile.am	2013-03-04 22:31:44.256894152 =
+0100
-+++ icedtea6-1.12.4/Makefile.am	2013-03-10 14:30:16.089527572 =
+0100
-@@ -656,6 +656,11 @@
- 	JAVAC=3D"" \
- 	JAVA_HOME=3D"" \
- 	JDK_HOME=3D"" \
-+	OE_CFLAGS=3D"$(OE_CFLAGS)" \
-+	OE_CPPFLAGS=3D"$(OE_CPPFLAGS)" \
-+	OE_CXXFLAGS=3D"$(OE_CXXFLAGS)" \
-+	OE_LDFLAGS=3D"$(OE_LDFLAGS)" \
-+	OE_LAUNCHER_LDFLAGS=3D"$(OE_LAUNCHER_LDFLAGS)" \
- 	ANT_RESPECT_JAVA_HOME=3D"TRUE" \
- 	DISTRIBUTION_ID=3D"$(DIST_ID)" \
- 	DERIVATIVE_ID=3D"$(ICEDTEA_NAME) =
$(PACKAGE_VERSION)$(ICEDTEA_REV)" \
-@@ -2249,10 +2254,14 @@
- if BUILD_JAMVM
- 	cd jamvm/jamvm && \
- 	LDFLAGS=3D"-Xlinker -z -Xlinker noexecstack" \
--	./autogen.sh --with-java-runtime-library=3Dopenjdk6 \
--	  --prefix=3D$(abs_top_builddir)/jamvm/install ; \
--	$(MAKE) ; \
--	$(MAKE) install
-+	$(ARCH_PREFIX) ./autogen.sh --with-java-runtime-library=3Dopenjdk6=
 \
-+		--prefix=3D$(abs_top_builddir)/jamvm/install \
-+		--host=3D$(host_alias) \
-+		--build=3D$(build_alias) \
-+		--target=3D$(target_alias)  \
-+		--with-libtool-sysroot=3D${ALT_FREETYPE_LIB_PATH} ; \
-+	$(ARCH_PREFIX) $(MAKE) ; \
-+	$(ARCH_PREFIX) $(MAKE) install
- 	mkdir -p =
$(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/serv=
er
- 	cp $(abs_top_builddir)/jamvm/install/lib/libjvm.so =
$(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/serv=
er
- 	ln -sf server =
$(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/clie=
nt
-@@ -2316,6 +2325,7 @@
- 	  --host=3D$(host_alias) \
- 	  --build=3D$(build_alias) \
- 	  --target=3D$(target_alias) \
-+	  --with-libtool-sysroot=3D${ALT_FREETYPE_LIB_PATH} \
- 	  --prefix=3D$(abs_top_builddir)/cacao/install \
- 	  --with-java-runtime-library=3Dopenjdk \
- 	  --with-java-runtime-library-prefix=3D$(abs_top_builddir)/openjdk=
 \
-@@ -2384,7 +2394,7 @@
- # configure script arguments, quoted in single quotes
- CONFIGURE_ARGS =3D @CONFIGURE_ARGS@
- ADD_ZERO_CONFIGURE_ARGS =3D \
--	--with-jdk-home=3D$(BUILD_OUTPUT_DIR)/j2sdk-image \
-+	--with-jdk-home=3D$(abs_top_builddir)/bootstrap/jdk1.6.0 \
- 	--enable-zero
- if ADD_SHARK_BUILD
- ADD_ZERO_CONFIGURE_ARGS +=3D \
-Index: icedtea6-1.12.4/javac.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.12.4.orig/javac.in	2013-03-04 22:29:36.932613635 =
+0100
-+++ icedtea6-1.12.4/javac.in	2013-03-10 14:20:35.244778409 +0100
-@@ -18,7 +18,7 @@
- {
-     my @new_args =3D @{$_[0]};
-=20
--    for my $opt (NO_DUP_ARGS)=20
-+    for my $opt (NO_DUP_ARGS)
-     {
- 	my @indices =3D reverse grep {$new_args[$_] eq $opt} =
0..$#new_args;
- 	if (@indices > 1) {
-@@ -27,7 +27,7 @@
- 	}
-     }
-=20
--    for my $opt (STRIP_ARGS)=20
-+    for my $opt (STRIP_ARGS)
-     {
- 	my @indices =3D reverse grep {$new_args[$_] eq $opt} =
0..$#new_args;
- 	splice @new_args, $_, 1 for @indices;
-@@ -69,7 +69,10 @@
-     my @CLASSPATH =3D ('@ECJ_JAR@');
-     push @CLASSPATH, split /:/, $ENV{"CLASSPATH"} if exists =
$ENV{"CLASSPATH"};
-     $ENV{"CLASSPATH"} =3D join ':', @CLASSPATH;
--    exec '@JAVA@', @$vm_args, =
'org.eclipse.jdt.internal.compiler.batch.Main', @ecj_parms, =
@$javac_args;
-+
-+    # Compiling hotspot-tools consumes tons of memory and exceeds any =
default
-+    # limits for jamvm and cacao.
-+    exec '@JAVA@', '-Xmx1024m', @$vm_args, =
'org.eclipse.jdt.internal.compiler.batch.Main', @ecj_parms, =
@$javac_args;
- }
- else
- {
diff --git =
a/recipes-core/openjdk/openjdk-6-6b27/fix_hotspot_crosscompile.patch =
b/recipes-core/openjdk/openjdk-6-6b27/fix_hotspot_crosscompile.patch
deleted file mode 100644
index 9741ed0..0000000
--- a/recipes-core/openjdk/openjdk-6-6b27/fix_hotspot_crosscompile.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Index: icedtea6-1.12.4/acinclude.m4
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.12.4.orig/acinclude.m4	2013-03-04 22:29:36.000000000 =
+0100
-+++ icedtea6-1.12.4/acinclude.m4	2013-03-10 13:45:56.032412186 =
+0100
-@@ -938,6 +938,21 @@
-   AC_SUBST(ALT_CACAO_SRC_DIR)
- ])
-=20
-+AC_DEFUN([AC_CHECK_WITH_CC_FOR_BUILD],
-+[
-+  AC_MSG_CHECKING(for compiler used for subsidiary programs)
-+  AC_ARG_WITH([cc-for-build],
-+              [AS_HELP_STRING(--with-cc-for-build,specify the compiler =
for subsidiary (helper) programs)],
-+  [
-+    CC_FOR_BUILD=3D"${withval}"
-+  ],
-+  [
-+    CC_FOR_BUILD=3D"\$(CC)"
-+  ])
-+  AC_MSG_RESULT(${CC_FOR_BUILD})
-+  AC_SUBST(CC_FOR_BUILD)
-+])
-+
- AC_DEFUN([IT_WITH_GCJ],
- [
-   AC_MSG_CHECKING([whether to compile ecj natively])
-Index: icedtea6-1.12.4/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.12.4.orig/Makefile.am	2013-03-10 13:44:55.000000000 =
+0100
-+++ icedtea6-1.12.4/Makefile.am	2013-03-10 13:46:27.540523062 =
+0100
-@@ -656,6 +656,7 @@
- 	JAVAC=3D"" \
- 	JAVA_HOME=3D"" \
- 	JDK_HOME=3D"" \
-+	CC_FOR_BUILD=3D"$(CC_FOR_BUILD)" \
- 	OE_CFLAGS=3D"$(OE_CFLAGS)" \
- 	OE_CPPFLAGS=3D"$(OE_CPPFLAGS)" \
- 	OE_CXXFLAGS=3D"$(OE_CXXFLAGS)" \
-Index: icedtea6-1.12.4/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.12.4.orig/configure.ac	2013-03-04 22:38:51.000000000 =
+0100
-+++ icedtea6-1.12.4/configure.ac	2013-03-10 13:45:56.032412186 =
+0100
-@@ -18,6 +18,8 @@
- AC_PROG_CC
- AC_PROG_CXX
-=20
-+AC_CHECK_WITH_CC_FOR_BUILD
-+
- IT_FIND_TOOL([MAKE], [make])
- IT_FIND_TOOL([GZIP], [gzip])
- IT_FIND_TOOL([ANT], [ant])
diff --git =
a/recipes-core/openjdk/openjdk-6-6b27/icedtea-crosscompile-fix.patch =
b/recipes-core/openjdk/openjdk-6-6b27/icedtea-crosscompile-fix.patch
deleted file mode 100644
index 0723954..0000000
--- a/recipes-core/openjdk/openjdk-6-6b27/icedtea-crosscompile-fix.patch
+++ /dev/null
@@ -1,469 +0,0 @@
-diff --git openjdk/corba/make/common/Defs-linux.gmk =
openjdk/corba/make/common/Defs-linux.gmk
-index f308203..5ba15dc 100644
---- openjdk/corba/make/common/Defs-linux.gmk
-+++ openjdk/corba/make/common/Defs-linux.gmk
-@@ -82,9 +82,9 @@ CC_LOWER_OPT   =3D -O2
- CC_NO_OPT      =3D
-=20
- ifeq ($(PRODUCT), java)
--    _OPT =3D $(CC_HIGHER_OPT)
-+    _OPT =3D $(OE_CFLAGS)
- else
--    _OPT =3D $(CC_LOWER_OPT)
-+    _OPT =3D $(OE_CFLAGS)
-     CPPFLAGS_DBG    +=3D -DLOGGING=20
- endif
-=20
-@@ -94,7 +94,7 @@ endif
- #    as the default.
- CFLAGS_REQUIRED_alpha   +=3D -mieee -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_amd64   +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
--CFLAGS_REQUIRED_arm     +=3D -D_LITTLE_ENDIAN
-+CFLAGS_REQUIRED_arm     +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_hppa    +=3D
- CFLAGS_REQUIRED_i586    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_ia64    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
-@@ -221,7 +221,7 @@ LDFLAGS_COMMON  +=3D $(LDFLAGS_DEFS_OPTION)
- #
- # -L paths for finding and -ljava
- #
--LDFLAGS_OPT     =3D -Xlinker -O1
-+LDFLAGS_OPT     =3D $(OE_LDFLAGS)
- LDFLAGS_COMMON +=3D -L$(LIBDIR)/$(LIBARCH)
- LDFLAGS_COMMON +=3D =
-Wl,-soname=3D$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
-=20
-diff --git openjdk/hotspot/make/linux/makefiles/buildtree.make =
openjdk/hotspot/make/linux/makefiles/buildtree.make
-index 4ba1f0e..48cfb02 100644
---- openjdk/hotspot/make/linux/makefiles/buildtree.make
-+++ openjdk/hotspot/make/linux/makefiles/buildtree.make
-@@ -380,7 +380,7 @@ test_gamma:  $(BUILDTREE_MAKE) =
$(GAMMADIR)/make/test/Queens.java
- 	echo "rm -f Queens.class"; \
- 	echo "\$${JAVA_HOME}/bin/javac -d . =
$(GAMMADIR)/make/test/Queens.java"; \
- 	echo '[ -f gamma_g ] && { gamma=3Dgamma_g; }'; \
--	echo './$${gamma:-gamma} $(TESTFLAGS) Queens < /dev/null'; \
-+	echo 'echo Silently skipping the execution of the gamma =
program'; \
- 	) > $@
- 	$(QUIETLY) chmod +x $@
-=20
-diff --git openjdk/hotspot/make/linux/makefiles/gcc.make =
openjdk/hotspot/make/linux/makefiles/gcc.make
-index 11de79a..c5751b2 100644
---- openjdk/hotspot/make/linux/makefiles/gcc.make
-+++ openjdk/hotspot/make/linux/makefiles/gcc.make
-@@ -140,7 +140,7 @@ CFLAGS_WARN/DEFAULT =3D $(WARNINGS_ARE_ERRORS) =
$(ACCEPTABLE_WARNINGS)
- CFLAGS_WARN/BYFILE =3D =
$(CFLAGS_WARN/$@)$(CFLAGS_WARN/DEFAULT$(CFLAGS_WARN/$@))=20
-=20
- # The flags to use for an Optimized g++ build
--OPT_CFLAGS +=3D -O3
-+OPT_CFLAGS +=3D $(OE_CFLAGS)
-=20
- # Hotspot uses very unstrict aliasing turn this optimization off
- OPT_CFLAGS +=3D -fno-strict-aliasing
-@@ -184,7 +184,7 @@ LFLAGS +=3D -Wl,-relax
- endif
-=20
- # Enable linker optimization
--LFLAGS +=3D -Xlinker -O1
-+LFLAGS +=3D $(OE_LDFLAGS)
-=20
- # If this is a --hash-style=3Dgnu system, use --hash-style=3Dboth
- #   The gnu .hash section won't work on some Linux systems like SuSE =
10.
-diff --git openjdk/hotspot/make/linux/makefiles/gcc.make.orig =
openjdk/hotspot/make/linux/makefiles/gcc.make.orig
-index 3d6a6b7..11de79a 100644
---- openjdk/hotspot/make/linux/makefiles/gcc.make.orig
-+++ openjdk/hotspot/make/linux/makefiles/gcc.make.orig
-@@ -204,7 +204,7 @@ SONAMEFLAG =3D -Xlinker -soname=3DSONAME
- SHARED_FLAG =3D -shared
-=20
- # Keep symbols even they are not used
--AOUT_FLAGS +=3D -export-dynamic
-+AOUT_FLAGS +=3D -Xlinker -export-dynamic
-=20
- =
#------------------------------------------------------------------------
- # Debug flags
-diff --git openjdk/hotspot/make/linux/makefiles/jsig.make =
openjdk/hotspot/make/linux/makefiles/jsig.make
-index 18f65d9..f12a798 100644
---- openjdk/hotspot/make/linux/makefiles/jsig.make
-+++ openjdk/hotspot/make/linux/makefiles/jsig.make
-@@ -42,7 +42,7 @@ LIBJSIG_MAPFILE =3D =
$(MAKEFILES_DIR)/mapfile-vers-jsig
- # cause problems with interposing. See CR: 6466665
- # LFLAGS_JSIG +=3D $(MAPFLAG:FILENAME=3D$(LIBJSIG_MAPFILE))
-=20
--LFLAGS_JSIG +=3D -D_GNU_SOURCE -D_REENTRANT $(LDFLAGS_HASH_STYLE)
-+LFLAGS_JSIG +=3D -D_GNU_SOURCE -D_REENTRANT $(LDFLAGS_HASH_STYLE) =
$(OE_LDFLAGS)
-=20
- # DEBUG_BINARIES overrides everything, use full -g debug information
- ifeq ($(DEBUG_BINARIES), true)
-diff --git openjdk/hotspot/make/linux/makefiles/launcher.make =
openjdk/hotspot/make/linux/makefiles/launcher.make
-index c5cf503..ae7af2e 100644
---- openjdk/hotspot/make/linux/makefiles/launcher.make
-+++ openjdk/hotspot/make/linux/makefiles/launcher.make
-@@ -50,7 +50,7 @@ ifeq ($(LINK_INTO),AOUT)
-   LIBS_LAUNCHER             +=3D $(STATIC_STDCXX) $(LIBS)
- else
-   LAUNCHER.o                 =3D launcher.o
--  LFLAGS_LAUNCHER           +=3D -L `pwd`
-+  LFLAGS_LAUNCHER           +=3D -L `pwd` $(OE_LAUNCHER_LDFLAGS) =
$(OE_LDFLAGS)
-   LIBS_LAUNCHER             +=3D -l$(JVM) $(LIBS) -lstdc++
-   ifeq ($(SHARK_BUILD), true)
-     LFLAGS_LAUNCHER +=3D $(LLVM_LDFLAGS)
-diff --git openjdk/hotspot/make/linux/makefiles/vm.make =
openjdk/hotspot/make/linux/makefiles/vm.make
-index cd8d9ef..b00ce46 100644
---- openjdk/hotspot/make/linux/makefiles/vm.make
-+++ openjdk/hotspot/make/linux/makefiles/vm.make
-@@ -242,6 +242,7 @@ ifeq ($(SHARK_BUILD), true)
-   LIBS_VM   +=3D $(LLVM_LIBS)
- endif
-=20
-+LFLAGS_VM +=3D $(OE_LDFLAGS)
- LINK_VM =3D $(LINK_LIB.c)
-=20
- # rule for building precompiled header
-diff --git openjdk/hotspot/make/linux/makefiles/vm.make.orig =
openjdk/hotspot/make/linux/makefiles/vm.make.orig
-index fa4116a..cd8d9ef 100644
---- openjdk/hotspot/make/linux/makefiles/vm.make.orig
-+++ openjdk/hotspot/make/linux/makefiles/vm.make.orig
-@@ -143,13 +143,15 @@ COMPILER2_PATHS :=3D =
$(GAMMADIR)/src/share/vm/opto
- COMPILER2_PATHS +=3D $(GAMMADIR)/src/share/vm/libadt
- COMPILER2_PATHS +=3D  $(GENERATED)/adfiles
-=20
-+SHARK_PATHS :=3D $(GAMMADIR)/src/share/vm/shark
-+
- # Include dirs per type.
- Src_Dirs/CORE      :=3D $(CORE_PATHS)
- Src_Dirs/COMPILER1 :=3D $(CORE_PATHS) $(COMPILER1_PATHS)
- Src_Dirs/COMPILER2 :=3D $(CORE_PATHS) $(COMPILER2_PATHS)
- Src_Dirs/TIERED    :=3D $(CORE_PATHS) $(COMPILER1_PATHS) =
$(COMPILER2_PATHS)
- Src_Dirs/ZERO      :=3D $(CORE_PATHS)
--Src_Dirs/SHARK     :=3D $(CORE_PATHS)
-+Src_Dirs/SHARK     :=3D $(CORE_PATHS) $(SHARK_PATHS)
- Src_Dirs :=3D $(Src_Dirs/$(TYPE))
-=20
- COMPILER2_SPECIFIC_FILES :=3D opto libadt bcEscapeAnalyzer.cpp =
chaitin\* c2_\* runtime_\*
-diff --git openjdk/jdk/make/common/Defs-linux.gmk =
openjdk/jdk/make/common/Defs-linux.gmk
-index 4e31797..03a84dd 100644
---- openjdk/jdk/make/common/Defs-linux.gmk
-+++ openjdk/jdk/make/common/Defs-linux.gmk
-@@ -89,9 +89,9 @@ HPIS =3D native
-=20
- ifndef OPTIMIZATION_LEVEL
-   ifeq ($(PRODUCT), java)
--    OPTIMIZATION_LEVEL =3D HIGHER
-+    OPTIMIZATION_LEVEL =3D $(OE_CFLAGS)
-   else
--    OPTIMIZATION_LEVEL =3D LOWER
-+    OPTIMIZATION_LEVEL =3D $(OE_CFLAGS)
-   endif
- endif
-=20
-@@ -108,7 +108,7 @@ CC_OPT          =3D $(CC_OPT/$(OPTIMIZATION_LEVEL))
- #    as the default.
- CFLAGS_REQUIRED_alpha   +=3D -mieee -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_amd64   +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
--CFLAGS_REQUIRED_arm     +=3D -D_LITTLE_ENDIAN
-+CFLAGS_REQUIRED_arm     +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_hppa    +=3D
- CFLAGS_REQUIRED_i586    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_ia64    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
-@@ -249,7 +249,7 @@ LDFLAGS_COMMON  +=3D $(LDFLAGS_DEFS_OPTION)
- #
- # -L paths for finding and -ljava
- #
--LDFLAGS_OPT     =3D -Xlinker -O1
-+LDFLAGS_OPT     =3D $(OE_LDFLAGS)
- LDFLAGS_COMMON +=3D -L$(LIBDIR)/$(LIBARCH)
- LDFLAGS_COMMON +=3D =
-Wl,-soname=3D$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
-=20
-diff --git openjdk/jdk/make/common/Defs-linux.gmk.orig =
openjdk/jdk/make/common/Defs-linux.gmk.orig
-index cbbf647..4e31797 100644
---- openjdk/jdk/make/common/Defs-linux.gmk.orig
-+++ openjdk/jdk/make/common/Defs-linux.gmk.orig
-@@ -86,18 +86,22 @@ HPIS =3D native
- #
- # Default optimization
- #
--CC_HIGHEST_OPT =3D -O3
--CC_HIGHER_OPT  =3D -O3
--CC_LOWER_OPT   =3D -O2
--CC_NO_OPT      =3D
-=20
--ifeq ($(PRODUCT), java)
--    _OPT =3D $(CC_HIGHER_OPT)
--else
--    _OPT =3D $(CC_LOWER_OPT)
--    CPPFLAGS_DBG    +=3D -DLOGGING=20
-+ifndef OPTIMIZATION_LEVEL
-+  ifeq ($(PRODUCT), java)
-+    OPTIMIZATION_LEVEL =3D HIGHER
-+  else
-+    OPTIMIZATION_LEVEL =3D LOWER
-+  endif
- endif
-=20
-+CC_OPT/NONE     =3D=20
-+CC_OPT/LOWER    =3D -O2
-+CC_OPT/HIGHER   =3D -O3
-+CC_OPT/HIGHEST  =3D -O3
-+
-+CC_OPT          =3D $(CC_OPT/$(OPTIMIZATION_LEVEL))
-+
- # For all platforms, do not omit the frame pointer register usage.=20
- #    We need this frame pointer to make it easy to walk the stacks.
- #    This should be the default on X86, but ia64 and amd64 may not =
have this
-@@ -131,17 +135,13 @@ else
-   LDFLAGS_COMMON        +=3D $(LDFLAGS_COMMON_$(ARCH))
- endif
-=20
--# Add in platform specific optimizations for all opt levels
--CC_HIGHEST_OPT +=3D $(_OPT_$(ARCH))
--CC_HIGHER_OPT  +=3D $(_OPT_$(ARCH))
--CC_LOWER_OPT   +=3D $(_OPT_$(ARCH))
--
--# If NO_OPTIMIZATIONS is defined in the environment, turn all =
optimzations off
--ifdef NO_OPTIMIZATIONS
--  CC_HIGHEST_OPT =3D $(CC_NO_OPT)
--  CC_HIGHER_OPT  =3D $(CC_NO_OPT)
--  CC_LOWER_OPT   =3D $(CC_NO_OPT)
-+# If this is a --hash-style=3Dgnu system, use --hash-style=3Dboth
-+#   The gnu .hash section won't work on some Linux systems like SuSE =
10.
-+_HAS_HASH_STYLE_GNU:=3D$(shell $(CC) -dumpspecs | $(GREP) -- =
'--hash-style=3Dgnu')
-+ifneq ($(_HAS_HASH_STYLE_GNU),)
-+  LDFLAGS_HASH_STYLE =3D -Wl,--hash-style=3Dboth
- endif
-+LDFLAGS_COMMON          +=3D $(LDFLAGS_HASH_STYLE)
-=20
- #
- # Selection of warning messages
-@@ -188,19 +188,19 @@ ifeq ($(DEBUG_BINARIES), true)
-   CFLAGS_REQUIRED +=3D $(DEBUG_FLAG)
- endif
-=20
--CFLAGS_OPT      =3D $(POPT)
-+CFLAGS_OPT      =3D $(CC_OPT)
- CFLAGS_DBG      =3D $(DEBUG_FLAG)
- CFLAGS_COMMON +=3D $(CFLAGS_REQUIRED)
-=20
- CXXFLAGS_COMMON =3D $(GLOBAL_KPIC) -DCC_NOEX $(GCC_WARNINGS)
--CXXFLAGS_OPT	=3D $(POPT)
-+CXXFLAGS_OPT	=3D $(CC_OPT)
- CXXFLAGS_DBG	=3D $(DEBUG_FLAG)
- CXXFLAGS_COMMON +=3D $(CFLAGS_REQUIRED)
-=20
- # FASTDEBUG: Optimize the code in the -g versions, gives us a faster =
debug java
- ifeq ($(FASTDEBUG), true)
--  CFLAGS_DBG    +=3D $(CC_LOWER_OPT)
--  CXXFLAGS_DBG	+=3D $(CC_LOWER_OPT)
-+  CFLAGS_DBG    +=3D $(CC_OPT/LOWER)
-+  CXXFLAGS_DBG	+=3D $(CC_OPT/LOWER)
- endif
-=20
- CPP_ARCH_FLAGS =3D -DARCH=3D'"$(ARCH)"'
-@@ -221,6 +221,9 @@ endif
-=20
- CPPFLAGS_OPT    =3D=20
- CPPFLAGS_DBG    =3D -DDEBUG
-+ifneq ($(PRODUCT), java)
-+  CPPFLAGS_DBG    +=3D -DLOGGING=20
-+endif
-=20
- ifdef LIBRARY
-   # Libraries need to locate other libraries at runtime, and you can =
tell
-@@ -255,9 +258,8 @@ LDFLAGS_COMMON +=3D =
-Wl,-soname=3D$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
- # statically link libgcc but will print a warning with the flag. We =
don't=20
- # want the warning, so check gcc version first.
- #
--CC_VER_MAJOR :=3D $(shell $(CC) -dumpversion | $(SED) 's/egcs-//' | =
$(CUT) -d'.' -f1)
--ifeq ("$(CC_VER_MAJOR)", "3")
--OTHER_LDFLAGS  +=3D -static-libgcc
-+ifeq ($(CC_MAJORVER),3)
-+  OTHER_LDFLAGS  +=3D -static-libgcc
- endif
-=20
- # Automatic precompiled header option to use (if =
COMPILE_APPROACH=3Dbatch)
-diff --git openjdk/jdk/make/sun/awt/Makefile =
openjdk/jdk/make/sun/awt/Makefile
-index e462fba..76b56be 100644
---- openjdk/jdk/make/sun/awt/Makefile
-+++ openjdk/jdk/make/sun/awt/Makefile
-@@ -511,10 +511,10 @@ ifneq ($(PLATFORM), windows)
- #
-=20
- ifeq ($(PLATFORM), linux)
--CPPFLAGS +=3D -I$(MOTIF_DIR)/include \
--            -I$(OPENWIN_HOME)/include \
--            -I$(OPENWIN_HOME)/include/X11/extensions \
--            -I$(PLATFORM_SRC)/native/$(PKGDIR)/font=20
-+#CPPFLAGS +=3D -I$(MOTIF_DIR)/include \
-+#            -I$(OPENWIN_HOME)/include \
-+#            -I$(OPENWIN_HOME)/include/X11/extensions \
-+CPPFLAGS +=3D  -I$(PLATFORM_SRC)/native/$(PKGDIR)/font=20
- endif
- CPPFLAGS +=3D -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
-             -I$(SHARE_SRC)/native/$(PKGDIR)/../font \
-@@ -538,7 +538,7 @@ CPPFLAGS +=3D -I$(SHARE_SRC)/native/$(PKGDIR)/debug =
\
- 	    $(EVENT_MODEL)
-=20
- ifeq ($(PLATFORM), linux)
--LDFLAGS +=3D -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
-+#LDFLAGS +=3D -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
- endif
-=20
- LDFLAGS +=3D -L$(LIBDIR)/$(LIBARCH)/$(TSOBJDIR) \
-diff --git openjdk/jdk/make/sun/awt/Makefile.orig =
openjdk/jdk/make/sun/awt/Makefile.orig
-index 61f36cd..e462fba 100644
---- openjdk/jdk/make/sun/awt/Makefile.orig
-+++ openjdk/jdk/make/sun/awt/Makefile.orig
-@@ -28,17 +28,13 @@ PACKAGE =3D sun.awt
- LIBRARY =3D awt
- PRODUCT =3D sun
-=20
--#
- # Tell Defs.gmk that VIS is needed
--#
- VIS_NEEDED=3Dtrue
-=20
--include $(BUILDDIR)/common/Defs.gmk
--
--#
- # Use highest optimization level
--#
--_OPT =3D $(CC_HIGHEST_OPT)
-+OPTMIZATION_LEVEL =3D HIGHEST
-+
-+include $(BUILDDIR)/common/Defs.gmk
-=20
- OTHER_CFLAGS +=3D -D__MEDIALIB_OLD_NAMES -D__USE_J2D_NAMES
-=20
-@@ -388,6 +384,10 @@ _FONTCONFIGS	=3D \
- 	fontconfig.SuSE.properties                      \
- 	fontconfig.Ubuntu.properties                    \
- 	fontconfig.Fedora.properties			\
-+	fontconfig.Fedora.9.properties			\
-+	fontconfig.Fedora.10.properties			\
-+	fontconfig.Fedora.11.properties			\
-+	fontconfig.Fedora.12.properties			\
- 	fontconfig.RedHat.6.properties		\
- 	fontconfig.Gentoo.properties
- else
-diff --git openjdk/jdk/make/sun/awt/mawt.gmk =
openjdk/jdk/make/sun/awt/mawt.gmk
-index 44de692..9ce661c 100644
---- openjdk/jdk/make/sun/awt/mawt.gmk
-+++ openjdk/jdk/make/sun/awt/mawt.gmk
-@@ -196,8 +196,8 @@ endif
- CPPFLAGS +=3D -I$(CUPS_HEADERS_PATH)
-=20
- ifndef HEADLESS
--CPPFLAGS +=3D -I$(OPENWIN_HOME)/include=20
--LDFLAGS  +=3D -L$(OPENWIN_LIB)
-+#CPPFLAGS +=3D -I$(OPENWIN_HOME)/include=20
-+#LDFLAGS  +=3D -L$(OPENWIN_LIB)
-=20
- endif # !HEADLESS
-=20
-@@ -225,8 +225,8 @@ CPPFLAGS +=3D -I$(SHARE_SRC)/native/$(PKGDIR)/debug =
\
-=20
- ifeq ($(PLATFORM), linux)
- # Checking for the X11/extensions headers at the additional location
--  CPPFLAGS +=3D -I/X11R6/include/X11/extensions \
--              -I/usr/include/X11/extensions
-+#  CPPFLAGS +=3D -I/X11R6/include/X11/extensions \
-+#              -I/usr/include/X11/extensions
- endif
-=20
- ifeq ($(PLATFORM), solaris)
-diff --git openjdk/jdk/make/sun/xawt/Makefile =
openjdk/jdk/make/sun/xawt/Makefile
-index 4b4c782..440699b 100644
---- openjdk/jdk/make/sun/xawt/Makefile
-+++ openjdk/jdk/make/sun/xawt/Makefile
-@@ -129,11 +129,12 @@ CPPFLAGS +=3D -DXAWT -DXAWT_HACK \
-         -I$(PLATFORM_SRC)/native/sun/awt
-=20
- ifeq ($(PLATFORM), linux)
-+# Very unsuitable for cross-compilation.
- # Allows for builds on Debian GNU Linux, X11 is in a different place=20=

--  CPPFLAGS +=3D -I/usr/X11R6/include/X11/extensions \
--              -I/usr/include/X11/extensions \
--              -I$(MOTIF_DIR)/include \
--              -I$(OPENWIN_HOME)/include=20
-+#  CPPFLAGS +=3D -I/usr/X11R6/include/X11/extensions \
-+#              -I/usr/include/X11/extensions \
-+#              -I$(MOTIF_DIR)/include \
-+#              -I$(OPENWIN_HOME)/include=20
- endif
-=20
- ifeq ($(PLATFORM), solaris)
-@@ -250,7 +251,7 @@ $(SIZES): $(SIZERS)
- 	    $(CHMOD) +w $@;\
- 	else	\
- 	    $(ECHO) GENERATING $@; \
--	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
-+	    $(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
- 	fi
- 	@if [ "$(DOCOMPARE)$(suffix $@)" =3D "true.64" ]; then \
- 	    $(ECHO) COMPARING $@ and =
$(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
-diff --git openjdk/jdk/make/sun/splashscreen/Makefile =
openjdk/jdk/make/sun/splashscreen/Makefile
-index 6693e2a..494a646 100644
---- openjdk/jdk/make/sun/splashscreen/Makefile
-+++ openjdk/jdk/make/sun/splashscreen/Makefile
-@@ -63,8 +63,8 @@ CFLAGS +=3D -DSPLASHSCREEN -DPNG_NO_MMX_CODE
-=20
- ifneq ($(PLATFORM), windows)
-   CFLAGS +=3D -DWITH_X11
--  CPPFLAGS +=3D -I$(OPENWIN_HOME)/include =
-I$(OPENWIN_HOME)/include/X11/extensions
--  OTHER_LDLIBS +=3D -L$(OPENWIN_LIB) -lX11 -lXext $(LIBM) -lpng -ljpeg =
-lgif -lz -lpthread
-+  #CPPFLAGS +=3D -I$(OPENWIN_HOME)/include =
-I$(OPENWIN_HOME)/include/X11/extensions
-+  OTHER_LDLIBS +=3D -lX11 -lXext $(LIBM) -lpng -ljpeg -lgif -lz =
-lpthread
- else # PLATFORM
-   CFLAGS +=3D -DWITH_WIN32
-   OTHER_LDLIBS +=3D kernel32.lib user32.lib gdi32.lib=20
-diff --git openjdk/jdk/make/sun/xawt/Makefile =
openjdk/jdk/make/sun/xawt/Makefile
-index 440699b..1fa311d 100644
---- openjdk/jdk/make/sun/xawt/Makefile
-+++ openjdk/jdk/make/sun/xawt/Makefile
-@@ -46,7 +46,7 @@ include FILES_export_unix.gmk
- AUTO_FILES_JAVA_DIRS =3D sun/awt/X11
- AUTO_JAVA_PRUNE =3D WrapperGenerator.java
-=20
--LDFLAGS +=3D -L$(OPENWIN_LIB)
-+#LDFLAGS +=3D -L$(OPENWIN_LIB)
-=20
- # For Xrender extension.
- ifeq ($(PLATFORM), solaris)
-diff --git openjdk/jdk/make/launchers/Makefile.launcher =
openjdk/jdk/make/launchers/Makefile.launcher
-index f59a9d6..6edc880 100644
---- openjdk/jdk/make/launchers/Makefile.launcher
-+++ openjdk/jdk/make/launchers/Makefile.launcher
-@@ -152,7 +152,7 @@ endif
- ifeq ($(GUI_TOOL),true)
-   ifneq ($(PLATFORM), windows)
-     # Anything with a GUI needs X11 to be linked in.
--    OTHER_LDLIBS +=3D -L$(OPENWIN_LIB) -lX11
-+    OTHER_LDLIBS +=3D -lX11
-   endif
- endif
-=20
-diff --git openjdk/jdk/make/sun/jawt/Makefile =
openjdk/jdk/make/sun/jawt/Makefile
-index 2021434..9035da7 100644
---- openjdk/jdk/make/sun/jawt/Makefile
-+++ openjdk/jdk/make/sun/jawt/Makefile
-@@ -98,8 +98,7 @@ else # PLATFORM
- #
- # Other extra flags needed for compiling.
- #
--CPPFLAGS +=3D -I$(OPENWIN_HOME)/include \
--	    -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
-+CPPFLAGS +=3D -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
-             -I$(SHARE_SRC)/native/$(PKGDIR)/image \
- 	    -I$(SHARE_SRC)/native/$(PKGDIR)/image/cvutils \
- 	    -I$(SHARE_SRC)/native/$(PKGDIR)/alphacomposite \
-diff --git openjdk/jdk/make/sun/xawt/Makefile =
openjdk/jdk/make/sun/xawt/Makefile
-index 1fa311d..f3d06ad 100644
---- openjdk/jdk/make/sun/xawt/Makefile
-+++ openjdk/jdk/make/sun/xawt/Makefile
-@@ -232,7 +232,7 @@ =
XLIBTYPES=3D$(PLATFORM_SRC)/classes/sun/awt/X11/generator/xlibtypes.txt
-=20
- $(SIZERS): $(SIZERS_C)=20
- 	$(prep-target)
--	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ =
$(SIZER)$(suffix $@).c
-+	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static =
-fuse-ld=3Dbfd -o $@ $(SIZER)$(suffix $@).c
-=20
- $(WRAPPER_GENERATOR_CLASS): $(WRAPPER_GENERATOR_JAVA)
- 	$(prep-target)
diff --git =
a/recipes-core/openjdk/openjdk-6-6b27/icedtea-disable-sane-alsa.patch =
b/recipes-core/openjdk/openjdk-6-6b27/icedtea-disable-sane-alsa.patch
deleted file mode 100644
index 0d3ce04..0000000
--- =
a/recipes-core/openjdk/openjdk-6-6b27/icedtea-disable-sane-alsa.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-diff --git openjdk/jdk/make/common/shared/Sanity.gmk =
openjdk/jdk/make/common/shared/Sanity.gmk
-index 55c0e88..220aa5c 100644
---- openjdk/jdk/make/common/shared/Sanity.gmk
-+++ openjdk/jdk/make/common/shared/Sanity.gmk
-@@ -102,11 +102,6 @@ ifeq ($(PLATFORM), linux)
-     if [ "$(OS_VARIANT_NAME)" =3D "Fedora" ] ; then \
-       $(CAT) /etc/fedora-release | $(HEAD) -1 | $(NAWK) '{ print $$3; =
}' ; \
-     fi)
--  ALSA_INCLUDE=3D/usr/include/alsa/version.h
--  ALSA_LIBRARY=3D/usr/lib/libasound.so
--  _ALSA_VERSION :=3D $(shell $(EGREP) SND_LIB_VERSION_STR =
$(ALSA_INCLUDE) | \
--           $(SED) -e 's@.*\"\(.*\)\".*@\1@' )
--  ALSA_VERSION :=3D $(call GetVersion,$(_ALSA_VERSION))
- endif
-=20
- ifeq ($(PLATFORM), windows)
-@@ -210,7 +210,6 @@ endif
- 	sane-compiler \
- 	sane-link \
- 	sane-cacerts \
--	sane-alsa-headers \
- 	sane-ant_version \
- 	sane-zip_version \
- 	sane-unzip_version \
-@@ -1351,9 +1346,6 @@ endif
- # need /usr/include/alsa/version.h and /usr/lib/libasound.so
- ######################################################
-=20
--ifdef REQUIRED_ALSA_VERSION
--  ALSA_CHECK :=3D $(call =
CheckVersions,$(ALSA_VERSION),$(REQUIRED_ALSA_VERSION))
--endif
- sane-alsa-headers:
- ifdef REQUIRED_ALSA_VERSION
- 	@if [ "$(ALSA_CHECK)" !=3D "missing" ] ; then \
diff --git a/recipes-core/openjdk/openjdk-6-6b32/build-hacks.patch =
b/recipes-core/openjdk/openjdk-6-6b32/build-hacks.patch
deleted file mode 100644
index 93ca65d..0000000
--- a/recipes-core/openjdk/openjdk-6-6b32/build-hacks.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-Index: icedtea6-1.13.3/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.13.3.orig/Makefile.am	2014-06-09 21:46:36.640603938 =
+0200
-+++ icedtea6-1.13.3/Makefile.am	2014-06-09 21:51:34.228435112 =
+0200
-@@ -795,6 +795,11 @@
- 	JAVAC=3D"" \
- 	JAVA_HOME=3D"" \
- 	JDK_HOME=3D"" \
-+	OE_CFLAGS=3D"$(OE_CFLAGS)" \
-+	OE_CPPFLAGS=3D"$(OE_CPPFLAGS)" \
-+	OE_CXXFLAGS=3D"$(OE_CXXFLAGS)" \
-+	OE_LDFLAGS=3D"$(OE_LDFLAGS)" \
-+	OE_LAUNCHER_LDFLAGS=3D"$(OE_LAUNCHER_LDFLAGS)" \
- 	ANT_RESPECT_JAVA_HOME=3D"TRUE" \
- 	DISTRIBUTION_ID=3D"$(DIST_ID)" \
- 	DERIVATIVE_ID=3D"$(ICEDTEA_NAME) =
$(PACKAGE_VERSION)$(ICEDTEA_REV)" \
-@@ -2025,9 +2030,7 @@
- 	rm -f stamps/pax-mark-vm-debug.stamp
-=20
- stamps/check-crypto.stamp: stamps/cryptocheck.stamp =
stamps/pax-mark-vm.stamp
--	if [ -e $(BUILD_OUTPUT_DIR)/j2sdk-image/bin/java ] ; then \
--	  $(BUILD_OUTPUT_DIR)/j2sdk-image/bin/java -cp =
$(CRYPTO_CHECK_BUILD_DIR) TestCryptoLevel ; \
--	fi
-+	$(BOOT_DIR)/bin/java -cp $(CRYPTO_CHECK_BUILD_DIR) =
TestCryptoLevel ; \
- 	mkdir -p stamps
- 	touch $@
-=20
-@@ -2035,9 +2038,7 @@
- 	rm -f stamps/check-crypto.stamp
-=20
- stamps/check-crypto-debug.stamp: stamps/cryptocheck.stamp =
stamps/pax-mark-vm-debug.stamp
--	if [ -e $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/bin/java ] ; then =
\
--	  $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/bin/java -cp =
$(CRYPTO_CHECK_BUILD_DIR) TestCryptoLevel ; \
--	fi
-+	$(BOOT_DIR)/bin/java -cp $(CRYPTO_CHECK_BUILD_DIR) =
TestCryptoLevel ; \
- 	mkdir -p stamps
- 	touch $@
-=20
-@@ -2219,9 +2220,7 @@
- 	rm -f stamps/pax-mark-vm-ecj.stamp
-=20
- stamps/check-crypto-boot.stamp: stamps/cryptocheck.stamp =
stamps/pax-mark-vm-ecj.stamp
--	if [ -e $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/bin/java ] ; then \
--	  $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/bin/java -cp =
$(CRYPTO_CHECK_BUILD_DIR) TestCryptoLevel ; \
--	fi
-+	$(BOOT_DIR)/bin/java -cp $(CRYPTO_CHECK_BUILD_DIR) =
TestCryptoLevel ; \
- 	mkdir -p stamps
- 	touch $@
-=20
-@@ -2379,10 +2378,14 @@
- if BUILD_JAMVM
- 	cd jamvm/jamvm && \
- 	LDFLAGS=3D"-Xlinker -z -Xlinker noexecstack" \
--	./autogen.sh --with-java-runtime-library=3Dopenjdk6 \
--	  --prefix=3D$(abs_top_builddir)/jamvm/install ; \
--	$(MAKE) ; \
--	$(MAKE) install
-+	$(ARCH_PREFIX) ./autogen.sh --with-java-runtime-library=3Dopenjdk6=
 \
-+		--prefix=3D$(abs_top_builddir)/jamvm/install \
-+		--host=3D$(host_alias) \
-+		--build=3D$(build_alias) \
-+		--target=3D$(target_alias)  \
-+		--with-libtool-sysroot=3D${ALT_FREETYPE_LIB_PATH} ; \
-+	$(ARCH_PREFIX) $(MAKE) ; \
-+	$(ARCH_PREFIX) $(MAKE) install
- 	mkdir -p =
$(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/serv=
er
- 	cp $(abs_top_builddir)/jamvm/install/lib/libjvm.so =
$(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/serv=
er
- 	ln -sf server =
$(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/clie=
nt
-@@ -2446,6 +2449,7 @@
- 	  --host=3D$(host_alias) \
- 	  --build=3D$(build_alias) \
- 	  --target=3D$(target_alias) \
-+	  --with-libtool-sysroot=3D${ALT_FREETYPE_LIB_PATH} \
- 	  --prefix=3D$(abs_top_builddir)/cacao/install \
- 	  --with-java-runtime-library=3Dopenjdk \
- 	  --with-java-runtime-library-prefix=3D$(abs_top_builddir)/openjdk=
 \
-@@ -2514,7 +2518,7 @@
- # configure script arguments, quoted in single quotes
- CONFIGURE_ARGS =3D @CONFIGURE_ARGS@
- ADD_ZERO_CONFIGURE_ARGS =3D \
--	--with-jdk-home=3D$(BUILD_OUTPUT_DIR)/j2sdk-image \
-+	--with-jdk-home=3D$(abs_top_builddir)/bootstrap/jdk1.6.0 \
- 	--enable-zero
- if ADD_SHARK_BUILD
- ADD_ZERO_CONFIGURE_ARGS +=3D \
-Index: icedtea6-1.13.3/javac.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.13.3.orig/javac.in	2014-06-09 21:46:36.640603938 =
+0200
-+++ icedtea6-1.13.3/javac.in	2014-06-09 21:46:36.636603946 +0200
-@@ -40,7 +40,7 @@
- {
-     my @new_args =3D @{$_[0]};
-=20
--    for my $opt (NO_DUP_ARGS)=20
-+    for my $opt (NO_DUP_ARGS)
-     {
- 	my @indices =3D reverse grep {$new_args[$_] eq $opt} =
0..$#new_args;
- 	if (@indices > 1) {
-@@ -49,7 +49,7 @@
- 	}
-     }
-=20
--    for my $opt (STRIP_ARGS)=20
-+    for my $opt (STRIP_ARGS)
-     {
- 	my @indices =3D reverse grep {$new_args[$_] eq $opt} =
0..$#new_args;
- 	splice @new_args, $_, 1 for @indices;
-@@ -91,7 +91,10 @@
-     my @CLASSPATH =3D ('@ECJ_JAR@');
-     push @CLASSPATH, split /:/, $ENV{"CLASSPATH"} if exists =
$ENV{"CLASSPATH"};
-     $ENV{"CLASSPATH"} =3D join ':', @CLASSPATH;
--    exec '@JAVA@', @$vm_args, =
'org.eclipse.jdt.internal.compiler.batch.Main', @ecj_parms, =
@$javac_args;
-+
-+    # Compiling hotspot-tools consumes tons of memory and exceeds any =
default
-+    # limits for jamvm and cacao.
-+    exec '@JAVA@', '-Xmx1024m', @$vm_args, =
'org.eclipse.jdt.internal.compiler.batch.Main', @ecj_parms, =
@$javac_args;
- }
- else
- {
diff --git =
a/recipes-core/openjdk/openjdk-6-6b32/icedtea-crosscompile-fix.patch =
b/recipes-core/openjdk/openjdk-6-6b32/icedtea-crosscompile-fix.patch
deleted file mode 100644
index 067b356..0000000
--- a/recipes-core/openjdk/openjdk-6-6b32/icedtea-crosscompile-fix.patch
+++ /dev/null
@@ -1,280 +0,0 @@
-diff --git openjdk/corba/make/common/Defs-linux.gmk =
openjdk/corba/make/common/Defs-linux.gmk
-index f308203..5ba15dc 100644
---- openjdk/corba/make/common/Defs-linux.gmk
-+++ openjdk/corba/make/common/Defs-linux.gmk
-@@ -82,9 +82,9 @@ CC_LOWER_OPT   =3D -O2
- CC_NO_OPT      =3D
-=20
- ifeq ($(PRODUCT), java)
--    _OPT =3D $(CC_HIGHER_OPT)
-+    _OPT =3D $(OE_CFLAGS)
- else
--    _OPT =3D $(CC_LOWER_OPT)
-+    _OPT =3D $(OE_CFLAGS)
-     CPPFLAGS_DBG    +=3D -DLOGGING=20
- endif
-=20
-@@ -94,7 +94,7 @@ endif
- #    as the default.
- CFLAGS_REQUIRED_alpha   +=3D -mieee -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_amd64   +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
--CFLAGS_REQUIRED_arm     +=3D -D_LITTLE_ENDIAN
-+CFLAGS_REQUIRED_arm     +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_hppa    +=3D
- CFLAGS_REQUIRED_i586    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_ia64    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
-@@ -221,7 +221,7 @@ LDFLAGS_COMMON  +=3D $(LDFLAGS_DEFS_OPTION)
- #
- # -L paths for finding and -ljava
- #
--LDFLAGS_OPT     =3D -Xlinker -O1
-+LDFLAGS_OPT     =3D $(OE_LDFLAGS)
- LDFLAGS_COMMON +=3D -L$(LIBDIR)/$(LIBARCH)
- LDFLAGS_COMMON +=3D =
-Wl,-soname=3D$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
-=20
-diff --git openjdk/hotspot/make/linux/makefiles/gcc.make =
openjdk/hotspot/make/linux/makefiles/gcc.make
-index 11de79a..c5751b2 100644
---- openjdk/hotspot/make/linux/makefiles/gcc.make
-+++ openjdk/hotspot/make/linux/makefiles/gcc.make
-@@ -140,7 +140,7 @@ CFLAGS_WARN/DEFAULT =3D $(WARNINGS_ARE_ERRORS) =
$(ACCEPTABLE_WARNINGS)
- CFLAGS_WARN/BYFILE =3D =
$(CFLAGS_WARN/$@)$(CFLAGS_WARN/DEFAULT$(CFLAGS_WARN/$@))=20
-=20
- # The flags to use for an Optimized g++ build
--OPT_CFLAGS +=3D -O3
-+OPT_CFLAGS +=3D $(OE_CFLAGS)
-=20
- # Hotspot uses very unstrict aliasing turn this optimization off
- OPT_CFLAGS +=3D -fno-strict-aliasing
-@@ -184,7 +184,7 @@ LFLAGS +=3D -Wl,-relax
- endif
-=20
- # Enable linker optimization
--LFLAGS +=3D -Xlinker -O1
-+LFLAGS +=3D $(OE_LDFLAGS)
-=20
- # If this is a --hash-style=3Dgnu system, use --hash-style=3Dboth
- #   The gnu .hash section won't work on some Linux systems like SuSE =
10.
-diff --git openjdk/hotspot/make/linux/makefiles/jsig.make =
openjdk/hotspot/make/linux/makefiles/jsig.make
-index 18f65d9..f12a798 100644
---- openjdk/hotspot/make/linux/makefiles/jsig.make
-+++ openjdk/hotspot/make/linux/makefiles/jsig.make
-@@ -42,7 +42,7 @@ LIBJSIG_MAPFILE =3D =
$(MAKEFILES_DIR)/mapfile-vers-jsig
- # cause problems with interposing. See CR: 6466665
- # LFLAGS_JSIG +=3D $(MAPFLAG:FILENAME=3D$(LIBJSIG_MAPFILE))
-=20
--LFLAGS_JSIG +=3D -D_GNU_SOURCE -D_REENTRANT $(LDFLAGS_HASH_STYLE)
-+LFLAGS_JSIG +=3D -D_GNU_SOURCE -D_REENTRANT $(LDFLAGS_HASH_STYLE) =
$(OE_LDFLAGS)
-=20
- # DEBUG_BINARIES overrides everything, use full -g debug information
- ifeq ($(DEBUG_BINARIES), true)
-diff --git openjdk/hotspot/make/linux/makefiles/launcher.make =
openjdk/hotspot/make/linux/makefiles/launcher.make
-index c5cf503..ae7af2e 100644
---- openjdk/hotspot/make/linux/makefiles/launcher.make
-+++ openjdk/hotspot/make/linux/makefiles/launcher.make
-@@ -50,7 +50,7 @@ ifeq ($(LINK_INTO),AOUT)
-   LIBS_LAUNCHER             +=3D $(STATIC_STDCXX) $(LIBS)
- else
-   LAUNCHER.o                 =3D launcher.o
--  LFLAGS_LAUNCHER           +=3D -L `pwd`
-+  LFLAGS_LAUNCHER           +=3D -L `pwd` $(OE_LAUNCHER_LDFLAGS) =
$(OE_LDFLAGS)
-   LIBS_LAUNCHER             +=3D -l$(JVM) $(LIBS) -lstdc++
-   ifeq ($(SHARK_BUILD), true)
-     LFLAGS_LAUNCHER +=3D $(LLVM_LDFLAGS)
-diff --git openjdk/jdk/make/common/Defs-linux.gmk =
openjdk/jdk/make/common/Defs-linux.gmk
-index 4e31797..03a84dd 100644
---- openjdk/jdk/make/common/Defs-linux.gmk
-+++ openjdk/jdk/make/common/Defs-linux.gmk
-@@ -89,9 +89,9 @@ HPIS =3D native
-=20
- ifndef OPTIMIZATION_LEVEL
-   ifeq ($(PRODUCT), java)
--    OPTIMIZATION_LEVEL =3D HIGHER
-+    OPTIMIZATION_LEVEL =3D $(OE_CFLAGS)
-   else
--    OPTIMIZATION_LEVEL =3D LOWER
-+    OPTIMIZATION_LEVEL =3D $(OE_CFLAGS)
-   endif
- endif
-=20
-@@ -108,7 +108,7 @@ CC_OPT          =3D $(CC_OPT/$(OPTIMIZATION_LEVEL))
- #    as the default.
- CFLAGS_REQUIRED_alpha   +=3D -mieee -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_amd64   +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
--CFLAGS_REQUIRED_arm     +=3D -D_LITTLE_ENDIAN
-+CFLAGS_REQUIRED_arm     +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_hppa    +=3D
- CFLAGS_REQUIRED_i586    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_ia64    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
-@@ -249,7 +249,7 @@ LDFLAGS_COMMON  +=3D $(LDFLAGS_DEFS_OPTION)
- #
- # -L paths for finding and -ljava
- #
--LDFLAGS_OPT     =3D -Xlinker -O1
-+LDFLAGS_OPT     =3D $(OE_LDFLAGS)
- LDFLAGS_COMMON +=3D -L$(LIBDIR)/$(LIBARCH)
- LDFLAGS_COMMON +=3D =
-Wl,-soname=3D$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
-=20
-diff --git openjdk/jdk/make/sun/awt/Makefile =
openjdk/jdk/make/sun/awt/Makefile
-index e462fba..76b56be 100644
---- openjdk/jdk/make/sun/awt/Makefile
-+++ openjdk/jdk/make/sun/awt/Makefile
-@@ -511,10 +511,10 @@ ifneq ($(PLATFORM), windows)
- #
-=20
- ifeq ($(PLATFORM), linux)
--CPPFLAGS +=3D -I$(MOTIF_DIR)/include \
--            -I$(OPENWIN_HOME)/include \
--            -I$(OPENWIN_HOME)/include/X11/extensions \
--            -I$(PLATFORM_SRC)/native/$(PKGDIR)/font=20
-+#CPPFLAGS +=3D -I$(MOTIF_DIR)/include \
-+#            -I$(OPENWIN_HOME)/include \
-+#            -I$(OPENWIN_HOME)/include/X11/extensions \
-+CPPFLAGS +=3D  -I$(PLATFORM_SRC)/native/$(PKGDIR)/font=20
- endif
- CPPFLAGS +=3D -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
-             -I$(SHARE_SRC)/native/$(PKGDIR)/../font \
-@@ -538,7 +538,7 @@ CPPFLAGS +=3D -I$(SHARE_SRC)/native/$(PKGDIR)/debug =
\
- 	    $(EVENT_MODEL)
-=20
- ifeq ($(PLATFORM), linux)
--LDFLAGS +=3D -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
-+#LDFLAGS +=3D -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
- endif
-=20
- LDFLAGS +=3D -L$(LIBDIR)/$(LIBARCH)/$(TSOBJDIR) \
-diff --git openjdk/jdk/make/sun/awt/mawt.gmk =
openjdk/jdk/make/sun/awt/mawt.gmk
-index 44de692..9ce661c 100644
---- openjdk/jdk/make/sun/awt/mawt.gmk
-+++ openjdk/jdk/make/sun/awt/mawt.gmk
-@@ -196,8 +196,8 @@ endif
- CPPFLAGS +=3D -I$(CUPS_HEADERS_PATH)
-=20
- ifndef HEADLESS
--CPPFLAGS +=3D -I$(OPENWIN_HOME)/include=20
--LDFLAGS  +=3D -L$(OPENWIN_LIB)
-+#CPPFLAGS +=3D -I$(OPENWIN_HOME)/include=20
-+#LDFLAGS  +=3D -L$(OPENWIN_LIB)
-=20
- endif # !HEADLESS
-=20
-@@ -225,8 +225,8 @@ CPPFLAGS +=3D -I$(SHARE_SRC)/native/$(PKGDIR)/debug =
\
-=20
- ifeq ($(PLATFORM), linux)
- # Checking for the X11/extensions headers at the additional location
--  CPPFLAGS +=3D -I/X11R6/include/X11/extensions \
--              -I/usr/include/X11/extensions
-+#  CPPFLAGS +=3D -I/X11R6/include/X11/extensions \
-+#              -I/usr/include/X11/extensions
- endif
-=20
- ifeq ($(PLATFORM), solaris)
-diff --git openjdk/jdk/make/sun/xawt/Makefile =
openjdk/jdk/make/sun/xawt/Makefile
-index 4b4c782..440699b 100644
---- openjdk/jdk/make/sun/xawt/Makefile
-+++ openjdk/jdk/make/sun/xawt/Makefile
-@@ -129,11 +129,12 @@ CPPFLAGS +=3D -DXAWT -DXAWT_HACK \
-         -I$(PLATFORM_SRC)/native/sun/awt
-=20
- ifeq ($(PLATFORM), linux)
-+# Very unsuitable for cross-compilation.
- # Allows for builds on Debian GNU Linux, X11 is in a different place=20=

--  CPPFLAGS +=3D -I/usr/X11R6/include/X11/extensions \
--              -I/usr/include/X11/extensions \
--              -I$(MOTIF_DIR)/include \
--              -I$(OPENWIN_HOME)/include=20
-+#  CPPFLAGS +=3D -I/usr/X11R6/include/X11/extensions \
-+#              -I/usr/include/X11/extensions \
-+#              -I$(MOTIF_DIR)/include \
-+#              -I$(OPENWIN_HOME)/include=20
- endif
-=20
- ifeq ($(PLATFORM), solaris)
-@@ -250,7 +251,7 @@ $(SIZES): $(SIZERS)
- 	    $(CHMOD) +w $@;\
- 	else	\
- 	    $(ECHO) GENERATING $@; \
--	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
-+	    $(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
- 	fi
- 	@if [ "$(DOCOMPARE)$(suffix $@)" =3D "true.64" ]; then \
- 	    $(ECHO) COMPARING $@ and =
$(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
-diff --git openjdk/jdk/make/sun/xawt/Makefile =
openjdk/jdk/make/sun/xawt/Makefile
-index 440699b..1fa311d 100644
---- openjdk/jdk/make/sun/xawt/Makefile
-+++ openjdk/jdk/make/sun/xawt/Makefile
-@@ -46,7 +46,7 @@ include FILES_export_unix.gmk
- AUTO_FILES_JAVA_DIRS =3D sun/awt/X11
- AUTO_JAVA_PRUNE =3D WrapperGenerator.java
-=20
--LDFLAGS +=3D -L$(OPENWIN_LIB)
-+#LDFLAGS +=3D -L$(OPENWIN_LIB)
-=20
- # For Xrender extension.
- ifeq ($(PLATFORM), solaris)
-diff --git openjdk/jdk/make/launchers/Makefile.launcher =
openjdk/jdk/make/launchers/Makefile.launcher
-index f59a9d6..6edc880 100644
---- openjdk/jdk/make/launchers/Makefile.launcher
-+++ openjdk/jdk/make/launchers/Makefile.launcher
-@@ -152,7 +152,7 @@ endif
- ifeq ($(GUI_TOOL),true)
-   ifneq ($(PLATFORM), windows)
-     # Anything with a GUI needs X11 to be linked in.
--    OTHER_LDLIBS +=3D -L$(OPENWIN_LIB) -lX11
-+    OTHER_LDLIBS +=3D -lX11
-   endif
- endif
-=20
-diff --git openjdk/jdk/make/sun/jawt/Makefile =
openjdk/jdk/make/sun/jawt/Makefile
-index 2021434..9035da7 100644
---- openjdk/jdk/make/sun/jawt/Makefile
-+++ openjdk/jdk/make/sun/jawt/Makefile
-@@ -98,8 +98,7 @@ else # PLATFORM
- #
- # Other extra flags needed for compiling.
- #
--CPPFLAGS +=3D -I$(OPENWIN_HOME)/include \
--	    -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
-+CPPFLAGS +=3D -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
-             -I$(SHARE_SRC)/native/$(PKGDIR)/image \
- 	    -I$(SHARE_SRC)/native/$(PKGDIR)/image/cvutils \
- 	    -I$(SHARE_SRC)/native/$(PKGDIR)/alphacomposite \
-diff --git openjdk/jdk/make/sun/xawt/Makefile =
openjdk/jdk/make/sun/xawt/Makefile
-index 1fa311d..f3d06ad 100644
---- openjdk/jdk/make/sun/xawt/Makefile
-+++ openjdk/jdk/make/sun/xawt/Makefile
-@@ -232,7 +232,7 @@ =
XLIBTYPES=3D$(PLATFORM_SRC)/classes/sun/awt/X11/generator/xlibtypes.txt
-=20
- $(SIZERS): $(SIZERS_C)=20
- 	$(prep-target)
--	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ =
$(SIZER)$(suffix $@).c
-+	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static =
-fuse-ld=3Dbfd -o $@ $(SIZER)$(suffix $@).c
-=20
- $(WRAPPER_GENERATOR_CLASS): $(WRAPPER_GENERATOR_JAVA)
- 	$(prep-target)
-diff --git openjdk/hotspot/make/linux/makefiles/vm.make =
openjdk/hotspot/make/linux/makefiles/vm.make
-index 7271a9e..e441970 100644
---- openjdk/hotspot/make/linux/makefiles/vm.make
-+++ openjdk/hotspot/make/linux/makefiles/vm.make
-@@ -290,6 +290,7 @@ ifeq ($(SHARK_BUILD), true)
-   LIBS_VM   +=3D $(LLVM_LIBS)
- endif
-=20
-+LFLAGS_VM +=3D $(OE_LDFLAGS)
- LINK_VM =3D $(LINK_LIB.CC)
-=20
- # rule for building precompiled header
-diff --git openjdk/jdk/make/sun/splashscreen/Makefile =
openjdk/jdk/make/sun/splashscreen/Makefile
-index d8d89aa..539854a 100644
---- openjdk/jdk/make/sun/splashscreen/Makefile
-+++ openjdk/jdk/make/sun/splashscreen/Makefile
-@@ -66,8 +66,8 @@ endif
-=20
- ifneq ($(PLATFORM), windows)
-   CFLAGS +=3D -DWITH_X11
--  CPPFLAGS +=3D -I$(OPENWIN_HOME)/include =
-I$(OPENWIN_HOME)/include/X11/extensions
--  OTHER_LDLIBS +=3D -L$(OPENWIN_LIB) -lX11 -lXext $(LIBM) -lpthread
-+  #CPPFLAGS +=3D -I$(OPENWIN_HOME)/include =
-I$(OPENWIN_HOME)/include/X11/extensions
-+  OTHER_LDLIBS +=3D -lX11 -lXext $(LIBM) -lpthread
- else # PLATFORM
-   CFLAGS +=3D -DWITH_WIN32
-   OTHER_LDLIBS +=3D kernel32.lib user32.lib gdi32.lib=20
diff --git =
a/recipes-core/openjdk/openjdk-6-6b32/icedtea-disable-sane-alsa.patch =
b/recipes-core/openjdk/openjdk-6-6b32/icedtea-disable-sane-alsa.patch
deleted file mode 100644
index 917a5b8..0000000
--- =
a/recipes-core/openjdk/openjdk-6-6b32/icedtea-disable-sane-alsa.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff --git openjdk/jdk/make/common/shared/Sanity.gmk =
openjdk/jdk/make/common/shared/Sanity.gmk
-index 88875b2..2ab8aaf 100644
---- openjdk/jdk/make/common/shared/Sanity.gmk
-+++ openjdk/jdk/make/common/shared/Sanity.gmk
-@@ -31,6 +31,7 @@
- # Shared sanity rules for the JDK builds.
- #
-=20
-+
- .SUFFIXES: .hdiffs
-=20
- # All files created during sanity checking
diff --git =
a/recipes-core/openjdk/openjdk-6-6b32/icedtea-hostbuildcc.patch =
b/recipes-core/openjdk/openjdk-6-6b32/icedtea-hostbuildcc.patch
deleted file mode 100644
index 3d7c619..0000000
--- a/recipes-core/openjdk/openjdk-6-6b32/icedtea-hostbuildcc.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff --git openjdk/hotspot/make/linux/makefiles/rules.make =
openjdk/hotspot/make/linux/makefiles/rules.make
-index b40c081..2dfbfc8 100644
---- openjdk/hotspot/make/linux/makefiles/rules.make
-+++ openjdk/hotspot/make/linux/makefiles/rules.make
-@@ -36,6 +36,7 @@ DEMANGLE        =3D $(DEMANGLER) < $@ > .$@ && mv -f =
.$@ $@
- # variables: $(CFLAGS), $(CXXFLAGS) and $(CPPFLAGS).
- CC_COMPILE       =3D $(CC) $(CXXFLAGS)
- CXX_COMPILE      =3D $(CXX) $(CXXFLAGS) $(CFLAGS)
-+CC_HOST_COMPILE  =3D $(BUILD_CC) $(CPPFLAGS) $(CFLAGS)
-=20
- AS.S            =3D $(AS) $(ASFLAGS)
-=20
diff --git =
a/recipes-core/openjdk/openjdk-6-6b32/icedtea-jdk-rmi-crosscompile.patch =
b/recipes-core/openjdk/openjdk-6-6b32/icedtea-jdk-rmi-crosscompile.patch
deleted file mode 100644
index 55f1f9c..0000000
--- =
a/recipes-core/openjdk/openjdk-6-6b32/icedtea-jdk-rmi-crosscompile.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git openjdk/jdk/make/com/sun/jmx/Makefile =
openjdk/jdk/make/com/sun/jmx/Makefile
-index eaf8a6e..4938613 100644
---- openjdk/jdk/make/com/sun/jmx/Makefile
-+++ openjdk/jdk/make/com/sun/jmx/Makefile
-@@ -102,7 +102,7 @@ FILES_ties   =3D $(subst =
javax/management/remote/rmi/,javax/management/remote/rmi/
- # when available, we need to run with latest rmic version available. =
rmic=20
- # launch tool not built at this stage but we can invoke via rmi class.
-=20
--RMIC_JAVA =3D $(OUTPUTDIR)/bin/java
-+RMIC_JAVA =3D $(BOOTDIR)/bin/java
- # need to treat 64bit solaris differently
- ifeq ($(PLATFORM)-$(LIBARCH), solaris-amd64)
- RMIC_JAVA =3D $(OUTPUTDIR)/bin/amd64/java
diff --git =
a/recipes-core/openjdk/openjdk-6-6b32/icedtea-openjdk-remove-currency-data=
-generation-expi.patch =
b/recipes-core/openjdk/openjdk-6-6b32/icedtea-openjdk-remove-currency-data=
-generation-expi.patch
deleted file mode 100644
index 6dd36af..0000000
--- =
a/recipes-core/openjdk/openjdk-6-6b32/icedtea-openjdk-remove-currency-data=
-generation-expi.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-=46rom 7df2fd1014a0c31f518be4f6a0018533f469d584 Mon Sep 17 00:00:00 =
2001
-From: Alex Gonzalez <alex.gonzalez@digi.com>
-Date: Wed, 31 Dec 2014 16:07:32 +0100
-Subject: [PATCH] icedtea: openjdk: remove currency data generation =
expiration
- date
-
-Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
----
- .../src/build/tools/generatecurrencydata/GenerateCurrencyData.java     =
| 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git =
openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurren=
cyData.java =
openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurren=
cyData.java
-index bf335fa22c1d..0e421360fef9 100644
---- =
openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurren=
cyData.java
-+++ =
openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurren=
cyData.java
-@@ -281,9 +281,6 @@ public class GenerateCurrencyData {
-             checkCurrencyCode(newCurrency);
-             String timeString =3D currencyInfo.substring(4, length - =
4);
-             long time =3D format.parse(timeString).getTime();
--            if (Math.abs(time - System.currentTimeMillis()) > ((long) =
10) * 365 * 24 * 60 * 60 * 1000) {
--                throw new RuntimeException("time is more than 10 years =
from present: " + time);
--            }
-             specialCaseCutOverTimes[specialCaseCount] =3D time;
-             specialCaseOldCurrencies[specialCaseCount] =3D =
oldCurrency;
-             =
specialCaseOldCurrenciesDefaultFractionDigits[specialCaseCount] =3D =
getDefaultFractionDigits(oldCurrency);
diff --git =
a/recipes-core/openjdk/openjdk-6-6b32/icedtea-remove_werror.patch =
b/recipes-core/openjdk/openjdk-6-6b32/icedtea-remove_werror.patch
deleted file mode 100644
index cab80ac..0000000
--- a/recipes-core/openjdk/openjdk-6-6b32/icedtea-remove_werror.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-diff --git openjdk/hotspot/make/linux/makefiles/gcc.make =
openjdk/hotspot/make/linux/makefiles/gcc.make
-index 8986146..846bd6b 100644
---- openjdk/hotspot/make/linux/makefiles/gcc.make
-+++ openjdk/hotspot/make/linux/makefiles/gcc.make
-@@ -132,11 +132,6 @@ else
-   CFLAGS +=3D -pipe
- endif
-=20
--# Compiler warnings are treated as errors
--ifneq ($(COMPILER_WARNINGS_FATAL),false)
--WARNINGS_ARE_ERRORS =3D -Werror
--endif
--
- # Except for a few acceptable ones
- # Since GCC 4.3, -Wconversion has changed its meanings to warn these =
implicit
- # conversions which might affect the values. To avoid that, we need to =
turn
diff --git =
a/recipes-core/openjdk/openjdk-6-6b32/icedtea-zero-hotspotfix.patch =
b/recipes-core/openjdk/openjdk-6-6b32/icedtea-zero-hotspotfix.patch
deleted file mode 100644
index f14deaf..0000000
--- a/recipes-core/openjdk/openjdk-6-6b32/icedtea-zero-hotspotfix.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-diff --git openjdk/hotspot/make/linux/makefiles/zeroshark.make =
openjdk/hotspot/make/linux/makefiles/zeroshark.make
-index c2a1484..f460d85 100644
---- openjdk/hotspot/make/linux/makefiles/zeroshark.make
-+++ openjdk/hotspot/make/linux/makefiles/zeroshark.make
-@@ -32,13 +32,20 @@ Obj_Files +=3D cppInterpreter_arm.o
- Obj_Files +=3D thumb2.o
-=20
- CFLAGS +=3D -DHOTSPOT_ASM
-+CCFLAGS +=3D -DHOTSPOT_ASM
-+
-+ifeq ($(CROSS_COMPILATION), true)
-+	C_COMPILE_FOR_MKBC =3D $(CC_FOR_BUILD)
-+else
-+	C_COMPILE_FOR_MKBC =3D $(C_COMPILE)
-+endif
-=20
- cppInterpreter_arm.o:	offsets_arm.s bytecodes_arm.s
- thumb2.o:		offsets_arm.s
-=20
- offsets_arm.s:	mkoffsets
- 	@echo Generating assembler offsets
--	./mkoffsets > $@
-+	$(QEMU) ./mkoffsets > $@
-=20
- bytecodes_arm.s: bytecodes_arm.def mkbc
- 	@echo Generating ARM assembler bytecode sequences
-@@ -46,12 +53,12 @@ bytecodes_arm.s: bytecodes_arm.def mkbc
-=20
- mkbc:	$(GAMMADIR)/tools/mkbc.c
- 	@echo Compiling mkbc tool
--	$(CC_COMPILE) -o $@ $< $(COMPILE_DONE)
-+	$(C_COMPILE_FOR_MKBC) -o $@ $< $(COMPILE_DONE)
-=20
- mkoffsets:	asm_helper.cpp
- 	@echo Compiling offset generator
- 	$(QUIETLY) $(REMOVE_TARGET)
--	$(CC_COMPILE) $(CFLAGS) -DSTATIC_OFFSETS -o $@ $< =
$(COMPILE_DONE)
-+	$(CC_COMPILE) $(CFLAGS) -static -fuse-ld=3Dbfd -DSTATIC_OFFSETS =
-o $@ $< $(COMPILE_DONE)
-=20
- endif
-=20
diff --git a/recipes-core/openjdk/openjdk-6-common.inc =
b/recipes-core/openjdk/openjdk-6-common.inc
deleted file mode 100644
index cf192d0..0000000
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ /dev/null
@@ -1,396 +0,0 @@
-require openjdk-common.inc
-
-ICEDTEA =3D "icedtea6-${ICEDTEA_VERSION}"
-
-INC_PR =3D "r22"
-
-SRC_URI =3D "\
-  ${ICEDTEA_URI} \
-  ${OPENJDK_URI} \
-  ${JAXWS_URI} \
-  ${JAF_URI} \
-  ${JAXP_URI} \
-  ${CACAO_URI} \
-  ${JAMVM_URI} \
-  ${OEPATCHES} \
-  ${ICEDTEAPATCHES} \
-  file://jvm.cfg \
-  "
-
-JDKPN =3D "openjdk-6"
-JDK_DIR =3D "java-6-openjdk"
-
-PN =3D "${JDKPN}-jre"
-PROVIDES +=3D "${JDKPN} ${PACKAGES}"
-
-DEPENDS =3D "giflib libpng jpeg cups \
-	   rhino \
-	   freetype libxinerama libxt libxrender libxtst libxi \
-	   alsa-lib libffi \
-           ant-native \
-           fastjar-native \
-	   icedtea6-native \
-           zip-native \
-          "
-
-# No package should directly depend on this (it should require
-# java2-runtime instead).
-PRIVATE_LIBS =3D "\
-	lib.so libunpack.so libverify.so libjava.so libzip.so libnpt.so =
\
-	libjava_crw_demo.so libhprof.so libjavanet.so libnio.so \
-	libmanagement.so libinstrument.so libjsound.so libjsoundalsa.so =
\
-	libj2pcsc.so libj2pkcs11.so libj2gss.so libmlib_image.so \
-	libawt.so libsplashscreen.so libfreetype.so.6 libfontmanager.so =
\
-	libjpeg.so liblcms.so librmi.so libjawt.so libjaas_unix.so \
-	libattach.so libjdwp.so libdt_socket.so libhpi.so libjli.so \
-	libmawt.so libjvm.so \
-	libversionCheck.so libcompiledMethodLoad.so libgctest.so \
-	libheapViewer.so libheapTracker.so libminst.so libmtrace.so \
-	libwaiters.so libhprof.so \
-       "
-
-
-export ALT_CUPS_HEADERS_PATH =3D "${STAGING_INCDIR}"
-export ALT_FREETYPE_HEADERS_PATH =3D "${STAGING_INCDIR}/freetype2"
-export ALT_FREETYPE_LIB_PATH =3D "${STAGING_LIBDIR}"
-export CACAO_CONFIGURE_ARGS =3D "\
-	${@['','--enable-softfloat'][bb.data.getVar('TARGET_FPU',d,1) =3D=3D=
 'soft']}"
-
-JAVA_HOME[unexport] =3D "1"
-
-EXTRA_OECONF =3D "\
-	--disable-docs \
-	--disable-pulse-java \
-	\
-	--with-ecj-jar=3D${STAGING_DATADIR_JAVA_NATIVE}/ecj-bootstrap.jar =
\
-	=
--with-java=3D${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/java \
-	=
--with-javac=3D${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/javac \
-	=
--with-javah=3D${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/javah \
-	--with-jar=3D${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/jar =
\
-	=
--with-rmic=3D${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/rmic \
-	=
--with-native2ascii=3D${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/nat=
ive2ascii \
-	--with-rhino=3D${STAGING_DATADIR_JAVA}/rhino.jar \
-	--without-ant-home \
-	--with-openjdk-src-dir=3D${WORKDIR}/openjdk-src-dir \
-	--with-parallel-jobs=3D${JDK_JOBS} \
-	\
-	--with-pkgversion=3D${PV} \
-	--with-cc-for-build=3D${BUILD_CC} \
-        --enable-zero \
-        --with-additional-vms=3D${WITH_ADDITIONAL_VMS} \
-        --enable-openjdk-cross-compilation \
-       "
-
-
-# OpenJDK supports parallel compilation but uses a plain number for =
this.
-# In OE we have PARALLEL_MAKE which is the actual option passed to =
make,
-# e.g. "-j 4".
-def get_jdk_jobs(d):
-    import bb
-
-    pm =3D bb.data.getVar('PARALLEL_MAKE', d, 1);
-    if not pm:
-        return "1"
-
-    pm =3D pm.split("j");
-    if (len(pm) =3D=3D 2):
-        return pm[1]
-
-    # Whatever found in PARALLEL_MAKE was not suitable.
-    return "1"
-
-JDK_JOBS =3D "${@get_jdk_jobs(d)}"
-
-# Custom preparation of the sources which:
-# - cleans up the sources
-# - copies the patches into the proper directory
-# - prepares the FakeJDK directory structure
-#DISABLED because of incompatibility with oe stable 2009: =
do_prepareconfigure () {
-do_configure_prepend() {
-  chmod -R ug+w ${WORKDIR}/openjdk-src-dir
-  (cd ${WORKDIR}/openjdk-src-dir && sh ${S}/fsg.sh)
-
-  # Automatically copy everything that starts with "icedtea" (or =
"cacao") and ends with
-  # ".patch" into the patches directory.
-  find ${WORKDIR} -maxdepth 1 -name "icedtea*.patch" -exec cp {} =
${S}/patches \;
-  find ${WORKDIR} -maxdepth 1 -name "cacao*.patch" -exec cp {} =
${S}/patches \;
-
-  # use now the rt.jar from icedtea6-native
-  mkdir -p ${WORKDIR}/fake-jdk/jre/lib
-  ln -sf ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/jre/lib/rt.jar =
${WORKDIR}/fake-jdk/jre/lib/rt.jar
-
-  symlinked=3Dfalse
-  bbnote "Creating symlinks for fake-jdk"
-  mkdir -p ${WORKDIR}/fake-jdk/include
-  for i in `find ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/include` =
;do
-	bn=3D`basename $i`
-	echo "Symlinking: $bn"
-    ln -sf $i ${WORKDIR}/fake-jdk/include/$bn;
-	symlinked=3Dtrue
-  done
-
-  # If the symlinks have not been created the built cannot continue. =
This
-  # can happen if icedtea6-native is not ready at this point. The =
recipe
-  # should make sure this is not the case but a little sanity checking
-  # in such a complicated build can't be wrong.
-  if [ x$symlinked =3D xfalse ]
-  then
-    bberror "Build b0rken! Have not created any symlinks for fake-jdk!"
-  else
-    bbnote "fake-jdk setup appears sane."
-  fi
-}
-
-# Note: The following lines only work for OE.dev branch but cause an =
exception
-# in oe stable's 2009 bitbake. As such the function is prepended to =
do_configure instead.
-#addtask prepareconfigure after do_patch before do_configure
-# Makes prepareconfigure depend on icedtea6-native having being staged.
-#do_prepareconfigure[depends] +=3D =
"icedtea6-native:do_populate_sysroot"
-
-
-do_configure_append() {
-	oe_runmake patch-ecj
-}
-
-# Work around broken variable quoting in oe-stable 2009 and provide the =
variable
-# via the environment which then overrides the erroneous value that was =
written
-# into '${ICETDEA}/Makefile'.
-# Icedtea's makefile is not compatible to parallelization so we cannot =
allow
-# passing a valid ${PARALLEL_MAKE} to it. OTOH OpenJDK's makefiles are
-# parallelizable and we need ${PARALLEL_MAKE} to derive the proper =
value.
-# The base for this quirk is that GNU Make only considers the last "-j" =
option.
-EXTRA_OEMAKE +=3D '-j 1 CC=3D"${CC}" CCC=3D"${CXX}" CPP=3D"${CPP}" =
CXX=3D"${CXX}" CC_FOR_BUILD=3D"${BUILD_CC}"'
-
-EXTRA_OEMAKE +=3D ' \
-                OE_CFLAGS=3D"${TARGET_CFLAGS}" \
-                OE_CPPFLAGS=3D"${TARGET_CPPFLAGS}" \
-                OE_CXXFLAGS=3D"${TARGET_CXXFLAGS}" \
-                OE_LDFLAGS=3D"${TARGET_LDFLAGS}" \
-                ZIPEXE=3D"${STAGING_BINDIR_NATIVE}/zip" \
-                CROSS_COMPILE_ARCH=3D"${JDK_ARCH}" \
-               '
-
-OE_LAUNCHER_LDFLAGS =3D =
"-Wl,-rpath-link,${STAGING_LIBDIR}/llvm${WANT_LLVM_RELEASE} =
-Wl,-rpath,/usr/lib/llvm${WANT_LLVM_RELEASE}"
-
-EXTRA_OEMAKE +=3D 'OE_LAUNCHER_LDFLAGS=3D"${OE_LAUNCHER_LDFLAGS}"'
-
-
-# The build of OpenJDK is a 3-part process. For better restartability =
and overrideability they have been split into
-# three functions.
-# 1. compile Hotspot or Cacao (this one is supposed to be implemented =
according to wanted VM)
-# 2. compile openjdk-ecj (to have libraries as libjvm.so and libjava.so =
which are needed later)
-# 3. compile openjdk (the final result)
-
-do_compilestepone() {
-        oe_runmake bootstrap-directory-ecj
-
-        # now we need to override the tools.jar to point to the normal =
jdk's tools.jar
-        rm bootstrap/ecj/lib/tools.jar
-        ln -s =
${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/lib/tools.jar =
bootstrap/ecj/lib/tools.jar
-
-        # First build hotspot to get a libjvm.so (to link corba in the =
icedtea-ecj build)
-        bbnote "1/3 Building Hotspot"
-        oe_runmake hotspot
-
-        # Remove spurious libarch directory/symlink
-        rm -rf bootstrap/ecj/jre/lib/${JDK_ARCH} || true
-
-                # Provide a symlink to the target arch's libjvm.so (to =
link against)
-        ln -s `pwd`/${BUILD_DIR_ECJ}/j2sdk-image/jre/lib/${JDK_ARCH} =
bootstrap/jdk1.6.0/jre/lib/${JDK_ARCH}
-
-        # fake j2sdk-image
-        rm ${BUILD_DIR_ECJ}/j2sdk-image/include || true
-        cp -ar ${BUILD_DIR_ECJ}/hotspot/import/include =
${BUILD_DIR_ECJ}/j2sdk-image/
-        install -d ${BUILD_DIR_ECJ}/j2sdk-image/bin
-}
-addtask compilestepone after do_configure before do_compilesteptwo
-
-# This part can be shared between cacao and hotspot-zero builds.
-do_compilesteptwo() {
-	bbnote "2/3 Building bootstrap JDK"
-
-	# Now cross-compile bootstrap JDK
-	rm stamps/icedtea-against-ecj.stamp stamps/icedtea-ecj.stamp || =
true
-	oe_runmake icedtea-against-ecj
-
-	ln -sf ../${BUILD_DIR_ECJ}/j2sdk-image bootstrap/icedtea
-
-	#	Replace all executables with symlinks to their native =
equivalents.
-	for F in `find ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin =
-type f`
-	do
-		bf=3D`basename $F`
-		bbnote "Creating symlink for:" $bf
-		ln -sf $F bootstrap/icedtea/bin/$bf
-	done
-}
-addtask compilesteptwo after do_compilestepone before do_compile
-
-do_compile() {
-
-	bbnote "3/3 Building final JDK"
-
-	# Build the final Hotspot + OpenJDK
-	oe_runmake icedtea-against-icedtea
-}
-
-do_install() {
-	install -d ${D}${libdir_jvm}
-	cp -R ${B}/${BUILD_DIR}/j2sdk-image ${D}${JDK_HOME}
-
-	chmod u+rw -R ${D}${JDK_HOME}
-
-	# Fix symlink which would point into staging in the binary =
package.
-	ln -sf ${datadir_java}/rhino.jar =
${D}${JDK_HOME}/jre/lib/rhino.jar
-
-	# JRE is a subset of JDK. So to save space and resemble what the =
BIG distros
-	# do we create symlinks from the JDK binaries to their =
counterparts in the
-	# JRE folder (which have to exist by that time b/c of =
dependencies).
-	for F in `find ${D}${JDK_HOME}/jre/bin -type f`
-	do
-		bf=3D`basename $F`
-		bbnote "replace:" $bf
-		rm ${D}${JDK_HOME}/bin/$bf
-		ln -s ${JDK_HOME}/jre/bin/$bf ${D}${JDK_HOME}/bin/$bf
-	done
-        install -m644 ${WORKDIR}/jvm.cfg  =
${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
-        # workaround for shared libarary searching
-        ln -sf ${JDK_HOME}/jre/lib/${JDK_ARCH}/server/libjvm.so =
${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
-}
-
-# Notes about the ideas behind packaging:
-# 1) User should install openjdk-6-jre. This is a provider of =
'java2-runtime'.
-# 2) This lets package mgmt install: openjdk-6-java
-# -> openjdk-6-vm-shark|openjdk-6-vm-zero|openjdk-6-vm-cacao -> =
openjdk-6-common
-#
-# With opkg the zero VM is chosen which is good b/c that is the best =
known (=3D compatible)
-# runtime. Installing other runtimes side-by-side is possible. Through =
jvm.cfg the following
-# order of precedence is enforced: zero, shark, cacao. User can chose a =
different runtime
-# by adding '-shark' or '-cacao' to the Java command (or by =
deinstalling an otherwise preferred
-# runtime)
-# 3) All other packages, including -jdk, are optional and not needed =
for normal Java apps.
-PACKAGES =3D " \
-            ${JDKPN}-jre \
-            ${JDKPN}-dbg \
-            ${JDKPN}-demo-dbg \
-            ${JDKPN}-demo \
-            ${JDKPN}-source \
-            ${JDKPN}-doc \
-            ${JDKPN}-jdk \
-            ${JDKPN}-java \
-            ${JDKPN}-vm-shark \
-            ${JDKPN}-vm-zero \
-            ${JDKPN}-vm-cacao \
-	    ${JDKPN}-vm-jamvm \
-            ${JDKPN}-common \
-           "
-
-FILES_${JDKPN}-dbg =3D "\
-	${JDK_HOME}/bin/.debug \
-	${JDK_HOME}/lib/.debug \
-	${JDK_HOME}/jre/bin/.debug \
-	${JDK_HOME}/jre/lib/.debug \
-	${JDK_HOME}/jre/lib/${JDK_ARCH}/.debug \
-	${JDK_HOME}/jre/lib/${JDK_ARCH}/jli/.debug \
-	${JDK_HOME}/lib/${JDK_ARCH}/jli/.debug \
-	${JDK_HOME}/jre/lib/${JDK_ARCH}/native_threads/.debug \
-	${JDK_HOME}/jre/lib/${JDK_ARCH}/server/.debug \
-        ${JDK_HOME}/jre/lib/${JDK_ARCH}/shark/.debug \
-        ${JDK_HOME}/jre/lib/${JDK_ARCH}/cacao/.debug \
-        ${JDK_HOME}/jre/lib/${JDK_ARCH}/jamvm/.debug \
-	${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug \
-	${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug \
-	/usr/src \
-       "
-
-FILES_${JDKPN}-demo =3D "${JDK_HOME}/demo ${JDK_HOME}/sample"
-RDEPENDS_${JDKPN}-demo =3D "${JDKPN}-jre"
-FILES_${JDKPN}-demo-dbg =3D "\
-	${JDK_HOME}/demo/jvmti/gctest/lib/.debug \
-	${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug \
-	${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug \
-	${JDK_HOME}/demo/jvmti/hprof/lib/.debug \
-	${JDK_HOME}/demo/jvmti/minst/lib/.debug \
-	${JDK_HOME}/demo/jvmti/mtrace/lib/.debug \
-	${JDK_HOME}/demo/jvmti/versionCheck/lib/.debug \
-	${JDK_HOME}/demo/jvmti/waiters/lib/.debug \
-	${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug \
-       "
-
-FILES_${JDKPN}-source =3D "${JDK_HOME}/src.zip"
-
-FILES_${JDKPN}-java =3D "${JDK_HOME}/jre/bin/java"
-
-FILES_${JDKPN}-vm-zero =3D "${JDK_HOME}/jre/lib/${JDK_ARCH}/server/"
-
-FILES_${JDKPN}-vm-shark =3D "${JDK_HOME}/jre/lib/${JDK_ARCH}/shark/"
-
-FILES_${JDKPN}-vm-cacao =3D "${JDK_HOME}/jre/lib/${JDK_ARCH}/cacao/"
-
-FILES_${JDKPN}-vm-jamvm =3D "${JDK_HOME}/jre/lib/${JDK_ARCH}/jamvm/"
-
-FILES_${JDKPN}-common =3D "${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
-                          ${JDK_HOME}/jre/THIRD_PARTY_README \
-                          ${JDK_HOME}/jre/LICENSE \
-                          ${JDK_HOME}/jre/lib \
-                         "
-
-FILES_openjdk-6-jre_append =3D " \
-	${JDK_HOME}/jre/bin/keytool \
-        ${JDK_HOME}/jre/bin/orbd \
-	${JDK_HOME}/jre/bin/pack200 \
-        ${JDK_HOME}/jre/bin/rmid \
-	${JDK_HOME}/jre/bin/rmiregistry \
-        ${JDK_HOME}/jre/bin/servertool \
-	${JDK_HOME}/jre/bin/tnameserv \
-        ${JDK_HOME}/jre/bin/unpack200 \
-	${JDK_HOME}/jre/bin/policytool \
-        ${JDK_HOME}/jre/bin/javaws \
-       "
-
-RDEPENDS_${JDKPN}-common =3D "librhino-java"
-
-RPROVIDES_${JDKPN}-vm-shark =3D "java2-vm"
-RPROVIDES_${JDKPN}-vm-zero =3D "java2-vm"
-RPROVIDES_${JDKPN}-vm-cacao =3D "java2-vm"
-RPROVIDES_${JDKPN}-vm-jamvm =3D "java2-vm"
-
-# Even though a vm is a hard dependency it is set as RRECOMMENDS so a =
single vm can get uninstalled:
-# root@beaglebone:~/java# opkg remove openjdk-6-vm-shark
-# No packages removed.
-# Collected errors:
-#  * print_dependents_warning: Package openjdk-6-vm-shark is depended =
upon by packages:
-#  * print_dependents_warning: 	openjdk-6-java
-#  * print_dependents_warning: These might cease to work if package =
openjdk-6-vm-shark is removed.
-RRECOMMENDS_${JDKPN}-java =3D "java2-vm"
-
-# For some reason shark and cacao do not automatically depends on =
-common.
-# So we add that manually.
-RDEPENDS_${JDKPN}-vm-shark =3D "${JDKPN}-common"
-RDEPENDS_${JDKPN}-vm-cacao =3D "${JDKPN}-common"
-RDEPENDS_${JDKPN}-vm-jamvm =3D "${JDKPN}-common"
-
-# There is a symlink to a .so but this one is valid.
-INSANE_SKIP_${JDKPN}-vm-shark =3D "dev-so"
-INSANE_SKIP_${JDKPN}-vm-zero =3D "dev-so"
-INSANE_SKIP_${JDKPN}-vm-cacao =3D "dev-so"
-INSANE_SKIP_${JDKPN}-vm-jamvm =3D "dev-so"
-INSANE_SKIP_${JDKPN}-common =3D "dev-so"
-
-FILES_${JDKPN}-jdk =3D " \
-                       ${JDK_HOME}/bin \
-                       ${JDK_HOME}/lib \
-                       ${JDK_HOME}/include \
-                       ${JDK_HOME}/ASSEMBLY_EXCEPTION \
-                       ${JDK_HOME}/THIRD_PARTY_README \
-                       ${JDK_HOME}/LICENSE \
-                      "
-RDEPENDS_${JDKPN}-jre =3D "${JDKPN}-java"
-RPROVIDES_${JDKPN}-jre =3D "java2-runtime"
-
-RDEPENDS_${JDKPN}-jdk =3D "${JDKPN}-jre"
-
-FILES_${JDKPN}-doc =3D "${JDK_HOME}/man"
-
-require openjdk-postinst.inc
-
-ALTERNATIVE_PRIORITY =3D "20"
diff --git a/recipes-core/openjdk/openjdk-6-release-6b24.inc =
b/recipes-core/openjdk/openjdk-6-release-6b24.inc
deleted file mode 100644
index da5299f..0000000
--- a/recipes-core/openjdk/openjdk-6-release-6b24.inc
+++ /dev/null
@@ -1,149 +0,0 @@
-require openjdk-6-common.inc
-
-LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"
-
-FILESPATH =3D. "${FILE_DIRNAME}/openjdk-6-6b24:"
-
-# needed for dis-asm.h
-DEPENDS +=3D "binutils"
-
-EXTRA_OECONF +=3D "\
-        --with-jdk-home=3D${WORKDIR}/fake-jdk \
-	--with-jar=3D${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/jar =
\
-	--with-jaxws-drop-zip=3D${DL_DIR}/${JAXWS_FILE} \
-	--with-jaf-drop-zip=3D${DL_DIR}/${JAF_FILE} \
-	--with-jaxp-drop-zip=3D${DL_DIR}/${JAXP_FILE} \
-	--with-cacao-src-zip=3D${DL_DIR}/${CACAO_VERSION}.tar.gz \
-	--with-jamvm-src-zip=3D${DL_DIR}/jamvm-${JAMVM_VERSION}.tar.gz \
-	=
--with-openjdk-src-zip=3D${DL_DIR}/openjdk-6-src-${OPENJDK_VERSION}-${OPEN=
JDK_DATE}.tar.gz \
-"
-
-# List of additional JVM to include in the build, shark is disabled =
since 1.11.1
-WITH_ADDITIONAL_VMS =3D "cacao,jamvm"
-
-# Name of the directory containing the compiled output
-BUILD_DIR =3D "openjdk.build"
-BUILD_DIR_ECJ =3D "openjdk.build-ecj"
-
-# Force arm mode for now
-ARM_INSTRUCTION_SET_armv4t =3D "ARM"
-
-ICEDTEA_URI =3D =
"http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=3Dic=
ed"
-
-OPENJDK_VERSION =3D "b24"
-OPENJDK_DATE =3D "14_nov_2011"
-OPENJDK_URI =3D =
"http://download.java.net/openjdk/jdk6/promoted/${OPENJDK_VERSION}/openjdk=
-6-src-${OPENJDK_VERSION}-${OPENJDK_DATE}.tar.gz;subdir=3Dopenjdk-src-dir;=
name=3Dopenjdk;unpack=3Dfalse"
-SRC_URI[openjdk.md5sum] =3D "0eabdd360169144336e50081b8d01001"
-SRC_URI[openjdk.sha256sum] =3D =
"f84e7f0938f4939660ff8f9c2aa164d301faa8a519f2324ceb05ad34b2e09227"
-
-JAXWS_FILE =3D "jdk6-jaxws2_1_6-2011_06_13.zip"
-JAXWS_URI =3D =
"http://icedtea.wildebeest.org/download/drops/${JAXWS_FILE};name=3Djaxws;u=
npack=3Dfalse"
-SRC_URI[jaxws.md5sum] =3D "8fd91b09b643a19a912b8a75e7a7a9d5"
-SRC_URI[jaxws.sha256sum] =3D =
"229040544e791f44906e8e7b6f6faf503c730a5d854275135f3925490d5c3be3"
-
-JAF_FILE =3D "jdk6-jaf-b20.zip"
-JAF_URI =3D =
"http://icedtea.wildebeest.org/download/drops/${JAF_FILE};name=3Djaf;unpac=
k=3Dfalse"
-SRC_URI[jaf.md5sum] =3D "bc95c133620bd68c161cac9891592901"
-SRC_URI[jaf.sha256sum] =3D =
"78c7b5c9d6271e88ee46abadd018a61f1e9645f8936cc8df1617e5f4f5074012"
-
-JAXP_FILE =3D "jaxp144_03.zip"
-JAXP_URI =3D =
"http://icedtea.wildebeest.org/download/drops/${JAXP_FILE};name=3Djaxp;unp=
ack=3Dfalse"
-SRC_URI[jaxp.md5sum] =3D "9eea471ad474040265c688858fcf09aa"
-SRC_URI[jaxp.sha256sum] =3D =
"c1a5348e17b330a7e4b18431e61a40efd2ba99a7da71102cf2c604478ef96012"
-
-CACAO_URI =3D =
"http://icedtea.wildebeest.org/download/drops/cacao/${CACAO_VERSION}.tar.g=
z;name=3Dcacao;unpack=3Dfalse"
-CACAO_VERSION =3D "cff92704c4e0"
-SRC_URI[cacao.md5sum] =3D "40b811b8b7f01b51cd21e62255691bc7"
-SRC_URI[cacao.sha256sum] =3D =
"dc768c9d097fb056ad34fc6d5a57e8fd4f3b24bf515be92acc5ee4208160eb3f"
-
-JAMVM_URI =3D =
"http://icedtea.wildebeest.org/download/drops/jamvm/jamvm-${JAMVM_VERSION}=
.tar.gz;name=3Djamvm;unpack=3Dfalse"
-JAMVM_VERSION =3D "4617da717ecb05654ea5bb9572338061106a414d"
-SRC_URI[jamvm.md5sum] =3D "740c2587502831cac6797d1233a7e27b"
-SRC_URI[jamvm.sha256sum] =3D =
"47fce7bd556c1b1d29a93b8c45497e0d872b48b7f535066b303336f29d0f0d8d"
-
-# Allow overriding this separately
-OEPATCHES =3D "\
-	file://build-hacks.patch \
-	file://cacao-libtoolize.patch \
-	file://cacao-loadavg-makefile.patch \
-	file://fix_hotspot_crosscompile.patch \
-	file://cacao-loadavg.patch;apply=3Dno \
-	file://cacao-arm-ucontext.patch;apply=3Dno \
-	"
-
-# Allow overriding this separately
-ICEDTEAPATCHES =3D "\
-	file://icedtea-launcher-stdc++.patch;apply=3Dno \
-	file://icedtea-crosscompile-fix.patch;apply=3Dno \
-	file://icedtea-hostbuildcc.patch;apply=3Dno \
-	file://icedtea-unbreak-float.patch;apply=3Dno \
-	file://icedtea-remove_werror.patch;apply=3Dno \
-        file://icedtea-libnet-renaming.patch;apply=3Dno \
-	file://icedtea-fix-xrender.patch;apply=3Dno \
-	file://icedtea-shark-arm-linux-cpu-detection.patch;apply=3Dno \
-        file://icedtea-zero-hotspotfix.patch;apply=3Dno \
-        file://icedtea-jdk-powerpc-atomic64.patch;apply=3Dno \
-	"
-ICEDTEAPATCHES_append_e5500-64b =3D " \
-        file://icedtea-jdk-sizers-crosscompile-hack.patch;apply=3Dno \
-	"
-ICEDTEAPATCHES_append_e5500 =3D " \
-        file://icedtea-jdk-sizers-crosscompile-hack.patch;apply=3Dno \
-	"
-ICEDTEAPATCHES_append_e6500-64b =3D " \
-        file://icedtea-jdk-sizers-crosscompile-hack.patch;apply=3Dno \
-        "
-ICEDTEAPATCHES_append_e6500 =3D " \
-        file://icedtea-jdk-sizers-crosscompile-hack.patch;apply=3Dno \
-        "
-
-ICEDTEAPATCHES_append_libc-uclibc =3D " \
-        file://icedtea-hotspot-isfinte.patch;apply=3Dno \
-        file://icedtea-hotspot-glibc-version.patch;apply=3Dno \
-        file://icedtea-hotspot-loadavg.patch;apply=3Dno \
-        file://icedtea-hotspot-isnanf.patch;apply=3Dno \
-        file://icedtea-jdk-iconv-uclibc.patch;apply=3Dno \
-        file://icedtea-jdk-remove-unused-backtrace.patch;apply=3Dno \
-        file://icedtea-jdk-unpack-uclibc.patch;apply=3Dno \
-	file://icedtea-hotspot-dlvsym-uclibc.patch;apply=3Dno \
-        "
-
-# Allow overriding this separately
-DISTRIBUTION_PATCHES =3D "\
-	patches/icedtea-launcher-stdc++.patch \
-	patches/icedtea-crosscompile-fix.patch \
-	patches/icedtea-hostbuildcc.patch \
-	patches/icedtea-unbreak-float.patch \
-	patches/icedtea-remove_werror.patch \
-        patches/icedtea-libnet-renaming.patch \
-	patches/icedtea-fix-xrender.patch \
-	patches/icedtea-shark-arm-linux-cpu-detection.patch \
-	patches/icedtea-zero-hotspotfix.patch \
-	patches/icedtea-jdk-powerpc-atomic64.patch \
-	"
-
-DISTRIBUTION_PATCHES_append_libc-uclibc =3D "\
-        patches/icedtea-hotspot-isfinte.patch \
-        patches/icedtea-hotspot-isnanf.patch \
-        patches/icedtea-hotspot-glibc-version.patch \
-        patches/icedtea-hotspot-loadavg.patch \
-        patches/icedtea-jdk-iconv-uclibc.patch \
-        patches/icedtea-jdk-remove-unused-backtrace.patch \
-        patches/icedtea-jdk-unpack-uclibc.patch \
-	patches/icedtea-hotspot-dlvsym-uclibc.patch \
-        "
-DISTRIBUTION_PATCHES_append_e5500-64b =3D " \
-       patches/icedtea-jdk-sizers-crosscompile-hack.patch \
-       "
-
-DISTRIBUTION_PATCHES_append_e5500 =3D " \
-       patches/icedtea-jdk-sizers-crosscompile-hack.patch \
-       "
-DISTRIBUTION_PATCHES_append_e6500-64b =3D " \
-       patches/icedtea-jdk-sizers-crosscompile-hack.patch \
-       "
-
-DISTRIBUTION_PATCHES_append_e6500 =3D " \
-       patches/icedtea-jdk-sizers-crosscompile-hack.patch \
-       "
-export DISTRIBUTION_PATCHES
diff --git a/recipes-core/openjdk/openjdk-6-release-6b27.inc =
b/recipes-core/openjdk/openjdk-6-release-6b27.inc
deleted file mode 100644
index eddb4e4..0000000
--- a/recipes-core/openjdk/openjdk-6-release-6b27.inc
+++ /dev/null
@@ -1,31 +0,0 @@
-require openjdk-6-release-6b24.inc
-
-FILESPATH =3D. "${FILE_DIRNAME}/openjdk-6-6b27:"
-
-EXTRA_OECONF +=3D "--disable-downloading"
-
-OPENJDK_VERSION =3D "b27"
-OPENJDK_DATE =3D "26_oct_2012"
-SRC_URI[openjdk.md5sum] =3D "3a0963158e07c8829c8bd31a698bd23d"
-SRC_URI[openjdk.sha256sum] =3D =
"044c3877b15940ff04f8aa817337f2878a00cc89674854557f1a02f15b1802a0"
-
-CACAO_VERSION =3D "68fe50ac34ec"
-SRC_URI[cacao.md5sum] =3D "d7607c455d36ba69651dfea38546922c"
-SRC_URI[cacao.sha256sum] =3D =
"b8230f20d7022f9230bbfea13b2f3f179b2f42db40138ac6d32c82fc418ffc3a"
-
-JAMVM_VERSION =3D "0972452d441544f7dd29c55d64f1ce3a5db90d82"
-SRC_URI[jamvm.md5sum] =3D "f4616713ec609e35aa8070811bd952aa"
-SRC_URI[jamvm.sha256sum] =3D =
"bfa706402ac934d24f7119eb78f6be65e91439a4b2e49dbcc21e288137808f03"
-
-JAXP_FILE =3D "jaxp144_04.zip"
-SRC_URI[jaxp.md5sum] =3D "0ace787aa12177d201947e8ba0ba9bdd"
-SRC_URI[jaxp.sha256sum] =3D =
"490f696218c1fed9cb180680af883fe309b414fec232e9cec19645e12ad0b43c"
-
-
-ICEDTEAPATCHES +=3D "file://icedtea-jdk-rmi-crosscompile.patch;apply=3Dno=
 \
-                   file://icedtea-disable-sane-alsa.patch;apply=3Dno \
-                  "
-
-DISTRIBUTION_PATCHES +=3D "patches/icedtea-jdk-rmi-crosscompile.patch \
-                         patches/icedtea-disable-sane-alsa.patch \
-                        "
diff --git a/recipes-core/openjdk/openjdk-6-release-6b32.inc =
b/recipes-core/openjdk/openjdk-6-release-6b32.inc
deleted file mode 100644
index c1badcb..0000000
--- a/recipes-core/openjdk/openjdk-6-release-6b32.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-require openjdk-6-release-6b27.inc
-
-DEPENDS +=3D "krb5 libxslt-native"
-
-FILESPATH =3D. "${FILE_DIRNAME}/openjdk-6-6b32:"
-
-ICEDTEAPATCHES +=3D =
"file://icedtea-openjdk-remove-currency-data-generation-expi.patch;apply=3D=
no"
-
-EXTRA_OECONF +=3D "--disable-downloading \
-                 --enable-system-zlib \
-                 --enable-system-jpeg \
-                 --enable-system-png \
-                 --enable-system-gif \
-                 --disable-system-lcms \
-                "
-do_configure_append () {
-    patch -p0 =
<${WORKDIR}/icedtea-openjdk-remove-currency-data-generation-expi.patch
-    cd openjdk-ecj
-    patch -p1 =
<${WORKDIR}/icedtea-openjdk-remove-currency-data-generation-expi.patch
-    cd ..
-}
-
-OPENJDK_VERSION =3D "b32"
-OPENJDK_DATE =3D "15_jul_2014"
=
-#https://java.net/projects/openjdk6/downloads/download/openjdk-6-src-b31-=
15_apr_2014.tar.gz
-OPENJDK_URI =3D =
"https://java.net/projects/openjdk6/downloads/download/openjdk-6-src-${OPE=
NJDK_VERSION}-${OPENJDK_DATE}.tar.gz;subdir=3Dopenjdk-src-dir;name=3Dopenj=
dk;unpack=3Dfalse"
-SRC_URI[openjdk.md5sum] =3D "a97c28256a61be76e3047c31e0349c04"
-SRC_URI[openjdk.sha256sum] =3D =
"fe1eb7053fddfd325152f95f9719325e4ba67534a26fa690ca24fab75461a1fa"
-
-JAMVM_VERSION =3D "ec18fb9e49e62dce16c5094ef1527eed619463aa"
-SRC_URI[jamvm.md5sum] =3D "d50ae193d01a9251e10679c7a2cc6ff1"
-SRC_URI[jamvm.sha256sum] =3D =
"31810266666c23822942aac62a78019c2c4589e1c5ee48329cbf42652d4437bc"
-
-JAXP_FILE =3D "jaxp144_04.zip"
-SRC_URI[jaxp.md5sum] =3D "0ace787aa12177d201947e8ba0ba9bdd"
-SRC_URI[jaxp.sha256sum] =3D =
"490f696218c1fed9cb180680af883fe309b414fec232e9cec19645e12ad0b43c"
diff --git a/recipes-core/openjdk/openjdk-6/build-hacks.patch =
b/recipes-core/openjdk/openjdk-6/build-hacks.patch
deleted file mode 100644
index 02a8300..0000000
--- a/recipes-core/openjdk/openjdk-6/build-hacks.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Index: icedtea6-1.8/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.8.orig/Makefile.am	2010-04-12 23:55:51.754838172 =
+0200
-+++ icedtea6-1.8/Makefile.am	2010-06-16 15:17:10.224708601 +0200
-@@ -477,6 +477,11 @@
- 	JAVAC=3D"" \
- 	JAVA_HOME=3D"" \
- 	JDK_HOME=3D"" \
-+        OE_CFLAGS=3D"$(OE_CFLAGS)" \
-+        OE_CPPFLAGS=3D"$(OE_CPPFLAGS)" \
-+        OE_CXXFLAGS=3D"$(OE_CXXFLAGS)" \
-+        OE_LDFLAGS=3D"$(OE_LDFLAGS)" \
-+        OE_LAUNCHER_LDFLAGS=3D"$(OE_LAUNCHER_LDFLAGS)" \
- 	DISTRIBUTION_ID=3D"$(DIST_ID)" \
- 	DERIVATIVE_ID=3D"$(ICEDTEA_NAME) =
$(PACKAGE_VERSION)$(ICEDTEA_REV)" \
- 	DEBUG_CLASSFILES=3D"true" \
-Index: icedtea6-1.8/javac.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.8.orig/javac.in	2010-03-25 15:10:41.714835519 +0100
-+++ icedtea6-1.8/javac.in	2010-06-16 15:14:31.205334756 +0200
-@@ -35,7 +35,9 @@
- elif [ ! -z "@ECJ@" ] ; then
-     @ECJ@ -1.5 -nowarn $bcoption $NEW_ARGS
- else
-+    # Compiling hotspot-tools consumes tons of memory and exceeds any =
default
-+    # limits for jamvm and cacao.
-     CLASSPATH=3D@ECJ_JAR@${CLASSPATH:+:}$CLASSPATH \
--     @JAVA@ org.eclipse.jdt.internal.compiler.batch.Main -1.5 -nowarn =
$bcoption $NEW_ARGS
-+     @JAVA@ -Xmx1024m org.eclipse.jdt.internal.compiler.batch.Main =
-1.5 -nowarn $bcoption $NEW_ARGS
- fi
-=20
diff --git =
a/recipes-core/openjdk/openjdk-6/cacao-disable-stackbase-check.patch =
b/recipes-core/openjdk/openjdk-6/cacao-disable-stackbase-check.patch
deleted file mode 100644
index d676142..0000000
--- a/recipes-core/openjdk/openjdk-6/cacao-disable-stackbase-check.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: cacao/cacao/src/mm/boehm-gc/os_dep.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- cacao/cacao/src/mm/boehm-gc/os_dep.c	2009-02-15 =
16:29:15.000000000 +0100
-+++ cacao/cacao/src/mm/boehm-gc/os_dep.c	2009-02-15 =
16:29:24.000000000 +0100
-@@ -1077,7 +1077,6 @@
-       c =3D stat_buf[buf_offset++];
-     }
-     close(f);
--    if (result < 0x10000000) ABORT("Absurd stack bottom value");
-     return (ptr_t)result;
-   }
-=20
diff --git a/recipes-core/openjdk/openjdk-6/cacao-libtoolize.patch =
b/recipes-core/openjdk/openjdk-6/cacao-libtoolize.patch
deleted file mode 100644
index a153a32..0000000
--- a/recipes-core/openjdk/openjdk-6/cacao-libtoolize.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Index: icedtea6-1.8.5/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.8.5.orig/Makefile.am	2011-02-04 18:29:58.826701224 =
+0100
-+++ icedtea6-1.8.5/Makefile.am	2011-02-04 18:31:53.430016002 +0100
-@@ -1918,10 +1918,13 @@
- if BUILD_CACAO
- if !USE_SYSTEM_CACAO
- 	cd cacao/cacao && \
-+        rm -f libtool && \
-+        autoreconf --verbose --install --force --no-recursive && \
- 	$(ARCH_PREFIX) ./configure \
- 	  --host=3D$(host_alias) \
- 	  --build=3D$(build_alias) \
- 	  --target=3D$(target_alias) \
-+          --with-libtool-sysroot \
- 	  --prefix=3D$(abs_top_builddir)/cacao/install \
- 	  --with-java-runtime-library=3Dopenjdk \
- 	  --with-java-runtime-library-prefix=3D$(abs_top_builddir)/openjdk=
 \
diff --git a/recipes-core/openjdk/openjdk-6/cacao-vfp-compat.patch =
b/recipes-core/openjdk/openjdk-6/cacao-vfp-compat.patch
deleted file mode 100644
index 09ba984..0000000
--- a/recipes-core/openjdk/openjdk-6/cacao-vfp-compat.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Index: cacao/cacao/src/vm/jit/arm/codegen.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- cacao/cacao/src/vm/jit/arm/codegen.c	2008-10-01 =
16:23:21.439856241 +0200
-+++ cacao/cacao/src/vm/jit/arm/codegen.c	2008-10-01 =
16:41:24.278841537 +0200
-@@ -2353,10 +2353,12 @@
-=20
- 			d =3D md->returntype.type;
-=20
--#if !defined(__SOFTFP__)
-+#if !defined(__SOFTFP__) && !defined(__VFP_FP__)
- 			/* TODO: this is only a hack, since we use R0/R1 =
for float
- 			   return!  this depends on gcc; it is =
independent from
--			   our ENABLE_SOFTFLOAT define */
-+			   our ENABLE_SOFTFLOAT define
-+			   It is only needed for -mfpu=3Dfpa =
-mfloat-abi=3Dhard!
-+			 */
- 			if (iptr->opc =3D=3D ICMD_BUILTIN && d !=3D =
TYPE_VOID && IS_FLT_DBL_TYPE(d)) {
- #if 0 && !defined(NDEBUG)
- 				dolog("BUILTIN that returns float or =
double (%s.%s)", m->clazz->name->text, m->name->text);
-@@ -3019,7 +3021,7 @@
- 	s1 =3D (s4) (cd->mcodeptr - cd->mcodebase);
- 	M_RECOMPUTE_PV(s1);
-=20
--#if !defined(__SOFTFP__)
-+#if !defined(__SOFTFP__) && !defined(__VFP_FP__)
- 	/* TODO: this is only a hack, since we use R0/R1 for float =
return! */
- 	/* this depends on gcc; it is independent from our =
ENABLE_SOFTFLOAT define */
- 	if (md->returntype.type !=3D TYPE_VOID && =
IS_FLT_DBL_TYPE(md->returntype.type)) {
-@@ -3030,7 +3032,7 @@
- 		/* M_CAST_FLT_TO_INT_TYPED(md->returntype.type, =
REG_FRESULT, REG_RESULT_TYPED(md->returntype.type)); */
- 		if (IS_2_WORD_TYPE(md->returntype.type)) {
- 			DCD(0xed2d8102); /* stfd    f0, [sp, #-8]! */
--			M_LDRD_UPDATE(REG_RESULT_PACKED, REG_SP, 8);
-+ 			M_LDRD_UPDATE(REG_RESULT_PACKED, REG_SP, 8);
- 		} else {
- 			DCD(0xed2d0101); /* stfs    f0, [sp, #-4]!*/
- 			M_LDR_UPDATE(REG_RESULT, REG_SP, 4);
diff --git a/recipes-core/openjdk/openjdk-6/fix-llvm-libs.patch =
b/recipes-core/openjdk/openjdk-6/fix-llvm-libs.patch
deleted file mode 100644
index 7c82daf..0000000
--- a/recipes-core/openjdk/openjdk-6/fix-llvm-libs.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: icedtea6-1.8/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.8.orig/configure.ac
-+++ icedtea6-1.8/configure.ac
-@@ -472,7 +472,7 @@
-     if test "x$LLVM_SHARED_LIB" !=3D x && echo "$flag" | grep -q =
'^-lLLVM'; then
-       continue
-     fi
--    if echo "$flag" | grep -q '^-l'; then
-+    if echo "$flag" | grep -q '^-l\|.so'; then
-       if test "x$LLVM_LIBS" !=3D "x"; then
-         LLVM_LIBS=3D"$LLVM_LIBS "
-       fi
diff --git =
a/recipes-core/openjdk/openjdk-6/fix_hotspot_crosscompile.patch =
b/recipes-core/openjdk/openjdk-6/fix_hotspot_crosscompile.patch
deleted file mode 100644
index 3d4a68c..0000000
--- a/recipes-core/openjdk/openjdk-6/fix_hotspot_crosscompile.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-Index: icedtea6-1.8/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.8.orig/Makefile.am	2010-06-18 12:31:34.534667003 =
+0200
-+++ icedtea6-1.8/Makefile.am	2010-06-18 12:31:34.714667729 +0200
-@@ -488,6 +488,7 @@
- 	DEBUG_BINARIES=3D"true" \
- 	ALT_DROPS_DIR=3D"$(abs_top_builddir)/drops" \
- 	VERBOSE=3D"$(VERBOSE)" \
-+	CC_FOR_BUILD=3D"$(CC_FOR_BUILD)" \
- 	ALT_NETX_DIST=3D"$(abs_top_builddir)/netx.build" \
- 	ALT_LIVECONNECT_DIST=3D"$(abs_top_builddir)/liveconnect"
-=20
-Index: icedtea6-1.8/acinclude.m4
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.8.orig/acinclude.m4	2010-04-10 21:58:40.804836529 =
+0200
-+++ icedtea6-1.8/acinclude.m4	2010-06-18 12:31:34.714667729 +0200
-@@ -900,6 +900,21 @@
-   AC_SUBST(ALT_CACAO_SRC_DIR)
- ])
-=20
-+AC_DEFUN([AC_CHECK_WITH_CC_FOR_BUILD],
-+[
-+  AC_MSG_CHECKING(for compiler used for subsidiary programs)
-+  AC_ARG_WITH([cc-for-build],
-+              [AS_HELP_STRING(--with-cc-for-build,specify the compiler =
for subsidiary (helper) programs)],
-+  [
-+    CC_FOR_BUILD=3D"${withval}"
-+  ],
-+  [
-+    CC_FOR_BUILD=3D"\$(CC)"
-+  ])
-+  AC_MSG_RESULT(${CC_FOR_BUILD})
-+  AC_SUBST(CC_FOR_BUILD)
-+])
-+
- AC_DEFUN([AC_CHECK_WITH_GCJ],
- [
-   AC_MSG_CHECKING([whether to compile ecj natively])
-Index: icedtea6-1.8/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.8.orig/configure.ac	2010-04-12 13:46:18.821086023 =
+0200
-+++ icedtea6-1.8/configure.ac	2010-06-18 12:31:34.724666321 +0200
-@@ -44,6 +44,7 @@
- IT_CHECK_FOR_MERCURIAL
- IT_OBTAIN_HG_REVISIONS
- AC_PATH_TOOL([LSB_RELEASE],[lsb_release])
-+AC_CHECK_WITH_CC_FOR_BUILD
- AC_CHECK_WITH_GCJ
- AC_CHECK_WITH_HOTSPOT_BUILD
- AC_PATH_TOOL([LINUX32],[linux32])
-Index: icedtea6-1.8/ports/hotspot/make/linux/makefiles/zeroshark.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.8.orig/ports/hotspot/make/linux/makefiles/zeroshark.make	=
2010-03-25 15:10:42.061085966 +0100
-+++ icedtea6-1.8/ports/hotspot/make/linux/makefiles/zeroshark.make	=
2010-06-18 12:40:42.834666505 +0200
-@@ -32,6 +32,13 @@
- Obj_Files +=3D thumb2.o
-=20
- CFLAGS +=3D -DHOTSPOT_ASM
-+CCFLAGS +=3D -DHOTSPOT_ASM
-+
-+ifeq ($(CROSS_COMPILATION), true)
-+  C_COMPILE_FOR_MKBC =3D $(CC_FOR_BUILD)
-+else
-+  C_COMPILE_FOR_MKBC =3D $(C_COMPILE)
-+endif
-=20
- %.o: %.S
- 	@echo Assembling $<
-@@ -43,20 +50,20 @@
-=20
- offsets_arm.s:	mkoffsets
- 	@echo Generating assembler offsets
--	./mkoffsets > $@
-+	$(QEMU) ./mkoffsets > $@
-=20
- bytecodes_arm.s: bytecodes_arm.def mkbc
- 	@echo Generatine ARM assembler bytecode sequences
- 	$(CC_COMPILE) -E -x c++ - < $< | ./mkbc - $@ $(COMPILE_DONE)
-=20
--mkbc:	$(GAMMADIR)/tools/mkbc.c
-+mkbc: $(GAMMADIR)/tools/mkbc.c
- 	@echo Compiling mkbc tool
--	$(CC_COMPILE) -o $@ $< $(COMPILE_DONE)
-+	$(C_COMPILE_FOR_MKBC) -o $@ $< $(COMPILE_DONE)
-=20
--mkoffsets:	asm_helper.cpp
-+mkoffsets: asm_helper.cpp
- 	@echo Compiling offset generator
- 	$(QUIETLY) $(REMOVE_TARGET)
--	$(CC_COMPILE) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) -static -fuse-ld=3Dbfd -DSTATIC_OFFSETS -o $@ $< =
$(COMPILE_DONE)
-=20
- endif
-=20
diff --git =
a/recipes-core/openjdk/openjdk-6/icedtea-crosscompile-fix.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-crosscompile-fix.patch
deleted file mode 100644
index 6ec83bb..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-crosscompile-fix.patch
+++ /dev/null
@@ -1,229 +0,0 @@
-Index: openjdk/jdk/make/sun/awt/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/sun/awt/Makefile	2009-01-24 =
17:54:57.000000000 +0100
-+++ openjdk/jdk/make/sun/awt/Makefile	2009-01-24 17:55:07.000000000 =
+0100
-@@ -509,10 +509,10 @@
- #
-=20
- ifeq ($(PLATFORM), linux)
--CPPFLAGS +=3D -I$(MOTIF_DIR)/include \
--            -I$(OPENWIN_HOME)/include \
--            -I$(OPENWIN_HOME)/include/X11/extensions \
--            -I$(PLATFORM_SRC)/native/$(PKGDIR)/font=20
-+#CPPFLAGS +=3D -I$(MOTIF_DIR)/include \
-+#            -I$(OPENWIN_HOME)/include \
-+#            -I$(OPENWIN_HOME)/include/X11/extensions \
-+CPPFLAGS +=3D  -I$(PLATFORM_SRC)/native/$(PKGDIR)/font=20
- endif
- CPPFLAGS +=3D -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
-             -I$(SHARE_SRC)/native/$(PKGDIR)/../font \
-@@ -536,7 +536,7 @@
- 	    $(EVENT_MODEL)
-=20
- ifeq ($(PLATFORM), linux)
--LDFLAGS +=3D -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
-+#LDFLAGS +=3D -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
- endif
-=20
- LDFLAGS +=3D -L$(LIBDIR)/$(LIBARCH)/$(TSOBJDIR) \
-Index: openjdk/jdk/make/sun/awt/mawt.gmk
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/sun/awt/mawt.gmk	2009-01-24 =
17:54:57.000000000 +0100
-+++ openjdk/jdk/make/sun/awt/mawt.gmk	2009-01-24 17:55:07.000000000 =
+0100
-@@ -194,8 +194,8 @@
- CPPFLAGS +=3D -I$(CUPS_HEADERS_PATH)
-=20
- ifndef HEADLESS
--CPPFLAGS +=3D -I$(OPENWIN_HOME)/include=20
--LDFLAGS  +=3D -L$(OPENWIN_LIB)
-+#CPPFLAGS +=3D -I$(OPENWIN_HOME)/include=20
-+#LDFLAGS  +=3D -L$(OPENWIN_LIB)
-=20
- endif # !HEADLESS
-=20
-@@ -223,8 +223,8 @@
-=20
- ifeq ($(PLATFORM), linux)
- # Checking for the X11/extensions headers at the additional location
--  CPPFLAGS +=3D -I/X11R6/include/X11/extensions \
--              -I/usr/include/X11/extensions
-+#  CPPFLAGS +=3D -I/X11R6/include/X11/extensions \
-+#              -I/usr/include/X11/extensions
- endif
-=20
- ifeq ($(PLATFORM), solaris)
-Index: openjdk/jdk/make/sun/xawt/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/sun/xawt/Makefile	2009-01-24 =
17:54:57.000000000 +0100
-+++ openjdk/jdk/make/sun/xawt/Makefile	2009-01-24 17:55:07.000000000 =
+0100
-@@ -123,11 +123,12 @@
-         -I$(PLATFORM_SRC)/native/sun/awt=20
-=20
- ifeq ($(PLATFORM), linux)
-+# Very unsuitable for cross-compilation.
- # Allows for builds on Debian GNU Linux, X11 is in a different place=20=

--  CPPFLAGS +=3D -I/usr/X11R6/include/X11/extensions \
--              -I/usr/include/X11/extensions \
--              -I$(MOTIF_DIR)/include \
--              -I$(OPENWIN_HOME)/include=20
-+#  CPPFLAGS +=3D -I/usr/X11R6/include/X11/extensions \
-+#              -I/usr/include/X11/extensions \
-+#              -I$(MOTIF_DIR)/include \
-+#              -I$(OPENWIN_HOME)/include=20
- endif
-=20
- ifeq ($(PLATFORM), solaris)
-Index: openjdk/hotspot/make/linux/makefiles/vm.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/hotspot/make/linux/makefiles/vm.make	2009-01-24 =
17:54:57.000000000 +0100
-+++ openjdk/hotspot/make/linux/makefiles/vm.make	2009-01-24 =
17:55:07.000000000 +0100
-@@ -170,6 +170,7 @@
- LIBS_VM   +=3D $(LLVM_LIBS)
- endif
-=20
-+LFLAGS_VM +=3D $(OE_LDFLAGS)
- LINK_VM =3D $(LINK_LIB.c)
-=20
- # rule for building precompiled header
-Index: openjdk/hotspot/make/linux/makefiles/buildtree.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/hotspot/make/linux/makefiles/buildtree.make	=
2009-01-24 17:54:57.000000000 +0100
-+++ openjdk/hotspot/make/linux/makefiles/buildtree.make	=
2009-01-24 17:55:07.000000000 +0100
-@@ -343,7 +343,7 @@
- 	echo "rm -f Queens.class"; \
- 	echo "\$${JAVA_HOME}/bin/javac -d . =
$(GAMMADIR)/make/test/Queens.java"; \
- 	echo '[ -f gamma_g ] && { gamma=3Dgamma_g; }'; \
--	echo './$${gamma:-gamma} $(TESTFLAGS) Queens < /dev/null'; \
-+	echo 'echo Silently skipping the execution of the gamma =
program'; \
- 	) > $@
- 	$(QUIETLY) chmod +x $@
-=20
-Index: openjdk/corba/make/common/Defs-linux.gmk
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/corba/make/common/Defs-linux.gmk	2009-01-24 =
17:54:57.000000000 +0100
-+++ openjdk/corba/make/common/Defs-linux.gmk	2009-01-24 =
17:55:07.000000000 +0100
-@@ -82,9 +82,9 @@
- CC_NO_OPT      =3D
-=20
- ifeq ($(PRODUCT), java)
--    _OPT =3D $(CC_HIGHER_OPT)
-+    _OPT =3D $(OE_CFLAGS)
- else
--    _OPT =3D $(CC_LOWER_OPT)
-+    _OPT =3D $(OE_CFLAGS)
-     CPPFLAGS_DBG    +=3D -DLOGGING=20
- endif
-=20
-@@ -94,7 +94,7 @@
- #    as the default.
- CFLAGS_REQUIRED_alpha   +=3D -mieee -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_amd64   +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
--CFLAGS_REQUIRED_arm     +=3D -D_LITTLE_ENDIAN
-+CFLAGS_REQUIRED_arm     +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_hppa    +=3D
- CFLAGS_REQUIRED_i586    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_ia64    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
-@@ -221,7 +221,7 @@
- #
- # -L paths for finding and -ljava
- #
--LDFLAGS_OPT     =3D -Xlinker -O1
-+LDFLAGS_OPT     =3D $(OE_LDFLAGS)
- LDFLAGS_COMMON +=3D -L$(LIBDIR)/$(LIBARCH)
- LDFLAGS_COMMON +=3D =
-Wl,-soname=3D$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
-=20
-Index: openjdk/jdk/make/common/Defs-linux.gmk
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/jdk/make/common/Defs-linux.gmk	2009-01-24 =
17:54:57.000000000 +0100
-+++ openjdk/jdk/make/common/Defs-linux.gmk	2009-01-24 =
17:55:07.000000000 +0100
-@@ -92,9 +92,9 @@
- CC_NO_OPT      =3D
-=20
- ifeq ($(PRODUCT), java)
--    _OPT =3D $(CC_HIGHER_OPT)
-+    _OPT =3D $(OE_CFLAGS)
- else
--    _OPT =3D $(CC_LOWER_OPT)
-+    _OPT =3D $(OE_CFLAGS)
-     CPPFLAGS_DBG    +=3D -DLOGGING=20
- endif
-=20
-@@ -104,7 +104,7 @@
- #    as the default.
- CFLAGS_REQUIRED_alpha   +=3D -mieee -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_amd64   +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
--CFLAGS_REQUIRED_arm     +=3D -D_LITTLE_ENDIAN
-+CFLAGS_REQUIRED_arm     +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_hppa    +=3D
- CFLAGS_REQUIRED_i586    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_ia64    +=3D -fno-omit-frame-pointer -D_LITTLE_ENDIAN
-@@ -231,7 +231,7 @@
- #
- # -L paths for finding and -ljava
- #
--LDFLAGS_OPT     =3D -Xlinker -O1
-+LDFLAGS_OPT     =3D $(OE_LDFLAGS)
- LDFLAGS_COMMON +=3D -L$(LIBDIR)/$(LIBARCH)
- LDFLAGS_COMMON +=3D =
-Wl,-soname=3D$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
-=20
-Index: openjdk/hotspot/make/linux/makefiles/gcc.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/hotspot/make/linux/makefiles/gcc.make	2009-01-24 =
17:54:57.000000000 +0100
-+++ openjdk/hotspot/make/linux/makefiles/gcc.make	2009-01-24 =
17:55:07.000000000 +0100
-@@ -119,7 +119,7 @@
- CFLAGS_WARN/BYFILE =3D =
$(CFLAGS_WARN/$@)$(CFLAGS_WARN/DEFAULT$(CFLAGS_WARN/$@))=20
-=20
- # The flags to use for an Optimized g++ build
--OPT_CFLAGS +=3D -O3
-+OPT_CFLAGS +=3D $(OE_CFLAGS)
-=20
- # Hotspot uses very unstrict aliasing turn this optimization off
- OPT_CFLAGS +=3D -fno-strict-aliasing
-@@ -148,7 +148,7 @@
- endif
-=20
- # Enable linker optimization
--LFLAGS +=3D -Xlinker -O1
-+LFLAGS +=3D $(OE_LDFLAGS)
-=20
- # Use $(MAPFLAG:FILENAME=3Dreal_file_name) to specify a map file.
- MAPFLAG =3D -Xlinker --version-script=3DFILENAME
-Index: openjdk/hotspot/make/linux/makefiles/launcher.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/hotspot/make/linux/makefiles/launcher.make	=
2009-01-24 17:55:19.000000000 +0100
-+++ openjdk/hotspot/make/linux/makefiles/launcher.make	2009-01-24 =
17:56:05.000000000 +0100
-@@ -44,7 +44,7 @@
-   LIBS_LAUNCHER             +=3D $(STATIC_STDCXX) $(LIBS)
- else
-   LAUNCHER.o                 =3D launcher.o
--  LFLAGS_LAUNCHER           +=3D -L `pwd`
-+  LFLAGS_LAUNCHER           +=3D -L `pwd` $(OE_LAUNCHER_LDFLAGS) =
$(OE_LDFLAGS)
-   LIBS_LAUNCHER             +=3D -l$(JVM) $(LIBS) -lstdc++
- endif
-=20
-Index: icedtea6-1.8.5/build/openjdk/jdk/make/sun/xawt/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/sun/xawt/Makefile	2011-03-14 14:17:03.926207269 =
+0100
-+++ openjdk/jdk/make/sun/xawt/Makefile	2011-03-14 14:30:11.956186631 =
+0100
-@@ -245,7 +245,7 @@
- 	    $(CHMOD) +w $@;\
- 	else	\
- 	    $(ECHO) GENERATING $@; \
--	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
-+	    $(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
- 	fi
- 	@if [ "$(DOCOMPARE)$(suffix $@)" =3D "true.64" ]; then \
- 	    $(ECHO) COMPARING $@ and =
$(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
-Index: openjdk/hotspot/make/linux/makefiles/jsig.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/make/linux/makefiles/jsig.make	2010-02-17 =
04:11:04.000000000 +0100
-+++ openjdk/hotspot/make/linux/makefiles/jsig.make	2011-11-18 =
22:56:03.923900991 +0100
-@@ -39,7 +39,7 @@
- # cause problems with interposing. See CR: 6466665
- # LFLAGS_JSIG +=3D $(MAPFLAG:FILENAME=3D$(LIBJSIG_MAPFILE))
-=20
--LFLAGS_JSIG +=3D -D_GNU_SOURCE -D_REENTRANT
-+LFLAGS_JSIG +=3D -D_GNU_SOURCE -D_REENTRANT $(OE_LDFLAGS)
-=20
- # DEBUG_BINARIES overrides everything, use full -g debug information
- ifeq ($(DEBUG_BINARIES), true)
diff --git =
a/recipes-core/openjdk/openjdk-6/icedtea-fix-jar-command.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-fix-jar-command.patch
deleted file mode 100644
index 59d806d..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-fix-jar-command.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: icedtea6-1.8/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.8.orig/Makefile.am	2010-06-17 10:29:13.654666801 =
+0200
-+++ icedtea6-1.8/Makefile.am	2010-06-17 10:30:50.334670771 +0200
-@@ -1750,7 +1745,7 @@
- stamps/rewrite-rhino.stamp: stamps/rewriter.stamp $(RHINO_JAR)
- if WITH_RHINO
- 	mkdir -p rhino/rhino.{old,new}
--	(cd rhino/rhino.old ; jar xf $(RHINO_JAR))
-+	(cd rhino/rhino.old ; $(ICEDTEA_BOOT_DIR)/bin/jar xf =
$(RHINO_JAR))
- 	$(ICEDTEA_BOOT_DIR)/bin/java -cp $(abs_top_builddir)/rewriter \
- 	  com.redhat.rewriter.ClassRewriter \
- 	  $(abs_top_builddir)/rhino/rhino.old =
$(abs_top_builddir)/rhino/rhino.new \
diff --git a/recipes-core/openjdk/openjdk-6/icedtea-hasgettransfer.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-hasgettransfer.patch
deleted file mode 100644
index 01dcb82..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-hasgettransfer.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-Index: =
openjdk/jdk/src/share/classes/javax/swing/HasGetTransferHandler.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ =
openjdk/jdk/src/share/classes/javax/swing/HasGetTransferHandler.java	=
2011-11-18 20:44:00.281649848 +0100
-@@ -0,0 +1,38 @@
-+/*
-+ * Copyright 2000-2006 Sun Microsystems, Inc.  All Rights Reserved.
-+ * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
-+ *
-+ * This code is free software; you can redistribute it and/or modify =
it
-+ * under the terms of the GNU General Public License version 2 only, =
as
-+ * published by the Free Software Foundation.  Sun designates this
-+ * particular file as subject to the "Classpath" exception as provided
-+ * by Sun in the LICENSE file that accompanied this code.
-+ *
-+ * This code is distributed in the hope that it will be useful, but =
WITHOUT
-+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
-+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public =
License
-+ * version 2 for more details (a copy is included in the LICENSE file =
that
-+ * accompanied this code).
-+ *
-+ * You should have received a copy of the GNU General Public License =
version
-+ * 2 along with this work; if not, write to the Free Software =
Foundation,
-+ * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
-+ *
-+ * Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa =
Clara,
-+ * CA 95054 USA or visit www.sun.com if you need additional =
information or
-+ * have any questions.
-+ */
-+package javax.swing;
-+
-+/**
-+ * An interface to tag things with a {@code getTransferHandler} =
method.
-+ */
-+interface HasGetTransferHandler {
-+
-+     /** Returns the {@code TransferHandler}.
-+      *
-+      * @return The {@code TransferHandler} or {@code null}
-+      */
-+     public TransferHandler getTransferHandler();
-+}
-+
-Index: openjdk/jdk/src/share/classes/javax/swing/TransferHandler.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/classes/javax/swing/TransferHandler.java	=
2011-11-18 18:51:22.000000000 +0100
-+++ openjdk/jdk/src/share/classes/javax/swing/TransferHandler.java	=
2011-11-18 20:44:01.628219313 +0100
-@@ -122,18 +122,6 @@
-     public static final int LINK =3D DnDConstants.ACTION_LINK;
-=20
-     /**
--     * An interface to tag things with a {@code getTransferHandler} =
method.
--     */
--    interface HasGetTransferHandler {
--
--        /** Returns the {@code TransferHandler}.
--         *
--         * @return The {@code TransferHandler} or {@code null}
--         */
--        public TransferHandler getTransferHandler();
--    }
--
--    /**
-      * Represents a location where dropped data should be inserted.
-      * This is a base class that only encapsulates a point.
-      * Components supporting drop may provide subclasses of this
-diff --git a/jdk/src/share/classes/javax/swing/JApplet.java =
b/jdk/src/share/classes/javax/swing/JApplet.java
-index 47f792a..72c2cf9 100644
---- openjdk/jdk/src/share/classes/javax/swing/JApplet.java
-+++ openjdk/jdk/src/share/classes/javax/swing/JApplet.java
-@@ -91,7 +91,7 @@ import javax.accessibility.*;
-  */
- public class JApplet extends Applet implements Accessible,
-                                                RootPaneContainer,
--                               TransferHandler.HasGetTransferHandler
-+                                               HasGetTransferHandler
- {
-     /**
-      * @see #getRootPane
-diff --git a/jdk/src/share/classes/javax/swing/JComponent.java =
b/jdk/src/share/classes/javax/swing/JComponent.java
-index 4293a4f..0c0a1dc 100644
---- openjdk/jdk/src/share/classes/javax/swing/JComponent.java
-+++ openjdk/jdk/src/share/classes/javax/swing/JComponent.java
-@@ -171,7 +171,7 @@ import sun.swing.UIClientPropertyKey;
-  * @author Arnaud Weber
-  */
- public abstract class JComponent extends Container implements =
Serializable,
--                                              =
TransferHandler.HasGetTransferHandler
-+                                                              =
HasGetTransferHandler
- {
-     /**
-      * @see #getUIClassID
-diff --git a/jdk/src/share/classes/javax/swing/JDialog.java =
b/jdk/src/share/classes/javax/swing/JDialog.java
-index a0193d1..aeeb243 100644
---- openjdk/jdk/src/share/classes/javax/swing/JDialog.java
-+++ openjdk/jdk/src/share/classes/javax/swing/JDialog.java
-@@ -97,7 +97,7 @@ import javax.accessibility.*;
- public class JDialog extends Dialog implements WindowConstants,
-                                                Accessible,
-                                                RootPaneContainer,
--                               TransferHandler.HasGetTransferHandler
-+                                               HasGetTransferHandler
- {
-     /**
-      * Key into the AppContext, used to check if should provide =
decorations
-diff --git a/jdk/src/share/classes/javax/swing/JFrame.java =
b/jdk/src/share/classes/javax/swing/JFrame.java
-index 9910b43..4cb8f58 100644
---- openjdk/jdk/src/share/classes/javax/swing/JFrame.java
-+++ openjdk/jdk/src/share/classes/javax/swing/JFrame.java
-@@ -109,7 +109,7 @@ import javax.accessibility.*;
- public class JFrame  extends Frame implements WindowConstants,
-                                               Accessible,
-                                               RootPaneContainer,
--                              TransferHandler.HasGetTransferHandler
-+                                              HasGetTransferHandler
- {
-     /**
-      * The exit application default window close operation. If a =
window
-diff --git a/jdk/src/share/classes/javax/swing/JWindow.java =
b/jdk/src/share/classes/javax/swing/JWindow.java
-index c94803c..85bbb57 100644
---- openjdk/jdk/src/share/classes/javax/swing/JWindow.java
-+++ openjdk/jdk/src/share/classes/javax/swing/JWindow.java
-@@ -91,7 +91,7 @@ import javax.accessibility.*;
-  */
- public class JWindow extends Window implements Accessible,
-                                                RootPaneContainer,
--                               TransferHandler.HasGetTransferHandler
-+                                               HasGetTransferHandler
- {
-     /**
-      * The <code>JRootPane</code> instance that manages the
diff --git a/recipes-core/openjdk/openjdk-6/icedtea-hostbuildcc.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-hostbuildcc.patch
deleted file mode 100644
index 5f2c98b..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-hostbuildcc.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: openjdk/hotspot/make/linux/makefiles/rules.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/make/linux/makefiles/rules.make	2010-02-02 =
02:22:33.201668748 +0100
-+++ openjdk/hotspot/make/linux/makefiles/rules.make	2010-02-02 =
02:23:08.480415783 +0100
-@@ -39,6 +39,7 @@
- # $(CC) is the c compiler (cc/gcc), $(CCC) is the c++ compiler =
(CC/g++).
- C_COMPILE       =3D $(CC) $(CPPFLAGS) $(CFLAGS)
- CC_COMPILE      =3D $(CCC) $(CPPFLAGS) $(CFLAGS)
-+CC_HOST_COMPILE  =3D $(BUILD_CC) $(CPPFLAGS) $(CFLAGS)
-=20
- AS.S            =3D $(AS) $(ASFLAGS)
-=20
diff --git =
a/recipes-core/openjdk/openjdk-6/icedtea-hotspot-glibc-version.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-hotspot-glibc-version.patch
deleted file mode 100644
index faa90ea..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-hotspot-glibc-version.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Index: icedtea6-1.8/build/openjdk/hotspot/src/os/linux/vm/os_linux.cpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 =
22:22:13.696298239 +0200
-+++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 =
22:24:15.308790737 +0200
-@@ -49,7 +49,6 @@
- # include <string.h>
- # include <syscall.h>
- # include <sys/sysinfo.h>
--# include <gnu/libc-version.h>
- # include <sys/ipc.h>
- # include <sys/shm.h>
- # include <link.h>
-@@ -544,9 +543,7 @@
-      os::Linux::set_glibc_version(str);
-   } else {
-      // _CS_GNU_LIBC_VERSION is not supported, try =
gnu_get_libc_version()
--     static char _gnu_libc_version[32];
--     jio_snprintf(_gnu_libc_version, sizeof(_gnu_libc_version),
--              "glibc %s %s", gnu_get_libc_version(), =
gnu_get_libc_release());
-+     static char _gnu_libc_version[32] =3D "2.9";
-      os::Linux::set_glibc_version(_gnu_libc_version);
-   }
-=20
diff --git =
a/recipes-core/openjdk/openjdk-6/icedtea-hotspot-isfinte.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-hotspot-isfinte.patch
deleted file mode 100644
index 7c5da59..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-hotspot-isfinte.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: =
icedtea6-1.8/build/openjdk/hotspot/src/share/vm/utilities/globalDefinition=
s_gcc.hpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	=
2010-06-09 21:41:28.576131825 +0200
-+++ openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	=
2010-06-09 21:41:55.555711815 +0200
-@@ -235,8 +235,8 @@
-=20
- // Checking for finiteness
-=20
--inline int g_isfinite(jfloat  f)                 { return finite(f); }
--inline int g_isfinite(jdouble f)                 { return finite(f); }
-+inline int g_isfinite(jfloat  f)                 { return isfinite(f); =
}
-+inline int g_isfinite(jdouble f)                 { return isfinite(f); =
}
-=20
-=20
- // Wide characters
diff --git a/recipes-core/openjdk/openjdk-6/icedtea-hotspot-isnanf.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-hotspot-isnanf.patch
deleted file mode 100644
index 494e965..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-hotspot-isnanf.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Index: =
icedtea6-1.8/build/openjdk/hotspot/src/share/vm/utilities/globalDefinition=
s_gcc.hpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	=
2010-06-09 21:47:12.695674808 +0200
-+++ openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	=
2010-06-09 21:48:08.699007491 +0200
-@@ -220,14 +220,14 @@
- // checking for nanness
- #ifdef SOLARIS
- #ifdef SPARC
--inline int g_isnan(float  f) { return isnanf(f); }
-+inline int g_isnan(float  f) { return __isnanf(f); }
- #else
- // isnanf() broken on Intel Solaris use isnand()
- inline int g_isnan(float  f) { return isnand(f); }
- #endif
- inline int g_isnan(double f) { return isnand(f); }
- #elif LINUX
--inline int g_isnan(float  f) { return isnanf(f); }
-+inline int g_isnan(float  f) { return __isnanf(f); }
- inline int g_isnan(double f) { return isnan(f); }
- #else
- #error "missing platform-specific definition here"
diff --git =
a/recipes-core/openjdk/openjdk-6/icedtea-hotspot-loadavg.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-hotspot-loadavg.patch
deleted file mode 100644
index 7da41fd..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-hotspot-loadavg.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Index: icedtea6-1.8/build/openjdk/hotspot/src/os/linux/vm/os_linux.cpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 =
22:16:09.406334411 +0200
-+++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 =
22:19:38.952152043 +0200
-@@ -4325,7 +4325,22 @@
- // Linux doesn't yet have a (official) notion of processor sets,
- // so just return the system wide load average.
- int os::loadavg(double loadavg[], int nelem) {
--  return ::getloadavg(loadavg, nelem);
-+
-+	FILE *LOADAVG;
-+	double avg[3] =3D { 0.0, 0.0, 0.0 };
-+	int i, res =3D -1;;
-+
-+	if ((LOADAVG =3D fopen("/proc/loadavg", "r"))) {
-+		fscanf(LOADAVG, "%lf %lf %lf", &avg[0], &avg[1], =
&avg[2]);
-+		res =3D 0;
-+		fclose(LOADAVG);
-+	}
-+
-+	for (i =3D 0; (i < nelem) && (i < 3); i++) {
-+		loadavg[i] =3D avg[i];
-+	}
-+
-+	return res;
- }
-=20
- void os::pause() {
diff --git =
a/recipes-core/openjdk/openjdk-6/icedtea-jdk-RTLD_NOLOAD.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-jdk-RTLD_NOLOAD.patch
deleted file mode 100644
index 9c70ba1..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-jdk-RTLD_NOLOAD.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: openjdk/jdk/src/solaris/native/sun/security/pkcs11/j2secmod_md.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/solaris/native/sun/security/pkcs11/j2secmod_md.c	=
2010-06-13 15:18:05.655136951 +0200
-+++ openjdk/jdk/src/solaris/native/sun/security/pkcs11/j2secmod_md.c	=
2010-06-13 15:20:29.601377967 +0200
-@@ -51,7 +51,7 @@
- {
-     const char *libName =3D (*env)->GetStringUTFChars(env, jLibName, =
NULL);
-     // look up existing handle only, do not load
--    void *hModule =3D dlopen(libName, RTLD_NOLOAD);
-+    void *hModule =3D dlopen(libName, RTLD_LAZY);
-     dprintf2("-handle for %s: %u\n", libName, hModule);
-     (*env)->ReleaseStringUTFChars(env, jLibName, libName);
-     return (jlong)hModule;
diff --git =
a/recipes-core/openjdk/openjdk-6/icedtea-jdk-iconv-uclibc.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-jdk-iconv-uclibc.patch
deleted file mode 100644
index 68f8581..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-jdk-iconv-uclibc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Index: openjdk/jdk/make/java/npt/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/java/npt/Makefile	2010-06-13 15:11:02.598512448 =
+0200
-+++ openjdk/jdk/make/java/npt/Makefile	2010-06-13 15:11:28.504759286 =
+0200
-@@ -65,6 +65,8 @@
- # We don't want to link against -ljava
- JAVALIB=3D
-=20
-+LDLIBS +=3D -liconv
-+
- # Add -export options to explicitly spell exported symbols
- ifeq ($(PLATFORM), windows)
-   OTHER_LCF +=3D -export:nptInitialize -export:nptTerminate
-Index: icedtea6-1.8/openjdk-ecj/jdk/make/java/instrument/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/java/instrument/Makefile	2010-06-13 =
15:12:14.688505195 +0200
-+++ openjdk/jdk/make/java/instrument/Makefile	2010-06-13 =
15:12:32.641425670 +0200
-@@ -123,6 +123,8 @@
- # We don't want to link against -ljava
- JAVALIB=3D
-=20
-+LDLIBS +=3D -liconv
-+
- #
- # Add to ambient vpath so we pick up the library files
- #
-Index: openjdk/jdk/make/sun/splashscreen/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/sun/splashscreen/Makefile	2010-06-13 =
15:12:48.951840824 +0200
-+++ openjdk/jdk/make/sun/splashscreen/Makefile	2010-06-13 =
15:13:01.191422891 +0200
-@@ -55,6 +55,8 @@
-=20
- JAVALIB=3D
-=20
-+LDLIBS +=3D -liconv
-+
- #
- # C Flags
- #
diff --git =
a/recipes-core/openjdk/openjdk-6/icedtea-jdk-remove-unused-backtrace.patch=
 =
b/recipes-core/openjdk/openjdk-6/icedtea-jdk-remove-unused-backtrace.patch=

deleted file mode 100644
index 5423fde..0000000
--- =
a/recipes-core/openjdk/openjdk-6/icedtea-jdk-remove-unused-backtrace.patch=

+++ /dev/null
@@ -1,41 +0,0 @@
-Index: openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c	2010-08-05 =
16:45:56.607257503 +0200
-+++ openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c	2010-08-05 =
16:47:19.727254686 +0200
-@@ -27,9 +27,6 @@
- #include <X11/Xutil.h>
- #include <X11/Xos.h>
- #include <X11/Xatom.h>
--#ifdef __linux__
--#include <execinfo.h>
--#endif
-=20
- #include <jvm.h>
- #include <jni.h>
-@@ -689,26 +686,6 @@
-     return ret;
- }
-=20
--#ifdef __linux__
--void print_stack(void)
--{
--  void *array[10];
--  size_t size;
--  char **strings;
--  size_t i;
--
--  size =3D backtrace (array, 10);
--  strings =3D backtrace_symbols (array, size);
--
--  fprintf (stderr, "Obtained %zd stack frames.\n", size);
--
--  for (i =3D 0; i < size; i++)
--     fprintf (stderr, "%s\n", strings[i]);
--
--  free (strings);
--}
--#endif
--
- Window get_xawt_root_shell(JNIEnv *env) {
-   static jclass classXRootWindow =3D NULL;
-   static jmethodID methodGetXRootWindow =3D NULL;
diff --git =
a/recipes-core/openjdk/openjdk-6/icedtea-jdk-unpack-uclibc.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-jdk-unpack-uclibc.patch
deleted file mode 100644
index 40564f0..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-jdk-unpack-uclibc.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: openjdk/jdk/make/com/sun/java/pack/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/com/sun/java/pack/Makefile	2010-06-13 =
15:25:21.548426411 +0200
-+++ openjdk/jdk/make/com/sun/java/pack/Makefile	2010-06-13 =
15:25:43.858007543 +0200
-@@ -103,6 +103,7 @@
-   OTHER_LDLIBS +=3D $(LIBCXX) -lc
- # setup the list of libraries to link in...
- ifeq ($(PLATFORM), linux)
-+  OTHER_LDLIBS  +=3D -lpthread
- ifeq ("$(CC_VER_MAJOR)", "3")
-   OTHER_LDLIBS  +=3D -Wl,-Bstatic -lgcc_eh -Wl,-Bdynamic
- endif
diff --git =
a/recipes-core/openjdk/openjdk-6/icedtea-launcher-stdc++.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-launcher-stdc++.patch
deleted file mode 100644
index ee24afa..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-launcher-stdc++.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: openjdk/hotspot/make/linux/makefiles/launcher.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk.orig/hotspot/make/linux/makefiles/launcher.make	=
2009-01-16 17:30:56.000000000 +0100
-+++ openjdk/hotspot/make/linux/makefiles/launcher.make	2009-01-16 =
17:31:13.000000000 +0100
-@@ -45,7 +45,7 @@
- else
-   LAUNCHER.o                 =3D launcher.o
-   LFLAGS_LAUNCHER           +=3D -L `pwd`
--  LIBS_LAUNCHER             +=3D -l$(JVM) $(LIBS)
-+  LIBS_LAUNCHER             +=3D -l$(JVM) $(LIBS) -lstdc++
- endif
-=20
- LINK_LAUNCHER =3D $(LINK.c)
diff --git =
a/recipes-core/openjdk/openjdk-6/icedtea-libnet-renaming.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-libnet-renaming.patch
deleted file mode 100644
index 024969d..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-libnet-renaming.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-Index: openjdk/jdk/make/java/net/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/java/net/Makefile	2010-07-05 12:28:58.476625401 =
+0200
-+++ openjdk/jdk/make/java/net/Makefile	2010-07-05 12:29:11.876625138 =
+0200
-@@ -25,7 +25,7 @@
-=20
- BUILDDIR =3D ../..
- PACKAGE =3D java.net
--LIBRARY =3D net
-+LIBRARY =3D javanet
- PRODUCT =3D sun
- include $(BUILDDIR)/common/Defs.gmk
-=20
-Index: openjdk/jdk/make/java/nio/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/make/java/nio/Makefile	2010-07-05 12:31:27.046626250 =
+0200
-+++ openjdk/jdk/make/java/nio/Makefile	2010-07-05 12:32:06.647874890 =
+0200
-@@ -139,11 +139,11 @@
- endif
- ifeq ($(PLATFORM), linux)
- COMPILER_WARNINGS_FATAL=3Dtrue
--OTHER_LDLIBS +=3D -L$(LIBDIR)/$(LIBARCH) -ljava -lnet -lpthread -ldl
-+OTHER_LDLIBS +=3D -L$(LIBDIR)/$(LIBARCH) -ljava -ljavanet -lpthread =
-ldl
- endif
- ifeq ($(PLATFORM), solaris)
- OTHER_LDLIBS +=3D $(JVMLIB) $(LIBSOCKET) -lposix4 -ldl \
--		-L$(LIBDIR)/$(LIBARCH) -ljava -lnet
-+		-L$(LIBDIR)/$(LIBARCH) -ljava -ljavanet
- endif # PLATFORM
-=20
- #
-Index: =
openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.jav=
a
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- =
openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.jav=
a	2010-07-05 17:40:56.467876415 +0200
-+++ =
openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.jav=
a	2010-07-05 17:41:43.326628410 +0200
-@@ -58,7 +58,7 @@
-      */
-     static {
-         java.security.AccessController.doPrivileged(
--                  new sun.security.action.LoadLibraryAction("net"));
-+                  new =
sun.security.action.LoadLibraryAction("javanet"));
-     }
-=20
-     /**
-Index: =
openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java	=
2010-07-05 17:41:01.027875484 +0200
-+++ openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java	=
2010-07-05 17:41:56.826626386 +0200
-@@ -74,7 +74,7 @@
-      */
-     static {
-         java.security.AccessController.doPrivileged(
--                  new sun.security.action.LoadLibraryAction("net"));
-+                  new =
sun.security.action.LoadLibraryAction("javanet"));
-     }
-=20
-     /**
-Index: openjdk/jdk/src/share/classes/java/net/DatagramPacket.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/classes/java/net/DatagramPacket.java	=
2010-07-05 17:41:02.017875980 +0200
-+++ openjdk/jdk/src/share/classes/java/net/DatagramPacket.java	=
2010-07-05 17:42:06.057875677 +0200
-@@ -47,7 +47,7 @@
-      */
-     static {
-         java.security.AccessController.doPrivileged(
--                  new sun.security.action.LoadLibraryAction("net"));
-+                  new =
sun.security.action.LoadLibraryAction("javanet"));
-         init();
-     }
-=20
-Index: openjdk/jdk/src/share/classes/java/net/InetAddress.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/classes/java/net/InetAddress.java	=
2010-07-05 17:41:02.756626429 +0200
-+++ openjdk/jdk/src/share/classes/java/net/InetAddress.java	=
2010-07-05 17:42:15.997875786 +0200
-@@ -230,7 +230,7 @@
-     static {
-         preferIPv6Address =3D =
java.security.AccessController.doPrivileged(
-             new =
GetBooleanAction("java.net.preferIPv6Addresses")).booleanValue();
--        AccessController.doPrivileged(new LoadLibraryAction("net"));
-+        AccessController.doPrivileged(new =
LoadLibraryAction("javanet"));
-         init();
-     }
-=20
-Index: openjdk/jdk/src/share/classes/java/net/NetworkInterface.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/classes/java/net/NetworkInterface.java	=
2010-07-05 17:41:03.547875282 +0200
-+++ openjdk/jdk/src/share/classes/java/net/NetworkInterface.java	=
2010-07-05 17:42:22.647875475 +0200
-@@ -52,7 +52,7 @@
-     private boolean virtual =3D false;
-=20
-     static {
--        AccessController.doPrivileged(new LoadLibraryAction("net"));
-+        AccessController.doPrivileged(new =
LoadLibraryAction("javanet"));
-         init();
-     }
-=20
-Index: =
openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java	=
2010-07-05 17:41:04.306628153 +0200
-+++ openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java	=
2010-07-05 17:42:32.666627264 +0200
-@@ -89,7 +89,7 @@
-                 }});
-         if (b !=3D null && b.booleanValue()) {
-             java.security.AccessController.doPrivileged(
--                      new =
sun.security.action.LoadLibraryAction("net"));
-+                      new =
sun.security.action.LoadLibraryAction("javanet"));
-             hasSystemProxies =3D init();
-         }
-     }
-Index: =
henning/bug/com.buglabs.build.oe/tmp/work/armv7a-angstrom-linux-gnueabi/op=
enjdk-6-jre-6b18-1.8-r3.3/openjdk-src-dir/jdk/src/share/classes/sun/nio/ch=
/Util.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/classes/sun/nio/ch/Util.java	2010-07-05 =
17:41:05.086626745 +0200
-+++ openjdk/jdk/src/share/classes/sun/nio/ch/Util.java	2010-07-05 =
17:42:39.266626410 +0200
-@@ -354,7 +354,7 @@
-                 return;
-             loaded =3D true;
-             java.security.AccessController
--                .doPrivileged(new =
sun.security.action.LoadLibraryAction("net"));
-+                .doPrivileged(new =
sun.security.action.LoadLibraryAction("javanet"));
-             java.security.AccessController
-                 .doPrivileged(new =
sun.security.action.LoadLibraryAction("nio"));
-             // IOUtil must be initialized; Its native methods are =
called from
-Index: =
openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java=

-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- =
openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java=
	2010-07-05 17:41:05.896626691 +0200
-+++ =
openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java=
	2010-07-05 17:42:45.606625991 +0200
-@@ -244,7 +244,7 @@
-=20
-     static {
-         java.security.AccessController.doPrivileged(
--            new sun.security.action.LoadLibraryAction("net"));
-+            new sun.security.action.LoadLibraryAction("javanet"));
-     }
-=20
- }
-Index: =
henning/bug/com.buglabs.build.oe/tmp/work/armv7a-angstrom-linux-gnueabi/op=
enjdk-6-jre-6b18-1.8-r3.3/openjdk-src-dir/jdk/src/windows/classes/sun/net/=
dns/ResolverConfigurationImpl.java
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- =
openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java=
	2010-07-05 17:41:06.786627210 +0200
-+++ =
openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java=
	2010-07-05 17:42:51.926627747 +0200
-@@ -160,7 +160,7 @@
-=20
-     static {
-         java.security.AccessController.doPrivileged(
--            new sun.security.action.LoadLibraryAction("net"));
-+            new sun.security.action.LoadLibraryAction("javanet"));
-         init0();
-=20
-         // start the address listener thread
diff --git a/recipes-core/openjdk/openjdk-6/icedtea-llvm_headers.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-llvm_headers.patch
deleted file mode 100644
index e47ee50..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-llvm_headers.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Index: openjdk/hotspot/src/share/vm/shark/llvmHeaders.hpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/src/share/vm/shark/llvmHeaders.hpp	2011-11-18 =
20:38:09.000000000 +0100
-+++ openjdk/hotspot/src/share/vm/shark/llvmHeaders.hpp	2011-11-18 =
21:03:15.781644337 +0100
-@@ -38,7 +38,11 @@
- #include <llvm/ModuleProvider.h>
- #endif
- #include <llvm/Support/IRBuilder.h>
-+#if SHARK_LLVM_VERSION >=3D 29
-+#include <llvm/Support/Threading.h>
-+#else
- #include <llvm/System/Threading.h>
-+#endif
- #include <llvm/Target/TargetSelect.h>
- #include <llvm/Type.h>
- #include <llvm/ExecutionEngine/JITMemoryManager.h>
-@@ -47,8 +51,12 @@
- #include <llvm/ExecutionEngine/JIT.h>
- #include <llvm/ADT/StringMap.h>
- #include <llvm/Support/Debug.h>
-+#if SHARK_LLVM_VERSION >=3D 29
-+#include <llvm/Support/Host.h>
-+#else
- #include <llvm/System/Host.h>
- #endif
-+#endif
-=20
- #include <map>
-=20
diff --git a/recipes-core/openjdk/openjdk-6/icedtea-remove_werror.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-remove_werror.patch
deleted file mode 100644
index f2ad035..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-remove_werror.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: openjdk/hotspot/make/linux/makefiles/gcc.make
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/hotspot/make/linux/makefiles/gcc.make	2010-02-02 =
16:11:35.758533706 +0100
-+++ openjdk/hotspot/make/linux/makefiles/gcc.make	2010-02-02 =
16:11:42.761456458 +0100
-@@ -98,9 +98,6 @@
-   CFLAGS +=3D -pipe
- endif
-=20
--# Compiler warnings are treated as errors
--WARNINGS_ARE_ERRORS =3D -Werror
--
- # Except for a few acceptable ones
- # Since GCC 4.3, -Wconversion has changed its meanings to warn these =
implicit
- # conversions which might affect the values. To avoid that, we need to =
turn
diff --git a/recipes-core/openjdk/openjdk-6/icedtea-unbreak-float.patch =
b/recipes-core/openjdk/openjdk-6/icedtea-unbreak-float.patch
deleted file mode 100644
index 9f875de..0000000
--- a/recipes-core/openjdk/openjdk-6/icedtea-unbreak-float.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Index: openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h	=
2010-02-02 13:49:39.972718207 +0100
-+++ openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h	=
2010-02-02 13:50:04.635639302 +0100
-@@ -27,13 +27,11 @@
-=20
- #include "jfdlibm.h"
-=20
--#ifdef __NEWVALID       /* special setup for Sun test regime */
- #if defined(i386) || defined(i486) || \
-         defined(intel) || defined(x86) || \
-         defined(i86pc) || defined(_M_IA64) || defined(ia64)
- #define _LITTLE_ENDIAN
- #endif
--#endif
-=20
- #ifdef _LITTLE_ENDIAN
- #define __HI(x) *(1+(int*)&x)
diff --git a/recipes-core/openjdk/openjdk-6/jvm.cfg =
b/recipes-core/openjdk/openjdk-6/jvm.cfg
deleted file mode 100644
index 9e008e9..0000000
--- a/recipes-core/openjdk/openjdk-6/jvm.cfg
+++ /dev/null
@@ -1,41 +0,0 @@
-# Copyright 2003 Sun Microsystems, Inc.  All Rights Reserved.
-# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
-#
-# This code is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License version 2 only, as
-# published by the Free Software Foundation.  Sun designates this
-# particular file as subject to the "Classpath" exception as provided
-# by Sun in the LICENSE file that accompanied this code.
-#
-# This code is distributed in the hope that it will be useful, but =
WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# version 2 for more details (a copy is included in the LICENSE file =
that
-# accompanied this code).
-#
-# You should have received a copy of the GNU General Public License =
version
-# 2 along with this work; if not, write to the Free Software =
Foundation,
-# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa =
Clara,
-# CA 95054 USA or visit www.sun.com if you need additional information =
or
-# have any questions.
-#
-#=20
-# List of JVMs that can be used as an option to java, javac, etc.
-# Order is important -- first in this list is the default JVM.
-# NOTE that this both this file and its format are UNSUPPORTED and
-# WILL GO AWAY in a future release.
-#
-# You may also select a JVM in an arbitrary location with the
-# "-XXaltjvm=3D<jvm_dir>" option, but that too is unsupported
-# and may not be available in a future release.
-#
--server ERROR
--client IGNORE
--hotspot ERROR
--classic WARN
--native ERROR
--green ERROR
--zero ALIASED_TO -server
--cacao ERROR
diff --git a/recipes-core/openjdk/openjdk-6/mkbc_returncode.patch =
b/recipes-core/openjdk/openjdk-6/mkbc_returncode.patch
deleted file mode 100644
index 13280b3..0000000
--- a/recipes-core/openjdk/openjdk-6/mkbc_returncode.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-Index: icedtea6/ports/hotspot/tools/mkbc.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6.orig/ports/hotspot/tools/mkbc.c	2010-04-01 =
12:25:13.791317722 +0200
-+++ icedtea6/ports/hotspot/tools/mkbc.c	2010-04-01 =
12:27:34.151606177 +0200
-@@ -602,4 +602,6 @@
- 	if (ferror(bci_f)) fatal("Error writing bci");
- 	if (source_f !=3D stdin) fclose(source_f);
- 	if (bci_f !=3D stdout) fclose(bci_f);
-+
-+	return 0;
- }
diff --git =
a/recipes-core/openjdk/openjdk-6/shark-arm-linux-cpu-detection.patch =
b/recipes-core/openjdk/openjdk-6/shark-arm-linux-cpu-detection.patch
deleted file mode 100644
index df9e147..0000000
--- a/recipes-core/openjdk/openjdk-6/shark-arm-linux-cpu-detection.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-Index: icedtea6-1.8/ports/hotspot/src/share/vm/shark/sharkCompiler.cpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- =
icedtea6-1.8.orig/ports/hotspot/src/share/vm/shark/sharkCompiler.cpp	=
2010-07-14 16:42:48.412103129 +0200
-+++ icedtea6-1.8/ports/hotspot/src/share/vm/shark/sharkCompiler.cpp	=
2010-07-14 16:50:51.680282178 +0200
-@@ -32,6 +32,96 @@
-=20
- #if SHARK_LLVM_VERSION >=3D 27
- namespace {
-+
-+#if defined(__arm__) && defined(__linux__)
-+#include <fcntl.h>
-+#include <linux/auxvec.h>
-+#include <asm/hwcap.h>
-+#define VECBUFF_SIZE 32
-+
-+bool TestARMLinuxHWCAP(int feature) {
-+  int fd;
-+  unsigned vecs[VECBUFF_SIZE];
-+  unsigned *p;
-+  int i, n;
-+  int rc;
-+
-+  rc =3D 0;
-+  fd =3D open("/proc/self/auxv", O_RDONLY);
-+  if (fd < 0) return 0;
-+  do {
-+    n =3D read(fd, vecs, VECBUFF_SIZE * sizeof(unsigned));
-+    p =3D vecs;
-+    i =3D n/8;
-+    while (--i >=3D0) {
-+      unsigned tag =3D *p++;
-+      unsigned value =3D *p++;
-+      if (tag =3D=3D 0) goto fini;
-+      if(tag =3D=3D AT_HWCAP && (value & feature)) {
-+        rc =3D 1;
-+        goto fini;
-+      }
-+    }
-+  } while (n =3D=3D VECBUFF_SIZE * sizeof(unsigned));
-+fini:
-+  close(fd);
-+  return rc;
-+}
-+
-+char* TestARMLinuxAT(int auxvec) {
-+  int fd;
-+  unsigned vecs[VECBUFF_SIZE];
-+  unsigned *p;
-+  int i, n;
-+  char* rc;
-+
-+  rc =3D 0;
-+  fd =3D open("/proc/self/auxv", O_RDONLY);
-+  if (fd < 0) return 0;
-+  do {
-+    n =3D read(fd, vecs, VECBUFF_SIZE * sizeof(unsigned));
-+    p =3D vecs;
-+    i =3D n/8;
-+    while (--i >=3D0) {
-+      unsigned tag =3D *p++;
-+      unsigned value =3D *p++;
-+      if (tag =3D=3D 0) goto fini;
-+      if(tag =3D=3D (unsigned) auxvec ) {
-+        rc =3D (char*)value;
-+        goto fini;
-+      }
-+    }
-+  } while (n =3D=3D VECBUFF_SIZE * sizeof(unsigned));
-+fini:
-+  close(fd);
-+  return rc;
-+}
-+
-+bool getARMHostCPUFeatures(StringMap<bool> &Features) {
-+  // FIXME LLVM PR6561 // =
Features["neon"]=3DTestARMLinuxHWCAP(HWCAP_NEON);
-+  Features["thumb2"]=3DTestARMLinuxHWCAP(HWCAP_THUMBEE);
-+  Features["vfp2"]=3DTestARMLinuxHWCAP(HWCAP_VFP);
-+
-+  std::string testArchKey(TestARMLinuxAT(AT_PLATFORM));
-+
-+  StringMap<std::string> archLinuxToLLVMMap;
-+  archLinuxToLLVMMap["v4l"]=3D"v4t";
-+  archLinuxToLLVMMap["v5l"]=3D"v5t";
-+  archLinuxToLLVMMap["v6l"]=3D"v6";
-+  // FIXME change this from v6 to v7a when LLVM PR7048 have been fixed
-+  archLinuxToLLVMMap["v7l"]=3D"v6";
-+
-+  llvm::StringMapIterator<std::string> =
resultIterator(archLinuxToLLVMMap.find(
-+                                                      testArchKey));
-+  if(resultIterator->first()) {
-+    std::string arch(resultIterator->second);
-+    Features[arch]=3Dtrue;
-+  }
-+
-+  return true;
-+}
-+#endif
-+
-   cl::opt<std::string>
-   MCPU("mcpu");
-=20
-@@ -64,7 +154,11 @@
- #if SHARK_LLVM_VERSION >=3D 27
-   // Finetune LLVM for the current host CPU.
-   StringMap<bool> Features;
-+#if defined(__arm__) && defined(__linux__)
-+  bool gotCpuFeatures =3D getARMHostCPUFeatures(Features);
-+#else
-   bool gotCpuFeatures =3D llvm::sys::getHostCPUFeatures(Features);
-+#endif
-   std::string cpu("-mcpu=3D" + llvm::sys::getHostCPUName());
-=20
-   std::vector<const char*> args;
diff --git a/recipes-core/openjdk/openjdk-6/shark-build-openjdkdir.patch =
b/recipes-core/openjdk/openjdk-6/shark-build-openjdkdir.patch
deleted file mode 100644
index 4e89967..0000000
--- a/recipes-core/openjdk/openjdk-6/shark-build-openjdkdir.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: icedtea6-1.8/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- icedtea6-1.8.orig/Makefile.am	2010-06-30 11:30:49.526648376 =
+0200
-+++ icedtea6-1.8/Makefile.am	2010-06-30 11:42:02.606648734 +0200
-@@ -1882,7 +1882,7 @@
- # configure script arguments, quoted in single quotes
- CONFIGURE_ARGS =3D @CONFIGURE_ARGS@
- ADD_ZERO_CONFIGURE_ARGS =3D \
--	=
--with-openjdk=3D$(abs_top_builddir)/$(BUILD_OUTPUT_DIR)/j2sdk-image \
-+	--with-openjdk=3D$(abs_top_builddir)/bootstrap/jdk1.6.0 \
- 	--enable-zero
- if ADD_SHARK_BUILD
- ADD_ZERO_CONFIGURE_ARGS +=3D \
diff --git a/recipes-core/openjdk/openjdk-6/zero-cmpswap-long.patch =
b/recipes-core/openjdk/openjdk-6/zero-cmpswap-long.patch
deleted file mode 100644
index ca21ccf..0000000
--- a/recipes-core/openjdk/openjdk-6/zero-cmpswap-long.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Index: =
icedtea6-1.8/ports/hotspot/src/os_cpu/linux_zero/vm/atomic_linux_zero.inli=
ne.hpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- =
icedtea6-1.8.orig/ports/hotspot/src/os_cpu/linux_zero/vm/atomic_linux_zero=
.inline.hpp	2010-06-17 10:26:16.885292426 +0200
-+++ =
icedtea6-1.8/ports/hotspot/src/os_cpu/linux_zero/vm/atomic_linux_zero.inli=
ne.hpp	2010-06-17 10:29:19.034668305 +0200
-@@ -266,7 +266,15 @@
-                              volatile jlong* dest,
-                              jlong compare_value) {
-=20
-+#ifdef ARM
-+  return arm_compare_and_swap((jint *) dest, (jint) compare_value, =
(jint) exchange_value);
-+#else
-+#ifdef M68K
-+  return m68k_compare_and_swap((jint *) dest, (jint) compare_value, =
(jint) exchange_value);
-+#else
-   return __sync_val_compare_and_swap(dest, compare_value, =
exchange_value);
-+#endif // M68K
-+#endif // ARM
- }
-=20
- inline intptr_t Atomic::cmpxchg_ptr(intptr_t exchange_value,
diff --git a/recipes-core/openjdk/openjdk-6_6b24-1.11.9.bb =
b/recipes-core/openjdk/openjdk-6_6b24-1.11.9.bb
deleted file mode 100644
index 3daffba..0000000
--- a/recipes-core/openjdk/openjdk-6_6b24-1.11.9.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require openjdk-6-release-6b24.inc
-
-PR =3D "${INC_PR}.1"
-
-SRC_URI[iced.md5sum] =3D "1826c4bfb4faae1e820dd8997428a831"
-SRC_URI[iced.sha256sum] =3D =
"0c134bea8d48c77ad5d41d4a0f98f471c381faaa0ef0c215d48687e709e93f3f"
-
-ICEDTEAPATCHES +=3D =
"file://icedtea-jdk-rmi-crosscompile.patch;apply=3Dno"
-
-DISTRIBUTION_PATCHES +=3D "patches/icedtea-jdk-rmi-crosscompile.patch"
diff --git a/recipes-core/openjdk/openjdk-6_6b24_hg.bb =
b/recipes-core/openjdk/openjdk-6_6b24_hg.bb
deleted file mode 100644
index fcc9c05..0000000
--- a/recipes-core/openjdk/openjdk-6_6b24_hg.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require openjdk-6-release-6b24.inc
-
-LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"
-
-PR =3D "${INC_PR}.0"
-
-ICEDTEA =3D "icedtea6"
-
-SRCREV =3D "54ceda20a02c"
-PV =3D "6b24-1.11.1+1.11.2-devel+hg${SRCPV}"
-
-ICEDTEA_URI =3D =
"hg://icedtea.classpath.org/hg/;module=3Dicedtea6;rev=3D${SRCREV}"
diff --git a/recipes-core/openjdk/openjdk-6_6b27-1.12.8.bb =
b/recipes-core/openjdk/openjdk-6_6b27-1.12.8.bb
deleted file mode 100644
index 8d12a8e..0000000
--- a/recipes-core/openjdk/openjdk-6_6b27-1.12.8.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require openjdk-6-release-6b27.inc
-
-PR =3D "${INC_PR}.4"
-
-SRC_URI[iced.md5sum] =3D "7712c4b3b9f8092aa8c7b5cad0b46d06"
-SRC_URI[iced.sha256sum] =3D =
"c2ad74af29af774f778675d3fde952f4defebb2be44f565253d788e2e7af39d4"
diff --git a/recipes-core/openjdk/openjdk-6_6b32-1.13.4.bb =
b/recipes-core/openjdk/openjdk-6_6b32-1.13.4.bb
deleted file mode 100644
index 69a3e1e..0000000
--- a/recipes-core/openjdk/openjdk-6_6b32-1.13.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require openjdk-6-release-6b32.inc
-
-PR =3D "${INC_PR}.0"
-
-SRC_URI[iced.md5sum] =3D "95d61221d0be3616c8c04d164df524a4"
-SRC_URI[iced.sha256sum] =3D =
"302b17575ad98bbf6a1d4d8768d2ea1f1b070f153c660ebe493b6509d56ed0e7"
diff --git a/recipes-images/images/java-test-image.bb =
b/recipes-images/images/java-test-image.bb
index 22c7bdf..b8a729a 100644
--- a/recipes-images/images/java-test-image.bb
+++ b/recipes-images/images/java-test-image.bb
@@ -8,7 +8,6 @@ IMAGE_LINGUAS =3D " "
 IMAGE_INSTALL =3D "busybox modutils-initscripts initscripts opkg udev =
sysvinit netbase base-files base-passwd \
                  ${ROOTFS_PKGMANAGE_BOOTSTRAP} =
${CORE_IMAGE_EXTRA_INSTALL} \
                  openjdk-7-jre openjdk-7-vm-zero openjdk-7-vm-jamvm =
openjdk-7-vm-cacao \
-                 openjdk-6-jre openjdk-6-vm-zero openjdk-6-vm-jamvm =
openjdk-6-vm-cacao \
                  strace dropbear binutils \
                  classpath \
                  classpath-common \
--=20
2.4.3


--=20
Jens Rehsack - rehsack@gmail.com


