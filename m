Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EF2D5E12B
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 03:52:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5364.1731037918547135602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Nov 2024 19:51:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1042324eef=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A83nEsG019497
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Nov 2024 03:51:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42s6g5g788-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 03:51:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLxcaQG8+bXaiuSwXqyw6FPugzlw7ZTHjoAkMq2n8lBSwlnArSMMbTN1D8+VWc2bMl6rFOQ4+BeXJFEqbiCSNJJjWXEQ3A7JdrXfzMuVnQv7qWD/AMkP95OQzoEJGA+68RlDr6oK/8xE1ad2ZAyF778Cq/IbrE1jq4o0tov8GvVfeAEI2j8Bp/qgzgCmL9PYUk4UADsC/30X/ecfCcoI2hdgsZjtal3+nyEK7GwbMw6vBVIYxPsm4+NRxkqQAbS8AEzzcn1eYHZ+8OkGDoL1YwPgnzuNP+piPsgW1F+tFsmkKZ1Q0Fk0uKbqjrs0ZOVdXF6c7qurKXaFLYAxqs6KLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leaMdqbLhFTvK0HuZromlKkNVwugIORaowROQgIuXjA=;
 b=mvwNyuNDWa3sit9nJCqkS8zp+O+7t68d88sksZ1W5DPpjuE2hgYq96q6ZJEdXmHzOAsOpBaq2sfJYH/pmDUZud58+T7l3olhMyXOC/83Ml7/jJ1ag+xllovD9ExbZqg6vi5RYdOUkvbOrgQ0ypGl9uWycZardEfsquiOU+VDBLVSJAZ0TmGuS/4e18aGow5X3ka6jT8gfpI+I6a6bCyf8sn0AOb1cNreji8CmgdJgAce05GKO6bRQQngH2krZAqT26daLR8LL0KS4nSAnZtPcx6Thjvn64JPwV2U2FyubIDGAyrTRjHYtrZ+IUI+rqGh6l2iCnXznZYKn0q+pUl/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB6918.namprd11.prod.outlook.com (2603:10b6:806:2bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 03:51:54 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 03:51:54 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH 2/4] sysprof: require opengl distro feature when gtk4 is dependend on
