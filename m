Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C282C43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 15:59:30 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web11.837.1657295961230881978
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 08:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=2ToUcqAT;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=418831a77b=alex.stewart@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2688nmCB023739
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 8 Jul 2022 10:59:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=6a2zS7aiqvXQWpxT7/3d5zmeTHmkyAPGZnC3ybGIUNY=;
 b=2ToUcqATWVsYu1nlJI7176VQ5uEEiBfeKahoW8vEGi/TBK189+p7oW8lUzIhHrWKL+Vi
 4HlnASplv8rNFMgVDvBxxpSq9PqirpFd3bsFJkZ/ijL8qaIu/FkYU4rjSxM/zB0tU2Io
 /LYOuaDq/e3/w7Z0lbzIODbfLhhjWfT8y51EcjFJ5jn6ViaO06Z/ihk8nVBGsNtZJ/Ds
 WZkz76W47F+tljaBZeJ2vdedf86cTZmtqc/d6v3VBf0aqORxDP6m6NCFUkIbBG2ddA2u
 ZIqG559TlrVHO51wNnu+KUP/MIVU2MZf5Fw5avaCGon9PDBfMmctpc9JTxYQsM6VTtfj vw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3h4umae19u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 10:59:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCsucQQySatWybwP/ZEkyRGwKKx/VwVR1I8g8VKVeBeGo++CM1+CFoNy9qhxC3ED/y4YMFC8SXpDQSQ12UNGaFpphv+5dr8BdGvRQlnyZy3x7T56RHAyFWW7tuvv0tJikY2sMuGTELcRd+ETS6t68f8Ns0C77Pt3VMRDu9zhBHOD2KdBhJ8CbLMARziNx2OkCke0IgQnzCGXE8cNfei0jV7qHQpBpUhZ6xGq2SgtG+9osOjqW9Bg0Nz4/BFFveNMFtQ98ShZybow83Rsc5nRVzpxMcX7RUfX9E9tdz4FDnWqmyz/TzB3uTZpyjzc8cNtaLe+vzcwgkPC/6+qLh2yXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6a2zS7aiqvXQWpxT7/3d5zmeTHmkyAPGZnC3ybGIUNY=;
 b=JNSjAjahLOjhJMTVCMGd405BYgtqoda8adoQwH6Q7PBUg8uWIP/Y/MAG2ql9z8BMju7zOO1N3tccAOkKRlKoouDsAcoxflqxSOiGfqDdNdOQL9B6qHmiv3OB5BvaX33ZEZUImXVWWS2B+KaD5yjAo1uatA5YqQoH/jvzhZ2kgXuqnU0OcJrV/slhM3wyHgkaigp2CNjK0xruy724X4vnwio1ywRSd++/pXSyklrFYDtjWyxytFc/GPC3iYjaSb2hOeWxVzSHaPbA5pmrOcuFFg8nLXCInd4fAg2AJqfv7XTFTXg0RzYnfB9gjeWz1vBJQ3wyxwz8iFQ6eIRjZhI7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6a2zS7aiqvXQWpxT7/3d5zmeTHmkyAPGZnC3ybGIUNY=;
 b=VqQBVYsmXdKX/n6p3OzFdho2/fKkrYblc1gcYepp2/qc/GWas4T9pNLiGNdFIKd2bPXy9vabIPWvNTC4oHdQbkZ3klL4PPQOpMIZ+PYPAqS66ODLDrXw9Dvl9kShM/FbcjiaXIsgqVFmcBN5rtFesGvDo2ejgRauQeLxYDxkzLM=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BN0PR04MB7919.namprd04.prod.outlook.com (2603:10b6:408:152::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 15:59:18 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::54cd:1104:6e34:76fe]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::54cd:1104:6e34:76fe%7]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 15:59:18 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Stewart <alex.stewart@ni.com>, Bill Pittman <bill.pittman@ni.com>
