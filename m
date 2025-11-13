Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F8FCD4F4D
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 07:41:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18708.1763019698751309559
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 23:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Hh9dZEpT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3412a946d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD4eYDm1648027
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 07:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=5auaTnLhlIekmgrfFZ3H
	QYLtwfGFNR756fKJeJsyqFg=; b=Hh9dZEpT35IEOs+B6fIOEsJx0IEzZfZAYoue
	guHa5xy4os8qGIUPg5+ITmHLgFqsgfNZTv2iK1G4hwYgvdbQNQFmIRvfGg2pgsmy
	bujgS5U1/zIc6DIPMFI69ebeIDg6nG7kBOmEIqHnert+FE0/Z69PB+gXjua4c4Dd
	UhUpgcbSitKtBfuBy5vCcujm5u9O8nZYN29TL8FqYw2praP2IIPoA92UvxmOYbJz
	u0ir6EN3HOeW9wYeWoKuH/n3to/bnLUj7b6x2B+Eb7BMDZr72RgUGGU4VxGVon1r
	c1qHoGx2iiEyvQYdcj6ykTCItyLyG57P6c7yOsYBsGa/rPHcCw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012014.outbound.protection.outlook.com [40.107.209.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x739c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 07:41:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEQ/HCkD7KATBj4WJl7Y2VDaoAHZqSoiTaG6VooRpFescCJdprfZyW8GQBcsJWqMWqHntZyYF3a9Kgv49naWgQoXaBEJW8jaLPULWVzXQjBvYDxonXqYW0/FGjSm1k5yEzNm5Dp9A0tqIU11CBjqzxH2fLeg/Xs3jturZtYJyP6dkkoaTy5Y8EB4r3Ys28g2r/BgLceZ8KYi1A951BdNf7wuWcSGvTYb6oLPz7Srf8jg8cHsvAThLsuvzOyavTmUex3fpPsZiWqyzumsCUCSqA/oUXpKDr0mvE9H2ChAnsxAshvB99GsbpjNfn01PHrOKsJdZxdu/E3tzIn2hkkIpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5auaTnLhlIekmgrfFZ3HQYLtwfGFNR756fKJeJsyqFg=;
 b=XH8sQEO+9uiFL2xoHP86BQSMDVFw2u4LX97IOi4UieBkR8NzTdVOBdU83Vs/pQFycJOVR7KEjqcTxjtaTL+wb/gsuzVoFtDBP4VFbtiT0URN8JD1wQ5bi5OZBP3nWTiDbis7BUnbc3pvAba5lusnBbmq/p1dfKATxduIu/XoYzzXTWmktxKTeE9PAaeuvEBD2CPGYxDGxpU36AqSJ/zw0hAazhcYZPDXPt/SBJ/oemNsnIrxJqahPkXRrp0qUg4PsxHonvmlUTlkvRG8S5DdA2ddtQwtxMYVY63T/wCbBCqKdz7GbkYedRbzPmos98xN3P/tMEa2utSqZumVBazr5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Thu, 13 Nov 2025 07:41:34 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 07:41:34 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] ntp: add UPSTREAM_CHECK_URI
