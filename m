Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71196C54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 12:00:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5662.1711022456491907687
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Mar 2024 05:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=n3rW2Q7J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38100d7185=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42L9WBVS031601
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 12:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=0U94esqioGot+rZsBR
	LRB4aflE0cCRCb038lJKQodUo=; b=n3rW2Q7JNJBJfyy10lp2iWp54v57GJSfGL
	lVv5067ImN73i8D1njNt5lTcrs5AbTpRJJsIhny98VNUiHcRCmgt0Y0ihiobQ7fz
	KfAfVHiw3X3sZGjHN2QNiRREK7qaGvqz26aRnYx+tWAacRgECWpnQ30Jl8UABLfL
	dE1t+tiv0ulbbsmIIsl2vKQOgHza6D1BYYcvKUSdVxS/gsciFAfoW5W862+ras6x
	wz4G2KEvD+98Sb5QPMaKobj3fogKCnS+gUk2r/3GNTsgFqKn8CvaYnYH+NlH+Csb
	rt+3RyNPUbjbrYPhicz3L9VvQzU6ucyEOp3B1f28gE8vLZVn1gdQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ww2d6n0a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 12:00:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCe9vJH8CD/reea7geGX8fGDHzo2Ukdcgu5hCbeZG9fgeY/XkTKp8AjpZ0jKM5sDQy0uJt7EbwfYmRKEiIAo7s/+jmx+YGLykYZJNr6VNxzSG7+V49iHSZXcGRaEZqC8I6ZUWaF5b4Wl/oDvu5a9rmMSgvev05l1LFwmHn+XBinMHMYnHw+yu05ohJEZLzw4TkrfLFQxvI2lQw0Ix7WNObrewW1CDfNQTo6fUEud1H7E5ef1IfiBT+1mYwGSD2j/Iln5MbuI9So1Xx8grV99yxX5emGnnRHlB0f0n95k4H96m4Qi6R7pdNGH/fTfJSkTkIR7OBCJev3cJ9G+czTkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0U94esqioGot+rZsBRLRB4aflE0cCRCb038lJKQodUo=;
 b=Qpu3R8MlSh47ll9WC2b46zhmeg64HCOjuiyHZSyql7Jvw/A1IXZzmFo2DSDjf7/Yg/6ytE9eYjTCq3iAvJn1qaG3BcZ0T3RB9X8JyeLXPNN2XQoYvPkJmdDkcbPxbm2nAChCKpbmpXLqgr53XLkgZFxvLYHNiHDPaiaodS1bVT5/8GH1y0Eu/2dcmzrdaBrcDgH9YZsiU8kRf+H53BlATWK7LKaAAPnM+OAA1Rc1KMh9eiaNrz3ao/KrDor36J2lJnA1svKYdvhpqGDJmh9eYcv+HmsvzsbttCubBb218xVM8UelozN5CYTV3D4/uLqXOXelMF7c2vMt+58RBoKroA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by IA1PR11MB8150.namprd11.prod.outlook.com (2603:10b6:208:44c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.15; Thu, 21 Mar
 2024 12:00:53 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 12:00:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] openvpn: upgrade 2.6.9 -> 2.6.10
