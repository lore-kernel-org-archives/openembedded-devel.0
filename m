Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.61])
 by mx.groups.io with SMTP id smtpd.web11.42785.1593975467656658261
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jul 2020 11:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=RNwlgn96;
 spf=pass (domain: outlook.com, ip: 40.92.73.61, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hy/j+wHKoiRpPfKTT1N+oOyq6A2+qsTpKLjfmBqUJ/AvrgdIZvJ3Qd8r74t1xZ6kFkPK4nWsDv16NDj4IfSB/r6emP4Rul2ZQ0L/c6jEygnt1foW2r2hyhxr/0lbDa9ycOFbQ4URZle87UBI6XI6vlddSIECD4+x++QQhxCBu7tV0bcS+Dj1sRsushJ4E1UX7ISoeubE45LltnG/TI1PZExl3PO9bgUNYecf6Q+nebQM41hDDmEkB0G5Uye57U4JiuqovoYK+5o8ydave25qgMf4vlyNkYFZLLYwn8JE9+oqx4UyiWinc+TDuLrTA9Ai6510uqjuYnILkR5VIU6cfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DUjxk0gzTSpXIoxWWw2lxtuaMH9u5umStYBx3nYDls=;
 b=UHhduuBCC7lQb8jifY2e0dcUlOS9Erl+FHjO147tliwX16DetUfH1p8Xq/ZqTSVg8q3+8lQpUSVA4vgNFmMRBHX0d+hyPWhTrIJ9ePK2bbXVukp5vU6UeGkuLSxaX5mNa6uLSZnvT9TKmFJiXMJnwVTIKvqyNpc+XJ+TZPeiFL7w96ODIj6wbqu4drP3DIIixkeaNI5oc9G4GQaUX4ajRF9CpVju86jSm5NjorPLi04jemnXlSjBMdUHXXrXAIyAH0H1HsAShlMdz/frK6rh3oC7k9DhHBvCG4bAdrDEh3eIr4dmiCAz3U8mxqUBHBvLBBKPXuNJLVmNbKlkarF67g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DUjxk0gzTSpXIoxWWw2lxtuaMH9u5umStYBx3nYDls=;
 b=RNwlgn965TyqW8OAfqJY00iB4QJ+3BTTCEy0pmmH0u4NtTmOiDWU6rLhkxuSzwbwJiey/h3nDRsD9hj9zfkEKKhoPiy840k2XsUKI+zM0m3Dvndcg4/MMwwJSiS+fXixBRtInOPzC0F5525toCQgPgL5FvOY1URHJ0gF+STbxdcTMDnLc2BIQWtz8Ik9N0QGcKRPLGh1Fd/uZx5M7HS3RMcXoVqapsYRDdz9xeyIX2pcTd1GDVHpYjaHwccV8d2e872B0Kqzc6QyxLBfUgYeGQ6OC8iHfbAb1a1lCiKFYkPKlxvsRngoTfyTGPYXT2mmdzXKRIlrgkalgv/kRq6NOA==
Received: from VI1EUR04FT026.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::41) by
 VI1EUR04HT212.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::248)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Sun, 5 Jul
 2020 18:57:45 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::4d) by VI1EUR04FT026.mail.protection.outlook.com
 (2a01:111:e400:7e0e::127) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24 via Frontend
 Transport; Sun, 5 Jul 2020 18:57:45 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:C7A7D0348D24E020E5E98617B789C1D1B5ECA8E736C2938C18206E55CBB10627;UpperCasedChecksum:513A860C37D3E8CD2FA022512CD66B806BDB30E6E15A6B2DC091C78A806BD62B;SizeAsReceived:7516;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%6]) with mapi id 15.20.3153.029; Sun, 5 Jul 2020
 18:57:45 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 3/4] gattlib: remove includedir from base package
