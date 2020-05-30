Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.30])
 by mx.groups.io with SMTP id smtpd.web11.3348.1590870240819016922
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 13:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=OQgVXRM8;
 spf=pass (domain: outlook.com, ip: 40.92.16.30, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OB+9gfxOqCrjJTV5ey9Wmg8gZ4KNthENEQnWaN4waMDovO6PraDZPUC+abOrYcensyTnZTl7jb+yaD2BFAxml3u0owaZl4iFSDJiGFjg5OVDfVKGMmw0N7ZoSY5ND4oAIEcyQIpJUuq6lmB+rOZ4L6CTYaT5szqFzQ/J03NsH43XgVpRSfZxsurXgYlnLZSdTXcyS3zXSZvIU1ovXWjXNdglZ4g2KXGGGU/yo7o11rdGNZkMjZtaEBdhruNwu6/FmmnYVPy1ge43+4NPicph82J2m0kLpct/tOVr7jf7oCHDI4eS8kKaDVUcZs6VTAuVsOC8/fZuSDy4sopDfyYqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itVOYsmbDKstSzhjlRNjuS4b6wqKTXmiB+IWK70PHdo=;
 b=Cyo2ZUSjaove9WE4aQ/89siMaWYDmavP3D99GB+dyeYrsbKSn+dcP8jKt5kuM5pf7fcKGwBCetNz6q2x/vbHCyHSn1IXupuAn+yXYKFQ3JQKU5KOxT7BpIXQ1B32LWe3vtVZdt2QI7qsxotQ+CESfRfeVr8HZLWXyfbxa2uUPaY1eKJGHzlvt08dAns4dIVw2ipsfNYzUxkTPNqh7NpEB2EN0OSdpj2ZPvE9UszfAeNgyUWXlgvFG94yHJbo4caAEYQ1gqokesbuELnsky41t7Vhl6mGNVfQ+rYSNZmxJNw9/uHvhVqqE60ktLL2BjDmkzv0T28gu8/4hGdepdEbIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itVOYsmbDKstSzhjlRNjuS4b6wqKTXmiB+IWK70PHdo=;
 b=OQgVXRM81/40KCXCu50U0LDD/ABXMO/6CyMkfVYUFOD0ob6f20kaqJjUWDE72FmSTQUxt5OafRqSgqdgrEITCcrqA7TV8CpYXqC+WdYkvplJb1YfhngTWPTeacZM31GUrP+Uw+I3ms6OlpzLDPM+GArKji3nbdqHecLvpz6VBz8i+DacT2HdrkgLoak9krlgkO1s/53w6v1uRdrxByDd5bF47IOQ0ztbkRQ4D+NPjBu9bU2V1KnkkHq+9GxsbKhq73QNa5wozEdaK+VAHre56XDcsG5Gk+EbkXGj5DKYpPpww2LbLZWtBnptq3rI8PpqrsNbTEbpFpUJxxTmDafwow==
Received: from AM7EUR06FT008.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::52) by
 AM7EUR06HT097.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::484)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 20:23:59 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc36::4a) by AM7EUR06FT008.mail.protection.outlook.com
 (2a01:111:e400:fc36::498) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 20:23:59 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D1AD626BCED6C5D8B138CD93EA2AD15A7AB0522445A71D7DD47E9B2302703D1A;UpperCasedChecksum:F961CB6D4256E76C1E65F0A70CA361EC33FB35FF09B78780B93E03705AF4E9DB;SizeAsReceived:7611;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.022; Sat, 30 May 2020
 20:23:59 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-python][PATCH 3/3] python3-twisted: remove double var modification
