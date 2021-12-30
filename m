Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C87C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 13:14:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.64087.1640870050158794725
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 05:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=PQuen27n;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8998eaba3b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BUDE98s004680
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=2yYSAf7IrxPkXVc3t2Sqw3Qhtm576+MdXHg59kBOt10=;
 b=PQuen27nzhx0MHTxqfszgR8LyT078xBlYqv3LBiZK4BWuR2YZyWuZPlyoXMPNL1tb2nR
 9LVdEpnWOmaBaDDQ0CevCdaMMLFP6DWu+RucQw5IGwf8+sxqwgj9dq+98kfFtDQjerWh
 5Aj9p2cxP5sgk6ryS3WRMi9h6O5qaOjv/n9z7QMQg7NqK9tAZFlHkb3J3o6vLEb5W30n
 HvB1FzmnbkCk3EqYf/KfO+4YmHsWeqt6CdaohfKriy/b9yDlR2t/+kAhb3WwnucWz80o
 PkZLN8lxit/hzedwjw8X9+sldbCJgntRlz82IyMaUchhIDTJV/UyQ03PcoAf4X8sl/fH NQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d8yayraw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:14:08 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BUDE8bQ004620
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:14:08 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d8yayraw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Dec 2021 13:14:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtSDgtgS5ozayS5fu/cYuFWYWsu+2rsrCgtkwRBxHZCKrWIR1/T8xefvQoIYaGNJODYj840DPF36W/GURN/8Lnto7LfkKDsm3rqy2cP873Nq00dp0I3b1ZSOB8gH81uHNQL/qF4ZglM83CE9Ox3/ed8W4IE6p65XM7K0OvXBk/TjnYPu9kQH5YttLsBnXWiMkEEqUR9qmXBPs3JZJInT9Q0K/vCGS8m47Po8A9Od1KcSsN4hV6QAjQgpmH3vEfFS8cLWYtJtLWwQWaMk0HheBt+d5rts3dkN78roWOjfbFlJkDMzZC3wBSiZey7+ATYxAFGowefHbR+CN5P2q3ICyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yYSAf7IrxPkXVc3t2Sqw3Qhtm576+MdXHg59kBOt10=;
 b=AwC3cT7h1MuKiVqxD63SyReqieGVwuzEEuzT3d9dnzXhbdXL4mZUxTUev0K/NM73YduUL9GvL8jqFOO8kMfhOimPQbzWBId1MYnjdrDdIg/HWJSKBmNsy3quL2CmpZ8cspmJqOo0HJrM9QMxsiXjEsiCcaLNP0vocGDUaVI0M3ty0PBhPMFkU+kWrF6n2sMig9iZgM5o6ypgggmbJeIhZoG13yi9lqytKyxx94Ho9y78Bp2ONZth8FXpc0DDnMUjBPdSmNTBdDrnApoauCaF8BvSkyyYkTV5W83rO7nk7ZT4dJz9I0iFY0sNqs8CWy2rJR4eXZPqtIPsBToKoql42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 30 Dec
 2021 13:14:04 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%5]) with mapi id 15.20.4844.014; Thu, 30 Dec 2021
 13:14:04 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][dunfell][hardknott][PATCH 1/2] postfix: fix build
 with glibc 2.34
