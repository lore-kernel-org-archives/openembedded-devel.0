Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB136C36013
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 09:28:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27663.1743326901353861177
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 02:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61843d4d18=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U9SJPm017185
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:20 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p63111wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGg7LeocnYOfh1o+JfcFqp6v/3AlJjuHiA42XUQqYIhnwbQXTi+eVHMt9kv209+0Am1UZQKCb6YJVQ2+B9XiLUZGE3E0mrH/fZ2j0iLSw4xuzcyJcDo2I6rCrqB4fUp5zEN1dtDNt2QwkvL6mTRabTyWF8jJ8E6STlRrRK087tO/Wr86hNM9GiyAgydi9fsqHz3aoZWRUWbKI16iyBmhr3xabCEdJ3mVuag+h60IAWw8StJ7LQY6ASihviySokJQfy/Uej1GS4KdHtgXnKEpfVDox7zoMpe0Nc1iUFWw3s2h0byEYkIXtP/ju3oS8Q8YqHJqH1ZM8ao7zhAnWU8Tog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3B5e7LwxipikUrknsMJSynEkBtlppmz56g5XdCgTMc=;
 b=Ih1Ro1PvI2lGCO05lT/bOqPcq907zTmfUF/3nS3ao8sv2iIvFysPI60UHKbGbLVnxnCWbLJNfPzMEmVAqdRRiblaoR8eq0KG1PjQR6yYn5v48yESf4rt6zGdpTuYAq0hPEzreEB3pNCAuDzdCJ4nkWWQc0THIRJt+TTiBSqlGs0KV4J1Ls39obVJElb7lhUsoq9dQ9KCju5MwykeAwun1ncpnZEAqWpmLZU2fHWk+vGGlLqJoGMZoJTrujFG8sVQdC6NjQvsuMCgUMsjSHGQWZPWYKuv2gtiG7o252Wi7TqThg+1ZIKO1nR0TrOUass3HC57RebDwngGV2aAyXR8yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Sun, 30 Mar 2025 09:28:19 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.043; Sun, 30 Mar 2025
 09:28:19 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 6/7] tbb: upgrade 2022.0.0 -> 2022.1.0
