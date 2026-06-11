Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB1ECD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 12:45:55 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44535.1781181949872402934
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 05:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=EiofeB3V;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout11.t-online.de (Postfix) with SMTP id A99531C24A
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 14:45:47 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.237]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wXen4-40T3tB0; Thu, 11 Jun 2026 14:45:46 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] hwlock: update LIC_FILES_CHECKSUM
Date: Thu, 11 Jun 2026 14:45:40 +0200
Message-ID: <20260611124540.1132897-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781181946-397F9BA7-5D05E40A/0/0 CLEAN NORMAL
X-TOI-MSGID: ccf65603-1291-40ca-97c9-6fce2971959a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781181947; i=f_l_k@t-online.de;
	bh=Jmred8Md+TpYLfh/oOdAbLOQ/ogY0hmbcDgxFNKpWPA=;
	h=From:To:Subject:Date;
	b=EiofeB3VOtn0ydEJEQQzluhsOP4aT2/UPnmtmOGyvFdzgwDAIB9Y0tWL9g3yQgfoB
	 8Uh6VR9xBs7rmWE8/c6RjeK6XysP9wq0FngXNPxBTf580N/qsKr5yvcXW/yF2xghnO
	 BfM6uwwzuhWeiLKBMTtJu5jhpVpREDXvT+TKvpIEghuBC6ErV0nPt8kt4Qfrjj6aiu
	 Br1HkC6gNZDlvIunNwefUr2Vhr/RLRDDKTBwo6ICVa6Gs1X0/D5ZK5opJ0DJur6aFY
	 CVlcexaMBMNj4w/5rMUli+tBKGqm3Z5UGyf8q2JeT96A1xxKJo1l2Pxkr2zxbs7G5K
	 LAq8FEnihKV4A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 12:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127531

- SPDX license header has been added
- hwloc/base64.c is distributed under the ISC license
---
 meta-oe/recipes-extended/hwloc/hwloc_2.14.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_2.14.0.bb b/meta-oe/rec=
ipes-extended/hwloc/hwloc_2.14.0.bb
index 9716e32faa..aeff14fd20 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_2.14.0.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_2.14.0.bb
@@ -4,8 +4,8 @@ DESCRIPTION =3D "The Portable Hardware Locality (hwloc) s=
oftware package \
  architectures."
 HOMEPAGE =3D "https://www.open-mpi.org/software/hwloc/"
 SECTION =3D "base"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D79179bb373cd55cbd834463a514fb=
714"
+LICENSE =3D "BSD-3-Clause & ISC"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D883e49a2e0f7142a345f9b0c01a38=
0e7"
=20
 SRC_URI =3D "https://www.open-mpi.org/software/${BPN}/v2.14/downloads/${=
BP}.tar.bz2"
 SRC_URI[sha256sum] =3D "966b9bb3e9f29f8d65ce8d106779e457f40e246a645e584b=
100772a42f9ae94b"
--=20
2.54.0


