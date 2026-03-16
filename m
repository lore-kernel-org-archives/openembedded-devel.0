Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B16F013E0
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 08:39:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46389.1773650348508762129
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 01:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pZ30hiqv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=753566c020=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G4q6LF2243620
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=zJbw9oUoa0VNaZFoqXZ+
	bhg3Qdk7hTyHiouF5kcorto=; b=pZ30hiqv5et4bEoZwn9Qx8GTzFPN0MpF0zH5
	BDzYui+4zHtabCsEb3mrWjSOmxqBrLybZd3TAX0TuvOUps5ZYGUBGPAm3LBc0cLh
	0nyr0E+GBS9cEbYWpM4pRgQXafNwICDfIlgvWZ+tokQUu3+AGUkJIxIqw0iNRh0F
	GW2uCXmYM2OmIOtshIazOmvmuyY8vxiQ1Q8H6AAKKQ4CsJBaM97F8+DQbbK0Zr7r
	K6eqyIkiUFNgSdeNMCb9qOd9B4lBnoFHKcWM90hmAHfibjrKhqukmVpaHHe4Z6dc
	NQDPS8+gcLVVVlfK5fpdg/3ILFxMFEyXK9gIN3Ji2+xzAV+SNg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013050.outbound.protection.outlook.com [40.107.201.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvvvyhtf0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:39:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qotlbc4J4TfVlpoUxulWN87R4sUDzW9G0w6qjMGb8MC30kOx7UeXR9mcYb2dmYd/rA6ZDvwI6BKN4psWl5pfjAUDlb4XQZiQV1rvvcx6HGKH9R747lrvfr2yVOtIiTq+PEHJjFqfLSJeQ7Ild8V6zyb/f8/GeAqoQwfQDXHIXagAR8drkrxj4mZmy3aYyblHTRkHtn04klNby5pnZ+ImT7qTcqmTj/Pk7NGPB9+jgMNH8jivMjKN1Txm1Wzx+V2n3n2ENpxITKl+QqbSscq3+rfFhC6FQHNEyDfDkY264q1n0vYCqLL6AFzgBha9mUmQHOwkJSrqLJ02OH9f66aX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJbw9oUoa0VNaZFoqXZ+bhg3Qdk7hTyHiouF5kcorto=;
 b=GrG64WOKVr5j7H0/GdJ1AfFPtmCRFqx1/oKAbJ2yDPi7gofNLkYfHgJZw6kQskx8rNqrKU2SesySupgCpZUsFM87vG5k5YU4yzmSy0Dt5yXgsfrc8aLC8lYDyEyFwgBkCsqxELJUkN1Rj5yo42RrdfDZFgfwkktzobNA6lpKBzWtZLqz01urnEWpWuKpkUtcqtV2GmeXq1eKXIuKZe+/6j9iOpdNgNWZZ65UWeJrikE5J1nubHzduA8qZuOUtMu7RVOFcEqYUQ2KQPtUOPm0OQlfMKbPaWg+F8d6e008VaWNbXwbEbzSY0M62C5UxxgzgKVI6US2omA/3Mr2A7kuOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 08:39:04 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.013; Mon, 16 Mar 2026
 08:39:04 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] Luajit: Update to latest on v2.1 branch