Date: Thu,  7 Nov 2024 19:51:41 -0800
Message-Id: <20241108035143.2214659-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241108035143.2214659-1-Qi.Chen@windriver.com>
References: <20241108035143.2214659-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:254::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: d412c9cd-eca8-4673-6931-08dcffa8af39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4gJtWBIVsravJxAc8UiIoYf7S+5aRX4dHs45yFiz5XDnA8XyVxQFfy/95I3s?=
 =?us-ascii?Q?atdBPww5I9ADYsK0sQBWjWM1K+5cTWia0ZO4lNDkKqj/p1TkLHxUy4dkMWQ9?=
 =?us-ascii?Q?M1VcfVAgvfb21FhVs4lDgtqYySyrupT4ozFBMS2fQtYaA1GY9OhOOr1Rw51F?=
 =?us-ascii?Q?5rQz2hm7YFHs8BVFcH0V8MgmF5GhEpwKu0uiOiWIKl9Xn+bXLlHnP/JQGd0c?=
 =?us-ascii?Q?uO457V5mOU2r7NsEEMulDz+FNNuF/Iz0nM/GEqJXZZu4AN8FyPTR+7eOgUaQ?=
 =?us-ascii?Q?YuEixJ4N0Sg3bFWTJBgMoAe19ZeBRYfFdM7VBTKb/ArbR5HUEYcT0PaRPd/6?=
 =?us-ascii?Q?EQtRAcF+ck0zSsdFV0jELVMpPuXnOhCSbty7ycPJKTyfBYMJ9Q6e7sz74Mm6?=
 =?us-ascii?Q?zoPhwqg9D7uq27/2QlC0a8hKs2i76rv1IpZ5X97mVbVBcYZ0ulxN/FJUxTYA?=
 =?us-ascii?Q?ZDOdGXlKuAvxV15v25+BuNU+jmikX+FrhLPykwUtzA58o/MZ0ff7/I3RU7RB?=
 =?us-ascii?Q?xs95+vj+bXZ1yoOsCWif4OLtvbjmILDsuCLQYD4WZ+ZjO2CLto5BNkheKUGB?=
 =?us-ascii?Q?nzHYGoQ4zTSeYjwFkyxeHRMyrIaTk/mE3zrv72nsTIB5qy23zzK6oZhvwbh2?=
 =?us-ascii?Q?Lq7AG1guhFj/M/gU0LTYnWU1b8gGXXjRPXvjWA69PXLTKb8pezFb7RJH5enU?=
 =?us-ascii?Q?4kQBq2S9MpY76+YwrMmnl8wNkNGsnNFjG8HqnM2x4F0K5hbvYw+mMkLRS42X?=
 =?us-ascii?Q?+ZInJPzcydjtALu+fH+NaA3c7fDjunVbOQ33Sg6G0kSTYa4Y3hhbf2df5dOz?=
 =?us-ascii?Q?dftSnyW+5OlMDMhCzJBcyIXcfhJKPi4ymu2HtS+L/odOxp3S2u97/nWtvlGx?=
 =?us-ascii?Q?RDv6JgJ15f+BLKtH0bLKvXo+tQwcM2HAt8N8HGTJko1RDcZFo/IFzMHwvwrh?=
 =?us-ascii?Q?HkO7klGbvffXSgA0MRRgdoQJTQ4/VcxIexORqwwOVFYcD2xr6NMmyitAZFXi?=
 =?us-ascii?Q?pDAQxt0Ax4Oykmx7/UbOBNwxZL5w95pjX8/nSaIkIXpid1bDUku73URu5Va0?=
 =?us-ascii?Q?daNTcYlUVGB4lEr26l8Lmvpm6nTp8KjK7S6ECsgeur2D5KRBuWUTTD+vJgbV?=
 =?us-ascii?Q?yxDxwQwO+JCDq99Lj0fh8vYCtVeLj7HD66kbQn3u+d6eFvD803UQI83N6Tfr?=
 =?us-ascii?Q?8RTzl3Wf9UmUaa16cj0Q2TjtLnp8bp2x+NZaSl6o3xku7n0ppD9Wi7Nr0iTw?=
 =?us-ascii?Q?A6L7qqXDzKmFrk3udRWQbRgKKYAmYHnv1CNLEWUA+gh++SbWIfji03gJ7TWQ?=
 =?us-ascii?Q?t7w34DI+3c2fdAjSlwautmJLn4lC3fOo3arCPN1n9ej19qTbqitDhn55UF12?=
 =?us-ascii?Q?ROYkN2Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0gB56kxugQckDEtlMV/lLUpq2fwZGGPvMEN+gwFMmVtvJLI/iYJHqweZ+gGj?=
 =?us-ascii?Q?hGwzu0/kVEY1LMH0Eh+yXQp1K2uJi3Du85wo5mZ3bLjph7T6X3slT88CQrOd?=
 =?us-ascii?Q?GqizAogWhWimPaSeB/yJ9myQdMON6CMQqfuhnUYubF7J396Mp1UQ0h4g5PVF?=
 =?us-ascii?Q?V0uVZZZB7urwc/yw4bQs74W8fPYILC/t1QifVVz3HSKDNJXbQCmmXGGk1H03?=
 =?us-ascii?Q?gWhREpGwvmWK3jUoJq3MfcdI54gqFsm0kfQZwButxL77MwYQ+ZRiAeFc0wa5?=
 =?us-ascii?Q?4IEiFXPA+Ik4hYTa1L8c0NOuQKMFzXCPSTUfU+/ExmS6nyHU+tUfxl6Gmrcz?=
 =?us-ascii?Q?4bNd9MK3JNS0KpLRmSDmvf+uOy0uckRJ3Qtk5qi54FkHAHsGVzPIRRN9SlG/?=
 =?us-ascii?Q?F43nAr6e04VLwtDvmBpweL5ogBQxh9hY6vxSuatR0+nhqlORA+TGA0e5qoPy?=
 =?us-ascii?Q?SUsbvJKbIjPX1CDayaWNuFavX/acUC8mLdHMKfRLO7Rdb+1JJXohJfy4RQ5N?=
 =?us-ascii?Q?RFWV4jgcQkgpFzhEBFhJMWEVL6sKGqxTyoy/oMnWcMsAW7TlhOr1EnhOcOg/?=
 =?us-ascii?Q?jxIuUjb3oL32wtbfx5XAYavUwCPoZkL2eSicJz3Hi38B9NC5fviC1R9Z2dVu?=
 =?us-ascii?Q?r6fALlxalYKDZhYHW5p6nw+Lxhb7IWAzMFDOH5JSrK3LMScremJtDVP+I2gZ?=
 =?us-ascii?Q?xaBJgoB4s0+JEDgEV7hxKSbHLotqHXA81pQeyu1bPddw4/LI+0sbRYm8ZsVP?=
 =?us-ascii?Q?G4QL0BmrMm5eDES5+eGZT0rorxCe1jihFIVeGEB2rdwKjyVNwzv3lcG3MF9L?=
 =?us-ascii?Q?3NPnekqBEqmHxRS9AZY5n6ydxV41lGMiH+QNfmPoRxK3Lhn2uzQtJD8smwYR?=
 =?us-ascii?Q?iXd5vYYotb+Kmsgez6yYgbkk9kqSOUhfzMyRqpanQxVyOzSW1R3dr2Z8ikbq?=
 =?us-ascii?Q?LWGlAkWroTcYfUhDPfH+Pfk7EHZzggbxrQnOOvw8tORvO/FT3l7Le5t6/WLI?=
 =?us-ascii?Q?Ke37LQJfsCoqdJvy8cXdBksBb95GHYneGXcvn4lr+isJ5iiefsA0IQDuAEyj?=
 =?us-ascii?Q?3vjYqgZFxx4s4SsQuXHm07PHruHjtNiIhMrUOaPaKSevpRDY4D7ms0fZzqxC?=
 =?us-ascii?Q?DlRiW45TpgUBJOITfsMMLyfJrtvKgKRnHP7e6TxyVCbWREWb03kV9zT9boAK?=
 =?us-ascii?Q?L/ACvvnL/AzdcB50GoXNu0Hh4a9C+35OM69XDc/NXxHHXqz+/yToHcQGNX9R?=
 =?us-ascii?Q?XJzow6gq/sF6Xms2GAeGaGB7ClT/F0DP6F1ugl0jNlcvIaonQ6qc78/qIj/z?=
 =?us-ascii?Q?C8jCoeLhECNEsu7pHgJvhDx0XdrNzBLSaxb1A1sZ2Pm65ol87P7gzbVQutFp?=
 =?us-ascii?Q?VnNAF4g9nMx2XvpRCoN+0AG1Omrh3zjWH4QgFGQGzhMewatZ0nuFHlXy7TSv?=
 =?us-ascii?Q?LDbUoo+HHK+9nSaaWhpUEiDXEkZm9y7HK2nqv539nh9K0hG3+Yl4d6pGwaSj?=
 =?us-ascii?Q?Pcep3tCnXDyxkybKGzG0JbFeoIVw/xH5C/BbTAAhv4CAZJPuVBuiQPNM0FVC?=
 =?us-ascii?Q?RBho3ZPiYek6e0y2eG2wvOuLlO1VJ6XfWLmYTDYCqOC0iNVvoZgpCi7sLXPz?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d412c9cd-eca8-4673-6931-08dcffa8af39
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 03:51:53.9962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zZZJjVp2T9wx6E4nMMh7L9lpngiFIQhXQzAeL+Ji8AO4iM2T64gQNdWpZ+4OqX+3vpQZuMMuLfOO0NgwHTQRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6918
X-Proofpoint-GUID: heGmV0kdzFwHA4tOvcpfMZjKqgHX0zQQ
X-Authority-Analysis: v=2.4 cv=JoCjr94C c=1 sm=1 tr=0 ts=672d8add cx=c_pps a=H8RDR50mQ1szzU+C1Tr1+Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=mSgYISTkdechXg7xnRkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: heGmV0kdzFwHA4tOvcpfMZjKqgHX0zQQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_02,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=865 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411080031
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 03:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113761

