Return-Path: <me@sephalon.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13A8C87FCB
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 15:39:54 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web11.77654.1755013191390639588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Aug 2025 08:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@sephalon.net header.s=MBO0001 header.b=k5/q7xyr;
 spf=none, err=permanent DNS error (domain: sephalon.net, ip: 80.241.56.171, mailfrom: me@sephalon.net)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c1bKb4fqyz9tCB;
	Tue, 12 Aug 2025 17:39:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sephalon.net;
	s=MBO0001; t=1755013187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6Tkfg8j0Wu1mlm3Ig0+DUEBIXSp8wPgMQLjm0z5PNA=;
	b=k5/q7xyrlpXccJEmRIptw4eTMnAHdfYdaJubGx3TBH3s00IPoiC+WDbNCucUjrzO9xsRX3
	WhWDBO9qulox6lsrhHlMgeGtq6DnnwGhi5FdXq1n74YeVqbi7AUcZkvUeewUsURrGNxScH
	P44VyucZDvci6Dy7JCNoYasGbSik3bN59cKqfaNerlfVBXVSa/k9qxXDIVp1U5HgbS6zgj
	rArlsyz9LSs2BgRJTXb/sfXhnFdBSoy1Yp9ZnfU9ucKEXcpm2CpwDwT5oFn0VfCtYPa712
	NRkgxu0VYcR3U3g0fxdQrvDWYAFf0byra0fkohE2C/A6HZsX8bpKel5Z8VLOUQ==
From: Stefan Wiehler <me@sephalon.net>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Stefan Wiehler <me@sephalon.net>
Subject: [meta-oe][PATCH v2 2/2] syzkaller: Add nativesdk
Date: Tue, 12 Aug 2025 17:34:42 +0200
Message-ID: <20250812153441.417795-3-me@sephalon.net>
In-Reply-To: <20250812153441.417795-2-me@sephalon.net>
References: <20250812153441.417795-2-me@sephalon.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 15:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118918

Signed-off-by: Stefan Wiehler <me@sephalon.net>
---
 .../syzkaller/syzkaller-licenses.inc          |  5 ++++-
 .../recipes-test/syzkaller/syzkaller_git.bb   | 22 ++++++++++++++++---
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc b/meta=
-oe/recipes-test/syzkaller/syzkaller-licenses.inc
index 2be12f2853..af118a4dd4 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc
+++ b/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc
@@ -73,8 +73,11 @@ LIC_FILES_CHKSUM +=3D "\
     file://pkg/mod/google.golang.org/protobuf@v1.36.6/LICENSE;md5=3D02d4=
002e9171d41a8fad93aa7faf3956;spdx=3DBSD-3-Clause \
 "
=20
-LIC_FILES_CHKSUM:class-native +=3D "\
+LIC_FILES_CHKSUM_HOST =3D "\
     file://pkg/mod/github.com/golang/protobuf@v1.5.4/LICENSE;md5=3D939cc=
e1ec101726fa754e698ac871622;spdx=3DBSD-3-Clause \
     file://pkg/mod/github.com/gorilla/handlers@v1.5.2/LICENSE;md5=3Dc30e=
ee78985cf2584cded5f89ba3d787;spdx=3DUnknown \
     file://pkg/mod/google.golang.org/appengine/v2@v2.0.6/LICENSE;md5=3D3=
b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
 "
+
+LIC_FILES_CHKSUM:class-native +=3D "${LIC_FILES_CHKSUM_HOST}"
+LIC_FILES_CHKSUM:class-nativesdk +=3D "${LIC_FILES_CHKSUM_HOST}"
diff --git a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb b/meta-oe/re=
cipes-test/syzkaller/syzkaller_git.bb
index 6aef105dd9..c7821910d8 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
+++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
@@ -40,13 +40,21 @@ LDFLAGS:append:class-target =3D "${@bb.utils.contains=
_any("TC_CXX_RUNTIME", "llvm
=20
 DEPENDS:class-native +=3D "qemu-system-native"
=20
-do_compile:class-native() {
+compile_native() {
     export HOSTOS=3D"${GOHOSTOS}"
     export HOSTARCH=3D"${GOHOSTARCH}"
=20
     oe_runmake HOSTGO=3D"${GO}" host
 }
=20
+do_compile:class-native() {
+    compile_native
+}
+
+do_compile:class-nativesdk() {
+    compile_native
+}
+
 do_compile:class-target() {
     export HOSTOS=3D"${GOOS}"
     export HOSTARCH=3D"${GOARCH}"
@@ -62,7 +70,7 @@ do_compile:class-target() {
     oe_runmake GO=3D"${GO}" REV=3D${SRCREV} target
 }
=20
-do_install:class-native() {
+install_native() {
     SYZ_BINS_NATIVE=3D"syz-manager syz-repro syz-mutate syz-prog2c syz-d=
b \
                      syz-upgrade"
=20
@@ -73,6 +81,14 @@ do_install:class-native() {
     done
 }
=20
+do_install:class-native() {
+    install_native
+}
+
+do_install:class-nativesdk() {
+    install_native
+}
+
 do_install:class-target() {
     SYZ_TARGET_DIR=3D"${TARGETOS}_${TARGETARCH}"
     SYZ_BINS_TARGET=3D"syz-execprog syz-executor"
@@ -84,4 +100,4 @@ do_install:class-target() {
     done
 }
=20
-BBCLASSEXTEND +=3D "native"
+BBCLASSEXTEND +=3D "native nativesdk"
--=20
2.49.0