Date: Thu, 13 Nov 2025 15:41:16 +0800
Message-Id: <20251113074117.4031867-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0235.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: bd895060-692b-4987-9319-08de228811d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uo/NzMMPy5YJrXrmcyGZVvHmzDFbN01syPtusuNI4zFfFM7ESjnzUTv4D18+?=
 =?us-ascii?Q?NDDk4bQi3knmRs6slEHjS9+ds+gFpCFdCYSVJilXiQlzYADevG4cFXZXK7+J?=
 =?us-ascii?Q?X0OIphovx9bTjdIXV3lQ3OotpKsm4gSyHxBwsI0n5Ax1KIK55Z1n4jLXEAnV?=
 =?us-ascii?Q?nImG2TnhPJU2mAGDc8Vqvln7seApux1WpcwKq2dIW85obUUo+8HgwUpHVC7Q?=
 =?us-ascii?Q?VV1n99Dw2hvc74FaQxv/TWm43fVYoyLhWBj539kAf1oorNgQuMAtv0ue1iY7?=
 =?us-ascii?Q?lMg75QGyezml5fY7oggOcm8VO4cP0eCqcZ9z+ROr8+VjmAGUhRGWt6TxR+9h?=
 =?us-ascii?Q?qIHHkUFRifrzxDcAEtBUP05tII/H1kNYQV1EXdqCNBLI7Pgh2HlPy6++Itjb?=
 =?us-ascii?Q?v2/Z9SarBMr7k6kmnXEdfqpwo0I/2vrZKwDVuQSR2zM3A+sF7xy9XOG0vaVA?=
 =?us-ascii?Q?l1r4xt495QjzFCeLly6bExjryfSd1jJxl3hfcW1R7jCO4N90kxTw0sfEefMB?=
 =?us-ascii?Q?uuB3Umc1itreejxSBYV2yuu+d7uSvVZSqLH6yYnGelnuqf9AtYcUW+WZRTQy?=
 =?us-ascii?Q?32ereNcc4hR97PLIL+KV6P5yKnKV/LYdrPQUBqR2KnFt5znoca0oPSe//PMP?=
 =?us-ascii?Q?taDBBVwPGeoO18DDOy6Pzf+m8DR+k0FWC4J5mV6QYQl2OHCboqgU99r/yKOI?=
 =?us-ascii?Q?zOO5QlZ1Cg7AKJGzUQT0bEz/O6Y59VbEivHNY03bzF1EOkBMfnE4tkWkJhE0?=
 =?us-ascii?Q?B4A2aZ+i/wBqnfHS6eJIZ3w4tD7RfxJYl/bVN9RvAPhi9fhDTlcVffC2OAlL?=
 =?us-ascii?Q?N6FLq0dxveWVWUOjZoD7zEMQXOE7q6U8SIOFj2scfkag4SMgd7EwMDeAh5tz?=
 =?us-ascii?Q?cFelWsN1OXngwchQbftHwMVvda2HCl5Pkimu3FX9u9bQjzRioINLagvbhyAh?=
 =?us-ascii?Q?Twd37cL0z0aW2UmTANo+MxeLewyhl2WRUCEZNW3fxLpW/OSDXgL1imd9+MCh?=
 =?us-ascii?Q?M1G3pJXQshce5WO/Dds6vfPdwHpT+RPkrllKpG46FhrCUFSfcR7K7qOBUdgr?=
 =?us-ascii?Q?8edhudSwfylvmTmt8BCMlCMxFaXlga3nHsg6y7yjJmaUsyNSzlwBmlCvv4p0?=
 =?us-ascii?Q?4gYu54PIIVqREfDH/XWKhOhE9yesf48/E9QFG8Xvy7HnwYHMw3YDPpGvLz4a?=
 =?us-ascii?Q?7or15HWbVoP4WGVf3MSVC0Td5GM/FGAvzwLnChC6jlenCMvZLl1cBbIm5cRW?=
 =?us-ascii?Q?dR7Cw4rsKIxRFmKOKIFAXWE9REsWZrS2lQixGgq45H1RwfnPIcx9rVo+AWUN?=
 =?us-ascii?Q?HkR/7PxCT8aMJZX+HA8Sr6f6FgIpS0Jr1W27+m/RwhZwLApkOk/ZchK0Czqj?=
 =?us-ascii?Q?lnWybWNAT7DbvU9ogqbLUiMlkIV8ZdWpr2vzXzy9FhkfJ33uKzIoKFviOIqZ?=
 =?us-ascii?Q?qDgKf5DH48BGOzeGTmjoMKCWRPY1n0tH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KIhWgefjXolBblB/tlLrikVEIwxikyPCAA6wXM/7161/PaMW1K3/WDuy0p3L?=
 =?us-ascii?Q?2Lu8CDTvLZzg34twBmPgS31u/8Xq+rPp3o7huiku3q7rM0JlHclh5cPitTZp?=
 =?us-ascii?Q?mucLJ12TihBO2kGOk+Rw10VjbD8Cxh8/W569r7BM+MFXmWIgKC5evwjsMz0z?=
 =?us-ascii?Q?SIN1+LuXrRPDqR6Lm1XRGMgJRT67j5BUvjaC0c+YzX/3E5qN07ivRu6LJ8Nt?=
 =?us-ascii?Q?FOvKHus1t84Pnb1udK92rJRH9a02zZVAnwd27WfXlyIkUDsvx1THdxnzFd/b?=
 =?us-ascii?Q?yVJeAq4GHTeiQFnTY5pJSbpWb/PhZ9jZvQ0Jh/4/At7dCezxTjUwm2ijl4d0?=
 =?us-ascii?Q?2QyxWMFUhwvZ+b37HGcALcHicoYcCVnVjhVge8CfhNDx4Q42T6AWPP+8Iz46?=
 =?us-ascii?Q?tN9fU3ZvGgsjk3/q+Vdg3Wzt7HWFk/lW91RbGrjCp4HTSM/OjjqB08UVCbtN?=
 =?us-ascii?Q?fs9monuPSTQ8ICmR3xTXkLFfVLJyLAZfAO1y0RN1E5LvlpDVLq8Zo0k9mjC0?=
 =?us-ascii?Q?lA0KixJC0mljhUP5g+fgFbqAt1eWU6KXR1N0vxX6A4nA9DV2J9J+jCFZVcBA?=
 =?us-ascii?Q?awaA8fX0/TnGtmY2oo005cp5CKa3nbzjKhuNBz7JYtiDt7JlgdXv/p1RIbVI?=
 =?us-ascii?Q?PSawpRT530rgcebNhKjaZwD6hZftrU7UzOdjH8IX6RgUd1IIPCLQdFS0JkYT?=
 =?us-ascii?Q?tJaSJp5UgOTMSgHSQfrUo8yTnjD2tHVUSJvQ8TviKWb5Bza0fciTMrIG8Q5M?=
 =?us-ascii?Q?cVJ9ocpy0a9CJbfe456pCMue73nnwcpqDHarTRamqDHQWLh4Ac0AkmS7NXx3?=
 =?us-ascii?Q?K79mgpc6WLQ6PaXncHUpZW1fAvZZHe0WTMyKGfjq5FaoXA63DAl4/v0llpgi?=
 =?us-ascii?Q?12s/824WMQ22PuJ6dGR/cObyPbXr8a2cQBS/GdqFutRIR5pevC9Yg6qopc7g?=
 =?us-ascii?Q?aPEOrdgNrWlX/6ZLhtlBpiDfKjHXnkb9wdW++LY70qD4boV5jmljcwyCHsGm?=
 =?us-ascii?Q?iu+TsskWBlQmu0TOBCaGGUVsNRtUA2Dj+xbyLWHSMzH/eEROA/gUCy5HkK7v?=
 =?us-ascii?Q?QI2wB25DSfj/ODF57uVE0tRcrtCEQ4gJp8B1Y6xUYGvlvjwMS7UMhZBSQibU?=
 =?us-ascii?Q?TOjHLdNmtNNNInS2F/pdHkmvPgoPQsU8G/Ep6n2FE89TFcksXO29amZKkRur?=
 =?us-ascii?Q?IqTb+/Mzl+2pC1yNuUdsRQPxuLkMtz2Pz+ZeNiyHGdNWWlvucWdtQ+NcEkR6?=
 =?us-ascii?Q?ObSWc9IHqlfuocZMm40oNgsMbRfVEpRLqc6zz0nW66pZinfYEZBjd4DD1Z6F?=
 =?us-ascii?Q?JtfA2lhUMqkqeqy0MHF73/Kq+u3NP5pv1zfdjlLkRYHiPrtnEwtEpXIMd8UK?=
 =?us-ascii?Q?hdxOYmEKp25IxDdnZkIuXP62PdNFL5WREVi9IESE7kWTsVhXGOooe1czqhTL?=
 =?us-ascii?Q?8Wtuu0VSbHsZN9xls+ghYpaNmlZBhzcefRRSJNrl2EoWaoM/AmtrJc5KJN2n?=
 =?us-ascii?Q?P0FwdjKn0WEI7eVah9DaIdzsEQ2zGAYFDQkovNBa9/Mb3GKXuGZVGA6cVUCp?=
 =?us-ascii?Q?3KFn5REP7mzc874zowkmc0TkqrjXKsBXAZGbfWXH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd895060-692b-4987-9319-08de228811d0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 07:41:34.5777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhAs0Ba+bHHB+c+VialSF81m4Di8mIgYn3EESznFv/VzVMmWIG79xamAmlSrkTmQOgNWOHPNuqcU6VlHPng6rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA1MyBTYWx0ZWRfXy/fsZvcPLZTa
 geYBvN5mYUwDR2bgP6AtykWF+i3sBe4LlMN7iNRQXBSgbifnhAtY2+d7/XyoyHQIFdtmpQc3+Nl
 dzQQ6XHqN/nzBqJbvtwyKg4vMfH4XGVvBkWLLldf4Uv/MNwGH8U51eqR5iz8mubNBzmpgBeJeC7
 EY6kdEmwW/iwaLiUCrg4/lcpAxUwr/Cmds7iT5xjIqPCDU/RD6f9dMcqX1ifZ7X9zbxnK8siQPl
 Ia2YZIINlB58uNNWoFGrP7j6v44hxPezPbaQjxyVWDk7mHLU3vsCVAVGYqGdA8ZY0G94izCxjVr
 oKicuv5iAaEjRPymNl2K0MK9iQQFOJVoJd4cfaH7Cv/eTZMVjxxXhA35ofLwIj3CahMCxVtNdj8
 Rx3gX/Pq6ST22InjNBFmCSrA+8f9cw==
