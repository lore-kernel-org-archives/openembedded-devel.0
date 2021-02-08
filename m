Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.75])
 by mx.groups.io with SMTP id smtpd.web10.379.1612801896049401699
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Feb 2021 08:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lCtezCNW;
 spf=pass (domain: windriver.com, ip: 40.107.243.75, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqIxsOrJte+o6c9APoG/zVh3INatejjbT65gFEIZk1aqNVCdnGaLM+aHjpQs8hLK4Nqtf6wXO3fCISQvDegaYi+3C0ZLtuOWWpiMG/jmmk30Fy9OzX2P4xUKB4f0cz81X2FFstqiJZu4csBfDrCk+dc0HkyAYOaN0Bl3zjzde/unT9eRhQnE7FjHGaSXjNzWIcuMyy8EdB8esjCihM7ee8qS63my1Er2doT9Z9HEcivlo+zzeK1dPAgeqQetK9OS+PAEAm3FvpAWK+YCyvhEawK7+YNPju6141BaqQ2Fdx4PrzYrntwZX2CRFroxHKBMLqis2VEL4+5NZL0Ol3FHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Wk0EKKv6TBUsz7vNQALqwp5n6TNAFcFzYS1/N5fATI=;
 b=mq8m+3IgWWN/P/nrbrXNqNLKwgf9L+vhCrlDy2r0RB/nV4ut0xc/TQz+ULNH+vc8R0dsc45PFyXvHCqgOIL19ttqjH3+Tdclxa5dvftkk2uvjwtIPXGgi4IFIZfKr2vBiNGqZRjNTYQms5RlROSdbpH4FYjsctVf9uIn7MUVzPS0XpC+H/X94fG0lbB1kGfGuyojeBCTI8eNCK/VlkTFcvsjkFYJRfuREyVBa1LMvm+wh5XkI/S4YGO65E1p+I52p70hoCqHbT3oMEKXaRXKhGwqEO4Bq7LNY87UaLG0SiqF+Yz9I29Y2VooIRC6Z7UJD3mYEQIru3DudinCRIGptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Wk0EKKv6TBUsz7vNQALqwp5n6TNAFcFzYS1/N5fATI=;
 b=lCtezCNWbYVpsXXQd1UE2klAeWgn3XO1TTmTtM7xqJa8d8b41jLA6Q7t++l976K7peGzsMnh7Q8Tqojj+Yd7jrADUqidziELvTRpP/sA4ZNtXMi9+3Bj9Hwel9fwTDtNWMVPbHELnwfsSs//Bq4GfHchFVMuA2QYKd9K8+UlTO8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2687.namprd11.prod.outlook.com (2603:10b6:805:54::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 16:31:34 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%7]) with mapi id 15.20.3805.038; Mon, 8 Feb 2021
 16:31:34 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-OE][PATCH] libmcrypt: blacklist recipe due to inactive upstream
