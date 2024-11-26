Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395B6D5A6F9
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 08:11:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.41207.1732608695151343170
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 00:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1060a1ab4c=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ3mCEE025160
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 00:11:34 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433b79arx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 00:11:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INsU/lTqiVV1QdXpm+P6l64Gmus38q3KU4rFoUGrR03OhmJsrvpwr1LPdRicfNVqN7KJzulZGgYP3fy3StdU2aC/Phf6p8micNT7poMkOulDqy0lN2VghiDGGJFLHr9N8apo04Otyn4lnFRgEHX8y8l/Oan6j64lugGy+LnK9YmqWChrAJSL8RY5BNykzkQVk/IpErk3Ym9tb25doavr0eR1hrvl6Cd+elKhTmjz4zhGEH+F+yIs05lUrl6/3A0w/7UkJDiCpilWNhkXDwp+YftjNZnpInYVBXGdsFi9I5W5+qv22VqeY67C4D2/CLkcAkF87+cbCf38TKVe6G1otA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKVRkvaLGkFtCRq5NhUmNWRgMdpLmhmiGkY9eTEDPX4=;
 b=Wy9zh+bw9Q+26Zp8Jtp0tQNAOZ46C4JJxmPUHdSoyZBig9J11LcTzGg9DX8CSjBDcpL5+K8i3He4hKOtwv6zjtQ/inlmwegesfVp5vgFpLFV7YNNION+5W5B0LQj7SdAoAo0qzJoRTO4mi1AUO7w9wNWumKVpNiLEHWQGHXBFsL1gU02ZHYWiLgkvWrKp5W2Ph4YXw6WDXz5xEFJUC2N6UA/NKJtNaa2M3bvygPcCRozVSEkaf8LDX/QJ92jybf4M7HU3UkMxiFhJWGWCplSbrkWHBWfT+10xSsfU7WQTV4/lNWgoQeBZBYhr96kd4jxXr6oNVk5CHEbOkyfVNsDUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Tue, 26 Nov
 2024 08:11:32 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 08:11:32 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 5/5] frr: fix CVE-2024-31949
