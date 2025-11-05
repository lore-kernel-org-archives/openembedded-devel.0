Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285FCCCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 06:09:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3242.1762322985177164414
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 22:09:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TUeTRT7x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3404438c32=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A54Unue2066506
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Nov 2025 06:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=0zw0lj20+1kfo57h4+5N
	U8MKO+mIX9xp11RZTbyAWCU=; b=TUeTRT7xxMgv7T2HNG/s/eaJvXAtck2pCMZw
	O8DfIyDVMCMLTgm7ISm7Ly6hAF2eosTez272In1ziqH2CXvCPUPWOHD4PBh/TfF2
	xQRJyAAurFyzGV3yZLQZe3tgZO9NyFdCXSQ5oJ2ZAYi9JKso90MHf43KS77ZPnzk
	MmI0sasXcDFdONzripA5iWQ0Z9fUmQA1QubofXld90J6zKgBbRRAAjQspxfMVUm6
	C/uFTw3eywbdf+ULWtHKSoqOd4wExvzVs4nAgUvlViJ1IPXrL9xg6YsQnC9MpXCe
	A8fbNG2UJNh44GtvV8kfbpNIDsjGWc9KHD50rMTn8rCiJyWfBQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010031.outbound.protection.outlook.com [52.101.46.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7war856q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 06:09:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOhsI7Ngl8krzXaKswAnaEgTtwHSnbj7WTEuEaiAD1/5IKvZ3zWblJJAX9/W/Ng5HTYHobPUWRav/jL+FYkzzRJnJMnYm2nPJZtcvmd6dhWvK3JqOv8kXc24mJ2Kk79MFv1H9RlOnhNhpQLER6nfYDGo0RAm8BXAT3+JY3J2XvCmt1y2C3QAJ0rCe6zTL8w8L4sjRLGwrFdMaTglj7+m/l2HZQdPympikHPYCPGwiP7dNxUcrSsQ5hQdJjGoz4SZP+LzTAGzodof2gYUsnjOxjFeWInTj6NsZ7doUl7z2oLhdhJRXcYMG9vG8v1GFDtySdW4L3IKMGhnmRWFCqgXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zw0lj20+1kfo57h4+5NU8MKO+mIX9xp11RZTbyAWCU=;
 b=SEhwNGICHMdpAnBN9QxZqBvrXhmxqAw9Y3fAKCS3IEM1OQB73boYUJMOL1eXXH1FaKmolaeGJ9ifZop4iLLaS2VmxkPDLEP4PzuX91Ww0LrokEhNEfBP9U/LFdprv4xQCg6DFJMelbMwZDtTb7RiEl/FrbqbLkX+3fL2JUV3j2tc4uW9tLYOijWhy1oX994NMSQ//DpMTkUcAVwozTlj8bN/NHoOsXr+l0QCNVJ5bucOPpjLPdL5gvE2RQ/YnQSEkdZn2siuEVai7VQoMOWMXj2Z5RdXi2pIXqHjTkmHbgIpQ0incMi83l1i/w0ypibCDNI7LlFJ3wCZRY/4tj6rdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DM4PR11MB7400.namprd11.prod.outlook.com (2603:10b6:8:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 06:09:42 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 06:09:41 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][krikstone][PATCH] mbedtls: fix fetch failure due to branch name mismatch
Date: Wed,  5 Nov 2025 14:09:25 +0800
Message-Id: <20251105060925.2950082-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0048.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::19) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DM4PR11MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f96c97-9bfb-4ea0-7095-08de1c31e896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vPOr2cz2kVyfjdpjsbOguxhs0MbyUJHFd3GoK34FbbbQRfZunbHvTzTAndnK?=
 =?us-ascii?Q?qkxeH+qyHufwGIeGg42Lb3czPYNkzrGKal+B36fFewUJ25Sbd4BNR/wsHlgW?=
 =?us-ascii?Q?U2L59k536cGeXVp2gUxdGmpNJ0YFckLigp1rcIAId9W9jf477PbeeXbM5InD?=
 =?us-ascii?Q?KStIfEICDTL9/yk/JAXUzcmFFAVWvEvC4wy56HBBhykTJB7rIonOvAQEgerC?=
 =?us-ascii?Q?w5ryW86m9BB6YkbDBDtbU27C46YIGqJcoj4gqXHsNH2V9LYYETPbarzRXYns?=
 =?us-ascii?Q?c0LeFuAbcLd5d+jasjLapy7pD23yMW5BfGdKqaiVbEMHhoolvP3NGJWxhMd6?=
 =?us-ascii?Q?4ez5oCpkJL5MRwUQVs5BgfCh1HUkQP93BYJOLq3mGvA9o5+5ON26slGBcKh4?=
 =?us-ascii?Q?/NoR/OtH7xIXv2yBT8q71+9xB+X3JkmUiSFS7688nCmDKJnjRWNChk5mszZ7?=
 =?us-ascii?Q?xBgEaXTNSf/P+KIRgJGWFQbvIyVLBeUGbwDwBr+dbtCXpNl012ezAExv6U/W?=
 =?us-ascii?Q?mscAaSN3b6sKbTzZdi2VTMIFTFWQV+0cPCM/xaB+4LSXtXaqfnB7NSXshscF?=
 =?us-ascii?Q?6HLT/fmjaG/gxOvIFGsIcH0PUoWAoNlM3Gp4I260OOvXZVX89jhJiJhDZJE5?=
 =?us-ascii?Q?Z3Ca/Q/ZdDQyGuC6rhhV2ek6lssQFrEMn+BZNmFF5Lkd9yZapYw0rE8+rRaG?=
 =?us-ascii?Q?aWV5dA8WlNIBp3NBAzqoRR4FZocHtE7NgjATpHGCgFp732Tff0X71hq0L/XQ?=
 =?us-ascii?Q?NIzzvsFU4iK2Dqnm33lGubGOKskpyZAnWFPtwPxwpYA5jAr98nPse6V0hKa9?=
 =?us-ascii?Q?tK73fXsvo5vk/bc6nJeUeWo0qAI0SVgXcnLTXfRndiTW63+DEGz7DkMh8c4J?=
 =?us-ascii?Q?nU8h6HT6+uCHxmradar7Dbr/9bsdwAoKgirXeLvhTs63fT5hHH0qc+SpthUF?=
 =?us-ascii?Q?jS0dKqDyPu8LTBLUwZ4L6iJrKIYC72HJsPBAI8BJkGNldOjnHPy1MUmvI2O2?=
 =?us-ascii?Q?wLbBuA+YyVpfJVZmbbHwWWmT0gS4xZyboiAhVN8KGnB0l+791y3JKKFBz0Qs?=
 =?us-ascii?Q?RFWPoym6c4hLzl6n7oVZoIIsUcWjF2YKp7X1u2twkAxZJwTLlDCBak+f3rcN?=
 =?us-ascii?Q?xsbHiSeYwdOlNI8MCWDKcLmXwQp28pMDKWl1iijg8F3QNXaK/VBCmvmeXZZ2?=
 =?us-ascii?Q?Euf+30IPp6BHjDK1vC8rU9+XNHYggFo8hYqWx4SagdI8bHDSSWLCuT9gCm+m?=
 =?us-ascii?Q?f0m9+VkpusCISCEmrozF/DsRl9r6v0i1+ZZvywrI8RlTG1WHHFsGFLzCbvCz?=
 =?us-ascii?Q?/IvaEDppARIfrOep9KVdA7wEp7aCntcn4nb5YLrnpnc3wjPNL3rfnGRuFEkt?=
 =?us-ascii?Q?9+9+7eXbouEVRVzne/0yrNGdyODOj3BG/CV2opfH1yKUicwu0FaTIsRUyE2y?=
 =?us-ascii?Q?B5tsgIGVV8Jz5fB2j72GDZuvHOMil+Q94ThoaNGNQVs2/s5IW67bHwPBzTbD?=
 =?us-ascii?Q?O/HwddNvvmoEDOaKEVABpqPSWDcQIjJ2JC9i?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XCY1b0ocbImnNMzMJ/98+ozVqJExtIChisl0GqalFdu0aWH4FgGg+A49ZJ+t?=
 =?us-ascii?Q?xTyC3l4/pJinw7yTPnwbZFcXu6WQwVvETnsgj7UutW+nGhoLyc5bhj9SIekQ?=
 =?us-ascii?Q?Yxyay1/2AXkLqtfgiTLVfBYOSGv7pgZxBqVRcth3sU+qf6QmjzvXaKBngwgH?=
 =?us-ascii?Q?kfnNYeWbplrwGlrleS0HTwQe7h556g7pPd+GY1ZY6RE9QkTZpRaRvM85e+TO?=
 =?us-ascii?Q?CwkJTmlCNC+NS5ifwKCUbw98LjwfKWkki0akLopOgGemgMfVY29femEDAFFI?=
 =?us-ascii?Q?qZs06Sj0yA7uW+yOAKb8jqeL27H45ZPQGhzGQ7lNc169aEjsDXptIbyMVDPF?=
 =?us-ascii?Q?fHUA3Mt1DTSiat5iS9txKAujTiIu8bcv40GX58ICuqpgs4a+VMIzOnqOiKcl?=
 =?us-ascii?Q?WzYhYI38v+BQGchoSOZ0UKESPsqnQnf6joe5mGTpdhGNSsnReKHt7PMmkPT1?=
 =?us-ascii?Q?GWXLGR2+CC6FCsRGLYHOABGtLqVZCWa6BgFgns/o1wfRs/eF63hZYIqGkSs1?=
 =?us-ascii?Q?X44ytJlB9IjtWE1II0ygQTySqr9gnbbzRV+MM7+Nz3JRc91b5Gs7D5HSSJK7?=
 =?us-ascii?Q?g3MvuwVrsozp4P+gefpVV8renWH9U9p1xN9aXIJpjogpRqbygHpR6P5TjOpb?=
 =?us-ascii?Q?AFGL4jdc9D5R4T9mu9MWOlUXvQRb3yBW6NKs7iqLcPFe6mThY4+FXkymeDD0?=
 =?us-ascii?Q?rCxM4v66aNhZJhwoatpyB5aAckPaLjQLIVtPDaH/gAYpMHYUgrXO+nKg9Tzd?=
 =?us-ascii?Q?d7ap7gw+YDqXg612I01C6h5Dz5wdZTqnx7i+muE9Egny/law5iB9aJSViUb7?=
 =?us-ascii?Q?U3QlfapNSKhNVHcWLiBkYf7QgCiQUcbhAtlhGB/OJKzDedqEGAKRIQlANCJZ?=
 =?us-ascii?Q?L579yYDj0YeWRUcRgJJo4TulZ4uYP5zJoDMMXktXJSFVcLFOgjb088SiIRKQ?=
 =?us-ascii?Q?mliNVrORfQiJYrNqcFIbWcpYVoUOu5TPfL0Fhs+AE93NXACqW5+hq8SAV4Y8?=
 =?us-ascii?Q?sL+YaPF9JBuryYDcd3h5wNIF6be+inW6gH2VN/caGrv7lR4SeK8rSJggYh0z?=
 =?us-ascii?Q?c6ID4T+ad/2pxl/j9WpUsen5M0r0gTQJ30Y8zm7xer1jAhjp5Jbm521Ggear?=
 =?us-ascii?Q?pDDmyyW6Oze58tgVwhBa7ooFHRdSWRoGmKw80WJd63PfyUAxKXdhpsbMtKhD?=
 =?us-ascii?Q?xXhKQP4WX0/fTwAwRyzlSOjlZ1JpjHe7a3IAGqyn118SwjuU2Krp35LPdsiL?=
 =?us-ascii?Q?VF/DaQl222QaSA17Z2GNJPukM9SpubY/W3ZBzHrb2WmWbGkiC2TWz+GZQsaL?=
 =?us-ascii?Q?zu6Dyds9ixTe7fm5bf7NAfhdQQa7HZ/XJsVAWbCEXsbud1AYxLNbXvnD/p5O?=
 =?us-ascii?Q?VzCAAvWjm13uGQPH8Qq9dTJNXM4F0cKHp4ILy6ZACxw2zYEroHAnen1/JqCC?=
 =?us-ascii?Q?TIoWNBfIzVp8enSoTMwk0JZP9qeYSUd3FOeBsRrIl9gmPOX2d/iGTinJay+y?=
 =?us-ascii?Q?/XjSJ6bkLXUq5mD+uWfDQYDr4of2GhlnxRdd1Z28A17lMxe3u3PTzmyM3duH?=
 =?us-ascii?Q?tcrluvYhty4JDK8pBuyMTi9SCRMduneaD7gqhJ2aiHR77YX9cUurGwP3zexC?=
 =?us-ascii?Q?4A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f96c97-9bfb-4ea0-7095-08de1c31e896
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 06:09:41.7188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxifLKezOn5ZSsroR5l1oNs9IUcfOwGjJBzmdKi2Jo7eazdL5p9F/htBToqv+leds0Sw36g9PtvXI1QOu6qa3GyOwNBpm9VQoIkXpF62HQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7400
X-Authority-Analysis: v=2.4 cv=UYJciaSN c=1 sm=1 tr=0 ts=690aea28 cx=c_pps
 a=1g1g+NiJF5nyOkqFb40SOQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=QYgQ88RBsRV6YyPL4e8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA0MiBTYWx0ZWRfX5HP6Ze+iXwtG
 GM1MOM/h5K52wom4DK8+5JCQLuAIikQWla+kIU3GP9Pf4+A62xYGaPukZMlp0torBuE44St7OnM
 ZEtDKXexiNZpegsH2QlkVqjGvwyh22Qr/60nLTyjc4/3gQJwB9B9Cbk21N/vjxgYn3iQUFSUsnP
 5dUGcecPxZUEb8arPUBFqyM3r51RPO75ZkLO8xwhFQAr3G/0reaLfwfOCwJwhGnuHb5qkDql9qA
 KEPAd+Kc6R+upoaA/NI/DpjZjnmfIW3fSZx8QsS+RLb05QzwalR9B6btrpNbRykW41z+Jj2Ba2h
 gNRl4GM7JVfnXVv2SSpZdLUW0W1Zrxb+cWtO81ULvQpB/3vvNUdN+CjSf/9lCs4sESRPfxDJdcC
 f7I/ji6SxGGimvpuuMGaFM1xS5Me8w==
X-Proofpoint-GUID: SEy_KXhvWd0-whblLHRMNWjtWS8CcSZu
X-Proofpoint-ORIG-GUID: SEy_KXhvWd0-whblLHRMNWjtWS8CcSZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 06:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121319

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

The branch is changed from mbedtls-2.28 to archive/mbedtls-2.28 in
mbedtls repo, so changes the branch name accordingly to fix the do_fetch
error.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
index d935cb233122..f5c2cf979a07 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
@@ -24,7 +24,7 @@ SECTION = "libs"
 
 S = "${WORKDIR}/git"
 SRCREV = "5e146adef63b326b04282252639bebc2730939c6"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28"
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=archive/mbedtls-2.28"
 
 inherit cmake update-alternatives
 
-- 
2.25.1


