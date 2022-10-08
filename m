Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5146C433FE
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 07:05:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.1793.1665212734056657419
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 00:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=r7H1h5Tf;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7280b68d59=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 2986t8C8019812
	for <openembedded-devel@lists.openembedded.org>; Sat, 8 Oct 2022 07:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Z7eDim7K49JP7yG0x5x675OQm55aQo5smsLzGeKHes0=;
 b=r7H1h5Tf64V4wkxXgGZpOv5F/XVzC96ibtJTwcNYaK4ZfAU6HLmXi6Wh1DvoZ+WiziQ6
 l1Uy3+D3jWuzxBKSUiaPyS3nXerJp/h8f1c078UJzD0eKYZF34LjmjTS81qqVv1ceZbd
 b6JIRtcTsxIklCTDyARABAmtUOVEB6UWKRCja6/MBKnzEJ5ea8UORRvMFTdGFBCgdwCA
 jIAzpkBKbB5nqAIK5KZdjPYUKnwZKDtXB2+2N1drHKJE0nQ5/GKWefXBQhrkNs4K+tf9
 8A/bmOrbm82YMGvtwYpI1eq5uucCr2fd4mhQInO8Iy2ZoR2/nzTej3uslr40t+tYqiBU 7w==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k2ybs04yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 07:05:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlE7eowTVxvTJ3+y7BEZYOckrOkzkFdhRMeBaxhSTABDqBX8btAWEQFRwJ0kNDu0vijKJcLKVmJ2hOLykkAyqQy5TQOH0LsjI5UKyTXsdTgT3B65SrwdovkHGOHGknCgJ6jFjbDee0gzZcRLCBZZT132qA6lIINQzUMG02k5CXlqoor3v0lkcrAH2r9rzxbzQ4zheUsdxoLhGRdUbVlR+UeD3Tr3oDC+u/ZtNe++WZNLBsjYXERoO4RWU+16u0Fk19/Vyz5zQ2BA7ayUIEC8ji4aE+i6TSNHRHeSsijzowADGkpJm//CnPCw4on+cV2k8eUljmlMv3qj1W+bgUKToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7eDim7K49JP7yG0x5x675OQm55aQo5smsLzGeKHes0=;
 b=dH9e8HnGzQffT1N1hqVFBzNa0WLJi4ZpxaojplLBruJkJZ+BjUX/JmK/f0XcjC2nhERWhea4VhCAPu5+N7uAK5jcNBaEbzUk4hr+al2pTP4TEw8GZbhdZuzC6/ZKOicaZnjQE9WbiwvSCDX0m+RWl4DX+oAZRzmY3h/zjKJFDaZz5gieX2rNLtGUN4U8Z9w2ApQ2e6BOKSOjSargyAFw3ej/JrlUe5SNNDz9UTr4tSw4mQO7vjEfB8jyD1xfx49NE0JgprDBCZ7tKS5YFoQ217+wj8cZOnGZVxA5xtwEwe1EydTLVwpPuuka0XNdSoKB6kF+oIggEvSrrGTU8tKdVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Sat, 8 Oct
 2022 07:05:29 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8957:e965:a52:2366]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8957:e965:a52:2366%3]) with mapi id 15.20.5676.032; Sat, 8 Oct 2022
 07:05:29 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] strongswan: upgrade 5.9.7 -> 5.9.8
