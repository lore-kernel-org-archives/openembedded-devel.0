Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0BDD29DE5
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 19:51:14 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68370.1768333872955012074
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 11:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout07.t-online.de (Postfix) with SMTP id 859B3E787
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 20:51:10 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.234.232]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vfkPp-0L97Bp0; Tue, 13 Jan 2026 20:50:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] re2: update 2024.03.01 -> 2025.11.05
Date: Tue, 13 Jan 2026 20:50:45 +0100
Message-ID: <20260113195045.285913-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1768333857-41FF8939-F4CF922E/0/0 CLEAN NORMAL
X-TOI-MSGID: 05aab48a-0408-4be2-ad77-0ba2ef8ac67e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 19:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123440

Update fixes:
| /home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-poky-linux/re2/2=
024.03.01/sources/re2-2024.03.01/re2/prog.h:25:1: note: 'memchr' is defin=
ed in header '<cstring>'; this is probably fixable by adding '#include <c=
string>'
|    24 | #include "re2/sparse_set.h"
|   +++ |+#include <cstring>

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../re2/{re2_2024.03.01.bb =3D> re2_2025.11.05.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/re2/{re2_2024.03.01.bb =3D> re2_2025.11.0=
5.bb} (97%)

diff --git a/meta-oe/recipes-support/re2/re2_2024.03.01.bb b/meta-oe/reci=
pes-support/re2/re2_2025.11.05.bb
similarity index 97%
rename from meta-oe/recipes-support/re2/re2_2024.03.01.bb
rename to meta-oe/recipes-support/re2/re2_2025.11.05.bb
index a510545bab..a238b22d4c 100644
--- a/meta-oe/recipes-support/re2/re2_2024.03.01.bb
+++ b/meta-oe/recipes-support/re2/re2_2025.11.05.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b5c31eb512bdf3cb11ffd5713963=
760"
=20
 # tag 2024-03-01
-SRCREV =3D "2d866a3d0753f4f4fce93cccc6c59c4b052d7db4"
+SRCREV =3D "927f5d53caf8111721e734cf24724686bb745f55"
=20
 SRC_URI =3D "git://github.com/google/re2.git;branch=3Dmain;protocol=3Dht=
tps \
            ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest'=
, '', d)} \
--=20
2.52.0


