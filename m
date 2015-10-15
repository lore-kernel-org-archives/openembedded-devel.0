Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id A225B7709E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 11:55:14 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so15441552wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 04:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=Dy3zoI5lPwCbs5MwwVesXGjVRLNAThzX1iaOskawQlM=;
	b=jlMANth+KeYL+aCrDu1ia2ky6fkZnyH9hdXBLvlgD8JP+A+vCw76Ep7QRKWeb8KYXq
	BOcmgVhjx5PDr489lSEnW6j9hfNZGtWskrWV8A47Yf2KhJqtseGIzCpw2gURZ4l18Zpz
	q48inEVOvF8/L9uviJhs1HQAL2ZPcZRBN00sm1yNdiTjeuxEa0wU2/Bdy9mzw8JCkyxK
	mfbECu21RBYwLgc2FsKURhka7psi0WpzwJ1e9f8LR4K88OOkcFsCxNZlYtF49yn79HQw
	+RErYzGbp3yByE43Hj+uWoRrf1QbzcHdlahq6H27EZQrKhxi6/PMMwEStT7SIxcQrKsd
	pSgQ==
X-Received: by 10.194.77.79 with SMTP id q15mr1389980wjw.102.1444910114193;
	Thu, 15 Oct 2015 04:55:14 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	x9sm16039374wjf.44.2015.10.15.04.55.13
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Oct 2015 04:55:13 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Date: Thu, 15 Oct 2015 13:55:13 +0200
Message-Id: <5FCE9374-DB04-488F-B863-A2CA6B6629B5@gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-java][PATCH 6/6] openjdk-8: fix build error with gcc5
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
X-List-Received-Date: Thu, 15 Oct 2015 11:55:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Applying a fix from openjdk-9 repository which fixes build issues using =
gcc5

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 ..._than_returning_address_of_local_variable.patch | 23 =
++++++++++++++++++++++
 recipes-core/openjdk/openjdk-8_72b00.bb            | 14 ++++++-------
 recipes-core/openjdk/openjre-8_72b00.bb            | 14 ++++++-------
 3 files changed, 35 insertions(+), 16 deletions(-)
 create mode 100644 =
recipes-core/openjdk/openjdk-8-72b00/openjdk8-use_builtin_frame_address_0_=
rather_than_returning_address_of_local_variable.patch

diff --git =
a/recipes-core/openjdk/openjdk-8-72b00/openjdk8-use_builtin_frame_address_=
0_rather_than_returning_address_of_local_variable.patch =
b/recipes-core/openjdk/openjdk-8-72b00/openjdk8-use_builtin_frame_address_=
0_rather_than_returning_address_of_local_variable.patch
new file mode 100644
index 0000000..9e1d204
--- /dev/null
+++ =
b/recipes-core/openjdk/openjdk-8-72b00/openjdk8-use_builtin_frame_address_=
0_rather_than_returning_address_of_local_variable.patch
@@ -0,0 +1,23 @@
+# HG changeset patch
+# User sgehwolf
+# Date 1434121785 -3600
+# Node ID 6217fd2c767b467641bf7b41a9c37273e8fa0cbd
+# Parent  ff0929a59ced0e144201aa05819ae2e47d6f2c61
+8087120: [GCC5] java.lang.StackOverflowError on Zero JVM initialization =
on non x86 platforms.
+Summary: Use __builtin_frame_address(0) rather than returning address =
of local variable.
+Reviewed-by: dholmes
+
+diff -r ff0929a59ced -r 6217fd2c767b =
src/os_cpu/linux_zero/vm/os_linux_zero.cpp
+--- hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp.orig	Thu Jun =
11 20:19:26 2015 -0700
++++ hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp	Fri Jun 12 =
16:09:45 2015 +0100
+@@ -59,8 +59,8 @@
+ extern sigjmp_buf* get_jmp_buf_for_continuation();
+=20
+ address os::current_stack_pointer() {
+-  address dummy =3D (address) &dummy;
+-  return dummy;
++  // return the address of the current function
++  return (address)__builtin_frame_address(0);
+ }
+=20
+ frame os::get_sender_for_C_frame(frame* fr) {
diff --git a/recipes-core/openjdk/openjdk-8_72b00.bb =
b/recipes-core/openjdk/openjdk-8_72b00.bb
index c6d17df..62e3190 100644
--- a/recipes-core/openjdk/openjdk-8_72b00.bb
+++ b/recipes-core/openjdk/openjdk-8_72b00.bb
@@ -1,18 +1,16 @@
 require openjdk-8-release-72b00.inc
 require openjdk-8-cross.inc
=20
+# some patches extracted from =
http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.=
patch
+# reported via =
http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
+# by Roman Kennke (rkennke at redhat.com)
 PATCHES_URI_append =3D "\
   file://openjdk8-restrict-to-staging-dir.patch;apply=3Dno \
+  file://openjdk8-fix-shark-build.patch;apply=3Dno \
+  file://openjdk8-fix-shark-stdc++11.patch;apply=3Dno \
+  =
file://openjdk8-use_builtin_frame_address_0_rather_than_returning_address_=
of_local_variable.patch;apply=3Dno \
 "
=20
-# patch extracted from =
http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.=
patch
-# reported via =
http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
-# by Roman Kennke (rkennke at redhat.com)
-PATCHES_URI_append_arm =3D " =
file://openjdk8-fix-shark-build.patch;apply=3Dno "
-PATCHES_URI_append_arm =3D " =
file://openjdk8-fix-shark-stdc++11.patch;apply=3Dno "
-PATCHES_URI_append_mips =3D " =
file://openjdk8-fix-shark-build.patch;apply=3Dno "
-PATCHES_URI_append_mips =3D " =
file://openjdk8-fix-shark-stdc++11.patch;apply=3Dno "
-
 do_install() {
     do_install_jdk
 }
diff --git a/recipes-core/openjdk/openjre-8_72b00.bb =
b/recipes-core/openjdk/openjre-8_72b00.bb
index 3decc0c..78e9a0d 100644
--- a/recipes-core/openjdk/openjre-8_72b00.bb
+++ b/recipes-core/openjdk/openjre-8_72b00.bb
@@ -1,18 +1,16 @@
 require openjdk-8-release-72b00.inc
 require openjdk-8-cross.inc
=20
+# some patches extracted from =
http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.=
patch
+# reported via =
http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
+# by Roman Kennke (rkennke at redhat.com)
 PATCHES_URI_append =3D "\
   file://openjdk8-restrict-to-staging-dir.patch;apply=3Dno \
+  file://openjdk8-fix-shark-build.patch;apply=3Dno \
+  file://openjdk8-fix-shark-stdc++11.patch;apply=3Dno \
+  =
file://openjdk8-use_builtin_frame_address_0_rather_than_returning_address_=
of_local_variable.patch;apply=3Dno \
 "
=20
-# patch extracted from =
http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.=
patch
-# reported via =
http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
-# by Roman Kennke (rkennke at redhat.com)
-PATCHES_URI_append_arm =3D " =
file://openjdk8-fix-shark-build.patch;apply=3Dno "
-PATCHES_URI_append_arm =3D " =
file://openjdk8-fix-shark-stdc++11.patch;apply=3Dno "
-PATCHES_URI_append_mips =3D " =
file://openjdk8-fix-shark-build.patch;apply=3Dno "
-PATCHES_URI_append_mips =3D " =
file://openjdk8-fix-shark-stdc++11.patch;apply=3Dno "
-
 do_install() {
     do_install_jre
 }
--=20
2.3.8 (Apple Git-58)


--=20
Jens Rehsack - rehsack@gmail.com