Date: Sat,  8 Oct 2022 15:05:17 +0800
Message-Id: <20221008070517.2743134-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA1PR11MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: b22ecf7d-78ac-4325-a00c-08daa8fb7bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hFVKeJUM2mMKmOmYInvSMa6K4bgK/0/KyihSRN63mrlArHqelUBwyhNQ3TgQ9rt30Qc5axOeJHf8f/kjzmA0+UD8Ct+5dzJp/ag2xJ6JWIBGuqV8Xgl9LNSxh3rlAJ9D/1IMLwyNqAN+jluewzIbYbS8mHNQ7DgS/Qyk0b1K0rpRWKO+8vKLTq7WWv8dOkj5Cv2iiRQloqyhYCRPetwNExXatrMEnGIuFucKjGsf5hbWi/qCtYEGM3ZaCGWaCO0VuJ6HWoJbB7ilacsTymEsYDcseYgI4gRr3OWiK2MwhRpH4dm8Xuu/PvvBOz2fMYodxktbRRMB3XSFGzPqG/EFNyxK7VGFCouGq0u4xlfafIhrY/5DUjFmIO7Q5lNS7FR9zBeR2EQcPIeVD9NdrTmHujaQh4VLgmVOdnDMxleBkDP/ityhznkV1gORlpIMwRs2MsdlpQJT2Ld+UmgM4M6MuPTqMkY7zgrRD4v+vbk0Ux8SK965UXSdlAXwkoYalOMEuAMRySY+aqHfY/sIi4UYp8l6xsutT+09BazDN638r59mBd1B5envguQtZMEcgBAIPZ9guo+JahAX/omCNF6clTHyuOT9ymBCTLn8QhvBuhFEBN9rFIvscoRvmXidR8I8qsdkiToLn/ZZD4KEOuupHKvQKLd6/iTSIdu233nELRyvuBj6pSboA9Ew8ZIZ/t83D6AxAoTZO02EaGL3So4Pph8pW2mR3nvKMRgmB0Z68M81TPnniUeEEwgEEDU6FovctkTMrGLmMekq0QBQgMkgYNaJm75dTG+qqgd/ynVKix4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(346002)(366004)(376002)(396003)(451199015)(2616005)(38350700002)(66476007)(8676002)(38100700002)(66556008)(52116002)(186003)(6506007)(6916009)(316002)(966005)(6512007)(6666004)(26005)(8936002)(6486002)(86362001)(83380400001)(36756003)(478600001)(5660300002)(1076003)(66946007)(41300700001)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OlAJSxOjKCR6KSh1L192SKazLHGPeJXBk5ZCZ1RLH/fPK0TfcXpcnCU+XlAx?=
 =?us-ascii?Q?QRxs9565XvLUetiYBQFBwZz9mwgA0gxq5YA7zemSnq47pPCo/G49SFuENnvk?=
 =?us-ascii?Q?4KExE4R2RdGFejlyrM1mz1E4ILQWtYQNam+E/lNPCyOPSL++ilUY4MPdv9Ki?=
 =?us-ascii?Q?Zu9B6SfTye1T9v5RAtfCOHwj9Z5yPnbcSxgjakpFWK9zaR8X+XKfVyQwbTtn?=
 =?us-ascii?Q?Lv95lreoSPrMEbkK+kZD8cPk9a8BjMXEcBCB1wvXbURCz1K32skEhFcFabCn?=
 =?us-ascii?Q?Lchkz/hM3axpxOYaBhzHG7s9wSPLrecKuri4MToTkUDaY+IypW9XTuUqSRuA?=
 =?us-ascii?Q?mw/meZFToT75No8Ps9ZqMFwxkJEVkfNbB6sxYAnMTstk0Xj/l/HG7DyjsZ6d?=
 =?us-ascii?Q?3eOYXqC7XGMPJRo9FlI77zC8oUi2n1/icKysHyBZ9MwB1q4FLEl1i1QX97CJ?=
 =?us-ascii?Q?yaHpvYC3gG2Oxx6pp92TtJrn77MuIdXSSTmJkhoC2HePqCyJ/xkw4l6v4n5Y?=
 =?us-ascii?Q?7vrwlVOXkQQL6JcxO9XjDPDXhliFm6Kfz0VVxRYa0Rg5VLpZQq4C/wYGzqyL?=
 =?us-ascii?Q?nsP4bK00OrnEOPQRCS0ndhZ60GiV/hMKTZhM2jpA7TrBeOvA9TjX534clBdx?=
 =?us-ascii?Q?UZoJyxqt9nO9olpRp2ra6qvP2P1ssszvyjCr5cfdxrwJ2nxCc0lyp7xd5DSc?=
 =?us-ascii?Q?Z9Y64idhewSqE2s40Pp8FaJv5A9/Ki58is9FeYKjPR+xFi302WNp3AKhi9UB?=
 =?us-ascii?Q?IK108Ruuk29dYrBQE4NV3f3kPy7kJdHpqgfghHm/Fk+j317SJmRP4RK2XT9V?=
 =?us-ascii?Q?+o6KKWPhXOZTFJeqekb757xhaISW1xLVk0iYA8Nvoafu0up8wif6SaZDoF42?=
 =?us-ascii?Q?5BvKm+6e986JkcMIaZpOJAlnp8zME8HudOs4LhUH/RXQHffjuS0V3YUpZlc5?=
 =?us-ascii?Q?qXtq/lHzbAC9BWePlyvJwPa2p/z3CmouBOkWYg5vEIQlShU4PCvqma12Qmto?=
 =?us-ascii?Q?nSQam7MaBbLvS7au/WmMCjy5A1vNtyj1XY4jhXNGZx2w4cvXeQ7IMmmXtZ3H?=
 =?us-ascii?Q?qQeL5M2AG68a+4P20yTrt4GSdbtdxaKXxBTisn2LXU1KyOC1kXSEeJYt1s4L?=
 =?us-ascii?Q?sndmFB3T/0pnu4dA15rr/Ll4kJ45vOrS5mRNiWz62LFA4ZJpWBIOZdPfhqJ6?=
 =?us-ascii?Q?W2GUh6C2hyD58sJAzJdnFGagXsRSWWqjayUAJNNbFzBAIM/tFTe7Lkp/vJtT?=
 =?us-ascii?Q?O/TC2oXbTetSTSt505gW1d8jSTwsZgRte2I4K65C9XWOpBApZ9wlq9APxQaf?=
 =?us-ascii?Q?UoOwSosYqefMoHyu2qbWx0QP8VxaH3Mfgo24eE9MM3b4YR92jioPA36WexNW?=
 =?us-ascii?Q?I38jKvjGE07654QJ7HdT/pZR4gpCJJ2/2VPbXT6R0CjwPDzgSTYWg6zGFO77?=
 =?us-ascii?Q?1NMQxw9lOPsfdfnxpgycwufQPbktuL+WuOIKRfmXw57PukqVe0VKQYWn/2W2?=
 =?us-ascii?Q?OXMrZZexnOtEjjfa79yPhAv3/Bmhfg+TmdQfOa2yO+D0vytc+8ow9tw69qIE?=
 =?us-ascii?Q?qdLMxbHPjLnABM+tXXDS+7moTh5LKS8LdSGBa71H?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b22ecf7d-78ac-4325-a00c-08daa8fb7bb4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2022 07:05:29.3616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QigLw9q+ykP3BPCzxHbF2hON4YKkmUXcw0YB2fDPrE5YB2T353Pm8Cj/rlmaeRXhIXJhvsEyWkMSZEejM8fy2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
