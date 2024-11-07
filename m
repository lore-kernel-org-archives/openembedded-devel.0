Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBFFD43363
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 14:12:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.72668.1730988726676656346
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Nov 2024 06:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1041d9134c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A77dlhG026073
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Nov 2024 06:12:05 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nfc35ubx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 07 Nov 2024 06:12:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ik9MRZW3r0kS4eAnet4spGaZTbBMh0qVukyjzatRLJX/OZzi1BJ000UrCCJzzbe5t17knjRDppVClVjCUIgSO26KfL5PTzEEtwBt6PMKwZU38/5hpJjvzEj+P5RQcgEbJTZbYUwonVGsMzOc+IkGHm7NWbcQQ3ssUq8WrM//xgLqR4faDAHNjhneZJuvP3FrFgLz8BrbPPbe8f2wLaCfFQGh6pWlfrXBpdcNO81MugogEmn3FPX7bW4+Mgsedk92odaB/BA/gXiLBZFW02frHjS3PdVRCxf8Kmd4DN0PRQ9ZP2BkpyHRFVm/SY4kzASdmKHoJDDnCY2/COB59d/xxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJqx/R/+JFFV447buSC4xXPijJpFTHiKDAPiu/fLKR4=;
 b=Pc8iQM0208MrqGHG5M6seUFqPAuo6z5Uw3mrqShvBXsdh4u0PQXO+o7nKwu2m5W17oTtU3MFMA5uNb7+B7UJTtc54+dv60lpulFpVP9C+I6yhq3ikhrhTgNRkAoBMba4XDsMEngA2Cr0dxSWUrUmgeR1QJsv9LnW2GGbxeTOclnWwIxczPJyxFF7kvadhkRcizbr4deAJjnd37eruxs/Tez0UuatRuLZ4cJ3uJYclZaaZxVOKr2PeRL7rSkptkTQBtnk/2w+vewEKHHQa8Adqj3MKuSpj00oeocMfCBpJHRMhkIHN0RvYswSlowXRAwQjWcDWLJui5KoyPyvpc8CVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB6551.namprd11.prod.outlook.com (2603:10b6:8:b9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.19; Thu, 7 Nov 2024 14:11:36 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 14:11:35 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] autoconf-2.13-native: fix interpreter on shebang line for autoscan
