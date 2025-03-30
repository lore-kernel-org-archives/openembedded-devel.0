Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4FEC28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 09:21:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27612.1743326455073408909
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 02:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61843d4d18=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U9KT2F020116
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:20:54 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p7u8ryg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:20:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twWHl5MaGLRf0cQxUTIR/XNfCdj9ZYMkT44sYx/qJ9AbKpaIWyKtvxxS9u+7eWydmHcO1SLJtUtTlKepS32lg6ebcxUFsM4xRD4PJG5k2fO8SUAVlYQKsPKq+mmHWoHRb9KMhwb+cqks89u4h59UqFpGbtwP5udMnRDQt68zCztppDpr4M8251ol/fNnVOQTLKWY/ruy2NDH2VTWOSnRF39hMtDRZ1p9fLPVRkBj50TLaVDRpHO7fOT2Fi/vYv9YA5cc0ERM2eanJyujVLQJKNyjXmrKMogBUdNmShq0mVY5Dfv5V5iTNTbx5urhOSmLM8EkplSEUe/Q6rBF5ck47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGv7VIOvutvctfHIPiraiyCSbB2HmnJ+aey8ZtH8UJA=;
 b=DSaLoGeE3fj1rt213gMBO9URCF9VTdnvdw7O/tCgP7+kUjudv+n3Da3emOoT4QOsvMzpW2+0S0S8wIlGBvvqaV7H9VJqWlj07xpKmQLeGqrkZ1ad0RAhSmTL53b2lClgSmGo3ZMOgs3A6Q2Hma8NJecY6Qe4/6J5R+x8JS0CvdS8yTBSRKIVdGHSGec6tgo78D6hH+J1YSijYqvcVe9v10xgyjyDjSA/hZHxgD3sOnBHLa0PtqGh1OaOELlYAkV2QcxFyCWZBU4kNokLtlEr/B38/JM6xfnthXTeRGRCqcA/9oc8u2KNlYQJpMMznsk7Q2+pxSUPT6rnhK/ow//Dkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sun, 30 Mar
 2025 09:20:51 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.043; Sun, 30 Mar 2025
 09:20:51 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/3] frr: upgrade 10.2.1 -> 10.3
