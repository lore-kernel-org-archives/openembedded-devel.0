Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9FEEB1076
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 05:07:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13760.1773205629965865168
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 22:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=G01cHCPN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7530e974aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B1p92a2435337
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 22:07:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JYSUaK8clMWb2Mdj1pABIaZzmiBUt4xCpVYlOSqTh5Y=; b=
	G01cHCPN+R8szkhfoJegqj3CwpsrAjM4rQ0ILl3SBShb4WQwbg+k8IuUn/ZzMOAT
	2KKFof3Jtr3oeAhPw0MjuG0SjouSmSev9gg9Nn7xUYAEwQYBbhfAf+/KzBzfLZPh
	4rpwxMXnqdFLBU/dg4DEjG1CHlqnY4xFBlXGrxUXtxsaGt8IfrN3euu9uUnpZg7u
	+qT5nAm9UMD3d2TAPMRv7jm1hlgcziaa87iKpMUxtb0TIbxLRHc1VurjrQvTRBMG
	/HJnzCaRf4T8Sn1wXCIPsBL9amGAGg+ox7qrGk2tvL3am+P7fIxtRzG0e0QknogB
	Sl2TtuMea1KLFFrZCJMx8g==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty3j04uh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 22:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1mXz3/RzoJqEu1U0V3C0kBYuubWPvnsb/aG7I5vSEf0TWmpN3ONjqduR8+KJBQJIYFzW3Eg6OeXG5+gq2RQc43VOSawiayMgxczpPNbKM3ClV3DNpPaF0f2HeBJtbbwDMaoWVkBPY6XaImtB/2jzebpkL6zYH5oOd6h2Ypt+MDn/z7kmLrr6y5ROY1Py5aOK6a24W3CXFcnPAWPFU+YgpSw68Efu2pEn/9knoG5ZCv6KxmNiiBlL2fbnn4ziLsaFYqW2KSS06e/JxOf32I1/M8BLvJ0WRwVnbOcBIKmO5crLhQcpL08ZDuXqOHDQbysqmVNdZskd5lIC4xBDojSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYSUaK8clMWb2Mdj1pABIaZzmiBUt4xCpVYlOSqTh5Y=;
 b=vpxMU74ahdrwybP1GXX8RYg9zkVwZb39Tm0vAhjlarJKQ6vi2KwdqRRycTheRQuvteEmffYlQzKs898tZAqy9gGbj5z2PLCP0NLMXcC8PgL+PVnI7UPCvL93SupuRocF7J2Y+jaXuaMk/88rO4/pakfBmBPoRRvjm9fJR8jdKRjYio5f4TeJLViRdUv6aFtqFPkiIxR3K/KDJT8rkFtr4sL5DNJ3G3wwTkLIpEK2mgNmraTguubdO1BcJ0SNz2zJ1WU4tA1P2RN2MkK0hhvovazthj9fVwzqxYPWNzxbFG8L+mT2Qrnvj796ih4lm8xAfzel6a0npDWryv24VeiNrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Wed, 11 Mar
 2026 05:07:07 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 05:07:07 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: f_l_k@t-online.de