Date: Sun, 30 Mar 2025 17:27:59 +0800
Message-Id: <20250330092800.1275186-6-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250330092800.1275186-1-yi.zhao@windriver.com>
References: <20250330092800.1275186-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV8PR11MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: ad874f90-ca9d-489d-8024-08dd6f6d34e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ziVhjLv/8egwDQiA5BeAKovYOEwelvCuK9z2LCJ2W7LxMUTnVk2TBArwmsH1?=
 =?us-ascii?Q?tFSqTSqIzfJVBeWbnmStx3PdzBvIgux2/yJfgwuCIUK7mPlDXAKtWSMqnnLh?=
 =?us-ascii?Q?z+6hZgWjllwrm6UlJHVDPRUBFRv355hYPdNzTNnpc6n8jLl8MBV6PwDbQZkc?=
 =?us-ascii?Q?5Kzh7MfeASe4DG6VE5k/yT4RJUBj2a7hJOFov+KUWYqyT1P7J8C/6ilAS45G?=
 =?us-ascii?Q?nkqcDjl88EaTIsS1YsxpVXykmHfE9XKv8DfQDRON4zfGSkXuT487apPd65A5?=
 =?us-ascii?Q?VVAfB7FsyOLdoFEivtrLA1lL8s/jOwNiKI7hCfS/34ZD8Wy3RM6a6I/H3QLn?=
 =?us-ascii?Q?3+2hiovpvzfrQ1uEmjuoaa/rgNDL1/p2NTaRZnH5ZBYN3zERM7JDDR+Ih1w8?=
 =?us-ascii?Q?+EFv6uzkcjhPPzy/6BykSEzb1lV668N9j23jERsQFO9AkmXZ1bdFrl8uoXii?=
 =?us-ascii?Q?CtfhMlqHOwu5anrgmZGMKEtmNQJhK9FxO0lpA2opbioLEyJcsJJNA5rC3CDL?=
 =?us-ascii?Q?BU/ArmqOGaR/o9QRSbTw7kp6n8q5FS2gyvft9PJGY8mXmWQWeeMT0B9HSVPR?=
 =?us-ascii?Q?KOFqH6AKH0r6jAe/fB2nQZ0XAzo1I0GHebeKSfod7OrQpyjYoCQXL0Y114QX?=
 =?us-ascii?Q?Vf5EefXSOCEIAiBUTqLueBkjd9EIQoO94ilp8F0UXevwbHs4oxpDptt+91vB?=
 =?us-ascii?Q?tmZM/OTZwS65iQGXVQR3yq1SUWt/hJV+8YEXetsZjpvFR1hnwdSb09O6oY3O?=
 =?us-ascii?Q?g38ZsUUBQvdCFOY7EOUFIRKszYsiCQdD3IILK/3AquVu1enDqErzPtZADhny?=
 =?us-ascii?Q?AOeZ3GSwaFJKRE3VpZDOR5j7X/bgo1HFVdvz32UOYqGtWIgAA/77FeWYHscZ?=
 =?us-ascii?Q?pQDnbPLqarGHVvkB6N0vfyTnlF/7ssnUrd1HeUDZNBDW9KiwVfyXbOZM80de?=
 =?us-ascii?Q?sqwuckdSGGKcJaDXPPgiNdqWhTQRcUcJAW71AOHNedRbNnkRZDmvxh/xIXwS?=
 =?us-ascii?Q?xWLxIX1yBsPIIi+/fWSA7j30ZR9+vaGqIdpYuLswGwHCog0eCpENXvvQD+b6?=
 =?us-ascii?Q?MZkyuNptq+It0dBDq2ma+u8B6YEzVz75no28jQNZk+WxLff88RmI00gcxU9D?=
 =?us-ascii?Q?WtayUASDKeMYA6JW/VUdSw4jYyFNAdngvbiX2hH/Qwll9myPVjYEI6lHICIU?=
 =?us-ascii?Q?meLSrBfjYhtewUD/u2MTfb0SZtgf4hfkIUz9+8CZ2IbRGPPbpDgWujLDhhDy?=
 =?us-ascii?Q?LCEDuGVX8mcjmvZJ/Os1XMp+sv1rw+leUoQCXb7xqqWZEExkBvWhJqu9fcVR?=
 =?us-ascii?Q?GWv7uZP0RiiRfMe/0t8JokHc/mRCGAUyynAEq0iY7nvvVxlF4u/TRWODSu0F?=
 =?us-ascii?Q?cTT41n/lIh3ehD1m2RJfdofITCo75dDnjQrn4ozvC8TRSn/XLTTqrQqkBs5D?=
 =?us-ascii?Q?NL7F8yPMVP+DBOGztD9GwpykhAXF//O/IqFUpncxE38brIiBlv9OyWZB/dfB?=
 =?us-ascii?Q?tvqAqUp0QQRy9Cw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SXdR5kjdPFSvh4oqKa3r4C8VgDBlJ0swkMB0rsWlVch7OSAZ+6UEveNugi3o?=
 =?us-ascii?Q?rrE7Vapl4BcfskyYxzY2lzvtP9tuRCgrpWj92kPv4zva5NHsmsmxEg6Czuva?=
 =?us-ascii?Q?IHVNOP0NZo+jTrgrfSWFcPpYanF31eBfXLyXhlWAe99ClU9dceF3ZpNYfdSU?=
 =?us-ascii?Q?X8GXxQZ+mJM7Aey23ndulVr5W2VbSsOHC6lNOV2b51/V1Xw1lCDq9VxhBnvN?=
 =?us-ascii?Q?k/VKnTaIh2VVbrNTVV3mnHFcBp25bUgh1CgpXOSLhM2enKZLIw1BELPgAew5?=
 =?us-ascii?Q?N1CAD1mUFPZ13MOZedko6YveXTBV2BOtAzvH+aBLLPG3KZuLs3Pcoi86mJk9?=
 =?us-ascii?Q?2Q2x/edxNJ4tBIPRJFuIjHQ2wdJbF0mfj2AyEqNrW2xhUuNWuekwkD8rMf7l?=
 =?us-ascii?Q?ZGP0fRnaZHO63BThLB8liankwr2AURGsGyulGvXMD7qti+IVgP8gKbbhxEIu?=
 =?us-ascii?Q?rvcOUM2z1qPWA1fEqDr4C5XrgbJmjeFok9gnxa+O8zMxnwVYK9oD0mH/rTM7?=
 =?us-ascii?Q?lNDKo/Juo67fnQbTpWeP9X+IwFpI7LgUACrXQ4L3n4dS9OzdBvBVPaq7fqXX?=
 =?us-ascii?Q?NGndMRbHZlqUPjSFjdDYbcJwNVslEcRLuH8D6Cel/mf7LY0XQEkRGd8BirFW?=
 =?us-ascii?Q?SyDvc34e9u6lVUP7zeWdlcHpCebkRn3QvhkMSeMucgSOWKmgC0Fu4l7IRbA2?=
 =?us-ascii?Q?JwwzxIsVPCpb4/xaQrMDwDL8lwbTESIoJ/DcceW2A3zBqEadQvmWaI+Ih2Jt?=
 =?us-ascii?Q?4lg6xQo0tYNmWPaokhcMfgnFFrMyy/+jBStbmpBiBn0V284GmehvXllgUDiL?=
 =?us-ascii?Q?LR+KQwca/ZqoOyg0+eW03hQ6GpmdNGmECYUEyVnrC4ksU+FDU6jgkk4o2O5l?=
 =?us-ascii?Q?wmaoNzEttKadZDDgCI5Mq2atx/a5Dqpg7yEVzw1pRAlYqafn/jPXSb2mBlLD?=
 =?us-ascii?Q?FDxWB/FN7aj0GoC0QUz2w+mhPRksD8gqk94AfX8CCjtqSZmf0unFVsDE2ru4?=
 =?us-ascii?Q?U3yZhkCfU5qZtNTuwf7FbE34rQVvJny+WMK2RwySBGBGOB+0C2qOU336JKdh?=
 =?us-ascii?Q?TsRvbTx6wykGhsZV7CeAkH5JmBYb/NhVr8Cm5WNjnPC+H7Znlhb0gDUjtY+e?=
 =?us-ascii?Q?9dT3SrkW+NqhHg1YChp7geIo7IX9c5ZHYdV271XIOVCorB9xwFPKbqkIxBt9?=
 =?us-ascii?Q?qtIUWV6iIC0rki3Hxu2XAdxcNcXbWD08zO+AjhBXbENe0aayRRjPjbQ6iF6W?=
 =?us-ascii?Q?J5qkiL3wyKGt2y+wIl0UXVrPv6EZPWBN+Tsy62K5fobX8I9XmCc28cinPv2X?=
 =?us-ascii?Q?0pGboIxLOcYzFvxH6JpwPerER4KdcEEBriepUewMtaHUoRmxAlW+IhDFFiEz?=
 =?us-ascii?Q?T/+w669Yfq8AL7vqfNdOeI5+mgpg55q2vvatkCJBfjM9wTFDM24SjENPtPOg?=
 =?us-ascii?Q?xCa9Lv4knLzq4FqMgktYwkw2rCEriZsagdzfyq+eDOBM1LHC2j/qZsQguIE3?=
 =?us-ascii?Q?/yvSL+ZikQPMvGKM0a7Uv7dw9KTOqBm+h66JRImeEpdxX029Q7lOUwBEDHSd?=
 =?us-ascii?Q?Nyg1JZhQZN6PBCRdbduKRlWPQztQ3gc6MpzXMTFk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad874f90-ca9d-489d-8024-08dd6f6d34e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 09:28:18.9389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48z6gmTUoJgLG1xvd9NAoLfuQ0e4TQqlic24BFD04HtmmuUt4dU2mAz0Y3Xv+JDJYnOr8YmwKfsfqr1KMI17jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
