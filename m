Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.28])
 by mx.groups.io with SMTP id smtpd.web11.3347.1590870239269972388
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 13:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=NNlFKW2n;
 spf=pass (domain: outlook.com, ip: 40.92.16.28, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwvlxmdE78QC3ueTDXZKYfWvj28o4CcWpXXa33ehuEvhJA+iPgJwimpKb8+nU4YfpOj4LeXyj0tC2rIbRN3X+X0DZDwHJSXo+7jcQnvTRy/7ERAZxaTf+iMOE3sX/LwUFXQE4xKjSE6EMZFZ/qgDMJGQj8iOUfomC50U3Kw+VV2l8/mVGLf0l/i77/L+PDSj0foTRYe56X0kPYihv6MW/gI2Lp56BsHTv1+Q9kqzOpjTg4ipPlxczxvHWZUSXCKieFt0bxO21tJr/AWoaxMOZfmxQpUQU957TI+rHYfxooAW7dtz7M7OxjiQJKXo/KhvuaCuzwFdRlrH5fgiXbmOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7pYGwitlRPf1tLkD/FfdNp2xyvo4O5Ft544Ocq+Q7w=;
 b=ix/ScpVnzJ6edl/0LOB1ZNmOqFHDvklCLUDrbzXL9rsacB7x5GCp0pN1CZ0KRh29n+mrUkZaPqUGTxKdmkkTlryKDy5kcNMmp9V2yrpxOxNUT37Isf/Bz0S7cVJnIWqxkqb1k4FDp5BaaHV63KmsUxOQpyYBv76EMeNdmsEHDG/ekWERPYZ9HgDr3W98lOcVBzyZ4ikwlcFCfHF10VR9+iNeEVHi/Rs2u0TQSAOt29dpkl2SrdTLLl+g9uJ4mFJD6c924C4azfoOR/F2wFAOeF4Jyq1D4ffS76bwmZg6hA+B6qVWfpV+H8c9fMwJLBamKPff8U51UalCjhEXxbNm2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7pYGwitlRPf1tLkD/FfdNp2xyvo4O5Ft544Ocq+Q7w=;
 b=NNlFKW2nCsKt4YbhCH1Qv4nVT80GHGy9dSOHve6zj2hcSghWkiO5zglxUDaN9mqYpCMDZWq3PuLZCCbwfULFOTzSF34sUKG1CaCc0lALUVE5i8usrybzGivQLZdRwcfpC1eTqa9CvBxclqzhVLL4c29Q/ioFfuqe5gRnGRtupjK0Cm2xwZZp87ekZQLi8wNyvYWXYi3Nm/RFX5Y7FXH6iKLd3HyTD27xEDvh7LPLhVn/0Kg4x9hfhENSWRbXrI1gPoszVae7eMP8pOPwSZ8oTUujFMHWKrcD1mOyBtL8iF5sCFzBInp9CCceTd5np4qrJjYdHv8+rGAm+gXaMSZPIg==
Received: from AM7EUR06FT008.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::41) by
 AM7EUR06HT157.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::142)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 20:23:57 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc36::4a) by AM7EUR06FT008.mail.protection.outlook.com
 (2a01:111:e400:fc36::498) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 20:23:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:DAA629835A4CF3BB6D6D1F00BDFC5A6C8FBD17CDAA7BC6C28ACAE59D30578F47;UpperCasedChecksum:5927E369031D7D1405BDC2544BA43722A44FDEE7B2498690D0822EF0C3211995;SizeAsReceived:7595;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.022; Sat, 30 May 2020
 20:23:57 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-python][PATCH 2/3] python3-smbus2: remove duplicate RDEPENDS settings
Date: Sat, 30 May 2020 22:23:40 +0200
Message-ID: <AM7PR05MB6881998E2C58F93732312904A88C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200530202341.11440-1-kweihmann@outlook.com>
References: <20200530202341.11440-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6PR10CA0001.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::14) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200530202341.11440-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.43.214) by AM6PR10CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Sat, 30 May 2020 20:23:56 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200530202341.11440-2-kweihmann@outlook.com>
X-TMN: [wdTvsSXV6z04jc3P5NMUo+pnAAUHCv2P]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 381da28b-9e7e-487d-443f-08d804d76132
X-MS-Exchange-SLBlob-MailProps: 
	S/btQ8cKWiSJyDCj7LTlCoWqgN/ZK/tjJj4huAvCnq78u4JAvZY5RrCIe4Vk4J/wpsvTfW1xeNHiz1SnA/KBfPboXohCY5K+HeLyULlsbhzmq0//zzfl2qBlvnfwvGqWFalL+b8fB4Z5MkCfAcKB4aL2eP8CaeDTbP/w029zf9HtiQiXsKV3CKvskQvrgct/Vwk1vRnMhYFEjjcpV8I04IdcLuFHHce5Xneoi36FesPXuDT0WqMym0WF11oU8dujVoUb4yr5thIiArnl6jjWVTYQjeK5tsFrGMLunKxeWCC+8uHEQTuwvYiOPtYf4fyXsDOXRln/H03oOEJe3uXtk86HeQFaGAbadoMbaz62RJMFey3adqlBIMMAfzNxikzJuopv59Fe9M7XT8bVE/qSDWsmToYVukySct/kU5xpmo/vBrAM/zVDPXGfWYnSetBgG8w8NRrwgnb9NA0eoU9iSwAqvBY1YxltNF9ELTMiAz2WYSmy2DbJN/vVavulvpsCHTU4bDIwj24HWOaUL6ISCnbs8reze8wEDf2EwhDaEAnTDE7ImeVPKmD/sc/KW+h4IIJPXf/1wy0oYCoIG5v5YAIiaEIRSpCxgjKsPAVpwsdgriYG8hNViRtZ8gaaic6sUenU8ET9YXml534gJk8oclhTCx1WrQVheIClXa4Wi30jLX1w88WVshzClSRKJcyvlfaWcypphkGzEO58LtUbqHZJcjwZ+zcZkCH9ooON0rOuIpkoKHrbRC0EsxqV0YlgLm3aFl7eR6I=
X-MS-TrafficTypeDiagnostic: AM7EUR06HT157:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r4iXvGsvR+KD3FgErFCsGNLya3k2dVjyGLZ3kLqIVdBU+XV/VeNIbkC49CwPlmB3nlyCB4xZ7RQXBwVeYU7x/K3qFaRn7ZF8dsuz+X2F5o8GHUglTRYWLw8l4psknDy51mxcZ5MAACBJYE6j432wsioWQ8k223eQHEOsh7DWg24Mam7MTTX878ctWVGqV4IIVIhvNA1M8Kh1Om2QhQPaLw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	+Ez1eoIxWwTCibRnGB6Ix0s1xr5Wud0m/arVeIibCyvqghkorVczJFFJfJs8A/BT5O71CeC5QItyv0pWCkYntxjhkDbCbvuleZsGWl0YOUyZArKjMSVCPKUsp9AqDFvRWXmCviAQcAegIwgBZ8vxPA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381da28b-9e7e-487d-443f-08d804d76132
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 20:23:57.0359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT157
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb b/=
meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
index dee70a03f..7a6192720 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
@@ -13,8 +13,6 @@ CLEANBROKEN =3D "1"
=20
 PYPI_PACKAGE =3D "smbus2"
=20
-RDEPENDS_${PN} =3D "${PYTHON_PN}-ctypes ${PYTHON_PN}-fcntl"
-
 RDEPENDS_${PN} +=3D "\
         ${PYTHON_PN}-ctypes \
         ${PYTHON_PN}-fcntl \
--=20
2.20.1

