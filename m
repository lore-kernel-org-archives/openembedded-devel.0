Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E19C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 04:56:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5921.1751000160827329443
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 21:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8273d315d3=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4fP2K028467
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 04:55:59 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dhy2pcdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 04:55:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fN5JPV7xXXRbDGXWorSoFA4y+vteOfnR4RUfpxiB6ep2NA8lOdFFknvBTNPv/uz3fMVzqrDzVplLdqQhnHagM8BZI70KrmrUZHR/aVZ6LfHIcorLZ333EHIB9cQmfxGuO6f6OvYuKGpkAZGtkw/fM3Dzlnmn3CVNuNcPQmHYIZL31BaqAPEEre123Ef3tXZGvhbKnOz6cHMxFO61PES94S11iQ2bo0i168oBfrHzhI9y0xe9VkUJYiEIPXWrLem1kn2kOewDKE9GQEXyj3JcsojG+UFODkWfExfBUcdci3y0bCL9G0lYoPQB/z/Y0aTEA+QAjOMRADmpZWMHwO1jZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YgNtxOkGxNUjFWcRwXak1C/E9uHwzs42FRswaYfav4=;
 b=TYgpYyq8+jLuji3UTEhO/BtBQgMlelX1eLRAtq1eXbQEy1scAAKVEjsqz/ybZzI3PfJemDiferLXutVxex/ijLtm7tO6pNbHn6o6ejwFw26gahn4rqpn/lnRflVNRNCvulqiNnEDszdMEGbauB4oiTQ8eMx7UJXyA7Q5h7D+xGXkGPXT4k4A4HXP32xqp9rSQQ6/Itdr4UWUeQ2jqhKxJj2+GPMUZUnThPA/M+jd/4ELNIAeGMoFRE9mpgasPm8BuW1VXC8zZ/HZmoPE6oyErnRMGppPypOLMdLdBRyqrQMvzcugp5upgaQIG7F8zXZtEgfOSg0CLDbeZQCY9kb5zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 04:55:55 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%6]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 04:55:55 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][PATCH 1/1] thrift: correct the SRC_URI
