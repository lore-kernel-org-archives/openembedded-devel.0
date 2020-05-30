Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.27])
 by mx.groups.io with SMTP id smtpd.web11.3140.1590869553636260149
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 13:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=XI72Ghnv;
 spf=pass (domain: outlook.com, ip: 40.92.75.27, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGtRpcEGP0jsBFHmEPAWJenCjpplaHWuwsih3elhQ+iYwfBGdMdsSatAs0eqq49EA4N3oLNnr00LcpWynF5KnbkriQFr2WcrCf32md3VwgakIEJHXTQ5iyki058PxhrqXqD3hqvNgcHjpUGMyg5OHwVCmu0rj3jaTHD5CBAY2jK/uXAJ++lSTB9nEFRedbV7uGW10cBYsNDoLVNgM8SOz77JnN5Fy+aBnBoiveQJcIBd2/4NOQYBvUzL4xC/2VltZ1QXK6H2Kw7lRYsaphY1CFECX4dCkaioL/8APNgCle4Ne+YoTGeUTpfGKoqjoD5CxlrYKL7DS37f3emgy2f9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTHYEEYKuAI3Oztc6jpDgQcSHnZpx2Z0VDHjD9rxWNA=;
 b=nwVbXY6vGmK+zLiid5pNfDNTkvcrZC9iWQTprwZs8iStlChDBvfsuViltBTe74gfOiH5pJgO2mRmvbE5Ssd3z0WQbbDJIpbfVupWkuQw7BG9HF/7OiF4Yba/265PTxxokGS7KvgPSTbxb5k+Yce/8atnp4Yo4MLr3m0RBqI6EzhT/0QrfM8j7cm552CZOQ40yoN8uCdABYl8ZAmv6lYnXl7z3cDTY8ugzT/rnTC3sV+is/gU4zWTsdGgo/kmj+irQZym0vdkGc3S4ltBpUXpxaO3kpvXa6qD+ZIr5vYAWitTdjc/GRYx1zKdBrV9vq9dlR7sBoJpq+7Vhe5Om90Ddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTHYEEYKuAI3Oztc6jpDgQcSHnZpx2Z0VDHjD9rxWNA=;
 b=XI72GhnvkAMPhV7nrwlQKSERjfUt26k3RLw31upHH8aNnd9ygQ/HnoPf71MG092X9G7j+yzS+6eRTILp0kez4OecK0TD4QjJDbsXcsTJbZ8kHDtvruICRKtnpwhi5oCJRfxhuTLf+99wq7BIOL1cdIJIWsVg8uGZd3p8j//BmrnZ5zFK8Hiug39R6XP3FJ936ZUN3WFA8h4cGLJjgN72R6Hb5ZpzIOcfAB9FM66n/Lk6zveVFnptZLJZcb8INTIikc/DAfwcgpkidjYNjda7hIDTFuOUzypqJd6AQpPYhrwgFt6wz6aj9SBxC0DfzgIJVOvSeHf0y0PNIQuuvO95Hg==
Received: from VI1EUR04FT021.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::48) by
 VI1EUR04HT027.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::76)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 20:12:31 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::40) by VI1EUR04FT021.mail.protection.outlook.com
 (2a01:111:e400:7e0e::319) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 20:12:31 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:2B348A6B67007741C8B533D11D20E1F1DF4B07FE15B8DA0790FCCA16FFB3CF1A;UpperCasedChecksum:B52629916F54E78DB3E6C5F8718BD6D99EA3BAFE850E9537BAE849014478C1D2;SizeAsReceived:7579;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.022; Sat, 30 May 2020
 20:12:31 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 3/7] brotli: fix typo for DESCRIPTION
