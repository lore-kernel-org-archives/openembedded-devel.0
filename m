Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596D0C433FE
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 13:44:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6678.1648561449513545129
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 06:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FIasBMCe;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=108711bdc2=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22TCHcXn010634
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 06:44:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=0qLQLWXMTlCkAg9SEd5C2etpGvL1bCeM8ofPoUNHzKc=;
 b=FIasBMCe2yohOoNkiopXZshscOgDd/WF3FWBO7QP47liGA145oHBs/363nHzzzZwmB2G
 mVEihxR7VPM9o9PUrP7F2MoBRBRMyxWh2a+W4OHsRqeYk1NqtesWsPhWhC2NKG++fyah
 1AmHsth9yzxeSpbIlVJ/gvaOWlVVqrq0e1Oy/P0dgfkh2FTdBsHCAVSnQwOJFqncXLtJ
 J1cKtxL7Dzp6Gg8hsPTL9/RRaEEmKXmX4jjaTU3cJo/i6534TD9v8kFcMwvzi1enw8ow
 33KLRB9gb9M+CKv9mpvldYocZS2LTDZ+VBRON8LQ3/7jJVH4JeV3fCRyFE0Rttha6fBm NQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f22bja94c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 06:44:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBBaNzcqWy+JYRGph9WpGpixOsO0RATPr56YYi8q/0DcHA3jRcMRfd3qkENgapHLf0Ykv0COJSXPV9ffDZq9fd2k7pwg6LXg/eM5Yn/e9rkPWpsDw+HremmgTNNRKcYmlsxW1m7DAkGWDOb2wKuksIqmuRg4Tugp/LGqdGNwf3IrSIORIYvUHjUz35oKs+T0cdr48a01GLzf6EjZ9MJuvbVQapDPOoqn0V6BNaDIuplvB3HQiaRFiJ6mN531oclSAYzIBgieJPUqh3Ntm+MuooWasi2M0ujKYcdxzEDmU5W3/Kq+siXx/yTNnN78feqm83TaWKcXmHaiFwQILbQMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qLQLWXMTlCkAg9SEd5C2etpGvL1bCeM8ofPoUNHzKc=;
 b=D3rO1ePaAHnFGUmRyi4N8Xg82ODrjmdxgN/Qcgvts82Ls6uAJjPaNy0uYLqauqMpvohU3dnumY5GoZLF0DbBReXQSzclE7ZQBYUm2ieFURE58ztOc5nP8gz0VFBiH+ieOrNl7pxr16p87jvxtEixIlptvUcD/fHDnGAFRnn7k96Kip5/HjEpaYopnUN23XS6ZrB5Ib9OxEUzqQEDvhso5sudWCvV6pZImLZLAV3Xs5vZSerlQfVkgYlRwSlf+TASvE1I89P1u+bdkjnskrCaDhgGniC5+lrs60KaNWQFSizIPRTksLBIgtTw9WOY249eEJaoPWQDYvM4X8n0ke7Y1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 29 Mar
 2022 13:44:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 13:44:05 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][honister][PATCH] python3-lxml: upgrade 4.6.3 -> 4.6.5