Date: Mon, 16 Mar 2026 16:38:21 +0800
Message-Id: <20260316083826.1550599-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW4PR11MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: a58eac21-bb0c-4836-1ab3-08de83377ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	heZRHlbUFPsPf/7pQWQFfIiUM8TMrMXhSIp+TJ4UIrGhytNqIzoR+NUSWcDVRAzScmZyxdG4dhxRCSC1rRC0GenEjLhxK/HggMoAxfU5YxtkcnfofiGvUgavLMZThVJpBQWW1S5QxuLigBPMKiwT2EpXQXjobVvltlo2RCoibfilAm5RaO4HaH3Nb7QOJke9fyzHBvMANnInRULKqTLLqZFjlplAJNThgwaMCthD/WiWkI45A8jsTxluIeWjT4QHj+UJeFX7nYVX18sFRfvl/8AZAhstXy4qBsFV5uY3G/It5RTIDzSMHqfwsc4tqEIejIa4b4ARp7/hQHo8gvzgn9O+9JEkb6QGkp/k5xJ7fa5VC3B1PXOHbGg+fswzFLRsRBJZaFzeo+lgJTK/UAFNNoyBl+1fezhalnShvHBaGJ7bqZEfsRC3w0mPOkuplaOARalWtWGdnjkk74Ur7sypm/HQbKMb477AuqINqEQXQEfl+roDoyUX/iGWJNOX+yN5t8QwfT8o855HiNUOZpBVc+mFkgZZrIkccaFI29fGSI/ocLKW3XD1uFWtrTOdNsewrVWqshXx03C6/5tPNNN8DwMNuZTa2PNa7SnssP116QvmPviwjLIIQhJbylxuczV2SPC6qJWPwLIq+cSrCkGPouYdj4HZyGHtoSA+icN5VsiA9RUoq6L0iS/wJdefknWFG0VPMMwrUMoV06+tChgKGhZxnbvCYI2sLtzmjNQr5sQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GBprfarDh00ABDGC1+2OzZ8DW5hxUeBdHzkYuaYDG925qfOSjm+/oBpvd5II?=
 =?us-ascii?Q?pl6ayU54lkwv/hdPMWoKDcovnhmVc50Pcxlwv6M1/5etuVSu1hTXVKheTC8J?=
 =?us-ascii?Q?T0cmHQdNga3GDT5iPQA48DJ5Y3AHXdCzMzE+k7gbtsFPsI0wfsb3msTE0m+s?=
 =?us-ascii?Q?7sxiw1Q+DVTvNDWJR2IRaKPIvJxs4n7J4n3OPFLpQYATz/9CPLxlw+00oJcw?=
 =?us-ascii?Q?A2dOO1lBHNxmdVVumawA4hYJ0Xek3ymctQvCu7fdjaW78lBUIh+169I+4RLJ?=
 =?us-ascii?Q?CI7KxHNGRY2tOzhBvNuFXrGD0p2TKgvfeR93II5sZVsa1YlY5aQJMckqvTUt?=
 =?us-ascii?Q?enTEFtmxzGIAJh8uGDWhlTl8Ie91TjVbbFMP4rf3dNt/+RKeZorUWWR0rpw5?=
 =?us-ascii?Q?jObk7N4ccit3jTz/N1T9A+0XtRt4Ur9+pWRoczGhYjbNp8SpH0gqlqFWBD9d?=
 =?us-ascii?Q?W337ODnOu0I/c/oaaTBFkXCT0nHJJ7w5c7kX6Y+yHp/GdJ4v7qAWjx1gHcq8?=
 =?us-ascii?Q?WdOR2Y5/xMfIgNFC20LYpP1Td+wU8NvJl77UJkd3ZRMyF2cM6E6a8TsSO1BH?=
 =?us-ascii?Q?HonIONIr2A1iAy/+ThXe5fvc4u+ybZE5y+gqa8Iw5yxpXtzQwGmgF7rhp51k?=
 =?us-ascii?Q?s5sJc6HjM0UhKFBSeWHz5Jk0FClUwGv20MJ9tZBoN/TT504lLHnqxoWjS/2K?=
 =?us-ascii?Q?txc9XPWF/gThJZCgR2CBwtVhMwoZ4M5ADgLlcwU5JbNWAIpvN2u5gdm6SgLS?=
 =?us-ascii?Q?oAkT73Tf3/9nnmFKfr98zDluw2ISBzdtYV6rY5mlZ+sTUK61cQE8pzgf8QmG?=
 =?us-ascii?Q?rpevwvHYxaONPSi4om7yzexB1EPrcxe4lyHF5NKyUUud5Qi6aQ3LUMQ9MLtR?=
 =?us-ascii?Q?JW1g/ZZdgvc4nIxdnRKnbW39pWO/s7iOg1GGzQizUdp0MXH28QWKGJq7Iqnx?=
 =?us-ascii?Q?IjGxJVahu7SmXHabd5x4/iXlnQ56T3sboz1469WAh0iGkdQNitpkJsk4o4vk?=
 =?us-ascii?Q?MHQtenIdam0FU75FPlX/Mk55IlHoDPewChKtmSAsp84HJ3QF4IG8MQAnY5r2?=
 =?us-ascii?Q?wKG66tnGMCSQazzrPnSI6Lm3bHhwCe3I5uDcQbuEbSrMYrMP+xVdqsabgR85?=
 =?us-ascii?Q?VjF0qsAUvN1xCWrG07He6O6/DYiVFkBAjyoGQB1uBvfkcYHZ5jNN2PTPjKnM?=
 =?us-ascii?Q?b2OdPo9cyNbEtMNI660J7Fa4cwNSX1pze4vg6if8CbHp00jgVgSKEdnsQhUj?=
 =?us-ascii?Q?qOn+9rn6H2CuNiN+lKX212RJ9aalkcQd52bMKrJp9lbbwmZX5bLztvip6Ugr?=
 =?us-ascii?Q?FjRxuuVKkShQo3Oe1WS5DKCFF+y5o06DqMz7cAxhyyUTwoW+gwpk0Q/1DfHK?=
 =?us-ascii?Q?Bw3spb10aso9s67OYWiG2ZHQrYGr/3iZEePu/toVFLIZkjjgXNUixzpFWK4j?=
 =?us-ascii?Q?2RjbtHYJVNtnwhxEsZVjfuj0LNyTTEb89LM4BdG0MX79NKtEVDyA7bZhycGI?=
 =?us-ascii?Q?UXgNHoOAKAFr/JbwTWo9dF5BOtKDAl0wLtk6PEdDec7OBn70xbcam4J6VT/q?=
 =?us-ascii?Q?VgvjFhWFWHK21f6Gsw/PXL19bjOTLgU7EjeEHpCwsl7P+2qmilS5CgT92Hr1?=
 =?us-ascii?Q?5sHRJFbAbRGtQmLM+GMpmaxP/oFJfAzWnyZYG4ULicC/43MdFB2x6R+KnBPJ?=
 =?us-ascii?Q?3OWltVnLsLEu3CU24Fz8U1PJxDaRHdYIKOCcZaR45MW/yqCIT6Tp7uxktSCG?=
 =?us-ascii?Q?39oQi7vVTfpE98rIWi+4DxCNPjn4GUQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	XpgwVMTaWL7z1DGkfREupUjOkZvOvHMHMh/wiQngPFFU+0SRqDUzDsoMahcmub2M4C7ZwtynO0rNarakxkQo6ujkZZq1p4IO0OGRNzk0yJVK/9CWHDJYBaI8ssQkjR1UIDicpJET4Oa9sr33bBmmR32DTra4BowksBTAdehNs2S71xs2mPnDMDej1Y93GNaOPBUTBBfBHc56N/iw5gPDjN7H+tY84iYtrXv220a54HuxGRcR6P/Yk2k45oBs58EBXfIIDw9HgEmzX8W4pFnBQb11V+sVBVupG55D0IWPW47GDbFbTPTpQXQd+Lrw8buyQm2bby48B6oTPg635buOYQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a58eac21-bb0c-4836-1ab3-08de83377ac9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 08:39:04.3337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ax9zWRGSvdQWQA6Dqv76qdJbtYDZRKlFJC4li+vd75ky5zc+6NAr58rgNpVHqj2JoyZEDQ14lUq3AsoZ2vU0vzpKIGKzVbCmhGazfV4JOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7149
