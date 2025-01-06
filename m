Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE3CE77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 08:22:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.55281.1736151734050412194
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 00:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3101692a3d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506610W4027302
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Jan 2025 00:22:13 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43y1569c1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 00:22:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9aBTCANImq9fCPDTfiU+hRhHMIXsLo6eB7bIFgOSBhnUN9XRfJ8+Y/GetKceAEsw3ZVrdfIg7chaUXft4OyAyQJDI0nYtChLLJdmmup62+W9ROqb8RFvRQ5LiXz133DP9x7+6dBj4f3V06rzMzIHOO+l2i1UUqb/ZNRL5M0Eee1WJ+MGJbMMUb/d0ZJ5Rj7P0WVEpP1NWMLpHmOs8DWCJztzPesau9f0lWS5NYsjOdaxbFAxB6nS1RKt62jpQesFaVF5RnCA1suD9Wa2MsjIglgLEn/mClaAj3h6+B8EgG2mYRU0zdGOubBurnPWRLtO3fVpr+R6Ko1trdZMgFAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/pi417ucVt5nwyrEhzQ03afKbo/RD0/i0ywSJIUZOc=;
 b=MgWeG52iUOpSb8oCfZ60IJ/ypdktDaL4I57/f9A06xSpYqpwBVBB8llb8KDFNbm4xV4PZhF8U6x8BsgqBeOz8ysEYpyMbWV+H/3Rgsu+uzUKSpsrFKxX8HQ6T+MPgkXTIyxLf/bIgr0ITn/5U9TjC4yl8fuPU0pBFDmgCsnb3cgNqQd0Ph3qqJCWBF8qEZ+BFyO9K2lZp2xSi74+nL8cZTNRx8IAnjfOcF3FCeoAILosqgsChpzpWP531+b1FGTdWgfi5Ka507hXvBJMAUnvOM2i/0yBCuJZjWHPn6ZTP6hRxpl9VbwzyQvGy2+G7LHXZPBv2KeI3Ghkc1ckpaKm8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB8061.namprd11.prod.outlook.com (2603:10b6:510:250::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 08:22:06 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 08:22:06 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/5] snapper: set pam module path to ${base_libdir}/security