Date: Fri, 27 Jun 2025 12:54:23 +0800
Message-Id: <20250627045423.2805574-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0193.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::18) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SN7PR11MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c6155e-be24-47dc-3e6d-08ddb536e5fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cCs0X1PizZnp9RwSAszDhs9ib0Nlu+0c3+DN1pgyZjpSAPFDlFs5ESF566gr?=
 =?us-ascii?Q?bGWzcsxAj04SKMUJaXsQH2XrrgGkJB56fTsv2M/HLvMLJuGsg9HbAl/cil6X?=
 =?us-ascii?Q?ddaMX69TareKkU4sMB/iF94bnVhD+JeXIN/tL9LwLjNTpL0G1EYiO4YQYnQI?=
 =?us-ascii?Q?PphCNhw6DEKMdmT2zkP4REXCAVxwb2aZ808jzT0uRvwKHIwgmggPWbW7b5K/?=
 =?us-ascii?Q?qIVXkFkYlCNu01ZbxU52XBcXrdBQ+RyEHY8HjZbtV72ZMMv98etBWPFsLAly?=
 =?us-ascii?Q?aUmu9rRkNoMumScT2mdEJM+YxZAh6lHRtsRHi960DhRjtDnVrzfwGoQ4PML0?=
 =?us-ascii?Q?iEwsDMz0AnaLZclBmv2z591E7wlT80qHJT6ypdvpyDCvWjh77o2Jg6iUvhoo?=
 =?us-ascii?Q?bKZuUkS6l8MmN89uOAME00X0Wa0sa1oI8dz5B7JON8cN1zk2dfIL9/0cYFH7?=
 =?us-ascii?Q?RNbz0kIFMtP8qdxppeyiMxuBjoPQ39SrI3TfAiP49TUP7zWG/qbXIz+S0I8J?=
 =?us-ascii?Q?fmHKew+Zp36RGMYpKNE+NdbBV9SbftvdDqpXEQVL63a9qf2M5NXttw155mN6?=
 =?us-ascii?Q?er9d+YPyOtfJn5cnicBKFwEoP2E5F3nNTKqHkkTWoP8+Pvk7yNCrmxSv694S?=
 =?us-ascii?Q?KZhyNocjtksD3sKkpZdSGNiXMpaniuiUpcgiMdfMuXdC41RMEGAwlfC1wL5c?=
 =?us-ascii?Q?U+l1DQvvdph0SOFpo0G2Q4dVR5V6eBV3GWBRde0difX1650wtC2GivitHA1l?=
 =?us-ascii?Q?dCTnIzh325yyZEz2+IsNum1zVrNj+YEyvkwPR0YkOfcWhy0dQtbLA6vo66PS?=
 =?us-ascii?Q?YPMtSCnZCYw80GDKYdQ8uyzJG4C9E7KrzMMILcSmP//pWX5WBXtqzza+4ILf?=
 =?us-ascii?Q?AwUG1+zkUM2XyNVgEkCmH5KxZchlJuZ8Ha4a6WiQVNHtZjlMoNpPBiUxkrco?=
 =?us-ascii?Q?wgbIeAv+Z/OYhf+OapGOZui3kfHe8h4scEQFBAoECmMtm43D6jEQ0RQSQ2xi?=
 =?us-ascii?Q?LRTh6teIj9U69UPKeGnA9tD6N+qlxKOc+lpY6k6ZvljL34aqMxTKjRJuaFyN?=
 =?us-ascii?Q?puAJTpKcKnzQfsJIt/oFXBB0v7U0jqeugRwwWL2KJy/7j4jYTsaqOtssxjXy?=
 =?us-ascii?Q?Z+QQDU4r+dK1cfbkPS7pvcVL2hHrlhhXMxf4qvr8O3kD5J074yTuh9HVfyjl?=
 =?us-ascii?Q?04kM12kChJacNIzxx3nLg28qlw92W75huacqHw6ThMfdxeXN3XkaVYxB86fV?=
 =?us-ascii?Q?Ez0I1FlHfmuIct01AjCnwSyKMdJHePOZ/7WFjqAtnuUdPLbhYlsFcbNVLz5A?=
 =?us-ascii?Q?pPZVB6swoAEqD/Xid1dg67Zp5msqZyLnrnoUuinsNuCplan2nRgM/COF4MYd?=
 =?us-ascii?Q?+yc/IVhpNcP5cTdcSmlwJ6cOdjhJY1fD/+2zWY8MTE1l9cI0L3JVy2JfjSg1?=
 =?us-ascii?Q?saOtNlgzA3M=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FMrait3cm0E7yW/8jwF/pCrtVcBFMJC8zIAzHjhUFdbA/4Iqt1Ku5z/zD9E+?=
 =?us-ascii?Q?x/7qnCPyqG10dZoJMswNogwFigaLu0jqr26HwXl0GCt3XNgO6Xm77VTh3VkA?=
 =?us-ascii?Q?YuebTXRy/e3SYzWNF+LITEqA7D+2nmrBoIdzYz5bbEm3hNp2+755yZDgdi3P?=
 =?us-ascii?Q?DxY/i1IwyGFOA60GqHOFb1j6Zrb7MYAXr92KqDJ3v2CM6X86sLVpc9zAH5PR?=
 =?us-ascii?Q?WXsJm+yZQkh+o3qYrf9r6rSLbBAAjMhO1f+gRQ3P19taCfvdSGxSWrIYhFRN?=
 =?us-ascii?Q?y5Xd/Ebn35un8iA0sJtS0TdL4V5lToZKiDdBR/kEFbhBvUggGsaI5fZdmLmt?=
 =?us-ascii?Q?usdxbdP5rop7hIFWOeDx8nzAo9jL5iv9QSPoQxx17Esx1Aiswd9bxmtlq5ZT?=
 =?us-ascii?Q?Afpa8DmsTVfyROuVeb6Lbne0RAxIXAcJRbWK9/CEV+UEE4daAnMTv8hwTLfu?=
 =?us-ascii?Q?OgnC0eJ23RtihmyJ9VENLSSO3kuVoXzce5NiH55IabwTM9XBBc6d0y/3Xm0D?=
 =?us-ascii?Q?cpjcZzHh9mh+VSHxLVL5KcRWphU4viHEK67w/39xjRJRbTVph/6PUiIQeTbJ?=
 =?us-ascii?Q?LNHTY1LmbtbfK/1s7+g27nu3iQM/ZBCWAKogc4fDtIWo8CofBMqNEAbvmIlz?=
 =?us-ascii?Q?+11fD6lI/l/zhUDSeAB8fp45lYkBepMIMM1S5KeNKiofs5ywut2+De7XfFiv?=
 =?us-ascii?Q?yb0spPfSno221Xudc68AnB5viqHxjHwqpFSKBuvuoMbCR2GyRFw7jh7KPPhn?=
 =?us-ascii?Q?r2AyFB84rrPHX9ok8xo1W5RvSwpVcx+vrH58jHRvs7bYemH6cUDnVINcw2Ku?=
 =?us-ascii?Q?9Q8cXocSjtkUopgWvhvV5+Ub3bfu5tNnLDftQAPVO95crS98SWsFMQGzjECh?=
 =?us-ascii?Q?4XTuen6TooMWm2YPZY56ALWphv8Ar3F2wInMk0DrTl7j/cP9KM7pKEhKsYb/?=
 =?us-ascii?Q?6sUn6WDU8WobFyDm3LO6TvPHCMbTeieAqVoeh+4txNROiL3k979u3jcYnGaH?=
 =?us-ascii?Q?+0Y0MH+KkTfhTT0zkCW8wMl+iLouTe5+HGCIYgHzZwQ+Ci5sigziFVt/f46L?=
 =?us-ascii?Q?t+0VcvzHAH40BG6jxJLFShBU57hTcnVTbo8j5JUhN69WPR3uXhFlHupBpAiO?=
 =?us-ascii?Q?WWbz+/Wge7b8pKuX3sc2J4nvIdYhT2YtY6J2cxgZnGf3hWtTwemoOeTYO3wV?=
 =?us-ascii?Q?Jmi9wNSidN5EVxx87FJZfG2AFMTWh55vb52B38OUi0bbwvLoHy44AGD4ljRZ?=
 =?us-ascii?Q?R4sjVE0iD+rRfuSZgqGIeB2yS1M0t0LvK1oyZu8GVgJVmYvsuQD9AazsIOZd?=
 =?us-ascii?Q?hAYbXuTw8COAt3xsAKa7uJUQ8pznQ2EBXf9loR7PWTByn0xpfIAKFf+yzvT6?=
 =?us-ascii?Q?SiofZJpZZXs785lCh+J12clUqNXtujewOYarjJ4rhRUAa+jVHU1Ip4cK0HQj?=
 =?us-ascii?Q?6cRV6aF0/GBDMqIxOEVaV/zR+Oz92i5NVtUyzzq91JmJT9Mk8ijFhvymVp3h?=
 =?us-ascii?Q?DzAJRMFAY6amCH6OiVj6ftyl7lc0VapAxi5GM1d3btG22TCredgMt1YTSSUP?=
 =?us-ascii?Q?yQYJ5BELIMmk5hQSas/w7oNHKK7Y7CI2KU3Hf17qzAB51Dtte4TPvmEVHdlG?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c6155e-be24-47dc-3e6d-08ddb536e5fa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 04:55:55.0987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3P+RNyLSWLzZu2wlzMsW9MnzDs4hCP7WCIqHLrYekx+l5fmZY04mB/JkwheLvflcj/loaq2hI3Ar/TiEujS9JVhoxj9FZEdNTQ+ssAOG4T4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7017
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAzNiBTYWx0ZWRfXzazBMaJE+t19 q/+nXZbFDnHX/UQDsS9RdrzEiIGbc5h3S88YllanRpakxF6zR+naCNlh/OdTAhtUWvmNtrbZ4oH Gu2v/cbA/XSWnu17q4zGnDQ+4kyYnd0QNtqLRJTbAer4sZqS2ujwVsJu37ysi76v7YaZkivmPJi
 MwtDGlQl172G7NacrKAIe77Y8A3O9d5fum3/ZatAUORFuJbyeuPbzesqz+dQK98c+OYBTcmhyyK 5nzOEOa3XyY0Vq1GOHjZU1wrQOmrjsd/W0sJ07wjujLaAPP5NvgnhDdezXdfS3/PA17XTGNzS3w fAq/zR6UGQsMWNgxx/2DLPGROHWDprfKfZTR45cTMhmAzwuIAdJ0G0ZG11MDQlj5Zup/bQTOY52
 qj+paAHlUSgz/4xKVxPKucXIFt1zwmdRNWn+f3Qgt5jX90Vqg6RbjE/HSU7CsCnnQPwH1k4B
X-Authority-Analysis: v=2.4 cv=Qblmvtbv c=1 sm=1 tr=0 ts=685e245f cx=c_pps a=uxpPEJxh2mAsh5WBefDKvg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=mV9VRH-2AAAA:8 a=t7CeM3EgAAAA:8 a=kJeVkWyuCrB5VYmUSEYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: YHvKRlmeHqR87t-v02ZcP1nNR9JHEQMI
X-Proofpoint-GUID: YHvKRlmeHqR87t-v02ZcP1nNR9JHEQMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=806 mlxscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506270036
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 04:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118131

From: Guocai He <guocai.he.cn@windriver.com>

The old SRC_URI is not available.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
index c908eab7b3..14b98e6717 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c40a383cb3f747e0c7abbf1482f194f0 \
 
 DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
-SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
+SRC_URI = "https://archive.apache.org/dist/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
            file://0001-thrift-pr2755.patch \
 "
-- 
2.34.1


