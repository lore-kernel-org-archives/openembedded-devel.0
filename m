Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3166C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 22:47:39 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.15441.1641941257728157349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=uqEYYOS+;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8FC4480394;
	Tue, 11 Jan 2022 23:47:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1641941254;
	bh=cBOz/Z1V9WbKQW8c/8D6HCmR5WxENzdabsezjo16YWE=;
	h=From:To:Cc:Subject:Date:From;
	b=uqEYYOS+5eDy+AMWFVGyUEg1c9kADqWQiGL2PrE+/UBiqH8YL7zE95HgWBZu/B0Wc
	 FNvdK+t7kITDmuuLcFaIQAQgV+IUkknpYV0Mqr58316CiN2EcjGSq9FaU++rPo4K2p
	 thy377/14Jxg9I4U84wvRwDmQNtpC5QHX1bWNYKp/bg5j2ujgYHYDlceY/V+hFRpIv
	 VCn1U4+KIzFv+qKpt1aVwv3FGHxzUJkYQRohsGSpFRfpVSk1HEmIT0mr5CkM/j6MjL
	 W9gVM+6PaMibRNWU4LhkGqfpQ5vMAD3fDqpfxmb03uKkpfbUnx8HEpyt+VRyxe5u4z
	 g4nHvy6ptetdA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Marek Vasut <marex@denx.de>
Subject: [meta-oe][dunfell][PATCH 1/5] freerdp: Upgrade to 2.2.0
Date: Tue, 11 Jan 2022 23:47:10 +0100
Message-Id: <20220111224714.1289840-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 22:47:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94761

From: Khem Raj <raj.khem@gmail.com>

(cherry picked from commit f751dcf81a18fe817b40e755a2ba3f54a74d1e02)
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
 .../freerdp/{freerdp_git.bb =3D> freerdp_2.2.0.bb}            | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/freerdp/{freerdp_git.bb =3D> freerdp_2.2.=
0.bb} (94%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/rec=
ipes-support/freerdp/freerdp_2.2.0.bb
similarity index 94%
rename from meta-oe/recipes-support/freerdp/freerdp_git.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
index 309acfbff..90ede1297 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
@@ -11,12 +11,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57"
 inherit pkgconfig cmake gitpkgv
=20
 PE =3D "1"
-PV =3D "2.0.0+gitr${SRCPV}"
 PKGV =3D "${GITPKGVTAG}"
=20
-# 2.0.0 release
-SRCREV =3D "5ab2bed8749747b8e4b2ed431fd102bc726be684"
-SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protoc=
ol=3Dhttps \
+SRCREV =3D "d2ba84a6885f57674098fe8e76c5f99d880e580d"
+SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dstable-2.0;pr=
otocol=3Dhttps \
     file://winpr-makecert-Build-with-install-RPATH.patch \
 "
=20
--=20
2.34.1


