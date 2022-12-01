Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA36C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 13:43:42 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.43553.1669902213221076472
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 05:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=q4iq0sf7;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=93349a59e9=alex.stewart@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B1C64Jp012551;
	Thu, 1 Dec 2022 07:43:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : content-type : mime-version; s=PPS11062020;
 bh=ym8GC8teBgOn9w6yOryAXOGbebOz6anmXtzUltKvNoQ=;
 b=q4iq0sf7JYl9yTF6XZIYQtXb303fHcYEztXRrk9TSX6OqGnA2nVekKqgrc/p4JI7H1Na
 6SlZ4tAjp7ntSCGEbUP7xxiOEY1iqr0qtsZvpIajUICe8Aj3Tcj2FSY4dDtJdIdAJwuu
 WF6PsGNvakjV2Cah0IZNBCukdarnvLnVNAUM2yuUdXOSFkMJ4F0HM0j7apFgy0gk04C9
 CPVgNJ9O854b1QX2LAKMRCoNPQ3uwyDI+/WEJhnTiSC88DiAlzWxv1mtuw2dEMmfcIAI
 qgzysTQofajuiV1oKJfPVZFZj+5IwRxFntTC3+iKoIpWgXOMB3AR9Fg+cCC19Vv7ybuM gA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3m6k76926u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:43:32 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFofPHR+N3poH50s2eWK/ejSnPj5kKWjRB0wfA2aR28ZKnpC2ZDWjAP/U1x2DMNukPWjggf7bFB4GsCZz2AMOxyEjkM/O2sg8lPypU7wyVxiBHeCkTA1bWqn5l6j3XA5EiLrRW57P0O+XCJJoRKFW/a70mJozSNmi92yiihQ8x7jn+UcsYk1vW/P5hGKmgev6J6K1PENUHNUn8P286HN2UA+mUFJdlA4mMp5i32HkyU6wtEvQd/0wBHZbfmaeTbqHDlYD/zzIe0NU2ctgKHJnzsNsfr+g7ThWgBdWqvc6lzs0SpctWhPo744V6iiBkcgyGNI6IjtMQ6pMyF5SMGQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ym8GC8teBgOn9w6yOryAXOGbebOz6anmXtzUltKvNoQ=;
 b=NRdSoatlW7JFgWhr7vvWcE2l5GEqib1dzSDPAi+Ry9jVtKi/66tz9VPMjIRjNjDku+QSOUdOOv6R/azLxaHQWWjKJF7QczNydRmTSVg/MgO7Cn/3Ac6Cqn+mzryCYLdEaYXnxLFf8hUAmUSkADwms/qouD1rMjyApdx5r2yOi6hafhd7bqv+lTIS7I+OjrrCMMeeFlDVBYe8V6PtQ9jZgB76Ry/alPXC021hg4sQDpuXpwckX0IeugD1A0qXaLT9JLr8JidQZ4QKgSgFpJIGc+J2b8EN83g6xj7GJVHLYqkPAgVLEh+cRxwM07kZQoAiXqu/8gnfCRRkKf+JmqSd3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ym8GC8teBgOn9w6yOryAXOGbebOz6anmXtzUltKvNoQ=;
 b=Ojg9wF7HgbR9szWpy9VuBEAp1EyYfIk1zClHQEExz15zsW1+6Lvb+rDtxmcDwWYZPFD120+3HcNUBfVv4mVgUdvNvEcZuyPy773Ljp685DDLhV5J8ehmooR7iFtERoB4fm+KDorZJjjkyLRNPjP2f1NIjxPqeP8N4CFA6ibjKh0=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by MN2PR04MB6925.namprd04.prod.outlook.com (2603:10b6:208:1e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 13:43:30 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511%3]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 13:43:29 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-devel@lists.openembedded.org