X-Proofpoint-GUID: HyggqYySvz_Gclh647m9pCoUakshct0v
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69158bb1 cx=c_pps
 a=91TlPzG7kPfjcj/W1M6+cg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gCGlv7sVAAAA:8 a=EkcXrb_YAAAA:8 a=t7CeM3EgAAAA:8 a=FNydv7uxz2qLtlas0z8A:9
 a=LK5xJRSDVpKd5WXXoEvA:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: HyggqYySvz_Gclh647m9pCoUakshct0v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 07:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121638

Add UPSTREAM_CHECK_URI to check the correct latest stable verison.

Before the patch:
$ devtool latest-version ntp
INFO: Current version: 4.2.8p18
INFO: Latest version:

After the patch:
$ devtool latest-version ntp
INFO: Current version: 4.2.8p18
INFO: Latest version: 4.2.8p18

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
index 33d19a696a..a5a6048f8a 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
 
 SRC_URI[sha256sum] = "cf84c5f3fb1a295284942624d823fffa634144e096cfc4f9969ac98ef5f468e5"
 
+UPSTREAM_CHECK_URI = "https://downloads.nwtime.org/ntp/"
 UPSTREAM_CHECK_REGEX = "ntp-(?P<pver>(\d+(\.\d+)+)(p\d+)?)\.tar"
 
 CVE_STATUS[CVE-2016-9312] = "not-applicable-platform: Issue only applies on Windows"
-- 
2.34.1