Date: Mon,  6 Jan 2025 16:21:48 +0800
Message-Id: <20250106082152.882222-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:404:28::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 4330431c-7409-4bf8-672b-08dd2e2b34f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Rwy9VSlToNTDyjMFXodC5Vdf/8+MbiW1fqztgEejSxO+i02B6MRYS5OPYykH?=
 =?us-ascii?Q?598+nI2qbNs8vbuDAYGlSXhLIqtAeopVtr4OhkECgoFzgtZCySl+oK/lLi04?=
 =?us-ascii?Q?zWLQvhbbV8neA6A2moValjWmhyt0Ooi5vmIm+liXEbPIUE5UDTI0SfZLZD0X?=
 =?us-ascii?Q?G7c6SDi68lu4fg2Sf2cQU+whJtkMFcgT4lHr63oQZ1CVcBuC3O2yLzETgF4x?=
 =?us-ascii?Q?jKxbyaTgvMxrNnCI2mvU1U3yFZIqLU3sMa4P9UA/HU0+45GUZwEjZ2Qi9pS9?=
 =?us-ascii?Q?lsNW1vsjzRYdu/ojvSBr78c8W8JBy1y56hBYpUg5XxOv1Iqj1YtfkZTM7RP3?=
 =?us-ascii?Q?2XD5Ordv8i4IVS8Igk4g4nBrwHTomeZrwBfJ7HWo6/LrKCPBVGzk7SzqEYPd?=
 =?us-ascii?Q?6rE5eFNzLejios6McaInQ3fEOViG3NC5QjOdZMKv3xSJEFD/sW1g5IsvY17+?=
 =?us-ascii?Q?qQdYSi/5GKaDeAAOp76d9z5UswTBoZqT2KPIVGmDDBjbkytls8sM/+mMJopr?=
 =?us-ascii?Q?gP2bOZfA/nBd93QqwgyPmCCWGHY1nUw87Sgb+IoGjwXu2feR065ZEwkNcmnB?=
 =?us-ascii?Q?tzO7/HgDbNA0tfRe42BYPW9pBKhwRUSCKt4tstLz2HShspPs3L2Z+OAtTPwG?=
 =?us-ascii?Q?W5GTFavZRq4TZWtVtbJrINJigm3MpeXPFJOLDhUCIPkHLAnq1XKbksyjUlhG?=
 =?us-ascii?Q?ljXOtjVhR4pus3ksd8m18S6M8dUCCSdem5wKeSt7Z5160w1dJ2CT8gz8v8Vw?=
 =?us-ascii?Q?EgRcTrrkTBfhPRrBdJukjk2BlARo2X+C/L7Tca0dFgwhK/Pgintcsua5pkxU?=
 =?us-ascii?Q?EFxM7/nCvZfTG357/nvWR4hSUz654DpeScL51pmtjrxUmpRo7ilm9tg52FLd?=
 =?us-ascii?Q?EcWB9qPPI9sI876SQTK79A45afO1+mZeYGSPmbmIUR6Yb3ibmSET3D4uAmrl?=
 =?us-ascii?Q?Uw0EP2Waz0O5A/mu4xAffq0ZBP/QtxOndsKgWqLeomMzXjAUIqcTWaszzjK8?=
 =?us-ascii?Q?U/OENGn+GGc63NQOybdWtMWM9HlN6vfrrgTviHtDPERgWXW+gkPMmWwYKofk?=
 =?us-ascii?Q?ekN4bbSb55YcUhAq2wgJnCpcznoswTsZv414XVzOSUnHiGxViwkmlqVxXB4K?=
 =?us-ascii?Q?VEFSt+uPl6R+Rah3t+i4p2UePtn8Qz/9raXISD6Z04n5BAtOMvBPFnKniynm?=
 =?us-ascii?Q?oSQ7lcrFIBwaHo4npnxXYuVZaqIzBJjzob09d+MA/S4drsYw9Qb+Zo/PBkar?=
 =?us-ascii?Q?7VMXVq3IQbopGoCzgwjwjyOA2LKCYb+f8AueG2aEWXrbG1p5woDUk+A6cpio?=
 =?us-ascii?Q?4Rn8bpjnkilBbOLWP0IFNLxWDaPuYskXca4Boob76KI7iCsmPS+vWKL3Rmi8?=
 =?us-ascii?Q?FnKDjQ3TI8rlSnS9O70XZyEsus8ymibUrIkgSZGEs8viPDvxJu5cdVbH6cXA?=
 =?us-ascii?Q?RYvYHWaBd+1+Zkct8JMCQcU2ns3CGD9g?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T3DDNrMOrqZe6U9IwZetoqjYvLqYSWRGAFmG3yT2YXd7gawSg1y3Gqgs1JKD?=
 =?us-ascii?Q?sGBd6zkC7x+xl0EEsZEbifhOUtssxQRu65izCCDLHLyi59EBa8LDcc8Jz9Vn?=
 =?us-ascii?Q?V0biMlJfa9Tupkb9FyvqArTjcFZ1eddYO6VU1/Hv+oTpYl/vskFQbftdJKTG?=
 =?us-ascii?Q?WMLEozsbi7lThgvgpN9rkD0YiiSn2cininPcsInVT/JI2TgR121XXwuoLJuM?=
 =?us-ascii?Q?kJXHfdJ5adyChz4dBzlGvK+BE2pK0GdbstzWbJuLA/8/p3FVz6JwTEQQYLst?=
 =?us-ascii?Q?y4X8tADAgCGxgr/HAGj8QVqwl1pzt7fSGhkNM1iaAT1AmwoccE9HrgEOt2b0?=
 =?us-ascii?Q?r8RC6sNj7oL2RnKfI/LHwJHmLtTtOxX57SapwwrkP7sxd0M6Pm4OBca8s9e0?=
 =?us-ascii?Q?tL8rAelXkca3RkEdgXz4JQ//tVXFnoiXIMbsVCw2x0y0ouQht39PVIizZ7aY?=
 =?us-ascii?Q?T8OeUbYC3cy+BxGaj42NzZukCMyFl5aByZgLLFEFiqCNcMANo98QvZSftQfn?=
 =?us-ascii?Q?isxRCVSmKD3+fwauw6T6V8TAVOmmf3Wx/WEMxO03rMbh3+yteiIAyCtR4r7/?=
 =?us-ascii?Q?u7d8I5rCgw8peTss1+++9SURPchbLit5P/bJsbiCuv2ybnaes1du1XTPgCMD?=
 =?us-ascii?Q?ONAeiv5/3Qbcl2VkmxMVXzSFsg25vXn3Nq4/8OKEigae5cnl+ZbAJwj1m2ff?=
 =?us-ascii?Q?Qq2MF04pxlmSlWAJ61KdQIELcR+5pPf8KLNgp2wwgtUUVC8iAfi3aijiy+U6?=
 =?us-ascii?Q?VNcu0v8KNzHQsncTWmMfLOJXYIZhcjv07sgAhqV2tP8ailurVN17et/6wZn8?=
 =?us-ascii?Q?DjqS53cCNO+yG2Tb5PHrkyMBgRfeRsoYYKy6pFEVbJHHBMFgHivZLv9yTWJa?=
 =?us-ascii?Q?qHyukPaPshEsmOTF3iIz+JeF7Pc7nKz9ClPl/BFA8zJB/KPe3so8Uzt+86ON?=
 =?us-ascii?Q?zf0X2hsomzJ6uPDRJxDiwaZ5hFjemTvVlHzjJyONI+gs/8YP7kFCO11l3uyp?=
 =?us-ascii?Q?YC0dYCaisHoLypW2S2IKxCrCQeUZzKGSLeskAhHPatZw2P6K86z6ss8FXrjE?=
 =?us-ascii?Q?vv96XJmgQdWxH3dexqPWDcDhF/0DlwvjK2qT1ld5qIta6AWuRYnts5yVgEqo?=
 =?us-ascii?Q?aY8EsDbf1Z1irt+xUTtBD/7r/o55zoxLatKas9swVkp8VCvgpjUrIMjWTZ4m?=
 =?us-ascii?Q?vuNMHeiyEqb/xyQC8nhxv/4q2zkHiipIQaumraAMI3t3ZTT5jxXsSelI4m7a?=
 =?us-ascii?Q?GIbvH0todeJNuGS+pLdfxp3rq2XoMbNO4VIJs5PaEr5eTusVRI4GmLLzncmV?=
 =?us-ascii?Q?kMltHte/8vJy2zuGBZFRTE3Pznd5x//KJDsobo3gx5mrX/KXQcHBEUQoMz7D?=
 =?us-ascii?Q?C+Mv8JYgAarDVbsQjvHelGNxxPQVLJTZj9F3rtcvCKIq73moZQGU51OYOqXL?=
 =?us-ascii?Q?ZMfisvGB2EXp7ve39P98guRa5BpFroUIz2gbsW7hf4cG6vmuZr+CB0j/JFu3?=
 =?us-ascii?Q?oYsf76yoxnuYMh9oAXN6mnJmVeWg9K6eF/wWicRQybdYAaGqbCtTZo/xA35K?=
 =?us-ascii?Q?9jrEClLltMcukZLja0O/s0tkWjSoDAbHaklud15E?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4330431c-7409-4bf8-672b-08dd2e2b34f2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 08:22:06.4974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TK5+2XZ+gmAXgYdT9SPrNqJpXrxnaUYNzJF2+6nfqXjrxcxL07wKI4/PBmwYE6QM2js2QvKUYuoLS2cSRkuhjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