Cc: schnitzeltony@gmail.com, Alex Stewart <alex.stewart@ni.com>
Subject: [oe][meta-gnome][PATCH 1/3] openssh: add native BBCLASSEXTEND
Date: Thu,  1 Dec 2022 07:41:46 -0600
Message-Id: <20221201134148.116754-2-alex.stewart@ni.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201134148.116754-1-alex.stewart@ni.com>
References: <20221201134148.116754-1-alex.stewart@ni.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0087.namprd12.prod.outlook.com
 (2603:10b6:802:21::22) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|MN2PR04MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a0462a8-a846-45ac-5c03-08dad3a207a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u09BlC/UQTzM5RNaSH7HrND8RMXO4feV+UtWXLrTY4RYxMmUzPSAmml3pJOtgINaBLeu8hDLv4hKPlRwtHV/Vua75JuWOGnyg/Ji3VLblhUON1ARlVqM0OArVdpKSMyoy16DvKXFhkf6XOso/SD8aP2W9mYs+4y9dzW6zwZ3jgpI2VRQCZ+2WIBF1g92cRAKpe5qNizVP7WWXXVdmBqPw+Jpx8oMKfgNoNa3y9MoMffL5ks0qwRUGOERFvlHALIzKtvk/oN4Wxmiw/RfpvUnNNPcnAkzwC6LQ/ZTtPZwTQqZlXSY9/mYNnMWvwhV0dinZiMKMYTNKpR0ilIuR/wIcwOgl0QR2Pw93UAK9d5OHOyNepUM19c0PJ/0J7VBXClgxHP6oJlY7Sa5wi0Ip+sFspo/23BtxJFtx+OaZmNUmcrjPpzDWHl9NZVlVbUeBiveeKWqOJtfFScyPAW1D9bABc1svliXexVP7WUPk713M8qnIqg/JhtiENnZTYpqCNsHtSy78H4BR+BVLHMrUOrlLXqPUJgVwVcE82fFI15xCjv2C51535PapKL3AMZLIuqicZGWorCzpwibAjE+G5WPIe++M5p8muDvz32PG/HbIrTA2a2ZEq07F3agsxwCrgGjbZN6a82xHzKBG58cPfSKlA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199015)(6666004)(2906002)(36756003)(2616005)(86362001)(6486002)(478600001)(26005)(316002)(6506007)(66556008)(44832011)(4744005)(5660300002)(41300700001)(6916009)(4326008)(8676002)(66476007)(8936002)(66946007)(38100700002)(6512007)(186003)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uh3l1lfU8h/VrrhkI75XxKWIH0aymocsp5KRelIx8YTM9bT05Jedj+9LycC6?=
 =?us-ascii?Q?v/KrPwN85XR/7jvJX/U2H++PriysOzJmMkdzps1wHWxF2udq2/B9Y0bbCGPv?=
 =?us-ascii?Q?slvirD2nDPPcsl3EniH2uo6u2EtqIJKhHxO3U8wrK0WWOv3VTz6fcWk6sGFG?=
 =?us-ascii?Q?kOCq6vNGgyPAAhhSlLCpGUR6PHlo4En+QRvWefAciaFSGuk2infaiayHeQpH?=
 =?us-ascii?Q?dbjPy0TSQpE3y1fZRqZDdYsJEHgdztHRyblPvVC0IzbhG7n+TOMr0bL0Iwdn?=
 =?us-ascii?Q?RJIue4eWgcIDqqf4NNZJc/cik+NThB9OYkBnG8dppNi3HQISkjfnO9QG4liu?=
 =?us-ascii?Q?TUVCCWgOojszwWQaJSeUKAL+PMCXylAzBvSba7UzT+qm2kfO0U27FKTWGYwc?=
 =?us-ascii?Q?mR5ubjDBIBSAxZtknCOb8/VELVpx0Y6FEZLEs4q4g2np0YpmrGSgl6JKtogj?=
 =?us-ascii?Q?J6deXQw1tGscgCl5OHQWDY5if9vfmn+YMKZwUneq7UM+/IDt4/PpSlJ1vr5T?=
 =?us-ascii?Q?JUuBdeWx7aGk6mXYipEjc87rrbaNS+wihw0ewYo6H/j9AfMITzF+iB2qEDjY?=
 =?us-ascii?Q?I8Ogf3hVZdHb7EDrZdwV4OEb5dY/0a8lsM3Vc+u06t+Q3/h+UjrHnqq8NJ8c?=
 =?us-ascii?Q?eZRpix+ggFJ952+3WvhyoYyvwA3Zwrd4m8jBQa09n9Eu72p4RYf4tKBq65Aw?=
 =?us-ascii?Q?rdgAloGWlHvAguDyut1tK1rrVZh79e35uisY8AFf4dzs+/y7XqBi345rUz4N?=
 =?us-ascii?Q?U2QIV5l1AocdufIn9mjqNNSo2PgnjvurbyTHcl220ZUI3Ynnk4TEQpjuat6j?=
 =?us-ascii?Q?zDJRSrIOiQFW41NIiOuLDbBdcfU443lFn2+DiFB6qinkrGkUG5UqTffJ2Ubg?=
 =?us-ascii?Q?DTR5PM96ZNPHRKZ4YKoUmo1KIp56rGLyVX0ONtlIho6uUte9Eb5HOb8aGYSs?=
 =?us-ascii?Q?+VDf4GE5asJWIm9goUuaTRkS4Ud+1AVdrJRu44xSjvvC33oAYhMG6ryk2+fi?=
 =?us-ascii?Q?/BfyOEjg3OAL1AzG9Ca2WZ0U2+ib56JHuIsEHMxgqE1/imBHU2AXGaifXQZB?=
 =?us-ascii?Q?mdAyxFTaRkXU8EGYROZaDIBFL/ZgxLx68VRnLRdz7FPJ2Bi6c2M32PZ3/rhs?=
 =?us-ascii?Q?pHZcoWzoy+6pB2/dS1AVFvnnWEecc1+kPtro+SzvNk3XCAp4PdKXtekR3NHc?=
 =?us-ascii?Q?Nxdk07Gx3bW6cmTkY5reYd6Tnt6o9yyLkdunRZTlv3Vh2EZ4BEyDN4lIAIcC?=
 =?us-ascii?Q?TLPISa6Do+O9OuHHMrEQoQEZogpOQlXP0rLYJz1mGpTDk71262AjHdTkreiw?=
 =?us-ascii?Q?eWSoGeb+3HpceXJj9ZCQzPsczLcIXpF5+vXlIurxeTD+6AdY5rGggTAes7Xs?=
 =?us-ascii?Q?vu9DPMTePAmZhpdosgiEpVJTSji0ga3gEsb3kpYrqPVPCgO/iMC2R1Xzb0C7?=
 =?us-ascii?Q?V4tIaiSda8H5wDJDP+LrZ822pjZOv6d0D4zG2UacXgLUwO4MDGPkkWMFRQuW?=
 =?us-ascii?Q?UfefD5jEMOGASlyXwioY1M+1sU+MzcFRORD5Y0zf1lfyWF72QzytcYGnjMFu?=
 =?us-ascii?Q?NNZ1mmNLmAwAWRyVGCmw3zkXc9SUfbCK30PRcijI?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0462a8-a846-45ac-5c03-08dad3a207a4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 13:43:29.4908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1o8f27o+TLX/wDV/gPLc00mPVlIcQz5+y2yj1x+Kyjvo8qIquenXLsrBfjcTT34l5KyNon+M7QzKJHnBNmYrbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6925
X-Proofpoint-GUID: h0ms6ZWCTE2t4aPviR521cK1TGNFG90u
X-Proofpoint-ORIG-GUID: h0ms6ZWCTE2t4aPviR521cK1TGNFG90u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=998 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212010099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 13:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99886

A native `ssh` client binary is needed when compiling `gvfs` with the
`sftp` option enabled.

Add the native bbclass to openssh, so that openssh-native can be used by
gvfs.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta-gnome/recipes-connectivity/openssh/openssh_%.bbappend | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/openssh/openssh_%.bbappend

diff --git a/meta-gnome/recipes-connectivity/openssh/openssh_%.bbappend b/meta-gnome/recipes-connectivity/openssh/openssh_%.bbappend
new file mode 100644
index 000000000..25dcaa270
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/openssh/openssh_%.bbappend
@@ -0,0 +1,2 @@
+# An ssh native client binary is needed by the gvfs do_configure.
+BBCLASSEXTEND += "native"
-- 
2.38.1


