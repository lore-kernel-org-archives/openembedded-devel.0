Return-Path: <esa.jaaskela@suomi24.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFA1C44501
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 19:22:43 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2136.1783797756712543992
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jul 2026 12:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: illegal base64 data at input byte 231" header.i=@suomi24.fi header.s=MBO0001 header.b=ktZrDWfH;
 spf=pass (domain: suomi24.fi, ip: 80.241.56.172, mailfrom: esa.jaaskela@suomi24.fi)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gyJVx2QgLzMlGC;
	Sat, 11 Jul 2026 21:22:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suomi24.fi; s=MBO0001;
	t=1783797753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wU4d+W219h0JJzguoQrKRqilACldQjjeQPz0GPNUPYg=;
	b=ktZrDWfHwvKcH1JWZN00WFD49akfTye7mguhkkOUgI388TmhmtRCHMrTTCuOB6Rxqu3wf9
	XSs37QpnkIYC5ZaEL4PchVbZJRWBTRbDJ2QZZaA8NtGtoZUAKEwRCLq3w3OTCPom7njWjV
	3E2c1GdMCTfkjORR78WZNt2+Z9J3NRcX0Xv2KtDoC9yFnA1mb7vRFCJ/I+D7DH+GnT6qBH
	YEvjibyrWagAam3aUoFTSo8bp6ySM3nWX1e3yR8lGEWSqaSvyoroXm4bflrjyddgXW1J8q
	+krM1qhGQITUGIQKLI+4jfEfml27/a9j8SfLTS30sWYiu6EPtJRcumG6igOF6w==
From: Esa Jaaskela <esa.jaaskela@suomi24.fi>
To: openembedded-devel@lists.openembedded.org
Cc: Esa Jaaskela <esa.jaaskela@suomi24.fi>
Subject: [meta-oe][scarthgap][PATCH 2/2] uutils-coreutils: fix buildpaths QA warning
Date: Sat, 11 Jul 2026 22:22:03 +0300
Message-ID: <20260711192203.2343958-3-esa.jaaskela@suomi24.fi>
In-Reply-To: <20260711192203.2343958-1-esa.jaaskela@suomi24.fi>
References: <20260711192203.2343958-1-esa.jaaskela@suomi24.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Jul 2026 19:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128139

The onig_sys and blake3 crates build bundled C via cc crate. The build
path leaks into the the -dbg binary and trips the buildpaths QA check.
Add a -fdebug-prefix-map for ${CARGO_HOME} to CFLAGS to add a correct
mapping.

Signed-off-by: Esa Jaaskela <esa.jaaskela@suomi24.fi>
---
 .../recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.2=
8.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
index beaef37700..d864a8ee0c 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
@@ -18,6 +18,8 @@ COMPATIBLE_HOST:libc-musl =3D "null"
 SRCREV =3D "1d9e1626377cbaea3b21842a3525a62ba60f905f"
 S =3D "${WORKDIR}/git"
=20
+CFLAGS:append =3D " -fdebug-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC=
_DIR}/cargo_home"
+
 require ${BPN}-crates.inc
=20
 PROVIDES =3D "coreutils"
--=20
2.47.3


