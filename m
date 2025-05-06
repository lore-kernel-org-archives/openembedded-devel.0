Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA89C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 09:59:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.72274.1746525589588506237
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 May 2025 02:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=72213dbfef=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54660iXt031293
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 May 2025 02:59:49 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2048.outbound.protection.outlook.com [104.47.73.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee3au03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 02:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vb5FjSBBkbQlQUmRc5BGyHYS2QQ+JD2qdIalQbDbBszf3QjemzZ3UtYzOghiaQ7p08OgVk1mTL1B8GOylAB9MjGNLs0oh6xPAl0pyhGgeBoj//TeBruGPNJH3jtzw0TrBEMy05lVcPwZfWVR8pLq9cTDVCTXlWM2oqlyR3wwsujZ+MAtzVc5sVJoxJkWI3GzDKPcKZJblDR1oIuMiK7nDo4tbW1Lo2CmKbehOt/s/mYeCmSZHi7tGxSKJlSNtUtHyG9o1Dd9qAMw9M8EYV12w9zdW+ZPh2qDAiYfPaF0rEXYnR8xS0MucP9CDSoWk50OlbSDH55F5Sqzenbn3jMRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbTfqOdCcPm6mTWl4wfcNk7KjXHbdGCTRQb8T5Zj16M=;
 b=os8HwWvjuu+rLDfWhk+WchIVWL6K5jVJU5oQHbtRFUvkoK+scTNqByZYdVz8eqodizneTvwze/Rh5ZQPaHsTsMm6ehnE4vaejs6khKw3v6ig2obYJpv8M6OO2FYIKrvtb5yBufy0k7ZoSRBffpHmKY8RFKwoSyMZlY/NP99SDKivXl142czIOYLKMccSzodVyVwiOTXw9ppiU25OxW8bQX2CqVxOY+heo79AHK4BDalFV4tbXhX3NZuh7oQ+t2jJ93d35TDIQafnsSWyCwj2WDiUgd+uMJnFuZYzIUQeecSdzh8zV11EIIV9t7tdEC7z8dRzSZOV77adyA8DVd0cyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Tue, 6 May
 2025 09:59:45 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 09:59:45 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH] xfce4-notes-plugin: upgrade to 1.11.2
