Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7460FEE4CB
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 05:49:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.114648.1772257754188196731
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 21:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PuO98W6K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6519fc1318=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S5kLkZ706474
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 05:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=mKNGmaSPn
	wEPCiag7WzJ6j6sziCqnCZcQFgk5pvmXPw=; b=PuO98W6KP6vYhWg6x0zFBHsFX
	ntqsRvvErydOXSIOf0mjs10p5LyTaKSkJLXNAioBNOYcOMxZtXr4anPdKytRILwQ
	eoTJJRqTMEiGgvzhrwM6wMjq+klxlWFUUhb4E+a1YB3/0LvRAks9LvKG/FOOzmLs
	L+yiyIJUW8396JNypFZLxenWBC4+KrRDFOHYzMcuv4rnEy9Hx8ph0cfYzYHGzdWF
	SJpEpBttSYc/E2+NjfAHKk/GEciaobV8QEpSXkRYTy0A6PIY54/o6vjN0jgpXtJU
	OR6Wd8adqqRtKmNKH2mWk7aEU+sw3/AgSvQre8tQht1t4cd6/6zff22bzuKrg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012015.outbound.protection.outlook.com [40.107.200.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvg74w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 05:49:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnLYm72rtnTi+A+hxKNHQ2e/lB2BY4JrQBdwWXD+pOSxTgpsqBsQ3dOxVAlOBvTQp/AqBPsN07MR+1IXPqTyspArRD88xxY/8O1P5JaM2FWXVESPUbHPdLkUIhJCj9Cbify0gzHUxauzXMA3QLP/0PLXP/5In7RjHuLqhfjAEJI5KTZ51oCPZbrnQT1BSrCalgha2afy1dh7ReL2WLJ+jNn8GcrmKxTG2uja631vAaNSRftTVAJpZJFGDcxVoGzYHP6E53Eiebhy0HThBuzgO+4dtwZ0F4GooMLt9NK9R8tWW64qjEsXTe6DnWF5BVxJ4lO4c9YF9CeFOHijhgd0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKNGmaSPnwEPCiag7WzJ6j6sziCqnCZcQFgk5pvmXPw=;
 b=nyeqdElobWIdM5YYJSam9ml0TLAtrIJx19WpeZVf6i6K6IIeGvAJCcymJbASAGJPUXUbIgJT1hY2LGFYPn+BZkBPlrchLr16ZUpqAGr8EkpGRwm/HZcEgqCPtkrzMjultDd9Ds+naPL8UgItDVjv5dxVHpBwcUmmThlT8AYlbB3Fuxzw408LBESiBEPblgYxEwDUzWtA5oJ6EIboq/yYkuFb+9hAUbnL3Ua4aLqNq40lHY31wWVjDzDoOve2Ikalle/wIeEC/ldWu8J0Ohys0M94+fuS85z/dabpkvJGMMckWKmloe/Y4e6+SIMxcfi8TuVjKI9Gaw+TXTPeUdy62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW3PR11MB4667.namprd11.prod.outlook.com (2603:10b6:303:53::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 05:49:09 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 05:49:09 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: f_l_k@t-online.de
Subject: [meta-oe][PATCH] pavucontrol: add x11 to REQUIRED_DISTRO_FEATURES
Date: Sat, 28 Feb 2026 13:48:48 +0800
Message-Id: <20260228054848.3197690-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:195::19) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW3PR11MB4667:EE_
X-MS-Office365-Filtering-Correlation-Id: 1423da68-43db-40f4-c142-08de768d17a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	nq5vamyyeUV5fYtEsRjHEI4xjS7dB3syfRaC6dpXd01EgfAYpoYCDEBwom4xp25TGccoF1O8i1po0WasRKPBQBkVYwEfE2rsZJ8lnmcgtBzcGAcbItOuN+uPVRXLwbe/2Ek/w61VLBqlsz2GgF4hOUuITYPyxTvHB8b5u8SeCMi+qtobz1gfSdboMgxFNka3mEySxQW2ZqYrga/7aiL+joJysTQX5yBLb0rn9vj+IMJ0jl0JOpxAwY547TsaKR97SKEc+YCawyQqjRfdmelZ8/gXB/+X7WkA2gwlb0V0WUETSLAqIwrQf60iBhPnNLkg7ryXIhh9yxIz9EKuiCoaGKuGnwoOe9xb9oLnUYXypxHkD5+FLBlWml1PO/GxKr3hkeBHgqq/PPMH2vBWI8UCoeUESsEgOV0vL4c+q6iOygTZU4G2tvr6sFXCw4zHtFdIbKdDglqG5tlwOIqpL+t6YiiyGXkAX9p3KCofCz1aitYYD8yYDMFpy6keyCEBp9mku3NL2dwDfnj3TE4WYHdsOp7jdECgcYQkvs3CTkFd2IrggSXDSbvH35TFydXI+cOT8A6p7oedeoz13TXG+5y9jSoBIeJKzYqk9n0uaVMCuia6t87UsLl0BWUFdTjAIqKgOhSmoJkZuXO9DjixWk58WIIkcorf4PlqBbgp75Cb7qFassvEU3A7qBOMQ4RAyxY9ROMEe6sTQ7BOulaXqlLD/Xjzo91/+QlMSov+TaBRzx28IJn+HqQesxoZW8Ihme26
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TAYlho9EQdoEGwJkMQ3tN9aho6KNvOuUnuzubjevZ0cFxOPFKsZY9K32ajCU?=
 =?us-ascii?Q?bkZg2oIR9MxcxS93mvrnP9Zbe8cqFms+yjejIEgN9ZLHg7X4rLRUObryHDT6?=
 =?us-ascii?Q?34qW0Xf+xPPT1cXSvOAfxq31fD7Gl30u06v/AwoCvgPpPXoAx1nBMcitKDoj?=
 =?us-ascii?Q?OzU1XXRv927g0yGC1rnM/gH/cenemyUtx2CipSPxrDd0KEQsLMFLR2GlosVa?=
 =?us-ascii?Q?jBAlZfToU/DSHjVDObaGc0BauDHuTmFPp236lbBTUEccfVR0bFyJ3m/covze?=
 =?us-ascii?Q?a6kXdPdqlbntQMvlHBnHRkUefh36EhiaRJweYKwS+qdFw/1zCborZeNwPo3h?=
 =?us-ascii?Q?H+kGQO/vJxVJLowZdjAPB1nqe3+woFJRuaOv9eOHEINBF7fR/bL95IzNW0iS?=
 =?us-ascii?Q?jhAyyBc999hKUo8CiIg6X4djzzAbAiT0lJRmCb3J2BoSnPQcid19JLCRxvkR?=
 =?us-ascii?Q?n5eEDfdvDXfyYyxmM2ijhH91PxgAP5qvcRFIhZWb69m9Q/36nTBhwm0NiR/e?=
 =?us-ascii?Q?ylk4WurpZ/mcdMO0fmISm6abZcwvlLFrzHLJeRoiNHnVIHwFoBhdmD2o8bdT?=
 =?us-ascii?Q?PoleSRWBvlBzD1F57vVfMOJb+KxWaEn5f2/RiD7nimh62WG0wW5++KuoDZjw?=
 =?us-ascii?Q?3s5YN5oaldtBnKzbeoWNwDw2ehxBGMl5jSoSaeaC4hLUFbR6TifDBvqEQPnP?=
 =?us-ascii?Q?ge3pt8qTpjlT4WbUPcUNivabX6ecIaLPEq1iMribDRnWtNotAqQkOaSikqPU?=
 =?us-ascii?Q?df4qyiYEApuAglwQOn3fYAocIJs8JTBnjEszVsk7ZB0hFZx5X7Epic2w3N1x?=
 =?us-ascii?Q?zCLlbwXKTrJsI9YJX/ufNfq798N4haOKtKaSPvkyFDoxZRdeASWZ83wPwNzm?=
 =?us-ascii?Q?lfNYfUKqdTBT/G2TWm9NBYAh49Ehqn1vZU/Eide0tsRH0CduG58yCrMWr3K8?=
 =?us-ascii?Q?QAeAJPbpLeXNLe45LFO+iQjCKTP6HPz7GdESLuy+nB+zFMfQUPr8mNzsiK/f?=
 =?us-ascii?Q?X7iCvFECi5tbV8H6/FuwQ7NgqQ2J3r3uRPr7bsdGoTpegPyWV3C/BpktHXup?=
 =?us-ascii?Q?iF7HYe4jTeLjxHQ+JnHTtqJXlVXlKHVXVo+aGYTAYhCRSAKi7faIla3Y+B+T?=
 =?us-ascii?Q?87iFbV8Ji6icC2WqprHm4VDON63W8T0aUMogTXR+etW7myR75smmCNWMApMH?=
 =?us-ascii?Q?vinbuMee1ah/Vq5egKA+eLj2kzsm2TqE2POudnGEJENtDhbCM8bzFOAzj70Z?=
 =?us-ascii?Q?qIEX0pTM4YkcMdLQuIS2D2tto48lFEQ+bYCmkCmbt7QqTzNSs9m3CmynVNlG?=
 =?us-ascii?Q?R1parUPi4rtg2i6gAmrpo0jaI/TlgHN8u2aZs9j9e7LosGyymTudX58RSUv0?=
 =?us-ascii?Q?HmMuYl+u8WtWp731NkIkSBj/NdAfKMzX9L4TGJc01dhiu8ZI4T6szym8sORo?=
 =?us-ascii?Q?8tINfqPbJXJPrlRK44YLAlVA+brMs+BqMY34xx5tOfcxJcBP0JxwG6BNMVfk?=
 =?us-ascii?Q?tLfKoMBQTkqmfJ20ozUEeV/6Bt31fq//GfMdWbho47T+w/VVqJTe+1hAKxyZ?=
 =?us-ascii?Q?/veoGD4x3OvCwOPPDfL7JR1h2mLSzsLWQ73UvGAN0Y34Uwyykg39T4+Hc5Ec?=
 =?us-ascii?Q?vj7ou+8Ec9rAgU4tkvy6KStDIjg0nT4vjVT2pLhN7bmQjva4wZroSHBICE4k?=
 =?us-ascii?Q?wlG7+UQvFpjXjVBOJaV3cN1G+R61JCWYcYsW6yOgkZekHg1MPY2yXqwn3VS7?=
 =?us-ascii?Q?wdMY/0X90rZjgv+cB2l1CnH8kaQINvE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1423da68-43db-40f4-c142-08de768d17a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 05:49:09.6217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSGPrj8k+lifqY6UzxRy3RzHb2rEAVrjkoWHdFS4KpwcCNo61dVjbO+8gZmyilV6X3ZDS3HkXdh9LO/MkuRlNheA4jCH0kSzGhklSs2Kne0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4667
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: i_dYI88jfTZzUZwebt0S2DcQlZRJZSw2
X-Proofpoint-ORIG-GUID: AoXJ1B42mi52ojWbNfSPFerJ5RAGJX9k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA1MSBTYWx0ZWRfXz/PGRVIZNdbk
 ITho2WJCJp0QM/bt+M36J3ia/rGTU0XUv1KVojzLCLQZ3iS9rGrkbxOKRm3wgz+zMCbobfIRgf/
 P4p0P9toyLQ47PVlUT65Lvc/3W8db73m+Q4CeIfyq/5gbjz4IRHEtAUZCejzXiszWqn+/aIwD8+
 MHy2O8r9tkB0WXUfCHnXADCivuGLGKkXFzU1W74hkPZFelgL/tEa6ruqvbu8JUUECi0p5rMrM0W
 ZfSjDl7yaFXYzv9lwW6s9fDFFnIrU6I0yfy7P1v5wceTgwMJupFpKljK2xyiNzU6uLRRFfuEfgg
 rGBDRe9Uyj+6XKA9XrxY2le0DouRAmyUTp/vD+Vc676oyTaYd97DUsWodjHKhuCCetMCaWT+W19
 VjV3iduGFWz++jjCLcDmMbyIcTmxNqM6k+cEoIod39PmYgoDwmq8TgVOqX8PYNxM04Zve+vc23i
 tcVEwOfG98kqdtBbNJA==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a281d8 cx=c_pps
 a=CD2IJdD5qp8L8UJuiUkm2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=NaG2oOcSm5X-gwG36VsA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 05:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124769

pavucontrol depends on gtkmm4, which require x11, so add x11 to
REQUIRED_DISTRO_FEATURES for pavucontrol, refer [1]

[1] https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=aed20cd843fb00726d7c8da1aa19d238c2f9f195

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
index b6b9a068a9..9e54f49dcb 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
@@ -9,6 +9,7 @@ DEPENDS = "gtkmm4 pulseaudio json-glib"
 inherit meson features_check pkgconfig gettext
 
 ANY_OF_DISTRO_FEATURES = "opengl vulkan"
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz"
 SRC_URI[sha256sum] = "e93a7836c7307dcbc989e95fc7ec0878322514c475fabd90e89ed52fd4f15d32"
-- 
2.34.1


