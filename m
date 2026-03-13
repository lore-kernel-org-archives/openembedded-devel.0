Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E788105F7A1
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 12:11:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14340.1773403881341228479
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 05:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=seMLeunJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75329b8642=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8rlph2883101
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 12:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=+zKqxsnG0YBzNYyRMFUEwWsH0opcHR4xtf8uesmSGFE=; b=seMLeunJPKzK
	agNKF8oYWNFc+KjLR711XOb3OHDm6pN2MacKxasfW2O6RNSFGWifsr10GESagZp+
	f50HK6xxclNR7ZQZ46gLBbR8XT+YBsx6Z748FyE4WZ9t8P1zZVsC4aDBxK0DE4J3
	Pqv1gmfKGR6RalvuaMU7i3KD4Ugn0yKuRvrESHpmWi4eL836GVO5EerNV4wSvCvV
	KhgbJ7rBw94EdwZxMahAt/2XIL75fmZtwXdSvR79fcyphmHg8qZQZRPAR/ULYmgg
	s2sq9cJ89yG44MxDiCaRG0ulX529OQl5zE5RCgbHfKN8ejcjms6tRvqyGn8FBMRe
	A/+RjFRIpg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqshvr-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 12:11:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhJZ1FKGms2FWaXyNpZvDor8hQzpHZAuedVXs7TAVVfocXT/fHVhJS3u7o+/xBQ2BqX+Eh1tMj8xXKpq1/jj68UvsI7Dba8JJ6cv1PvFtqlSf1owLszKvw5hVGK1NDoT43tKgLTf40YUNcHeqfeJj7kPMscxhjH/dpfMWbO/Lwuus1KPwZTgVYRGLCEJahRdRybgtyI09sDrI7G2ToycmjFsY+S5RPbim2b7c8R+/d6pckhujoByYeCLkgdDZPWqWmbYhQduMpu4xJjhc4lWVXNEnXoNYb8ipcJv2QM/Di/3vQ4bAZ2BhQgC2Q4GyuFFMEuC/D5MqxHWD/G9Bzc8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zKqxsnG0YBzNYyRMFUEwWsH0opcHR4xtf8uesmSGFE=;
 b=cZO2LTwKhN9cE0wpcwgGe4k9TZMvHTbYyzy7qMa6dmi/8lBcbAa2w15VQcEv8lFD7jBAACqU9PJVYDqYmBhF2N3QXCDRmJzcfu1Bj2uzlfwWHUOWsS22fvTm+looYYByTGX6tz95m8bYoGlEKV30gbBHFWTWw0hkcdsQlh2YfQpBQFNAQQvxS0CaDJol58RcyNJfQOyrVaW7tSxP6aeKwOAFKPnMovFvJ3d6MZUUrmcY4rv4QBbfkNyFEF6ETRM1qN1vMGSKCVKKM5jrOB8BOWPY3lATLenPHC3EkPF7Ev2vMqtJaWeFfrjZeZYigcyDpVnRuLe4Ykfoq4elFwBOJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.8; Fri, 13 Mar 2026 12:11:17 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 12:11:17 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/5] cmocka: upgrade 1.1.7 -> 1.1.8
