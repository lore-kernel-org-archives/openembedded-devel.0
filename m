Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4799.1793995778812520385
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Nov 2026 12:09:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oOMx5afe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5770abbce5=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Hrodj3492177
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Nov 2026 20:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=as4bTJxCc
	yRGDtTIP++VwlW1Fm9L+RmDPivE/1IgEgQ=; b=oOMx5afeEKKKLmFQTTmFRgYVM
	u4KxrWNNhziDUJxCro50uzQIc18bGtkWzWdoILlGdvV8/ZJMM3TkMzb59fy9VHqS
	JFDlhVtK2SPOqnxWQSBaLBqM2ub/0fbk89vX9sN60zeHP0iMRsslshhO7nqL5peq
	TElHCXLfUCl/Nl0cxRPjiE/sLbMIoQNlOlsV8kuu/BY1+Bi3CGWNW+FFCRl2WJRZ
	fiVwXu5FJK+fWJicr6p/UbfBfJ4XlI43aJx9e9z9ZZ1Xjv7yk2bD9oNhvf7ALgse
	YGbw0wpksKnxEyUz4MMTxk77vMlBhQiZAM4MyE0DQNw8/jRhlY2F/zqTCU/wQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021139.outbound.protection.outlook.com [52.101.52.139])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hs3pw9nec-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 20:09:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ek0Tj+xqmSL3ytt9R8S0xUKawdXxaW+fjxgSgtYnxSqQjQZ+rPkXQut70reEpwZ5eOLNtmFAzEwwwzY6jMMB7cdAPm10PLWJZuV6Ggrg1EJ25L9zaddrxPHAEn7qMBPT0NYnZW2IZcYi3Gr7g1WX27ChHXMtYxxwUEeShCGe/+Lty0d9fnHqhsKD8b2cwd8Pqu8Zer7eWe4/s1L/8IoMkHBOnEawCXoFwrg4I9Ei2kiqe0z2oigvg4awYDcWohyxrOr5z+SQjaCYXLwzaLqOhTGrPCMmhD/GXvbYTgv6xGGvwSCddgGbVIlasL95OX1q1279aYQz6rrAZpwAK1d0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=as4bTJxCcyRGDtTIP++VwlW1Fm9L+RmDPivE/1IgEgQ=;
 b=G1b7Q2tgrvZGaAUriRTf+4kyrDY5gSKOx7wHkbmVAPcpDXVbmsRtufiXTyaF6lkdSkApbH6k5WRYwCMszWPx+lf2IrXfYsjmu2Wz7XsEkdXRLHGrgfuSq1rT2+IYG5cAW8dmzskKIWk4Xctb9ReG7nomQbYrw7oH+NMyLM9lBLdPc1nIFXk/3V7EfSGUBCKe9kJN76ozaqXIVtEni0VUVquG7x0+36eyZYvdEF+DVjxWNU9gtKL91WswVlLT2JjCY3B7v25//Xy5psx3mGb6XdJVxUxytlmAUbl7nPzbffa9dkt6aYQK5i9ZNf5qVn/l2CHXkNTGrHDQ7ml1vHykIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 DM4PR11MB7373.namprd11.prod.outlook.com (2603:10b6:8:103::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.9; Fri, 6 Nov 2026 20:09:34 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%3]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 20:09:32 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [meta-python][scarthgap][PATCH] python3-pillow: patch CVE-2026-112393
