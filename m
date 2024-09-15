Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FF4C3ABB5
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 23:55:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.125480.1726444555058954172
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 16:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9988d41e42=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FNA7iN013823
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 16:55:54 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41n5s4h7pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 16:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2g+SK9jxYlLGaJywwRHGhHZJ2WwsuJfAcF4IHc7JgDUHDmTKVc7zDiaRvWACDVpLEpHFQMjUQuuDNxw8lBO/jVnzvFT0HALm1OAqoOX8Ji2HUdlSuowC4RlgAmNZFwXfeHyfBoSJqX1Bv1vWpBPAISe5sJgaWkiEr51y34ZHlVBYQNS6WAypDZyttkocFa7HU+IkIXbKabjGzodu1faas1XDt0gV8mfRC7ucvgJJUJCKydaIvPDm7CSw2znxUf523Cnsdq4jkeFjbR+9W5aucz/tgn58oHKfMYZDLvQK6tC0NZ0LoPnhEr0WHvh776dbCsM9HZKUpYaySz5d2TlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8R2o+I4OXNziVgyuYrGFTYdMuueb6feYtyEts4D9tU=;
 b=mQIzZsiCMGS+YUUGYR/bO765t3Wc8fK1KsIj4m56nQYwiSIm1sHJJ71C9lwpEKtjPuglytEGzkh5ZCMJvuUyRK0REj6+dcFLb+5ddwqaFE7NLDhlq98RDzGHxHRS3vOtRbtMviTv5lrVTS/0bDtIliJt26gr52q91x7FQVYszJi1Vju/ugtxYhWzP4ALfEvw+0Fd2tTLf2JGhnr9sNiVZyS1VslDgtCtjVG3YL5riHas0DJYJSxC+S/6xvJRUZ+rHIo/e243rpnnYNRaf/pkZsW0sggYjSPGKG55+mmi7SCc6kh9WnskDPCo60EX/nymsTUeNinxanpdNyP2yzur4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB6561.namprd11.prod.outlook.com (2603:10b6:510:1c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Sun, 15 Sep
 2024 23:55:51 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 23:55:51 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] open-vm-tools: upgrade 12.3.5 -> 12.4.5