Date: Fri, 13 Mar 2026 20:11:02 +0800
Message-ID: <20260313121105.2180430-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313121105.2180430-1-yi.zhao@windriver.com>
References: <20260313121105.2180430-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0105.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: edfc7365-5e33-4296-1cac-08de80f9a0ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	XWBKBjdruGMQNLcUPh1r9Ru2d8eu5068Vqzz8J2kgmhjxFRMB7e1mFLM7DqJ/D3w7D3CrzQC3eWhhdfb9zeCNOh5ocm8dcpp36GkoHKooGBYA/OWD50AG0bUQMistbl30oOXRb8d5SabccGT3Ec8Ac5Ch2xnZxUKuJK8GoLaF7SmO72eIjQOllBvHiDqCa99YnJo5lbJtyq0Mdn/CUsNiuD3T0ewF12jfWAW1mM1Ar1wsOcAPlrWuus4V8aL+Or8skBvTrmDustG+RV4Ngc8UZibI4ctDNAT36qhMU6SUy9r/YyRdXE+DX1FgdZO6YdjL/vzKB/51FNzU0H/6Moa62XyPlBztQ4oFDid93V3ZvlFUqAqjtfI29eZC/8fyXoHyxDoRwf6k4piyDk5r9xxQyxJj6pJpwcravx+DI9DMW1Zn0/Op33jBfFRYJEfv3gzIYnG2uWPmura6mStGZpNKvO+gTxi4gdinH+NQKknR2+ASIw0dgoi9YVlLFmcelLzKkrbHrKhCMkR2mrxT17nGhVEceqqZ1a+wasrx/578Y5a0/1E/C3rs2bpNqA9c/SCmUV7dAc9Ke5CF0t3V+qltqe5SJqvvQ5sBckkAk/OA0YIL+0bc6y1ydbA0Nlgr8AczCOmvlR1za3QPo7+22uzAFJrY/e0Ha9juNWOHMR+ohDoxw7kA8UyfMIm3uF6/ofPJpzSLQlnhYoIB41KZsM994YWZVI/uo/dEKxJnWZx8Q0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oIFgVOSGNAJ0mkTRrORzF4BHS77mnx5xiu+cdotqJ+VfQh+Jz2UiBlcHtygZ?=
 =?us-ascii?Q?78AymoSMNIsbNT0G+k5GXPeepkmHY1tSf42C7H29AL1pCtf6LsOx/q1Bsb/a?=
 =?us-ascii?Q?wzx8rfJbHN+BSfxJpqPPpt2jZNZnOBRNfqlRxPJxTYdFieGMBBaVDiwI2cSa?=
 =?us-ascii?Q?EhkWMbYfEfQWVak0yKM9hUbM5UcekSrleWMh4BYPZlY8y5PknjXUJHtxbH9j?=
 =?us-ascii?Q?UMfUDk1myA3NN17AVrjWtZUOLNLcsnTaGY+d8ciaUXEI0x5ZDlCfdTnBGvk9?=
 =?us-ascii?Q?Y8fxFRzFjw9RqWZGq5KZubM2by5rjYpPe/WtRnWmUXW1H8u0sn7KOadA9XMO?=
 =?us-ascii?Q?MyCkMwKea0RZQH6FhCR0D1ngW2L8QffGLG4zI0HFyV3eGtHSYUSO4mnLTT5X?=
 =?us-ascii?Q?znAgBP4FpUVFQBo+wkq9vmQwfa1xD+qKqmu2oaLRjzozhEhCUjmjkDYDmmqP?=
 =?us-ascii?Q?geOU2S6NAuXM0wS63GA0DhLCn7rHrFx2e2DYsZmCeF86z/F5X24cyAlk1n3B?=
 =?us-ascii?Q?6dBcNClr00VSBV+LCmioITEemBivI8kMax8u5/qSGQ2Ms/Xs2QzmmT7SRnGC?=
 =?us-ascii?Q?M88do8HlV7825A1vKiKbPNa0Abrn2jK2BrOLlcAA4JirLAePECF418SeaBYW?=
 =?us-ascii?Q?xrC2fuMV1y0eP6/3s9XPTi0S/y4ph752PTc626DHVe9fZr+tx5nwO6TwOm0f?=
 =?us-ascii?Q?1pyhkN5gp93fSE92x3shvzZgLET6/MAq+hjgbtMCmDUFR5TvtVB7DRsVuPqN?=
 =?us-ascii?Q?lpmqarAS39b6WVQFP6UsWvtpIefMspzHdccUwLTvP+Zhg7O+n484h5OHwLR9?=
 =?us-ascii?Q?wA3d17ieNP1+wr17EOTNk6y+rqQh9QU5DELtZppQMbbGUC3z3zUSeJQoSAmO?=
 =?us-ascii?Q?Y4qbZY1MfDRk0i4pXQiVYX89jnYae/DRHpM2b1nhGiDzZ8o/ne687XuHmlfE?=
 =?us-ascii?Q?LEuobJvDH9je4aUaD8ubHq57voj04SJIINGded+l72ZzIuFKj6NnlKlZ2rqS?=
 =?us-ascii?Q?ObKG+lTgDd/JGoMAZYGCtjke8xVyVTj/GC62bTaP7D0hAS/IJ8cYfRRzEek/?=
 =?us-ascii?Q?ol4rHSN1FtyYQFpBvnvyiiBz4DyS0sD0ZtN+0An4Af0diSvQ8JsRSESx2TIM?=
 =?us-ascii?Q?i/42uz+cSxoZnU3RnZQYN1cq077rwhCHbWFE4/EIhqIuVFM97cvChLbD2xFu?=
 =?us-ascii?Q?yUTh2EwOf6QyKDRzRomRPXoIgID/0OeVtc6JbWC+AZCXXfh2BiWvF5K0rUn+?=
 =?us-ascii?Q?dMTpzN1FxNGc7O1OOPNHbRT6L9Urpoyt/RVpvXyVqpaNUgQTCIR/cGAn0COC?=
 =?us-ascii?Q?fOHQ0WHIoMIWQOpVnak0WB6vmbqtN8E6Q1iA+DZyDGif5ruI9i/DgofY2rej?=
 =?us-ascii?Q?QeFAvgHgwB3TCwnlIVTcSDu5jD7pVQiYdHzLJX8V2u8eGC0wl/mXThyur3yP?=
 =?us-ascii?Q?+zZCG/HVKCPH01R3c7Hn9OXn/OuCJjxooAanXgMvKQnjCsvCFWB1TmzaIVvy?=
 =?us-ascii?Q?cotlhua5WDoLFRVOKhj5dH/Zvh47AasCgd+gpzSugk/hUui/Wq7XCy8W1sVL?=
 =?us-ascii?Q?yIXlnXhM8Q5U1GHOia8IoZTMzILDStpEaz9l6arbisEj39ebPJ9k2oi2XP4V?=
 =?us-ascii?Q?B/02+6Ja4p9mSSdlRo+MDSSG2DzuWMj7nSfb+BQnXFkyi4V3DIF/B1Y3jCiR?=
 =?us-ascii?Q?NKCbF/gQSO/VHZ9KXSt/b0ufo2i0n9HYYueka1aFhkF9AnENQELFKTZzZMPL?=
 =?us-ascii?Q?/dJyaM6jqg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	FNM8+G/2ruKWXmSrCevmUmdMtwttNAjxKoz+tfFIrY/hUvA6EtHxt0gGn01oBu6Ys6o3cUJWbG33/yrfjT+SD0GKgw2pLeHdJpxHM1UKxkeZ/dJna/n+74ZennKwAOe5T+T1vJt/+ENqEAKLm4ohK+8PPI/Mwg4u03IwlFbubdokqtNqZUMSh04m990xSbuHuuyNEAMUlDAKxomI/pBfWVufLjCAWtvHH+6Fyjt7DNm03diPN82V5F1MeQ1zs0R6mvQSCcMVmpzowybHtLqvqjaBFElzmoS50JrStFOsfz45+E9WGY/FhFoK9Sxn6ezC2DwxJNF3RgphOFqOeiH+tQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edfc7365-5e33-4296-1cac-08de80f9a0ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 12:11:17.1679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDCyVpmA4MvAEDFQxhUTS1+9AzlrkBGDVhpvwp2aU89Pusf2vAxvFE5PLREcYbOz2mQ7vZVReXyW5QlrP5FXBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