From: Chen Qi <Qi.Chen@windriver.com>

gkt4 has 'opengl' in its REQUIRED_DISTRO_FEATURES, so when it is
depended upon by sysprof, 'opengl' distro feature should also be
required.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-gnome/recipes-gnome/sysprof/sysprof_3.48.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_3.48.0.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_3.48.0.bb
index fccca1d8f..a02bd0c91 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_3.48.0.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_3.48.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/sysprof/sysprof-application.c;endline=17;md5=a3de8df3b0f8876dd01e1388d2d4b607"
 
-inherit gnomebase gnome-help gettext systemd upstream-version-is-even gsettings mime mime-xdg
+inherit gnomebase gnome-help gettext systemd upstream-version-is-even gsettings mime mime-xdg features_check
 
 DEPENDS += " \
     glib-2.0-native \
@@ -20,6 +20,9 @@ SRC_URI += "file://0001-meson-Check-for-libunwind-instead-of-libunwind-gener.pat
             "
 SRC_URI[archive.sha256sum] = "07d9081a66cf2fb52753f48ff2b85ada75c60ff1bc1af1bd14d8aeb627972168"
 
+# reason: gtk4 requires opengl distro feature
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'gtk', 'opengl', '', d)}"
+
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'sysprofd', '', d)} \
                   ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)} \
                   agent \
-- 
2.25.1


