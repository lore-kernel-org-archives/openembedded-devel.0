Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517ECEC01CB
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15253.1774266129684883088
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NXcapUMB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5kqHE3731459
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=0HoiBKAv8DhPM47PryjLrpE17Bwb2HMNx847MrYLLB4=; b=NXcapUMBhtVI
	c/C0Cxo3GKzJ4p+p1babxNi7Brp2lqfVLp30Rt0G9xErW5T2LQrOQx34iHZ2AbNq
	y6rhADirQQo+aNLfhMk0uZaXKg3G7genOdoqE2fukJKiaQ7QzUovYXmdKemQwkCm
	NN/S/yEnWj016DRqSKVRhOLEAJxhw92fTfnbfE5S4Emi4ITRh+jYV9E1nnIo8pPv
	jCcGDoBp9GqWFmgOXOtrOjZ6ZA+Am+wpntfq/vgj4FbUWz/OvtmLH/JtJTWAu9mN
	bV5gegUNDSlLbtThGWMJqrQqME1PISw6d1Rx0vO8hHz5eMfEhyFmwCIa7PwMkoNa
	+BeHF4RcDQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pky9k2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6oaw66m2m0ZFonsf4pJRLkTRp+7OSb66KzyMNzmN1/Yxa5RrP9gDqk25H+kbmjvNyLuNmfaakDNE5CbqwA7qWR4Vp8b0+Kvv0PcAG3NXB18Hwia8nNVxrTNBOJiWfu0UBe5M82kbj2rxLsKjeCSe1e/1AxZdiI5vR0N1AZRVj0BuQ9lb4q1B2tQ2dYftmEsExPbKg43/v7Gwr26LMWQXhTZpU+WebINDx0qROABdYjXoELU8D9zRHV9yxfDT+Pk7W295w0fOgI4OQNod/tv9aSzN4rM7o9hgJYR0mks92hZ1IELa8xKEv3XVES3CqPQMn/k5Roo09sj5XSm2sVOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HoiBKAv8DhPM47PryjLrpE17Bwb2HMNx847MrYLLB4=;
 b=T4wuOaCWO3etmv0YJxIQkvtDR69+ZriSoRX+I172xYhib4COX4OCCRkQ+D77u9kw3gxCYgzl9gcThf3msEUa8Oue850z+doVkm+OfHJoPXdYuB5LTevtYXiMoXd//yNf0xNvS3iZvzKt3/yG6V3I58LrEFV1npKKIo2bCc93gOOTSDRVP8EB+y2LoB55alS7xzgTum8FipWeIiw7XnPoWU9u1yj90rU2R/SWkFz4cXm4JcgvIBjq2Fhlns6WKsjwAfd9tOReL6Nw8FAKkQ8A2OZmTMClM6TkTOIMx7jURGa0XoAe9kwE4lkhlEOTOg7dr0r6E3rJl0DvOvG0qaH0Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Mon, 23 Mar
 2026 11:42:07 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:07 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 03/15] xfce4-appfinder: upgrade 4.20.0 -> 4.21.0
