Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB81EC41513
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 23:19:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3472.1715123937186931173
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 May 2024 16:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XIcD9E4M;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5857885c58=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447IQXbK018846
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 May 2024 23:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=SLYpBE52FulOCwGi9P
	YsL8ljK0Bgqkum7WGnK9uQ31M=; b=XIcD9E4MRNAn9JC+Ivmjpo8i2hztPxFwc1
	euIsVcO4f8naAYDKV1QmrfFcyQ3mGXIuyU02N79h1ADHPuO6EpVD8nC4X/uC6MnP
	Eeqg0p/FOW7kkObySG1H4Y5x4kbKgu3koJj+/vw3FXPGvGFXtJ/2S1exLYaeaFxu
	H6QwBmikYIDJfe3rooTKejSHEl+sNVDtRmesuHzDP8oI5fUlJgzvVhH3F60ZUmpu
	dUg0HrtvQdjZsM7GYSVi7hMk8HX4mmFbVQ2KXsch9DiEfQ1N31X22ikt+VTAt4U/
	QuVvmxa8OUSZIoOTElhj6EtzZYnuXxHwR0NlGy5PYyBEkyp3EWsQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xysjxr7au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 May 2024 23:18:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ema6gD6MSkG/tB7WT1zG4o++6Xkvdpat6G6W604mvDuvIcoDjVSt0jzldk8jbTp+bAiGkNdJYfnhC79SRq3lSDmI5/KY371rqQiMpnd06XKaN7fUlR/2zqSEHK1RTJqjZN5cmyTMgU2OSAWxf8atYaHg/6uzdN4lF4y2lBjchbTecfM4HWFzZhX/dJQ2UVPMT7GR5Z242nc1VUgNFS1SSKNZNR7KmCJuszDXOPrQH+jH7E9ArNTQcwBtQ4nJTZof4z/4+4D6RzCxnVEAlhpDQFjbmicn0ZKxdCJfo5i9V05dKnV64kD4uEJFeMHhyVTQfH4gSD66wUBiDwACOs5BTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLYpBE52FulOCwGi9PYsL8ljK0Bgqkum7WGnK9uQ31M=;
 b=CmmOugURYTHajkWh4tAp8A78KWJRlQap3GIWL/RC9mt441a/Pb1qfOcla4fmnngoaKNWNvYYtyxNFS1Hd5745NaZcn5xRzawq92bSqinOV8UeR53D9UOz7C3GUWSrnB2REnkAyETVoP4hrgw1Kc3eR0tRii04PQF9wE9ZjvwuViyRaGesGMon9T65b+B+udSBP7M45GiPmkSK6IcoIWQe8ZDejBvRLZkkmDeXIW+9kgZj4jqOlr3hqFjxlZalr73OR6XUJ7qTdRgVIpUGS8zFbsORhZDW4qmE6/bjRaGIzcjpHlnvJaSgQnaRi5swM9LdCK+BFAKeyQ+NKtDwfT6sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by SA1PR11MB6872.namprd11.prod.outlook.com (2603:10b6:806:2b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 23:18:54 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::4e72:f734:5886:b658]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::4e72:f734:5886:b658%6]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 23:18:54 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] libtevent: upgrade 0.16.0 -> 0.16.1
