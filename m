Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6939C433FE
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 06:14:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9036.1640931245830737363
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 22:14:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Ta6gfOJa;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=89994c103b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BV607wn012225
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Dec 2021 06:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=5CXUulWdBsi7B3Jf2pEJXD6LdzPx8aipQwonde+o94I=;
 b=Ta6gfOJajuQyWeq6rToesjb/GKi/CWS3nqzmRAUDfbAaNHQkt/ik9hgYXsyD7Q34f1Oh
 GSVVBi8tG2Lr8WhqV/LB3xZh34jeh4ni2K3W91ILsLXU2Yq9zk8HGyTGVzTUFOTjkS0G
 aRnFeJnL0qpa/UKxK6FwbTIn5axsm26JaWElzSCd1zJLXHwV8gYJCLQI1qXQHfASpsHp
 HeU2TVjF+NSmKmItrrl6GhJtl8SbauDX53Eq113Lh4ryByJ2imkrC3L5VQ/MEuPNJ+pk
 8pkTlQ6plIAIbUGjMwnNuksF7V26bIshghsMiI8vZVgZyzqwNBFm+L//KzWaconuETq8 dQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d8yayrsdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Dec 2021 06:14:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JF0xaYa/6qjJoV/AmAfuUHP3pWdThNsYIYf3GRlhECE/9XNnUA3Axf657QMtofdT8N96Cq7svKx8d3t6PtwQum9iLpb51TcCKVFPts1ikMKiVbDGWRHrB+aUyvv7KZqc/dJcxycvyKZr3ud2jnpk0Y0LfVkgbJiY71V16T5vWwJ7h1qRjY/uOUnYWvqKKmHNw78rSIaFjmqrx+vdxroVE88H4bdpkEsty1nBQiYNoJLDr3vOcBYTrdx0PD4s6bBZo8thcr1+Lpo5N/I81HjbCGAKX1q1shCVBb+7IMgWF9y+lloH5sBrod+RgSCst0RHGWlkj9IxCiIkEp2ly9nWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CXUulWdBsi7B3Jf2pEJXD6LdzPx8aipQwonde+o94I=;
 b=X1o9YOV3g4q9MYZfTQgGVj0vKXR0jtdOG3Dige/rVCL37KoFqkE2eq7PEZ9fzsvsIZZ0CVkQXOGOw9LeTF7ZGiZSgnbme4EanybTFtxsydbKVEg2k9AO+I5axMsab9C4MxPcVaazN++hTl8fmtW8CpkKE2CQBKa5aYmzZO/5oSaL45ceK+kaSkkkWlWtDx4F1jYvwb39CSxvLc28ahqzJUSCkzxNH8t99SOLkgid67czI8tbY3Tr+82TlxOa9nWR43fcepzg153QaHHUhgan9FAkzwuXKvAzMfh2ASk3h9nFjq4bZpUMLT9RrbwRiOJLSdCKpASzFmZU/Qggqt6TBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Fri, 31 Dec
 2021 06:14:03 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%5]) with mapi id 15.20.4844.014; Fri, 31 Dec 2021
 06:14:03 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] ndctl: add UPSTREAM_CHECK_GITTAGREGEX
Date: Fri, 31 Dec 2021 14:13:50 +0800
Message-Id: <20211231061350.1166984-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211231061350.1166984-1-yi.zhao@windriver.com>
References: <20211231061350.1166984-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0195.apcprd02.prod.outlook.com
 (2603:1096:201:21::31) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 864c34a0-cc99-4193-40c5-08d9cc24be1d
