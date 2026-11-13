Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6316.1794554342284480218
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 23:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=ZQ6HL3Oa;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout07.t-online.de (Postfix) with SMTP id A10BF104D4
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 08:18:59 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRlYp-4chPTE0; Fri, 13 Nov 2026 08:18:59 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] multipath-tools: fetch 0.15.1 by its tag
Date: Fri, 13 Nov 2026 08:18:53 +0100
Message-ID: <20261113071853.2612379-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794554339-2FFFC818-ABEAA851/0/0 CLEAN NORMAL
X-TOI-MSGID: 3fc7aff7-485d-40e7-a909-f4bb50286994
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794554339; i=f_l_k@t-online.de;
	bh=5CUz0Y6Kc7/VWooaBzFuRXjs07lmksQ4yR8fBZQrQzI=;
	h=From:To:Subject:Date;
	b=ZQ6HL3OavRz+6bv/d1lq/wBS6hHeJv8TcFbuqG10mS3wUit2hOz4bKSCL0XcaoX+Q
	 4xQ2sAqgkBkWi2DLkiPCfF2eKOecQTWRcExydHFzQhQSw3IkSiLXJ1JMNRuw6whhmj
	 X9XZpEnpJgB3gcXH9lZ+5MmZRmHQhyPH+ZGkj++9BhWsp+ZKV0/IwRO0+Tp4uwY+XK
	 U+sQcxG2gXW1Exuz1aWEKeS0ma1X8w1fqhbChz5oReHhl8knAsm/QFwM0YS7Fc1Xa9
	 Gh4Z8Dqef8d8Z4ekRuvQbcfWzwEmtg2zMzTx/1D00CZlBJLxng4Ilajoje7OWAwMBD
	 f2RMZVzbTJe7w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 07:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132227
Content-Type: text/plain; charset="utf-8"

The 0.15.1 release commit is on master; there is no stable-0.15.y branch
yet and stable-0.12.y does not contain it, so the fetch failed. Fetch by
the tag without a branch, which also holds for later releases on a
stable branch. Tested by building multipath-tools for corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/multipath-tools/multipath-tools_0.15.1.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.15=
.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.15.1.bb
index 4245e42780..fd9395acfd 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.15.1.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.15.1.bb
@@ -29,7 +29,7 @@ DEPENDS =3D "libdevmapper \
=20
 LICENSE =3D "GPL-2.0-only"
=20
-SRC_URI =3D "git://github.com/opensvc/multipath-tools.git;protocol=3Dhtt=
ps;branch=3Dstable-0.12.y \
+SRC_URI =3D "git://github.com/opensvc/multipath-tools.git;protocol=3Dhtt=
ps;nobranch=3D1;tag=3D${PV} \
            file://multipathd.oe \
            file://multipath.conf.example \
            file://0001-RH-fixup-udev-rules-for-redhat.patch \
--=20
2.56.0

