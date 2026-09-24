Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E95C98314
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 06:45:40 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2029.1790232336199899970
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 23:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=mc5YFLKW;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout02.t-online.de (Postfix) with SMTP id 23A97DF55
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 08:45:34 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.151]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x9dCz-1Cw6L30; Thu, 24 Sep 2026 08:45:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] syzkaller: inherit go-mod-update-modules
Date: Thu, 24 Sep 2026 08:45:23 +0200
Message-ID: <20260924064523.165613-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924064523.165613-1-f_l_k@t-online.de>
References: <20260924064523.165613-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790232329-89FF890A-3D06AB10/0/0 CLEAN NORMAL
X-TOI-MSGID: 2025f794-0bba-4156-977d-06d73db85e58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790232334; i=f_l_k@t-online.de;
	bh=J9gPikpzVdapPrOpTlyjjWxcHJL9hZ2cmAMyCTV/oP4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=mc5YFLKWq38gcPJx2JG0MzPnVF41dmq7fMVGH66bcpy9QL64UdhEtSFvsL63hanbb
	 uEJYVgW7kxHeljjI5PcLKIsCAHxthqA3lvB872QQkdOrzEYG/R53uSbOzboEb9RMJH
	 WuN15bHpijUJDyv2GBnBuRfzZvTIlgN708LhZVb0G+nYgvS/SWElIaCK7HC/1Tna5L
	 JgQ1b6tWSj8/kczQkNGIgVa+LNXb4fgltRLSfCjtBeZ+E8TSJr+jUgUYIhnNKwhW1Z
	 csAh3fWpWdXnqqtcUFORBYTbw56Lb9x9q0WIq3iKbsqKRT5ZECc7d2OL8/33tqb5b2
	 P+Tb8l8Krq8Mw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 06:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130280

The class includes the generated -licenses.inc and -go-mods.inc files
itself and provides the update_modules task to regenerate them, so the
recipe no longer needs to require them.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-test/syzkaller/syzkaller_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb b/meta-oe/re=
cipes-test/syzkaller/syzkaller_git.bb
index bdd4cf6a40..25df242d42 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
+++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
@@ -4,16 +4,14 @@ BUGTRACKER =3D "https://github.com/google/syzkaller/iss=
ues"
 SECTION =3D "devel"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3D5335066555b1=
4d832335aa4660d6c376"
-require ${BPN}-licenses.inc
=20
 SRC_URI =3D "git://${GO_IMPORT};protocol=3Dhttps;destsuffix=3D${GO_SRCUR=
I_DESTSUFFIX};branch=3Dmaster"
 SRCREV =3D "22ec1469fe8c0ba256de07e8f97fa7b375b522bd"
-require ${BPN}-go-mods.inc
=20
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-inherit go-mod
+inherit go-mod go-mod-update-modules
=20
 GO_IMPORT =3D "github.com/google/syzkaller"
=20
--=20
2.55.0