Date: Mon, 16 Sep 2024 07:55:36 +0800
Message-Id: <20240915235536.3598141-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240915235536.3598141-1-yi.zhao@windriver.com>
References: <20240915235536.3598141-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0047.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::11) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e50ffb-d763-4b36-5acf-08dcd5e1ed90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?djiJRYNkQRS3BwRZ5J5MFMSDRMecw2FZSWs5hY+c70Wgon1Twtf1N/S5/HIq?=
 =?us-ascii?Q?drXCAQZ9Yfj7iFIaknn1C/wtZgxVxHXlzYHIDppMt8J8qCNPYUI/z1Q78L67?=
 =?us-ascii?Q?FtbIGf8bkqkYMFd/ceh0wc3UcifFuGw0rEK4M+VsWlNs3C5d0RazxHwplwi/?=
 =?us-ascii?Q?X4WOIkM8unRZFCZH+5kBsF/ZusMeW1w/qPvUHrSZ5pv2dxkn/Atdn88Mc9OS?=
 =?us-ascii?Q?4hVfXFp/2Cxo7WVy2EAOVmPsuANQa7TpAlgf/pbJ4U26KAbAqbyaNz29gghT?=
 =?us-ascii?Q?P4+EOmY57pOhD87MEZNu69o6XsBo0K4ZU6n/W2pQM0OigWoNJN2enNx5y4eX?=
 =?us-ascii?Q?R77UP4H+hidIUtIJmxG15ywUHKr23muq9pBBnr0hkanBG0ozmoG83B0zH4/Q?=
 =?us-ascii?Q?DiZO1RD0aVH5nSSzvNBJeS4nmnlPaFQOEb0PRppizjBVnstYhrK0EnmJti6y?=
 =?us-ascii?Q?uhbIgne9Z/d2fXSu5uaWsXkm8pG0LQ+A1g4juBXHopRtGi/Oh/EfE503jyoU?=
 =?us-ascii?Q?wQfQwEyxH3XyklKeqEn480u8zTBGszhDCeHtXqYG64iOQIc5sdWKVzasaCPU?=
 =?us-ascii?Q?oq86F4iOvvdTF7HtZxivYKFzwUQluFYjqtzJo1z6hZUG0ACncjQjRtzz3Rg7?=
 =?us-ascii?Q?rOoc2KHIJP+yxRoe6c1E1BaTJZ5WrfdNJ5R769eT3xyJNtB/OnKfTE3eBLwA?=
 =?us-ascii?Q?rVISfcSp0gRcBzzeqTlF8kdyyuM4gfAsPrchzfrme6WhM/h4YpTUuY156pJN?=
 =?us-ascii?Q?ePCywpZK4Kdc0ip1RuGmm4T82t652eh26bqt6OrTk1GMTWKz0+usUEm6UQu8?=
 =?us-ascii?Q?OQtGEUuNXs0tXQ8nnnHKH8m9ei4w3/zGlljtep4uiKGqHS1hDyi6sPmmtz0Z?=
 =?us-ascii?Q?mF8XtMWaiSPn2tXjofZEz5Xv6vX/OF2atYxCe4N4Y9TwNH0k9xF3/YXIMbtu?=
 =?us-ascii?Q?BG1kreuqScLIo1ZoR5g/WD2nTQvEzuhqXyICMeBdoxOlgQL6RWWRmgBftUO8?=
 =?us-ascii?Q?wSDEVlVFKxlMCjLZkJUdvxYFSKv/n07TRJq5FklWq+ByaCJpJWsFIutQamnK?=
 =?us-ascii?Q?degSAzIy1yG4224NFbRBXf4h20z1IYQzDdVAwDpBUXxh6i9g38QtB5xbVeis?=
 =?us-ascii?Q?iH7sq2sAEc9xx33AL+M0sFPMzxR9hfk6GG6koZsiAHgJunfbIdqhql7lLHRm?=
 =?us-ascii?Q?1BpwQJ2gXhFQMHZVTOXzLhw2aKF3BOtk6Qg7KR8PkKOWnZ8yQnO4/CrijytV?=
 =?us-ascii?Q?yLOuKWMWFI70csJt6i70IGqLx3WMz2KKFyEPDSI8xz0uRYHryOWuU4BIwmfX?=
 =?us-ascii?Q?zZroYFzNuyVCWeellI7nza9fgl2OsLypW59j1SfGSCmRd/YzMEyoNKOng+2a?=
 =?us-ascii?Q?nM3dQ3U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tMC0RuOclRBb1Fm2GFcbqt3TNYdd7U4/eZ4tvV3fIdXHw8ve7zMJzgUc0i1P?=
 =?us-ascii?Q?9Ci1I3DQuiSDzT24CDlcPa8ZoCpSQNgMosLw0LcJtv189C8u3kS0vYFBCzWs?=
 =?us-ascii?Q?IvgRj9vND5rjXELJdIBSR1QxYL13MymdJIimGibigjrFbhPGkEyk8CR4DAJC?=
 =?us-ascii?Q?/Uj8ReJYknLWpjJNo4q/nr/GZWwvUfAeVGp2qNl20uB8jl999CnyEb1GeOCD?=
 =?us-ascii?Q?Qb27iGfhhSjyWn9VZ5g40LqyOpIRUZKBqV/Sntkoh0mESpNWnLl4b4D2inZH?=
 =?us-ascii?Q?lWfUmCvtIL0P+tOoFjrbZfF2ZHzkh2U72xUOTESclB7wyBHFMQP2QBN3wGLv?=
 =?us-ascii?Q?MY5eDpw0sZBPULat7+5npLZSbrhLvvGpKN51GKYGIN4RHRKmsgvXXVt+C/h4?=
 =?us-ascii?Q?/tTJeqDi2L2wK5HT1YdtFwlH4ERyro/o7niZJaW8uc19sBV+gOdh3ao9Skrr?=
 =?us-ascii?Q?k3+yJdIX9vJQlHDLvN1v2Nqm2Ew0OwJFmeSL/FjNhhJoT0zXb2SCUb+e16mB?=
 =?us-ascii?Q?vqDKw6Bha0Sj4n9R9Y6NNYhVjyjfgqpb2xFXt/eUBh2bEW/i3/yH0Zz2y8t5?=
 =?us-ascii?Q?mxu9UZewDoph9jajHacFepcvCcJJd98JRehh3uxilIc0pEZdNX4iwtYx2yhK?=
 =?us-ascii?Q?yp6sqcRsLy/22zQzptH3CLu/Om5HD88G/r12/yncLUGu4GiV9ORpjUWBOKOo?=
 =?us-ascii?Q?I8hShE9PbTCxPo57B1ErICsusrxsrqlrCDVBsnFn+dbkZ35H10OBboSpHk2Z?=
 =?us-ascii?Q?K0hL/y39LSoM5gLm2vZBqPMMAYBZjbv1ZlSssnzeNvelAXpZFphkMb/YVxPp?=
 =?us-ascii?Q?6eKegso5j7UWkT4xgafMWupRvONlJvtG4jDxtVaGhCUPjGdW4+JWDQGdHwtS?=
 =?us-ascii?Q?lxcLgwJEWfXJsBZRTO1/fzcaOsBAk7LOVYTFBKDm3ZUgtpYE8UOCYcya3nBL?=
 =?us-ascii?Q?l9tbRp2KYVPVcRtTq2GFQ9tc475tpBm/5adzDuXaPk8HpkpfCjVCeMcFX/TL?=
 =?us-ascii?Q?bKokZRafphy6pwkB0jk94fXF8qkJThGOCF9pXvQ2P9iOjHZcSE2ekbbeFtfk?=
 =?us-ascii?Q?qOfqXB54lnhPdBur8JWK49cNF7YP9SSyukbmbgg2OhPZSsXin/1/GyIcnvW/?=
 =?us-ascii?Q?fgu0d0prmPU+rAC9LG9IaxncTEGh9evHcuXHxxDTG3IcZ7AYCDdFumqUysfk?=
 =?us-ascii?Q?RluTXEAJ0sSzEqRNjqlU36/H/H+Fkc8LaljFWilKM9UO7eWYBZsQTe/7nE6S?=
 =?us-ascii?Q?HPatXimbTZHbI8eoMglsc5oX+XFOgUUx3hUn42eaZuOCBIYDPxucI7SDGTZ2?=
 =?us-ascii?Q?1xK4hUeEDEELNA3LtyRKfj8U2lHTJ9DV7+gNv0gay5D1xF9HyWf02qVFxrFh?=
 =?us-ascii?Q?ljQQVY98aakORnlfL6eoGEbvjGRueT7E4RamRM5z/rv95aKV+rMmDkhiOBvz?=
 =?us-ascii?Q?9SvMKNNNydcCwTqJDlSWo43o735yZtL9aCI45kY5i0S+ldEHPQCzRKLN7IRR?=
 =?us-ascii?Q?AfyTOAYJ2E2r0i9K799EIEHb5jyPOUDexA2pbfTMmdlP16XZOKimZ95U0dKF?=
 =?us-ascii?Q?l4ARIu600pJoNOV84bm2AIZeHxv0p7nRF/AUvTEU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e50ffb-d763-4b36-5acf-08dcd5e1ed90
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2024 23:55:51.1743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6cENR+dGx0eNFlGe9eox3iMHf+jdI4zjV5k+k/lR6kU6EmXQQcq/rKjPFWAhaH/z0Hfg2y0GSsSEybU+y8n8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6561
X-Proofpoint-ORIG-GUID: jeJO9f8V6VvEN9xasxppox5Zf7PIp4pC
X-Proofpoint-GUID: jeJO9f8V6VvEN9xasxppox5Zf7PIp4pC
X-Authority-Analysis: v=2.4 cv=C8+7yhP+ c=1 sm=1 tr=0 ts=66e7740a cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=QkwpNzI-h1z5DNWiHBgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_15,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409150182
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 23:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112319

