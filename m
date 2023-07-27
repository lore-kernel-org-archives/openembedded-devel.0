Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D79C00528
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 02:34:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4415.1690425251058023014
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 19:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lEiA5LPi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6572b4b065=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36R2EZ0L002875
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 02:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Hrq3i3uA2CvEx01ZFp
	UHmVNkGrhm8zMyZ6EwHSc3tno=; b=lEiA5LPioeQCcQKKCioLHgmWUH4aFuR5zN
	0KQF7Yske4q+xgovpHgkabLU99PPaszi5EVwsVXRS7pZJ4t+IIMTNAfr5sCsnS7I
	560Lt3oJX9BU/WkEkZ89tYv+Op/vC95T7wAjDUNGCAHX9Jo8GRXIJ7RNHxr5VmES
	G0doxFcaNFT8fvwVdOK0XxkkN4dC6+T1HFIVrDub/QDaoXHCIUIRHH1qyc6FzTFI
	iP8rJ6TCQX2giWF3jDvV37QpWY59CFfeCG0HXTGc8fDZt6YelssakjkGR0ed/VNg
	vJAUw8rr5pYzETMzNKvgp585G4i+JDHAKWaHz04cGyxPR9TIbJWA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s1a78u3jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 02:34:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiRSK1ARiN18NtoKWjJKmY8OXTXy13D4tsLw93MmS92RaTTHn6U7iQZPzH9+gulP56wrPdJFcvP1hwRh/izmAwzdItzhxobDAauXiiN4t4r/pQ0O5tGNS/ppTjXXoLaqDkFYDPtFznFCaGyA7i24YBToIJwdnFDmWKP+aKokN5IkJlUKTSliAUo5dKUQhybRZUDcZQAa2wrg7gmlXmx+1O3C5G8wmiAwtt+OL8+YFkrMeAi1Mf0zDqxJT+3ReEQxKU7Pee91t8vQcCnrIiHviV57vpVfoEDkdDWucuIzruOtbCUaqGADoz6tmHeBtqgV7vMfy7kCa5rPgbx7Qu6Otw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hrq3i3uA2CvEx01ZFpUHmVNkGrhm8zMyZ6EwHSc3tno=;
 b=F/0tG9b/EnA2V8ejWXOsyhuuGfGFOn3xYtCYPz2DZ9me5kPyt+YNMxSnM3MrfvzJpGg/W2gnf0DRULIaicAtR+Rs/TyC4B9XfOYR8iyL2A2OP8Gou1oPi4/F6T1GzvtxbSVUzDBPiD2ehLmaczyCuoj6ShWXpQp2cPBCEZSlebkK3tJvQeMDbto6DY+RpjTiWddEXbpazi3IdSxNyrCOvSHXTWCqn7TL1GXRzl1IaY9F4mc2eLtfgphwBo23P1LlEZSRbzdI1b8+pX40pXRTWG8U8K9nKAG1019PBod69o1rKrx8tX6ITcxAvNbFXEv/6R5tmUXbOvB8sg46xMlw/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW4PR11MB6692.namprd11.prod.outlook.com (2603:10b6:303:20e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 02:34:08 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::f499:a2a9:85eb:97ac]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::f499:a2a9:85eb:97ac%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 02:34:08 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] samba: upgrade 4.18.4 -> 4.18.5
