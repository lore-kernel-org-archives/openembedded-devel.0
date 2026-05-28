Return-Path: <xiaozhan.li.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA431CD6E44
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 09:55:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7414.1779962147991272169
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2026 02:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HDpoFxaj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96080343a2=xiaozhan.li.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S6dcZx703153
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 09:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=+aQPk6fwV
	IilqLmq+P4IS6r5cc7JiSUgcoyqDupesaA=; b=HDpoFxajN4xwKSUUms/GOW8O3
	ZsHBihQD7wh3u/XF6FwYgZPSUU+byRZ2GY9G+vQH9GrN7iFUU4TcyWKjOkdM3dea
	hVKxpikRtOeCL85NDrhgpiWZy4vz5nO7NQvLRjUHyufoTrmsFKBNhZ2+JyvaM32h
	HiOOCbA2P3XUpk2na6put6Key1mN/KD3d3KfCrBUQVjurWQaLAVhZG4Axiy7T7gX
	FH1iETh+XAmrgpgkqZFg7OjGYaasgWG8iiQQkmI57sD3myFlHR47xds5Mz5EBv//
	/mMq3fqSK5XUDkvk7L1977Hse7jaVfmOeWxoISjvVn997PfFn18vwW7Hlao5Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011001.outbound.protection.outlook.com [52.101.52.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x3gm6p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 09:55:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9+JTSbxRAUuF/op2AQYhy56n9oX5XNf9//aPlxD9/9i/GVoQfQLqq0NA3Akgnm0X9drKG26tUzjrvFLVaUHv9MPsoEqM3PyICPJYnKc+KBHcHHzD4l/aeGFAGtFYpk073vLtT0bwWEA/e7UVgy83XHCHRKtubnShMHLEvRqdru++oJ3pzoFdtCx3te+A9SP2G2FeHRYTAPJxZmu8gUU7wCG8vNNBrvzx2857Gwhh1Tt39FA9xIpskCIbwlnZSr5jfcnY9mVG53kG6VftiErN156z38y3mi4OGtFCyUHRLe6BaBl/mEDokd7LsxrZ4JTGflUCr31MVTi4Gh92cDmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aQPk6fwVIilqLmq+P4IS6r5cc7JiSUgcoyqDupesaA=;
 b=d74cwgTVsixGm9Y2iSiVIY6rWLwk2K457mZUV1LRAXqeIe/VItSCrWGWJ7FEDSERQktD2UFO7E2XeQh/mV5Lv2MyCxQ36C+vTxGZ/VJB9cKHP8OH0KSHk3ILdocbWlD65IxsaEXcYx3YcR5EmaYNgmPmbnO/dXFKgXZ4Rki8qsLMnyo7fKa7e6dFs2ZYA6xGXteBFkxXGq7BbCleGV6l9AzGhCqkBVIldGST14xgNnpYOWUr5hmVHa7KbRKm2fWUiUePeLnNYW9PbxSvPNaQHQEvJiNO2xTQ/gJH7jdMWJp30gA0jFpv3Riy9WfQSfJh9j/dg2pypP6DQ+d0bdfeuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13)
 by CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 09:55:43 +0000
