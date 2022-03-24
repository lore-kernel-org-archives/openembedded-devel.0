Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE639C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 15:58:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.12629.1648137479540659679
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 08:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QxoTIZ0M;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=008297714c=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22OFSQ3Q032749
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 08:57:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=tu452+DtuHlp3F7VJww2LUm4JkQGYGNV6MO5Kl3UoGA=;
 b=QxoTIZ0MNuX8La/AbnhULFt4uCzh44+mzzUVkJc7HN5/22JJTX+6b0JvUPrLUb1fPgUz
 gXX3oY9WBj5rij44kdzcT5h1eZJaYH86Q56EBVH/XW7QArAyabrEi5/Ed7mD1AiiNhG3
 O/YcAOhNpdW+7n2FHI8WHk1H1PA3D2Aey/kh31AFBUpamAsJai7oW/yMzjJmvVwtlcsp
 bB0po2MgBMdV0ywZh4jyLLwxsf9zKS4Hlwc9uI1SNYMed8Qyj+4KtG9OhrPi02M0pntb
 omMG+yT3964SHDzXUVr9mIFeIntX3XjEFvRoA8gfp/lcRtS1flC25Waoufi46Tra3R3T Dg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewepj4ehm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 08:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7ajYlDEvDagcXK3dY9D8/KvmIjYOsyGu1DRLONMwoFzonBkd6dlNMCUkZpJ2QQ3jV90oQ7SKPSFtfhfo9WNl4nhlR4nxf39OVePdV+RMvxIOqF3BMtHbpMRkQwtJipsD7OxhnRVJLX3g++ff7hXVPNtaBrPUtdfjlJupuI00e9DpkfMXlgCbLYL2nCEJi9Hyr4zpPRD4SN7i3qoYNqD0J99Z6a1lqAfoPASjifhSsYCD5Xi/e8iOqaYoUTW4AJ71GoHJCOXDqIKVgBPBE38mh2hyDBotsp7sgp0I9noolzUd5O8lFN70x6vjAVADXx4aPqvWBUo+tcAJ1gWV19WeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tu452+DtuHlp3F7VJww2LUm4JkQGYGNV6MO5Kl3UoGA=;
 b=gnrYgCnIiO+sM8fglG4Vwff57U9+HEhijeNCLOlv+awx7UyPXXvWWksD1pt/v5mcSBvSU8RiUp1jnbtePbFuXF30K59fYUyzWXmsSJuzzJz9ZSW4smTLZbDagJCwd4JxLlItyVo2pIAzx2xb7p07yt7OjWx7hzLblF4bocb3p2GQssKNX4PQN1UGKc3QyDMx+xgo4pJJ8Zp+8uXD5O86LebwuamilGX3fSR4PCzpW5g1dmI9y5xmK0KmNEoZ+CbR4Hvche5wyDiFKlftQvtHh9ea2B0Xgz+aVuA84wh/NiHE8e6PMZlUDy83eLEaNQMrmE6mjV6/Ll1fsdOONJFbQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by MN2PR11MB3869.namprd11.prod.outlook.com (2603:10b6:208:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 24 Mar
 2022 15:57:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Thu, 24 Mar 2022
 15:57:57 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/4] python3-paramiko: upgrade 2.9.2 -> 2.10.3
