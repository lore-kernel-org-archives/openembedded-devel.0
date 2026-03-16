Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7FDF013DC
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 08:39:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46392.1773650350125946528
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 01:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cQ0G8M/f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=753566c020=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G5ZsSx2316938
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Hhcrq/xlcG9OCiMl9aDUm1kE2kg+Ost+bGfRAkL6FzI=; b=cQ0G8M/fEf67
	Z6k/uZCX3zFyuyu4HR6oM2GkNRbSw7eIsdXX0TFn0tTODoknHpN2b7H2d3xAT4vI
	IvOCAS7ecSk483QbtyCljjFOchMatf1dgA7cIvsPJdAtxAgspsJYv3WbwjujWnaU
	hBlI1b/FCuv8T8MOCp5EEOOkPXIiUCwAui4yZuuectdqGZfMvS0zmB7ZwTgouncj
	sFGZbfVJNKEO608a91STzwjWuJC8ppOCbvTunLpwiGzh8kJqquKgHDSO726tvTPk
	nxizqkd6eFpPbCabFisX5nyS/jYrPkeXjBcCjRF8h7cavc9/KaLKaDWI99GmPwZF
	ZIdsDimz4Q==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013019.outbound.protection.outlook.com [40.107.201.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvvvyhtf2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:39:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grgbXBzO6K9+ZC6zt9NPKSQPGUehlsY3mSIl7KW6Zpd3RATsZpZqgxyhDFNpCT9vvqU4IDpVCmtd/eEFfpr0Fqqx1ZjPKCUMVIKFmzzbVRa+eEnDTpeIvo8JkuRSGQ3V7+OHyPLivlM4Dmurz61I7EtZk2TMl4aY6uuIeN4XtSTqffmlIzFzF9ZmJY4v2H3HjJoIXx2NFm3sFrD+IiHyf+aLhnTlk6z24UIO0RaubcElC/y/4BbCQ9qpmVjGQmAshdEGF0h6xy8fqC4dkZHITSt3+BsLSews0JtipB40hKc4wiRdXOwi1LBrzVqpLvCBHJZ2QPfi7A+4J4fHbHppTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hhcrq/xlcG9OCiMl9aDUm1kE2kg+Ost+bGfRAkL6FzI=;
 b=TZ217O6dRQyErZcMZvleTBffxL2TVq/DJawgJBZlRViEAE4afFnS/H6S1R0JzXaKY5olqcxdCPubT+YnDYqqZeUzS4hFy8DaP0Bi1yDqtndLO0jUKhdiVTxU3c38AcFZf3j9ZAye3xQ7BeljchWOMyXw+Hcbk/IV8oBydIOae9nHyHGvd7ZnCs7JTy60VJqaN2QSlmrsyaA5M6YoyefkbHJo+sCzsWfS4moi0PuiV6OtrEO3ckHKgRTvCV9Aegz2uAMaI2pZcf31CYISTd1pQek0sC9gLBi+FH3niGOK4mqY8MVEGuUFqkoIHA65U4flxlliW0JZfR8tBo5l0mT0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 08:39:07 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.013; Mon, 16 Mar 2026
 08:39:07 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] atkmm: upgrade 2.28.2 to 2.28.4
