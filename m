Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9107C36011
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 09:28:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27660.1743326896207096234
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 02:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61843d4d18=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U9KTvg005812
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:15 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p63111wb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCZ4Ix990gZYYwBl76o5r9RLuskAQEU7gEVT1odQJlJGgEdVdtNn1mwm737y3zJpPFiXCTyji68gfUdF7U/Vs4Zqs34kH59YQGeJvnvxuaUzS5py6wrkXIAEze8c5G24FGCbbOe7PCiztuqZZ/kRnJQ6XPFHLojJCZdzcOpIzqVtLyEl3VTw6XYCGbyVqdR1GSd3RSF7X1e/t6Cmtx+8B//wmcj1g4VCGt/BQvF7NHXMlCZPWlZn6A3p3xgekkHulxMxtorFSR+Wbq3BUUc/ctj3SXEO/8DCr6bBlGMhJf0pq1WhfyjpjjRX9XQJ8fE5VICRtC8F/Hff40KUKrjgnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMuzDzx+H+xmtDWwTkbcpnarMda23R3k4Efxy9s3UkU=;
 b=Rag+vEiTB/G4E1LmY41sZjPWDE6JwLcuXaYGvoyZqefqHSTBHukV/aa8Z0gLopeyUk9HaE3q3O9cPzI/i5kmPcawbwS9LDCsr9LG+9rzFRsZuvBGxslu3JLit71Ls2AwvLFfIE8smCrN+fwplS7e8t621LmbFxiv9O4UeXGcJGUMy4NpUyh11iy0GjJzVMt4C5B4iSv+TXpXVibFcI/u3bOB8Jm3SGbC7r4RHDQXgHzm2KeQQJaXSAhig8z6CAX2Ap4ek4Av9x5YMZDxC5xpkzDIW7qO6LK7OwuIQNdnnG0FCqHlIk2M8BK3xqE+pyAxE6N8YK78SbeN7gOc5ZRI6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Sun, 30 Mar 2025 09:28:13 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.043; Sun, 30 Mar 2025
 09:28:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/7] debootstrap: upgrade 1.0.138 -> 1.0.140
