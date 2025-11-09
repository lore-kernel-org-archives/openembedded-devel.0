Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F50CCFA1E
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 13:41:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24943.1762695662515634101
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 05:41:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dfwpVmRF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3408a6cb6d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9DR36v284494
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Nov 2025 13:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=r/uMoXc3pnH+TIh2f1MoZ91/cTnOf4mrq5wP6DXluV0=; b=dfwpVmRFQGQb
	36ttNHMv+cN/ygJKcUdDEIOJ51emtNk/9iUE0EIX8UkMg36e3rA5fxnMKUhLvWdK
	fG/83J8R1BtsJUJmmrQId9DlASN/OjEgFDiV7ZWWsPApzy8Rb79Lv4boYgU//NXz
	7RaBIJVMZZoQksgaEX7hr3X4witEy/hb2CmY0vsc4pziWOsTGnW0sh3ApPBOw1u0
	L7QoMFHcB1CpbNI0GuyxmOjCgTOx9E1Vm5erarbOQrjamsI9XOex9e1ibjkvRhk+
	2HUgcyHvn9KXHTtzMo6qAa583eAQaXLj9JPrB9PdLyhMK3ikBO6bMck1XZUXl3Rj
	HJN698qTDQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9vu90yyf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 13:41:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnVJLBXQxfZSxgqo7lXEo0ScXDa5yq2O1hs94PZuwcLMkzdfid8D3vnAt/6fRh7r9h0RqVpMbXcVzLw6P49A9YfBFhYlV7aBU3bCmMITH/VDxyQGfeuM4o2L+mbckF43/9uWdYEccKyw1CaYB21LvAL3syamHKzC6d3nuMK80KMbRwBdYBqk4qSabj+wriK1IQ0C1g3G3lWeMngSuqePMfgovv108Sh6P3ZjlXfLWtISZ9Q+Pz4ZpwQIy2PaCjodHekd/V86NdJGE4OZbL7gRQsAF2dDU5YYiTpeB1XMKoUtsx96gbrSvwWbjUfeXuWV6SetOq6yWMTEFxd/FW1PxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/uMoXc3pnH+TIh2f1MoZ91/cTnOf4mrq5wP6DXluV0=;
 b=dsDyfHXoQU24/XS6SQ8Fdxh8vWnC1ZY0dCUlFhYbh2qGUQWgy4IXKuVoLMFWmhPIjSiLa32tfGwM6OiBNTrhYEPBy4NgjMnW2AEqCH93J23uj7dCV4to0Ad22IxiwXVu4U3FxVqe8y3b5F9DDp0xhDgZ0ohstCtzL8/2pDHxhmeQgX2WRQeshxe3SMlrK0Mqgu1+3q6dFxWUnOEU4mq+iuExFEpNR16HqO5t/TNKdFPkM4X3QFtZtiDAkNMIp4voQGGZOEIIsXokL8xBurmdyzn4sABRhfCGpRdUT/xLB5gZ5CskxCoQTWwbsnWXz2TGHc6sQsaK8P0tiM1weGfz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.15; Sun, 9 Nov
 2025 13:40:59 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.015; Sun, 9 Nov 2025
 13:40:59 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 7/8] tcpreplay: add UPSTREAM_CHECK_REGEX
