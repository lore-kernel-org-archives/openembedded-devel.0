Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5604AC5B56B
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28553.1786364497462532535
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=P59vHHTg;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEA6314BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 755BB3F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364496; bh=WD40vqhN6trgjJB46gjFTmVJnbAdR7PbJdtLEAmzk6s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P59vHHTgMBvZWfXnIjwZutjKQmn9kAHOFzmaMFUSpLMdXyQ2wij/ctflZtmmW5p0L
	 b9BKCvTiH2abVpNHXjGViT8BPHYOwuf5mS68+Nk5cI7Elov9ANfDZ6Uls2zJfczxzQ
	 +5nXplwYExiXoFbt42A4XkDPH2su4ZjoJkuf15IE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/24] python3-odb: add missing newline
Date: Mon, 10 Aug 2026 13:21:13 +0100
Message-ID: <20260810122130.633299-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128887

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-obd_0.7.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.3.bb b/m=
eta-python/recipes-devtools/python/python3-obd_0.7.3.bb
index 8deef31d56..e7eb3a784d 100644
--- a/meta-python/recipes-devtools/python/python3-obd_0.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-obd_0.7.3.bb
@@ -1,4 +1,5 @@
-DESCRIPTION =3D "A python module for handling realtime sensor data from =
OBD-II vehicle ports"HOMEPAGE =3D "https://github.com/brendan-w/python-OB=
D"
+DESCRIPTION =3D "A python module for handling realtime sensor data from =
OBD-II vehicle ports"
+HOMEPAGE =3D "https://github.com/brendan-w/python-OBD"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://README.md;md5=3D176d0f9ad45c10895296260d426=
fa862"
=20
--=20
2.43.0