Date: Sun, 30 Mar 2025 17:27:55 +0800
Message-Id: <20250330092800.1275186-2-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 509a7e05-3eac-4b0d-54b4-08dd6f6d315b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7rhwS5Z+Ird/o4fo0dEY73QxwvarSd9cIxPpMI6NhQEl2pVCuqdz8CIsM+4D?=
 =?us-ascii?Q?AIFMlitQ9PfWUk/JUOLJl4P6jIixheWzLNf9g6Y3YCZqvMJs1cX+d72Z8RaT?=
 =?us-ascii?Q?dlv3v1Mz2fVOlJiOuFwQ3J/j4t6h1P66MH9DcZN0KBVqgDzIMH6NsdNtEGXR?=
 =?us-ascii?Q?YL4sugda2fL/c6YVqYxH3Sy9IlMAKglfJwqtxYk9O/aUsavIR+pLVbTPBBpi?=
 =?us-ascii?Q?2YqVnfyBhyzOh81hE7CU1Xdqek5kkfdgBBY5gqGsZo4xbjeV8sOpmcIDQ4IA?=
 =?us-ascii?Q?P7ahdc8kQbUV2U0/WeRP0E+p8Lcls/sEyoMb4ePMnyKi6yRdrdlOuaUtibGs?=
 =?us-ascii?Q?E+Y5ls0j1paYcFz7SuZmjl9Lt2xBdJWnLmmPaU39f6/RqINps1YFTuDI1cu/?=
 =?us-ascii?Q?DFmUjx/5BZUM2ydFVwfYBFYQ2Rzib3n1fdz0+q4cmeZvFSXO6OiUAJE3HvM0?=
 =?us-ascii?Q?PtEsNMKXiDa6DKL7ZBMqq++Yma/3n4lNJZn2gDfWevL5cZr9ArYotkzi3V2J?=
 =?us-ascii?Q?Z61AVCvJ+TfiSRdL50Dc+Loq6Qzdc74Jyjx5JFN+Nt6oz4qXv/tvDPdHEjw3?=
 =?us-ascii?Q?qB/yM3dB86V1bwvbauebpKLhURAj1BxOIQCwsLs2nKgtg9hQQJwhhWmBvlnV?=
 =?us-ascii?Q?bJDAwgcN8CIH2TJl93n9mZlRXV/OPINCHVxLFLsC3UmtSCq/bONMzfcfsg90?=
 =?us-ascii?Q?AC7UPe7ecsW93FmIImGCsx9IRXbKtN5B5km++x8CbSY0dYm0UNB7fKi5FsNQ?=
 =?us-ascii?Q?np0yjQyYC9GWk+RfljfIhsRJeN3rsBluu6gzfurmAaIwkHoOcwonJTmrygoG?=
 =?us-ascii?Q?8oFTpO0LkIe99flx4LkZ7N1vm8uF4k6vc0ZtUqA5mwb6gkE7XByP6eDkt8hV?=
 =?us-ascii?Q?HeXqURgIEffmkxDccMcF6XYIWLXqjKGdKY5FveMeb66/WvdJOOeuTIaYOduH?=
 =?us-ascii?Q?q7rdMvb3YVCIkVlqCeiszSLhYViJKKk+uV0FeT/aEcaR3CVtrJrA6Jw63aee?=
 =?us-ascii?Q?RitIV1V2KsdNoxE6+TPTPq4cJyIanxkFwCP37q/LaX5rd0fjyRAbB8WU3Fr9?=
 =?us-ascii?Q?PsR3q6IuWV7bvhRE7QJ/As1F+DYr3/a374QGFPsBb5e2Q1fTldjHAQG/J208?=
 =?us-ascii?Q?9yE3Fn16UczV29fBA70QDx89YHRrEIphiNR2OHkwTbl0cKeqjiWoMG/946B4?=
 =?us-ascii?Q?e3pgPj/MLiun5aRtKl7re7fTHJ7t/eh+0kg6JH79smD/qELupEolxb9z1Yvi?=
 =?us-ascii?Q?e0Bt6SUzMTO8SPRRDNNbl1b/L1VBKWUi88RChr68WFedwQjngLfAor7/EeIE?=
 =?us-ascii?Q?jZTMtFUS1C0GRb5KUV7vFk3DxnYGz8xq6/+tPpYH5ayOM9+8SbYFypnXl8H+?=
 =?us-ascii?Q?Thzxc+wv0YbijuXkLAqpGZ45GxdbW1KDG1Ndb8oVeJL4/XVfmEGBGmf/7mLk?=
 =?us-ascii?Q?Vlf30WzPfAF+UdNrY1umSszSJ4izMq2fCqh7WFR4mK3yg8NQ7axI0aFhBnIO?=
 =?us-ascii?Q?8gtJepd1sKB5j2s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pFWMhCMJBQEjKJhUcedFq7QCjoWNSTHlOv2V78gAIpEnV2OM+5PgbXi7/YE7?=
 =?us-ascii?Q?27PbGJHxJut1h+FZXZzZ9c0DIyi2KLVe85Do+4ptFjMygCzKMRNhpW1sBBhw?=
 =?us-ascii?Q?GR3PhbwE30mvwCsUxU9ycuLMyv7HisF8czoFrW2zIvWYL1EeJdFjbK4N3g9L?=
 =?us-ascii?Q?SESD1fq7dgt979qCcvPklf7I2/32hmqGvksfaw2WOwDAqQodk4rpW3rxSFrp?=
 =?us-ascii?Q?JfW4x5WOpnwXJRmqS9dsHYLFbPBEbfo7z41/WJaBIWrQb1a81tzjCKRbDdHW?=
 =?us-ascii?Q?XmqpthgCweXkvfNZ8olHrE6PTJe1LA3jvIpi/EXRMiT59ghol7Y7HRdtTl+y?=
 =?us-ascii?Q?YPDVELJTULi1z9NQInM5vu9e+54zoYLJ2da6vK+4gFHhJldMf9NS+5bFcoDU?=
 =?us-ascii?Q?nKdKYZUe0QvcNYoOI9ng+zR0KIZxCy98+DXrd8I8Brdjzp6djDwmDiqRm5dv?=
 =?us-ascii?Q?YHkr+NmjqHSkaIZs/vt/0yE9kePB/YPG0FPOj1FgGSnm720zbkPl84pAqoXB?=
 =?us-ascii?Q?2XqbNYv7AdvHqCfvRKJ9vJjYHklkKlj17vKKchJE0Dr97KRmPGKhH7J2sp3U?=
 =?us-ascii?Q?/XY36kJFp/mTvdlI8U9soRIt9BBEMHDbFzpr6+dFejwkBnTw1Wr76rKmSDyr?=
 =?us-ascii?Q?TACJUJtkRvPcojq4wQoiAmvMWOkq4XPesJXtTRC4XU1cAnm+QwZclK4s5Wgq?=
 =?us-ascii?Q?3N7HU9H/ORzGWbtKu9DPm76Z7LVJ9ADhijOgTrfxqjTnIFXNVpjP5XwgUntX?=
 =?us-ascii?Q?Qyp3dmqFBirVhuRl/EHVrHus1+EH+8IemS/LfeNDQ51JdmPJWgZvepb5h7wE?=
 =?us-ascii?Q?KYXPx3ATgPr3QhpKZQAjVGzv4l4T6zYOxb4FiOI/eNoLclHJh3IEugbqTpX4?=
 =?us-ascii?Q?I8BhKN7iXuvO+T7KXMLeuqYy6ph8Qa8I0XSaw+3/aQ/C4BdVn7c1At2a2a0f?=
 =?us-ascii?Q?PjT/cKtHqYOlq6b9HP3jut6qb9tqyUddFM1poCStJz2D9AT25so/gE4HN0oC?=
 =?us-ascii?Q?U/KZsRVoJ2JX0xxHk2zADhFwtJ7v72dordsdH1xDvIoykhqd3lYbneDNTBvt?=
 =?us-ascii?Q?Ii7o2Dzy/3tpIa3dh9BtVozgOhn9NTOnJvUxjQEGfhP60OZ3/cF8wdH7KqpK?=
 =?us-ascii?Q?5KegQUybOy1DBjo/xNphKib9y3453yByG9fxUCGZk4md4SYSAS9ybCrabajx?=
 =?us-ascii?Q?DzaynJuguRNG9kVPsziGDzdJHFmo0n22+QPef+Pwq1Y7VuNSdxy22ytwTQES?=
 =?us-ascii?Q?McY75nTMaQhjIQTZrT/ZgAqiKS+8ScAIlwey1LV4+vXJLUPICBkjbmLanw1S?=
 =?us-ascii?Q?j0Vn3dgZm/wzDaU0ydq6d6dTA4niHAL9lL8mxQPgf2MpdyITIUdNhaNUWov7?=
 =?us-ascii?Q?UBVfuZPuum944B0LRqCrgAu8IuwspOk2k4wdDR0U/gyRhpy6GOOg5w/ecL1w?=
 =?us-ascii?Q?eWabnocPgWeLUcOfGvW95OLz58K3yIZHB+F7/Lfggc24lALQvSlDaAuxxuw5?=
 =?us-ascii?Q?hsuzihPZ0+w46btr20aTxJ0En7LOcT0atQTlv9XeCk0NMpzxFGlk0XYdHaD/?=
 =?us-ascii?Q?0cKV4aDYPsHc3bY7I5ewLygEx0pwEGwyGI4kCRzE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 509a7e05-3eac-4b0d-54b4-08dd6f6d315b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 09:28:13.0422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wf6QjWddHz1OUMqv800P6igrPLYE7QlQvwi9dqRM1nQqU5eMFR7KcEXh7dnIXh1f66zgLequoH/kSLUxEvPMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