Date: Tue, 29 Mar 2022 09:43:48 -0400
Message-Id: <20220329134348.8455-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5729bbb0-00b2-402e-9b54-08da118a30fd
X-MS-TrafficTypeDiagnostic: MW5PR11MB5931:EE_
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB593142D904EAAA7C9C5EE6349F1E9@MW5PR11MB5931.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UAU0kxeLi+J0TmUgYsPuh3znxXzEnyar9D8ELnFrPCLL3K4tmTL0kg3C7WqUE7BrI27WUM9TspLQEhUYoUuzNs7Yd7AMWIAvYe0sxGAPwI/4ZHV5IIu3qOYOW0MqyVk0HUyC4wlm5qWZWTU4D4QZJdliOuFehR3sgOo6aNb94IydNsMG4KKMdudYssG7RZQkuAnviN40UnM7xgyw7yHI/97G1DriGkgGEPnTBiCJEAPWhWYafx/zUSqjxXgV91mup44Thv1uk0wb1TpStLQI2rsaicZV58OaVE42FlY9ZuDlszpaOWbVdsSHzrNwhf/PasNxPr5GAhmpUdo2okpJEB1qy5noyMZNgxzLqWaIdcOkOFKiI+cnPQnxxmBScEkASeGd9mRMm5ZSWJOU6aCqKCqBHZYoGST5msgb8+WvBGFeP7WIm2bImzEFq8jYUXu8yqxqMbDdJuk3Jf8Y09wYL/RupnKCUXtK1cduDRxYbPXZ+OdETsFXCFrGMAauSmRC6ueEmke15rxVTParH/7N3/0qh2uCpEOdDjQIA4G0fu1tAQTh2mNzWZe14a7/hlwkDBTpK2PwpB8R6L5fJAQqfAaV58VHLxmYd4nGXt1JvOQ1aiAhBQn6tIeF9mPWHzrZ8SFWR+CR0Ahe4O6/4xwqmr8LGAhQwOGsKTnBDYmQ0Z2qzG6ATOzityHamNZ1YhS62s5cW0tqJqUmDDJ7idPCxynyop1xGL16tRLY185KCmgJ8hB3VjYFHbwzdgZzEcj12UyoU6e+Y9Gw/CKvWdlYvQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(5660300002)(6506007)(4001150100001)(2906002)(83380400001)(6512007)(36756003)(52116002)(6666004)(8936002)(6486002)(2616005)(38350700002)(44832011)(508600001)(38100700002)(26005)(1076003)(316002)(6916009)(186003)(86362001)(66476007)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CVPKea42z8kJhL8RnnKWcz99PAMlVZmjvRlPjD6K3WW5zC1uDJnU0EIs+JY7?=
 =?us-ascii?Q?eV0oeg1y+GmaD4nYsliPgkV6hD5I+L/S5cDYFOdHMMb2LsrLv0GwAbCZi2US?=
 =?us-ascii?Q?hnTeIuOZ647yu77ZYi6KrNW4iGcC4wwFU746dAMrjsgT3ibBDQU6ATJjxywh?=
 =?us-ascii?Q?4MerUADX1Nqv/UqpPidLHUFtQb7FUE4HWeYuq/8xslyb1Rxrg/Ynxvrb7Vcs?=
 =?us-ascii?Q?V5iZDZIUQ3fd/H+SWBYQR5Zllu8fuDzRvFJWZ/EOScPoWUFeYc095IWKrMD7?=
 =?us-ascii?Q?LMCuG4+img301enfcpFTKrUTJu7AHSEqdWvD1j9FVDoW8NcSK+LJ8DFIP/Qi?=
 =?us-ascii?Q?H+WEsTdg+YLBV/RzLoDhHsV7nRXR5t46qHdEgztFCinF6h5jTyptc2gWe4d8?=
 =?us-ascii?Q?Hqfdzaq55qMSBsoshR4WnjIYE8VHTKvaGvG1ycOUNes19Wda+zz3vnEqarsZ?=
 =?us-ascii?Q?1KCWehcDDThmAEC9XZHl2ptmAOxByCl2QSmMiQ010DeiJEHcXt4YpvUj9hCw?=
 =?us-ascii?Q?kgqgY8mETyn9oKMmJwCbFaW8NpOAYU/x/XRWGzSftS4I3ZTVoKleUPBe4ZVe?=
 =?us-ascii?Q?7ekx1x3DEZVrTM1yaIJN/HkG1ps+/j/eIVnN8wyR/rBfAd/O+7A+WRpn+649?=
 =?us-ascii?Q?1CS9Sp0pkJiLhDg094qi8093EwPDWvZKUuAieAt7yHyRulCX9cSAD8R+H+A1?=
 =?us-ascii?Q?xV4cjodMYEe43vUT/I/3ergW2a7TbgnTtLaT9C9m0dn0locp9tS48svzZBNq?=
 =?us-ascii?Q?iRev73ysPM05cGLusBWBOmf1C1SJhG9KaayWSzll+bBXdEnk3EPvYh1NDSmD?=
 =?us-ascii?Q?mYWysWqYqxHlpB7Grpj6tPuhbbgPMROUKq0sMpOQaLuzmnySwBZfQpFFLSpK?=
 =?us-ascii?Q?kDpZQ7bUJhrjjKLU3RTlFiLJMujfrkcK24DHOV4+pROdQdpTJq/OVlyQOoih?=
 =?us-ascii?Q?Mgvrk2oxDFWhMmX/qBEiGuzkA8J/6gPsoLPiu96iq/xHQcr0rsKHKTMFwhoO?=
 =?us-ascii?Q?zQZgcOyUiX007mg/canDtUnOY2lxpuGIZq3t4us2J/EePLjoHoAFDMM3OErw?=
 =?us-ascii?Q?2FyBmoLf2aEfW8Y/VS3wl4wOCwcuQlxNGc+RSliwFG866fdiK5+OOi65HPzA?=
 =?us-ascii?Q?Muuy6LynzkJg6PRR+H9Tdic87HkDbH7YUhWhX1BCAH7Hpe7ouJC1FbV6QWpc?=
 =?us-ascii?Q?qSNwKHIv1z/rJwuKRz0hiFvbuYa5zlGe1WRlqR7XCw/IQhjNvGe5bzNzjghY?=
 =?us-ascii?Q?SBF4c0iIryrPr+FEXKl9mfeKHNB/7pEr8Zsh8JZXLyDkFPnTzDWHTcLYxQSa?=
 =?us-ascii?Q?Z97Aocw5+se4NfGu/YTWYVIF15EjuY+7sDRpefC4gy1ZNvDk5GFqhMMLmK3L?=
 =?us-ascii?Q?wOWeZ28NFfAKOf61AuU+9q8Z8oeHpfe613DfK7jvXOiWS+oAsharrJxy9TFX?=
 =?us-ascii?Q?obyShCZZJa/DzsQTJ1EcEJAic2b18zlS6I4LKFO0mjqKkyIDO/4TlGdiYDil?=
 =?us-ascii?Q?wGEACOVwOR+uIbUN4ZgjsZPsya8/UQSJzk5K3SZdneWtrfkZUiogMnbUtTjM?=
 =?us-ascii?Q?Y1CG8n0tA0FVAXgVQgtYoYJs2dRdD5hNuiWJL9ciskVWGsj9QCLqywymISBy?=
 =?us-ascii?Q?+4fqDsSEzRqs2gRGe1WJztVcJAGVpZkfgEal5ckX63f3Ojk0ofK9U5pj3Kg+?=
 =?us-ascii?Q?wspwSxp9vs02tuogociTYtl8KmtphXiL/KTwP8X9NNPDp8XA7F8a/sVWqHft?=
 =?us-ascii?Q?B4IT+7p/3mxznonB5Rx6m1+Wmd3YPmE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5729bbb0-00b2-402e-9b54-08da118a30fd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 13:44:05.4869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aqOo0U6WTF+e95OfzBYj7DR1EL9FzZzQoUjPLuqWybt57v7YWg8zgCEXVptMeAHk4aESWIDbV6M1YeH/+wD2SkcMuH1A+AbSa6O9QiqHJkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
