Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E061C7EE2A
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 12:07:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20274.1684757248768408722
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 05:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=45064acf6e=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MC1v8f020266
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 12:07:28 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpkn1hry6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 12:07:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DH+rcOLBBeFiACRnc/0KJaECqO28quV1Ag+QxV8AdS1bPhef1aLCDONTPx3wbd7MVK7I+I5j6wqMpqgThK6mBW4wUKTfL9MUykLkiOmttwJv80Nst9+JHQSKxRTFbL3BwZj0qRsgbzIQDlpqmTSBvsZOFxtFTdHkerGoIbrlypVHsIplXC09JM+R4uYjb5LL8+8nm9yj1FSyYZpitiwL0ydc5I44i3P7hB4LTuYRhO461cg4s/rmKXM6wC5Awdz/6BOyJvSwXP7Lce+jC++ihFwjdFP0XYu5/Tj1n8JAvJEMznjK077G8tKzw8tniZUYWyq2ak91NQuiTMTFnILZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4xgWQO1RAukw4Q10js+wj0zCc7lYJI8Lh7uROlN4VI=;
 b=kaIxCh+yId5GurS8n/bE/QkZYvX08Ft8G9mCGwfF3sctvENPyNlnATsrCqA2Ka3isj4GwuQOHgq3sITRc7kWLYip/cjB+g19n4kbF6zyiXLOto2iP+7zToVfCAfcdUevIz872T1sxnaPWkVLBbRVN0edWn4Af+qFlX2Ssahs4JV+EtaW2CxpT4cMM+KlPJXt2mFSdqHDJ8JI76iXLAQtLoVqrbp91Lo+qdXWTV8drEZAEWzuq6QnITv4R4Kka9CgXfpaTc95sdyhY5EjmvO3fzwMI8ULS1XtXROJiyeYIRCvwRbXIpdkb1jGZeuiKD0+QpCGMbnqZfzt2MyQvWd1vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 12:07:25 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%7]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 12:07:25 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 2/2] libbpf: installing uapi headers for native package
