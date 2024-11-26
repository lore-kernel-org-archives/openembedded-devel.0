Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A2ED5A6FA
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 08:11:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.40899.1732608692642311093
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 00:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1060a1ab4c=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ52WdF005193
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:11:32 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433618aya9-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:11:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REymT6fXk0hKIq1Bk+3mASAM119mUgUVxLs1IZuwe1BnXbKD/3z08DvnrWwd/oi+hFedMSV1TKRdoqdmYnJ08MTtAIWkvWg+fWQ8DUEmJSEO1ewusD3oEPkKUyqV67RjJEK4SbF5YMMxr2FFAErpMB7Tc/NtjzdH9a71AIYCZj+jeu+mbhroGzkQqXncseHcNtlUmKyj99Q8UlbEFQP/RR1H4UUhxG8+FFzVOEmcJMTZkK/MLkAAev7n1r1xPJcNPq95FHnw6oqTB9GG2WtUpTruQPfXacwNEApuA2V3pAoQHc7f70Wpauyp9UNYwH8I9wLEEdAbajC5nJWPucwwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8G3xufLJperqK0gkrAldv0I2HXDXFR6cKZunfvHpzuw=;
 b=uo9TxDIfUaiYYCKC3wtMWe3TKL0hZTAGH0ovXLo0BOXT3j5J55awdMcuBtF8NOaWaGnJYUHIXipamR1YXOdnqCXZzQvrwX1DCDQ9fOW2l+eRNNWQVy7i3bi0tUSOMUQz3Qj2l/AjCJuF0VbRXUnrSMTJm+mTnTbCryLTITKNxTTJHnotQsfJt0EwUT0VqArL6b4qERyQYopd0Eu9l3u85VRo6MF04+Jrl3HXQ/kYu6t+7vuFAizTEz9ljqeYEx37YqNZggPgSX7Ap3Yr0Mbbu91zDhoZo6WUCRovxofBS8sn+graroe7AWGCVA27oKU062UYEx00qjU3gGsZvD1k8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Tue, 26 Nov
 2024 08:11:29 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 08:11:29 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 3/5] frr: fix CVE-2024-31951