X-Authority-Analysis: v=2.4 cv=C+npyRP+ c=1 sm=1 tr=0 ts=67e90eaf cx=c_pps a=tpf30LWoD3GURU9dwhXxZQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=oIbwYgn5RdCDlM_78-EA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Ut-iuCyOSHlsKp7Cv8ZigcdDLImiPjVZ
X-Proofpoint-GUID: Ut-iuCyOSHlsKp7Cv8ZigcdDLImiPjVZ
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116380

https://salsa.debian.org/installer-team/debootstrap/-/blob/1.0.140/debian/changelog

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{debootstrap_1.0.138.bb => debootstrap_1.0.140.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.138.bb => debootstrap_1.0.140.bb} (89%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.138.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.140.bb
similarity index 89%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.138.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.140.bb
index fb3ad7378f..468a6c13b6 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.138.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.140.bb
@@ -11,7 +11,7 @@ SRC_URI  = "\
     file://0003-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
-SRC_URI[sha256sum] = "e8e8b72388b6e5ced65d1b5e69ce0b9e13f4813da0c328a52add57ee5f79430a"
+SRC_URI[sha256sum] = "c95eb2aeb952b3fd09f4a07859115d40c4d04a8d551b3071b0a10fcd0db7ebc4"
 
 S = "${WORKDIR}/debootstrap"
 
-- 
2.34.1


