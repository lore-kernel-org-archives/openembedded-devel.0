Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE05C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35926.1640677121271491329
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fjgHcwqT;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7Pxrn013136
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 07:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Ge0Mc+f5SYdD/UePZ5hFJ7G3uQJtRwWb2aL0f0sqru0=;
 b=fjgHcwqT8zKk5RkrlPppndbIjQSetx9D1ogCNwXR4oi8uiLjbJdbmFq5UoXZmMw3kBZw
 mxP1nR/EDpT8Z2WnWaC+UMKqE2Zyxk3VQ1E0Ghc7VOz+4NCFG/HYRvRtXI0ySjXpy2xa
 aUcpTa/jlMx5PXNyJXLig9lApu6STK5WeY/qY0FqikDMHNS2AGlfLj1s5BXsu0pWyeX/
 RE3G3IT11i1eIS8zC3FD5J0Yui4FHk+WxwzbvkWSMeIuPTDTP98YRLpMWr0KyCXMZmtY
 FSjGLbShcUqUwLcuhJYYEZ0smqfDcDcOeSra0hUQ2rO8rxnpm27iecy+M/HVHJjgHlhG Yg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7bhm0h6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 07:38:40 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7cdwl004904
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 07:38:39 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7bhm0h6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Dec 2021 07:38:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXnlBXI+6EbkmryGsOK3wlY+Z1IkRBT3rn2O1w6WvCL093gWfbrTLiZICt+4lH8EvCrYN0IKTt02GjUka0dXJAG+GjAwiywfJNTJSUTjqvfyp/jtA5qjMzmuVc1/W6F2t16u1/5nZxt9cIQuAOly6qp8i3YBCa+OoU5QhF9386zFXUw3U+IOWVh95ren7NCyTxs6yk9VpzZ3vxnRThyZRPZ+aC2id4yyArC9tEYS7lhdCuPaW+yb4VcviOHHpIpvYslpIe3YkXgDAgiP8wd3uAtYbCVRq+0yVbykvjSM6t7HcyFLtqzhNOme90Uw0J984JEk8VQAuwBHuIsE7565SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge0Mc+f5SYdD/UePZ5hFJ7G3uQJtRwWb2aL0f0sqru0=;
 b=k4LPkvFHeJT2WI9t+fbGH2kYRhTroTbDMGkYq27BtJsoa3aU9s4YPmKWQcq9qBQ998Br4P08S2k6fj1YaDHElMEd9esrRL7VTu/Q9u4jGxrwMtq7MV36EHF+b2TTWJ6AuRdL82VHPQoPPTcTsCTE6eOsIRLEK8bfsixJLgl68t/qgLZ1WjI+49n+fibWuTiTYm0ap2COnB4rZpopwWnpD6hWzWEchWbyGxw3Z1zi0oLMqjYAdIIpOzf8zSLFFScH8hKXgqJX6XbfKTaLh5BorgfDYo9//xMAIvMQjboPXMhFA+6GL6SonxDBBZXRrnic/M+GseBJFEJXcFSvZotK+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 07:38:38 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:38 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 15/19] libldb: upgrade 2.3.0 ->
 2.3.2