Date: Sun,  5 Jul 2020 20:57:33 +0200
Message-ID: <AM7PR05MB68819D832CCAB6D72BD0E703A8680@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200705185734.839-1-kweihmann@outlook.com>
References: <20200705185734.839-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6P192CA0036.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::49) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200705185734.839-3-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.14.174) by AM6P192CA0036.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Sun, 5 Jul 2020 18:57:45 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200705185734.839-3-kweihmann@outlook.com>
X-TMN: [UuM8uC9CgR/XEDyDT9L6JzIerAkq399b]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 951d3689-d6e3-4f40-c586-08d821154d87
X-MS-Exchange-SLBlob-MailProps: 
	gjx25WM8ZNWYYQKGD5AJJJLc7lLoL36I4iyGguphCvFqagGLVK2xe6jb/eF055AybbbgeRirkYB3PExM4K6oDbj3dN7vEegh7pwlagdrL6IcaYUrdaFkWKEnFAUhSOH8r2vtaoSKQA00Wl12o38luAgyYwSloHrTuW0dsyVMNgUbFDJYnwctzXaqIIO3VALDI0SagXzm9f4K1L6FrxetQ4eFBCFxP3Tl3OUavZJCK9ZFgiDnQg3whDEyS4GTJFzwta7cEh3NKkMW0MJTpnXM2Mwn2vV4weXOekyrg8TRdLA9CUTabvfVvzw10nPxVra50WmRENTLjb4TiW+8+gDJNt87tXnfkraoSP3DBm+gKqn0LGsKYuUS1FSceNz6mJeR27yC2DiHMIN6ANZ/eNTRCreE5KLxL+AenXRCv245dEXS6Cw2tZrTXcPRK/+EstlTBUQj2UyK0mzoxY66J68hooGL+TjzUcTJXMg8eyKlWF/8DYtUSsaKYxajwMN00hwlVxC0bnC4j7nIyNZsjCHom6COVGssJb/B2cIGSj8/KnXVTkqaPMG3FiycNsF4xdXBHhFnkWa2dh1M8+K33nOnAB69kkDqZBUsgS3DpQAveNEWp4WwjIEFncUBvqY1IbyxudagiNrtXRf8VvWGw903BZ/e76AhGappmAQoLdObbP6qZfEXEXTUXr/fJvcdwF8+xVCdWYsKgNds5mqkt51VWxB9D0WNv6tpO1gv1ZngGzQ=
X-MS-TrafficTypeDiagnostic: VI1EUR04HT212:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Etb65qLApy81SAhh0zf3z26n9YbBGdFPqt6r+U8zuExCmWgBnljNdXVVXu9fSeFzWejDWyc8RaOtXQLJAv5vlkcqrhrgNdK06qrc5AmwRFAbSFFSWNc0C6MQD+OEW08bQyWHTCOVBvJlPBAx5TgCiN8gHU5ZavEuptLH/vw0PDMunWgdLDqPpIk5gihC/qbyacAmZt6Q8Y5lmBcYrDGwbw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	SBDApOVdbZp6y3wPez66dCj9CKNTiRxVSyeeaOG+82P7khc+qALbwybg7rugYoYT0powDkx8YIzI/U/Y5+lGz0j2YhcrUpMnKwnPc/Z1N3o/GX88JA5S0JUz3Ul3Ue/UgDybQSrX5/tE3Gn381P4/g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951d3689-d6e3-4f40-c586-08d821154d87
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2020 18:57:45.3888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR04FT026.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT212
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

as it's already packaged to ${PN}-dev, so the setting was
without any effect anyway

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/=
recipes-connectivity/gattlib/gattlib_git.bb
index 6b4decce5..d79dbed87 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -28,5 +28,5 @@ EXTRA_OECMAKE +=3D "-DGATTLIB_BUILD_DOCS=3DOFF"
=20
 inherit pkgconfig cmake
=20
-FILES_${PN} =3D "${libdir}/* ${includedir}/*"
+FILES_${PN} =3D "${libdir}/*"
 FILES_${PN}-dev =3D "${includedir}/*"
--=20
2.20.1