X-Proofpoint-ORIG-GUID: 1afpwlXymws-gFnByXI0UaGVjl7dc0Cy
X-Proofpoint-GUID: 1afpwlXymws-gFnByXI0UaGVjl7dc0Cy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_05,2022-03-29_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203290083
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 13:44:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96259

Release notes (https://github.com/lxml/lxml/blob/master/CHANGES.txt):

4.6.5 (2021-12-12)
==================

Bugs fixed
----------

* A vulnerability (GHSL-2021-1038) in the HTML cleaner allowed sneaking script
  content through SVG images (CVE-2021-43818).

* A vulnerability (GHSL-2021-1037) in the HTML cleaner allowed sneaking script
  content through CSS imports and other crafted constructs (CVE-2021-43818).

4.6.4 (2021-11-01)
==================

Features added
--------------

* GH#317: A new property ``system_url`` was added to DTD entities.
  Patch by Thirdegree.

* GH#314: The ``STATIC_*`` variables in ``setup.py`` can now be passed via env vars.
  Patch by Isaac Jurado.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/{python3-lxml_4.6.3.bb => python3-lxml_4.6.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.6.3.bb => python3-lxml_4.6.5.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb b/meta-python/recipes-devtools/python/python3-lxml_4.6.5.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.6.5.bb
index d5594847f..a0e8a8fbf 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.6.5.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "39b78571b3b30645ac77b95f7c69d1bffc4cf8c3b157c435a34da72e78c82468"
+SRC_URI[sha256sum] = "6e84edecc3a82f90d44ddee2ee2a2630d4994b8471816e226d2b771cda7ac4ca"
 
 inherit pkgconfig pypi setuptools3
 
-- 
2.33.0


