Return-Path: <me@sephalon.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42B3C87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 08:42:08 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.web11.46921.1754556124118789719
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Aug 2025 01:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@sephalon.net header.s=MBO0001 header.b=ebAEez3T;
 spf=none, err=permanent DNS error (domain: sephalon.net, ip: 80.241.56.152, mailfrom: me@sephalon.net)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4byLHr2tz0z9smd;
	Thu,  7 Aug 2025 10:42:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sephalon.net;
	s=MBO0001; t=1754556120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mClBfyuYg6A+9uX+XqWHn5Ulpp308CdBA5zkZ3VIVV4=;
	b=ebAEez3TlUa+ON/CMrvmk2SEokAPmLkVBzi7bAeilt5tTt0awFm2Omsd1utCRGtpjukZg0
	8vmDBlUt40Ips3yzzdKE5GQXhMslZBylwVmmBtNcq9wITqWqiAnfKj/+eJWBy9wzlB1Bad
	T/a6zWmoF/DcdE68NaGUYnjyPQeB8XHH12FHw+waKFL/yABw+jlreS4jI/pe0vqHkQoyEo
	5DRj8vKPw+HISjmRlqiCf6fnjai9QFI4zQ/GLhOEqPeQA8WGhYg2Szq5P1oBnQelPc4+cI
	LPJDwWNYLTviap7LAJ1SkRPz1TQqKFaU4ELG4C31FOcOeE1QLkbu7llSi4Jx9Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=none (outgoing_mbo_mout: domain of me@sephalon.net has no SPF policy when checking 2001:67c:2050:b231:465::202) smtp.mailfrom=me@sephalon.net
From: Stefan Wiehler <me@sephalon.net>
To: openembedded-devel@lists.openembedded.org
Cc: Stefan Wiehler <me@sephalon.net>
Subject: [meta-oe][PATCH 2/2] syzkaller: Add nativesdk
Date: Thu,  7 Aug 2025 10:41:08 +0200
Message-ID: <20250807084108.1149963-2-me@sephalon.net>
In-Reply-To: <20250807084108.1149963-1-me@sephalon.net>
References: <20250807084108.1149963-1-me@sephalon.net>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4byLHr2tz0z9smd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Aug 2025 08:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118896

Signed-off-by: Stefan Wiehler <me@sephalon.net>
---
 .../syzkaller/syzkaller-licenses.inc          |  5 ++++-
 .../recipes-test/syzkaller/syzkaller_git.bb   | 22 ++++++++++++++++---
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc b/meta=
-oe/recipes-test/syzkaller/syzkaller-licenses.inc
index 61d7d57d51..4c5512d5ac 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc
+++ b/meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc
@@ -73,9 +73,12 @@ LIC_FILES_CHKSUM +=3D "\
     file://pkg/mod/google.golang.org/protobuf@v1.36.6/LICENSE;md5=3D02d4=
002e9171d41a8fad93aa7faf3956;spdx=3DBSD-3-Clause \
 "
=20
-LIC_FILES_CHKSUM:class-native +=3D "\
+LIC_FILES_CHKSUM_HOST =3D "\
     file://pkg/mod/cloud.google.com/go/secretmanager@v1.15.0/LICENSE;md5=
=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
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
index 782eb60a97..710c7b6579 100644
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


