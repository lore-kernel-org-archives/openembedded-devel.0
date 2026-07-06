Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD96FC43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 08:34:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.146719.1783326891138433783
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 01:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ngRmRpYX;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CC2928C7
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Jul 2026 01:34:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2FD2A3F85F
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Jul 2026 01:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783326890; bh=vsGqWklWK+X/GX863bq6yNWsck6aUAiyq8FDnEmscCM=;
	h=From:To:Subject:Date:From;
	b=ngRmRpYXtycXrm9tm1bH4rZyR1Hno/b7AheGa4TcxMQ5Am461iMPVYfoBWc41PzKp
	 j7MzNK/A278tyUwM8OoMU+YYewi92xWsVF8TC9FYGEDxZT59t6JAMyJKpomV5GP5/g
	 oM9P/hfGjKiLkjHOGXbRc49zt7zD3mE7TD3WHcPQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] librav1e: make nasm dependency x86-specific
Date: Mon,  6 Jul 2026 09:34:44 +0100
Message-ID: <20260706083445.2842309-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 08:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128026

nasm is an x86 assembler, so only depend on it (and work around the
build paths errors) on x86-64 (the assembler fastpaths are explicitly
64-bit only).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-multimedia/rav1e/librav1e_p20250902.bb           | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.=
bb b/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
index 836cd4448f..80ac5d9268 100644
--- a/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
+++ b/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
@@ -7,9 +7,10 @@ inherit cargo_c pkgconfig cargo-update-recipe-crates
=20
 require ${PN}-crates.inc
=20
-DEPENDS +=3D "nasm-native"
+DEPENDS:append:x86_64 =3D " nasm-native"
=20
 SRC_URI +=3D "git://github.com/xiph/rav1e.git;protocol=3Dhttps;nobranch=3D=
1;tag=3D${PV}"
 SRCREV =3D "a2f01b3e233f531c28a20b4c29fb5c9e5d29fa6d"
=20
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
+# TODO we need to pass -fdebug-prefix-map to the nasm calls
+INHIBIT_PACKAGE_DEBUG_SPLIT:x86-64 =3D "1"
--=20
2.43.0