X-Proofpoint-ORIG-GUID: JOoM4CIX_KCtftAXXeqqAGPBROzfwLZq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfX10cfDC3yr3O5
 wISVgKYD7W3GeDbNCbVfaAvAf1EHZEeR5culG0x4qZc18fBbELOReYnEdjwB459q52M7vx6xXCQ
 hnQEeS299GvZSNqhr/DFEvnRKNtCM7g6LNsqlAf9GJiSzyjfcE5g1FAg/Az8E2eTlp5CTlGMGD/
 lYCQlmyz79F8uTGfJPjmVKM4zdzEFUqZi9kmfiVyfUzdtPcXcCDZtRvkyKKQtpT5amACcDrXrfo
 mhPwHEtfz62XFNOk6U41Jyz6DSOuX2mkQ2aYuN+V8qeNsYJTXH8MFchyCaVdEh8++OqxbuBukV5
 9IBUjHcyU2yAOQCAA8yVanZEG8EfSt6M7Flrc+5alKcf5bH6WjOGCLQeQVJvXEnj1UYTLjeB8/J
 jJYHaAXQaO9fQN+C2MUavxIMHK7k0En1hLHEnhA98ZH7mJRnhryFBYPCdYGI9pXSPnIgdA1qY3i
 RnrwQCysq7t/dak8/8g==