Subject: [meta-xfce][PATCH 8/8] thunar-plugin.bbclass: add x11 to REQUIRED_DISTRO_FEATURES
Date: Wed, 11 Mar 2026 13:05:56 +0800
Message-Id: <20260311050556.2079418-8-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311050556.2079418-1-changqing.li@windriver.com>
References: <20260311050556.2079418-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0144.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f7d062-b4c3-4fa1-be02-08de7f2c0ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	CSesDpI6Pgy8d0zrryymTfnpxW0Otz4rjSxp97gpnMuAdsCkXFXi8xnb2rLO5l4PFl0ePEVmb8fR3sSdIA/Hy+zoeneJpo++I934v/ME35DCio2JIJjZY3JevaaYw2uZZI8PQxWt7P/QxZGTT1gH+RNuBUV089LoUGnnczLSxxJk8mbcS30X77rMsJXOI03p6CWwSAWGjmjVn5HXRG9e1saz6pnIFhiFI7xlCcbiOXvhtd0uoZD5a0BF0KJRb87bwh6At30bjI5gDnHyroqWjVNtx2qs5TxNDcKu1LkKnfx7y3yoDj2sGcyBFuILMUMfFGBFSLpK6s8E1ccJvc39ekodlftbSHf8uqMI1hnN5hkHWsFxlgY1McDoQYSxo45p7+cPyojYiQaHB0eN4RJ3fTghEnOtAmJT/oBLi580cIf362jiZFLTkh7q/P3rgog6F1o2p5920Non0cLmgHlzKEZ7SOv7PJqre4HOChLL5lmfYP3NyfOUX6AR6YCqffGuAMp+mM/YECUrTi7ds6IxHt7ADKuBF5HMUJWCnIcIpkeoVc0v7kUrEbLkYWuaBbLaJA20X0Y/n6X+G++qUqyNwbOEzxa4/3tAws/AAL0VbKfmdjcCFwgvnZbE+gOVXNdPTtJyPhTseW1kK4Af+JGat83hXscMzy5nHT1WG4Le9QjP8ispOXhSV2mAg4dGe+ugXrrXux9tIkKUCsf2rC3NlEpMGOMZGpxxy/nLWiMFb+PPsIMvzaP+b3L169EOgLPp/GKahrzm+GcKLInMn5vpZqfthTbbhtK9btRpGxrnazs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3IsYB/5wzFBWumuHBeN9VJUhfWSPuAzmhJXCGG5p5uqpexRBnyTpyr6O1Lhv?=
 =?us-ascii?Q?vgWG+bS47M4mchDxH9EDDPq0rSUEmjJvLigV4BQELmU72wmqIi1ZV/5JM6mL?=
 =?us-ascii?Q?yi+R5EsiaOg0Ruuh4hTqVcHu3JAzlA/ItGyAvJQu55ZUwoco+CtG9FnrOmIT?=
 =?us-ascii?Q?HMalDrI4oCrZRiM56bMFIXZb+38q6HXSwDJr5JrGFj5WimSOuAFa/v6cnE4E?=
 =?us-ascii?Q?NUD291B8/ik2TAjDH6Quw/QL2DeK+0tOpi91kH7wDEBHAHIT8XCSebHS8Y77?=
 =?us-ascii?Q?3pAzyyNAaj9uI0WyRAxG2xiNFdL+YDhpslHS3jttUJZuwXwW1Mz/XzfWV8W7?=
 =?us-ascii?Q?fiDfBPGRudhvWeZa/vks/lSY+diCyzyH+/oMGtiYz1MWQl0L8rFByXf4aLBe?=
 =?us-ascii?Q?etTwYw8f6jvw8g/0sahfnSgixTyr8OoXWCziRX6FpQD/u8XkjtCyf6SnGVUH?=
 =?us-ascii?Q?jBDYWrBUsu3F7KsqvwyE9Hgu+cs1L8NJV2OhIaJTJ1VkuAKWT5cD0h7WeMQ+?=
 =?us-ascii?Q?GqQIpqD+e1ILe4TFfYDFzqFL0XLQBgEI4ON8qkQzeKGBsQarWVRIcAZnc/mb?=
 =?us-ascii?Q?XJFEzSs2q1nv0dm3hzZlLc9HFIToGdg3372cMCq9uvyzt35TG8aujPxYgh/J?=
 =?us-ascii?Q?tqR7GMu/pnjUFeXUEIoINtNCMmkgLVon5em+jkjf/YGE41+OymbjyhCHD1/U?=
 =?us-ascii?Q?kf8pGWiUC07nIjiLBhoxR9F60l/+ESMjnhaCDeChFwHTZjFPwQCqTEh2vWdb?=
 =?us-ascii?Q?rR4EKM4UvAq2aGlfs0x3JwTd74sjlC/4WdV7j4m94G0mbgbBZHXROeIElke8?=
 =?us-ascii?Q?tIS86fh/Imw1GEN103Qk+SpVG3Lg1VAteLYBhWHK5aKGFbCrqh7PpLXzxT/i?=
 =?us-ascii?Q?00wFg5Y52p4ZfNV0/aCnil4SiSvme6XRuucYxv8ymL5LDytInZqbJUpYSzdZ?=
 =?us-ascii?Q?0pkjI8AiSjQ5NSpYAoQ+6ay+cl6I/R/1w641QYix053dDIZ0QdbuH3zkcujh?=
 =?us-ascii?Q?Ke7rVPuXmVzb8EXuJvVegQU+/pw9YL3i/rZORes+QItHaib/QUjahxqRdjfj?=
 =?us-ascii?Q?Q3ltcLTHG307fFPkevWfELbMn+SvZB04LS0RSFMXCVtN6Bzh7JGLipMf2P/o?=
 =?us-ascii?Q?8mZcL1tfuF/PBl9EqR0zR0KrWi0Zj8cv2oUcU/P+afE68GMpGM31Z5UhKi9S?=
 =?us-ascii?Q?2NhzPyvAKUxdfsnsri8EoE33PENWrtiV0Nq1Q9Cddtv37rfPxAFIlI5+TX+J?=
 =?us-ascii?Q?8+R+bWET7gs83m1lTWO6/KDy1sK5sqmo8gWInhhCUPLjBRLZbV9ttDG2AERh?=
 =?us-ascii?Q?mMUJUV28BjUgdnPfvi3VMsG49jhwxJFKJAKtVOI4WaGuLHxOpCEk5txeYdlQ?=
 =?us-ascii?Q?s+cHWuKp4ks3cFjMpYqau7sX+O9sMWjHEg5vZ6oLhYw3xydAEdEl0oWEbc01?=
 =?us-ascii?Q?8neqZFtsgrrVhLmfn9IvaObg+kNIwSB+wLp01glMyR/xNqVirMfLs/VFSvIT?=
 =?us-ascii?Q?8LW/yUHs/uL1XuEDN7H0owRnGTwoXReAUZ2TaHMi2IzaW9GqfeWZ4ppxWGPP?=
 =?us-ascii?Q?RniBL0jE6FsgvrsvowJ7G9WnU1V/qHdenUEHi46wQYwFUDNLVO0Gzagd/peD?=
 =?us-ascii?Q?b4vClgyhuNuEe5ckX9PylF8CaNdGNMFLtc+XtjF9lWHxlcOxXWI48AU8sxrE?=
 =?us-ascii?Q?b8/x4qz0huPay//5mgVlnnzsOCOwnZ+Ug3F4bDCCXeztQrYedQ3z2jicQByN?=
 =?us-ascii?Q?DbQXPZAqFKVmArvraOsqef+FFxe13wc=3D?=