Date: Tue, 26 Nov 2024 16:11:16 +0800
Message-Id: <20241126081116.2535308-5-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126081116.2535308-1-peng.zhang1.cn@windriver.com>
References: <20241126081116.2535308-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::10) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CYYPR11MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 80bed554-f942-4ddc-9903-08dd0df1efc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TRH2lW8dVYWCgj0p/CwsuPq0wxXJgyjAmOpuH+YqE3btyS+JyXrjYZUeVRww?=
 =?us-ascii?Q?i/RSG82VEhl1QVNkVGVI2/x9xMqZBZgssbnAPK9zxO+Lmn7+UP9kgmhp39yx?=
 =?us-ascii?Q?vysyZQBA+0YOA4jN7AnwXbVjDwfnV+v0IP+xnbyf8S9sS/RXcQ4fM52slpAG?=
 =?us-ascii?Q?+UB/AWKgu14xVChwnbXery8kDh/8/FoKjD8hZpPx2JnSQ4d8ix9sZ5Vi32r0?=
 =?us-ascii?Q?TixdZLA2jtvfiaJuDSQDKzQphrKCnZRo9rLGpG7uW5OEVDKRPEV/02tmPD+F?=
 =?us-ascii?Q?+vrs4w0tzSr/484vJx85W7bqvaLxP1RI0BMIp1xWfgAq85dxPZZqfjfJQcz9?=
 =?us-ascii?Q?n/U84rbP0szj3E5GuJWgyob/DZr/PklPYyIqrys8+wqYSCpvEt7ph6OyYup+?=
 =?us-ascii?Q?U6TB4RQOJyybluFP3z8IbIiLt8qww9RhYDacQZirEzqS+WVUIAVh1+M+ExHq?=
 =?us-ascii?Q?DXZJFk4usL9kGlCSx1X+7NNMcKCnqF7UcsVbU4M5L4seC4WIBgyip7HoChvq?=
 =?us-ascii?Q?gijYMJqVkD6xwNb/aXdMIrPnt3idxLyZd3LSMa37Ft1DdCoA2OJfqr5OK1a/?=
 =?us-ascii?Q?CCSIdLAezn4GIl3pCl9rzgjHudveS1R9G4P5RpHSMppyFK3bU4vle+MJ3cpZ?=
 =?us-ascii?Q?SlqC7GYG3anX1jibIi+eXgqPeKX/l7Yi0ihzW0xkVoRf5pCGvS+q+o3c3im0?=
 =?us-ascii?Q?sQZOV1So4qECZaqQmdnbQWsVHHd1fCiwq+2axkFuxS6K7EeYlL6gbOhVluQN?=
 =?us-ascii?Q?FUNJgxT0KAiTkBWh7SpEPa8PRYvtPATIEz6YqAU9DK1VWzSh5LO7EOgX2EhM?=
 =?us-ascii?Q?COdyQNxWF3pL9kMbBAuKrab9A25yD6us9CXZseL7CKy3Z1ZYee2gNb4w6Xyi?=
 =?us-ascii?Q?QrhVmov6zMMxhHM1pwfjSrEoSMFXcdD7RX4CGQN2tphFcnWcvsDzrL1ikBkA?=
 =?us-ascii?Q?5AUQEh8sSwJEeALpLXIM2AaF6Z7H+r807lFQYbWyMpxnsCDfts+p6w2+uU88?=
 =?us-ascii?Q?uGQ1koACvln5JoOXB4SAhNTEHePxYFhsOWlmT2ySCpAeK6722h3IrJ7E7NSf?=
 =?us-ascii?Q?7DvVaKjgOOdnNvMmcuu3nlTJyrCiXc8Kd9CiWJDalG0GHnAY+vZrtp0gdSwK?=
 =?us-ascii?Q?s1/GAZoeKEDgvoHX2AKzXMGsE7+93Zey5050EM8fb8H5VVQQKIKVJi5DMMM+?=
 =?us-ascii?Q?1bybZ9Z3gN16fLsYMILhFHhzWtbFwIrgM1moUpAbprc/GX6Q73Hl8c481GrS?=
 =?us-ascii?Q?zT8aPLRpi98tsHUbINgc3zD0ELqD8kxVqayPdnl5GiKgBERNZjpvEYhmcEs8?=
 =?us-ascii?Q?0OH/GRQJXnBsAj3U2UK/bzxhVcd83aN5H7dguTgFho/MKtAVyqEUwqhg+AuL?=
 =?us-ascii?Q?OFKGGuY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uvoMN+Qe0mw+pba75GdqNmRqosZn69lIefT+hXYhOwGwpJAx8nB3uLFs0OVc?=
 =?us-ascii?Q?O8z1n/D1u8QvKX0gemD70r9OiaFTCf6o2VTvceuxToZvMvDcimSw+3G+HpXi?=
 =?us-ascii?Q?6UsiGb0o1KODsgZrED1aASj5GpqlbE9hFlLVxjsLP81glFDWssCUxv50S1ve?=
 =?us-ascii?Q?5zDgxSv0PtC5z6REmX+uzbnApc4kEbA1GrI+gcckVAEoVWevxDlxNIospXpn?=
 =?us-ascii?Q?0d144A4mJ4PZWznkHqXj6NxK6FAaYqQQ1SafjqOKYui3G+/8MZ0wsU0SW1C7?=
 =?us-ascii?Q?Oo4yYezXsVZgLmawaxLPv+xFjdS7XQB+Pyv2+PbAyuwLobPiQgqARR6RlWBB?=
 =?us-ascii?Q?tM4qihkydbbMR8B3ELVfJ/8Zc4/CIiqOVp1WR80IaGNqmma4fqhQ9RYaPNqn?=
 =?us-ascii?Q?4bedt99QXx0xUkDQEKgmdn7tseJmX/IT+Bb2aIvdZmQwudY6Rw1nmyCagRSo?=
 =?us-ascii?Q?xA1rYcyZb6au5MMGlA5a2WPSLZ2QFAp9gRcvfLU9jGTOS11XJXnLp6gU60ZI?=
 =?us-ascii?Q?yC9FboGfVEF+aeMlagclSM+mA3G6MFSMKe1BRco4gJQBCXcV2aRVGjKkJO0G?=
 =?us-ascii?Q?ikVCljF7gRkWzjXe5Mlk2DHHFl/fhg9oWJK76yNOdmVPbgGdVdYJWT24FmIH?=
 =?us-ascii?Q?7rapXC0EZhoqo4wBkzA4g/zZn/Ko7JICcrzpH5NfYuPmBSEPwLNYmqOrRFsL?=
 =?us-ascii?Q?B/8DuwlHRgbdFsKQ0SmR/9Oyo8HILk2u4g9kCXGM24heJiK2YCi2AVF9JAXU?=
 =?us-ascii?Q?FTL4cNgh1+3H2MKmc8qo8MWGQVOIXrvZdn0CcwfON64bqn8glxjwaIxYI2W+?=
 =?us-ascii?Q?A+JFFrsjdQVZG/VERlQ3krZdCUDB7TZENjnGAGCJoOHnPh/pdhe7EaqBq6wr?=
 =?us-ascii?Q?/K+ctarOmuoYGisYDdah3ipCVO+aUG+1kAGHywL396cz6Xycyxk3girENXnG?=
 =?us-ascii?Q?eP8tojwtqVZuYjJpF79dkg/W6p6krJt5qLnKreWMVOTKHNQQDSpM/h2jjIZr?=
 =?us-ascii?Q?GhHJP0kkSfc6PSRwu4Oyk373SSMWTtzt/aIaIZEXFd5+vVPZZRwAobhchZOJ?=
 =?us-ascii?Q?8sueis491dIuI6S2trevu69Y02MmcyHIQkGkvHIOUnyOCTEXsUFUfByzDFMj?=
 =?us-ascii?Q?otXYT6FddrVWGW27llzKTgLk+l5Ngr2IWKz58QPKu5h8ox+Fstm99t37hPsp?=
 =?us-ascii?Q?HLlrL9iOuVyUJ3Qj0QziKewzRkYVURb9cyszc6U3SPXitkZqz64Q3yE9xt95?=
 =?us-ascii?Q?lGoe4/WRl7ykqyl2YtFsYPACMrc6/mXRbldebT7C6I4UrsViFWzsoW49s+DO?=
 =?us-ascii?Q?vDRjRimy0QpAw16WC5A36YAi1VFufU2KthTZrkLYqr9pInEU9mbQsWw8wMOP?=
 =?us-ascii?Q?tgkKaR59AqhqmwXICV/9yyAhUnmeKPDI1/es6TzhQb7i5PPckuOFM0QXph3T?=
 =?us-ascii?Q?5i2WpdgtyQrx32wf5z119aRY7t4UYQhiwN2mnrvz933zTYZYodDi/1ObBArW?=
 =?us-ascii?Q?zVwsDZFcFIe2B8bL887q7+65ms2KUdZBPSn3kz71KCaiRqzFF2qzGXMzetR7?=
 =?us-ascii?Q?MGGH1PThcn9ir8mhaHOFFzBdh4nU4vVcDn41IDDWilwrDlfyqo2APlR+Uxbg?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bed554-f942-4ddc-9903-08dd0df1efc6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 08:11:31.9924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kutTcS9bm6aDaWwaOytVN92pD9G8zdCakSgl4pp/c/P09IrIHu86As/DSey4GYpN0QzZe+N0zvDiBcTeTT1ThaCClv/N/FL3MKf45Zz17D8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8430