Date: Sun, 30 Mar 2025 17:20:38 +0800
Message-Id: <20250330092040.1267913-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0196.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SN7PR11MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: e3499683-934a-4048-7da8-08dd6f6c29f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tI6WgRP+LPx55Uk7E3tJCHE+i6xcy10lNI0RLQ8VDuxoEsJj7pCZpGPhbmz3?=
 =?us-ascii?Q?0CB1tOjGVb5Dh2eqUFLUfiooTQCkRDc1ZWzfLMKwA68CEc6lEfwua6Z3Vycn?=
 =?us-ascii?Q?aneFA+kYBQ09rWmS8vEU+/6cD2wVTH73pnqJcpFJOr1V9GPbIRaASD3XW6XE?=
 =?us-ascii?Q?JBE2BHCTdVXbwTFA3C1tXF5y0ne+xQSrZg9uNgHj3jQ7DPxbGDRQKpXpAGrw?=
 =?us-ascii?Q?awkSU8PpyaXIT0bkUb4hrVtSL2Nn2f+T71rdbfV7eMWvrZ4KrluzlBtBG85s?=
 =?us-ascii?Q?vf6/AedmizKkFgS1sEzQX4IYaBetY3VcGoWTKGHNQCm1hqGGqvawL4MuQfjv?=
 =?us-ascii?Q?RMvUedqqAvKrZekwEjbz+VWN0epukNr03FM0qJA+zPTi/Rt0dk165sMVCFmV?=
 =?us-ascii?Q?m3DydQ4yFwrWEV0ZY1gIzazSmIeVwZyR58FpcsX6xkFyS5J55/v+OL530kJ6?=
 =?us-ascii?Q?u/kwZO2/cfzYIAJGpxwf3G8DzNS7WkynA9BFXmB7NgnyHziZQ+chxVmXcW7i?=
 =?us-ascii?Q?V+wzQm8OszA89tCbvGfms3pffVmjI6zIM+84oLJ7CbNbSlgixD+q5+sG1soW?=
 =?us-ascii?Q?H1V5YVMG2BhQhJR89+1SVOCwRqMzHDDiSQpNkR5SnKrp6DWlxaDKL1lF7HSa?=
 =?us-ascii?Q?8QekLHL5kQ/c9R0oCveyhvyzy4bsBRaOcrf5UWD4XrllXNgkclUR7C4J6+dz?=
 =?us-ascii?Q?zHt8v4pI6s3bJEQZz5LYkFiPurGFs3z4ZqYyg15flf/Wl7qVtDl2Z7lCFIE4?=
 =?us-ascii?Q?6meMOidinj2KlMxja42GBsZwpKkrQxHRqUjyh0Mn+PnUdDNZcQ0FbXoT9BpC?=
 =?us-ascii?Q?ILljJUNQkNZtsyDCUpVk8BUBroWke5G1vBKblMmYeEbysrYj5c6Bo1mBPco/?=
 =?us-ascii?Q?8z46FH+6JTVdzFQMyh+Ju2kjdq6djQhNhOrD6n+aXCV8ELyigVIciE4+TP11?=
 =?us-ascii?Q?LEee6oy0/+Fx1L5zsDWoBudLAMBwSOyR+uC6VCH3PKr4allEDKcqKZPOl++G?=
 =?us-ascii?Q?Hiajrz/cSSpvexhmbotCDV/iTBncN387NEgVmPqTe7HHGl8HN+EyfSZLfy1P?=
 =?us-ascii?Q?95UpjsC0ITjBZ2cSrDkIWfaEPTCQE/Q67419xfxj+tLfXR0arSDsrXHGotqp?=
 =?us-ascii?Q?UGq9wVnJABx4urfnTGJySrM8D+P6Yh8CIPirNHlbxRXaF1FadZU56n+sbrgb?=
 =?us-ascii?Q?tN9MWImK0yyiGU3uqvkTNxDWrWAxRd+p5syA+XJbTCPNUVqFPgl3frTTD+bU?=
 =?us-ascii?Q?xeBeOLDbz1TBaPcgPQw8bwcgZgZ2da71tEZWEZf1L68f/YUrq+yhxa3tku7e?=
 =?us-ascii?Q?VcwtCy9WT5+5Jgj+7Ud0WM6AGBAEBcoUL/JjaQJns9U0A5UKm5HL3ZIcx4JV?=
 =?us-ascii?Q?X7nXBV+pI6pQ+KiumtZyXiMU18aWzgZm7NeL8+sGyOg055HVZYzcKY7sviyU?=
 =?us-ascii?Q?H2S2UW4pCCpiO59fo5R1P7QLjCRiiZqC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vEiVKmyfhSOnSN9ks86lsGDKE2fP95A/l2JN6wYKO66ss5qL6g+mXUVkhjjg?=
 =?us-ascii?Q?3l0pZYecd9gEbjcbMuA6P/Tbz1RN/blNhjTnCEQZF4cMHTG6vP3wKePxxvtS?=
 =?us-ascii?Q?w5D0LDGfocmMM+lLHcHxYqYh0wvRA8ByIG1dkBJaks6HAdocUDqGDkLS/ua8?=
 =?us-ascii?Q?7iyhWsVqCXnbAlCmm4uPuaZH+EHrgUZCjxStdj6J45dcybeqlRtADRO13mfX?=
 =?us-ascii?Q?bczxbRXq+fpBB9KAjS+bRGEEC/puFoDTC8AYCr/YiUJAzUIoGtR/A6aFqtJ1?=
 =?us-ascii?Q?UQdzdTvVE2w9171WY5wyBBrV/qe19T7YyOZ9/k5rglGmAWl/RBqjueJV/yNY?=
 =?us-ascii?Q?L46GeNWxnJzk+XGR6XjPeGhbXpx+M7p9KI6gnuJzHwE+7Ew6Qcbk9Rqu3RxG?=
 =?us-ascii?Q?Dmj/b+s1wEPGyNZK1FoFL0So4z128dI6mrUTwr/aY4QlO7ewhx1kOUOQs1Th?=
 =?us-ascii?Q?kSK6a2W3Ql293gtBs9JqbmQOvD9fpUUqFzOMCLFF94p9iCL2h7W/da5+tZyN?=
 =?us-ascii?Q?JBr94AnIwJJsPieyp/NirSJ36LEOku2lGDZLmfvWVPmvk075uuUVTc/o+2GU?=
 =?us-ascii?Q?ZpfPn/wKQRdF7fSzvR2tYbrvRXFlisgkNAZCEz6ALdEVPmPa7onY0qjn/p9/?=
 =?us-ascii?Q?QhzWqSajJlz05USScFk2ehLtTCcOrLIL9wsMMTvhCMn4ukPyNrBuKQRDkLSS?=
 =?us-ascii?Q?pM23tqUXReB3azo/SjCg/FBSrrFtrMvzqta9HxV/0G2xgNh7CBi5hXDiaUVI?=
 =?us-ascii?Q?W8zImfQJRZOlSscz0cDjU7isa9UmcQtiQlySH3ZLHjwVpbG1zWpILFVIr7pT?=
 =?us-ascii?Q?uN9COFd3bRmx6LdMAbbXM9vH7ObN8eE3KSyQzHxFVpCERrwYR8LH0LRjrWs3?=
 =?us-ascii?Q?PUbDJfVoTvhfzRGvNfkk7IHUtiIYVnxEUHmCASYyaZ/5AIF+K5seiEq2Xnlc?=
 =?us-ascii?Q?rXTv37JyTfuPrvbLVrrjE+auTLXc3EtqvtJbqDW4V7WMvr7Z1a6f9bs7Bjoo?=
 =?us-ascii?Q?nUuwqQT9jEtCR81qoGKdP/G23T4gFkIVT1/qUgU8LEpFXrmXBWka5EQ+3Ym1?=
 =?us-ascii?Q?ck9gUYoYTZOxpbr1h4U6ExUO+8Yfdp1kTQAy4eE/DFScf04iEae5Zdo17gn1?=
 =?us-ascii?Q?3hap6Y7HXBQxSnKEo80tHqLvktzje80ONpL3rN4QBAS4WQWc/pzCxaWIbljU?=
 =?us-ascii?Q?qesGbPGplooMOf+rm6A60R/XHyGRCyvq9cJQBpXJNpIUXAgkgJEiyGHCRcfe?=
 =?us-ascii?Q?jK/fB8u0IpohpPj7kRDzT2Tm5xGYyKlnN9seMHPcplYBMBxK3PsHkhnrVHQz?=
 =?us-ascii?Q?OVfpdhRLM2zPjYGY7YmMGgUWMJkHuNqwhNe6SlSl2GNZ3BleQhmqXm8ILgUt?=
 =?us-ascii?Q?mxL6W7o1IRnThgRF873xacFIC4Juu2VyXlInyxD9fwprhGrbBElLhTxTkhvO?=
 =?us-ascii?Q?sXi5D1XKFJFzBwLMIZ6rSJT5H7JTe56o5c4OzvUr7ZYZvKXwTtTKzqj0GcQX?=
 =?us-ascii?Q?V1Uu60ZjUOrUUIpQRw4bkn2anzsSyTdKUk/p69bLKUDqFqNdSX3uX7UxzrT3?=
 =?us-ascii?Q?S79S+ctX86Iwro+7dtrBxLj8pdx2MLfZQWiMeAbB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3499683-934a-4048-7da8-08dd6f6c29f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 09:20:51.0861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W0MjgUB2bRtJYYyHDEicF9Uqm9MCZXBNr+q4juZZy/+O0AwyJCVAshQRRrYsNvuynXz1dQIAR4ixWYk4CPVQBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7420