Date: Thu,  7 Nov 2024 22:11:26 +0800
Message-Id: <20241107141126.1990936-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0071.namprd17.prod.outlook.com
 (2603:10b6:a03:167::48) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1219e6-ff9e-4f0e-4f00-08dcff3616d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?r2EoOYsvWIQkiV83u8AtvngyxebQAo23+c6Ubtko278nJg3EgK9eKAlSaYAm?=
 =?us-ascii?Q?fOfIciCGuD/IRUfH1H/nUVrO5osfZd7cgF6CP1U2mA8dM7KyiHsYxNJNcyWM?=
 =?us-ascii?Q?oGz09PIeNCUR9X4YYvlFg16+82o2L2E1I5nfkhQuL9EbXeX97ISbmpBMl6pK?=
 =?us-ascii?Q?GUc+roNwSl7HRFfeeiCE9IRnnpOTN7R0Gy1S7aqIsS9yqFnfT7ujUFatADI3?=
 =?us-ascii?Q?d4tBMPNaL9EeX8V+GCssQNVnTFbN81wFlGbnFcTQQoSjXsugnSUGXIVvfAHn?=
 =?us-ascii?Q?Gn3q/PswiRnmlvTs3I4rklFZPnReNzBRxpdNcrcOrrkbRuhg8q4bg5rTMbH2?=
 =?us-ascii?Q?KJTfHQggQACSjFUcbgHW0acbCf24+mahRll/pKUroW/EoJ+GESEBbvXk2SOC?=
 =?us-ascii?Q?geOCZiDm8WMntJuc9ydlA5zjDK9/cAZEYyqh+aY4oSW+a9FrxQXkTcutDwPt?=
 =?us-ascii?Q?o9p8sJHZK6eznHdybfJ5H5zakwHSedJxtIV0kptxg2yS6MM99f91YBv41St1?=
 =?us-ascii?Q?5Mh7d/Hj7IJ7AOJUxnm6IMR/X5OY4wcHKznOAWuJBzQkr1CvtVtQef5eGUUP?=
 =?us-ascii?Q?vxfR8ttRV+TGn28T2n9N37Mq10oXZWxrveULSXM8wxXNnx9cK+g9lkb7guHZ?=
 =?us-ascii?Q?AdR0r4pxD4UIGfhGjjqwUQuLH6475pgYz444jfZjT5s3PZDtCcycAorT6UDv?=
 =?us-ascii?Q?i8QNEVtKMY8VUIiYp4UktR03BHyLjgGJK50wkLGjbSj4YDI+glI/OMImAWnH?=
 =?us-ascii?Q?jbk6sROs7jxnkzwkcVNn0JgYhcpnnfBYmMygpN4s8wkdUvDljXBnm/58u+6M?=
 =?us-ascii?Q?Ms/WJ+5ZhTx0SmhyH3dADGak1GqktsbIs0A/R9lL7DdmKaUBTuT6Czi3/juu?=
 =?us-ascii?Q?xvSK8OAGveEX+DHQgshgBLrby58i1To/e+Ju6fB66tL0US0ZXIeEiwSJzEbo?=
 =?us-ascii?Q?cNwSK6AroHokATYKxC5pt+mP1dc7hsTYImBrOWydzzcUoJ9BsxPZqFuLmpag?=
 =?us-ascii?Q?5+C6OdVxZ3AxNUoJB1V2h5H+BLA4ShOC1i9mMmOUPwY9Q1bjBM/662LhAi2i?=
 =?us-ascii?Q?GN/jy20RBBFAIzset//s8nQfuyvkHzeoSh567SCIJJgB8V+CFCql/sKAkEsS?=
 =?us-ascii?Q?mmHTS0q+MZ1dZsdM9qC5NWtuM9b2Odxskx/VgFu0iDD50+ZGXiHi61Yph28C?=
 =?us-ascii?Q?WkqEixSkoYarSMUGKaTEATGOMy3BOvnbB6zCoR0lmpdW4/sVvLSDDKFI639B?=
 =?us-ascii?Q?CpcufYX45Kj90BiKXpihjBz4V3xHUNYDi/2v2/UP4x4+IhpKdh+qCAR2zLrf?=
 =?us-ascii?Q?OqeYvFS+rGsLcaAeN2olP5hP+kaT71lVra2zRJZ79cpdYInWf+kKSHJ7LNXW?=
 =?us-ascii?Q?TwJmPO8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7wmLqtZfoXKP/QzdraRPHBeyW8CcGQ2kJd8B34OX+rxHm0ceSzb1RFVDJA7O?=
 =?us-ascii?Q?z3/Sd/GoMsV+A/LWOGA2IDkJ3ue4fGaAqotK6syqoQPgaiQdqA5JRgEQzwj+?=
 =?us-ascii?Q?KX130TSjH1Q8IVHRCyZ97CF2Dc0SlOb4oheKTADQTuaVOxC9kf9CwdX4GnrR?=
 =?us-ascii?Q?/YkuVw1Wd+H9iXgICWM7afeLaa1Hu4g9t4+SDLOlGAUshZq4yss7IqxCdM7S?=
 =?us-ascii?Q?xg0aijSjrc8Zvl2uiZYB2djSoAtNjKd1mz572q3m+k9LgiAHqNeKfRiZxs+B?=
 =?us-ascii?Q?aKkJs0NnHOChKuN3CarZJPsXTa645IdDHUqanrXIxZTp2OcrZtIbg4bizV6V?=
 =?us-ascii?Q?OJn3WgIBG4Q3RoTU9UH62CZgdw4pW/+7CL8YxI71pLmAwSZC8Np32UcoxIgN?=
 =?us-ascii?Q?WdEaKNIuJQ+H1Z/SsyXLQogPODJ99H/o42xXhgeVQlcwWZDHOCpr+RqYDOk/?=
 =?us-ascii?Q?n4B1a8zN601o7X76McEv5rXiDc//ujVnKPwG3z9KShb9on2+UtVdPCkKJsGB?=
 =?us-ascii?Q?9+QPqUO9eKnpXrMXO0a4RVB9ihY13JxTw9uMgaTYLICOvMDILVtInci+h+U+?=
 =?us-ascii?Q?q7ISdmq6vX1VRFB3eHqEJLTyr36CvD0yX05XOsvQNDiBFdPEZSn8lGLuX2ls?=
 =?us-ascii?Q?sgOPB4qwTpNJ03QQ0J6pDm3KbwC8RHRkr2rnJloaHR5cvq2qd4daIuMJxICU?=
 =?us-ascii?Q?StFJBlzuI3vQC3clkV4YMaY/1haoJ/lDAMaI3q2zpR4ndi0KZXUnP8CsITW6?=
 =?us-ascii?Q?IcQrFf6AaWvOtv+0ENMWTxSyfFx5fwrEoLB35Eo7Re+pv1hoVyNRzlbz4Fxw?=
 =?us-ascii?Q?MiXFoBkc/ShPbUM4HzDlUBWZZJQEEJ5LNQn33vHSGU/7Do33U2VCzMiSzXHT?=
 =?us-ascii?Q?Icg0eKbZ9101gCa0JcmtM0wnBwp0bHRlajf017KPUdkGhvkQrCJMmTQRI/er?=
 =?us-ascii?Q?Ck5RtlCpnwMqh6AhRnrnOJzNSF3nx3ReUmZVps6qY68ULWB+B65joCOF4x7R?=
 =?us-ascii?Q?TBu2TsFIWGyyvFR9Nhs34SEPsfqLdzJYN4d5PE+Vq2KIy9Af03PIjzDXWyhi?=
 =?us-ascii?Q?OGKinLqg1Yiq/Jm4GGmJcXvQ1/H1g7biH1fWTkhTCem/aRnBErS8AC/r0ZUG?=
 =?us-ascii?Q?ILS9VfDIMOgMRjebWSg3c7GRcYWenjTKDdpPnoH+xDMnsbBwPauKEAO1K2o/?=
 =?us-ascii?Q?Sq6+2ymsP0py/oDVJqPEM1XOploVST2ml/yvtKa9T504oP0rxp/tZlku1vC1?=
 =?us-ascii?Q?B2GZzajMW7IqafJB6evmDtU7Xoz34fq7p9Uj4MqvQgq7Lv1nBFRzrSxmUSuB?=
 =?us-ascii?Q?5+bBWn+Xo62OQliftIeiyZd8ovXwQZ+73dUwg4/gfbPpehMQ8C/QihbcwA54?=
 =?us-ascii?Q?/34L3r4YeCbf0MMy/aMLF9Q2mY6L6v4e6eW5PHC1I5DsSvbhAI7B7vIEfj5P?=
 =?us-ascii?Q?WRzNNSQFXhSbfoPYEK88/gWYX2a60CEDV7xpb1p4rxQUypjeXDO2Ij8WmpAX?=
 =?us-ascii?Q?a6JHClsj19poegO1rtvzJWXgLBe5Q1RaYtiR8k7texmJI9brM7ONJP+eo0Ph?=
 =?us-ascii?Q?QP9/DkWHjDqC8frUasj1O+ufhSemCsSUsKaeW2EJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1219e6-ff9e-4f0e-4f00-08dcff3616d3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 14:11:35.9244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1V9e3LQUsKh63Xk3OOlaNg1MRUNsSErkXhORjJJrPHsYfwv7AQST5yMI21NUE6ulwnRc4Af0nMJ1QBocKnEWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6551
