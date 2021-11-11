Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF2EC433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 15:14:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.800.1636643672153396273
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Nov 2021 07:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WpON60Dp;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6949a4c0fc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1ABEpl3m021341
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Nov 2021 07:14:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=0P9cSaRZCLG7MfC/Q+HI0IxzR5pmZAyunMiLc9kAQ3E=;
 b=WpON60DpwJXdJN6sbKdmqNTVjXAMCJOd9hn96jaIonH5spFZj+SF0wzu+7G/n+j8vtAG
 yFnr31bPZuPGDM5eNGLEXjrmGxOl7ft7XRh0ks3gttTLQc/L1QtNimDCsV1emn6I7f9w
 U1vTm7+j8ZNvHyIzNcdwER6TJ0qJzPC+Gg8EsNttque5WVaIIoz/7rvdKZnWbwitPiIZ
 gfzAbB5kk6CTmgGLefMVPgKZ+Snqtd/TEzuiz3wf2rbVTx8Q/qoRQ860ZOO/s7NyW+Ju
 hEOnhQTL4UxWqeAvxumf3V9EQQ51m9ounYwqNOvKbzTjs4UgrguRGpDWU64ziv5XSLXf FQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c80d3hv50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Nov 2021 07:14:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/WKNQumKF65d+LIDVvjswCSWXdbo1U0kwyDrMlgXB0EbGEnqKw+/NMiipLfQ93ihUJxDl9bB04yZ81ZDxIbkmw3CX9O+FPtEmh0O3sI8TbY3EL/KFmmvg3cNUSdwoqzg00/fRrLbFxyDCJHBGjDJhOXq0eEN0278rNcdsRuf4wA6+UHKkaujL9zdlqtIs1VqbtmO7X4CCW+XcXHeAPjguJ3DeJUNI+2dGgpjm0c+74KfIsRmC70a2/EneqECUI2VRvJ7TCTwbuebHVaiHKjKOEvgR8/WkRYc0BUBtqwRlIa1HG8X3zGCEYjbd24zxGdzf9G/1JNfQxy/BLKiOeHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0P9cSaRZCLG7MfC/Q+HI0IxzR5pmZAyunMiLc9kAQ3E=;
 b=ZmqFAVCA3bdD4rUAeNU4dOdLap8v7mZVsBQoUoCsLdK3cyNQRLe8PvlWdU8AMK5n3YQpH7mB1J5sAvANoTBro8Wxj1GuYVX68+dakSE9je6wT7qSL+uPNaQwHxaXg03gxdrVR+psk+Ot58gvxL8C4kSBHSmnWOpl9FFjm7d/346hHXg81soZKy9/uE/mLkWNpmupTNUAVSlP9JOok1x+7BH2j2Lj9xaGaXUBhgS2hI0bTRGRuMtBxmXaH/WI59iduGbyXzKs2aHKZYGf902s7OouE81a8b99h0khwIsfJfjztXjuxwsouE2m36CoiP8MCCF3s5W9pj6vawzCxzArrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1311.namprd11.prod.outlook.com (2603:10b6:300:2a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Thu, 11 Nov
 2021 15:14:30 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4690.020; Thu, 11 Nov 2021
 15:14:28 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] strongswan: add required kernel modules to
 RRECOMMENDS
Date: Thu, 11 Nov 2021 23:14:17 +0800
Message-Id: <20211111151417.171944-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0067.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::31) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK0PR01CA0067.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13 via Frontend
 Transport; Thu, 11 Nov 2021 15:14:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32a607bc-acdf-4aa2-4ae7-08d9a525f43a
