Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DCBC3DA4A
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 08:22:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.55283.1736151738386975152
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 00:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3101692a3d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5066nfvp013687
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Jan 2025 08:22:17 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2048.outbound.protection.outlook.com [104.47.57.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43xt70hktr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 08:22:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgIBDFyY6AYg3SP3ecNZLM+SG5ecbAXFnq0cq75RCLb6d1akK9iprlToO6T1D1/9sfUpelGYHJC2vfEutU8Os6YaPKQ6jAzsMQ6sj5VL5aXht1I9XdPxL8I/wtIIzJ3wNIH/rkZUUOyM4BUHQNaMxDi2LrtdeEUOBjjo/eXkXphld0gFkLVhdIviReeoHgH6XcM4qoDL22sndkeIXasqKFsLiOkj4lSi4Wl6L6ON9JSDDBWPWfc30GJmziwn2Stms9rtBZNEMM0UsjIgiQQ/Nlo1m3gDbN2oMueWErE7+1o1fGIrqAxrpOYrXnUvZAjFnUDgs9sK1wp/cVHKsOEQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3unyKbpc+uiRsBjVrEDzOtbSurtb9WY9EmxJdltCYY=;
 b=SEm+T3uhnuRNyTSlBPg91hcxQRnq0f/PD6BO4dev9i/awjgga55t8soM/nAVx709118XVlyHyf9YyjLAXdf9l04/mVDR93nAaLk5aNYefxMCynCSxzX4J0Nup/vM+AkhI6GQf3rZM1C+nu2S1LTiYxraHF6o/wUm67kacUMdUoCUuA9OE8jUxTkSoU1JD9+zmPC0UsS09mdGK6ze3Nc/KajnHgEht2yy+5sqn0YhbAS/kVbhLQvh3bVx6DU0lWVoSRjrObBmA4wP2VEjXX9hAw7kDRAzCMJrfcFlxNKO3etQ45iXjPTwINf8+7aXf5doXi+z3i97LX4EfDIor5syOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB8061.namprd11.prod.outlook.com (2603:10b6:510:250::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 08:22:11 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 08:22:11 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 5/5] zfs: enable packageconfig pam for pam distro feature
Date: Mon,  6 Jan 2025 16:21:52 +0800
Message-Id: <20250106082152.882222-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250106082152.882222-1-yi.zhao@windriver.com>
References: <20250106082152.882222-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:404:28::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a2e93c-d7a2-4e6b-e86f-08dd2e2b37d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pF9hfiIOSQESpkf+Bvd9yNtB4ak1taA3WSovjZHh8ok1nCcpv7+efOKOyDUj?=
 =?us-ascii?Q?QDmpfl52K62D03vMP65CWtsnvw1qzMyR0O6GSw0BceISXf4RbP7WcLuzMGfM?=
 =?us-ascii?Q?ECeeS/U2i8MBGkdx5rCrwBqOpycM+n9ECrKoqF6LSJG9/bicV7m41pfYr2f+?=
 =?us-ascii?Q?/MHUd9zlPoIZccfgXXGNdRyZ1HUo+MXkEZFbl30Fej+URcjl8C8THrup4+1H?=
 =?us-ascii?Q?6KldJLgVwy1wuCjUmXv7uF7hlrfA+5Zd7vClqt7awfBjVoBWsjJhjvPiEmSm?=
 =?us-ascii?Q?qaGvacQBgZzeFJD7fWKtisBP9DH5Ue9jZETMby4hFx5obhCCzgzKZT/82ghw?=
 =?us-ascii?Q?xMyMrgLqxOAUWgqavlvOi9MjzvOcNCQrQ00lqyVEJupDMcwWur6m+X5ywsyB?=
 =?us-ascii?Q?hO5CKP2ZV0g5uCdyjvdMIHQCWGyGq/lO5CUWkD64o3IiUPqujiMIvzRxieBD?=
 =?us-ascii?Q?OgWgnkWXVGoBwGj7Q0jQXQ+jTcon1HYyJqz/6ZcJJy2w9SkNRUhrO75FUxVq?=
 =?us-ascii?Q?Cjt6pq/zR+sWEmmgPZ1aBTSmYlLjDm28jYcGxhJ11nSxuvR37avrh5eEHxJ/?=
 =?us-ascii?Q?kE17rMT+/uIP+5PIWmVipARXyIQm3thLYw/wchJGqLZ7lPfVIhfjWy7FNxAu?=
 =?us-ascii?Q?WhnYDqSKlmgLVilNT802tjJAXVpih5h1gK0lGH7YvPiJKzMHRtdmFP9os6Nf?=
 =?us-ascii?Q?boLO9mQt2uKith1uqFU+vi1xWkyWf16vtMIcUY3ReWliKgZbsobXHBVjkMq2?=
 =?us-ascii?Q?0Vnt/NSg0tx4gXwJa7405Ei3XCivKYFaniUfRo5COQec6txkJ6xpCav/ZwvD?=
 =?us-ascii?Q?3hH/13wRaI+zrEaZaHio44dvQTJYIDm0kGg6l0DTkLsA4wgIcTV0jQBrqzot?=
 =?us-ascii?Q?kZXj5VMKYR72sPZnrxr82hkA5J/ujAjbmJa2TwPuXE8xiD5r8llr0Ptvvyyy?=
 =?us-ascii?Q?Ub4flvu1qfmUEEspTMDENqi3TbUctw+vEjQXSM9KC1pj8X5kyLoV22AHmYiq?=
 =?us-ascii?Q?iKsx5rtUkN+65w7zPIqrCbyMW1B4yzqI1/JtQlRMejZSQo1lR5sBh5tZHT/J?=
 =?us-ascii?Q?frBqDmnwj73stEDLFHYMfPMgsk5MZpGmepxVwLBtsZ+CG3IXt5l8CqKw0Mt0?=
 =?us-ascii?Q?LETGMzQ0NvEgVw59qfjvn3wSr3MFPLpfgi/pIcmeF1avi/jDoutA5zgpAaSG?=
 =?us-ascii?Q?a2SXhrRdmSVLBaClRvzpT/7aw11RAk5LNrNNSzrEMiIfQxIu76M26/lAmF47?=
 =?us-ascii?Q?mpAewQ8Q1UXKo9IdLDBJptX6YAAc5mjLV4qw0nUs5Iw7pOlOLuz953MolDeq?=
 =?us-ascii?Q?Lt/cX78pqVWmCiiU60ok1qCcaxClsFXnJcvY5f3Md8U5TVc+d3RYMZ+izob1?=
 =?us-ascii?Q?5EvFzw5lhIBOKEJUvRWw82YOrwZLZeOHfFoN8OPOn7OkQBP7vHQwET+wjit0?=
 =?us-ascii?Q?AArrpe8D5yQcTdND2zkaysHDaPkbkW67?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1z65oDMcdJmBujJRY1+OINRh58UKo8j3wzfUcS4ZtdxZwqPIYjhVIXA56R2b?=
 =?us-ascii?Q?eaoqWSAkb3rGX4kCGuiDtBK5tVm+bEi0mnjepfL/YtTg+waeX96LV8yHREZH?=
 =?us-ascii?Q?ZZGShdq96hMxJ32P1mPyNGqB/SPxc4rMfcJ5pz5DFcGiMjWs97efEslJ2GVL?=
 =?us-ascii?Q?6/XMufuEHxDXtG0hj73I+G56Lg35mzhrsq2L7FTzCSG7QOPVI6JikMZ+npG+?=
 =?us-ascii?Q?6IwLj6p1wQwvH+/jDQC59PvrN/U9kemfQL59NUmLptZvEq1s/5k5Gx0ZjIyS?=
 =?us-ascii?Q?lLaMP1IgSjUotpAc0SDVdCCDduf7lyE8+Au5gbAAMdTAWf0s07jQricNewq5?=
 =?us-ascii?Q?8Y+t3DtDRzugmFlT9LaDW8olyLpjZdI724uJUMLjAkOZlpBoSdQ/f59UlR/j?=
 =?us-ascii?Q?ysJS7Cg5XcM5jw2lMbwUIQime43k91zPADj00/xhNEpOJUVQmRnFGG4GUvBH?=
 =?us-ascii?Q?dFgIwCHShW+pxJ4WBMOMIX/jVEhzkCTNMxU9z4wLsBseMPGxD2uR/Jdh3Lyj?=
 =?us-ascii?Q?tWsOJoDcG2xnVu+/01FthtVLiG6djNXKvzpBIA8IDP5u/dLl+1IuiSRlGKdY?=
 =?us-ascii?Q?KuzG/AXHQFz9NwWKlc9Fi5AmrsxBDvji/+kpFJhYIS5PMIEXUp++Y6LLAtLG?=
 =?us-ascii?Q?2SFJqOECcOsBqRAKQGRCSCg8ZuO0p1e5iAhVGGchVLJhpPty68KFVNxQliHm?=
 =?us-ascii?Q?HuFZTaEhfktOIcazniJoFfgbTU7GD0KIFdYDwYqg7YwfoHwzRN4YBK3L8gRy?=
 =?us-ascii?Q?7XzQr57L/owIUIReqLfyBnIQ+eqha1KK88zbHYqdsZS8AWLgIkIEoWj8J9sN?=
 =?us-ascii?Q?H9JLWlrG+ouRXEBbx4Ptbdb5ETe4bpoDjJiD+wRgjrX3wsXWmPmO/73lleY2?=
 =?us-ascii?Q?OMMMtNqsw5Com57Cqsk24fszkrBSiAnETD/3mAMJ++65VepVD3aXjxKBG7Hs?=
 =?us-ascii?Q?O/VFLEEs0Y5BqYtvbq0H3YcrneJbJInCXbc8OuubemJBLhvZXJfqk57Jy6K9?=
 =?us-ascii?Q?SpABKhw/3egePuiIRBdlE99ddxkM9oQ1zceblwT9XJDZ/BiTJ6ruzranGacB?=
 =?us-ascii?Q?O57h6x+YX+01bxwnLgptpY3RaF9zyr97sUlQOuMPgKCKTnacTDktMaXztelu?=
 =?us-ascii?Q?AX/nkL5Cjux0077BopjNODtNBvTOxzO/vebpadeUxdJnach+KI+O9cDkcjpM?=
 =?us-ascii?Q?A+ngYPSwlEHLmec9sh0AMO3fjcXdxsxvuLHhrZ/VdKr7yI9+wpc8OPMaxQUc?=
 =?us-ascii?Q?sviEuOsC+ypFvdV6JkkF76QNcV02ewKfgNKv7gC/UiGLP0mDTyfLoODgTyS5?=
 =?us-ascii?Q?Dk+xEi6asEJ/3O9n5mExMDqPCtpujLK+oTOT1m9KvK+BMN71gItmQ374jMCe?=
 =?us-ascii?Q?e4tG1TvtccnDJ0W2vqk9aKJi/z0DgYICPLBqkazck/mcJUUxl6EC9wr5r2q0?=
 =?us-ascii?Q?wCJv1LI3rkJ5MogaNeb9ipD7WToui2r6LD5TBJSdi6WYAHRjOdcT6+DJaokH?=
 =?us-ascii?Q?6SDPz9t8AzJkA0TECsD9R5tMQpbrc6mKKtiGEvYl1+Z7VZpS7Zt3mHoEyOGE?=
 =?us-ascii?Q?rS36cw69xBFoEt4ewWbTCKDpWF1fSnyiPiZQf/9x?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a2e93c-d7a2-4e6b-e86f-08dd2e2b37d1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 08:22:11.3118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZeGfC9EYQKoZoNZ23aYCIsFX9yOtfU/1JQjR7ZwDNilJfM292oLqm8zG+tuSlVcSkNlDXu523sZvIUJhZl+Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
X-Proofpoint-GUID: --v71yKKdxOa9E0npn7kYOWckt-bzzBJ
X-Proofpoint-ORIG-GUID: --v71yKKdxOa9E0npn7kYOWckt-bzzBJ
X-Authority-Analysis: v=2.4 cv=T/l2T+KQ c=1 sm=1 tr=0 ts=677b92b9 cx=c_pps a=l5p8UTqLmUd1ApN92JXWiQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=MUXp0jGbQxZvIRSZPO8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=680 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501060073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 08:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114659

Enable pam packageconfig if pam is in DISTRO_FEATURES. Also set pam
module path to ${base_libdir}/security as this is the default path in
libpam.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
index 1b41deb099..b24774311d 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
@@ -20,9 +20,11 @@ inherit module-base pkgconfig autotools bash-completion
 
 DEPENDS = "virtual/kernel zlib util-linux libtirpc openssl curl"
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd sysvinit', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd sysvinit', d)} \
+                  ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
+                 "
 
-PACKAGECONFIG[pam] = "--enable-pam --with-pamconfigsdir=${datadir}/pam-configs --with-pammoduledir=${libdir}/security, --disable-pam"
+PACKAGECONFIG[pam] = "--enable-pam --with-pamconfigsdir=${datadir}/pam-configs --with-pammoduledir=${base_libdir}/security, --disable-pam"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,"
 PACKAGECONFIG[sysvinit] = "--enable-sysvinit,--disable-sysvinit,"
 
@@ -69,6 +71,8 @@ FILES:${PN} += "\
     ${bindir} \
     ${libexecdir}/${BPN} \
     ${libdir} \
+    ${datadir}/pam-configs \
+    ${base_libdir}/security \
 "
 
 FILES:${PN}-dev += "\
-- 
2.25.1


