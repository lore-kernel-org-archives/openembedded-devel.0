Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9E3CD4F39
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 10:52:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4837.1778669538128429474
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 03:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=SKT0tqjh;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A6A51655
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:52:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 49CB23F7B4
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778669537; bh=7AS25b+qEFiLPv3KTA8JZfeMwVhMXASDoflD+7Cm5qo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SKT0tqjh3o9z22gPvuDB7xQiw/VfkvYsgytcy/xlrImj3ozobaVat7MXnRWJOZBTh
	 le/IWLLATKAVLb2x6KlnpgMBLOp1Cg6d0pip5/NU6mfTp5fo3nXCftF7fo4D2diHjb
	 lc8f+FocQkccosDi/CsVc5fBpqhUCBQZpJlhJ0y0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 5/7] file-roller: drop libhandy dependency
Date: Wed, 13 May 2026 11:52:08 +0100
Message-ID: <20260513105210.2109216-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513105210.2109216-1-ross.burton@arm.com>
References: <20260513105210.2109216-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 10:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126969

This was removed when file-roller was ported to GTK 4.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb b/m=
eta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
index 050f6803c7..f0f74f5561 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
@@ -11,7 +11,6 @@ DEPENDS =3D " \
     gtk4 \
     libadwaita \
     libarchive \
-    libhandy \
     libportal \
 "
=20
--=20
2.43.0