Date: Mon, 23 Mar 2026 19:41:40 +0800
Message-Id: <20260323114152.4178269-4-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
References: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 373bb940-8641-4444-0ccb-08de88d13618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	wKenVPdoKBv/XI0YIYFDvL6H/oRF/0/1kBPBwX7djS7kqbu15rK1jOqzbJNEeNuUegBZ0htOo6F1FUPFtogPiilldzJyhHwA4MngdUc3rbn9XeK6ufIg1OiqIbkqm9jZSo18yFR9hSGb3RkT0WUEYKEuGv8W/cjGuV62+9hCiu/jJ5mGpqFfmTFkhbMdhA/VwnUcYak/onM43ftRdJ5siF1SpVnpyp2XqIeTD+KuwxkAP4Rv6K9YE2FyCrjOyGxKkz7K2wR9cYOVnzOET6OfLRtDSkbpTLAJpbcWzbyUbwA+E7hvPozrB5HPpdzy+oDLEqkx++JnuylnvJ4fcdWP53oTl4Rj0ADV00ntwmRP2sUzJNpcNK86YRIvUnuvLD2AUmTHdD9XI7gTSq1LVPUB4Q/AaKM+5ec1A08OFjGt20Y4xHR4wrEObQy5zUg4DRc/yLglmWL/gS2owlJjzvh5fSvErc7JCthVCbE/WamMLIQResPsORpOiLN2MJ9s6fi1l8PDjq+UME+idUzCbPrI0H8D/1R9tfo/uqHofzlfhL2WrbYlowJOlj2LH+ZAikdhOSHtqZJSwqyxmaT+DOIQTNNx1NPD9p+e6thkESyYsH3r6GeF+qhdcTbuJy0nMr0aG348AQ0t6Wha4Z+iN9AZMPr1NJtdGrgQubrGAP4q9peE+RSjlAYH2ONXJ4yx4b1NN+mFIEC4Ci6IDXWQHU4Z2gQPxbGgEnulNGbwSK5JbgBcvlJe2xSOLmH658YD6oqGkyaBB7h2LDkdVTSVkcK+BYXNGTQyo/zweeAjfJ9coSU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RSKjiKrcXTVPvIg3y2dIHuXlEnlcqF4kKuyIQHyDwvNU/GnfFFhMstyQBgjo?=
 =?us-ascii?Q?lEE1ut5GB8gD6phli4FkBLFxWCWZjcwXz+si7RvG71093AT+NLeKqHMkXKnL?=
 =?us-ascii?Q?PpvWM6sbklrzYmNqwW5cZO9jozwVC4xM6I8L0h3rvhZFpzGFn8l3Jyo7HD2t?=
 =?us-ascii?Q?bvUyVzyUGWK1garW5FTkF6oi0WpysU4CmCU2oY+YI5MnbXbkYR0Lc61UE7ZX?=
 =?us-ascii?Q?seU5YSaV4VfbocSQUG6iltZi2uxQdt2J8gnqZ22p6EHI1oM1Zq4cORQsSgWp?=
 =?us-ascii?Q?iK5aKci5MlRG0vg0p0MmKjKyVRZ0jU/sMZ0L0k/27MNMRoOMFrFF9r6xFnv3?=
 =?us-ascii?Q?MsIcSmNagPQNoWUgpK7SVzxPsbmhPp7EFHAAUCkCoD/tmTZliYEpViW+rgz6?=
 =?us-ascii?Q?4qff+kAfH4UEoUVxm4UZNG5fDjcwE5jS1lBWdWQ2BGc0IJUzly6RXVRfZ4Ui?=
 =?us-ascii?Q?fKZA0LSEFtimvJMM3IjcH3vfRaXWeZHcVtL9eJIWpzmkP0MlrsXJuckAKMu5?=
 =?us-ascii?Q?+fVYhscVgGi1JPYKRm8icr6ohQ+AxCNzJkhWmfJ4Oqv3jOg8LcIiWvNjtMvZ?=
 =?us-ascii?Q?GzlazSfRm5NmXKmOrDIeyyzASwUSVpBpYcxJNLPy4hncgaAApaOc1vVUNJ7n?=
 =?us-ascii?Q?zWz24GAqYxDi1hyHUSUFdDy9FGmv9Cw6Ycm2CB/xEX5VG1fwJHQjCCtdBU65?=
 =?us-ascii?Q?U/ft51fUC3kUgL3DmrIvr1SO285hRIf+DNUcZ8tXt8YprydniQXWNmalMTmk?=
 =?us-ascii?Q?zPVdUCC+SSVWFlmOAN1uMjW1FgO5aYbyD6x4D7b0+AG/CI9ltaS5haplJlVH?=
 =?us-ascii?Q?GvFabxG+bPM5upENp1mmCGDyli0SaQMLTMPxn0fCVFUSyy/OYCRSDKUTqDMJ?=
 =?us-ascii?Q?x2oG73ht8d68lttdd3TrhobREjwWTwEIgx0qjWpYRZXmx9GxP86jjcQS5oD2?=
 =?us-ascii?Q?vpIOCcLlxCN+QbW6p0nuGusGuMWsNhufBT74QDhqPWuJhsW8baJBEh/QRXaS?=
 =?us-ascii?Q?VHL60FLyCp3kKVafoS1NsZG4Vb+RSkUN/n1H86kS0HThy645bp+8UfP2ZhPt?=
 =?us-ascii?Q?ZeUz8ALihRti8cIDDPiWDkzd2Bc/7uYaI9IkEXDZrFdHNNbe81YkKN4WtT97?=
 =?us-ascii?Q?4a5OUv5OGfYk3589OShCnolfyTzOcYXm+nTShlztFoYHjGT0mevvGTwZaXDu?=
 =?us-ascii?Q?TrxZSEjhPhedZ0eYzrZqyscaQorRwR3Mmj25vIvPMgu1QDA4m+qFEPftfwwI?=
 =?us-ascii?Q?lOBJEJSIJg7xYRbq9eNcVI1r8qrIT0XGwSooS4GaYrgD6kThkZP33Ui3uTJz?=
 =?us-ascii?Q?9HTUY6AfqEJawXrrpX/RhtBJM7vB5cSR7vYf+RhN6QsyZGJ3bIupawMvd/Dm?=
 =?us-ascii?Q?l5LWotwXkko0M5LALc5Tsq8zYt/WkiH4L5TozFu0zqz/98qmUweupZj3Qc8w?=
 =?us-ascii?Q?jpQJagTZZSbVKqcDwX5BIvEUmG5JRtJj2q97iniITi+A99u/4vKCPWrqeU5L?=
 =?us-ascii?Q?4/R6S1z7vxzY2ssnkDhDdrLr+yeXPrEMfjMu/Vc/dVAmJjrpqyDJFKRzKSD/?=
 =?us-ascii?Q?Q+/8H36WKtq2U9tMxRJdN4bR/LCczJpFITAQNtg3S3TEAAmve7Su4r1TK8Rv?=
 =?us-ascii?Q?XVb2KvQ+dtzKkEGa3U5s5EODPaCr1lAL0ASfBHJxQit7epBqPXyZbHJPABJi?=
 =?us-ascii?Q?ZEzkgdeY+UIhmJRqPBrWh+NwPwer3H4r+KGnsdNnceR/adI5S75TMGexS2eD?=
 =?us-ascii?Q?/tJ95SdAW3IL5r1xFsOjMQffRkb7gVc=3D?=