Date: Fri,  6 Nov 2026 12:09:19 -0800
Message-ID: <20261106200919.2366041-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0177.namprd05.prod.outlook.com
 (2603:10b6:a03:339::32) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|DM4PR11MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: d5930268-a6b8-404a-0614-08df3c41deef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|52116014|1800799024|18002099003|6133799003|10067099003|13003099007|3023799007|56012099006|11063799006|261022115727099003|261028144727099003|261021121427099003|261022075727099003|261102123227099003|261026140227099003|261009223027099003|261021123027099003|261022105027099003|38350700014|260925021911599003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: Y7OH0U4LOnS/83JnR7VB6tkjWfoEewgrAGs+bO/3HIPua+KdL8sYPamaYEvqdOAD6zDi0kH1U66DyTZq9pGLRq2R0p5fq0LnOVKzMSViXpIcmppwt+vnmVeVV3W3MUQFiuEom9oXQTFId0zqzynRadOgJ5Qw3SKIWao3946uC/m7pWkj4hsMTNCiDDQOHiB7OiVYig8CCn4EoKQ4u+EfjAMZG+V82N/8BDiiKX8lxkAYTFHB1YdAtin2A7g+a0+3U4i/Dx3CVmVc2iPyvfAbUpITbcfUo5mYJkeL5c8WQw5WZ1FivwucfFTcNYsYyXkQYhCShaqa1sZ6XedxlSvzCtlOoCjDegBUYb5ZRxcem9QkNrnb8lT1acRKQMLol1r+qT81OAIzK8XmbWqHjV2lkVha2NkGvipUKueVPYhtxbWZZcebh8RSwhs3cokBxZNaSu91mNqoKekl0b6QXTTiblgW5l8bIGckkQc30VkXgiKvsjzJ8wbHSWLV6mwHr90iCydfIjD/sAHdirtjpuKBvMf15XmBSsjj4rTzpv3k2K6Sg1K4L/T6RWYfOYPY0aAT9Rkzh/p6m4wHMPl+EmsYtz9VtBNk2khy7XYsWhF7rnuNoq/hX1Ys8XiiPjJdzaltFzr1ZyPF2Sj62uZutxXVF1l4LBYnPaGED2fsoHjidqBb8+VmX9xnBrk1UJzq1J3SzquIDu+wNgITJA44aY2IPOqfLt188d9/9ikKQT8mfwY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(52116014)(1800799024)(18002099003)(6133799003)(10067099003)(13003099007)(3023799007)(56012099006)(11063799006)(261022115727099003)(261028144727099003)(261021121427099003)(261022075727099003)(261102123227099003)(261026140227099003)(261009223027099003)(261021123027099003)(261022105027099003)(38350700014)(260925021911599003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7XvmaHOvMrvNy0hO8e37sOIweDFpyumAgBNNK2EQAZysaTKu+LU2SdGo9vA1?=
 =?us-ascii?Q?Zr4DUX/cMgTaN0lNn6kEATjaK/24eJwJG9orQ48lq1/n0X0lpd2YmUtQDxF4?=
 =?us-ascii?Q?CwocsDg8lqqJj0zjsPG91kHegFo1cUId81wXstBUIlGAIO+MOpUAkeIyck8E?=
 =?us-ascii?Q?7TfiG1eSE/62oA22BHBH9gATtningGlzBa4ZPcH8eQsF9ulgUBEE2pr4LRzm?=
 =?us-ascii?Q?SBNVCnTntL09pFNmLrhU5oSm/XfWbYbX4SD04XM4pig+DCbsSX+GOcY6OerW?=
 =?us-ascii?Q?B/TKerhQ1xsRgwLg9PVofrBPE04Yne1z5VToJK6IOxmPfBE22Ely78oxxiqj?=
 =?us-ascii?Q?w+02qXDcP9Bl42piXUjp8/2RVQ5hzJ71Bu/VaJZl+wA72WYXMRhiVLtmaJDZ?=
 =?us-ascii?Q?3v9DelNB3I7BraZXF3alImrxKr63R+RWW01r3SFKg3V/Zai702krV9EkWb0h?=
 =?us-ascii?Q?js7C8l4/6+TPcuCRwIYaWx64T+G8eyrD4rG+ISa7bVQ3Jv09EShDc5V7TTYF?=
 =?us-ascii?Q?wuTEjclpP9T/EwB7CvhHvsOYkDvB289n6JJh9lGj+Kc9QImTgU6KMcvNaypS?=
 =?us-ascii?Q?4m7mkuDN9JpVZdC/bDPEFVcVse56GK55O+dPduwbf4cO0624pgsbYOv31jjg?=
 =?us-ascii?Q?40xjO3fJw8gbMTWvEzTOD9hYDFJCG8ImZu83sD9pZhZoekG3H1SjHBpH4EGi?=
 =?us-ascii?Q?9s5W0saO15jddPCy0YBUEoslRsHtRF1GqHLtGi1xzPkK0DerCS75+HylPb7F?=
 =?us-ascii?Q?hruZQhf0NHv3Dfy2ZUdSAXZDfvop3CPLXl7KHlyqqoRubdWBsvKXKnbT/0N3?=
 =?us-ascii?Q?QbgOgbUsqB6Qcc4nNf5D2iuVOMY27EQaevaoKFq5g0kOJp19ez+ycctNmLF/?=
 =?us-ascii?Q?QR4b1Y0lqKgvAlGbwmK0gTwLb4fyeKUDC8hsFoMgytrPkenO1vp0WDS4L/9k?=
 =?us-ascii?Q?OqAkaRpGJnIPTHxxWl+dzpEn3+KR9Zn/rhplVK2xxgvrdY3AFTPVa3haPQr0?=
 =?us-ascii?Q?KIFdypzpa6NcBSVvY3MiLs4Y0uBC84Wmt7Xf4wLHGhTHjXZnalbrj4t9ogmh?=
 =?us-ascii?Q?kI6MRDFb78TBiZ8gQJIAExPbdJnM5n8HCJwdVhYsrGqRTW7pDf6P1BShn9+F?=
 =?us-ascii?Q?bahj/JDXnA4XbQqpVeCiwR65pM/oVtZTdgFutJ16oED0Tw19O/lK+YgaT1qk?=
 =?us-ascii?Q?fQgo5+sSw+g3vUI3IJZWyTDErErfY7ioq9gr1ROEYsAyMqj+viSH9L0f3OOu?=
 =?us-ascii?Q?YGLlIUOVIWmcZF9iyLLOAcaWA3TZNv19pCDzRj0Vk2OMhXUOwdN2LYVgUJZK?=
 =?us-ascii?Q?dRGdfVi+8kGCUSqLcuu1UBeTfiaAzKGo2OtR67lbpPg8QKrrCBlFoXCPE/1u?=
 =?us-ascii?Q?WGxefI52aOl0KoLwKl1Ibui779dAukygiFK9ghRP0FwilTMI0hQ4FtyDEJZ1?=
 =?us-ascii?Q?fV02KhjC/kB+FOj6udlTyknuBoNsAaM7l30OF9Ta8HCP2bKQU/XX46u4pOsq?=
 =?us-ascii?Q?ygBFsoDFX53QX/agVCr7IBCu4MgAoFe4kz4oynpRSOqHl5BZQDsQNx2U5Ygm?=
 =?us-ascii?Q?45dWOXDgyE6PGPwWzKD8nftZeeRZNRkPYJCaH2H8S+psMhcWl9dPDZfmFWtQ?=
 =?us-ascii?Q?Q6LfT1brcwXzy4SbdQADN7moUFTAgLiT5k0tPTHloieCmXWz8knMqKyjYWB+?=
 =?us-ascii?Q?Pmu1Fj54bKuPbNkvge9URD/78Nc/GWA7oLLyIYSmHuza12HE6YU1XlAMw5mb?=
 =?us-ascii?Q?yluDo3PjwstMpsa5orXxGNFp3wOVLh8=3D?=
X-Exchange-RoutingPolicyChecked: T7KsicYx+OJYzUma6AkaZ0nO8OIGjhq5PTOQVvW1OaqWuANN3Z2BkvQFstSWZhC/TDxJSr0RoLWi9Xq2qzXHCzluyQr70rlzHhIY5+RJ5Bw1VbUT+MSmUqHvwtJW8rR3/LUBMH5Evcvmpbo6sZ2awU06RtNWJoDatlvNTdnGNPzHHiBF3SLMlSGBB1uAxuMYDx807kjt0iE7EfmbKSN6VCC60Ka53TbTdifKPb825AYJSdVmSlldYzHZhtro/qoaG0jjzXdP3rAoXrpH8bRawXg7PPSovTnDojOcKzH7fDMmYhyzoLrSLROp2YN2wQNaXcyDJkuCCYbkItE0QvtiQg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5930268-a6b8-404a-0614-08df3c41deef
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 20:09:32.1830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRwP+T3GhIEqlkZIe4no5IjUB8BkBJD1XgQl3XNXYAwpu69HbqA/XYYL1QOmGriyxl1QNLMpI4nXkddk0aR8/JJAsLXKG4Qbega6K0WWhuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7373
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4MCBTYWx0ZWRfX/ZaNWiOAxILR
 BM1+GHcHtQKOyF3iHyMkKEdB7JfoXjQ8Hbiy4v+uorUHNUuFS5FahLn776AMjakaNfZLmNPHvng
 7b6jl79aO4CckoZVIW2/jxrnh3MfTv3EDJrMFBzeM4/7yxMp85vY
X-Proofpoint-GUID: mlHP721Yw2GTgsQUCk8-5RcdBlmtFfGF
X-Proofpoint-ORIG-GUID: mlHP721Yw2GTgsQUCk8-5RcdBlmtFfGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4MCBTYWx0ZWRfX8k0GzQ3yhy4m
 JFyjPqt+OyH0O4VA/zruTnUisA8mIFLhMxWvHOhRAdRtSuoQsTlzJIkD/9ggDcG4gRG6Myb6CGe
 xu4wy/dat4uKMDSWihJSpDHyCz0ckz1Gs3bQRJVVq2JgIOFdzKdxrEIsaqq9hmhi2cHZUrk40JQ
 Q9GN8/iZ7fhD5YM3VyekoPoHFRJQGqXypgyq5qGgmJKI1RV7SSkWyklIuomy6Vd1bVcrCzLp6+P
 H5LeAmxhaIqi0PSUicrtC0Kfz081xxuxS1ICjJtjJRPxmh7LA1NjxLFXVK2vpE/b8k1md7/8nRe
 tCKorPC4dFRY2n3cBsz4WLJbDNP7Ju+fmjJVGHqi/G79awllsR3+q77XsiyFetqe3IQjsPxG7qX
 LpfCqlEDo6QM1czBZRJTIUDgXqk9HbToMni5mCCAuTS8rU5+0It+lclgfZteYFQJkas7YhZPA/d
 ZMxw/ojf7rWPLeo1RPA==
X-Authority-Analysis: v=2.4 cv=HPlWhYtv c=1 sm=1 tr=0 ts=6aee3401 cx=c_pps
 a=Wom93TYtTqcYiR1jdFbvTQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=FvlJRdF6AAAA:8 a=6gl_cCoBAAAA:8 a=Gvz4uYy1kyGDn9j8a4AA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=QLZTDCKk5HCdsrdKW35d:22 a=Bor9z-CvbNo2M6AZn8_k:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060080
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 20:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131974
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix given by the commit in [1]
to address the issue in [2].

[1] https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f669013f4
[2] https://github.com/python-pillow/Pillow/security/advisories/GHSA-332p-7hrc-92wf

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 .../python3-pillow/CVE-2026-112393.patch      | 131 ++++++++++++++++++
 .../python/python3-pillow_10.3.0.bb           |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
new file mode 100644
index 0000000000..e7cbb8825e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
@@ -0,0 +1,131 @@
+From 0935528eccf42e3be72e414f1ea32aa978abc8e3 Mon Sep 17 00:00:00 2001
+From: Jeffrey 'Alex' Clark <aclark@aclark.net>
+Date: Mon, 12 Oct 2026 21:18:41 -0400
+Subject: [PATCH] Fix heap buffer overflow in _tiffWriteProc when saving TIFF
+ to BytesIO
+
+libtiff seeks past the current end of data when writing the directory
+and writes tag values there. _tiffWriteProc sized its realloc() from
+state->size + size instead of the write position state->loc + size,
+so the first out-of-line tag value written after such a seek could
+overrun the allocation by up to the size of the directory. The bytes
+skipped by the seek were also never zeroed, leaking stale heap
+contents into the saved file.
+
+Size the buffer from the write position and zero the space added by
+realloc, matching the semantics of writing to a real file. Reject
+writes where the position is still beyond the buffer for the
+non-reallocating case.
+
+Reported-by: carlini
+Reported-by: Tomer-PL
+Fixes: GHSA-332p-7hrc-92wf
+
+Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+
+CVE: CVE-2026-112393
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f669013f4]
+
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ Tests/test_file_libtiff.py  | 35 +++++++++++++++++++++++++++++++++++
+ src/libImaging/TiffDecode.c | 19 ++++++++++++++++++-
+ 2 files changed, 53 insertions(+), 1 deletion(-)
+
+diff --git a/Tests/test_file_libtiff.py b/Tests/test_file_libtiff.py
+index 6c32b5ad4..9f43f34b3 100644
+--- a/Tests/test_file_libtiff.py
++++ b/Tests/test_file_libtiff.py
+@@ -675,6 +675,41 @@ class TestFileLibTiff(LibTiffTestCase):
+         TiffImagePlugin.WRITE_LIBTIFF = False
+         TiffImagePlugin.READ_LIBTIFF = False
+ 
++    def test_save_bytesio_seek_past_end(self, tmp_path: Path) -> None:
++        # When writing the directory, libtiff seeks past the end of the data
++        # written so far, and then writes the tag values there. Check that the
++        # in-memory write buffer grows to fit, and that the bytes that are
++        # skipped over are zero, as they would be when writing to a file.
++
++        # 7 distinct bytes per row: PackBits emits 8 bytes per row, so the strip
++        # plus the header are exactly 64 KiB, the initial size of the buffer
++        im = Image.new("L", (7, 8191))
++        im.putdata([(i * 37) & 0xFF for i in range(7 * 8191)])
++        kwargs: dict[str, Any] = {
++            "compression": "packbits",
++            "description": "D" * 65535,
++        }
++
++        outfile = tmp_path / "temp.tif"
++        im.save(outfile, **kwargs)
++        buffer_io = io.BytesIO()
++        im.save(buffer_io, format="tiff", **kwargs)
++        assert buffer_io.getvalue() == outfile.read_bytes()
++
++        # odd-length tag values, so that libtiff pads between them. Large enough
++        # that the buffer has to be reallocated
++        im = hopper().resize((300, 300))
++        kwargs = {
++            "compression": "tiff_lzw",
++            "description": "abcdef",
++            "software": "xyz0",
++            "tiffinfo": {315: "artist", 33432: "copyright!"},
++        }
++        im.save(outfile, **kwargs)
++        buffer_io = io.BytesIO()
++        im.save(buffer_io, format="tiff", **kwargs)
++        assert buffer_io.getvalue() == outfile.read_bytes()
++
+     def test_save_ycbcr(self, tmp_path: Path) -> None:
+         im = hopper("YCbCr")
+         outfile = str(tmp_path / "temp.tif")
+diff --git a/src/libImaging/TiffDecode.c b/src/libImaging/TiffDecode.c
+index e3b81590e..1c9246595 100644
+--- a/src/libImaging/TiffDecode.c
++++ b/src/libImaging/TiffDecode.c
+@@ -78,14 +78,20 @@ _tiffWriteProc(thandle_t hdata, tdata_t buf, tsize_t size) {
+     TIFFSTATE *state = (TIFFSTATE *)hdata;
+     tsize_t to_write;
+ 
++
+     TRACE(("_tiffWriteProc: %d \n", (int)size));
+     dump_state(state);
+ 
+     to_write = min(size, state->size - (tsize_t)state->loc);
++
++    // libtiff may have seeked past the end of the buffer, e.g. when writing the
++    // directory, so the required size is based on the current location.
++
++
+     if (state->flrealloc && size > to_write) {
+         tdata_t new_data;
+         tsize_t newsize = state->size;
+-        while (newsize < (size + state->size)) {
++        while (newsize < (size + (tsize_t)state->loc)) {
+             if (newsize > INT_MAX - 64 * 1024) {
+                 return 0;
+             }
+@@ -99,9 +105,20 @@ _tiffWriteProc(thandle_t hdata, tdata_t buf, tsize_t size) {
+             // fail out
+             return 0;
+         }
++        // zero the new space, so that any bytes libtiff seeks over without
++        // writing are 0 in the output, as they would be in a file
++        memset((UINT8 *)new_data + state->size, 0, newsize - state->size);
+         state->data = new_data;
+         state->size = newsize;
+         to_write = size;
++    } else if (to_write < 0) {
++        TIFFError(
++            "_tiffWriteProc",
++            "Invalid Write at loc %" PRIu64 ", size: %" PRIu64,
++            state->loc,
++            (toff_t)state->size
++        );
++        return 0;
+     }
+ 
+     TRACE(("to_write: %d\n", (int)to_write));
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
index cc05570dad..240fec967f 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://CVE-2026-42311.patch \
            file://CVE-2026-59198.patch \
            file://CVE-2026-59204.patch \
+           file://CVE-2026-112393.patch \
            "
 SRCREV = "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
 
-- 
2.49.0