Release Notes:
https://github.com/vmware/open-vm-tools/blob/stable-12.4.0/ReleaseNotes.md
https://github.com/vmware/open-vm-tools/blob/stable-12.4.5/ReleaseNotes.md

ChangeLog:
https://github.com/vmware/open-vm-tools/blob/stable-12.4.0/open-vm-tools/ChangeLog
https://github.com/vmware/open-vm-tools/blob/stable-12.4.5/open-vm-tools/ChangeLog

Drop --without-xerces configuration option as it has been removed since
12.4.0.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{open-vm-tools_12.3.5.bb => open-vm-tools_12.4.5.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/open-vm-tools/{open-vm-tools_12.3.5.bb => open-vm-tools_12.4.5.bb} (97%)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.4.5.bb
similarity index 97%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.4.5.bb
index 7e3fe5601..217829193 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.4.5.bb
@@ -25,7 +25,7 @@ LICENSE:modules/freebsd/vmxnet = "GPL-2.0-only"
 LICENSE:modules/linux = "GPL-2.0-only"
 LICENSE:modules/solaris = "CDDL-1.0"
 
-SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stable-12.3.x \
+SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stable-12.4.x \
            file://tools.conf \
            file://vmtoolsd.service \
            file://vmtoolsd.init \
@@ -50,7 +50,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
 SRC_URI:append:libc-musl = " file://0001-Add-resolv_compat.h-for-musl-builds.patch;patchdir=.. \
 "
 
-SRCREV = "1b362b9eb449fb5de3809aaea4a636ece30ee5b7"
+SRCREV = "9b94132f54fbed0b86dce04ff4402d1d8fd059c3"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
@@ -64,7 +64,7 @@ inherit autotools pkgconfig systemd update-rc.d
 SYSTEMD_SERVICE:${PN} = "vmtoolsd.service"
 
 EXTRA_OECONF = "--without-icu --disable-multimon --disable-docs \
-         --disable-tests --without-gtkmm --without-xerces --without-pam \
+         --disable-tests --without-gtkmm --without-pam \
          --disable-vgauth --disable-deploypkg --disable-containerinfo \
          --without-root-privileges --without-kernel-modules --with-tirpc \
          --with-udev-rules-dir=${nonarch_base_libdir}/udev/rules.d"
-- 
2.25.1