Date: Mon, 22 May 2023 20:07:08 +0800
Message-Id: <20230522120708.356500-2-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522120708.356500-1-xiangyu.chen@eng.windriver.com>
References: <20230522120708.356500-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:404:a::15) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|CO6PR11MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c847434-5cea-41e5-3386-08db5abd1ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HRAMqY2yVhH3XKRNNWvhyP5kn5IjfFBWzTmIwUcskC4apjPPa2O5ew5udbJRDlg2aiYXPKSb+WxbVD111nI7NE55XhIarUNuuU+GeTe3d5YBw2UchTqVUqdD/cADpQzV6ThEuFKg8rEiA1JbTRVZ8zsBoAqZ2rrooEWG7X0L8jcfA4BFnHx45vNtNCYnKmZ1jA0ZLEjPNcyTxYKleXKjyfeQBebtP24cpl0U+GHrkrvdjEX1ScxR+Afbcvtsk0XDwdpI7c5D7bZGqbY4ggNb4QWuD6ZltcULjnB0zgQasnyxt6SgXMTqtTkO7BWl1rOrETmUyN1AQmkQLSqkAEIVF9IOQ6U4U/b0cbS+ybJKsG+wTDNYvvp3dWpAM4tnndixlGy5hleWvQS5aPPo5Q9aEZdSVicXr1MlYypSI4k1axSvCH47kzkpVfFA9I21cGulL8Vz1jKLm0KItgh5+RwiYRKMeDcQChQ96qnXt2AmDvCqHlLx6pcEu+4ZSHhihs+Ka5UJidmRZElkvlS5GCcExvJgiR6xWpjULr5EiAbloWDG6rSdmmQ3SwaBaQAcjLZVyT9iZMT+oYqkglPBswG+4tF6OtUaga1W7azB9HkV2fTVUa+hJ9OIE1ONO4blAb6x
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39840400004)(376002)(396003)(346002)(451199021)(316002)(83170400001)(66476007)(66556008)(6916009)(66946007)(41300700001)(6486002)(6666004)(52116002)(38100700002)(478600001)(38350700002)(8936002)(8676002)(5660300002)(44832011)(186003)(6506007)(1076003)(6512007)(26005)(4744005)(2906002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N9I1kHFmv1+3lo85HzGQPVYQ3eawQiwWEvsKvYFgeq95356AD7mx2mv9LXNI?=
 =?us-ascii?Q?AOxVY+r0pj7dEABNRQrMDDQ1cvwbN39oSakbjLH1FvH1JOdfM6VbVuOuhyp4?=
 =?us-ascii?Q?Xn97fLv0LeY0CYYsjE+64p0SnMAB39PwCKvXwSj1EwZGKHeGM5E++qwKIvL+?=
 =?us-ascii?Q?Cet8cqmmgWGEuzH7Nf8O6Odg7WVX5P1w/Q+8IIvEOxc/Xv0xa/1O6xLmAwUa?=
 =?us-ascii?Q?FJfrteY78dFhlHrC9pyHopcu8UYcuKOqXKcPomVXftj5rzfDKzpFPt1u3EtZ?=
 =?us-ascii?Q?s3KOjiHaKeodLggmSdeUAoVdMqKDSE+0S8cVSUGwAS4xVUFj6Eoiyj49Y5R+?=
 =?us-ascii?Q?iGxRmyISBKLtazljX2GswHBZs5wXrd8/nq8iBXnk36K53G0ZEI8D1J/tLPIW?=
 =?us-ascii?Q?i+9pJbyeMFl+sX6AZw89paT9QhU2fV1cxr3rEX2Mk/rWY9M1ZBWb6we+o9vV?=
 =?us-ascii?Q?FzXw5kk//BV7wJyvrTpLvNwktf1Y6qgT3LLh0psjhBb1dPKPnfoRsTY5FfbH?=
 =?us-ascii?Q?FDUT9WhgxqNw7T6Pl0rWQcloywJDwCA2d3peoqcXbHD2Iwv+gug8y0W2IpUa?=
 =?us-ascii?Q?VYmstdx2s4uW7qSKK7XWKGTI9bJYtm8kGRuhoLZKq9DBEM8xiHfjncrGWsxx?=
 =?us-ascii?Q?T6GZFAE5Ufwn/0x6A+2TkHxUrqt51zWNFzlvNLmuRUFxQLkwQqyU/U6001zy?=
 =?us-ascii?Q?53uH3tCr1HQRqSrr55ABlYXCYmXXlTGaQhPu9ZcE9FTfuJShBokVCRbci0Ca?=
 =?us-ascii?Q?D7qzoKsjk4elOiuqLBvNLRf2v4gVz0ZJUY4sk4SGR/k1z2v0g4w2mqgjdpJn?=
 =?us-ascii?Q?RMpjQNXH1eH6NSfx6giI+RtMStQozdj00Yd23Hie9kvIONEXR6keNOyUrEmB?=
 =?us-ascii?Q?EhLNsttLrxtOVKnQY4YTgQd8A6vgZWdadOZAyTpRHQwKjUo9Nttd3W4unvb4?=
 =?us-ascii?Q?RJL1Enq49JcjtKdHglzakh7ntjkrUFiUHYRNO7HDO21N4hDX/D+1hBrkoFiz?=
 =?us-ascii?Q?KN5IZOUZQsgcPGcoWQEet3rIflEfvBwiwMd+SO5Msp6FjpaIEELIvrkbCITZ?=
 =?us-ascii?Q?/4mjx8StGJMeCviskF+gb/srPOEjJgEGpTFgkOSDZTmj46uijO/hQGHr2hD3?=
 =?us-ascii?Q?04bWKdCkH2FhF+c+yPJf3dkTEinXz3BfieMlroy2d0OY34Rao6WU1ztAQt5y?=
 =?us-ascii?Q?Bt4YYAUj5Q/Bvkki1GSq/TXdn59fPMoNqpVH3IUB84JpSzzGkBxG3a/toXeW?=
 =?us-ascii?Q?xJROc/0QipStg6FkmHzUQ5562dN4DpSBczFtrbam60CqbZy+NrV2JqOumN5D?=
 =?us-ascii?Q?Bc0qbQjBuA2sdEHj8QglGt0ghMUjXlBRNsnZ3AjkyLHZwIzQrft/QWL3MmaZ?=
 =?us-ascii?Q?r7BhBBDAUCRl5k3gj9j5krekZfQfK7yu8RvnO0MgTXcKVmdZ+TDSYlrNEs5o?=
 =?us-ascii?Q?c/axA5EUvGfacgOGpczP2aMTy7hkuBND0M0ra4Z+yGTzLSY87ZdgjEfzXey2?=
 =?us-ascii?Q?oqanyt+pVnsG+hg0cFP0f31S3iccxTdL+02l9+24VlNfpLTpxHFOXanPYpxO?=
 =?us-ascii?Q?E1rVMNZWn0h86SgzAZMzu6LIpBR8mTHK+kVe+5/NmfkZnQNsyev5kEBzzLx5?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c847434-5cea-41e5-3386-08db5abd1ad4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 12:07:25.7916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEv6kbLRjMuvUvevO1IhZtX8wKIJhaJpQD7SoqIPvRNvYZqZL2btvZFogL6WNGBF5f03iMpyQGrnMIYaPG4BBFuyLWGyFvkGMEZzgyQ/DLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5602
X-Proofpoint-ORIG-GUID: BQG-A5HWDicpkwAEOuGEZZn5wbsN-qp0
X-Proofpoint-GUID: BQG-A5HWDicpkwAEOuGEZZn5wbsN-qp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-22_08,2023-05-22_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=779 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305220101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 12:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102708

From: Xiangyu Chen <xiangyu.chen@windriver.com>

using libbpf-native provided headers for pahole-native or other application.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb
index 7c3df5f8a..71ca10e5a 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb
@@ -17,6 +17,7 @@ COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64|powerpc64).*-linux"
 S = "${WORKDIR}/git/src"
 
 EXTRA_OEMAKE += "DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
+EXTRA_OEMAKE:append:class-native = " UAPIDIR=${includedir}"
 
 inherit pkgconfig
 
@@ -28,4 +29,8 @@ do_install() {
 	oe_runmake install
 }
 
+do_install:append:class-native() {
+	oe_runmake install_uapi_headers
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