Date: Mon, 16 Mar 2026 16:38:23 +0800
Message-Id: <20260316083826.1550599-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316083826.1550599-1-changqing.li@windriver.com>
References: <20260316083826.1550599-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW4PR11MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3dfaf8-c1d4-4b03-1a19-08de83377c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	HIr+VIZFtaBe0RAZMz6YbfoV1t2DOsvQdGt6NvtyyuR+b/BBMu0RWlBhnxJYk7HMAjRozt2Z2hAAKh+uskA986IrbSm5UiNwJXpV5pOg1B5XiYr0JQTHI3H1MkBPlntcULhawXZK2UVmoFHzwIs4m7t062ZfYLUwMqQPB6V5w72n0fnyT4iiK+QzkCoW4a+5vkYpkcmvTjXZopVbFKleHKQbc6qhn0lYpg61TQkkgA5I9vDPQSIsKrVIP8RZZBhJeuDnXhK6bzqBWYmBF8lqDmf75ZSMPb6KeMGvSmD5+/mPWHjjlf3Cgak9fBVk9bWeUuUIa8N4VSbV5S8orakmMh/e4dZfajV8s1QxSt4vATB1CxfWTUhpTFzmLCitLBXZkaIfn3VsRv4A/ltPyk1VcUDd+ssAZrldwHoc819bjx1obMU2Iy7nx8PXk6GKtYSALU2HrZBjQEKbfN/slJHBGIkt7CnoOn3KxZhK/EsVye81kGYxiB9EpdcG1mctQFo9GYt2zkMrf3FuuMzdDwd+gZRYsw7EXfUmTT065e5gDisswtpKs8tjkaNcCHMSPaOYoF6s/nB3/C/vhuLS4bcXzdX9UnwkgIwG6Hv7cDojnEnNRjIuubvB4+debQXbkINjkR9H3E6MNt6tdbXplzveC9cNLbMVEgnf8pRe7mXH3/4S3S8xX8zih9j54n5KUquPKTb6Zz/zLiPxly4Qtn8SwFGtZwWdaP1AQiLSdZvc7xnZx/MCpaEwr7nGNTqjOG1Twh6SbxhcVyAvRLgrw4u2CbLzbKz8J+rb/zwVFYilkD8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BKyMKFHZ1CVhMDV+Jta/rsnJczWaB/z24r1v9gAmum21/HDRpV9OEpUGuqYW?=
 =?us-ascii?Q?guhAk5FTeOGSflhTagG/6eBoNYMG+pT6LL8fzs9spYsEoRjtzDegBv2WKJ3D?=
 =?us-ascii?Q?PJca/YDB8WIvDg0wUieVBhRJwvmEgncx4oQGK9NDP2Ep/9BF/8VVgJRpPXlX?=
 =?us-ascii?Q?bZ0HgD2RVQtgK/RsIixYAdCQp7o/lEbxDVXZDw8kmLEjDEh/iO5PLtbq5rXg?=
 =?us-ascii?Q?pFxYGmaZuDX6I4rLjbSL8BcEcbJrSEewc62u7DQYBkSkweajiC2xxiBfAlVx?=
 =?us-ascii?Q?GqPm+CY8h5/uSj/8p/BbQHnoEWvHpZLdgKIs4krwN14QKWWJ4P9ISnEUk+Q1?=
 =?us-ascii?Q?j6CUjs7F+bbEzk1QMWxAgGhtiT/doddFgMR9BQ+DXHUz/ewWkvVTzX5hefJe?=
 =?us-ascii?Q?qS65ggdynYnnEpd+WxIfYooVM3eW/Ea4c3y0ef4FqYyXfLg2v3wyFGKdoArd?=
 =?us-ascii?Q?LVCIssc+hHD7i3CefIv4sqVrUYd/+xYDO1B4wbnrCdmGcdoEjqngBZG7puuH?=
 =?us-ascii?Q?Q5c4FTDpAXPj+rTosoRH95S+R5TcQaNubs+oOcUSsLeY2+4izXusYCt14+n+?=
 =?us-ascii?Q?SKPHnNeFCAWcyt6rqYzBiYJ7Ne10kFZsRcdvGCm4DnzfzAsSYJSbAo+745ek?=
 =?us-ascii?Q?lDJt3O9xJ8pf6O2H93qyuaW6wOB931ir3pIdwT0K9r0FOrGP2plw0jifb4nP?=
 =?us-ascii?Q?UB9mNbUJ4RbcGgTwgpwiaf7HsD+Me9Ie5GhUFLj7a9CRKMzauIFVUk4f03fT?=
 =?us-ascii?Q?HIsJLxLOjxLU8ooctnDB9IHy4KdMsBpPMgAvrrYB1mfUJXg6SNUJb5YoIW+Y?=
 =?us-ascii?Q?sfKKpdsmYOdzd+OtJrsfAclZ4c8TaDpMt5kbWpahRsEIVu/AtkuQKlqiXXzX?=
 =?us-ascii?Q?BinLrc1KAQ6UCoKs0Rx8EtuACAvMYjw/3RJfSfOCsm02kd1LF9GmEQCvoDEM?=
 =?us-ascii?Q?sSRAss5x897ewK4dUd81z9UZhYXnh8VQEv1/aknEkEDdeEjEAZkM+iF5LXuy?=
 =?us-ascii?Q?Hvfw0GqoaNnzqbscK8LLXqL59DaPz7bEo4CTYU+qXUujYtKqHKNNBLPvnElm?=
 =?us-ascii?Q?jVP1PWhbTgDIS3sp3kREiPAOQ0kWphroLl5OQi0hTFzjJYZXveYye+5Sg1WI?=
 =?us-ascii?Q?1J1RfQtD06CelcnYV/VyHH3EDIAbYttUJ6VDQTQB7vM+G1Tibk1q2e9daU36?=
 =?us-ascii?Q?7kQ+qvmtEa12sl8W8uQUm4UMYEeuaA/LqQ37iJpQI932tC7ygeySxqd/kevM?=
 =?us-ascii?Q?Zjoz0bGK3GTf2hRWeM6znM7YqYGE2eAoED9zePe2KstU1//HKJKfqWDPJGFd?=
 =?us-ascii?Q?naozTOnB0HG3u7/LfxXiqEYIM99PTx2vk7WAld6NZSQ7P0vfJtal529EReLl?=
 =?us-ascii?Q?fsgqtVWvNIdDVf5KzZuclycSpaxR7O8tXVC2eHYYJsRHqPgBC9Lc4cNyUp5E?=
 =?us-ascii?Q?gJwfuNTfG2diAXU3Jv+UdEXRkkyEBhcRKdoHMc//hTznwSZ9q784NjYkkPx3?=
 =?us-ascii?Q?MqEBnLhe81fa6uwS348jLOEoMR0aCInzvFDfGlm0QuQZthsn8Ot+zmRa00d1?=
 =?us-ascii?Q?beaWxLCwYjsPCFAQeFxcP02z21snVoxYU0X7qv9B0t/TFdSTfYa9tNI2tb40?=
 =?us-ascii?Q?wlUfHfdAQumSUMSuiOrhOP3FUpXarwuOWltMeVr2muJfTNFduXtSDLnAwcJJ?=
 =?us-ascii?Q?ZixUxynYsrQDDG23mOFXTX+fUTRR3l9jIr1XTcgp3FMtdbKtpf8t4M/sIMA7?=
 =?us-ascii?Q?1Dt/RUvcK00eNVQXzc6SsBUBZcgnGyw=3D?=