Date: Sun,  9 Nov 2025 21:40:34 +0800
Message-Id: <20251109134035.2741548-7-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251109134035.2741548-1-yi.zhao@windriver.com>
References: <20251109134035.2741548-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV2PR11MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: 4106cabf-90ab-454d-2555-08de1f959de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gR4E8bYYOBiNS5gbyq564poY6VE57MW8RSOLQwztLXxBMEittcdLThWCD5Z8?=
 =?us-ascii?Q?escDdD/nSQdLmL9EIqM3drI+H4Fl4p/0sK2Ual47GU6bbHhCJE723dmf6nok?=
 =?us-ascii?Q?EBmENlSOXOc8tN6dcN/laosblPNjPwB+BCawwlzfu+GDRBuCvdITxuSduVq/?=
 =?us-ascii?Q?mgNnKDf/BMRyjmAhL4qp/RfQt+Nf2Y8ZOdyDtvHn53cy3nqLfxDgzhVpCRYl?=
 =?us-ascii?Q?x5zROCSChLyOL9XaJbFiKylAF0UDwot4czreraJOzoF74WeIv3QCMKO+vYvB?=
 =?us-ascii?Q?oFCFgW6EK1GFPJGa4YcV/Es7iUMnG64Aj87XeYDUMrL/R0q51Hf6mmMBMvUn?=
 =?us-ascii?Q?C+D3xgVjgHrZ8sZV/Elq3wIeByeTplcSBxLvsPLhq7/eVp1pf0KEzuSnoCGF?=
 =?us-ascii?Q?Vpmjs4H7YpBDyhhLVBLxPQVxNVd8SiK3nlEmprmu7rlzQjXjOu+7ah4ORjha?=
 =?us-ascii?Q?cdAL1bPx9Vh/Nq4A4p2wu6OubcqOh049QXDYLuvou1WOEuQ6zDIn6it/fqLQ?=
 =?us-ascii?Q?2N7e9DKFl8LgBKzpiLJOepCgy6KOqFRpUasa9TuA2UggmqdmlUSZPCvDd8jb?=
 =?us-ascii?Q?eBZ7gf2wv3KyOJTL9AO+LgVAJWBMd/ITK1J0jxAg+Xqaj4pbiX10Ef6JrjZ8?=
 =?us-ascii?Q?PKuXMImJBaZzBEKhF92LBHABa9o+w90mxE01hsthJgQk2qTA/HaKi7rb6jua?=
 =?us-ascii?Q?93cLRWI+dJZd4MyFT4x3aWVHhL5g5FigJxDxdAAHZ415dEz4M1ilpMZdX5uK?=
 =?us-ascii?Q?ARzC/qzCMVSN1ezRCP+A6vGO2I1iJhUGWiYqOneNjP/dxnx6cnoM1HkjSo1Y?=
 =?us-ascii?Q?S7arN3jkJJ0LDzMdElTKRGjTi9DwgXF4YSwjHajEUQbYoOQTEU8C+Nbpe6A/?=
 =?us-ascii?Q?/qkWAVGqSG740u8N997YAtjJFWwmVxAd1QwZZkWvJhVWZFqS8KC5msI5W1uz?=
 =?us-ascii?Q?Bm5s+QL0MyjCx3hpgNdBlyoXQA/84p6wiMRJLC06TzP1U5HYZhsxNljH1E0C?=
 =?us-ascii?Q?oaqcqVgPCJxjUPnX4zvkBADH1B/p11Ys0+ORFk4hjrVVOLUjhFeXzEpAK2QZ?=
 =?us-ascii?Q?7u7gBAZxbnb/vWg5GrYx/u6Ofd7QWyWJrO5g5uMYxmqq9JHMs7lD6+FPSonZ?=
 =?us-ascii?Q?1GfuwEGr7bBDt8G+qkJa+azWYocB40Yaxp2YDArimoSpITek+lAObTyzz/Ib?=
 =?us-ascii?Q?1YBlqtiHFuuYQg0tJEmy4zht7VlZ2m+PeBnPfcDgRAG9Xp3E/42QFw8kLKx6?=
 =?us-ascii?Q?wtnG9TTNVlgk/vrxudykfQxUmSrn402Hd/QXht4WumxPOD9WFUG8sJ1vLwGb?=
 =?us-ascii?Q?VCl4svq5Myec7rs8Sl/ALPll7Jwb54a4IQPbB/QrhShiP/A+1umGBsjEallN?=
 =?us-ascii?Q?GCDyUNfFFguWlwkfpTgF7dgWVftpM8JXhaVzBuN7RYu0Jm0FdAatHRydxITL?=
 =?us-ascii?Q?WWdcW30jX6De3sdfrbcAFJ/E+LEhOAXNm+PgwdejL1hb3ZG+GabdhTnZn+6J?=
 =?us-ascii?Q?Hona1hgshnseg34ayZPZZE315VyHRAi0cIN0vAQClO70ZX/1fbzXUXCESw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?r+BLbeP5EnzSxDpu9zIebQ3EjCcI8o9bWU5hlo2IvDX5RGnVZwTYpS662fgg?=
 =?us-ascii?Q?wjzyB1PDKNCuGa6cd6QPIgATvYhPHSNLMWrZ/rqTwHL5pCDqQpu3ZvhiQOH6?=
 =?us-ascii?Q?6V2ZueeS+a6SgrPMYqASmCGGJ85qCETxu5c8eVFB1h5Mht5zgE7CviAwRU2A?=
 =?us-ascii?Q?QUgn7DMNXovFV6tKkBTbwluX7xKzZ1rcIMEK+5n97kQOKVk4Ixh8VN5B4Pnm?=
 =?us-ascii?Q?b3KE7JX5mcTXQCvrSEX3iz80ELnJiLkHfHp5JmPbjAW7z6y8v3BamWegXVtt?=
 =?us-ascii?Q?H5aSevGRPS+nYAtPthyNgX4pYXmHnI31djm4KWLbNwAgw9hxieybhFLC2/kD?=
 =?us-ascii?Q?NmDXQK2w8iAnyT08gCquVJsZZ5IqA9JWKBYbYc8bTeK4Gp6Y4705rSLS3EnD?=
 =?us-ascii?Q?9mNQDOap+DzF7jzOIUHTKaUYlo3NrvbJjfBv+jTYdsZbkGl/1Ai4Fq9bdMqn?=
 =?us-ascii?Q?72ogwI7O57othVFw3ka5BLFHkyUvxSPCAvyfsC/pld1RUwLcugrlj+vMzTNL?=
 =?us-ascii?Q?PRceqbRDAax15Y8N0jbRhyCISsbM8jQm2G3nRF1HhN2XhE1/Z0GjDLWRkrXF?=
 =?us-ascii?Q?DqX/rBC3hhgjkNo1EU2RfKcGHZ+wAAGO9hTLPZfznm/IPwjczLvt9xJj8zI4?=
 =?us-ascii?Q?738wvpC5GXaA1ewFxyuKiZTPj3DI08bCDfvaCxY6TZCZVlJrC8BcO8eh7UjK?=
 =?us-ascii?Q?0B3RJXvJ59ABrBkTaJ3QVKPLXBMvGyLLNhyfgdqZigXwGn3feNhc0JTz9tbx?=
 =?us-ascii?Q?VMfLmKgoTiGLeZCdLCR36TAX9JnTSuxVbsiSuGqO2ytFDJXeu1090aRMwbjo?=
 =?us-ascii?Q?yPe1x4sxPFrP7mIPHIQbG+Iqo6sdglP/u86aoaw8f3u5Cn2veyBXHQY48Av8?=
 =?us-ascii?Q?sy1hTWEtdmcx5n2E7Ns4xKZNnv1qcPJmh2FcRd1pOV4vahom2Ihiduzi/bTG?=
 =?us-ascii?Q?01aGo+Xc6GPOSNebpFtc5XNoDc3/3Hr9nPlzmK3I8rk22lDf1EH3cV4Vzlya?=
 =?us-ascii?Q?jm/pjsT19YVq0lo21dwvB3kBm85hhak+1bJjN1VYooGnh8KERVhJN09bwXqh?=
 =?us-ascii?Q?3JonAQsbRfUDOVL01i0dTbg7O3ETojr82czCYC590hkrT1KMVeFGJG8UGZbF?=
 =?us-ascii?Q?35qHZtY6osSKIFch+bLbfgAykvlTFCjKAUkpuQhT0YIxLXCtCyzpt7lU13no?=
 =?us-ascii?Q?Up+Nml2s3uL5y1wFXZEy3fviWcCkCP9cY30JXCvh3V4To6GZmugyYOt/m/wc?=
 =?us-ascii?Q?u4mGPA9OhIXt33UqQqcigPq5mnzynJ6GtnengmfQSZP+6rv3h1PKddbyEQem?=
 =?us-ascii?Q?ckpX1gvhHROII2054rpmwQ7IC48pdTF1/cvFjJNHmul9hVKbZB6tVkucTP1f?=
 =?us-ascii?Q?ReC41PLOOhggBe5pIKvZG7ur5KSrAwbjfgraj0t3u1c1WzJ90oxaKBsu2dao?=
 =?us-ascii?Q?KslSdbks8qGxq+JAlBWBWOf0DDf/+g4z+5hc59ruXBsj8qpkoD2kk8dlAnFj?=
 =?us-ascii?Q?GVISwqI1hbOEbR+xwwZWyZqcVFlHwdKXW042eJRcnwVpFIkjsruy6lAoPBkt?=
 =?us-ascii?Q?YA8htaTjdph2W6Wjh8ugAzmQKMYXeNaUBPbYbeM5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4106cabf-90ab-454d-2555-08de1f959de0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2025 13:40:59.5587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LF9w+oc+cPrarDbSj86mnoaDOLB50sZejj93VKrtj2evZwCgJyGED7X1TFtJBqYhx7/SGIelXPGY7MP3dPJoOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyMSBTYWx0ZWRfX5KIvN6/661wB
 atyGqwetZZi1KjLlnI+HfwceEzbaLud4EBsQdlaGZ4ki7lFxSqC4dqjeIyeW7qzseX3fvLeoOx/
 UvtQBMHFq2H26MWpuG7VI1d5wJ/wWzCGRY/3va/fyf3XCs4Zb31iOmMYIxscjdJQ4OAhu440Exe
 HGJj/pnvb9QwYVc2p3SiCpi1VP52pk66GF1SxDbqGXVOhXu3TbgtzRvt+EEu0UWjatbeDG3lAPN
 SnJQG80brvchaasDrIvL2Vy7AuMAgdhA1ITK27HVkCtyyjtNjIOnnBq0XMHwwYCWZ8QH/Zs3MJe
 abA7ggZjXELiYX+OPxYqf++pXZmER4XdCUG/c3gA2V8zPpJG47so1GergB2QlBFTPLyL9aIP/a8
 07YnPZpYmLFfqBWQlgjtrGuYUPCJRA==
X-Proofpoint-GUID: q57xfLrXtFs9_-JaYx49cemIB7BEGq0p
X-Proofpoint-ORIG-GUID: q57xfLrXtFs9_-JaYx49cemIB7BEGq0p
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=691099ed cx=c_pps
 a=mU5w9pKRZvfSuQy63jiYzQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=rEmvy2RVTflngj2c6UwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090121
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 13:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121413

Add UPSTREAM_CHECK_REGEX to check the correct latest stable verison.

Before the patch:
$ devtool latest-version tcpreplay
INFO: Current version: 4.5.2
INFO: Latest version:

After the patch:
$ devtool latest-version tcpreplay
INFO: Current version: 4.5.2
INFO: Latest version: 4.5.2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
index 96a7087b0b..efcbb13439 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.
 SRC_URI[sha256sum] = "ccff3bb29469a04ccc20ed0b518e3e43c4a7b5a876339d9435bfd9db7fe5d0f1"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "libpcap"
 
-- 
2.34.1


