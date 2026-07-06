Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFCEC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 08:34:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.145785.1783326891825419015
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 01:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=J1b8r3P1;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA75D2BC4
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Jul 2026 01:34:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DD6323F85F
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Jul 2026 01:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783326891; bh=quDieWGZTSxWD8CNZjgfkztXYwDr1ulm92804Dyq3Z8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=J1b8r3P1Z7M3EU6M521eeqVQjPTtgb9Q50M7XAT2T+EpvxDWa6ZePzEw6JaYh7R5f
	 LOOm4SG1+JgijkANY45T7hQ/uXyUqCzoEHkyY3BXTYEgMQNOJr59C4wgR4lRp5RdP6
	 NUzNBSG8TfA/289EktW675rkYIw6xqFiEe8TPwqg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] uutils-coreutils: delete .cargo/config.toml
Date: Mon,  6 Jul 2026 09:34:45 +0100
Message-ID: <20260706083445.2842309-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706083445.2842309-1-ross.burton@arm.com>
References: <20260706083445.2842309-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 08:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128027

This file hardcodes a specific compiler for aarch64-linux builds, which
is not the compiler that we provide.  As it's otherwise useless, we can
just delete the file.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0=
.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb
index d294736395..2c7d3a3200 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb
@@ -65,6 +65,10 @@ python __anonymous() {
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
+do_configure:prepend() {
+    rm -f ${S}/.cargo/config.toml
+}
+
 do_compile:prepend() {
     export LIBSTDBUF_DIR=3D"${libdir}/coreutils"
 }
--=20
2.43.0