Date: Thu, 30 Dec 2021 21:13:50 +0800
Message-Id: <20211230131351.1097560-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bd6516d-dab1-4e57-2033-08d9cb9640ec
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5009ED5E728974EF47E91E44F9459@CO1PR11MB5009.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u6kCtC2X00UpaZYG0cIoaKSEME+PZpQGzn5BnuLEkAiyrzV+im9aHBhOpYJKVjqZYdGSkRcL6vNBOiYPA6tEp7VGKXGXZfimfdBVTXz4zO/Sn4MXINuCY5QNRLH5DFp3EZBIQS4oHFa5nCDCNlQPCXBL7g8VAo40VZ/preN7FcYmDPvFq9yoaSY4wkhuSHSc4s4A1JqTF0IUBl+U7KjO8HBRn/s/N7uIKKFE8wm2FNVMqS1QXM3AGfPOhHNoLFSLmdipZ0yC5dsLPNLdvU+NSb4vmT9ycrz+milPV0DZkwZD22KoejmydNQgNYanJvSsFvjYLqAbI/4JEfO1vDyAs7V4VyIR6op7q6eWP1oQ1jygAUMCFqZBYGSnNwokPlsFTmGbrBvl6iPpoeNk+nln3idHuV6o7xLdpTqG+7CRav+X5GTWWtcTiJOt0bQR04jZ8LM6moZIzYj40qAJTeXP/J7wZOQ/irOocbyhB3CEu2Y97cXp9xmiZCZVSlNLIV7tB91IBloGl1cM8OxGAe+rUNU/yUk7fprxcaqwb5KKZM3l7qQ9RpMwTSJZyERHznrpt4rQGeAvOSJ9lBI5/jX+iotjXpFtG5VICdzY7cPzTt9DFH3TLStALiCW3wDN/BmaSjYhu28VG/i7c64IU64hoGiF4mhuNAWOgHGIDTvRLF3PR/TjQm77NUSF83rBatABBgAP+fG5jq6uFH1NFHZ47tNf7t8bGx8tC1HWj6z0KCGacO70GoTYveZLW5uD+1n9rhHLS/0MoosoGh3CcLmohBat7Fpq7KIYqDwDZG5WyQI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(1076003)(8676002)(38350700002)(6486002)(6512007)(36756003)(44832011)(186003)(8936002)(52116002)(6506007)(6666004)(2906002)(66556008)(83380400001)(66476007)(508600001)(2616005)(5660300002)(26005)(316002)(66946007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFNkVXRtSkJMdHh6QWdDUGUvVW9BMG5ydkpsQStkSmo1MzRFZlkzcVAxaE91?=
 =?utf-8?B?dUVvcWpKZnVLSEN5L2kwOEludko5dUcvMTB1eVh3dHN6Q2pYclM0TTJKZzRi?=
 =?utf-8?B?My9DTWYxTG85MkFmQWtaQklpNUdldldtNjh1c2VpVHFEZXNOOE5GTjlLMGsw?=
 =?utf-8?B?bVZlZllmUlIyVTJJYUgzMXFBNHlWQ2xWVlpDZnk0bUJWOWlEZkcra0ZYdUxZ?=
 =?utf-8?B?RnFwaFhlVEZtaG5DbEd5Vmo2WkFhRVdhZFplN2txcGdscmM2WTVGUjgraVVh?=
 =?utf-8?B?bFJLaXhjZXhWcHhqbHZlbEV3eW9wYU5MOXdhU0NqVU1scFFVQzhyTHNwNkk4?=
 =?utf-8?B?K3VHem5aVEJoaGh6ODlSVTZ1VmU4Mi80RC9lN01NeXpUamxuQ2taQUlacFdT?=
 =?utf-8?B?WlM1bnNFQ05tNWd1RURueFowMmpDUCswQjNyb2NSM0VRNHIvZGs0anlZdlFt?=
 =?utf-8?B?ZkxCazJNQW1TczZDZkVNcFVrWHloaVFWSW52NHZrWlZMakR5VU5yUWFMUjZU?=
 =?utf-8?B?VXpVbVZpWEh6MjJ6TUtDRmg4RHVwWFl0MVllRWI5clhZSnVLbWZnUzVidmtJ?=
 =?utf-8?B?allXMnFLamNnMGlxN0V4ajlueEJnWW9yZVJmRkp2b2p4aXZEYlJUL0k4d0dz?=
 =?utf-8?B?Wk1VSFBNaXVEdzgvR0xBYUg1Um9Yc0QwT1N5dkxJaHMrQ2ExUUp6UW1obVZ3?=
 =?utf-8?B?Q1krelR4cStxekMvSVZtSzhtNndxbS9CMEZYYmpOR2xyQUJMWXYrd2w4dlBk?=
 =?utf-8?B?eC9tTkZSelBCOE4yRXNKZkh5dkwzY1d1Z3FDa3lxUEdOS2t1bHpwazN3ejkr?=
 =?utf-8?B?akRNajJaUWFSbUtmTE1hRU1BZkx5OU5SWXp4QW94elZ3SGtENzlwVEI2NkFO?=
 =?utf-8?B?eDZnTkc0SGd1dllhamY4NitTTFZtSWVkNi9mS2NpTGgwWFBrNzZoWnc4RkF1?=
 =?utf-8?B?YWxUUU5udUZ2WFQyK3dEZGYyeElFTkwwUzJOU004MTU2UkdJcXFVT0ljMGVu?=
 =?utf-8?B?bFkzcFgzZ0pBblgwaTZicEZKQlpGVFdGWjVJbXJZcExpcW9MMG1EcyszV1JP?=
 =?utf-8?B?YTg2Qy90MkdiQXF1MHJsVEp3S04vQ3U2K1VGK2ZaMkw3SVNwQ0tUOUtXZ2lq?=
 =?utf-8?B?UzNhdXg2eWppZzhIM29MekJNOWtxOW9Vd1NGbEQ4VHlFRUp5RVl5TFFOVlZo?=
 =?utf-8?B?UllHNG1Xamx5Uy9Ld1BTOXl4b2UvMVU4VnE3eU9kZmxNUjhVTURCeCtyZGdM?=
 =?utf-8?B?OGc4UVFkYUVQVXY4SUJwT2hwemhuL2s3VzdwbmhtZ3NDL25WdnFNTjRhMEt2?=
 =?utf-8?B?ZVRENncvU0NjY0FkMkVReDh3NFp4V2VZalhPVXhkcHJUTG5CTVdHYmxQYkpv?=
 =?utf-8?B?S3lFQ29yMWNiSDUwcDJwQzArUkxaQUROV04yTVdxZGcvWkNlOVRpakdnQUtz?=
 =?utf-8?B?Z3YrQklUbzZsQTdRbmFmZnRzcXNVd0F0ZWlGdi8zcnMzT1NpQ3lvS3IydWJJ?=
 =?utf-8?B?VUQ3djZvdUJud08wSXYxanAveXFxL1VBVGhQdWFXUFhBMVZKaDZDQ2FvbTU2?=
 =?utf-8?B?enZ3TWxjVWI3QVdrVHRYZ3FGM0Y2dFpNSmo0NUdSU01SV3daVW55ekczRm9E?=
 =?utf-8?B?NXU3UlJpR3FEUUwvOGhkM3MyTnl5SUgzZ3AyL3U3MHU0TVloZzBKM0hob2pF?=
 =?utf-8?B?Wk9OaWlJWDZBTUxIZzlDaTY0d3h3U0tvQWZPVzhWalNkenhPWGRYUG5yN2cw?=
 =?utf-8?B?d1VpdFdIMTdWcXRWbTFzaVZpelNYRnlvd1pKVHVIRlNLc1JtNWpOOHlCd2x2?=
 =?utf-8?B?Q1ZHRmJ0MCtxcTZDQmFKeTlIWTF5VlpMVTZDQXFCOEdSVUEveFFoaFhNNkI3?=
 =?utf-8?B?Vm01cDRtR2lXdVVlaTVYd25kQzZTZVVLbWhQZ3Q0K2V4cC9IRnIwckJjMTZi?=
 =?utf-8?B?MHo3STNHSXN1U1RLZGEvNTFBUHJVUWNWQlRaU0RIbkdxdWhzZDRsWlM2dlN2?=
 =?utf-8?B?TndsbzdhSzV2bU55NHpoV0swOW56Y3hZc0ZVanBBTkdOWG1GemR5U0drc0Zt?=
 =?utf-8?B?LzZWWEtiajV6ajRKdExiSVZ2d1AxVW9vMzZaYzQ4NU1PbkN1QmZBUmVnWjdn?=
 =?utf-8?B?NGV0K2hybzRlaXZKTTBZRTJrSHE2dzRBYWovYmh0R1hYdCs1anlTYzZUZ3Rn?=
 =?utf-8?Q?BOjAMFJiWzKASfpK2mqTONU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9bd6516d-dab1-4e57-2033-08d9cb9640ec
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2021 13:14:04.6038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cRiwH/ymB922fSfmSr0zzzxvdiF/1fwcsQij6UGGaTMwabyJ9YhyGZS5oVXaQT+wI0r0e3XozeIILHFQx9Tt1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
X-Proofpoint-ORIG-GUID: du8wa0XtcQKsofLE64crU-EhqAXmT7cE
X-Proofpoint-GUID: 2lueY2iWA2TerXEzkuHVtJjdBA1k4NRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-30_03,2021-12-30_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112300076
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1BUDE98s004680
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Dec 2021 13:14:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94568

Backport a patch to fix build against glibc 2.34 (e.g. on Fedora 35)

Fixes:
| In file included from attr_clnt.c:88:
| /usr/include/unistd.h:363:13: error: conflicting types for
=E2=80=98closefrom=E2=80=99; have =E2=80=98void(int)=E2=80=99
|   363 | extern void closefrom (int __lowfd) __THROW;
|       |             ^~~~~~~~~
| In file included from attr_clnt.c:87:
| ./sys_defs.h:1506:12: note: previous declaration of =E2=80=98closefrom=E2=
=80=99 with
type =E2=80=98int(int)=E2=80=99
|  1506 | extern int closefrom(int);
|       |            ^~~~~~~~~

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-fix-build-with-glibc-2.34.patch      | 46 +++++++++++++++++++
 .../recipes-daemons/postfix/postfix_3.4.12.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-fi=
x-build-with-glibc-2.34.patch

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-fix-build=
-with-glibc-2.34.patch b/meta-networking/recipes-daemons/postfix/files/00=
01-fix-build-with-glibc-2.34.patch
new file mode 100644
index 000000000..b6ec8c70d
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-fix-build-with-g=
libc-2.34.patch
@@ -0,0 +1,46 @@
+From 1f25dae3f38548bad32c5a3ebee4c07938d8c1b8 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 30 Dec 2021 10:35:57 +0800
+Subject: [PATCH] fix build with glibc 2.34
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The closefrom() function which is introduced in glibc 2.34 conflicts
+with the one provided by postfix.
+
+Fixes:
+| In file included from attr_clnt.c:88:
+| /usr/include/unistd.h:363:13: error: conflicting types for =E2=80=98cl=
osefrom=E2=80=99; have =E2=80=98void(int)=E2=80=99
+|   363 | extern void closefrom (int __lowfd) __THROW;
+|       |             ^~~~~~~~~
+| In file included from attr_clnt.c:87:
+| ./sys_defs.h:1506:12: note: previous declaration of =E2=80=98closefrom=
=E2=80=99 with type =E2=80=98int(int)=E2=80=99
+|  1506 | extern int closefrom(int);
+|       |            ^~~~~~~~~
+
+Upstream-Status: Backport
+[https://github.com/vdukhovni/postfix/commit/3d966d3bd5f95b2c918aefb8645=
49fa9f0442e24]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/util/sys_defs.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
+index 39daa16..5de5855 100644
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -827,6 +827,9 @@ extern int initgroups(const char *, int);
+ #define HAVE_POSIX_GETPW_R
+ #endif
+ #endif
++#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 34)
++#define HAS_CLOSEFROM
++#endif
+=20
+ #endif
+=20
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb b/=
meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
index db5b41bfb..e7bb3e9d3 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
@@ -13,6 +13,7 @@ SRC_URI +=3D "ftp://ftp.porcupine.org/mirrors/postfix-r=
elease/official/postfix-${P
            file://postfix-install.patch \
            file://icu-config.patch \
            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-defau=
lt.patch \
+           file://0001-fix-build-with-glibc-2.34.patch \
            "
 SRC_URI[sha256sum] =3D "18555183ae8b52a9e76067799279c86f9f2770cdef3836de=
b8462ee0a0855dec"
 UPSTREAM_CHECK_REGEX =3D "postfix\-(?P<pver>3\.3(\.\d+)+).tar.gz"
--=20
2.25.1


