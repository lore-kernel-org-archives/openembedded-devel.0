Return-Path: <liwei.song@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3DBC433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:38:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.6006.1633678697189956369
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LJNcloFC;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=59158e485e=liwei.song@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1987QKo1015186
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Oct 2021 07:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=11zKeGZfU+QO6ytNciB+/FdZPdkmxapwKkCE4RBehhw=;
 b=LJNcloFC7ZxRHG202+WW3ckvQg7FjWu+vUqDwfzP+xqL/OqCjRSwrjW4Oj7hSZmaB6n3
 eYiofIRPt0XjQZiYVcQLMUZct/xmXzZX989dC+kc8zOiSPQaoN1jS6xs4EuErn6cUcn2
 RdARS2puAqGYxnsI9Iuyra2IS3vlKW1P3F6JbrnjaS7NVskG33OGqAliJ2YwUSr9V/Vh
 uAgvd15+1NHgbMK7FcckF2a7P6Uj2zfnfmFDiFZ8eIXaHBmcoofrtbBFrjXGjK6ZD7YY
 +SJ84Jib7YksQ5aAxejZC7z5aRoYkh4w6UCvzBLw/BRneH8VYgqWclPcBqGEbd7mPm0L Qg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bj9sdgak0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Oct 2021 07:38:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCYg94LaaYeBM6rbtmmouos2QTvlgOjrPtaOykM4YGXs4/krqHpMQ1GwQ5hst064OG8Q3sewf0NU6C7TfD0itRc45d7WnAXQeK9mGSKcTkwxdJ5Y4l11XzYsqQrxx9aAWC84BiZGf9MKS9WOydskSrtijo9dkb7bT10GBM4FtcilBR8rgt+/RkIiG+sou8ulhCHM1ISx2TbnXn+lSx9QOsA49RtmraP1qY0FqSs0IF3H1paG3qWsONSTcT7uhflZ6bZYM+eX3kYi1rwcAgmmKVpnoyG3rjU7HjYp8cgQUH4yRc/Mq9l8Sf3u6yiGC/rXQoD07ZEE0BliQmrodyPaSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11zKeGZfU+QO6ytNciB+/FdZPdkmxapwKkCE4RBehhw=;
 b=NaxOBFFs6d01j+UjQys4ObBvAlNqHta7B2WAm6cbzvxqqhTtXijcHdGVPN5QvONPEPD30SDL66m919vqcjOtgUAUzq53Y1sBsvyKHh/whrqOSrZqF9FKOLOR7lsSxBNmlSvp/qHFkfXugvZ2SzBUOsbuOauFJBHX72pW+DGq0Vyf0vI4SgpAJ13T/SFsI2V5yoYfanJQ69xAuBd8YUVOarwAQDrI7oeepGL/DovgBZ/cP2JhKyHFdLB7GW1FdfDWvoqW4v1jSqdAcIarhcb+B78pLzDaMTYmSO70Alqlhy6Zen3tkKFwRlCf3P+BRIDSrwf+2UYJW2LTSnu3AWxvZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19)
 by DM5PR11MB1404.namprd11.prod.outlook.com (2603:10b6:3:c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18; Fri, 8 Oct 2021 07:38:14 +0000
Received: from DM4PR11MB5310.namprd11.prod.outlook.com
 ([fe80::70bb:93b4:42d0:4fb8]) by DM4PR11MB5310.namprd11.prod.outlook.com
 ([fe80::70bb:93b4:42d0:4fb8%7]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:38:14 +0000
From: Liwei Song <liwei.song@windriver.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: liwei.song@windriver.com
Subject: [oe][meta-oe][PATCH] Revert "chipsec: platform security assessment
 framework"
Date: Fri,  8 Oct 2021 15:38:01 +0800
Message-Id: <20211008073801.4678-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0022.apcprd03.prod.outlook.com
 (2603:1096:202::32) To DM4PR11MB5310.namprd11.prod.outlook.com
 (2603:10b6:5:391::19)
MIME-Version: 1.0
Received: from pek-lpggp3.wrs.com (60.247.85.82) by
 HK2PR0302CA0022.apcprd03.prod.outlook.com (2603:1096:202::32) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.5 via Frontend
 Transport; Fri, 8 Oct 2021 07:38:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06a7279b-6dab-487a-d934-08d98a2e9644
X-MS-TrafficTypeDiagnostic: DM5PR11MB1404:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB140441A5257FD5B58A55D37F9EB29@DM5PR11MB1404.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8qFb8WwdUYIdo71suxO2dCl0rj2Eu+MKwemSBjl4UFGnWzp44caZ0YeVxY5nCJtD9Dp40GEWB7B7j57mu850UluMMd9zVYikjhZRfuAIZfq/D0MRv8+gtTPRLSPGzeiX2f0HKAky87lZWTPTdPuxKmY/c3FLRw7FeV3VeCY82inBHWBVpiJi/fqmlGnToUhcjDGE7+qKfzamkY+YqwNb4/3eqjpVbZD3NWcXDbjoa/xlHY+WNBNQDWEDuOjShYgFcCAcdlaB80to1JrY+R5IBE9tPPxAIcgBVAaLZAE+h2jXKGgiVveNfKQRQ1ssY5vwWSOBHpWgjJD/BtgOyLxEsGRbP8msftMHKJyX0FH+IfN3nShq0GcAGjBrv5Iz+ixwPVm5gQBRl71Ea+4EDAF3OILv5+sFClIkiHWVocOxQjIordRD+O2e48YoEV9+FDyjx3350VpLuXMGS5kBCUoEMcqVMF9kSHorPupfRZYqQb5l37b29Bb+ePEIwoVBnFQA1YI9TRAwd5XyN+tAIBxTeKpX7nsG0l8Z3KtprLq3knejwrIIyUVgVRAJG+955BjH132Bnmk1yTv9TkiuOArWykIJBlkaIwZIq/LqVA2j7ZyYAkG9UPCGxBHTwrJm+txo5WS9xgetTBmCwTXLqcVT9x+yG7Fd4yz2yBtjXwXwsZSmQYDh7vPH4q/GwAlo/chN+7GE/v8O7eYUWxDmNyu2LA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5310.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(956004)(508600001)(86362001)(2616005)(5660300002)(6916009)(2906002)(4326008)(44832011)(83380400001)(52116002)(38100700002)(38350700002)(6486002)(15650500001)(107886003)(8936002)(316002)(1076003)(186003)(8676002)(6506007)(66476007)(66946007)(66556008)(6666004)(36756003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SVv3/FRu+nJRaGYb/TRCk/gKXTGMWBkQ/YiumHkgi4nFl6wKwLlOrhpMIep5?=
 =?us-ascii?Q?bRskBD5PEV5IGdTeurbzyeK3b2NYWhk3IPkkwtOc9QwDIBE2wQ3RVs8TAWzo?=
 =?us-ascii?Q?dkQXeh7SXqPitAgsS/oM+bDKCPnSMiVWhxjdWT9oukHahczyZTxv9i2aWDoh?=
 =?us-ascii?Q?d8tv940/0cGKFVMrLt44jGcYJGJLU3Yy/I/2+ejiHxoaIb/0pbs1xMfFqFoV?=
 =?us-ascii?Q?SqlurzFeV/n90zMv8Bi2VUsPZUGbEBvzZ2Q4ZFp7blNEgue6yiRab+qRYKdA?=
 =?us-ascii?Q?xf1VoVPndVdPKcQ0opFkoBCkARJ4g00sDcg3Vb5ISGchxxtb0A2VTx/hNhQ9?=
 =?us-ascii?Q?rlDv3Bk9ELcJGzZnm/z9GxhHLGbzZDGgEsq2ZbffpCXxC665ux70RjsomNcM?=
 =?us-ascii?Q?k1hy97fDbFtbktu5fu0xSyE+1UpVJDdgo2cQ2A8IiFUL4ihtH0QJFlrPB65S?=
 =?us-ascii?Q?h9FWg+jFsoUh79CfWkmpiNy8q7I4HcsBB3nN7GX6M8dIbQSyF6syRB+Yr/Xe?=
 =?us-ascii?Q?r3lcEWmFaM/KNMBPAKYAfK+S1bjFGdMdJzCllzdwvEPH7fyTGGlVg0DqNzCt?=
 =?us-ascii?Q?nDZtKsS/eNwsJCIKKOXh62qV3lqm0RT6wHg587YFVRUcFZY0qn4NKfJGYfIY?=
 =?us-ascii?Q?nZOMm+da2BdFhcTpG7jxdgSNRI91IQ+HJQ+MvE6Ek4tDS+jTcpHMXD2l3BM9?=
 =?us-ascii?Q?HWdmK4TkhuMvsWAniI6bBpFD2dl2vcuAdZFMKTCTHIDZzQf34lcufhZXeSCB?=
 =?us-ascii?Q?oDriHfQwzXcQVfvyGOZrrIWePH11sxmkUbFiwI0nafsm5UQtNQhfFisNPMLv?=
 =?us-ascii?Q?kcspoJ3PeZCd4NPLzG9RNs1Ac8d6an68kfox/z29j5QUT6uc8Z2ZTaifoo9d?=
 =?us-ascii?Q?tXBVmroo44tNWvNaFJptN6KZ6NFjPUyBmGNY5PJDwXi577yu7l3sWr56gxWc?=
 =?us-ascii?Q?EN+ERQzeYciGNzdXuEv28lwOZLJfcD39cW9PMMDltaFbONYUwI78k3raUeCe?=
 =?us-ascii?Q?hOOWPRG4oDDP7oHyRrRt9O0DbyuTZ0HoehjTHFy2OATVEQbqwxh/dMuFyhM0?=
 =?us-ascii?Q?SZS330iLrINQJkSB92wYz90ngizG19VmEyRGr1ZlO7FlusHyqHCcxbokk3Su?=
 =?us-ascii?Q?/seh5X0qI59Lnw0PyD98hDCFrAH4OM3o5b5h6N2r02TM/XhY/d1bdPkMgOSU?=
 =?us-ascii?Q?zwMaaJ2muL0xbi63unqRmAa4soCRNWhgq3UAZRGA2AMcrW+erBoK+vzbPbqg?=
 =?us-ascii?Q?a/hcBEj0jZyL6vlcWvitPd9s3pvLDpSHR9zx+1wqOKvOrpX2uNXaI1X9OjXR?=
 =?us-ascii?Q?QPY1Y4/MlMPUFwR6+OOclGQd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 06a7279b-6dab-487a-d934-08d98a2e9644
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5310.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:38:14.4854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 h4hxVgvAG2kWW/iydnw/7QXdQsy4yEcmzLu+nrW2RvVc0B0ot0ZdY7bhREIJ43iqNqSPscNozo14cKj3tfUCTF1tcaUaNb6QwQW6Gfr/eFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1404
X-Proofpoint-GUID: XjFmkLW0_o1HOx240x_wUZnTlVT-Kmc1
X-Proofpoint-ORIG-GUID: XjFmkLW0_o1HOx240x_wUZnTlVT-Kmc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_02,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110080045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Oct 2021 07:38:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93206

This reverts commit ae1705aad57a80a1122ebef117ea689d7307171f.

move chipsec to meta-security.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta-oe/recipes-bsp/chipsec/chipsec_git.bb | 35 ----------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/chipsec/chipsec_git.bb

diff --git a/meta-oe/recipes-bsp/chipsec/chipsec_git.bb b/meta-oe/recipes-bsp/chipsec/chipsec_git.bb
deleted file mode 100644
index 3339dc142107..000000000000
--- a/meta-oe/recipes-bsp/chipsec/chipsec_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "CHIPSEC: Platform Security Assessment Framework"
-
-DESCRIPTION = "CHIPSEC is a framework for analyzing the security \
-               of PC platforms including hardware, system firmware \
-               (BIOS/UEFI), and platform components."
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bc2d1f9b427be5fb63f6af9da56f7c5d"
-
-SRC_URI = "git://github.com/chipsec/chipsec.git;branch=master \
-          "
-
-SRCREV = "b2a61684826dc8b9f622a844a40efea579cd7e7d"
-
-COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
-
-S = "${WORKDIR}/git"
-EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
-
-DEPENDS = "virtual/kernel nasm-native python3-setuptools-native"
-RDEPENDS:${PN} += "python3 python3-modules"
-
-inherit module distutils3
-
-do_compile:append() {
-	cd ${S}/drivers/linux
-	oe_runmake  KSRC=${STAGING_KERNEL_BUILDDIR}
-}
-
-do_install:append() {
-	install -m 0644 ${S}/drivers/linux/chipsec.ko ${D}${PYTHON_SITEPACKAGES_DIR}/chipsec/helper/linux
-}
-
-FILES:${PN} += "${exec_prefix} \
-"
-- 
2.17.1