Date: Wed,  8 May 2024 07:18:40 +0800
Message-Id: <20240507231841.1323600-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0313.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::8) To SN7PR11MB7489.namprd11.prod.outlook.com
 (2603:10b6:806:342::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|SA1PR11MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 40106f27-69db-4a6b-9a83-08dc6eec0f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|52116005|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MdTZT6uuhG40yYPh0CuNZ3V+G0h0MYq9WWd09bs8fZvOMM6S8mvFQgCJsr6E?=
 =?us-ascii?Q?Sa8mEmrgpUrvYcsGrTstt8HUw1ZjqKT8teaG39gli2DW4qVB/RKdeZo5BBIV?=
 =?us-ascii?Q?7MWyYlRTfkBu8srNSoOmOjFe0I+poN0NRvC2QRO/zRcQnB9aSBSwI+kV/LsO?=
 =?us-ascii?Q?YucCsuvWnBsSRVW3dUjsC7Rwg5qOKjXfCErTCGHVMaOLBL1Tado5GSYRvUMz?=
 =?us-ascii?Q?lGDTXSh9M8rIHA6FTatZ7l10BKEMkR5UAdQheADWAT0ElTzrOLR9KRWTplbp?=
 =?us-ascii?Q?8X/pSU9Nx4AKsKJT9gLSEp3pogPCd81xWrpgpWJX3KLo958DMqDJ74N7T3zQ?=
 =?us-ascii?Q?Ye0AKxbiE3ns7qIWmCGlEXuZhNjH8J51yZDEMgkpythNFXRumHxu/TrAXBqb?=
 =?us-ascii?Q?QTLAS1YtcMZiUyraM6FZEXjzLl4DPNHBB41BpvwctCWPtUWTIgz3kzBzKt7X?=
 =?us-ascii?Q?Hf44rykmTueLky+7YMqmKIFOdHB+h5HJrckAfKu4Hw+hWorOuvy5M2C1Q5LR?=
 =?us-ascii?Q?FTL/3tc/+p4shsIWNAwajy40faMEKs2o7HImZuVEbE5qmwUXP1ioLzxYmn96?=
 =?us-ascii?Q?LIY4EA05O5A6PQOXr+tzH43TPByWu/4xPgGqhDoht5CD/ULLe0REJKePih3d?=
 =?us-ascii?Q?veejx2rS7cMQJ6Sxke/f22ZZ29+VtuLeDB8M804oNGKc8f+WxQxboMdCV7gY?=
 =?us-ascii?Q?SN0gOEoEHGcfsKhkOMz/hgsRei72vilVcxoswlrIrKiWyet5EX1ct6sfLF/Z?=
 =?us-ascii?Q?xhQ//AfCEeL3mNFWqZN8p6or+2uLd7tyS6Bw7h7p2CQ809S29aoujG6VA7+8?=
 =?us-ascii?Q?8q6Pn8DJcpvn2dDgMZrHXoDW30CqqPOHyNXtBUEy0Rpu7zQifxTyg5bxp7FT?=
 =?us-ascii?Q?dj0NuSbKillRVPAh/Kkyrni9qqszqEtjl9lHKMxMrOZ8kQEA26GIr8GHagvx?=
 =?us-ascii?Q?mWHx/Y+EyFMMWB9+VUiGwdCziP1a43wKVfvtu6XYy64PkSLfqZ4UaaPPWeME?=
 =?us-ascii?Q?4TESRui2kEFv3oSxsAwlgw1pK+s82tRP/NZ9o+XFdqvn6VmXKizHnaYtplF0?=
 =?us-ascii?Q?175tg0vspv1MRKp2NNLlXPih7QNtxo8gT8Jy0y7IfxdTs6ip3/Sp2UaqXHsL?=
 =?us-ascii?Q?EFsVOw8jAMPb5LsiVWagUXFSeZr3aQvoarybwgwNeIC89H/uovf8US+/EqRu?=
 =?us-ascii?Q?Nv03jg/hFw5AjG7Y+wQ+hXWNd0S2SXa3cC4cAkZGIeokK0yLxCVCjGPxACfy?=
 =?us-ascii?Q?wmYWemT2QhpHVticHOeacj36ZQcNJAV2mdGTeIFmVw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+iawcx+yC7zpupGkOCpj6eA/DRZbyDpg+7qfgWh/I2wezHsb4iO6cSUZwHP+?=
 =?us-ascii?Q?c+rwcjc/DOAY46xlV+bwVqx8GkCtv/vLjQEqI9VI7F55lFgsdqri4uTuYLRA?=
 =?us-ascii?Q?uNoPFYiEjN25QZLDiQm5Dk/vNs6e9pwIYmK4gjZMnt/7xcpnbX4mH54Usnh7?=
 =?us-ascii?Q?B0veeU62igkqaIUfjgC0qgCYRhI8sXCHax2qL5ho/bV4uDmnjdoeGf13muo4?=
 =?us-ascii?Q?cQ4gzMvNZQyKeKWpeLix6KMW2wh8SFGvwtRSeeF8lzOUgkWPLirwq7lruZD7?=
 =?us-ascii?Q?D65k5d2dfnxHYY/Wj2ZIvEwAaez8hOR7clorioWgak9r4VUUUmFiQ5U+Q4H8?=
 =?us-ascii?Q?uPKpZOBQYdwSr8qlV3cPeM/PhHeeIvj5jT4VGRrSsaFLAer3iyTdtE3g1YrI?=
 =?us-ascii?Q?tDegWrLZwAn1yj9faG7TNXCu8UV/2MYw5dpf1/KK7X4JxRXxoChr0cKyB3TZ?=
 =?us-ascii?Q?6BKei6ndPRb5fKxmlkuhEs/RkxjTk8wTmsupr5V92YAijqWnRMKzrftcxBPI?=
 =?us-ascii?Q?BKJc30ioaP1WuwyZyvfeNk+FQ+0717ch0411QZCsz84wsGRiYF4yWmDyMtlV?=
 =?us-ascii?Q?9C2C8Sf2O6mmaSAXIuDfeWBbiuKOPFFFOF40McRihI9D/qD/5hk64L/roEXk?=
 =?us-ascii?Q?aevTDeacWXq8nrkU32j3UGZ46zLvThtI5NtjekceTJw1gyUTzQg88vmLDqGb?=
 =?us-ascii?Q?R/t/5/gNJXLhtApETl1GAmCZDKMxckmssvdWZuu6qQqSmi+MQZcx51gz9aeB?=
 =?us-ascii?Q?huVbRNWh/frs1Gfml2M3tspdRJP3024GRDvC6sXAAHr4YCsCxxZbunUHAwnc?=
 =?us-ascii?Q?wHbGRW7qejBVY6lvabwPqYyRP6NAZT/4lyw6v1lGcwJxC7+XkeX763h+jW9h?=
 =?us-ascii?Q?WpuQRibZJuxd+4DSa4O2txwLArvx0sCeI1hDI/WiQmXCgngYNaypboLqv6r5?=
 =?us-ascii?Q?CcN/EmFzcpakoAkhKObFNKvgC1e4PaipGDebLu9x7xC8Dv88FZ37Q1I/LJ7s?=
 =?us-ascii?Q?6ftObOptxseHzFmTzvP/LVfGS15lnvdNWwr76ZHHEC0yAkGUdQBbF0x6+2WM?=
 =?us-ascii?Q?rox4/mTDMcX2nghb3DNNxsjlK4ZBjg8nrs0rPavyK6MeON6cQKO/0/7bcw0p?=
 =?us-ascii?Q?GqFMtCIjBGjLzWs6KXyW5996MxG9wXASFPOgs3rITNPEEZe+UChubMnFtM74?=
 =?us-ascii?Q?ePY9u2sFwzJdFJNLHyCSRzEScqEsjuziY0GlLODLZBkIUNQDgBdvmq2K6LEr?=
 =?us-ascii?Q?sSmwIJ+xd2Db249qsF4GEw6glgmgGzFF/Bk8O6lox+kUg+6teXNFWMp/62Kk?=
 =?us-ascii?Q?/KLGSrTGlW2uU4UU9Z+26GaSPqibc9b2guSQnH5YNLssfmklBG8b6rlJD7mZ?=
 =?us-ascii?Q?Ap/ANzu2lk7yjLEtnQe0J0qsjM7TiQE9JlV5EBt48TpRHskIYkyQn4vWVfeE?=
 =?us-ascii?Q?7yukUpDkTkbUZ915ngO2ZiqDcC2NHZ/tp88pVs14FAPNzzCVww4swDeFBN26?=
 =?us-ascii?Q?2E7RRifq23GIBbZNi0WO1TAHRyTWnXw27+WPHdHelT9Hb7McsmI0CeBObro0?=
 =?us-ascii?Q?gewIdIHzQWtI7Xt7e76KT0doLz94Lb/VytRnCYQW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40106f27-69db-4a6b-9a83-08dc6eec0f8a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7489.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 23:18:54.1415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwdPVk46vdG+4t257YTaoVbJwLjs3L71Jc/XyIqhEqrghM09vgo639O7uxgQ7jn55DafsiFyKsa2ofIf0yy7PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6872
X-Proofpoint-GUID: rbhZ3ObszMsYipB_5vIRplePOjua0roa
X-Proofpoint-ORIG-GUID: rbhZ3ObszMsYipB_5vIRplePOjua0roa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_15,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405070162
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 May 2024 23:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110270

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtevent/{libtevent_0.16.0.bb => libtevent_0.16.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.16.0.bb => libtevent_0.16.1.bb} (95%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb b/meta-networking/recipes-support/libtevent/libtevent_0.16.1.bb
similarity index 95%
rename from meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.16.1.bb
index ac80f3733..0a37d7977 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.16.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
 
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=47386b7c539bf2706b7ce52dc9341681"
 
-SRC_URI[sha256sum] = "1aa58f21017ed8c2f606ae84aa7e795b5439edd4dd5f68f1a388a7d6fb40f682"
+SRC_URI[sha256sum] = "362971e0f32dc1905f6fe4736319c4b8348c22dc85aa6c3f690a28efe548029e"
 
 inherit pkgconfig ptest waf-samba
 
-- 
2.25.1


