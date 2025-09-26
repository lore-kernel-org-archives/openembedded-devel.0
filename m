Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1985CCA468
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 19:16:58 +0000 (UTC)
Received: from outbound1.mail.transip.nl (outbound1.mail.transip.nl [149.210.149.72])
 by mx.groups.io with SMTP id smtpd.web11.1599.1758927278283565758
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 15:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=E91365R1;
 spf=pass (domain: myspectrum.nl, ip: 149.210.149.72, mailfrom: jeroen@myspectrum.nl)
Received: from submission12.mail.transip.nl (unknown [10.103.8.163])
	by outbound1.mail.transip.nl (Postfix) with ESMTP id 4cYQrX08cGzRjQp;
	Sat, 27 Sep 2025 00:54:36 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission12.mail.transip.nl (Postfix) with ESMTPSA id 4cYQrW3CMJz2nC245;
	Sat, 27 Sep 2025 00:54:35 +0200 (CEST)
Received: from yellow.myspectrum.nl (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 3759C2001F;
	Fri, 26 Sep 2025 22:54:34 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Sat, 27 Sep 2025 00:54:33 +0200
From: "Jeroen Hofstee" <jeroen@myspectrum.nl>
To: openembedded-devel@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [meta-oe][scarthgap][PATCH] nodejs: ignore CVE-2024-3566
Date: Sat, 27 Sep 2025 00:54:15 +0200
Message-ID: <20250926225415.2736318-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission12.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1758927275; h=from:subject:to:cc:date:
 mime-version; bh=KlnSrK219vFE7QDQW9COObLHoegu43miuTH+V0vKH1Y=;
 b=E91365R19u4srCtxgiHUCelUJfWXYFpF+WFTtvJF5ZfZ/OcD2hIedQr2fz8CEvlTBYsQO0
 zxJVstcSWNsF2k/aVPe198uRjT6CSkX6I/Qm8I7jF/H4VaAHMYMUNrfv1Vz+mPlU8IGm1F
 SFO30ZjPaeFSB+G/eV08oT0VCYw5PEs1/u6LY7dLq4Ih1es6GclVcpQgm4qRV+oCL9tRUF
 0Xy0YBKEU7lREAGN6iUmHoNe6R3GcGXkZ/4IRLq3yGQ8jRW2eMP0cebvQE6G0wpo2q3l4Y
 Q8N0dMoAH8wA17E5ykQ0wGiNAtszN+63NhlLH6W2f+U1AhddQTvOcTLZz38n/A==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 19:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120002

From: Jeroen Hofstee <jhofstee@victronenergy.com>

CVE-2024-3566 only effects Microsoft Windows.
---
 meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_20.18.2.bb
index 8af90e782a..d757a7395c 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
@@ -41,6 +41,7 @@ SRC_URI[sha256sum] =3D "69bf81b70f3a95ae0763459f02860c2=
82d7e3a47567c8afaf126cc7781
 S =3D "${WORKDIR}/node-v${PV}"
=20
 CVE_PRODUCT +=3D "node.js"
+CVE_STATUS[CVE-2024-3566] =3D "not-applicable-platform: Issue only appli=
es on Windows"
=20
 # v8 errors out if you have set CCACHE
 CCACHE =3D ""
--=20
2.43.0


