Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB61EB64DC
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 01:11:59 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.3214.1689124310777007947
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 18:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=nR/Mh3kB;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9BA6086906;
	Wed, 12 Jul 2023 03:11:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1689124308;
	bh=GADbn4QpLE/brs5Y1bBoLRYqKGHmkWHb2a1tAD3IwqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nR/Mh3kBO2xO8hIKaMHhhltkXuuH6ZxLxqRPYr9UuBIioN2uXgipsRjN/vrZHNvTh
	 PczTN7KXihNYcPaPvYrh6N2CPN5CLXed49fbaoxZsjfFNdqAFMofDDcVhqkd3WvN7J
	 Nn41+Fti0AbSNA2Gvnf3fIzW84g2aaiEoPLrbfAAqdE8fHV98qrXNJ4jZriezB1h0R
	 OnAn3XfsDNLCabFyivPtopQEFETv9P1mJneLN2Q40cK9xjxBTd+PEPMIK1gKlKVQKu
	 efBCriBRg7Z/AauUZE4hzKUl3lWxTiu+ILMQq7ddhACJ1ePuQHyexLXPgOiufxeoCs
	 mGlsSRP71tr8Q==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Christian Eggers <ceggers@arri.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][PATCH 2/2] libiio: enable c++ bindings
Date: Wed, 12 Jul 2023 03:11:22 +0200
Message-Id: <20230712011122.105264-2-marex@denx.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712011122.105264-1-marex@denx.de>
References: <20230712011122.105264-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 01:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103734

The C++ bindings are new in libiio 0.25 , make those available.
Unlike python bindings which are gated off by PACKAGECONFIG, it
seems the C++ bindings have no dependencies, the C++ compiler is
always present, so the bindings can always be enabled.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Siegumfeldt <mns@gomspace.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recip=
es-support/libiio/libiio_git.bb
index b89ae29ea..ecbd2c864 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -22,6 +22,7 @@ inherit cmake python3native systemd setuptools3 pkgconf=
ig
=20
 EXTRA_OECMAKE =3D " \
     -DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
+    -DCPP_BINDINGS=3DON \
     -DFLEX_TARGET_ARG_COMPILE_FLAGS=3D'--noline' \
     -DBISON_TARGET_ARG_COMPILE_FLAGS=3D'--no-lines' \
     -DUDEV_RULES_INSTALL_DIR=3D${nonarch_base_libdir}/udev/rules.d \
--=20
2.40.1


