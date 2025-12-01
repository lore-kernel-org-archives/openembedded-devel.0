Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5883BD116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 13:11:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20951.1764594658667222715
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 05:11:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DPTwUzy3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=443058086d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B17UU402215584
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Dec 2025 13:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=dAsvX9iMxgvASMm/Ard1
	16KreY2HNHJ3KZ4DXa7rJLk=; b=DPTwUzy3MTXFAJIzQqPpdboQteo1eG4QZN+t
	0mS7+qbvGoj2Fg5fQVJP0puhcVgxTYJ/2mysnAFv8uFQffRtWX95MF4ZnxA0N6L2
	ksc1EuktvNdddgVL80HRmESiZUDSRBRAamjOSGEj+edx9wOC2sllMCbV4FnlwvnV
	s2TsPzTJa5ZsP4AXgoNDRBgA1medZ2SifWGc4lKw9UrOTSrMLnE9nmulsuKlPVKa
	XLVIgc2xtbSYap1i6VgARsepY2gas5McqsJUmG/V7vplcvhLIE5uHptb+b/TyEyY
	yL+62nFwCMLirG38uFNX//MLrMdGTafIYMCDdH0oPqoGv3sY7g==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt69tuw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 13:10:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZLRbx+oOg2YJ9FWPaNIK4HZWaGuXfeinZoM/qMgIEOdvXJKd8LKxGYISvyHE7AjbqzUJAtuenVvtrlsqObGHOkMJeGSBw1CgsdzCyHlyHqean8zN1rYmeaag17VLxJ4ycoWernxxv5yRL1ja8WRwkXNKjbEOblCfubDV5x8Xqi40K0Le5V5jD4G3CcvlhuFGM8qIRTn7Gy17i0FxBtu4PqAbWy1ukcOJJZAAFodEvxUKf0REwruoGc14u++y+XPgwQ/eTQHI+O6H3UsTq9k+/TaAM8AqQjebF0DUQ5+Vzl8FJDGsJFOvwb9asCrZVanZoyhNC3c/YlRZfOg+fkgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAsvX9iMxgvASMm/Ard116KreY2HNHJ3KZ4DXa7rJLk=;
 b=vkIfEkJ4HmTOTZ8Icns5KQ4VwHx1Owy+C1xZv6PpJSLo8E0UXnSQiHDbzgSqXbplk4n7C5Y7vIulxDmyXX9k0JgaOOVb1QFL+L6S9X9/H0KNYMIggQsGR0q4k672p7PlL1cvTvZCve3dczWnVUOYFn5lVnx62MYis/uETowWfT7cE294wAstiU/RcPqTP1gPAOkEb4bZZ/NqLfajMbpqMVIAk1sygQnLQjKl6d/9ByGJiSNMgcXY+rG8o8OnTJ+QdF9MHfWYS+/Sbl2egOKtttcGby3a9DfKn1govutzxvDdMvHVL8QW+QwXosM4ZwvtDIYlD0oPuhV93vMYBIspqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:10:52 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:10:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] crash: add zlib-native to depends for crash-cross