X-MS-TrafficTypeDiagnostic: MWHPR11MB1311:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1311F15A7946647C28CEB495F9949@MWHPR11MB1311.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XyKaTDZOOo7BPfrIzoV2feBz0UwSSjfRpA1CCBGNK94F1XH1/CY+b7lhyNvRDm7I/hrtJ282Bjgg3eiskkRb6xDhd57eYKll9MSVn04Oqlxg3gkjIYVefDMoyUMF1OkEUPwsXvGd/4xmklhr/by7SSa0//WSLgzqwqakBIfwR012pX2Am16/I+sWlzdWvAvR8dsAruaVYMARyslYsYdrRu98drj4xToIFrYPcHQZ4yqk5DDz565q87bBZykJwfsLPRUgxAh9mqfGHTZ192YnkcGVXV6ehW/8tqzZ9E2OmUw5o6sWmp1vpbAVEBB4SFqdPtatWdi/l9bmFmxDWQAZvEbyOkpFSz6MiXjeVKKrcEGj3F1zi1NJw/iNLG4jOq2TAYEawZsUKLedOFpJBnD2wAJlW2eC3aqk9oXX2aajvmmaBnIQnRCRyZrkmvgpU9C3REWa9D5x0qZm4I7CswKjU9xXFoTlA7e1hernRZXbaf9ceACFztFHiJgxTc510o4C3EtBdnIaw9jgHbqR31bhiaoiAi5V40e2imKT04dyro4SkN2uZSfvH74789MWhGBFiC0TvjalkQUrhpsVYN3ktn5Ajls6wXOL0Fsfbw+2MKxFKxIKb7dGcE6tZTsiOABf5zSpAYFJv7bqvtWRT7r5YS2jrVR1+rP4cyPS65vdiV1FaJqfdqFf8lvxKB4LdBgq9HjMBgveCWtItl+upzok/XOZv9RS46cOXvUZkjszXtgO51j21WQHSnrJ0r5AeVvELzEfXt4eyJZ8IS7uFofaae8PHQATBxdAUPdAbDy/8No=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(5660300002)(52116002)(83380400001)(66556008)(6506007)(8936002)(508600001)(2906002)(66946007)(2616005)(8676002)(316002)(44832011)(186003)(6666004)(956004)(1076003)(38350700002)(6916009)(38100700002)(966005)(6486002)(6512007)(86362001)(36756003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jke5LuZc1mJTuKVZCRl6eyJHcNK9kPYI4YZ5rn+iUKcP/IKAkCO9iMJiKZEA?=
 =?us-ascii?Q?hncZGko2Z7DoFOi0taxmtIIM+GrFnc5w4QYaCjI/P2LxcQXwQEwDnmNnyOQe?=
 =?us-ascii?Q?SvNDNEgchK/YIYw61+nn2ut6FeDtGM0hddY4MgkcI2dL7sOeVa1CKP+F8hNb?=
 =?us-ascii?Q?tKzrtDR+OiGbJnAIv0Cj0mh/tQQltaSiMFb0GpYfnTc0HxndbIKKJikwgFQr?=
 =?us-ascii?Q?SP7SXw1OJlLHTpy3sm+jQBM51WzODSag4OP0MsC4ijTqV7211NKNYFSgVE2I?=
 =?us-ascii?Q?+7lxAUK4ksH2BysbcJZuFXzpcWJZjtUbtWDLeLDuJq8cRlfAXOnYhKvfydMQ?=
 =?us-ascii?Q?0OJ3ecaAye5H1lghG5Ow9ozKj4UMPZwpMF25+fmmvGXO/zTqTR+szakXncw2?=
 =?us-ascii?Q?3Du2dUimIUZxkdu3x5wmUejV27RxvAWRQkOdSrxI1lLdRrjHgTZu5nAyPGCe?=
 =?us-ascii?Q?kiomXLrT9HFv6nSk2LVnUe8aEtLt3ex4gtxC/XHE2Gla6P2ZdIeSWuPjhJPO?=
 =?us-ascii?Q?byHXlW8S6U/TsvvQ0GyWN7xMvvEEORI2HsdubMkj23QCrWEuL6ozgoHbAThZ?=
 =?us-ascii?Q?E4gwHT6Lrz4bRHaogf3MMJzcyCExrL3NXkQaNJEVHttH31vlRFnl09cMRSTf?=
 =?us-ascii?Q?WHi1KEHtvJuZ3ggM2mAahnA34J7lj694ofzyYMsHUuH8hA0SW+wDgf40GSPf?=
 =?us-ascii?Q?+yO/sBP8jkDbsdxbMZroZRkd5BEyo1bw+7GDn5+YddAdMfP2Sc/scaRDvl8N?=
 =?us-ascii?Q?KoZojHgxM/hqwmHzTlXefoymPN4qNEt6aGgFvAAnYtlpgATDkya0Seh0dw/S?=
 =?us-ascii?Q?GWBj21xWrHvWCM9lDBx9nfxYTxFx+Ac6E0UvkJgdtBCXsHktPWwf2oMUNiPf?=
 =?us-ascii?Q?TMLC/iDfF+NMsqON7hIE5tXzBYDFvU3tBhIU7+8xmxNP3uuokJFEjd+foSBF?=
 =?us-ascii?Q?bb+PkhHFXwlIXmNco/IioS9nWtt3cSt4WEmu0+H7yDfvzoLZ7mbINrj/7caW?=
 =?us-ascii?Q?JPcnUpyvLIYtbGtNHs36ISGBJNSXQ9c/bAJfLwE/6VaHIvDkcVfareIg3hLS?=
 =?us-ascii?Q?qq1MdXJUlKx0ch99g/IqAqW1okVXT4B5jnGf+34hAPTwYorQsef8QSEq6f5u?=
 =?us-ascii?Q?vbS69VWU4rRyOeW0K1Y/J2mmltsUhvDik4V2s2nZDVF7zVrMwc5WM/2S6P8R?=
 =?us-ascii?Q?GL+XC2hVwygmQo0/8GvNI2NIgokCjylCQSATljXp8r0Kk0qYfj6LumQETNtP?=
 =?us-ascii?Q?IZtqjF3gMaFPlFEaY73YMt6nKbP1ffZPkv8EM0c/GelEqRNZk7ey2teaD0q/?=
 =?us-ascii?Q?P4zD0xhzpt4a4+dzWOe5cuWUrDeuiNItWp/0ITWOgRh/u8ol/dJ3Ip13Mvm9?=
 =?us-ascii?Q?Su7sf0fkrOYHbBfkOe1/nIofLLj9YoF4NTAnRmd0JdY6NXgxdf4/oHkX12gD?=
 =?us-ascii?Q?CboXMkZgEHBhYPwmOu+FOE/KoZnCKNRS1EDsvRoNtbGyYumXRm/uuC3JBIfZ?=
 =?us-ascii?Q?GywCTxgo2OV/jmiOBRZoyTjr3Hu04I2PmhHtzUBX4dUGzb35ROwxiDLx/gcP?=
 =?us-ascii?Q?x5CPKbLRfUDnNRha5AcUesO7e5oMgKsrUBEJ0Q0KO019ZO2e9f54rkTCTnOj?=
 =?us-ascii?Q?nnakhE86Ow636YvIT0LBbIM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 32a607bc-acdf-4aa2-4ae7-08d9a525f43a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 15:14:28.2227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LBfq3OSPqKUzbYnkEDuHuDb7ngvXpue6N9rZIPxqTvM54lGCCWFr8Kcg3xz6ZJBYTcAFct2wGn1LC+rSu28mIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1311
X-Proofpoint-GUID: CTLtcIFyo2OP6O7ME7fsrAyH107uVfoW
X-Proofpoint-ORIG-GUID: CTLtcIFyo2OP6O7ME7fsrAyH107uVfoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_04,2021-11-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=756
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111110085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Nov 2021 15:14:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93908

Strongswan failed to startup because there is no kernel module named
ipsec. Add basic kernel modules required by strongswan per [1].

[1] https://wiki.strongswan.org/projects/strongswan/wiki/KernelModules,

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-support/strongswan/strongswan_5.9.4.bb           | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
index cbc263d30..45500df01 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
@@ -47,7 +47,10 @@ PACKAGECONFIG[systemd-charon] = "--enable-systemd,--disable-systemd,systemd,"
 
 inherit autotools systemd pkgconfig
 
-RRECOMMENDS:${PN} = "kernel-module-ipsec"
+RRECOMMENDS:${PN} = "kernel-module-ah4 \
+                     kernel-module-esp4 \
+                     kernel-module-xfrm-user \
+                    "
 
 FILES:${PN} += "${libdir}/ipsec/lib*${SOLIBS}"
 FILES:${PN}-dbg += "${bindir}/.debug ${sbindir}/.debug ${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
-- 
2.25.1


