Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BDFEDEBF4
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 20:39:24 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2583.1772570360137893599
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Mar 2026 12:39:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout10.t-online.de (Postfix) with SMTP id 155C0381B1
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Mar 2026 21:39:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.34]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vxWWO-3PLBU90; Tue, 3 Mar 2026 21:39:12 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] brotli: update 1.1.0 -> 1.2.0
Date: Tue,  3 Mar 2026 21:39:05 +0100
Message-ID: <20260303203905.157264-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1772570352-AB7D90D6-8842D3CD/0/0 CLEAN NORMAL
X-TOI-MSGID: c7fcbc32-dc9d-41ef-80fa-7d0dfbf82db8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 20:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124835

[1.2.0] - 2025-10-27
SECURITY

    python: added Decompressor::can_accept_more_data method and optional =
output_buffer_limit argument Decompressor::process; that allows mitigatio=
n of unexpectedly large output; reported by Charles Chan (https://github.=
com/charleswhchan)

Added

    decoder / encoder: added static initialization to reduce binary size
    python: allow limiting decoder output (see SECURITY section)
    CLI: brcat alias; allow decoding concatenated brotli streams
    kt: pure Kotlin decoder
    cgo: support "raw" dictionaries
    build: Bazel modules

Removed

    java: dropped finalize() for native entities

Fixed

    java: in compress pass correct length to native encoder

Improved

    build: install man pages
    build: updated / fixed / refined Bazel buildfiles
    encoder: faster encoding
    cgo: link via pkg-config
    python: modernize extension / allow multi-phase module initialization

Changed

    decoder / encoder: static tables use "small" model (allows 2GiB+ bina=
ries)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../brotli/{brotli_1.1.0.bb =3D> brotli_1.2.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/brotli/{brotli_1.1.0.bb =3D> brotli_1.2.=
0.bb} (93%)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb b/meta-oe/re=
cipes-extended/brotli/brotli_1.2.0.bb
similarity index 93%
rename from meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
rename to meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
index 411f8a7610..84495a3236 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
@@ -7,7 +7,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D941ee9cd1609382f94635271=
2a319b4b"
=20
 SRC_URI =3D "git://github.com/google/brotli.git;branch=3Dmaster;protocol=
=3Dhttps"
-SRCREV =3D "ed738e842d2fbdf2d6459e39267a633c4a9b2f5d"
+SRCREV =3D "028fb5a23661f123017c060daa546b55cf4bde29"
=20
=20
 inherit cmake lib_package
--=20
2.52.0