X-Authority-Analysis: v=2.4 cv=atbgCjZV c=1 sm=1 tr=0 ts=674582b6 cx=c_pps a=LxkDbUgDkQmSfly3BTNqMw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=87jn28RfAAAA:8 a=vggBfdFIAAAA:8 a=yYmdAl_N23lnizRUK2oA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=aVDrfO6s1PESLM1EhDzk:22
X-Proofpoint-GUID: teIX8yBRUHKXnkERSUoMoFtYeEIm-V8L
X-Proofpoint-ORIG-GUID: teIX8yBRUHKXnkERSUoMoFtYeEIm-V8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_06,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411260065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114067

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-31949:
In FRRouting (FRR) through 9.1, an infinite loop can occur when receiving a MP/GR
capability as a dynamic capability because malformed data results in a pointer not advancing.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-31949]

Upstream patches:
[https://github.com/FRRouting/frr/commit/30a332dad86fafd2b0b6c61d23de59ed969a219b]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../frr/frr/CVE-2024-31949.patch              | 163 ++++++++++++++++++
 .../recipes-protocols/frr/frr_9.1.bb          |   1 +
 2 files changed, 164 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch
new file mode 100644
index 0000000000..dad0255ead
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch
@@ -0,0 +1,163 @@
+From 2779d7d7c4f465f8e117aa4c47982dd60d620bc9 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Sat, 30 Mar 2024 15:35:18 +0200
+Subject: [PATCH] bgpd: Fix errors handling for MP/GR capabilities as dynamic
+ capability
+
+When receiving a MP/GR capability as dynamic capability, but malformed, do not
+forget to advance the pointer to avoid hitting infinity loop.
+
+After:
+```
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [GS0AQ-HKY0X] 127.0.0.1 rcv CAPABILITY
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 5, length 0
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 0, length 0
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [HFHDS-QT71N][EC 33554494] 127.0.0.1(donatas-pc): unrecognized capability code: 0 - ignored
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 0, code: 0, length 0
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [HFHDS-QT71N][EC 33554494] 127.0.0.1(donatas-pc): unrecognized capability code: 0 - ignored
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 0, code: 0, length 0
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [HFHDS-QT71N][EC 33554494] 127.0.0.1(donatas-pc): unrecognized capability code: 0 - ignored
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 0, code: 0, length 1
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [HFHDS-QT71N][EC 33554494] 127.0.0.1(donatas-pc): unrecognized capability code: 0 - ignored
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:15:28 donatas-laptop bgpd[353550]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+```
+
+Before:
+```
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
+Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
+```
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2024-31949
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/30a332dad86fafd2b0b6c61d23de59ed969a219b]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ bgpd/bgp_packet.c | 17 ++++++++++-------
+ 1 file changed, 10 insertions(+), 7 deletions(-)
+
+diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
+index cae82cbbb..50e5b54ab 100644
+--- a/bgpd/bgp_packet.c
++++ b/bgpd/bgp_packet.c
+@@ -3121,6 +3121,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 			zlog_err("%pBP: Capability length error", peer);
+ 			bgp_notify_send(peer->connection, BGP_NOTIFY_CEASE,
+ 					BGP_NOTIFY_SUBCODE_UNSPECIFIC);
++			pnt += length;
+ 			return BGP_Stop;
+ 		}
+ 		action = *pnt;
+@@ -3133,7 +3134,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 				 action);
+ 			bgp_notify_send(peer->connection, BGP_NOTIFY_CEASE,
+ 					BGP_NOTIFY_SUBCODE_UNSPECIFIC);
+-			return BGP_Stop;
++			goto done;
+ 		}
+ 
+ 		if (bgp_debug_neighbor_events(peer))
+@@ -3145,12 +3146,13 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 			zlog_err("%pBP: Capability length error", peer);
+ 			bgp_notify_send(peer->connection, BGP_NOTIFY_CEASE,
+ 					BGP_NOTIFY_SUBCODE_UNSPECIFIC);
++			pnt += length;
+ 			return BGP_Stop;
+ 		}
+ 
+ 		/* Ignore capability when override-capability is set. */
+ 		if (CHECK_FLAG(peer->flags, PEER_FLAG_OVERRIDE_CAPABILITY))
+-			continue;
++			goto done;
+ 
+ 		capability = lookup_msg(capcode_str, hdr->code, "Unknown");
+ 
+@@ -3165,7 +3167,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 					 peer, capability,
+ 					 sizeof(struct capability_mp_data),
+ 					 hdr->length);
+-				return BGP_Stop;
++				goto done;
+ 			}
+ 
+ 			memcpy(&mpc, pnt + 3, sizeof(struct capability_mp_data));
+@@ -3180,7 +3182,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 						   peer, capability,
+ 						   iana_afi2str(pkt_afi),
+ 						   iana_safi2str(pkt_safi));
+-				continue;
++				goto done;
+ 			}
+ 
+ 			/* Address family check.  */
+@@ -3207,7 +3209,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 				if (peer_active_nego(peer))
+ 					bgp_clear_route(peer, afi, safi);
+ 				else
+-					return BGP_Stop;
++					goto done;
+ 			}
+ 			break;
+ 		case CAPABILITY_CODE_RESTART:
+@@ -3217,7 +3219,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 				bgp_notify_send(peer->connection,
+ 						BGP_NOTIFY_CEASE,
+ 						BGP_NOTIFY_SUBCODE_UNSPECIFIC);
+-				return BGP_Stop;
++				goto done;
+ 			}
+ 
+ 			bgp_dynamic_capability_graceful_restart(pnt, action,
+@@ -3243,7 +3245,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 				bgp_notify_send(peer->connection,
+ 						BGP_NOTIFY_CEASE,
+ 						BGP_NOTIFY_SUBCODE_UNSPECIFIC);
+-				return BGP_Stop;
++				goto done;
+ 			}
+ 
+ 			uint8_t role;
+@@ -3265,6 +3267,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
+ 			break;
+ 		}
+ 
++done:
+ 		pnt += hdr->length + 3;
+ 	}
+ 
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.bb b/meta-networking/recipes-protocols/frr/frr_9.1.bb
index 7043cad0f6..7c1691259d 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.1 \
            file://CVE-2024-31950.patch \
            file://CVE-2024-31951.patch \
            file://CVE-2024-31948.patch \
+           file://CVE-2024-31949.patch \
            "
 
 SRCREV = "ca2d6f0f1e000951224a18973cc1827f7f5215b5"
-- 
2.34.1