Date: Sat, 30 May 2020 22:23:41 +0200
Message-ID: <AM7PR05MB68813D7BDF2EED43F8FDC167A88C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200530202341.11440-1-kweihmann@outlook.com>
References: <20200530202341.11440-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6PR10CA0001.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::14) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200530202341.11440-3-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.43.214) by AM6PR10CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Sat, 30 May 2020 20:23:58 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200530202341.11440-3-kweihmann@outlook.com>
X-TMN: [PP1JZ5M7cOE7Ksl5T6Z89oxazUyKtNLZ]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f46b1ca4-a2ed-4f3a-9afa-08d804d76271
X-MS-Exchange-SLBlob-MailProps: 
	S/btQ8cKWiSJyDCj7LTlCoWqgN/ZK/tjzHAj9pCGcHGv4YDpml78ICn/w/pWv7tx4TeW5iRtJCHVPCBkWIs5Vij1SiTWyvxsLjPSZjgABOPG/qQIyh0Abocrfap4Al4GROv+qKhiPu7AMjDwSSlX8RKm5vAeANKIGF+MBaHpDIwrLOHg4z0fAcxRz28gCFW3e7F7oZC75V/whZg4+FIsfeqTbIib2Hfd0zs3uYNtm95WMTcW+BVEHQuSzx2toIjWm0VtqnkcPO6OhXXXBUr5X37vwYV0sfTu9jxDXLwh4W84yXxdXHJdoPclEKvrMpEp4BIBvkJa6r1YlfSe5wYsC4kNd3PpLpvaVKO9dQw1VCBH0fxmqOQe/JZ5/ytvKSr9WDKqhDLV6vlKOyDYZRlCHUAAp2bv1lB4tT/5DnwAICk5pdy2rbC90rcqnd8613EVPsUijVLakfB1HQrES+K4cPnt96+2FgT+k2pL3gaMwqdGUzmeJHoMyBKHLbQusqiKLNr4hjc9e0l9TDQuynlmbFoHVPsuga5X5LZ8PXA1iE994K694St0cfioZq31MIXHFs2xW26sjgyDugvHuoA0lFRxLyLO0+amYQYOp8K1CfE3SZaFyoHjIefAPP6xjbDGsA7c0q57nzMgavDO4SCSyr6F6rsE8Fs6zqTgZpHDb6MROTpvAt5JeQKuE3syIBqJPkZxWUrHC6Bm60z0v0kW7WJ3TwIygI3dckviTFmZSL0i7ia5D0Pm4t58aoxmXXi0SdPFBrxQfAg=
X-MS-TrafficTypeDiagnostic: AM7EUR06HT097:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HwD/zE4+Skn7oT8mJXHIQgD5ms7AJcaD/JaP4S1J5Yhxm40doo0IH1Gy9dNKxUkjL6fvyX91kCeRzOhEVU9tvfMMrbCjZeXcUdPkSeoPF/y+fjeXQXNgFj2nF97xNDGnwk1YIv0UO6jOs/kz4JYdiCx7ppXdFGgr6AooP5JGZgENk/IKg08NaEY4+PewQyWlY25mSsTfUFGXADz96MdL8A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	egSU1ulVTWGm84lEIW9Utt/Wz2yzfOPwswxSq4OPfhmgy6rRiGoKJzzSmJrKmGm9fJ+p03brwre4Wk8nT+pniyWH0VF8Vfd+IHe/igFHQR0OHEh0TpqCwnLTxFEkvaM1Cr4Q0GQoI5cKOF00gi3nzw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f46b1ca4-a2ed-4f3a-9afa-08d804d76271
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 20:23:59.1008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT097
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

It is either append or +=3D, but not both.
Pick append to be the correct one

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 .../recipes-devtools/python/python3-twisted_19.10.0.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb=
 b/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
index dfb9d4a4c..c12d1cc04 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
@@ -1,7 +1,7 @@
 inherit pypi setuptools3
 require python-twisted.inc
=20
-FILES_${PN}-core_append +=3D " \
+FILES_${PN}-core_append =3D " \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__pycache__/*pyc \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/__init=
__*.pyc \
@@ -29,7 +29,7 @@ FILES_${PN}-news_append =3D " \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twiste=
d_news*.pyc \
 "
=20
-FILES_${PN}-protocols_append +=3D " \
+FILES_${PN}-protocols_append =3D " \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/__pycache__/*pyc=
 \
 "
=20
--=20
2.20.1