Received: from CH3PR11MB8344.namprd11.prod.outlook.com
 ([fe80::5596:e734:3fd5:4fc4]) by CH3PR11MB8344.namprd11.prod.outlook.com
 ([fe80::5596:e734:3fd5:4fc4%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 09:55:43 +0000
From: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: xiaozhan.li.cn@windriver.com
Subject: [oe][meta-oe][PATCH] haveged: upgrade 1.9.20 -> 1.9.21
Date: Thu, 28 May 2026 17:55:31 +0800
Message-ID: <20260528095531.4003329-1-Xiaozhan.Li.CN@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0140.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::14) To CH3PR11MB8344.namprd11.prod.outlook.com
 (2603:10b6:610:17f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8344:EE_|CY8PR11MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: e08135ce-8610-474f-60ec-08debc9f4850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	D2HWFNSctfRry72B8SDUfNM/aFi9xbCD7tkQ1egi2TO2Zm4vuBIzW5WZPVmIrS5Kj+EsJ4hLlFvHlvFDKjXBwZt5fiv3Z+K2XU3fDBaEsS7D8pCbtFbRDFWrXxuAeOR1iHoFbgW0vCdSbJb/77L0TcVLckHeUcZXEnpkxurETJs1si98T77brEfKeK4xZedbWYiIIDaY6Lgi6sSPsqm/NP9yU9VbJqVYD9RYrxqWgiPeOu/8hlGuZDnthWog8hl1sVy9muPtw5PXA9JtCpLYqbNKvAebbCZQa45GMJnXGKWNJTao+ADy6nwYkjBimEQO9qTjv1NWgH4gG1GDbCr5bIbvAX8YvW6qpQZjI7fjD/4rVvokXAczLymkXzyd9gTG8wRGShFWQ5dW36WHiUFzOLtp+e7rQ6xJy6OZDV4cS8H+D3uM7T57MvsWro7C6Rqp1YLPUlQLDysOuOLUT3et4ArrI6pr3kSHgWFTtlrGexspM7JsAUfV9H5+zShLO75n/He2qF45mvF+W4ZiydnIK9PGooVYJWBsGsZ+35pFH/tZyby8tg06xyG5bFjspn5XOxdTI7R1NV8NI98mB9X4JQ/j0fAezDJbIGj5HOjfklPzMvv/wscxARTMshK06AZNZZ4lw1k2GlB7a3o7Qdcpy/07Gr8f3Luc7JQ0G4AqClxaCRwaYrP6JToZC1VB+6sUrOXgkTfw/xZ6xlXs15psGA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8344.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4xM7OIP5aI0WpcYRVCjPOs4U11VCXh78yKXEEkw2kSJd3ZTlCz8B2radaWas?=
 =?us-ascii?Q?m5esIds+cq4YwQMCgLfoErAfECJoC+MxEyHMHHRjzUv5zliy2+S7xexOO9Qk?=
 =?us-ascii?Q?sXtSooNbfxNaueaRSJS8silCYgolVVZQYcJBMBKthxorjECg7Dg1WND5x+VL?=
 =?us-ascii?Q?+aJw0a61R3NrWYWsUV9pKXMlHxbMh8d6C8AhabtZPceb/xrr///o72R8SAQg?=
 =?us-ascii?Q?p4UJD8wLM6JJv8KiB02OktBGvsQXTeXd6vUMIa1wRapVmv2sqOlS4HdTtJAg?=
 =?us-ascii?Q?BrxwFOr4ulDW/3iIX7eSNrIc0cmjAdSTwSiBdvuouIJ1bff0IpuNHLv0oe/P?=
 =?us-ascii?Q?X3Bc/1ouIYm+g3jVtTCnr5OQIaL0eb194bD68QZu9i1570GaWan2KiaDTemf?=
 =?us-ascii?Q?EisKrPhmKQVkxE7HV9Ss4zKqjxZAVW4It8eADdyMiThzIspfE7qvehCUqJ8F?=
 =?us-ascii?Q?RrVj5aAuyrDiaAQ/blotnMuEUeQh13L+cEcYJwrLwZ/gHCgEfcKP8Tf2SUFI?=
 =?us-ascii?Q?5zAXYGvJjRiAiiP4vB+1Hlw2TY2ZTU2kxJasQyM5LvAjJk1jP5XBJq9gWmri?=
 =?us-ascii?Q?sfwYcUg12mDq0tzt7akbXsHf8XAVlyQLCD9YMzQx1JpBIcwlD9Zs7c/e61uG?=
 =?us-ascii?Q?uhhuS6sH/BuKstqV0JguIey9ELmXXPzvWyKyHpZq3GtBzottSlEDuVE+uOSB?=
 =?us-ascii?Q?q+Z4cvt/IoIXQ2vgF8yng08z8YS7OhxSXpFUnxJiCfpAV6qJxGIVOufJT7Cq?=
 =?us-ascii?Q?2SXcW6bjhaDPqU8httsYsiiCpIfSVNHsIalkg/C7BLjscKlGhejQIoEUGLYo?=
 =?us-ascii?Q?t/5pTOROXD3NcM6C3unBCGYtDMBXYN27KM/hEin8WhX4Y2miAIOvADdIvnqL?=
 =?us-ascii?Q?eugpu7WWBQM5MYBQK8Qr6h0mQYp6kVnio7vyFAwefft32z/sHAAbgRvukcG2?=
 =?us-ascii?Q?lOF94oGvFc7skQcbLsA7xXQZJ8rUEnVWaIOwivE2EdHo1qNm8e1x1zQFR+Z+?=
 =?us-ascii?Q?MUWT+VKhuTK8AJsid+Jj6KnI4cmuYMC6pGqDUeynYv1LOOX9T+jHTZjMJwx6?=
 =?us-ascii?Q?72/XmuaSr9jYAr8xO+uYzFRVMX5l3ZQmg9hdst/mLGPeXoc3+OOewcCBHPP0?=
 =?us-ascii?Q?ZEJZlQ+6B4EUN8r5mHxpV4QZhMF/zVdpNcnq7TC3e2kSmhXS7EFr0V9ohw9g?=
 =?us-ascii?Q?2td9zZkrAtx0H9q1S9z2WIoVpObVF5L9WYKsEqch/nH0rTVbayFvIC8cqTDn?=
 =?us-ascii?Q?Havb2F9HJe3uLBP68p3Z/jf8VGwru3/5Kx4Vwoh2pGVpMM9hc4H0d1Hn03G5?=
 =?us-ascii?Q?rbMFIhosI+N62F8TEiS6I8YLb2WEIMh9IFDF6UpyuX+4zullbdh/870CknDA?=
 =?us-ascii?Q?uXHT5pLHUHbbzE1ZMbtyaxpB3O6Ddxu1sA7eyTfV/t29jQWgoX9lnN6nhW86?=
 =?us-ascii?Q?hFITsD+JE55YNVBiw2KmOSSIk2ljL/zZ3ZgUR4107MqGzUZN3no0UKiReffJ?=
 =?us-ascii?Q?GgKcGqKdNg1+5FiwfWK/Hiwv2pLKK8ejV5jvw5SwPf0rCpeM1lDU146treuQ?=
 =?us-ascii?Q?B5PBnEQJohASNY4YX7cZaZT8r5jROLLXeIPIWK3JoTAevxgDnqyCaWW/7qVo?=
 =?us-ascii?Q?Dyb76uETRwdlol0qc+XS3G0gd81g0Jr6dg80XR1Xp/e0JFzIiG4txmoG2KTH?=
 =?us-ascii?Q?8QG4MLvz1MsHhlBWzODzoLM5EoZbSN+PJ2rT1/6kvuXongb7YzkiDncb9sJf?=
 =?us-ascii?Q?tw5t+A9Xblvt5LbYBsD5Zu1yj7IdqiU=3D?=
X-Exchange-RoutingPolicyChecked: 
	Gv9AiyEvfHFXAY05ulICBPwGW/iiGfiyH9fmJ76D7uvXrsXKx8y1fCYHBY1PYToy44Sid9liuC7WAcDjZucmrrL11UYDill/3OYvucpAH6CTvoeczNGtgadKLEk+/qaBoLzlgQ7PD94JnqdO75YphBkDI4+zmbQp3otdAugqdgq2hktO+3LZyA+UN47MM5X7ii9lOZ3HhDqWB5FtIfjrZ+RU/0nehGRMxzsCoIG/y9rJqSirxdAshLoFAgLS4poS9XRDpPd0K/m+Da5bT2KGWPZzdD+rWny6nrIdtjCO6RnzgD80xNiGQUgoxfNeE9Ws3WkRoAQgm9jdrvjMRsQ3VA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e08135ce-8610-474f-60ec-08debc9f4850
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:55:43.5355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59NO4atBhpbx7QXy8zOftYr36N7pe5HvUjHNF5/Fc9heLmpbTCBJPUrtyLX9e5XpgdHemmJ+5189L2SwkR8G0cuuK0P/O3Ae67SQhEn/Iwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7846
X-Authority-Analysis: v=2.4 cv=Pa/PQChd c=1 sm=1 tr=0 ts=6a181122 cx=c_pps
 a=v9d8l4VwGb/BX2RVr192eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=8nEx1NFfAAAA:20
 a=kh0PQnTzAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=856gUfwRY10pVBv3988A:9
 a=4Y7iCZ2k6v-lWCGmfGXo:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA5OSBTYWx0ZWRfXwKPW99NBRekH
 chrABl0BgaiEnvJNb1rH0Up/StvbqnUJp8liRn0uMJor6TGIUTVUxuuV3gCLIGlfWTUXCbAaqS6
 IxbXJMcLRU415kTG+uhAX8JjlyVsmC3aa0Tb6mUnHPPoBOlq0X6c0xWROZVHVDs6JwJBUtWQ00+
 TLqb3ujF7/hWTtSNKB31wqjojcXRTX0sbmXjsK4gphDSn5TT5hnfiEtBbtLi54b4C8BTraYlz2a
 Vv2K5zZIW2EcHyP/uAaub0tPNL7jRhMscG+ZTKtnO425XsWe7HJ6FDDdNp1FJPe5mXz3X8M6Xm0
 Is8Qi1YGj4vDULDD1bami1bEG79di+njCTnDn4vPqte4XFVDHO+jfR9+dLshCoUNnvCtTSn4hVy
 9ZgQenw0reEnnkA9zTYkYCSkktAUK2hPoNg6uLttWRgDGhiwOJHQcK3TLpwAeaYfYR8o9AJA6yE
 23Drz8uxOP8zf7waRxg==
X-Proofpoint-GUID: 0mbffR3ZvU0EaBLsl-moVxDILSJssRfV
X-Proofpoint-ORIG-GUID: 0mbffR3ZvU0EaBLsl-moVxDILSJssRfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 09:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127272

ChangeLog:
https://github.com/jirka-h/haveged/releases/tag/v1.9.21

Signed-off-by: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
---
 .../haveged/{haveged_1.9.20.bb => haveged_1.9.21.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.20.bb => haveged_1.9.21.bb} (94%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.21.bb
similarity index 94%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.21.bb
index 2ea12b3977..935d6da187 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.21.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "e2d96806273caa9ce7457e2f8669a3c40517ca27"
+SRCREV = "8d1ed0a1f74c0e426e7ebcbdd60cf2a0d1b35cb0"
 SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
 "
 
-- 
2.43.0