Date: Tue, 26 Nov 2024 16:11:14 +0800
Message-Id: <20241126081116.2535308-3-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126081116.2535308-1-peng.zhang1.cn@windriver.com>
References: <20241126081116.2535308-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::10) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CYYPR11MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: c4df9a93-fcb8-4844-5e4c-08dd0df1ee55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ElScjYuZnBikYw9frl2m8Oligvcdi6BhGBeo4ZX5KbDeEeLePKjtPbuskM/S?=
 =?us-ascii?Q?dyRBZ9q6WYkmmmi1ttCaIhTRio9sBj9rzINBBVcPo0CNu4BpC/zWLvRXObRQ?=
 =?us-ascii?Q?SpRFQ3Ct6bGQry0RPflnUGAZXvc5psgmlxIGW/fjM1Tbh0WtYCAkcICXFumu?=
 =?us-ascii?Q?Yo365w9LKxEb1W3SJKskSHV9NDH730PQ4P8OD7520JxRdTQhexhgaP1qC5Sv?=
 =?us-ascii?Q?vs7T5HAd3cuoNLTl93hR664Dax/J40r7wJwhWMtP01tiRiCBRcqru0EJB2ui?=
 =?us-ascii?Q?MlMw4aaxZJ5C7Dn1EO7y9hdE5qMV+jZsJt36j6ZPA07vjrIitIO/9ync2WyA?=
 =?us-ascii?Q?KT91d7CDklmNtJEAJR7SPOkrIjYcNPseJP0MyV5Ou49QG27LB0EI0tUN27y7?=
 =?us-ascii?Q?DekyE/pfA0eA86Hh+2W+Hwk6bZqVRP61BjGpaDWLZ11HUtqLknqkCEY5J408?=
 =?us-ascii?Q?OOL43EJUlV9+r7rkxgcHfV2CbF6FAXIwJndAMJZe7wbIahE89vtr78uNYJEN?=
 =?us-ascii?Q?QwZttDLB4yNC5xfuXPkGPQ2KM4n8zi8iydbd4ZQ7/TjXZNoi1K5AvtBBfqgQ?=
 =?us-ascii?Q?OLY50uj4iIZr3fusZ53KOPg88IGIP60iXNsqUwSpsnA4JYeNGP0ntBW4km8x?=
 =?us-ascii?Q?u0DaMRv9EY4W52KHC+kVWeehXhS71jODlablle626yER8GeulNFWkvBUsGk1?=
 =?us-ascii?Q?8Rtcm8jvT6HDK9cGrEC6YILbOmc6/m0NnHNpC0O4kKrf6fJnS5V8pe7gY8VL?=
 =?us-ascii?Q?Os2ESAE+a25TjbFmHMuBSUXiIF3i5WOsnqceFvNzHBJm1eE+hFudmODb4NU6?=
 =?us-ascii?Q?HcRKS7Gq6RO8a9M+93U8qvNyjRgsrANoRM2LFbzZQ5Wmh+ZplXhWaiKnXoPv?=
 =?us-ascii?Q?TqqrVC0BoD4T8WYa8qDpfRL/JHwlBM52rqIXlGxdTgljxGXBgQLHwvwf1aLO?=
 =?us-ascii?Q?xMgYyU79GESO7hd3JGatKaEZcNEGVZMbU6CN6GH9jTr6S3w2QgGqJXwO+xyr?=
 =?us-ascii?Q?i1FHKA5lac9CRmnzy5MWDKh9Lq4mzQG/xmV2XFC5hQ8Wv3hRW4zhgOxbVKJo?=
 =?us-ascii?Q?vo5sSdCO0cpUQf2W42i65vuQMrfVed9veBPwfCdr/ZUvWP1THmibdFI5rL2B?=
 =?us-ascii?Q?sr7jmkH+0Yqy2qHdxNs11vFzDzVXp9rnU+Z+/EnnY6c/zp0EFbOtM4lQtKDV?=
 =?us-ascii?Q?Blj6p8BaFhDzfOOo5QM6EkaBlYmmcgsX3IBjcn7weGACC3kND/h6lvYEId6H?=
 =?us-ascii?Q?kRbG/fNkl8PUQDioQIWvTbC+Rd7hYdsPizB2EL140sM3rR3A1n3YJ5RcySP7?=
 =?us-ascii?Q?6AifEzXQxdFTH+VN3XfoiqyCR2w077o8NhqX66dzUF7pTgcZcxGE3V0RxFCL?=
 =?us-ascii?Q?5oKktYo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gbjjE7viqLK7MrvYerpP6zE+HZTuTuGUhyX2wc0qEqwyRn4xJ2/bLZOTj/s5?=
 =?us-ascii?Q?tpzr9BhFypBYDqr4zigfqSIJyxECsZZI6IKYlXAduEpE7YQePrrODIxnoOWv?=
 =?us-ascii?Q?sojpvkfU/TEpVBS+ohe3UATPvEzvZmqv2chOTs31ICHzcKcjUvdKJn2dXG8/?=
 =?us-ascii?Q?HrNcTMh3Ns4KDGIOTBMIoYhqALiV7YQLRxyepFumq8wF2qfWoVC+AjwdvceN?=
 =?us-ascii?Q?RQAVyUXp/ou2eriscWtmI8flE+cQayNBGdQKaJu5HhjMmTm0yoC+3K5l3umu?=
 =?us-ascii?Q?Rp4ZL4+glxfa0CZpXOw6Gv6QIyAH+V1tiP356f4Rng7PFsykFUI51DJskw6J?=
 =?us-ascii?Q?mjlf7Hm1nY4HLc62JoOm8Bn2S78LAWqEkbWxLfzQRaAFNTnJQ8mYGt/tgNqh?=
 =?us-ascii?Q?A9fEM1uCNqeMTohg+9LsirEqji+tfNW4zmRgWvQ0HnSxf8u95K8K+Xsw0Jwk?=
 =?us-ascii?Q?gLLMul85CDrlhveLmbFdWmeljGixwyAfVpJRgSXSiCgSMWYPiBpzu+KjQFLN?=
 =?us-ascii?Q?8/I5EHvpddYXdh45pdK5ysjNonp4BC9Yqfc3G3i8jX6CfIM8JpZXjWaGu848?=
 =?us-ascii?Q?wmVCbI4SmfA2w74thwHvFId33bEl2Lu2/RxffBxpH9XhQQL/DHOCpaMVn4hN?=
 =?us-ascii?Q?mVByhbd8FjKXx5JYop27QCl2EgYSaQz4j546sCQrhnBAJmw++OeYQLmSuka2?=
 =?us-ascii?Q?mKd54uMdG5rVJGfDT3uYlgNCf8J/M5zNr0xJZn+3o3qKBYjr7Dvx1KDFvytW?=
 =?us-ascii?Q?KrBfzdb7iWaWZHGT0e0b5Zn3x9tOm6kvoog99GT3g1bR3cBysvRdIInQTtiu?=
 =?us-ascii?Q?gCzczkUgIr0pTIfpJf9gkwM+ndF7uzeowrJ1RhEyO6eU2/6WyKeUNwbZM8LI?=
 =?us-ascii?Q?behlnhNpvn+vGyPhHuQrwxShWZQlX8C46ELIFxUsMSrfWbzjLyMrcxBaEO/0?=
 =?us-ascii?Q?T129DgQWygMzgGv1rr2+JDw3nWmQQb6gmR5RRy0Hq4hXbcCGwhCuQMhj0cge?=
 =?us-ascii?Q?g8skCcAmPXgljwRboFeiTI/IRcWuNaJ9wKZk/JBQXKzgCYEL7JF0GMbRq6qu?=
 =?us-ascii?Q?S0BxE4HVKDZtGwaeiwaVjRckc+G4tpDbrf16eWin3669IA8gS/G0VqdSye7R?=
 =?us-ascii?Q?lb1ypWNZAbU84ory/a0ff56KWZUTdt1j6Cj3IzzAeAEa1XbcA26VVmq+3rCX?=
 =?us-ascii?Q?b0sgl0a19a2aSGU49MPVsPepbTZ9A8Lp9IBB8x90QH3RYhyL5LqSpR6cvDk4?=
 =?us-ascii?Q?giaoZSBUrw+u0HDBFbb4jAhwiCXg6gO322YTvy1BVLICtaQxZjkZSH1yM2c4?=
 =?us-ascii?Q?UwqUMxQRh1NSzz9amxhlaKxAMKuPTFV6Uluqhya5UPDqmJfutgzkYHqcjBCu?=
 =?us-ascii?Q?ABMGzOJHUP2J8Nw5PrDgCe/bSPKRCQnANABnF2M4C3WqDdOfNBU+CTzPe/mv?=
 =?us-ascii?Q?B0YopMFdYQocGUqQeHb7XujHkdo9zI4srn8F7KFJvueT837sXaFTLLE2POQl?=
 =?us-ascii?Q?M9G/72yPxt+B4kqDTUoiGotAZ5A0eu+rxIvf5R6iHRikCABwLREy0SnppEqs?=
 =?us-ascii?Q?b/g0BGZz34K2YM2mr/IsACTDzswXGtNKKjN4dyc9sfurIa9iXfhfSVv+GY5t?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4df9a93-fcb8-4844-5e4c-08dd0df1ee55
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 08:11:29.5124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4d6SvHyTyOzTK4CyFoiuynOFjWQ6aLuwhMSTksXa+fb3dzk8HAZggXpPcgP+CUyjohp5BO2+Tf2JChNBsQHCkzPvAYfZKa2Ybh4Nexc8+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8430
X-Proofpoint-ORIG-GUID: BE7OWfLZ-_ppGqjcVuT8yqMRmmnrlPYC
X-Proofpoint-GUID: BE7OWfLZ-_ppGqjcVuT8yqMRmmnrlPYC
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=674582b3 cx=c_pps a=AVVanhwSUc+LQPSikfBlbg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=z9tbli-vAAAA:8 a=vggBfdFIAAAA:8 a=u3HfnkmMe0n-5SDO0joA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=RmrFvp9qXTL7MAzcxlte:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_06,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411260065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114065

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-31951:
In the Opaque LSA Extended Link parser in FRRouting (FRR) through 9.1, there can be a
buffer overflow and daemon crash in ospf_te_parse_ext_link for OSPF LSA packets during
an attempt to read Segment Routing Adjacency SID subTLVs (lengths are not validated).

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-31951]