X-Authority-Analysis: v=2.4 cv=C+npyRP+ c=1 sm=1 tr=0 ts=67e90eb4 cx=c_pps a=Bc47kgIQ+uE7vzpOcRUeGA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=4YaviVQjQK98gPme7g4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: AwWTD89nQR-F2ZGNCldLnQyvlq7vYj_N
X-Proofpoint-GUID: AwWTD89nQR-F2ZGNCldLnQyvlq7vYj_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503300065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116384

ChangeLog:
https://github.com/uxlfoundation/oneTBB/releases/tag/v2022.1.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-support/tbb/{tbb_2022.0.0.bb => tbb_2022.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tbb/{tbb_2022.0.0.bb => tbb_2022.1.0.bb} (98%)

diff --git a/meta-oe/recipes-support/tbb/tbb_2022.0.0.bb b/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
similarity index 98%
rename from meta-oe/recipes-support/tbb/tbb_2022.0.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
index 7442843f39..967ace9075 100644
--- a/meta-oe/recipes-support/tbb/tbb_2022.0.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
@@ -13,7 +13,7 @@ DEPENDS:append:class-target = " hwloc"
 PE = "1"
 
 BRANCH = "onetbb_2022"
-SRCREV = "0c0ff192a2304e114bc9e6557582dfba101360ff"
+SRCREV = "45587e94dfb6dfe00220c5f520020a5bc745e92f"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
           "
 
-- 
2.34.1