X-Proofpoint-ORIG-GUID: WbmA6cEjR0eUtn5I31v6-BjscO30Q9Bu
X-Proofpoint-GUID: WbmA6cEjR0eUtn5I31v6-BjscO30Q9Bu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210080042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Oct 2022 07:05:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99091

ChangeLog:
https://github.com/strongswan/strongswan/releases/tag/5.9.8

* Drop PACKAGECONFIG[scep] as scepclient has been removed.
* Add plugin-gcm to RDEPENDS as gcm plugin has been added to the default
  plugins.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../strongswan/{strongswan_5.9.7.bb => strongswan_5.9.8.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.7.bb => strongswan_5.9.8.bb} (98%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.8.bb
similarity index 98%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.8.bb
index 71ffb7ba4..266d43aa6 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.8.bb
@@ -11,7 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            "
 
-SRC_URI[sha256sum] = "9e64a2ba62efeac81abff1d962522404ebc6ed6c0d352a23ab7c0b2c639e3fcf"
+SRC_URI[sha256sum] = "d3303a43c0bd7b75a12b64855e8edcb53696f06190364f26d1533bde1f2e453c"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -39,7 +39,6 @@ PACKAGECONFIG[gmp] = "--enable-gmp,--disable-gmp,gmp,${PN}-plugin-gmp"
 PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,${PN}-plugin-ldap"
 PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,${PN}-plugin-mysql"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl,${PN}-plugin-openssl"
-PACKAGECONFIG[scep] = "--enable-scepclient,--disable-scepclient,"
 PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,${PN}-plugin-soup"
 PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,${PN}-plugin-sqlite"
 PACKAGECONFIG[stroke] = "--enable-stroke,--disable-stroke,,${PN}-plugin-stroke"
@@ -148,6 +147,7 @@ RDEPENDS:${PN} += "\
     ${PN}-plugin-dnskey \
     ${PN}-plugin-drbg \
     ${PN}-plugin-fips-prf \
+    ${PN}-plugin-gcm \
     ${PN}-plugin-hmac \
     ${PN}-plugin-kdf \
     ${PN}-plugin-kernel-netlink \
-- 
2.25.1