Date: Tue,  6 May 2025 02:59:33 -0700
Message-ID: <20250506095933.3573793-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0017.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::30) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa43d97-bca1-4be4-26d3-08dd8c84ba94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1ozAmg/VayK8jBgzaQmXt/vLlhVCMCb9fSIN4FcaqYrb65c+T0gh8V1j67RO?=
 =?us-ascii?Q?1TxNtBptIUyFCONkI+KCO/9ekHzfaRAmSIW1Xf82g7QqL9ZuqohOzFbmh2RF?=
 =?us-ascii?Q?aEDQnh2GBt647JcOsFYWuc59x1PsEGtIRxJvJNFZsIWm+SqTFxf1mQVrG6B+?=
 =?us-ascii?Q?Ar2ZVDGPKkYo1YoGcU27EEzdNFNBGa1kY2HgHb4q1A+l7Xf6iIjJc8q8wK9G?=
 =?us-ascii?Q?mKDqUak+/kRSC78OKIR2kWYklCsavzyGcG+s2m2Bm5sJeFYFJbaUKSHZRN97?=
 =?us-ascii?Q?BexWeXHgn4eDdkUAnb6dlku/HXMTqbMZ/IWVseNH2AAppzA04u+E83wuPwnw?=
 =?us-ascii?Q?V2ttNxBLwTuVMA0Obs3mn0yZ/FWSUTOq9L5vw7wawMVpFIV2zzRgghsGhByL?=
 =?us-ascii?Q?9lRH2qXJJC5t+w0jo1AvIyPaOAZL4XiV0/wkH/uY2lz4G71r8ROEFPeevqqV?=
 =?us-ascii?Q?f4v99UBZkJLfpL32g4TdH6FbEABHroBoIp/YSVaV0syxNHr0Uw6hKNzaJ0iv?=
 =?us-ascii?Q?yVnJlfuE/yEjc5c0uoo0rVLAfOOQ2jhX5YSS56aqIa11wr78LHG1vJktsNYp?=
 =?us-ascii?Q?MjEtz2IAHgclaEt4/bbtXytOMxLNr8e6RY2NRaccG6l/KyUG/j9GyH2jREoD?=
 =?us-ascii?Q?X/znFym68sXEoto8hlXEBPZFT+Td0phyALQtd5xGxeeRAZP9SiaG5LWCeP4C?=
 =?us-ascii?Q?mCYSzWnIXMSIXoFtCF2IbzOn6gj04AIe24rO9XXcgBr/yyr2D/iK8PCSYz4K?=
 =?us-ascii?Q?3tKeQPFHK20a9BmUiM+xg40tdD1yqXBotXk+cj/5EKuZj4kNw1tJvrO2DZUg?=
 =?us-ascii?Q?523DTQRnhTGtzOzQz9SPx6y3p2D3YGUUl9lkTX0365Sk5nCBH+8hDRuBF281?=
 =?us-ascii?Q?hALtzprDQh4N6+2za6xEX8oq1cTOucC1wG+Z6hBCuOIAOreL8atTBu/rghtY?=
 =?us-ascii?Q?aSUM0OHU6pBc2pxxKIQ9kulJQc14MSwVIJ2ixZqOyS8w7ZdMEHn4s71bvdIs?=
 =?us-ascii?Q?nkQmYrc/hAHo2/Eb+SPVGEUZ2alH7Ir9rXICiC8uaDVnc0NscIoIv0SH/ry7?=
 =?us-ascii?Q?E+jCfYXP3NUqSbBLNRC2E6x0QIoxKaDZPfTlP0PwPdZ4hhqs4r/jBtejZxnl?=
 =?us-ascii?Q?3+UB2fVX3eDAgvKqnYmVqpYHVlOKpp3u1EjFr4bo/RIy5xxmeJf2XPJll/zh?=
 =?us-ascii?Q?aKnjJO9aWE7+dizYHNPlp8T4jcLBugrCoyzvBSJPYv596t6x0FpuDFy6OPGA?=
 =?us-ascii?Q?DOS0iCA/PShOMywq6UDGQWj2Sr9dHqHR37mfTdwR4OhcGb3Gmu96GcaMNh77?=
 =?us-ascii?Q?sqH51IOQHl2Kj3wnco25OTwKn0cwaVDFo+tBnKI3709EwwZZW+4v/lZ1VnQa?=
 =?us-ascii?Q?yRyZksbfSQJXlszJpsYhuNzP4bbEjajTZpwk9kfg9DeZHOZ2TsImhoLAwXfa?=
 =?us-ascii?Q?MGgYvA2UM0aZzjLCLPEs9jO9pwjKJvN2xnatmRJ/0PeExWwjp6l34A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jwFClfZPzKHjkyQ+F/QYczhs/WnDtRwPO5EIMjwy2zoCOWFk0fmtiA0TdbfN?=
 =?us-ascii?Q?H2qzz8g5O/GslvPM12pkKToA9KxPvWPLltTz42c+mrUvm55CjaqpQhlmxCb2?=
 =?us-ascii?Q?nDTE2RfsohYcSg0j36D9MmR8Op2o1FZxSdFnvvEinKKLZQdC0lj6ipXTOwv5?=
 =?us-ascii?Q?aYRcmoHSc3ffw9goyaPao2Qw0YJRWkNLlTCUGhyJHkHD8fAywro7f46ULSS1?=
 =?us-ascii?Q?Yusyfzmkq1QE7JusMmCffxiVrU+hh2XJUnU/Osuy4l5ltqnNM03p3RoBWrmO?=
 =?us-ascii?Q?fShEUPACyF9OC9QJDdWySNgREnBLocA5fEZ7otVMLsn5Bpt7y4oUCakSf+NR?=
 =?us-ascii?Q?iqZ2Qs/YyRxL/nmmqVmcanH9AsL0bjnot9ESLuyElWSnQW2sGH03whw/Zhee?=
 =?us-ascii?Q?IDFRy7Ip48nKOyKgCH6A0Ci1R76sPQjTS2FzpD+0vXNil0kdpv5TJTERLRGR?=
 =?us-ascii?Q?7a2/Gjcfmp0JUL3/PUuozsLuIUuoZaSAawo5i+2+P4gTb8fo4RmmagxG3SSh?=
 =?us-ascii?Q?jdjyOS01NmoqR9vgNGxJr2NtiZam9ff5akIz8eDvnxGYHlLY5nbQU6/vGb2W?=
 =?us-ascii?Q?08LhQOwZvbRcEW6Pa8CfBiruoNn9mmEsgsHjrMYMWLzMwGVqRrslV2b7pWjR?=
 =?us-ascii?Q?Y7HX58KcIr2DtBKxumDrtxUKxtLTfIG7BsJp2qwiVI4YiCfMMpfqbHRni25f?=
 =?us-ascii?Q?g2xSQ56CJwmT9rb3G1SqSOgxLUFTXDIdvaFFENalL71giFMTim+rFD34Cq+I?=
 =?us-ascii?Q?ZgPGqvh1B1Hqt1JMXv3wk7ydoQl8gu2dJ5pzWWxUWFu0Xt3tfHUAluzsjaYE?=
 =?us-ascii?Q?Pv1COyNxiO8j1WgfqJR+IuBc/FdMwVRHE9yjcCnM8971imYYS4lHjGwecD/U?=
 =?us-ascii?Q?CvfWao9s8bXzHu9t2trJvx7lKTiTqGQ8OnsGUmQKLomTw2bXpOw+MbcxjO2N?=
 =?us-ascii?Q?oiilDvPeq7aV1KHj4iyRiwZ0Abm9ovmS/ZXnPsZix72b6dyeU/ktZXT+DDjC?=
 =?us-ascii?Q?X24UHDpcPVAr2m1oz+23h8vutUQVoyRTA9jR7cDYGKC5pCCM12+3Skf+NkGJ?=
 =?us-ascii?Q?ILCr2ysGcG4DTNiURUSsAILR7SZndvcn8hNzhIjLux/ECuASUWbWMEU2sJOE?=
 =?us-ascii?Q?xEogLmirTbO0WyBiuTONZXQXQVe/tjuMIhb7G6xqH3TsI8LHLz/peh+AMmg8?=
 =?us-ascii?Q?wnwyfrdHvEdmwt96tlJzlfAS4US0TDFEutxSS9AgUz2vAYdf1BH/AF9W20Eq?=
 =?us-ascii?Q?bQhPdWthZ4UIzzBkhvIwAUMQzjjELOGMVN/Q4+zt11D8InYidVkuXfxgP3J1?=
 =?us-ascii?Q?DY4xg+JNUrprtApd/Xvjp/mgGwHhh8GC8gXGg3/Ev6LnrRDtrJqeHlyFnKuK?=
 =?us-ascii?Q?5S/zRlhIWL2xIDlLmioQZZcR9Fh2YNG14uTEZyLEbbVups4hXKmmpwPWZZT3?=
 =?us-ascii?Q?ZMczaZAdTLVUjgNSaSXHsVrmpov5DjVwQXSfgywLSkFbcBHN7w7LaATi1Uin?=
 =?us-ascii?Q?XDtJVhucvbWs2gXLN3AmJBEXAwdY1V7Yx1Q4T+iOwOxrpJ2r0Cr/Hv4ye1I0?=
 =?us-ascii?Q?TmGT+kBeVt6UcnuGUH/GZ+Jh5WMdkKu8KfWfqb8Ot2t+SdTlnvUBF1Ieqshg?=
 =?us-ascii?Q?7Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa43d97-bca1-4be4-26d3-08dd8c84ba94
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:59:45.1597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHKTJWZMw3OId5krfca+YOa20gsU4t1foltr2raGRZ8Pi4LkNCHq8UcWb7j2TU0debidyxo2naVOBAZ7S1TJJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
X-Proofpoint-ORIG-GUID: dRh0yGR_sDQhVh2rSbzUl1Hi4M9Pps8O
X-Authority-Analysis: v=2.4 cv=Pd3/hjhd c=1 sm=1 tr=0 ts=6819dd95 cx=c_pps a=MHkl0I0wjNeC5ak5fNlPUA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=t7CeM3EgAAAA:8 a=4ugsQlFF0or95cnXy9kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: dRh0yGR_sDQhVh2rSbzUl1Hi4M9Pps8O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA5NSBTYWx0ZWRfX8Nn1UswgHI6Q FxEKfJD8AG64W9XyFDSffwVGJ5OL4mMFAcAtK9EL9G8mGVk2jwasnFHm4BOGsQttTtpeSdo/wfU W2vhtr1LhZe7Ytv821FTNzN+v+Ab6HVG1ihrJBsCJl/wXMC9+bbfi9fPaEMnp2kcycbX2QbCR0T
 4mzwcl+DjqA6zqjK8Rb8C7GfD0FdvQpMd34Z3LJtuEVt8GTNA+rZ5xc+5SQJHuxzrLCLILET7MK T0SX9c7XRy2JwgmrIbzHg3/kpTTQqEgPU8IU78B7kfPzd8crfXPhR1eQTbLD9szNrWc2t5/6/Bl RCOipZOx3X41O/rfCZZR8DrRnQbQ1bzdvs62jkoY+QZjyVp+Hhh5uU+mqDCRRwGRaXm4zQtdS1G
 JaXw+Tr2Vs2qO8mJzlTn0GCac2K1Ox2x+2NNMM6coGT+4ru/Id1MU/gpg362UX1pXqP7tGVR
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_04,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 mlxlogscore=822 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505060095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 09:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117343