Date: Thu, 21 Mar 2024 20:00:42 +0800
Message-Id: <20240321120042.1730918-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0009.jpnprd01.prod.outlook.com (2603:1096:405::21)
 To DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|IA1PR11MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b40f1b-40cf-4624-63a5-08dc499e8eb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z4x6F4KkAtBcDvAWqsjGBa9jy32lBiE7xPw2rSEh1j8VItQJMLp4NS5KfeCf82Rofyp1/CRTUSI5VA5PXnfx65J+5854mJGs4r27jFNo9yk7wO2g4+GSzpGoflaFbOwjPw7HM8Dv4fpkWWMVbsXbx7svQC3EKZzU/qUP9iacAsfVL+XFAtCxaSydiyks+wds04TNXWWy/PDjtXpkG2YhRKk1/fnLm6xw7bfmAsyPBw2Acp1auYTQGg6g8yj5xIDYrV2mNNdf4RHLRB3EwQz7OPWr8kh0HfRTGNks7WaB5A9pfzaEwU7YAIBFFzYWRzNFS/ifET1zyNGjAYz9LG8f1hMePUN5YaX18dj5wwcRSDtsneYD6QbUzeah4+KY17afVPfIx42lKp2ce5h/JrfsAhObDfwG5AxXsCBbuoKAM5AQwk5ASEo4W9RTIkSvSVrilQHjNM6o0qcxEYLs0ap6rc+w2lSOiwoIrTWslBFQur2pFfecqzSv44pwZBtNzzMUea7KlWi4I2T1NAA/9IErLEz2Nbfwqwg2oNJTDMiJYuIjoDDik+fVIQVkRROJHgZPO43yRSNfoPCYkJQRtSgIuy0uoKadzB9edEI/eioYjaHhTBkruxVdQZOp5xjEVCXXZuBHh4tn480PxTU8shcRqzEOeLo6O4z9kkv7iTDEGOY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zrt838MvhcYrSEuCJCU4lvhmavUGuEaB/MlhQRtnr3tTAxKOnguFK14p9hr6?=
 =?us-ascii?Q?sQYQH7fNmH7gB4PYeEUHdPpgpROMrnblcgCS2Qann2O+vAiLcPRFsMuJO33B?=
 =?us-ascii?Q?cVtNhO9JwGFIhCDE2UkwE6Kl7J7SWz4P13VdUZzxSy+EjYN9VimBWphI5RkM?=
 =?us-ascii?Q?5Strt7QEb32+/jyIDgPRKnR88TOUrUIb8hCE3Ce9aVtdU3ZvIYfpsINuMH6Z?=
 =?us-ascii?Q?ouP3krj+LNwOhBJvZLiDlteS0teTbxD7u5gDxV3PgEMUnKGi98+ucn6x+jpO?=
 =?us-ascii?Q?CjRN1fPeyv5SuxAMbnORBKbbcjdxpZjkiYDg9+IJouzGpOZnCXYcZ12Qy3SJ?=
 =?us-ascii?Q?eZy+Zy5MlNU9Q6v3vta8GHIeYVQv/2+5tipvIbUVussVxLdgz5vlKju0rU+7?=
 =?us-ascii?Q?mFNQr7GFRN+UcbrqDwDndnHQilZFmvZhKjBtks2cKx2jZD1PK5r2W+DsEKK3?=
 =?us-ascii?Q?14j9BsNgDTCbcxU+Cjq/VRf4h+vSv7dNmtLYjq66Q1zZW6IVwhKi1GgDRokA?=
 =?us-ascii?Q?u09ncqvtdH8Jnu9g2xzloEOPP5trHjYMynOmyNVxlzfIeldnw0tNaB0KMS7c?=
 =?us-ascii?Q?/KmkcYmlQ4BwL3UlMCnIFidRsSs34WQZhij4H4n3zffdLMLz63w3uPLhe5gf?=
 =?us-ascii?Q?9+Bg6FrtOTdDzwgWsmosHHn38Autza0+1Z0WTFjJdyXkmizs2rFgUo1JQGwf?=
 =?us-ascii?Q?8SGWfOxSKVYRpEaeVlOvyAGCXWLr7540UjQEgQMamDkAJ+UBZRguofYYZE7O?=
 =?us-ascii?Q?GfEaiT3gCiWu2x6g4kG9+BPWc36BjqQfGdOuCkP4BSrdnO08CSr88KZlbE+b?=
 =?us-ascii?Q?d8Rew5cs/Kj8y2w2gNZctwxGyrIRoiRZafWj89X9c8SvDNrPBGIlNb26Ljju?=
 =?us-ascii?Q?ljOqQ+WsO6DXMO2VEJJhCcAkO9n4yWlzXH2Kt7toPCAW6gDtraC5maxj9c6Z?=
 =?us-ascii?Q?AlkYw+lJUXK8La5g2CUGaoN4/JwRwZY2x1n8tjB8k9Lr9yVE2YZXnzzig7BW?=
 =?us-ascii?Q?2G1g7XNekzGhC5iUtRo3wInaOJhdkWDm2aKSCknaLJpkB1BxUHLqtx/T/mpo?=
 =?us-ascii?Q?em13zTxL0HFkgF9YGZ2ncg0ocgcDKgWfSCXboqP4pdc4ueuJ8c16BEHkZA20?=
 =?us-ascii?Q?gVOCGCKNFo5pXgUYAsMBXvk8GMolgiA1WKuQO5mP+OXyX/izFKeNE5w4Nzwk?=
 =?us-ascii?Q?8n2JgsiL6GdceviAW6zXySWWqTx7ETkdK7W9J7/EM3Lr/sQ4WbOrZ9gDJGsw?=
 =?us-ascii?Q?Kpfskel3gdWKkT7KOPOxVDytBshnHoZkIdUKSPHAIEJ4kNJ2PnJqlQqoznga?=
 =?us-ascii?Q?uDzS0A3sGety5PJkyNsKypqLW5yj0LKXznxh4RhQcC13WYYkqm0OsGO8Bhfx?=
 =?us-ascii?Q?dMvyzHX7MnZNPZlb7QAox+hk0Q1IdZPKLgSoEbtfvlRw6C/ktuhw/vaew7ay?=
 =?us-ascii?Q?hsAaYT+XpFES73uivaDvIEAsiWWsUJry3zS4P2JKGFQt8oJ5yvMGrB/MDB0U?=
 =?us-ascii?Q?WXdOQHWkd8BSo8w6LJZ8yQwb/x6GDjWEWIIei0PwKA5KdNJztuoBLeHrVe8s?=
 =?us-ascii?Q?4lM4gajC1jyso/lpIB5dduruk9rwKbhpoZrToHjn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b40f1b-40cf-4624-63a5-08dc499e8eb6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 12:00:52.9596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yzQ7TY75pZXsu6m4l1AD85c3ds1snMMAHuVCnZjhT3dcQdjtj5/al+zU6tmTLBY4Xyb+5dLXEf+PpfIDGk6EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8150
