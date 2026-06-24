Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D3BCDE002
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 14:49:49 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9094.1782312580088220359
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 07:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=FwZ+jmrd;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd92.aul.t-online.de (fwd92.aul.t-online.de [10.223.144.118])
	by mailout03.t-online.de (Postfix) with SMTP id B6761E083
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 16:49:29 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.171.242]) by fwd92.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wcOuu-2PqYNu0; Wed, 24 Jun 2026 16:49:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] pipewire: update  1.6.6 -> 1.6.7
Date: Wed, 24 Jun 2026 16:49:22 +0200
Message-ID: <20260624144922.2404303-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624144922.2404303-1-f_l_k@t-online.de>
References: <20260624144922.2404303-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782312568-B3FFD46A-ABC4B304/0/0 CLEAN NORMAL
X-TOI-MSGID: d43a187e-0e68-44e4-bb58-27f6e172aa5e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782312569; i=f_l_k@t-online.de;
	bh=GF6/852tegHDMoY8MOtUgcJwn3i2nWocTNzng5ENG9w=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FwZ+jmrd7Vb+MnS3Imbn9Me6k8U9aokSPWw5xsSMEOIEi3WeYorsjeSM11B8dQrPq
	 8aXYB6wSJR15est0SjQA8i3LJYh1HU/0t1hQPXTZRSXdFK4Xm2sWzMCiLC9UvHxwIb
	 Z0RPdDSPl2kPBpr388LA93yUbPD1Z+2D/kQhtKIjvZgJo4ZLo8ER4OJyUF1cCQPMZj
	 8b+ZCoV/5pyc3oIKQGrOcMUs45RINsmfQC/C6C0DVvLB83weRx2U2QaET2L4mHmiKq
	 StpMT+QQV2OqIpeFFl6juZObMdoMQU/XCp6TX7QXyqiqbOlEeRXmemYY4adyjyGtud
	 AkM+yPQ7cA9iQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 14:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127718

PipeWire 1.6.7 (2026-06-18)

This is a bugfix release that is API and ABI compatible with the previous
1.6.x releases.

Highlights
  - Fix a race issue where some ports would stay silent after a rate chan=
ge.
  - Fix sync regressions between ALSA cards in some cases.
  - Small fixes and improvements.

PipeWire
  - Fix a scheduler regression where some driver nodes would not run
    correctly and cause sync issues. (#5210)
  - Fix a race issue with suspend on samplerate changes. It can cause por=
ts
    to be silent. (#3547)

Modules
  - There are some locking issues in the RT portal, for now reduce the
    DBus timeout to something more sane. Also disable portal RT for
    pipewire and the pulse server. These are not usually run in a sandbox
    and can go directly to RTKit.
  - Fix potential incorrect delay in combine-stream.

SPA
  - Fix a regression in ALSA period_size calculations. For non-power-of-2
    periods, it would in some cases round down a a power-of-2, causing a
    mismatch between requested and configured period_size. (#5302)
  - Fix a potential segfault when removing a card because of bad ALSA api
    usage. (#5255)
  - Emit a route param update when card properties change. Otherwise, jac=
k
    port updates are not always reflected correctly.

Misc
  - Make sure we don't deal with uninitialized spa_dict.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.6.6.bb =3D> pipewire_1.6.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.6.bb =3D=
> pipewire_1.6.7.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.6.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.6.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
index c8631904ff..50feeaf843 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.6.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus"
=20
-SRCREV =3D "a1c1d9f9f128ec987f23a0140a1704b8f8781787"
+SRCREV =3D "3b2cb4fb037bf6033b87d3c87ee917b2f686d309"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps;tag=3D${PV}"
 SRC_URI +=3D "file://0002-spa-plugins-alsa-acp-compat.h-p-is-already-con=
st-do-.patch"
--=20
2.54.0