X-Authority-Analysis: v=2.4 cv=E4XAZKdl c=1 sm=1 tr=0 ts=69b7c1ab cx=c_pps
 a=/jEiNo7mPoItVXs2NspnyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=nm2HxRzrAAAA:8
 a=t7CeM3EgAAAA:8 a=d8tkO0nEpDZptwP4WmYA:9 a=xTkba3CB784Yst2QIEaM:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2NSBTYWx0ZWRfX4OjyYHoFxRDS
 aXKY6yw5H/emB50s/gxCkCpvgp1K58EMYNoBhTnUvmVi7hQkdIiMP8BYkc4D3XNJU+Yq0ZNx76M
 ctdX98zFoIpociDsO4e3mWxgRziWsC1phO+jY6QaioLX6m+nkSRpa/BTADxCxO3uxNi3Vfk+pwk
 ZNAlwHOrOtLVCQSUjW/t8c5KSFmdpUn4TNqtt5jDQLNnbWqikkWi+noUs0AXKtcKA61NuQEQDyT
 1KNPXk1y1rQG3dDoAZN6KOxWATQF+KFMBZWYBu19yxFgnyOaJmfxdHtlrnSZHSyNTFokYZgOlbW
 oa2Eud5CqgeNsInDSEcaGKJFBoz6CgNvLVN/7h1uhonOow5TGVm9BNtYd9pkJVBA0Hw8NtAEfQe
 UhA9aoyf9w2f1WlSCqAqGhh2nMGa1I80qk3vhoSPo5A43eOnWBLy2gZKfbsEMagRiC7ve1zqy5W
 gD6kZHHAv1XiI7bvlrw==
X-Proofpoint-GUID: zjIOh7pNbrXTLuVjZNLAVWQzaCT8OXf1
X-Proofpoint-ORIG-GUID: zjIOh7pNbrXTLuVjZNLAVWQzaCT8OXf1
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125258

License-Update: copyright year updated

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index 9df5fca0e6..0bb78e18ad 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Just-In-Time Compiler for Lua"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d421a5e2a24207f5e260537399a9a38b"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=a2c43bf4a9ea63755af2131b0ae59ff3"
 HOMEPAGE = "http://luajit.org"
 
 SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
@@ -9,7 +9,7 @@ SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
            "
 
 PV = "2.1"
-SRCREV = "538a82133ad6fddfd0ca64de167c4aca3bc1a2da"
+SRCREV = "659a61693aa3b87661864ad0f12eee14c865cd7f"
 
 
 inherit pkgconfig binconfig siteinfo
-- 
2.34.1