Date: Thu, 27 Jul 2023 10:33:56 +0800
Message-Id: <20230727023356.1116138-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0033.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MW4PR11MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5535c6-40d0-45bc-cb6e-08db8e49f3cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3UAW48SMZvIksmKErhxGd7O69nPDUZ4F8QGrBzKPKKikwuLU7GPVwuBIB3h2b6n8JrgTKR//MPEIheGRgdDUQIUBHgbRrXrTeuBzES5h4cEfWvtbjebXwmIdKT0spy0A9NSc68lP/HeSibnBUKoCn3ALvWASYAHcYdQaWAPFicxFLG+4nGkt3++/BDQzVO2WGzcOHEtQwI4aMSXC3CnimfoxrpzQFnkQ9pYyjJAVX8sKQ6G+AnYfxsv+GttxYu1F1Y/nbeRpzUWC8q7Z2vWoPKqFUVY0s3JXx2/seljoqyw0XYqeo6Xb80fD2P1oEXuItQyqlovTv/ORPqh9o1YXWFj+7wHPHe5yjhlNF5/fAn9qBpOjf6SNuUlCM5HmnMU0izZH+H7akp21fMTcWNEiflgHMNXxwHme3t/IHud73Bn8ciJxr56exOJv7sZ2UI7hwSndHXAcN6v3m0z0QbatXuzuDFz1TZuNQfZoaoExwAa7xblecP5mOTB6kSdeiFv+ivQCeilo9XY68MiUMgckBvydXx+hleslBtcuZgOEitqjbirNq7PowvAt00nP59/MGWXGcuOZPacudsCFH3SECto3VB7Vb4TbOCIwmadwAmU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(451199021)(316002)(2906002)(41300700001)(5660300002)(44832011)(8936002)(8676002)(86362001)(36756003)(1076003)(966005)(6506007)(52116002)(6512007)(26005)(6666004)(6486002)(478600001)(83380400001)(186003)(2616005)(38100700002)(6916009)(66556008)(66946007)(38350700002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y1p91/AIMQ/1kfFUBF68nuq5qk86Gd1KTqkrobjU/ElcjYEVrZFXr3RLpZZx?=
 =?us-ascii?Q?PGG34a5/yDb2nkBovlyI+iwNP5nMNHjk8efj7kjAGxAn9SyyD5ugG4w46JnB?=
 =?us-ascii?Q?G/WCv7bLZFkKY+W/GuRRaUKNnftpsMzwfPLjR2OtUAr8++7/QIU92eJN9zCw?=
 =?us-ascii?Q?FFKgZl5k2Nk4rR0xPfMzIjWS9fjjuJnhkEkpzBpc5ydLXn3Ady3u4fCLuEgU?=
 =?us-ascii?Q?TgYCZfqNDjMJy0gT7CJVi2KXjbHRvkxt7lKWAp/lRfV3i81Uws4XdYBbgVgl?=
 =?us-ascii?Q?4LytxG32YfduBJkoDKzl8/8HOg/Gvc/87XTjA7iog2P9F6mIq8ugCpQD8qOn?=
 =?us-ascii?Q?hHcWvgTOPpvig10+Ap28BoTm+UY80HstADrKMIYuQwMvEhSKOG/t+DrY97OL?=
 =?us-ascii?Q?C3A1c3c03285WePiP10Aqtc4aB1gv4ty72H+SUmk2BLsbLhKrKPsPthSvZ5q?=
 =?us-ascii?Q?M3SkJdGVnhQyJ7RezUOLWNeiPU00BmYvLkfTlhmr59z7TAYrrQ824HlciUpP?=
 =?us-ascii?Q?di/3AL8bJPXW4P0XjldKouPJoem5+fXqmIu7M7MvkjDEcbCmVSl017kf+aFn?=
 =?us-ascii?Q?MI2B0yZoxuGwoaD1VysI2Y4enNCfXG9wRCXsRdH6tnDnFLvlXkgRkVMMcV9h?=
 =?us-ascii?Q?siyDA3mVUYMCNaJGHUXFJGhPZimUd/vepOWnd5ZPCygbKxRwno96Ru2AUN9V?=
 =?us-ascii?Q?GS2wnAos5FkkTYIj2W1hyUMwfosmwgL1Y36zp8+53ABMAa8fBAF9mrOw9mLp?=
 =?us-ascii?Q?3mn7lCqHyv377Vrl/rVsSOOPisWLin4IRQ6I7q31eRAhYpIwLJpuzcjh/eLh?=
 =?us-ascii?Q?iic5FjpG4pgyZbuShszxGTraiTvD0kojijhpqV1Ax3744iLwSA3Dl0tIszB/?=
 =?us-ascii?Q?FEgfK+k70KvQGn8cW/mwxBMAgDZDyEhUfKYAMfXRUHjkOc2B2vQWv/Asfsjq?=
 =?us-ascii?Q?kGbe+FG2xZk79cc+kVzRw6/hv1XW3yRKgqkwEY0Kau/jFwqPKWEXhulcCG/E?=
 =?us-ascii?Q?FobQwgSNVA4fUhfMW4Q2ieSZPRnVRNIeeiRUxxDKO4GFHl8yAe2JIRatQ2ao?=
 =?us-ascii?Q?smJCdr5PVd52g/te5o9c+hPs8YId8pZzk2yiZyllQBUGyYppuP5UmHCqz45r?=
 =?us-ascii?Q?5rEM+gsKrS0PTNyA37g/fSl7x/lO6E/K2NDp/MpPSJwuNUpFRDuVFhfj50Px?=
 =?us-ascii?Q?++izeVD6OOhtpLOv9iKcMo+vdKagb/B3ncpur5VAeiFh3SXXp2ucmxFv58Ow?=
 =?us-ascii?Q?e6gvvqHKLkAfMTMDAxGdFd8wSe6nXUPQRb9RtTiXVGeIa9K4nyImYaDKApI6?=
 =?us-ascii?Q?PFxFWreBomE60z+2OQ9Z/6RSVOaNEKjGJ1F4q7aqLlHde8S2whK0NqCy3uAh?=
 =?us-ascii?Q?MqfsqiSGrY0q8YjAtKv8RUuVQnrIyzuWHIQo2k1YyaHKw1JEuDVYn1fbu2mB?=
 =?us-ascii?Q?WiJWlyOu+m6dNowfawUJdDvX9RbQIbnQsb/FF7eEooc/h2VQpAsGJwOY89W1?=
 =?us-ascii?Q?k195Q/E5/C2I1PKkHS+F6Y4HFxtNYptCv0mIkSuhbDM6S8wD+q6OamCNGc6f?=
 =?us-ascii?Q?BCB8Kk7A6S8+vc/i2sKZP1yEEUsEbAGYhcSWaif2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5535c6-40d0-45bc-cb6e-08db8e49f3cd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 02:34:07.9912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECtXSlulIhV3Sk5sEEU3t0DIcY17Z8RsuJvnqbabL3EvxxBBRlcHE9qPmbj5dH/x43wpctINhV9n9FfGWiwf/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6692
X-Proofpoint-ORIG-GUID: j7ReL4ih7MVVmyu0ih7PTrLKDG3RwITk
X-Proofpoint-GUID: j7ReL4ih7MVVmyu0ih7PTrLKDG3RwITk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=788 mlxscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307270020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 02:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104042

This is a security release in order to address the following defects:
CVE-2022-2127
CVE-2023-3347
CVE-2023-34966
CVE-2023-34967
CVE-2023-34968

Release Notes:
https://www.samba.org/samba/history/samba-4.18.5.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.18.4.bb => samba_4.18.5.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.18.4.bb => samba_4.18.5.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.18.5.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.18.4.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.18.5.bb
index 66089edad..265cef6ff 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.5.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
            file://cmocka-uintptr_t.patch \
            "
 
-SRC_URI[sha256sum] = "6ba7b3503cc59c9ff4f6fcb1b510c2c855fff93e0b366ab891a32a4732e88e53"
+SRC_URI[sha256sum] = "095256ac332e1d9fbf9b7ff7823f92a3233d3ed658ce7fc9b33905c2243f447f"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.18(\.\d+)+).tar.gz"
 
-- 
2.25.1


