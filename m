Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 186E5616C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Mar 2020 17:36:51 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id i14so3259454wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Mar 2020 09:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PaijYeSQ1JI3SdKihKEtofHUlxfLHosuaRI/1UiPv2g=;
	b=TcFk+FX/I0HqvBo5PAs3+3fDW43tw3TNc/LSUPGzrfNm2Zt3e4wjdJMX2Dy/5HUU6L
	bXqndXhQot0W8LhVj4uIJ9r4JvT7G467p6eyk5e1qqSRpCIgLftIZCkqlnUAWEWFG71Z
	ZVL8IvaKjl41bdpLvqgN4NNK9ohralu2/AuciK7KbGZ9Xg8OAl0e5wMiHwzK78EibqrP
	ojUIRw1j8OD5vSOCNny+xmNyYvcdWb5kFNIefM+Rz9kcocNIF8UR9BTXjYiy8QX/C5ma
	u23sfj1sP/22nXTWYFFbCfkD23iAhQ2qvGlGIa5WI27bBC8DVXh5dB+EvobpXr+zKfmv
	qEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PaijYeSQ1JI3SdKihKEtofHUlxfLHosuaRI/1UiPv2g=;
	b=hoYLgPKfDOoFHupmRQZ4VjarnkYB+4yTMkVgFTE/w9ktrDXhYBBgfSKAEipZiz6Ghx
	F5NFEQsaVOn3UQFt7LUhKiH55bMKk/ZtyGwwvIjNS4Tg707FUdrTuDixGTfAJwOJ+FxL
	QMPmzp0AQCgm7JTEWb2eekx4vX3uX4HaOn0FRxFMjeZq32503LKgEIey85FLq1IvW59f
	MJ+f0LzI38wUOfW5eSDaVdBXK9m2LFcI0/Jlx9aW165Pxo3OyhPsBzT2hzI2+NevQOyM
	X9P8YXbJRfiSiLvT7kkZcnFvoDTZE5Oxn1FfVGcqq6EM1WgqGp8NYnpPELQLbi5VG3R2
	lNMA==
X-Gm-Message-State: ANhLgQ3n5suEzRAtCeryf2i07WdVOilbX9Fg8tCWvq2mddECslIcmICd
	XfKKvAGSRtjHBPWLLEDtTIQi7IgN
X-Google-Smtp-Source: ADFU+vv7lpb3ndT89sBbVms0Oece7U68mreiQhdlGchg4etpWZGhD2m2xxGhVSLiNtQL75jJVTbAlA==
X-Received: by 2002:a1c:a384:: with SMTP id m126mr5039850wme.84.1583516212194; 
	Fri, 06 Mar 2020 09:36:52 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	u17sm25458648wrq.74.2020.03.06.09.36.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Mar 2020 09:36:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Mar 2020 18:36:46 +0100
Message-Id: <20200306173646.29207-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] daemontools: remove native BBCLASSEXTEND
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Mar 2020 17:36:52 -0000
Content-Transfer-Encoding: 8bit

* it was used only to provide chkshsgr which is now replaced with no-op call
  since
  commit 50d526d06a742fa69ff698d7c2eefffb56e13afa
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Tue Jan 28 11:28:52 2020 -0800

    daemontools: Disable the chkshsgr tests

    Running the chkhsgr test during cross compile fails

    ./chkshsgr || ( cat warn-shsgr; exit 1 )
    Oops. Your getgroups() returned 0, and setgroups() failed; this means
    that I can't reliably do my shsgr test. Please either ``make'' as root
    or ``make'' while you're in one or more supplementary groups.

    All OE based targets have working getgroups()/setgroups()
    implementation, so its a safe assumption and therefore make the test
    to be a dummy

* the native chkshsgr from daemontools-native was actually being
  called only because of this chunk of cross-compile.patch:
  -       ./chkshsgr || ( cat warn-shsgr; exit 1 )
  +       chkshsgr || ( cat warn-shsgr; exit 1 )
  but all chkshsgr does is:
    short x[4];
    x[0] = x[1] = 0;
    if (getgroups(1,x) == 0) if (setgroups(1,x) == -1) _exit(1);
    _exit(0);
  which running on host system, doesn't say anything useful about the
  cross compile target, so it's easier to just remove the call in
  cross-compile.patch and simplify all this nonsense

* I came across this because daemontools-native was failing for me
  in "bitbake world" with zeus, which might be the same case as what
  Khem was seeing - just the final commit message doesn't reflect that