Date: Mon,  1 Dec 2025 21:07:53 +0800
Message-Id: <20251201130753.2296541-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0072.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MN0PR11MB5963:EE_
X-MS-Office365-Filtering-Correlation-Id: c60caf92-a7d2-4688-0ceb-08de30daab62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zymiSPwgYYxdInbnQdJidZ0opQ5uYmzKhva8yRSX6jrEMNghCEch8yhLmWGs?=
 =?us-ascii?Q?Qrr2ra27GSjWX0EqlQpWd/uUVGfnMTHaq77WfOA2C+MH8VzDxYHS2moJw/oH?=
 =?us-ascii?Q?c/uoIfqimJC+QdokOqY8bW4D48L7l56fyGPaYFoVKA5xteSfpbBPyMUh27ek?=
 =?us-ascii?Q?A27DQuG+9PILzDsEzuY2xFctqqGonhYTkiF0v2EGbAkOFRFJSdlUoKVNpbFT?=
 =?us-ascii?Q?hlp62EFV3WM3BaoUEg/jnsy92yfGIo0dZ8MPbRKwCDYdRbRI+DV8zEyxvv4e?=
 =?us-ascii?Q?ZUEbIFEQJ9mc0rlt0W2YUva+8DXG/G4gMQDQRnoIdlTZRrx9MPlaANVfpfIt?=
 =?us-ascii?Q?sLzObBlBeG+D66XKokXkDZQ7u0RrNZKQO5uqc91FZq77zhyqW4NCLOv0w12A?=
 =?us-ascii?Q?pmXgt6SNvqjFPujBrQgt33b8NlFC0Si2TnzQ9jtmb9VWbG+4BXQhm5F2s6Nc?=
 =?us-ascii?Q?Gy/y4WnZ5s38mMtHNu1Nmw8gf6oQfq2evP9v/YnSBavspLT6ZMr+mYL+q4Q/?=
 =?us-ascii?Q?f2jm2+s9RdslcJncLlwTSWZHmeIale+926kS0+RJt85DtRrighFWTnncxHwD?=
 =?us-ascii?Q?ayv89nr50sV6qwRu+Ipt5F3dkCri2D27sxmKjQsU40NIO2SrUgyhcD1HPL8i?=
 =?us-ascii?Q?OXlmduCCP+yxWlVFxfOp5wVStQm9ZIW8CZBbsQE0aYOVGJlLLayeVPgXVNSo?=
 =?us-ascii?Q?PbJ5co6A2Nt47majO8Qq9WMGF0DzlC1+AndxgB7PvWK5haV8qDwJpYQiaz27?=
 =?us-ascii?Q?Y2jXDmzXtK+rW3/U18Aaaaxgsa1TCg3xFGdYMXR/IQfR8J43OKzWjivpx4dD?=
 =?us-ascii?Q?rxpUg2AHM1La4dRExvpUY8LICn4a/4pg6LrPqNoOicgju4VH8EMByxhQrIoM?=
 =?us-ascii?Q?m+hHCeh81i84af167G5twdUvAgMU1vzk6RpjUDj9wPuz3JN/cou77AvkzdD1?=
 =?us-ascii?Q?fEa60SHIMspvwaBg84DvsO1WWt8i7Hr47FLKi4ZbxN5R23dcIlsvjY+YqRuG?=
 =?us-ascii?Q?0psvztX5Wa574Zl4QPpMOa6cZOYISPISzWY3/Et1Hl4g0wbAh2oX37XVw6+N?=
 =?us-ascii?Q?u8QiqBhZEoc8TOnphYLTzoQpfwtQtVYQZZLSeEfbeYK4DkpKEZu/PS+evY30?=
 =?us-ascii?Q?AJsZXeBUCJxZsaYuaeJQoZIwFnKIi0aJvIR1aVrZCkODU8cqoZpMlTXUj+Ax?=
 =?us-ascii?Q?NfH1dei/KqLPcNQ8C8KdHD7DdEkiYajnn9YgMKkxjYN5s65xG1txi4mPhdI+?=
 =?us-ascii?Q?QbIDKwp0sYMjq6Shd0tBngYsKjSubDPzhT3b4Ki2pUQz2P0i7sN9qv4JnbAg?=
 =?us-ascii?Q?OMZ/KaTH2BIqz9/qNe7pnPaw48XQ8GApxM/QmXGVfJfQAM5TBqDzPpI0bSUj?=
 =?us-ascii?Q?1Ld+pTx1ydhDn2XWjtnvtF8m3pBa6slApbOE4CH813fCSOdKZPhHBu9LYEZV?=
 =?us-ascii?Q?husoNIn0MIurkkfgK8sIlQR8gaG9GVOC8ZGvf/KMlXBVNKtmKEDTd7Vgyuwj?=
 =?us-ascii?Q?SLZT2weuFyrlS+UOE7+vNB9VF7RfUtbJ0DNX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q5tqsbi7LSXATSSR/80fz3Owoaa/HG6fdxOMn7zWkELq6m0Uk4BkfQCRPrp0?=
 =?us-ascii?Q?kWRjw76mFswLUSQFon0+9DwSfcvGuby+gjhXKK7Q5xhhYvod+NtituTZKId7?=
 =?us-ascii?Q?7ckBJRds/YYHV0EO2puZKAHWtV82dHHK2SeH7t3a1gSvq7D0lxFetnAymszp?=
 =?us-ascii?Q?vx+QSf3US3ydieeuOL7NblbaYTjP/tWfTAWi4/3M27M8bHJicco2iirCvzIe?=
 =?us-ascii?Q?KXKxpEwcgsROi1zT7Sd4TYnPMo49fayj6SlUnDmktg0EnnHvrP/rM9pMFS0o?=
 =?us-ascii?Q?n9/7LIHQSuaQPy/YN26/82l5ws8LgSLbpKCBNZMm+tG7IC0RhKAj+4Chin8p?=
 =?us-ascii?Q?YEPid5ATS7iHrbXJn9p/5H9pZN+BWrPhrRi0WrDn45gtTkj8VUQPUIeJrNRe?=
 =?us-ascii?Q?7jCNlTmi6Jq5d1vtqrLmolKEupd65vNT8VISyjbVYa2inorwNy/8asW84up6?=
 =?us-ascii?Q?g5YbKR99W9BNS88aObhYFhqKQI3AfdhMGely2BtqEK/v9Wh/pY+BcRBle+9V?=
 =?us-ascii?Q?hBooEmqYc6n7ku7I9DlGG92TBnOpyg/i3RmfDQ7Eyt5b6B3LLGTiVIidJj5A?=
 =?us-ascii?Q?B7/HtzzVtmWxin7QUp97JEns1yQ2OYcKfs7MF4RToxPFshKdSrfHbRMMFzxh?=
 =?us-ascii?Q?H4YVNjh+iFedNhOllVDyCyIWXsjbjZb1NcMU0dnIHY8qpVq4v7SoQBrvRF6s?=
 =?us-ascii?Q?cQZTdjAxi2C6Jccvl+Fe5S8TFuOzsMi7uckEWJkHO24ZbwxK2pSquXgM9j2x?=
 =?us-ascii?Q?T5wRk/zJDmdyloCStI4QGWeZ/eemyZTjXm20SDDS1sSwkrKoSiC82u1l9CdT?=
 =?us-ascii?Q?5+kwxgXWoCkRYvAD7dvVOvI5w3726HgN+DdgxVfod3rbLF7mCHppzbiJRifm?=
 =?us-ascii?Q?fE0FbcV7Ff4S3lGOWTXwo6tJjUR46ziTUQEzP+IbxGkWEexJUMCDE0yk0aKy?=
 =?us-ascii?Q?zquyQXYO+InR05SIW27v1yg+gyfSQeqzlH6wAXG0rOHhoHN9pOnjbCBc94CG?=
 =?us-ascii?Q?wP/TmfE9m/Jz8txQsKT6ETcPkQAdN5dpEflz9PhXH71yjWxhtXqPag8JUr0i?=
 =?us-ascii?Q?/XHVjxkD7z6tjKqXNdOa5MZcdwcAABiR4WKGxRXm71oRfeF0N4+XJLCa4F+B?=
 =?us-ascii?Q?WWt/SbRJDpgoziABqzI0iQ3eHevMezgnptMyD3WGh8cbgdOI4I8DEoDowCT1?=
 =?us-ascii?Q?ywEcZCnoekTCgAubJRIr8cv7MBkOK7GzK/GHqqSyJalT5Gyfz8Aog5LGMfw8?=
 =?us-ascii?Q?Lr3NnHmDLiFEA0Epkh90V6i1rp7ozQ4RkW2kgIti7A3lhtTRmmVvA9Bv0nGJ?=
 =?us-ascii?Q?Jsy1WIXuC0XRVpj9c/8COSt8guW/BPIZcLCBuwHWVp7zjOsTHXTlZf9mTayW?=
 =?us-ascii?Q?YIDqr1D5Om2vAt+PyrAl0m1UMa6spH+iNXrLl8qN6RRpsJFPBE600hE9Q9Ve?=
 =?us-ascii?Q?v7wz4XhxBXA35sa1/wpOSlENb3MCk4WOdt7TrzK7XHiXTcI4z38u8J4BEXQs?=
 =?us-ascii?Q?K9e2/M8N/YmlX633Wjm/U9rTPjHS+XTFKSfhl31izEG5CuUcvRf1qhKElDYr?=
 =?us-ascii?Q?TGlq5nHiqT5BpmZzsfv2Pcw6xDT7f6R2RdAHPWid?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c60caf92-a7d2-4688-0ceb-08de30daab62
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 13:10:52.2181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f14edbiarGT2CwER3ZBNT9n8vw7hA4Q1OnfFoDQv77KYtmGXCkpOTPWP29V5hmrhviLWQuh7s4fwSEhl1QTYGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5963
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwNyBTYWx0ZWRfX1iAi/fXIm1+L
 P4cP8ESs19gEF1FIztO2l7j29L2OdFdN8YAwwpt2uuipT3ExkiKxZmKf1bcnC4dGmd38WUqFVLR
 nWIN4WoX0PCUy/prVfGwvzYuJbObdLUT7HIBWNOAf3gshJ3p0DEBywbIbBKzCuBrp+EaMdqfClH
 Ud8FlaaSAc1MjNnT6PeiMb72BDyKraD+FHpBUiOsxf//CnQa+kcIqD033+H79wROO9PMY68IO4V
 u32m18bu8lqFA3UhcVakXpYmnAGv0dPb97AkLX/R4k7N4nVU18EVWnTehC6ujKi+GTxcYx92FBa
 ftW65uShEXijkonGjGBwG4cmzSAhbw/MwxTccLpd/T3CqFrzYy9LgsAztb4YFV+KU8VyXiB2EiX
 Gn1tsGQvDpUHLI/Rdv+U6SZ4NTwkag==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692d93e1 cx=c_pps
 a=7v6vjeP3yXOm/Y6ajRpg3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=QNgtZG6qR_OUgmem7-sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 5ZvbzPIPJJgtv_549YE12nrzAbUwd7ID
X-Proofpoint-GUID: 5ZvbzPIPJJgtv_549YE12nrzAbUwd7ID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010107
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 13:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122207

Fix the following error when using buildtools-extended:

va_server.c:20:10: fatal error: zlib.h: No such file or directory
   20 | #include <zlib.h>
      |          ^~~~~~~~

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-kernel/crash/crash_8.0.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.6.bb b/meta-oe/recipes-kernel/crash/crash_8.0.6.bb
index 1af90978e0..893d4de410 100644
--- a/meta-oe/recipes-kernel/crash/crash_8.0.6.bb
+++ b/meta-oe/recipes-kernel/crash/crash_8.0.6.bb
@@ -12,6 +12,8 @@ EXTRA_OEMAKE:class-cross = 'RPMPKG="${PV}" \
 EXTRA_OEMAKE:append:class-native = " LDFLAGS='${BUILD_LDFLAGS}'"
 EXTRA_OEMAKE:append:class-cross = " LDFLAGS='${BUILD_LDFLAGS}'"
 
+DEPENDS:append:class-cross = " zlib-native"
+
 do_install:class-target () {
     oe_runmake DESTDIR=${D} install
 }
-- 
2.34.1