Subject: [meta-networking][PATCH] openvpn: distribute sample-config-files
Date: Fri,  8 Jul 2022 10:58:33 -0500
Message-Id: <20220708155833.14750-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0104.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::29) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcc8fcf7-a76a-4789-d7bd-08da60fad04f
X-MS-TrafficTypeDiagnostic: BN0PR04MB7919:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gSYcSj9oLMjWKO5M8yrJwe1SFbTu/3+TKZGIbz+ZdD8bw5shFoRDxkNAn4seI/bIVuNtoTXzE1kmJ0yuKFr3iSoNeZP6bBor9cviFBtQQDAvAsdOvTrkHQ0EU/yF3rNks8fBmKapt7jiMiIB1lsuHwGHzWp7FsLuhC47oDCZ416+OBR0w+ML0naG2skGFlkKMh012VuIYfXrbppWK7ShiUwumRUtlKudcHm08pKZVaLDV8qgnLI8l0slZ6ApvPGH/OSwpmpcoVIKizq+wl1Rd/4CPOgbK72weilYBy7iUutkY26Eda1I9FikJkkI/S2CDCFjOONQrzmhGBfewSrB+ktWMCyQzDAcbBN9Rw0UT3elTOo6AmnlOyD203H7b6Cfdn+k1cmrBW/9K0EdPJu8akugj0a+Ia+7f964XZdHlt5d6A03eEL3J052oF4B5rM93JWiTASVWS88ROdQqdAs+cL0EVBvhCKixx+ldd6LLn6vZPA9ptlSX/5Bp8zpMSlooxkc/sx1QcFs+kvyWRZI3jpyUM0/6u2bUkbpn8nFdU0VKgJSDUh19j9m+SjI9KsW251jhgsAGvLFCVsc5uuJ4CvZ5IuyJQLJPueT0m8nDz611IcQbY+Ibb6h1o+JzrfjNAWyosw/pABywpIJ2eBEaQcuZBDsnM55pka/cWxtQMplvCh1w5MCePxMpn02ztRpSO0fAvi5HnB5O/WO4PlCCqIp8FQ/Xbj5NRwGbLYcmOlHiKbumcKatoE8mFeJgloCVV/YGKOOhO0IjloBF/Snku2b4yCa16q+KgmgnTZnEdlLIAp3zauu/SSPaIKrelyo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(346002)(376002)(136003)(366004)(41300700001)(66556008)(66476007)(66946007)(8676002)(6486002)(1076003)(44832011)(6666004)(5660300002)(86362001)(8936002)(478600001)(186003)(2906002)(4326008)(54906003)(26005)(38350700002)(36756003)(2616005)(316002)(6916009)(52116002)(6506007)(38100700002)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o89qfNzhqMtNvNc/4TVhykF7ztm8ZP+6YubAD2vqYjfSoop2riTX0M6t9stL?=
 =?us-ascii?Q?Y5su3ntXbxzSKUcOalraiumQmj32OQiGYEawUILFhaqtWpP4z58muPpvxCVo?=
 =?us-ascii?Q?0lu7I4gZpZWLStkHuREPZiudyKHdawPTroklNqszLuFRaDuU7P5eKRMaaFQC?=
 =?us-ascii?Q?Sxox+bn9w5CsFyPMBbHFrzsz89UCGuhAiyW6b8vcjKwrkmedG3dQxcpuHIbJ?=
 =?us-ascii?Q?VaUgbMc6IPyhOxzekFG+t+QMg+uKK1a3Q1i/Y93crBjEcrdtZtj1hT1wmq3t?=
 =?us-ascii?Q?tMmYcdnDGhgr+xMSMMxiemzodry5eIgEt2gbbuv0cvZngd8T0IIDQ/SLg00c?=
 =?us-ascii?Q?PZXZPYOpE4SF4hclVFHXb/gxzl4OfTQGEQibd/BM4fXIDHInueUhin9pg7h6?=
 =?us-ascii?Q?j8Mu+igvDfYeuIVaJBvSgrSzgPik9Vndb+ov6xp//S1ABxnXCF4uN2dRnUcC?=
 =?us-ascii?Q?oHilVQv0eWRKfmNcdmw5uhEJTbsBnH2SRgJMTEHKFULH2n3ZFu0Qavy9Fy+/?=
 =?us-ascii?Q?ja06LRPJDGCbBzW9JkUvypTDu/WZXMiZFATJtI/O8xZS5e1BEhxUQPMKJfxU?=
 =?us-ascii?Q?5zy+Lh58/E+/XaTi862YtkC/noik+7Hg3gNtfEq0ZPL9sDvtpnXXLTtx4V3y?=
 =?us-ascii?Q?hUCJYQv1QFwQOZ5idP/E0pMdBkuHA54Mw8N9uYjVeRG2PuD0yk7sSyTmDZkc?=
 =?us-ascii?Q?BIn8M4WHfkvZHnG+46/OY98U1nnLxOxycUNSaC/lKuzjCQZZGy51NJoXH/I8?=
 =?us-ascii?Q?5w4DQVCCUdw0hhIOH/23bZFWX7e0Zs8ZwV604k6ObpRiiEH/6dd6UKMAabKh?=
 =?us-ascii?Q?TXPEJA1PnnuCtWgrRlMkglH2g1WzD9PqDppdCAytyYydHWiMDuE+lyF7p0dX?=
 =?us-ascii?Q?KKYzCwzOm4LJlUVm4IJ+eBMpBiFanVetTpWSNcLiaEUPM6FquQl4xC427FWr?=
 =?us-ascii?Q?6vzPmAxnjhYRvRaxfBU3Xutr9KY6XKpL0+h2A9cltrrqe9aUGR2daumnOy2c?=
 =?us-ascii?Q?Hv4oIU14jcMy6/0HnLm+oWSlRASfN6DqREoHEGOdFwGT9D43qgnhyUh4UxRc?=
 =?us-ascii?Q?LfK3TPlbLflCOeqmHAgsmUDvbsQzzJXzgxl26BpdgEr0LKwwZ592bv3A7304?=
 =?us-ascii?Q?WsH/TvLIdXVTYCbuvI2GC2PUYrBhbNPov2JTe3XITdTI1ctiwNHrhpBJQ6dK?=
 =?us-ascii?Q?IlR78BS9Qj+ZSPUkAtC0lIK9tsHPD6cWq5dxGz3j42LqMa3Yu/qkTzkTNHyy?=
 =?us-ascii?Q?W4GTfArec7DDBblydnPBMTOPjTRebJalZulIgUist+loGC9JjlTVTU48yg2u?=
 =?us-ascii?Q?tC6toUpHR7eotp2Xb7pBkFelkY+CPflKQFPPOIdYLql6n3K+2P1V4kdim0gD?=
 =?us-ascii?Q?Ad4Vv7fFrjf8DI6ElZsvZcUzB6S3BkgwBUv4ff3QDVmnlkxK/r9Jv2kg9yGn?=
 =?us-ascii?Q?G1K9ZF1Qfclw6XnA6+Mu7U6vxIuZb+HdXrU5WgvsFmRR4r6wuVzn5Dkd88jr?=
 =?us-ascii?Q?mTUXB4E5uwKsNvV4kia8Mn9UBbRuPki2QzBx/YO67ooKeUC8faLi17gy/9ZO?=
 =?us-ascii?Q?gNTnSKemnl4DwWLELcpbpNgN+rWLjb3N/IymMG9R?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bcc8fcf7-a76a-4789-d7bd-08da60fad04f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 15:59:18.1205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XF4dH56IWSWyi9R4k4V1axnTcqjcqsBGEnN8QoEgMdj9b56KaLuk4n0wm+62MTt0Z4mm1avnfd1GS/Z1koHkOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB7919