X-Proofpoint-GUID: yE0faL_0vpwPXAXEEe-2j8U0noi6cmqH
X-Proofpoint-ORIG-GUID: yE0faL_0vpwPXAXEEe-2j8U0noi6cmqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_08,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 12:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109502

License-Update: Update copyright years to 2024

ChangeLog:
https://github.com/OpenVPN/openvpn/blob/v2.6.10/Changes.rst

Security fixes:

CVE-2024-27459: Windows: fix a possible stack overflow in the
interactive service component which might lead to a local privilege
escalation.

CVE-2024-24974: Windows: disallow access to the interactive service pipe
from remote computers.

CVE-2024-27903: Windows: disallow loading of plugins from untrusted
installation paths, which could be used to attack openvpn.exe via a
malicious plugin. Plugins can now only be loaded from the OpenVPN
install directory, the Windows system directory, and possibly from a
directory specified by HKLM\SOFTWARE\OpenVPN\plugin_dir.

CVE-2024-1305: Windows TAP driver: Fix potential integer overflow in
!TapSharedSendPacket.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../openvpn/{openvpn_2.6.9.bb => openvpn_2.6.10.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.9.bb => openvpn_2.6.10.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.9.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.9.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
index 3af6b30a7..f8de78ff7 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.9.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
@@ -2,7 +2,7 @@ SUMMARY = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "https://openvpn.net/"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4b34e946059f80dcfd811e8dd471b5ed"
+LIC_FILES_CHKSUM = "file://COPYING;md5=89196bacc47ed37a5b242a535661a049"
 DEPENDS = "lzo lz4 openssl iproute2 libcap-ng ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 inherit autotools systemd update-rc.d pkgconfig
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "e08d147e15b4508dfcd1d6618a1f21f1495f9817a8dadc1eddf0532fa116d7e3"
+SRC_URI[sha256sum] = "1993bbb7b9edb430626eaa24573f881fd3df642f427fcb824b1aed1fca1bcc9b"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.25.1