X-Authority-Analysis: v=2.4 cv=T7feTOKQ c=1 sm=1 tr=0 ts=672ccab5 cx=c_pps a=v3ez6FdVe4RSF1xj2bRqRw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=oztWA7jbwgnddQHnOkoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: hGtiqBVE1bmc3LmoqIg9zangvg4wWEu8
X-Proofpoint-ORIG-GUID: hGtiqBVE1bmc3LmoqIg9zangvg4wWEu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-07_05,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411070111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Nov 2024 14:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113749

Pass CACHED_CONFIGUREVARS to configure to fix the following error:

ERROR: autoconf-2.13-native-2.13-r0 do_populate_sysroot: QA Issue: :
/work/x86_64-linux/autoconf-2.13-native/2.13/sysroot-destdir/work/x86_64-linux/autoconf-2.13-native/2.13/recipe-sysroot-native/usr/bin/autoscan213 maximum shebang size exceeded, the maximum size is 128. [shebang-size]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../autoconf-2.13/autoconf-2.13-native_2.13.bb           | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
index d0e0446eb..be184da05 100644
--- a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
+++ b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
@@ -25,8 +25,11 @@ DEPENDS += "m4-native gnu-config-native"
 RDEPENDS:${PN} = "m4-native gnu-config-native"
 
 PERL = "${USRBINPATH}/perl"
+PERL:class-native = "/usr/bin/env perl"
 
-CACHED_CONFIGUREVARS += "ac_cv_path_PERL='${PERL}'"
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL='${PERL}' \
+                         ac_cv_path_M4=m4 \
+                        "
 
 CONFIGUREOPTS = " \
     --build=${BUILD_SYS} \
@@ -49,10 +52,8 @@ CONFIGUREOPTS = " \
     --disable-silent-rules \
 "
 
-EXTRA_OECONF += "ac_cv_path_M4=m4 ac_cv_prog_TEST_EMACS=no"
-
 do_configure() {
-    ./configure ${CONFIGUREOPTS}
+    ${CACHED_CONFIGUREVARS} ./configure ${CONFIGUREOPTS}
 }
 
 do_install() {
-- 
2.25.1