Date: Tue, 28 Dec 2021 15:38:02 +0800
Message-Id: <20211228073806.868759-16-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d18a1cf4-7f4d-4d96-928e-08d9c9d50ffe
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB15848913F31558BFF107211AF9439@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mL/wxl39L49WttAqLHO4BtH84wXmSvyaPQzDg1Q0Cj0Sjalwa+csq/8Pqx3RmkR25KCG/1a7ED59ierZXr8Dkof2V8//9JTVw0hb2n5OGIlGXN/H7Y83UUdlQ1SeWYqw7i9tdSCaFjhzFU4IgsFVX//cfkt3nPnrTRJQnc3xMqsFBu5NaPnU4OH9sjtIsP9dn5Q+/PaCJ/hljd3D5jX5CxYfG4NGsaChV87pbF6wsAbLvTLR4FZzGpJGceS77zeaK9ZudCL8j5ZUGi99/yCUw1mKdT5RgkZvir8c4fKFMdPCG5kQLAMW/+kYRA6eWeAZhM0prpk3ukV3zkrqPQtzzLYezywUnsxSZKiJcDOxkSSAIYTv6cwLuRgR1MD3VeYWxnqDl2gtLsjaNI4h7UVvk9hdVXB2yUe+19sU1YIzFARPrd+vXb48w/JIzohEoygmLkfDDwOKjnSpPoXFTW+jjdmltVHlyQPRB5N2yLhTnYmlF+tzyK+pK/twDZrzCGPFeObuUB4Qy/Ev2H16ScQPHjZ4r8Pt7QQvcJrMKdFp/OhQ0vy6uml9UO9QTN7/qQu2dk961bX5p7JopLtPQjSuBRbbgFeA0Y09CoqVeV/JJBxhpPHVAUisYxleLBVQ2yG+oBnNyhpz3aNFgdbM8h4rdgMiZWvrlPSzU7EZ2K90JBc8osa3t9uib/YPvUh84KHNtZ39O3gAMbbnN6EvSc8KhA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(8936002)(508600001)(83380400001)(2616005)(44832011)(36756003)(1076003)(6666004)(8676002)(5660300002)(52116002)(186003)(38350700002)(38100700002)(6506007)(6486002)(6512007)(2906002)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8k6hf28CINMwVAT+7Pgvg5KkNyYAZydApck1w/d49nyX131lu/9ifh25tgU7?=
 =?us-ascii?Q?FrJ2E78g3MPdrAJYDwJMMtpFkjjmpiwvFAniqo+DbjHm9Yt/vmTuxuUKyafW?=
 =?us-ascii?Q?5vl3Zfu1q8RqfS0NlD0fyjv4tYcXkV64d+Nx4Nq0CvjtBxXf/jVhLrqTNFqP?=
 =?us-ascii?Q?Vborcu3ZyIxKOmua3TR/lPcI8YMwEyA2TiFecqmc8vLhqh5JZ130W+yFzsbB?=
 =?us-ascii?Q?gitH/WWYT5m1X6kBo+LKZtv4d1aDQ8Sq2d3TabPF9VXt/QFaZ1wjp7ihXNW9?=
 =?us-ascii?Q?t0R1EgcRaVnJvxwlmVYeIGttAX2PWOt0Q1MYPXRHQLuhL9QTPEhscoRP5Ycb?=
 =?us-ascii?Q?f8Un0p0J+8Vg9xgK+IQeDyQEJVQFBv3kHRVzq8D8vwAPaPTD8yz/0D6HyzVU?=
 =?us-ascii?Q?G7hpFGZ5cx39WHDPeyBMiU6cGWDTr2ryjE4FPAkX+IrCNwe+10eWquJaGmNF?=
 =?us-ascii?Q?mfreJQkNgz3ngysZEcjeI7Sxv+Y0mNHiJhLl/pBMM4VchC4qon9BCcDGG+8o?=
 =?us-ascii?Q?9HtLP8EquZK+enmIa8nvz4Wipwe4CsuyDtGhsizUdJCvTZaqCipAjGp7mrIW?=
 =?us-ascii?Q?v3p+l9rDevJY34dKrxAWRiDv+tQSLudRK1u3oNpTLyVQH2GJH9iheHGIi/PG?=
 =?us-ascii?Q?G2FdKR1x4l3CkrXv6DJpcbuXudeh57+VQ3eJPbgVdrIPzsX727SX4bRbD6hq?=
 =?us-ascii?Q?LhahxexAUOIeeAD11jcZlsRU053X1YRxAnF6AyYO7qdf2f3Aaz949pV8JWKX?=
 =?us-ascii?Q?lX3sCg+3X4uBElfs9cPpWSeBJqCikPT3409tFlOBNUVIFYm/Oo/pXnvt3B7W?=
 =?us-ascii?Q?jQCPaUWJI566PuG6/keAv6bqc6JHQ9ZeDn12y2zfiAoy1WG321IlAemLAXCJ?=
 =?us-ascii?Q?4b8vi7MIt1F9BESNV31BnfqdabdebW/WXvTbzoqaEDR/kdp5Hx8NLfjDb2b3?=
 =?us-ascii?Q?3vErzGLb9NXTVrru13H3jUVzOibBLIexFWbxxBaSUVJcmcG5b+a+alcHOpha?=
 =?us-ascii?Q?UMk9OB3DM3n2pLuhb0JpcBTCLTKJEh0tQtSB5g7PQfCmeW/uLtClfBngcnaN?=
 =?us-ascii?Q?SoidI6hzX9fOmQtKFEg/AfmZW/9aDydVVQYZfUKwKrOABTvH72tUiw6Qc1jW?=
 =?us-ascii?Q?s637VpsOfdkoj+2PgT+hTu5B7PRaYVYmP9Day+5g0OzaXngh3sTv958y2mBg?=
 =?us-ascii?Q?SRf3NBVDAoJAxpCeRzkGdXUm5N0j4pBf2GwzACY7RtonmFmWwTo51F5pnH39?=
 =?us-ascii?Q?eXFiWdvqYUeWlihgzRTT2ys9+a/AKKdZKlG1m/1/FZM+45RuhJx9MM9nm1lb?=
 =?us-ascii?Q?TZ9ZgVo5J2uJKh2S0WnI3ZsexDNZq4tNZPhZS8hc5sJdI7TJbNKA5RT/581l?=
 =?us-ascii?Q?ZTHCU/QWS+BApEZH7Y9Ga1hXCfm8fjj5gRlEo6cUBMFRZ8rwOMtkgapayoAH?=
 =?us-ascii?Q?2t737bpluwASaaEoMK1u442v2dpR+hHFFUbiT9VigbERuhmXwvBaklHbLXmG?=
 =?us-ascii?Q?1HYzDJD4DYHUJxL5KSH7fDhNsoYxl1yV8+4K0kvXh630T/eF++obQpSvgf+Y?=
 =?us-ascii?Q?15RX/DUX4WTok7UNX73VOsV2oR0kW4X87NGeHWEYisJrhkZO7SGPLZH9cmVv?=
 =?us-ascii?Q?+EujG4Nuzotuy0s0QmnsOXM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d18a1cf4-7f4d-4d96-928e-08d9c9d50ffe
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:38.4917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 04RKCOEQzhC+d1YC55rqBeJ61NTfJYB5OH8hU3Qn1iTHVo8xfHE0C1VdR86rTiRW60XD/HU+dcQXhfYH8kHt2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
X-Proofpoint-GUID: KQxm2Quw5HQq26YOwcuENXBvQhjKzjZh
X-Proofpoint-ORIG-GUID: 6yMu7Lj11i_DqybAhMpeFIDzfDI_Vis0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94543

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libldb/{libldb_2.3.0.bb => libldb_2.3.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.3.0.bb => libldb_2.3.2.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.3.0.bb b/meta-networking/recipes-support/libldb/libldb_2.3.2.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_2.3.0.bb
rename to meta-networking/recipes-support/libldb/libldb_2.3.2.bb
index 71cf4e849..970d4d97f 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.3.0.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.3.2.bb
@@ -31,8 +31,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "fe4b1f17f77e2ea52b4e1320d927844c"
-SRC_URI[sha256sum] = "a4d308b3d0922ef01f3661a69ebc373e772374defa76cf0979ad21b21f91922d"
+SRC_URI[md5sum] = "650a05f8a2b2e6455f590dc815a71879"
+SRC_URI[sha256sum] = "1416c949dc4326e41c0d8a5ecf8ef784f8c0b6e9d3dad8fa971e84ad56227603"
 
 inherit pkgconfig waf-samba
 
-- 
2.25.1