X-Proofpoint-ORIG-GUID: YgpBTlb-W-Y-QplrZ8J_5ierz_Vml68K
X-Proofpoint-GUID: YgpBTlb-W-Y-QplrZ8J_5ierz_Vml68K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_13,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=823
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 mlxscore=0 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207080061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Jul 2022 15:59:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97791

The openvpn tarball has additional sample config files which are
generally useful to users, and which are typically distributed in other
distros' openvpn packages.

Include these sample configs in the OE recipe.

Signed-off-by: Bill Pittman <bill.pittman@ni.com>

Rebased to openvpn_2.5.7.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
index 1395a35f5401e6a7fdc666a6711e7f27984b36b2..a28c73ab5ae978e72a9e6521738b8350f5df9dc8 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
@@ -54,8 +54,12 @@ do_install:append() {
     install -d ${D}/${sysconfdir}/openvpn/sample
     install -m 644 ${S}/sample/sample-config-files/loopback-server  ${D}${sysconfdir}/openvpn/sample/loopback-server.conf
     install -m 644 ${S}/sample/sample-config-files/loopback-client  ${D}${sysconfdir}/openvpn/sample/loopback-client.conf
+    install -dm 755 ${D}${sysconfdir}/openvpn/sample/sample-config-files
     install -dm 755 ${D}${sysconfdir}/openvpn/sample/sample-keys
+    install -dm 755 ${D}${sysconfdir}/openvpn/sample/sample-scripts
+    install -m 644 ${S}/sample/sample-config-files/* ${D}${sysconfdir}/openvpn/sample/sample-config-files
     install -m 644 ${S}/sample/sample-keys/* ${D}${sysconfdir}/openvpn/sample/sample-keys
+    install -m 644 ${S}/sample/sample-scripts/* ${D}${sysconfdir}/openvpn/sample/sample-scripts
 
     install -d -m 710 ${D}/${localstatedir}/lib/openvpn
 }
-- 
2.36.1