X-MS-TrafficTypeDiagnostic: CO1PR11MB4804:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4804F682343454E303EF06EEF9469@CO1PR11MB4804.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J+x81wifYBmYC6tZgye9DOvrnPt9NYhXMKcQGXh53qPaPYTnwYhZ70pwSPkPfNrEVBZewRfuV2trYYPyENobutkJ0F3/64A3aOlSNXsdpMfuarmW2xQ7jtWEP2PLu/DV/OjgrS9wAfZiBe/PzDdeW0xBODqPZjkgZInnSeXDGQHdIGcnql0CwQPO48Kj0fRXlGwv2qfLgcCAR+7ZYiT6X20Y8HvlAGjtWXJh+IllrpfP8MdHUY5M7gyaDNohFphsefPmAM44xGGbd8VxJGtbXVpYsN1qLkcPZJQozlaU1lXoF0JHaLPr6/QUOQOz6InfFj01EOqDpXAdr/v96kpJDDVprC8NrMvZmjs43W5mZNWRJwpHuLi77D6b8rY49Eh+o5Lwz9nGUYd5mQX4shHwcYcsZcy5J9AA3ivHhecExEYG4AIjypck3NdCzDSpiCfbatZ/cXvqKFtMXEtc3EU7sbkVR2JeYMISRTI3Fz7nUgtVTZ3v0xq8JOMrAYON9NgQS+Ti69mPdS8kZbV3zw3opHdgobCcZM6HcyW3C4SSyH8iWxjE8nnF2jCzcVGUBjGXsyU4YOSKex1dah89fp3okDARuVaT9bf2e2l6fquxneWqmyP++2rWl0vNcy4BqJ3ioCUS/TNNSDLRdsGW/Uollf0O3UqpKnJ/Ou5m4VbSrvvZdK4FEzzYAJ8U1zAr9wzdw2OZRW72V4V4YcypTzEZ/w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(316002)(508600001)(2616005)(2906002)(36756003)(8676002)(6666004)(66946007)(26005)(38350700002)(6512007)(44832011)(52116002)(5660300002)(1076003)(186003)(6486002)(66476007)(66556008)(38100700002)(6506007)(8936002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S3WluR/MGAU6BFftb3n9AZbUGEieiipgqyaLEnujTnKtO3lbmdeb7NePHOp7?=
 =?us-ascii?Q?0/9Q/LlCj98WmSM7VKnxzmcDHdq7WkCQ/5SlrbYznrJQi8yjcY50iOtjtfYg?=
 =?us-ascii?Q?YF7fye5gWYqduuHekS/HjHRDqg2KFFQH4lHOy4a3wsCJQYr3TKMVOaY050YR?=
 =?us-ascii?Q?La07tepWYRKj+KVJnJnyHPVpSQJefRA1w7Ww+Jt2dJ6t2z1ofpdl4ktmvcv7?=
 =?us-ascii?Q?AEEcBO2ejZEeMnp1qUioGtI7HwcVBlrWTnKfARTljSqwJx7j8herfMMoQ/TP?=
 =?us-ascii?Q?pZThLJMMP426Qreh8uN3J1j9Y+nEsm/UNhMRF1v+tj3z6P/nuWEYQz33z4n1?=
 =?us-ascii?Q?4J9357EZB014LHyXRY0PFsCryOSFGH0MrsB9ON+Qn08B0vbrHn2Y2ASVNAWy?=
 =?us-ascii?Q?hdyKq7bIVjOL6p4nWl/q6CFSvqWDwQqmxrS7VDwidiiJ1DziBXAFfUz3mkdD?=
 =?us-ascii?Q?tGOZNnkvR5Z8an5HHiNpHA3R568SagoM/cSCSQHxzFmZ+txDOAeX3DY9/R7U?=
 =?us-ascii?Q?DaftMVCsB5h23/rxt9zlEB5v2HBUi8pvMOtsdAA8k7QhcT/YoObgdbpB8j3L?=
 =?us-ascii?Q?AOQVbaIOyaGHjsUITq2dl+IeyhR/67zV4T5MXBqVKuRhDjUgKwSSIo4C5G/Z?=
 =?us-ascii?Q?cFxHsMhrsbe/rgz6tam60Vs7mSu1rRNV7Rz2vySbsgDmNtrI5TLuhgJDb+2L?=
 =?us-ascii?Q?4wMwN8jGVvJbxh/2anMoJiA4tsJdbrbSu1fOqGLFtg6/SwcPK1NsLCjCPc7q?=
 =?us-ascii?Q?jPqKpwx2/LGEz8/dMKQK9eZEb/sL9AAGLZXhMp9EjXWqyWtCVXvR7dTXeGyp?=
 =?us-ascii?Q?1elBounwtMukunRaIyEkbKZ11EqQekpuR0/Ns4LKCad8rLuFBz1hzfSfUE3Z?=
 =?us-ascii?Q?fXD7c2bKpmlohh+ehD6muliFWSshQ2pyoVAtKKivaKJ+hZMfcVZsLBsraG97?=
 =?us-ascii?Q?bMCfdJAZhV8J05NZzpquWkTcCAxAHhyYwA6xSiFMKAIKmesVhdxhfmtnciF6?=
 =?us-ascii?Q?E2NbwpehvgVY9tpldJvieWOame4vkyMcx6bStSHV3lYg76P+RTn/ZOJk/ntQ?=
 =?us-ascii?Q?HsAXI/h1diAeVtaZDWvY7pjSUmwjEM0Bukp8+a4oR68sVglR8mzGJWUcSeeW?=
 =?us-ascii?Q?FRiDlrV1ayf48x5ofSfhI7gOpbNbfi2V8RvuPSQD9cV7C4Bg9KOHdEH8ukVg?=
 =?us-ascii?Q?wls7Y+ISh4NKrAIq58gC/vBqwH26o3rFdrjEyjzBqjT9iRJ9XHwFjuNf6zMc?=
 =?us-ascii?Q?R7rJoEPy9vrLo7VzvmRQJ7FX0YpjVXwMu7jNeLXEpbmA1HbuyZKOUmM81KV/?=
 =?us-ascii?Q?zlDARVAGckZXpeR3aUjquvrU+eJsvPURQzD3mqXptuxbvbBqeiTSy9utYQ3c?=
 =?us-ascii?Q?p/Ikei02dLbfd87pb1bEnXz/FcLyHvsPWE9yHXnKpvoowX1cB6VXsDq6S3PX?=
 =?us-ascii?Q?ihrdXz1LcpptQ0RV/uq9/d2MzKJh2uoxfqkHBzjeNSuus0+kJIa9HVp4ehxa?=
 =?us-ascii?Q?XbWUh5tJoslZ/5YAfiQBfoy1wXTBG9pSZExWcbT+LI5ckZBMEtplPss/v0y3?=
 =?us-ascii?Q?5fPmORN76OJvtxb1Sa2wZJEjQ7k2wo3qhtqWrao7hvjY4aIISERwLL2gtQ8T?=
 =?us-ascii?Q?pyTOTIFsv1MeTn/AFwGl/t4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 864c34a0-cc99-4193-40c5-08d9cc24be1d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2021 06:14:03.3219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JxqLlxPlt3QCppsEwDBsqyOeMs8zo3+OAg0drATp5cVUHwtRxSxyrCwE67lVByFjarXzcdIJ98GueDbcXKBkqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
X-Proofpoint-ORIG-GUID: XDdEAGRj176_ZAUSvtGGfemo08qFVQk2
X-Proofpoint-GUID: XDdEAGRj176_ZAUSvtGGfemo08qFVQk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-31_02,2021-12-30_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=642
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112310030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Dec 2021 06:14:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94580

Add UPSTREAM_CHECK_GITTAGREGEX to check the correct latest version.

Before the patch:
$ devtool latest-version ndctl
INFO: Current version: v69
INFO: Latest version: 20150514
INFO: Latest version's commit: b6c7999a9f0115bac0d55f0d278674b03b0dd19e

After the patch:
$ devtool latest-version ndctl
INFO: Current version: v69
INFO: Latest version: v72
INFO: Latest version's commit: 25062cf34c70012f5d42ce1fef7e2dc129807c10

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-core/ndctl/ndctl_v69.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_v69.bb b/meta-oe/recipes-core/ndctl/ndctl_v69.bb
index 0490b8fb6..b848ca63c 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v69.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v69.bb
@@ -13,6 +13,8 @@ inherit autotools-brokensep pkgconfig bash-completion systemd
 SRCREV = "ea62d6d53bf6f806c4841e97a370201e18446860"
 SRC_URI = "git://github.com/pmem/ndctl.git;branch=master;protocol=https"
 
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>v\d+(\.\d+)*)"
+
 DEPENDS = "kmod udev json-c keyutils"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