Upstream patches:
[https://github.com/FRRouting/frr/commit/5557a289acdaeec8cc63ffc97b5c2abf6dee7b3a]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../frr/frr/CVE-2024-31951.patch              | 110 ++++++++++++++++++
 .../recipes-protocols/frr/frr_9.1.bb          |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch
new file mode 100644
index 0000000000..7f19b0312a
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch
@@ -0,0 +1,110 @@
+From 5557a289acdaeec8cc63ffc97b5c2abf6dee7b3a Mon Sep 17 00:00:00 2001
+From: Olivier Dugeon <olivier.dugeon@orange.com>
+Date: Fri, 5 Apr 2024 12:57:11 +0200
+Subject: [PATCH] ospfd: Correct Opaque LSA Extended parser
+
+Iggy Frankovic discovered another ospfd crash when performing fuzzing of OSPF
+LSA packets. The crash occurs in ospf_te_parse_ext_link() function when
+attemping to read Segment Routing Adjacency SID subTLVs. The original code
+doesn't check if the size of the Extended Link TLVs and subTLVs have the correct
+length. In presence of erronous LSA, this will cause a buffer overflow and ospfd
+crashes.
+
+This patch introduces new verification of the subTLVs size for Extended Link
+TLVs and subTLVs. Similar check has been also introduced for the Extended
+Prefix TLV.
+
+Co-authored-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Olivier Dugeon <olivier.dugeon@orange.com>
+
+CVE: CVE-2024-31951
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/5557a289acdaeec8cc63ffc97b5c2abf6dee7b3a]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ ospfd/ospf_te.c | 35 +++++++++++++++++++++++++++++++++--
+ 1 file changed, 33 insertions(+), 2 deletions(-)
+
+diff --git a/ospfd/ospf_te.c b/ospfd/ospf_te.c
+index 091669d8ed36..e68f9444f512 100644
+--- a/ospfd/ospf_te.c
++++ b/ospfd/ospf_te.c
+@@ -2620,6 +2620,7 @@ static int ospf_te_parse_ext_pref(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	struct ext_tlv_prefix *ext;
+ 	struct ext_subtlv_prefix_sid *pref_sid;
+ 	uint32_t label;
++	uint16_t len, size;
+ 
+ 	/* Get corresponding Subnet from Link State Data Base */
+ 	ext = (struct ext_tlv_prefix *)TLV_HDR_TOP(lsa->data);
+@@ -2641,6 +2642,18 @@ static int ospf_te_parse_ext_pref(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	ote_debug("  |- Process Extended Prefix LSA %pI4 for subnet %pFX",
+ 		  &lsa->data->id, &pref);
+ 
++	/*
++	 * Check Extended Prefix TLV size against LSA size
++	 * as only one TLV is allowed per LSA
++	 */
++	len = TLV_BODY_SIZE(&ext->header);
++	size = lsa->size - (OSPF_LSA_HEADER_SIZE + TLV_HDR_SIZE);
++	if (len != size || len <= 0) {
++		ote_debug("  |- Wrong TLV size: %u instead of %u",
++			  (uint32_t)len, (uint32_t)size);
++		return -1;
++	}
++
+ 	/* Initialize TLV browsing */
+ 	ls_pref = subnet->ls_pref;
+ 	pref_sid = (struct ext_subtlv_prefix_sid *)((char *)(ext) + TLV_HDR_SIZE
+@@ -2751,8 +2764,20 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 	ote_debug("  |- Process Extended Link LSA %pI4 for edge %pI4",
+ 		  &lsa->data->id, &edge->attributes->standard.local);
+ 
+-	/* Initialize TLV browsing */
+-	len = TLV_BODY_SIZE(&ext->header) - EXT_TLV_LINK_SIZE;
++	/*
++	 * Check Extended Link TLV size against LSA size
++	 * as only one TLV is allowed per LSA
++	 */
++	len = TLV_BODY_SIZE(&ext->header);
++	i = lsa->size - (OSPF_LSA_HEADER_SIZE + TLV_HDR_SIZE);
++	if (len != i || len <= 0) {
++		ote_debug("  |- Wrong TLV size: %u instead of %u",
++			  (uint32_t)len, (uint32_t)i);
++		return -1;
++	}
++
++	/* Initialize subTLVs browsing */
++	len -= EXT_TLV_LINK_SIZE;
+ 	tlvh = (struct tlv_header *)((char *)(ext) + TLV_HDR_SIZE
+ 				     + EXT_TLV_LINK_SIZE);
+ 	for (; sum < len; tlvh = TLV_HDR_NEXT(tlvh)) {
+@@ -2762,6 +2787,8 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 
+ 		switch (ntohs(tlvh->type)) {
+ 		case EXT_SUBTLV_ADJ_SID:
++			if (TLV_BODY_SIZE(tlvh) != EXT_SUBTLV_ADJ_SID_SIZE)
++				break;
+ 			adj = (struct ext_subtlv_adj_sid *)tlvh;
+ 			label = CHECK_FLAG(adj->flags,
+ 					   EXT_SUBTLV_LINK_ADJ_SID_VFLG)
+@@ -2788,6 +2815,8 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 
+ 			break;
+ 		case EXT_SUBTLV_LAN_ADJ_SID:
++			if (TLV_BODY_SIZE(tlvh) != EXT_SUBTLV_LAN_ADJ_SID_SIZE)
++				break;
+ 			ladj = (struct ext_subtlv_lan_adj_sid *)tlvh;
+ 			label = CHECK_FLAG(ladj->flags,
+ 					   EXT_SUBTLV_LINK_ADJ_SID_VFLG)
+@@ -2817,6 +2846,8 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 
+ 			break;
+ 		case EXT_SUBTLV_RMT_ITF_ADDR:
++			if (TLV_BODY_SIZE(tlvh) != EXT_SUBTLV_RMT_ITF_ADDR_SIZE)
++				break;
+ 			rmt = (struct ext_subtlv_rmt_itf_addr *)tlvh;
+ 			if (CHECK_FLAG(atr->flags, LS_ATTR_NEIGH_ADDR)
+ 			    && IPV4_ADDR_SAME(&atr->standard.remote,
+--
+2.34.1
\ No newline at end of file
diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.bb b/meta-networking/recipes-protocols/frr/frr_9.1.bb
index 305ef8f1b8..807e4ef8ef 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.1 \
            file://0001-zebra-Mimic-GNU-basename-API-for-non-glibc-library-e.patch \
            file://CVE-2024-34088.patch \
            file://CVE-2024-31950.patch \
+           file://CVE-2024-31951.patch \
            "
 
 SRCREV = "ca2d6f0f1e000951224a18973cc1827f7f5215b5"
-- 
2.34.1