X-Proofpoint-GUID: JOoM4CIX_KCtftAXXeqqAGPBROzfwLZq
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b3fee8 cx=c_pps
 a=fUX3CcU6CI0WA5Nw0mDYKQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=p0WdMEafAAAA:8
 a=OWqaEUjHAAAA:8 a=t7CeM3EgAAAA:8 a=_9gtbkrcAAAA:8 a=pGLkceISAAAA:8
 a=9-JARqqOmMqOXgP9VMwA:9 a=BffUIevxNqKmbQaS3xYn:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=mzAfeOUevkGYtpgvwSZb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 12:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125186

ChangeLog:
https://gitlab.com/cmocka/cmocka/-/blob/cmocka-1.1.8/ChangeLog

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{cmocka_1.1.7.bb => cmocka_1.1.8.bb}      |  7 +--
 ...or-previous-declaration-of-uintptr_t.patch | 43 -------------------
 2 files changed, 2 insertions(+), 48 deletions(-)
 rename meta-oe/recipes-test/cmocka/{cmocka_1.1.7.bb => cmocka_1.1.8.bb} (89%)
 delete mode 100644 meta-oe/recipes-test/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch

diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.8.bb
similarity index 89%
rename from meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
rename to meta-oe/recipes-test/cmocka/cmocka_1.1.8.bb
index 09afe36666..f7e8b96ffb 100644
--- a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
+++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.8.bb
@@ -6,14 +6,11 @@ HOMEPAGE = "https://cmocka.org/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "a01cc69ee9536f90e57c61a198f2d1944d3d4313"
-PV .= "+git"
-SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=stable-1.1 \
-           file://0001-include-Check-for-previous-declaration-of-uintptr_t.patch \
+SRCREV = "eba4d6ffca53b500ab8dfabc30256bb6c3088b2b"
+SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=stable-1.1;tag=cmocka-${PV} \
            file://run-ptest \
           "
 
-
 inherit cmake ptest
 
 EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_BUILD_TYPE=Debug -DUNIT_TESTING=ON', '', d)}"
diff --git a/meta-oe/recipes-test/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch b/meta-oe/recipes-test/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch
deleted file mode 100644
index 65d30ea993..0000000000
--- a/meta-oe/recipes-test/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a54e035f802e79e3292d8ad39a14bd7c060eb7b1 Mon Sep 17 00:00:00 2001
-From: Breno Leitao <breno.leitao@gmail.com>
-Date: Tue, 21 Mar 2023 21:58:28 -0700
-Subject: [PATCH] include: Check for previous declaration of uintptr_t
-
-Adding a extra check before declaring uintptr_t. Currently musl uses
-macro __DEFINED_uintptr_t once it defines uintptr_t type. Checking
-this macro before defining it, and, defining it when uintptr_t is
-defined.
-
-Taken from Alpine
-
-Upstream-Status: Pending
-Signed-off-by: Breno Leitao <breno.leitao@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/cmocka.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/cmocka.h b/include/cmocka.h
-index a21d965..f540793 100644
---- a/include/cmocka.h
-+++ b/include/cmocka.h
-@@ -121,7 +121,7 @@ typedef uintmax_t LargestIntegralType;
-     ((LargestIntegralType)(value))
- 
- /* Smallest integral type capable of holding a pointer. */
--#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED) && !defined(HAVE_UINTPTR_T)
-+#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED) && !defined(HAVE_UINTPTR_T) && !defined(__DEFINED_uintptr_t)
- # if defined(_WIN32)
-     /* WIN32 is an ILP32 platform */
-     typedef unsigned int uintptr_t;
-@@ -147,6 +147,7 @@ typedef uintmax_t LargestIntegralType;
- 
- # define _UINTPTR_T
- # define _UINTPTR_T_DEFINED
-+# define __DEFINED_uintptr_t
- #endif /* !defined(_UINTPTR_T) || !defined(_UINTPTR_T_DEFINED) */
- 
- /* Perform an unsigned cast to uintptr_t. */
--- 
-2.40.0
-
-- 
2.43.0