X-Exchange-RoutingPolicyChecked: 
	o1Y+s5oylgP3Z6pEDXy4NazQtp58sWiTQuaZNkyhwIvSx5sdJHByIcyKx337lZELVXCqAlbi1utc5JgZvNZeDNu3k3/XPkHJJoivkAUuu9QUZblOQxLBRj/6QvGud+uG26NZrAiNa3orh/qCC6euNnVyzin+Q4KGFBK3NCel7JnxEPFBVTZAnBa2trvXICDQ5h0ZwdnnhJZ2sj4zdYnyNBiVu3s+a/ElUi8d1A+DjSdxLHfx/txZRugFfG3Kw2HIqtEWyLAtoPw1qd5+cXY12bkLj/JNdF8a1HKYR0jQFQzzM/DS1AR/bPYkNi8C5X/kC8a+eHMNcsEvYBs2IXeypw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373bb940-8641-4444-0ccb-08de88d13618
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:07.2690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /J7ZFxScBSrdNID6UUWV7bhWtzog+AWJlCKajk/H4QpRFYSGo9pfroawIky1VFOiJszWDbf9p6GzVIcb7VQAAePmAHWfgOEqsfRkP3oI2L4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfXyqhFMto7Nyhz
 +c+Avd96s+wquwmt9wwFPtbN5FQkyw/JIdVOvKHLgNY5yVGn5hfsUCl6kjDSBClGrJ0KRjdIw0X
 pMPI5JwtK4242I/hQyoep2VhZ/uEXli9qbJ5t0B10z5QRno7/EQqPWIf/XR9Ibs7hFTgFYd73b8
 1iJlA1gqkY1zgOleNDpP/xnrIW0W6UXYLy1hohcujGWj/HouAETAIZVuEJA11X5mUtSFgMcn2Ha
 39NXRB1RFB9erioPF8wJa5d7BLqdBTbIjAMpPW+55dCfKbqLh12CTt1px/4h48V6IU+2Ii9qmA1
 1lvdaUW/HOyG3+YTOHjnq3Knoxb/1r+MFIkCH2UsWFFxQ5HUf0ESPuvWQDJPfQ1mBMPNq5vEX/R
 faz1C+71j7/JmD2L61XPelhvy7Y+tctgEBPweOnGcOREo3GIgIqfRnYVihkEvtunu9aJy/UfIMZ
 C7YCW4e4zd1nhBQyLaw==
X-Proofpoint-ORIG-GUID: WQrDA7IPGBP1AIUaNwI-YdHCodGvITHw
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c12711 cx=c_pps
 a=ayBBURk7jZ4GzqZFlR2IhQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=yOGt4t9QG72VL48Hq1MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: WQrDA7IPGBP1AIUaNwI-YdHCodGvITHw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125503

From: Zhang Peng <peng.zhang1.cn@windriver.com>

4.21.0 (2025-03-23)
======
- Replace deprecated exo with libxfce4ui 4.21.0
- Remove manual registration of resources
- meson: Add missing file to EXTRA_DIST
- Hide dash from list view when comment is empty
- build: Automate copyright year management
- meson: Check for headers
- Fix potential dereference of NULL
- Add support to Meson
- Translation Updates:
  Albanian, Basque, Catalan, Danish, Greek, Hungarian, Romanian, Slovak

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../{xfce4-appfinder_4.20.0.bb => xfce4-appfinder_4.21.0.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.20.0.bb => xfce4-appfinder_4.21.0.bb} (72%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.20.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.21.0.bb
similarity index 72%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.20.0.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.21.0.bb
index 0e01740e44..4d7a1e2da3 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.21.0.bb
@@ -5,10 +5,13 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "glib-2.0 gtk+3 libxfce4util libxfce4ui garcon xfconf"
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+
 inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "82ca82f77dc83e285db45438c2fe31df445148aa986ffebf2faabee4af9e7304"
+SRC_URI[sha256sum] = "e3befc3e73d2315074eb88933f2b042c5b417f4f7f24be9bd4f4508a091037b7"
 
 FILES:${PN} += "${datadir}/metainfo"
-- 
2.34.1