From: Chen Qi <Qi.Chen@windriver.com>

This upgrade fixes a build failure for the current 1.11.0 version.

  src/main-settings-dialog.c:175:12: error: too many arguments to function
  'notes_path_button_new'; expected 0, have 1

Note that an extra dependency is added to this new version: gtksourceview4.
It is exlicitly required in configure.ac.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...e4-notes-plugin_1.11.0.bb => xfce4-notes-plugin_1.11.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/notes/{xfce4-notes-plugin_1.11.0.bb => xfce4-notes-plugin_1.11.2.bb} (71%)

diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.11.0.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.11.2.bb
similarity index 71%
rename from meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.11.0.bb
rename to meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.11.2.bb
index 0262620e6c..0bdd2bb5f3 100644
--- a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.11.0.bb
+++ b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.11.2.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-DEPENDS += "gtk+3 libxfce4ui xfce4-panel xfconf"
+DEPENDS += "gtk+3 libxfce4ui xfce4-panel xfconf gtksourceview4"
 
 CFLAGS += "-Wno-error=incompatible-pointer-types"
-SRC_URI[sha256sum] = "eb38246deb0fc89535fa9ff9b953c762cece232b5585d8210fab9abbf282aae3"
+SRC_URI[sha256sum] = "8301fcd397bbc98a3def3d94f04de30cc128b4a35477024d2bcb2952a161a3b5"
 
 # Add /usr/share/xfce4/notes/gtk-3.0/gtk.css
 FILES:${PN} += "${datadir}/xfce4/notes"
-- 
2.48.1