Date: Mon,  8 Feb 2021 11:31:20 -0500
Message-ID: <20210208163120.8609-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BL0PR02CA0111.namprd02.prod.outlook.com
 (2603:10b6:208:35::16) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by BL0PR02CA0111.namprd02.prod.outlook.com (2603:10b6:208:35::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Mon, 8 Feb 2021 16:31:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6108bed-8188-42c3-e421-08d8cc4eff58
X-MS-TrafficTypeDiagnostic: SN6PR11MB2687:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2687434D9A3517B2AB4A3EE8808F9@SN6PR11MB2687.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XTSp16UdgWdiI+z9WiDyddi792C8vT1y/Ly2fqo0mJM6QMog45+iujpAcLiPzT0xKeduN69gFILtFdikm8o1jW6cAhQUJLP8hSQzday9iQXdN5OCX/iaVcMuo7P6jLHZDOeWOngVcSx3Y+atkickLBhzHiZkTFm+KFzVMc5pka40il+3UoaIo3dDTRbrmrJesKtjjLTIarBBGXAtL9ftxn3qpgZTTDI+D73tUhHS7rki+QHFFK9Z30ZQc/VM1L99XnbIr26fXK8e9VpxG5EXqSwZGNsVGVAhjTC2hrzDrspCEiSbhCROUtCy18LbWYET3vr4U2OsezeVYdsR73hYehrbodCGFOx5gRLJmj9sEqZTBnQiZ19CDxgGkrAgDFNDEjPpROU54D1TeURj7C0V5AmhWHKy93iDrZsamkej2aTbEd8sCCv0t5V3kAIbS1Cu7N/iJcPJpPS8AXPTfg5+4c5GY2iJst0uxxJZMOm5VD2I2z/BVRyU5CPW6uKfu0/PnAal/1/qlTdtEFeYg9E6fZ8n3BZ/otZY/ZqnzyGjuk0l3p/nBnTzvz0iJVMv6iCDZP3B+HKNhxm0SvwrxkfEe3Wdum7XHZS26JfTczZdo/g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(8936002)(66556008)(52116002)(66476007)(6512007)(6666004)(66946007)(5660300002)(2616005)(83380400001)(1076003)(6486002)(16526019)(6506007)(26005)(186003)(316002)(2906002)(4744005)(956004)(478600001)(86362001)(6916009)(8676002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?tNH3voh86e2DNVnkozBKN6ckrsEM0RPROEXVJ0Uos8JMYNr7ttqJj0zK7gF/?=
 =?us-ascii?Q?8thZQkJUpwZvf+QmT/anj0Onx76hubqSnxcDtIcVLoqosC/V0g1hEiOkDHbc?=
 =?us-ascii?Q?0Zu0uq97wiDmqUpkpiMgaCoSngYTLnsTIHRBoYvOniZYhqzq7YADTBOLxQVa?=
 =?us-ascii?Q?XjOggl6ZS5pspKZ7AawebMFntRlK4U0eH//r1LFw91SIcOgIlyuUsAOeX5I7?=
 =?us-ascii?Q?FWMJ1+ijTy0RtBN4cNhysd+YepFbrsFo4ttQKdZxoHkNp0j7N76KcM4qvCVr?=
 =?us-ascii?Q?4jutNBlWqZOEjAzALjAZL0OWgQ7WrKWXvK3ty0b/HFGokqT7As7OThZ7/jyk?=
 =?us-ascii?Q?EQeITgRD4NIQ1jqmeGVy8hfgpokMV+MMiigtBzffpaVoJlnMF6AA4VVElPNI?=
 =?us-ascii?Q?v1ZMSPghE02Hr1VkzLqVD5i1LKQuAMHZfLpNQu7vqsA4se8iY1diOpJnUEgT?=
 =?us-ascii?Q?xosrPaVW27y+PnjQmUijsGC63fVozu4hyUFX5lt8ZqtrCFCf1wizfMxl2GVL?=
 =?us-ascii?Q?VnSu61UO68HXGDloEeZiOcPWhLyUKMAqBqhRk97ERnvCrvjBSrOSnedZK27U?=
 =?us-ascii?Q?oBlS1c/yPmYJ+bVi66d0+W/K49wNbLjkETA6M5EPNOsuZdkNZB1ktAtmYS2O?=
 =?us-ascii?Q?+ag9o4jNagmLmrMF2p3UgZxRBUL6ix450BYhc/3ucKeVqHFV1TuerP2PxXhl?=
 =?us-ascii?Q?gFQA0+yhyqnyx2o9gx15q2MDaeFVuBPBXliC1D8zK3B6ekfbHJpJYPMe0bKg?=
 =?us-ascii?Q?9/3pLaYcSDwSpHLar2DTLhFUvKwI5iQ/H00PVaG8z5yDyhLJISu/Btnoj9RN?=
 =?us-ascii?Q?/U6BtqBwDfGD0QFJYpQJjvj4OH+o2//fUAKvKZjvG2X9nCsrPQuFM2QLM2L6?=
 =?us-ascii?Q?F9tp4rQ1xPPx2bxohZyeJezK2kRcfq6gOsRuoBlGUwEWt4RJsDUuBuvUdWrM?=
 =?us-ascii?Q?eQXu9d0ZR+udooU+D72PF0Uh55qK1bIbcgNYhpI0SN/T0NnWaCZFTdusqDcX?=
 =?us-ascii?Q?vGEgjkahHDnnS511wUDkwh4rpXvdIdJFVc9aIYZPBwFgIi33SHlnU6YlF9LX?=
 =?us-ascii?Q?6PSBzzUfyKs75XkijgUbX8RF2zEFvNkL58VMw3aJgr/jV73vIMzBFmVR+ypB?=
 =?us-ascii?Q?HmVUhGibv8ILgMJnF4plgqTXtY2g4Xn+ldDylSX+EiRS2bUyLUAARXXiE0DE?=
 =?us-ascii?Q?njCWOiTR5Uzjc7kDA8zCu9e3zrsuqSHfvWxJTMfxUAWiVEyKKynE6G5bGx9R?=
 =?us-ascii?Q?F6X3LU/lSb8qJMjwYSfGimtsG0qboWq4TROmV9o/dICP8OnrUtD3v0WFiiJa?=
 =?us-ascii?Q?s+MoORbbzx6tiLDz2PXzWs/M?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6108bed-8188-42c3-e421-08d8cc4eff58
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 16:31:33.9871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72//ve9KVmaAQXDAWIZ7GTD5SSRnThmcpGzUd8hms1YHt4B73otq6R274swxl8sSdQIeO9SnYL08Uv52lZYeQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2687
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

as a reference, PHP has dropped libmcrypt around
2 years ago.

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/=
recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
index 46e694be4..a71bd6c2f 100644
--- a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
+++ b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
@@ -3,6 +3,7 @@ HOMEPAGE =3D "http://mcrypt.sourceforge.net/"
 LICENSE =3D "LGPLv2.1"
 LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3Dbbb461211a33b134d42ed5ee802=
b37ff"
 DEPENDS =3D "libtool"
+PNBLACKLIST[libmcrypt] ?=3D "abandonware, upstream was last updated in 200=
7"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/mcrypt/Libmcrypt/${PV}/libmcryp=
t-${PV}.tar.gz"
=20
--=20
2.29.2