X-Authority-Analysis: v=2.4 cv=PMT1+eqC c=1 sm=1 tr=0 ts=677b92b5 cx=c_pps a=qvBKVd3KFl3zkoLf5jvq7Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=5MfkVURHyiprzMFJ_20A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4nOq8_E2ErV1924HaM_GnC4ZLKh4aY42
X-Proofpoint-ORIG-GUID: 4nOq8_E2ErV1924HaM_GnC4ZLKh4aY42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=891 suspectscore=0 clxscore=1015
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501060073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 08:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114655

Set pam module path to ${base_libdir}/security as this is the default
path in libpam.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/snapper/snapper_0.11.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
index 28fa104af0..74181ad6ae 100644
--- a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
+++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
@@ -17,10 +17,10 @@ SRCREV = "6c603565f36e9996d85045c8012cd04aba5f3708"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF += "--disable-zypp --with-pam-security=${libdir}/security"
+EXTRA_OECONF += "--disable-zypp"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'api-documentation systemd pam', d)}"
-PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
+PACKAGECONFIG[pam] = "--enable-pam --with-pam-security=${base_libdir}/security, --disable-pam,libpam"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd"
 PACKAGECONFIG[api-documentation] = "--enable-doc,--disable-doc,libxslt-native docbook-xsl-stylesheets-native"
 
@@ -35,7 +35,7 @@ do_install:append() {
 	install -m0644 ${S}/data/default-config ${D}${sysconfdir}/sysconfig/snapper
 }
 
-FILES:${PN} += "${libdir}/security ${nonarch_libdir} ${systemd_system_unitdir} ${datadir}"
+FILES:${PN} += "${base_libdir}/security ${nonarch_libdir} ${systemd_system_unitdir} ${datadir}"
 
 # bash is needed for the testsuite
 RDEPENDS:${PN} = "bash diffutils util-linux util-linux-mount"
-- 
2.25.1