X-Exchange-RoutingPolicyChecked: 
	lsYpyBejkYbBGF35zyqkDQEVOJaH+u3OogDlAeL2yenwOWCJqNM1oxyanjaRbLTpeX86o5s3LJxHj0LynfVtuhZrzSPs/HfN249ZYaaud7RxlXJ/2T7sTrg5HTROLEBPDRRqN4Wvv1vpzt+iYlW8jkGnd2nQuq1X0z+Njl1VKb/XEkJh3tYSrsqpEwtd4DeSQVAeL57J5o0GSq/BTgngeJ8JkkahFV3ZKwMlPy/wf42OtWzCYeDgW3zjM6waH0ywb2nnz3Tq/4kaQEtyTOqwBZBzUoCBdupNUDMeCxYblpYoGbeZC95DTljdXcYXhQscQxk+x5Fqmm967agyM8o0Xw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f7d062-b4c3-4fa1-be02-08de7f2c0ad4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 05:07:07.3165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3ZzsjSOqUXhlCD0eCh1KbpFtKnL9W1Es/pyVJ0Oh1uV7zgiIvjlffmqRRJVJ4HGmM/WZRD2oikp0Xizj7UvKmIpOS8JGDtLGfB0ICngOwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: gCoUaclm4C1_0hFXUBxZ39zb9YTbyumu
X-Proofpoint-ORIG-GUID: mzTNgSpCaKIePGGGFWKWy9kUX6jWlgvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MSBTYWx0ZWRfX6/6DvxEIUjxD
 ohXfa+i99pjjHOMloCDM0ibiMqPpfd6VpkquKsXkxwMjMmXesRRvl6JCTPlaBGHkylpM6pejfH1
 Tu5GGn3SOSar7M6WjPqG70bZZCalt4Vgk8I7gqOyrBm06Stlwl7BTlK/sszdGTd6QKi0icb1Rjt
 xCgqUN/AMtFkmk3Ues9AveX35D9n2/ZRekAzFkyUdfnMTwFsekpZaAX5AiXdpB7ceh+hvumC+cM
 mjhkeVNtEOrrRsRpu1jxMaz4uDhsrZLZeSrfB+vFrF06oxQYFlM5d7Gjb/DLpcU8oRY3t9Jm6kU
 AZUcJ1/JjDVxnqQugBRJHQm00BqU1dIVBRmz+nutbeLjmOTtM60qQOEt+VtwNKk25cYoLyCXRiA
 YfyHTnC07V9ju2Dc6O5hWCA2SBxSIzdY/ptgD2PFWN1oyawB9KhjPHMFgHEjpoKXU/Jn7d0gk/K
 rRedh+kAIcDahriblKQ==
X-Authority-Analysis: v=2.4 cv=Qr1THFyd c=1 sm=1 tr=0 ts=69b0f87d cx=c_pps
 a=qX5DP9EEIf1faxnBSU0rOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=T96_q8JuHgw1x9-z_eAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 05:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125058

thunar requires x11

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-xfce/classes/thunar-plugin.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-xfce/classes/thunar-plugin.bbclass b/meta-xfce/classes/thunar-plugin.bbclass
index 39b0304327..82a1be6347 100644
--- a/meta-xfce/classes/thunar-plugin.bbclass
+++ b/meta-xfce/classes/thunar-plugin.bbclass
@@ -1,8 +1,6 @@
 inherit xfce features_check
 
-# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
-# cairo would at least needed to be built with xlib.
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "thunar"
 
-- 
2.34.1