X-Proofpoint-GUID: mkq-j0CuZnj4hkyOdMsZFCLq7C8z7s95
X-Proofpoint-ORIG-GUID: mkq-j0CuZnj4hkyOdMsZFCLq7C8z7s95
X-Authority-Analysis: v=2.4 cv=RNizH5i+ c=1 sm=1 tr=0 ts=67e90cf5 cx=c_pps a=G0EMd8eUBd5ElxF49Cdl+w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=90Grjx8Y4JSb4P2HAaoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503300064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116376

ChangeLog:
https://github.com/FRRouting/frr/releases/tag/frr-10.3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-protocols/frr/{frr_10.2.1.bb => frr_10.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/frr/{frr_10.2.1.bb => frr_10.3.bb} (98%)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.2.1.bb b/meta-networking/recipes-protocols/frr/frr_10.3.bb
similarity index 98%
rename from meta-networking/recipes-protocols/frr/frr_10.2.1.bb
rename to meta-networking/recipes-protocols/frr/frr_10.3.bb
index e6b35f6d75..be2d986fc3 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.2.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.3.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
                     file://doc/licenses/LGPL-2.1;md5=4fbd65380cdd255951079008b364516c"
 
 
-SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.2 \
+SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.3 \
            file://frr.pam \
            "
 
-SRCREV = "5f0beaa0fdd00b7a60c1765067d1b6fa65ce96c0"
+SRCREV = "85cf1ed576deed121751e16a64970f8a652a9e1e"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
-- 
2.34.1


