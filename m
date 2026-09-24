Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00039C98312
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 05:59:49 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1569.1790229583808331103
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 22:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=f3PJcovm;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id 8CDE3E179
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 07:59:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.151]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x9cUe-4OuUPw0; Thu, 24 Sep 2026 07:59:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] rclone: drop the require of the generated files
Date: Thu, 24 Sep 2026 07:59:23 +0200
Message-ID: <20260924055926.7886-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790229580-AB7FD986-9594DE66/0/0 CLEAN NORMAL
X-TOI-MSGID: ced4d4f0-8ff0-4934-b081-5ea3bea12769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790229581; i=f_l_k@t-online.de;
	bh=7nTChE7qN8D3P14Nf8VPsI8AWdywVZ/YmyMAzCC7gdY=;
	h=From:To:Subject:Date;
	b=f3PJcovmzNmS4EqoowhkZ9NS6dxvVNBREI+PMbUh/BwVzY1Z9NHALG7OzjoYmrsPT
	 davBecT+c6U6lzV/x45ZqtsJeJCIImeiqBbUUT+71x2YWjWVTbOSsoxbDtNLrwcX7g
	 8LwFw6ilTmhMuZWe25siOAo9E+W88k8T4z+7Xq1uq+yF+RmS4nrvmdCVE6g9Gc9ywu
	 ouMoYNs9egRBuUKml+IySYPeE7dgfK7SuIiKfBQKLWKBI5N1JCCi3AtUYKIGvjbU8F
	 b07oYpaEDgJHgEHDcM8jJiY25H8RQgZSHnyF5AusqYxB4fEcH3kHBk1fDQLrWCsK4j
	 6RJMafinh7fGg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 05:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130275

go-mod-update-modules includes the -licenses.inc and -go-mods.inc files
itself now, requiring them again includes them twice.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/rclone/rclone_1.75.1.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-support/rclone/rclone_1.75.1.bb b/meta-oe/re=
cipes-support/rclone/rclone_1.75.1.bb
index ccf774359a..510c881dc9 100644
--- a/meta-oe/recipes-support/rclone/rclone_1.75.1.bb
+++ b/meta-oe/recipes-support/rclone/rclone_1.75.1.bb
@@ -6,9 +6,6 @@ LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/COPYING;md5=
=3Dbed161b82a1ecab65ff7ba3c
 SRC_URI =3D "git://${GO_IMPORT};protocol=3Dhttps;nobranch=3D1;tag=3Dv${P=
V};destsuffix=3D${GO_SRCURI_DESTSUFFIX}"
 SRCREV =3D "687d264b689b8c49a67e2e52a8a5e0caa01c04ce"
=20
-require ${BPN}-licenses.inc
-require ${BPN}-go-mods.inc
-
 GO_IMPORT =3D "github.com/rclone/rclone"
 GO_INSTALL =3D "${GO_IMPORT}"
=20
--=20
2.55.0