X-Exchange-RoutingPolicyChecked: 
	mm4JozWso/NnlEFDr/lnpC1kMh624qNzm6J3kLO5afUI/Iss4GdiI6yiH7y6eHYMHwFpcucHe2JJK5aH6B9ksOO66/yHE/04Tvh2sCrkozUif+qURaTwwdTy7kOqDV8sb1VHUC7m8++i6nJGokX9ZqPC7ZTYEj82koTjom4eMXqiKs5AbwnCajyP9FR+li3IQjDsxaqLeelfB5mXpw0qOxAxeC3T4awuUR8GiKS2pDb06pGOtX8Dpxwl9deREWTseRrJLLwWoQ8l7nMdHtlLoixZ3UViZunyAzRRZjnRBKMVDU1OlKsBBeZbb8ASke5rkqrz1znZvNVJU1Cb6K1FaQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3dfaf8-c1d4-4b03-1a19-08de83377c91
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 08:39:07.2666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lzrt9GzcPfrIQ0M3Grm83SKjjwh+4mf5LHIFNnzTzjD7wV+JE2Csu8cDmh0/YQfrYX+MtkmU0Vf/qplsGQECT+omL6c++bLs7arl19b4qHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7149
X-Authority-Analysis: v=2.4 cv=E4XAZKdl c=1 sm=1 tr=0 ts=69b7c1ad cx=c_pps
 a=UA+Ybm6NSixuq697YtHT5A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=8h_biSVXYdKYdOtk1L4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2NSBTYWx0ZWRfX9pHLW52cIlX7
 oGthr47IMRSwFbL34HOoI9iVmjmY6dOL/KHoTMaGhgAQQApF7XUroRw0e5dq/CfelmeAkSY8iih
 fM3QR/ODrHocCf7RfIFhN4nLkcA3e8/etlshRaYOq2TTlii4jKqm+BP2qU8B05q0lWetFSlANUQ
 d35gkOXJYefPkQjzRCTmUjf47SUjfiFE09kaq7hd2M/QwZSEDgTWQdIcn5fQY3Lv9w/JtDl0gIB
 9D/15HjlCHEgVtGJh85yQZMXYAerGqpihRclmTxluDzRaDPMoM+WEpKWFSw8kNARJ6eIutJJHa2
 X2BiRWl2ikmy/A0Rny1UgrqFJnm8fVK6AU+uG2zvty/ornnBEzj0VBx7/tCqdwt844DT5Wqd8s+
 kFiXjcxKSmqPXCpnmMQ9lzJIIGGtsCdLjnPRBZ3qHXmBXP368Z+jpVDCYP9KF9EcSJPoRU92LLE
 fhmWLqFaS7GtffH6uLQ==
X-Proofpoint-GUID: E2zuj1r5skEjWonOettafKSCVfJ0Wr1h
X-Proofpoint-ORIG-GUID: E2zuj1r5skEjWonOettafKSCVfJ0Wr1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125260

NEWS:
https://gitlab.gnome.org/GNOME/atkmm/-/blob/atkmm-2-28/NEWS

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-gnome/atk/{atkmm_2.28.2.bb => atkmm_2.28.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/atk/{atkmm_2.28.2.bb => atkmm_2.28.4.bb} (82%)

diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb b/meta-oe/recipes-gnome/atk/atkmm_2.28.4.bb
similarity index 82%
rename from meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
rename to meta-oe/recipes-gnome/atk/atkmm_2.28.4.bb
index bc637470f9..82e4d21f4e 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.4.bb
@@ -12,7 +12,7 @@ inherit gnomebase features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "a0bb49765ceccc293ab2c6735ba100431807d384ffa14c2ebd30e07993fd2fa4"
+SRC_URI[archive.sha256sum] = "0a142a8128f83c001efb8014ee463e9a766054ef84686af953135e04d28fdab3"
 
 EXTRA_OEMESON = "-Dbuild-documentation=false"
 
-- 
2.34.1