* daemontools-native fails to build without the above commit in
  zeus as well, when building inside docker container where my
  build user is in fewer groups (just 1) so the
  getgroups(1,x) call doesn't fail, but on more average OS the
  user will be in more than 4 groups and
  getgroups(1,x) would fail with errno 22 EINVAL
    - so setgroups isn't even called to return 1 error when chkshsgr is called
  http://man7.org/linux/man-pages/man2/setgroups.2.html
    If the calling process is a member of more than size
    supplementary groups, then an error results.
  if I increase the size of x enough for x to hold all groups, then setgroups
  will fail with errno 1 EPERM, which is the same error as shown
  under docker container where getgroups doesn't fail, because
  in both cases I'm using unprivileged user for builds

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...001-daemontools-native-Fix-a-warning.patch | 26 -------------------
 .../daemontools/cross-compile.patch           |  4 +--
 .../daemontools/daemontools_0.76.bb           | 24 +++++------------
 3 files changed, 8 insertions(+), 46 deletions(-)
 delete mode 100644 meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-native-Fix-a-warning.patch

diff --git a/meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-native-Fix-a-warning.patch b/meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-native-Fix-a-warning.patch
deleted file mode 100644
index 8d9577d5ff..0000000000
--- a/meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-native-Fix-a-warning.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a43a3327ccd4b06a3bcf0c87d518a97c6b39ac02 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Sat, 6 Aug 2016 02:09:53 +0900
-Subject: [PATCH] daemontools: Fix a warning
-
-To fix the warning as following:
-
-WARNING: daemontools-native-0.76-r0 do_populate_sysroot: File '/build-poky/tmp/sysroots/x86_64-linux/usr/bin/chkshsgr' from daemontools-native was already stripped, this will prevent future debugging!
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
----
- src/conf-ld | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/conf-ld b/src/conf-ld
-index 59a0de7..1d0518a 100644
---- a/src/conf-ld
-+++ b/src/conf-ld
-@@ -1,3 +1,3 @@
--gcc -s
-+gcc
- 
- This will be used to link .o files into an executable.
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch b/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
index f164c2d10d..9c07d758ae 100644
--- a/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
+++ b/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
@@ -30,7 +30,7 @@ diff -Nurp daemontools-0.76.orig/src/Makefile daemontools-0.76/src/Makefile
  hasshsgr.h: chkshsgr choose compile hasshsgr.h1 hasshsgr.h2 load \
  tryshsgr.c warn-shsgr
 -	./chkshsgr || ( cat warn-shsgr; exit 1 )
-+	chkshsgr || ( cat warn-shsgr; exit 1 )
++	echo "Warning: We can not run test on cross target. - ignoring ./chkshsgr || ( cat warn-shsgr; exit 1 )"
  	./choose clr tryshsgr hasshsgr.h1 hasshsgr.h2 > hasshsgr.h
  
  haswaitp.h: choose compile haswaitp.h1 haswaitp.h2 load trywaitp.c
@@ -39,7 +39,7 @@ diff -Nurp daemontools-0.76.orig/src/Makefile daemontools-0.76/src/Makefile
  readproctitle rts.tests setlock setuidgid softlimit supervise svc \
  svok svscan svscanboot svstat tai64n tai64nlocal
 -	env - /bin/sh rts.tests 2>&1 | cat -v > rts
-+	echo "Warning: We can not run test on cross target."
++	echo "Warning: We can not run test on cross target. - ignoring env - /bin/sh rts.tests 2>&1 | cat -v > rts"
  
  scan_ulong.o: compile scan.h scan_ulong.c
  	./compile scan_ulong.c
diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
index d674e03781..b99116da70 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -16,24 +16,18 @@ LIC_FILES_CHKSUM = "file://src/prot.c;beginline=1;endline=1;md5=96964cadf07e8f8c
 LICENSE = "PD"
 
 SRC_URI = "http://cr.yp.to/daemontools/${BPN}-${PV}.tar.gz \
-           file://0001-error.h-include-errno.h-instead-of-extern-int.diff \
-           file://0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff "
-
-SRC_URI_append_class-target = "file://cross-compile.patch \
-                               file://0001-daemontools-Fix-QA-Issue.patch "
-
-SRC_URI_append_class-native = "file://0001-daemontools-native-Fix-a-warning.patch "
+    file://0001-error.h-include-errno.h-instead-of-extern-int.diff \
+    file://0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff \
+    file://cross-compile.patch \
+    file://0001-daemontools-Fix-QA-Issue.patch \
+"
 
 SRC_URI[md5sum] = "1871af2453d6e464034968a0fbcb2bfc"
 SRC_URI[sha256sum] = "a55535012b2be7a52dcd9eccabb9a198b13be50d0384143bd3b32b8710df4c1f"
 
-S = "${WORKDIR}/admin/${BPN}-${PV}"
-
-DEPENDS += "daemontools-native"
-DEPENDS_class-native = ""
+S = "${WORKDIR}/admin/${BP}"
 
 do_compile() {
-    echo "int main() { return 0; }" >${S}/src/chkshsgr.c
     ./package/compile
 }
 
@@ -41,12 +35,6 @@ do_install() {
     install -d ${D}/${bindir}
 }
 
-do_install_append_class-native() {
-    install -m 755 ${S}/compile/chkshsgr ${D}/${bindir}
-}
-
 do_install_append_class-target() {
     install -m755 ${S}/command/* ${D}/${bindir}
 }
-
-BBCLASSEXTEND = "native"
-- 
2.20.1


