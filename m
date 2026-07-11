Return-Path: <esa.jaaskela@suomi24.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D5AC43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 19:22:43 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2251.1783797754918727426
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jul 2026 12:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: illegal base64 data at input byte 231" header.i=@suomi24.fi header.s=MBO0001 header.b=fq+CZ6wM;
 spf=pass (domain: suomi24.fi, ip: 80.241.56.161, mailfrom: esa.jaaskela@suomi24.fi)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gyJVt6z4VzKn8g;
	Sat, 11 Jul 2026 21:22:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suomi24.fi; s=MBO0001;
	t=1783797751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYbCFvcATGcynfcY5fYIufd5wu1ny5NXWsbgkoB/Wgw=;
	b=fq+CZ6wMofmJtlAkk1jrfUvuuQ1KAcBS6OkPq6Cf+giA5J8mb4AerWi8HW7ivgn56Gl6o8
	9Q7TPgnwnXrwj0mKiwaLJ4WkiyG0KpPyU9rS71BZAF9fGSf64KBpLAaDDuYbgHpKSw6g/i
	OYifGf0EFC0AUxukJn0lfBH02+NGpCmBkz1/5A2mhAnH04Ta5RuFISUPlRnZRF/Vu8+csA
	S7NQ8qImaj1H8db2I1Al9yXgH65anyHMLey8xgbvS1bXtTGnIXWVQ9fCkpiEv78n7MCnLw
	WIXaiuDT3OZ/3tu/Vj+Sf7zOit2qdW84ICsCT6F45/eYAP5ro2kvTAH6dWBmoQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of esa.jaaskela@suomi24.fi designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=esa.jaaskela@suomi24.fi
From: Esa Jaaskela <esa.jaaskela@suomi24.fi>
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Esa Jaaskela <esa.jaaskela@suomi24.fi>
Subject: [meta-oe][scarthgap][PATCH 1/2] uutils-coreutils: disable stdbuf compilation
Date: Sat, 11 Jul 2026 22:22:02 +0300
Message-ID: <20260711192203.2343958-2-esa.jaaskela@suomi24.fi>
In-Reply-To: <20260711192203.2343958-1-esa.jaaskela@suomi24.fi>
References: <20260711192203.2343958-1-esa.jaaskela@suomi24.fi>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4gyJVt6z4VzKn8g
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Jul 2026 19:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128138

From: Etienne Cordonnier <ecordonnier@snap.com>

There is a bug in uutils-coreutils causing stdbuf to include the HOST ver=
sion of libstdbuf.so, even when cross-compiled.
As a side-effect, the uutils-coreutils binary was containing the buildpat=
h, because RPATH was set on libstdbuf.so.
Thus the buildpath error can be re-enabled.

This is tracked upstream by https://github.com/uutils/coreutils/issues/65=
91

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Co-authored-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1d43511321f2bd08a4b3f0aa1422cf406ae0b3f6)
Signed-off-by: Esa Jaaskela <esa.jaaskela@suomi24.fi>
---
 .../files/0002-do-not-compile-stdbuf.patch    | 39 +++++++++++++++++++
 .../uutils-coreutils_0.0.28.bb                |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/uutils-coreutils/files/0002-do-n=
ot-compile-stdbuf.patch

diff --git a/meta-oe/recipes-core/uutils-coreutils/files/0002-do-not-comp=
ile-stdbuf.patch b/meta-oe/recipes-core/uutils-coreutils/files/0002-do-no=
t-compile-stdbuf.patch
new file mode 100644
index 0000000000..e4f5627f12
--- /dev/null
+++ b/meta-oe/recipes-core/uutils-coreutils/files/0002-do-not-compile-std=
buf.patch
@@ -0,0 +1,39 @@
+From 5c08d92aae49f83e3b52ae58e566ef48c749f3c7 Mon Sep 17 00:00:00 2001
+From: Etienne Cordonnier <ecordonnier@snap.com>
+Date: Fri, 7 Mar 2025 16:39:33 +0100
+Subject: [PATCH] do not compile stdbuf
+
+Due to including the host version of libstdbuf.so, stdbuf does not work =
when cross-compiled. See https://github.com/uutils/coreutils/issues/6591#=
issuecomment-2706575853 for details
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
+---
+ Cargo.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Cargo.toml b/Cargo.toml
+index ea87ccea79..e218719363 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -154,7 +154,7 @@ feat_os_macos =3D [
+ feat_os_unix =3D [
+   "feat_Tier1",
+   #
+-  "feat_require_crate_cpp",
++  # don't compile feature_require_crate_cpp per default (which contains=
 only stdbuf). "feat_require_crate_cpp",
+   "feat_require_unix",
+   "feat_require_unix_utmpx",
+   "feat_require_unix_hostid",
+@@ -189,7 +189,7 @@ feat_os_unix_android =3D [
+ # ** NOTE: these `feat_require_...` sets should be minimized as much as=
 possible to encourage cross-platform availability of utilities
+ #
+ # "feat_require_crate_cpp" =3D=3D set of utilities requiring the `cpp` =
crate (which fail to compile on several platforms; as of 2020-04-23)
+-feat_require_crate_cpp =3D ["stdbuf"]
++feat_require_crate_cpp =3D []
+ # "feat_require_unix" =3D=3D set of utilities requiring support which i=
s only available on unix platforms (as of 2020-04-23)
+ feat_require_unix =3D [
+   "chgrp",
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.2=
8.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
index 76cecac5a6..beaef37700 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De74349878141b2=
40070458d414ab3b64"
 inherit cargo cargo-update-recipe-crates
=20
 SRC_URI +=3D "git://github.com/uutils/coreutils.git;protocol=3Dhttps;bra=
nch=3Dmain \
-    file://0001-Cargo.lock-revert-to-selinux-sys-0.6.9-and-fts-sys-0.pat=
ch"
+    file://0001-Cargo.lock-revert-to-selinux-sys-0.6.9-and-fts-sys-0.pat=
ch \
+    file://0002-do-not-compile-stdbuf.patch"
=20
 # musl not supported because the libc crate does not support functions l=
ike "endutxent" at the moment,
 # so src/uucore/src/lib/features.rs disables utmpx when targetting musl.
--=20
2.47.3