Date: Thu, 24 Mar 2022 11:57:46 -0400
Message-Id: <20220324155746.2341330-4-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324155746.2341330-1-trevor.gamblin@windriver.com>
References: <20220324155746.2341330-1-trevor.gamblin@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::41)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f166fb22-bc33-4bad-229c-08da0daf1032
X-MS-TrafficTypeDiagnostic: MN2PR11MB3869:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB38696BB01533FCFB3F4289B09F199@MN2PR11MB3869.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E4szlZDyWCACwNeCGNaAngJoOX19rHjZEIOIEfY89HNaPAyQT9sx+UlaFhB8g2oGzW/HwXZPFnc5t7wA4KdjBRLCjFC+ffyrGXW3zlIA2jze+zwiDF6sy28n6Xj1J9L+ucJEgLhHrVYlnxrTgPCFqbChN5UKZrOE8roESAMOohZrVZd1Gjf4/6tvbE/h8qlsnNgYGC8TOipRxQ4KwfCCe8aLVBGZcyXl5onN5wvQDo4xUq9FKwbskB78WYkoGfodpIantgK0cndza8NeHg76femdY8OFH/C0jBIdGJZHaUjMlJl/5xnJVR9HqkAgew7PUl97lOUFZCUsrSa+8dJBwb+Dz26n40TYNeQ5iqf5pQV8gyGIr57SbVZM7Ujc7CDNa/f/6rR1E+BGXFvjzWEbvXvpeafurj0Kij15cMBqzRjA9M/A6mIR+qAKSgkFB0dPHrQU4KaPfU52NpCnW1jq4R+0+MjOEQQ9E+mq7ZU6ukibhmdZ67WqGRjLrXvu6c+b2oHnaO95SIex3CelxuhMGevrap7rLiqx3AIPnhXOaPzVtfU3GW1TfOXwTAeUkGunECfV4MDUt/wyMcmAm9D0wbx606f6RVpcxSGtCuy+9KxKtORYTPko00953XSbWpAgDK+1ArhS24pTAftSPJY+wP8kt7bcxXWeA23rvrxlWgdIPED/Y6KVDvwfpkps134MXvN0xL16bzdUsxN8t5Lg8w1ytY/nNd9C2mxHsujETA0cQgvoPo6QHAHNp8Lpdnl7K+a4qWRqqML57xvlBiXWy9dgVPgD9rDdgu4KlXCUCQY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(1076003)(6916009)(38350700002)(316002)(26005)(66946007)(186003)(2616005)(66556008)(86362001)(66476007)(6666004)(8676002)(5660300002)(508600001)(6486002)(6512007)(2906002)(52116002)(6506007)(8936002)(36756003)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HbyxmWskltMwMvEjJUdfo5P2o/2ZL27XnHUDTlgvAgicPDROLPFueO0B85IQ?=
 =?us-ascii?Q?f3zPXlMJLqlOhnIOQhUr91J9/Ca2xyZXLXE1F59lC0gnNIeSWrS1eV2VVytG?=
 =?us-ascii?Q?DhEMz7Ru8qK+2bC2iXFNOVw5GM7zB+77C33edkLZB1cXrWzcE8n28Jw/3GH+?=
 =?us-ascii?Q?NZT8+gAgDflxMXkyQMy0dM7T23OkuWFGgEdh/eNQAYFVCUiB3vwWjDOjxOKr?=
 =?us-ascii?Q?qtmDBcE6bRaB3TbpBXVz/Sor86s/CA71FNFdKkfe6TFutSAKBpdmfw9opCnV?=
 =?us-ascii?Q?t5e5Xo5LHaJPrRrsWRI3JP3SiyQFT+enKnKENcQGmvZzokpl08LQEu0W1hZL?=
 =?us-ascii?Q?UkRzM5RnoN44lMQB1T3msV7hyx2xtGIF7bNT4ARUJBv7m+GkeKkjuZRkRc+i?=
 =?us-ascii?Q?vYlcHGqC4X8SSwA8oBIcIE3b5BbRRRxpYaarx8aoYrIVTKTmibl7bi5lLsgL?=
 =?us-ascii?Q?MwgetJbAyfMMxa7JOBzTlT4GkuXqLDtob2+1dBQSDh3XPqQ7GW9JGxdtBCSZ?=
 =?us-ascii?Q?5jE+x7igTfI9/FYE9la5RTsvvZC0INooVqFRLfWTt2Z/FRgQyKJDFU1Dsbx0?=
 =?us-ascii?Q?DjRDFR+k+qvQPA4v1oliIqJI//1EYQG4hFw5Qp9nlDPO8oksMZIrAnYb0+gN?=
 =?us-ascii?Q?n7WP7Xj1SQ5xs5IZbPxnPo2PZbgXdp0W7w4HwkEW5dN+ynGwVcRxgd8dNaEM?=
 =?us-ascii?Q?HD4FNIGralbE5xJxbixxp0GQt8Bv61gPRGX5RBfCoJ3qjIEV1ddBkX6NHaay?=
 =?us-ascii?Q?H+qiAVmz4T2uGA5WaxKInqBtvUtMHfeQUlXG0J1mc+GYTlHPTmAvH0XWP1mk?=
 =?us-ascii?Q?rVd6i/JQoK2ueNNE2CoFSCStDLlVmdn7uwWPDnsGZUGjsrNJMDpAyqSjNCFR?=
 =?us-ascii?Q?+xCOgezSJdhdiUKuCAVTU9sUqSLV+KZIzFU764MDE9FAplBMi0ihRolT+9OE?=
 =?us-ascii?Q?aC8RvFcJT2Mm9Kh0vKzJGGCSH1FqZjR2Pk1xnUGblDNYiMD0KCVGHkyhy5Hk?=
 =?us-ascii?Q?1q3vH/F9be5hBpf1T8z+f3K63eE0JWnwaGTDhzcaCM7D3muluv0TQ79kW67M?=
 =?us-ascii?Q?Nj1ISYpac6JkcCqHTaTLuySKNCmJgXPvV58xxxjYaJ/uNAadytgSkm8jLpe4?=
 =?us-ascii?Q?2gxhFwtoRNVH3Ts5ntFCs0DPe5Vqtyp/6Q4gX0WpMPU52FALxute536MexKz?=
 =?us-ascii?Q?trqFe+8civSeA/E532kWbRNVkOV5ff833h6pH/OSe0QqCExCA17tg9kW0MMs?=
 =?us-ascii?Q?aurP6eYfeQjX2w73yG3eL67oqimDFUVmqvuZFpcu2/9yazMToB9FeA2KoGIv?=
 =?us-ascii?Q?6awzKQiXmNoNoti9P/mkimcuoBQhPKda8/kNytFGn7MY8sBqbZNsdP9fqGm9?=
 =?us-ascii?Q?DwevixsZxEntXGCvYuo6VuY17nhiEjH7KXL3rH1En1nQ/1zyF2mo4jTBGX6l?=
 =?us-ascii?Q?0HqQ2WTL7YQWU3O2q9utYqfrTeGndcjA43bp+EyFU1bkxCLOnp401Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f166fb22-bc33-4bad-229c-08da0daf1032
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 15:57:57.1161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gYD6HlHfk1YSR+TLMzlYP/T+BovD495b+qQpjQQZdGeg8E0x8CQdiIs2RkJ5QtjCljOD1p+NBqsoIrVVA0lnbAaCheFMfaOLW5V3aP5p3h8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3869
X-Proofpoint-GUID: QlA9Di8ZDRXC5KO4inohTS2bHDX8vrbE
X-Proofpoint-ORIG-GUID: QlA9Di8ZDRXC5KO4inohTS2bHDX8vrbE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-24_04,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=846 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203240089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 15:58:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96199

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../{python3-paramiko_2.9.2.bb => python3-paramiko_2.10.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_2.9.2.bb => python3-paramiko_2.10.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.9.2.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.10.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_2.9.2.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_2.10.3.bb
index a02a7891a..9f7f45872 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.10.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "944a9e5dbdd413ab6c7951ea46b0ab40713235a9c4c5ca81cfe45c6f14fa677b"
+SRC_URI[sha256sum] = "ddb1977853aef82804b35d72a0e597b244fa326c404c350bd00c5b01dbfee71a"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.35.1