Date: Sat, 30 May 2020 22:11:21 +0200
Message-ID: <AM7PR05MB6881639BE44B929B97180B1DA88C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200530201125.9938-1-kweihmann@outlook.com>
References: <20200530201125.9938-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM5PR0402CA0005.eurprd04.prod.outlook.com
 (2603:10a6:203:90::15) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200530201125.9938-3-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.43.214) by AM5PR0402CA0005.eurprd04.prod.outlook.com (2603:10a6:203:90::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Sat, 30 May 2020 20:12:30 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200530201125.9938-3-kweihmann@outlook.com>
X-TMN: [z0jXeqBZeE7iF76RJpVP/El0f3gUNnEo]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 15b29d79-0399-465a-172d-08d804d5c875
X-MS-Exchange-SLBlob-MailProps: 
	gjx25WM8ZNWDLNYE12708/BbGTepinvyXmVlVX5tbx+h5btNgWQi0AvQ5CAnJ7DH4M74YPpeeNtDQvcZXwyx8djVsvjXKAdWHOBXSxpUqO4CfLbfEH8JxBVjuLdRoTVQqNdbJ+D3j03Hlx2BkcYLFzz8A479u+2yvegDaIuk51qpIEkq83em6thI9ft+pFWL1aI6+n+8pk999pG1RZ+mUKHOLs0ba6TSGNavP/lzBr96Pl4pE7PYNa90FJTLfcBg5DqyDMAP7PrL1CTDFBA3l5KYc5IHQKQ4QUxxw5ERuaZcSJ7bEVcHZsfekfF/iZqFMwGr9MSzcMfb4dEJB9c5hnGG20fziXoySABmvTt2LFJ7AIaDQ963FbZlH9rztlTSQ4QsCxgkgVEuMAIQzYCH/Jl2zuhjlFqhjoXzPx4NLmhhZ5iHT2w6l3zT3E7S+vr9hM+fXE830AOAAiP4cheCKzFwMMPqXDWfyrukyR9uhNyaMSk8SshtlibGOXoZHR6E4oYZNNIW1nK2vMex0RnfFwxjLkAmT+q/Nw19hZP8PZ/VH2gV2A82G0gX+Vp4UVXPek8D2N7eEvmYw/FEpgeUh6bYRSCV41b+B3PUgHOOfuMC3nhpqsNDxs25ygeo0OWjFEG4Gxze65lgrKTt76+WVWYkQjpA26x+c+C9T5JDdYLe91+/Y4Ka+y8uTN1uJvYO5+sATY5UzTOCJojoSnCiE/lb6aJ2S4Yes2PuADaI/kY=
X-MS-TrafficTypeDiagnostic: VI1EUR04HT027:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LrqJv/4ZKWsll7Rf2hHyQWVawHfunKbVzRVo395e3sanIJXoi7VpdLdecGnY5ExTf1gQ6LUiyvMZHaGqJ4PwKZzXNTNhzliOHpt0zd4J93vWmpheE9sdx99HemP3XJMmswxxRNULxQH/a5gE7WVP/wus5ZlXREDbMPgVoS3cerSLGE1qJqZlv/68TF5oOKwtBiflsLrErdGkkK0da97+2GCNn2790JtIwSxgVFh6lgynvl0LEZJOfZMNW8Zw2ZpU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	RdgA+ilGcKRX0vkewVBec38SD39GAiSadiZ04U5EeBo7HChpfa57PewVXByp17/Q5V0NpXDV1dm1sdezw8zfU5Vi0V6FfgRO3DVkvDzKkRzCW2qaY8uV/ndtr23d1lBOdraabUvzpHrFfFH93IIrqg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b29d79-0399-465a-172d-08d804d5c875
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 20:12:31.2817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT027
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-extended/brotli/brotli_1.0.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb b/meta-oe/reci=
pes-extended/brotli/brotli_1.0.7.bb
index 70dbcaffb..32f855844 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Lossless compression library and tool"
-DESCRIPTIOM =3D "Brotli is a generic-purpose lossless compression algorith=
m \
+DESCRIPTION =3D "Brotli is a generic-purpose lossless compression algorith=
m \
 that it is similar in speed to deflate but offers more dense compression."
 HOMEPAGE =3D "https://github.com/google/brotli"
 BUGTRACKER =3D "https://github.com/google/brotli/issues"
--=20
2.20.1

