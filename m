Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B451E103A9A1
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 10:26:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19005.1774434401728745505
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 03:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cgqvMPmf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75449cfe7a=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P6W6vm2152221
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 10:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=pi+z0u2ac8ciRj3jXB5LhCfkhmpHSNGEtLlfUpPecL4=; b=cgqvMPmfL74L
	tc/wbCQ3ybig+UIrttnHgUkKnD09WqhpugHAdo5Vw5FeXtvH+LBmLxnJJv1oXCN/
	uFOC/zXDmx96QTTxsDcBerdhQ+2i0WabD488RZHDvYsVV72LABU/3hoH1u0bxhGj
	TF4DLr8gWZTZoWk0Ji6YOasPH3ouYDfQQycQM/BzWNexHwsaq05/LWx1dasO1V+6
	Q0VJRONEktVQPK/Qc+wKsNOvW57J2Vd5VU3b/MvEsJ7RmUTH55cqfIilNlxyoyaj
	MGe8Tm2s374QahSarcVVSldKeqbZ8olD++jD3+yLV0DAHc24twn569QCWadwCRkw
	5d6S2WhGbw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6vt5f-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 10:26:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bN6ybyTx5clBK2sevAp0Q6B8e8LXGCi6AdlDFmxAzdBEZ+K4Kb3tKBrJ0LgGVWU7dvquepTAh2JYqk/JdrVU2JzRfUDPkmFPYLSepzm5IlodgjaA41/VXrfUdBMNreZDwNq5gKERG2KbKUOspCSz1YC9oE+al8ZXDxxh+ARdudizQmRAE6ThJP5M651SXP9w7ZN/IWkPyFgfPHcNWLuthuKrPfxmXt4/tClsZyxG3gKiemJ2G1dGylb5j+j7UjPP6gVERVP6E0GHVHgcBuc/mOcEPv8OiLlIzwAtIoKHQpHNgQ66URN0HDyvlFsDuW8fSs6lQXnHISUU7TGMZSfjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pi+z0u2ac8ciRj3jXB5LhCfkhmpHSNGEtLlfUpPecL4=;
 b=dcW5DwGMLpOvTSRy8yqIDfe2LuH/oRMMDhO8NuJottYBrKORrwlSBb+g820Hq7up+4KFUcnQvMMRX95wdndLUfSNllOO6Ht1r2pAZNcBXIHRTlTYhicbR/hNQSMar+fg7QWJFZHcJtejd7lOTrk7FjBxsw3dC69Gx/pK4J0gV63EIanA8w/7dT7iQ/FyOwqmP083LyX/18kEZR66QPBineH9Mk9bajVecYXuVdLb6cBrUDlQeUIBjR0i4fFZsEIBaicv8jV2B+ze907+eJ6FzW6ncxVNOJ3wxht1j+02HvphLSmvtuWvPugLJaXgUGFWowQ8QArRdXv0eWehi+8kBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW4PR11MB7055.namprd11.prod.outlook.com (2603:10b6:303:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Wed, 25 Mar
 2026 10:26:37 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Wed, 25 Mar 2026
 10:26:37 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/3] libwnck3: upgrade 43.2 -> 43.3
Date: Wed, 25 Mar 2026 18:26:20 +0800
Message-Id: <20260325102620.1901081-3-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325102620.1901081-1-peng.zhang1.cn@windriver.com>
References: <20260325102620.1901081-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:405:370::13) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW4PR11MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: b7780b24-0d08-4465-e000-08de8a58fceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	kqGlD0r5VaXqQl9IpHiOqAIloBpozzYpy9l4YIuWD5Auim6iEx/zVFFNS0LCWO1LZsSeSwX1+lRVrNBrG3b/ntud55QR6PiTICvS4tneByI0OUE6UgiE4cXowqSJ/1OTGVitH/BjW9gABHZ0iW5stqK8UShjZS4b+mgcEpUtyJB0WM4CQC1tS2nsO8v+0WQftNDN5B/RKe7gycJBXJoLk/O1RVMb61RkJOvwdEggCed4031jXoPJnSkXDHPDcB8TBYCcjfrkT76gh2ZVEjmfmffvaNwpx1rNqTDsnOBTbMz5TmW2igYNXaA8S9PAFHdhg28abIWufSpkjt8sk7OPoBdqdyYx4/8XfnmgVq9RnET/7OZaISvXbubONBPXDxLuuQcJXsTaMEat4H6E+TR+xrvfxQ6nxe10ROCVJFU3XADx0FBzeyjSXXh7q9nmccTDUKTFquKIoYhGgHbnFQszufF3naxEKn5nX7hQhKoEqssDxeuZOdtUq6eG/NfQFkk6wV9J2lvs8LA4qrGbAnJLFnVjIE1UQe4kwV33xywmWzLzRYeT7RiEZx1BBuYj8i2QpKLgkf3YttS7kCmNJ9qUDhUZhfG2LqpZyne3PglVx8rUBO0HBv2hcPqUsm9+wYKU+gIGhFy7r9EMQh6Oe4js3f3tDYkFK72RDTLajYjrHlzuiyomruiO+XpewpNuj81rxPvGkuI3tmcIihg939d6edpDL/dKoquYHmF/kzrtgBdEle+SGW9fA8MdLcSm5YFA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5bClB4jyDMwE+fs0/rcid3t2ehZpSk1zL0FIJ6T8voFwxBfRm0vBlXevABPD?=
 =?us-ascii?Q?ZkCMzjEUaxXpaNcpwVzNJ3orYNvHfgsseswwsgwhZi4drtouANWDu/RnzrkM?=
 =?us-ascii?Q?hD95tTSzynzyj9CiqsUXCioZjCbBxokS26yzW8laMJWMBO6ojOWc0p+u1fhl?=
 =?us-ascii?Q?u0jTW0zaev4BzZVeADsCUbZYirEvfdjF/wMNPrefZIJsgknXiMXNMKsdTQfM?=
 =?us-ascii?Q?qaYfsG5C6iHXjnO3MHFyLonHuRGfpoy+c2CTdPbvWoPBIXEhdgZQJf9L0/wQ?=
 =?us-ascii?Q?TY7cVCqvf67rS9RHVjmFANGw1WZkpYE3iNLnf/DVfshAgMS4yzYmqf3ic2m2?=
 =?us-ascii?Q?jOZVz0XPfb6aI/HPbKV9yFbw19KhlVqsSrTeLvTRqdBCjLazMcCr+NhfAbp9?=
 =?us-ascii?Q?FqqTAr6R0vlQsSZb7Itq2HynRvbo53L22zEQCJuA9cRKI7dcmKPIjspJGxeF?=
 =?us-ascii?Q?KtmyMf1PFguHV2batkjd7LSD1MSOhhAJCjNoqrb85ZL26otlhrl5htlk+AHC?=
 =?us-ascii?Q?nTZfGgI2+oRnxw6FMproJobSgjlV7Owv7ogxu0b6zlH17u8bFhZU7x43Q0mu?=
 =?us-ascii?Q?AEUwfAv/DdmYZPyfQ5GlUUusDAp6XTzj87qrRICWTo5av7BRY/8kq+PzSOwF?=
 =?us-ascii?Q?BKGd9s+NEaVH+anfFgb6YbOEow8dSh/VhVZ+JVVO7Pnbc20M5zVDJ5EIiEZh?=
 =?us-ascii?Q?45CfqoqvDfixO93mUNYtJd9Ca+ECPckMnlrf7GN+HSJ9F/gNIA2i5ftjjaT/?=
 =?us-ascii?Q?N6eTxKA11JqPKGXTnFAbZT+y08WM0D9ZS+LLeQzT+CworHJVN8uusiAEehgp?=
 =?us-ascii?Q?PkbxmOwk6aVyx2kIyCSVRHcqrI1fBA8bi0x4iJ7qZPYstpMSwK7wlwjBaZbq?=
 =?us-ascii?Q?0seKuV4d2ygQzioyp0nRjRK2VP/7EJ90HDoV3DmX9/Iv6A6+gl4lTm4MuHzA?=
 =?us-ascii?Q?G/ogxNWENUEki6Sk6UT0Ygc3aQ0gUAO3OQGUsbLC0OeJMJ+6xzDyrgKNREfR?=
 =?us-ascii?Q?r/m2dgfLhqq9Fc5KPR8iYT8zYSzZaUpVZyWoBAOsHqJydmjBVvuJlIy5HmBd?=
 =?us-ascii?Q?XGaKn2Df4bmsd/cG2JBNYjiyG8McQsnDxB8f4lFKevKFHyITPXRG8RdC/i/C?=
 =?us-ascii?Q?nnyGONNSGwMguGWL71a6JuwhH5xZbTz/Z3cFLkHTFkeDDaVygQep8/VSP8AG?=
 =?us-ascii?Q?XrpwlE2FHwxPhn5OmQuiG/AWfHmg9Rn4fEf71vt7ijUHeRAvTiz0hZ+Z6rVh?=
 =?us-ascii?Q?GwW1PsJrVzEFHZLF9Abxz1H63ARhsHamP8g1tmwOVUvCTF86+xj3g9bEsaWy?=
 =?us-ascii?Q?RYU3ssVMzc0v0ISAQUJgGnWQZjMXqiIJwQQssf//RHT6LcmKSc+Bcvy4BP+z?=
 =?us-ascii?Q?iIbqm3+nlLp3zYbePu1o5/QMX8lp9lHpzNqPzRxX0qIHNPdrc1ZwMV8KJbYA?=
 =?us-ascii?Q?YSs4ELs1XE/Ab1dV9q4yLWY1gZFBgoZYIjlmjfWQc9JGrjRtRqe1cGbaCaBp?=
 =?us-ascii?Q?Lu14pkvdj4Sp2oFayzH7elFE/O7CpDXX/F1misj84Eeu2HwkIo4d6p70lVcr?=
 =?us-ascii?Q?6WTyNlh2nsSVAWibKoMyhyB6VOrEdD2YD8MFZHCSzlMopamUmMtDzBpqCgdG?=
 =?us-ascii?Q?el4DfGDmV/WR3P6KQAIFB+huoAjTaQKnhvX7SBx4VkBawTARWcDxGm/PE+j/?=
 =?us-ascii?Q?iY5j4LkgVdztDb2khWwyZu+mz9WsbezqqkmIeM2uFcPzhFEYL3NrOeLVFjnn?=
 =?us-ascii?Q?fttfiVhHNGLxxIrq6WghaKYCHSNvaxQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	PwJEaOtsqGFZA8trDm32eIHHVQu2yCSZjvW8ELk8TpGr7jIjN2OP9N1rWpdo6qmnQWl3LtBEYKC7c4ufRONVd1juUaV3BQrjMJo1Wb5+GE5g4dETa19JSs5mHiTVrN6WAW4ncMeGZVZKQ1MUsQbMeBRwC02hC6M2iu0TxDTu303nBRZZckNw1taLgfwnAqu/iJXaENtgApGEhFrqPOKNeaKzc9nokZcVKeT/M7PfB+8Car4581RYwe4ShIGVMrSkxF5bZyCbzK919JO+NdZQweRrZFRNhNSJCGrAhuwtPeTmvtjn2DY6MzfxuwkfeZhwt0pBdpprXTGJrlBFGm8NFw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7780b24-0d08-4465-e000-08de8a58fceb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:26:34.0562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzZCiJUdvYttTD4OgsMJdCK7YLIpdgDT/S13wU4XrmpHfbAn6x59iSYj24Dd42+j5E0+S8fNsn174IjrrZG68UxBqsXhMkwDa1XYpgk8guQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7055
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3NCBTYWx0ZWRfX1G7psN4Rwrm+
 2wmgl4NAY4FdfjrAGxoaDF6GFBf3vAif8+Yv7dT6dYC+ew4ZLcLtcuDJ8i/t4iZrMssgk/4wqhY
 kauQSbEk3NxVLF8oPaIA48rbLEKi9ClOnkTkVNQVZW/nUXLn7YS6/X9D+thjAsQwPURh4fOqYkg
 +OZ+SbLWn6v1B6tJ0q5W99C8+IOaPP1Ux5wpfc3sh43bDHvU+LvcJ3vC9aNTd3TgRIa37LUX1bi
 +r2A2Ljx0hELpy1CdiUnaZXE6BKB5jcH7trOrteJhYdCTsTot1hD2Bihv4B6cPq9gINl1tjdztu
 GEVzvwTRD+idMHaP1cZVlPnoPuYQQx3prDetdSk+2nWmO0s5q9/hcBlfWFjGbroidJ+EumZ0juH
 uOpnZPlhKpsT8ZMtqY1z/tPSsdXsTo4EcT07YL0EPiS2zdnH8ivkeWI+56kRczrnkykQu0RfWSl
 z1EcltsKPPyqrihAMHw==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c3b860 cx=c_pps
 a=LPv6HZ59J3TLgKTE/qPS5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=aiIX5UjjAAAA:8 a=PIyYbEaFYT3du45fyU8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: sVpbwzc_yoNzOV1gQihgpWEK_DjrUJs1
X-Proofpoint-GUID: sVpbwzc_yoNzOV1gQihgpWEK_DjrUJs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 10:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125606

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Version 43.3
============
  * Fix clang warnings. (!66, !68)
  * Fix regression with class group and application names. (#166)

Drop ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch,
already included in 43.3.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...40d59c32d7ebeb94d242436e3144cefc174a.patch | 40 -------------------
 .../{libwnck3_43.2.bb => libwnck3_43.3.bb}    |  5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_43.2.bb => libwnck3_43.3.bb} (75%)

diff --git a/meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch b/meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch
deleted file mode 100644
index 2d526e7aba..0000000000
--- a/meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ef0e40d59c32d7ebeb94d242436e3144cefc174a Mon Sep 17 00:00:00 2001
-From: correctmost <136447-correctmost@users.noreply.gitlab.gnome.org>
-Date: Thu, 20 Mar 2025 03:03:44 -0400
-Subject: [PATCH] build: fix -Wheader-guard warnings reported by clang
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libwnck/-/commit/ef0e40d59c32d7ebeb94d242436e3144cefc174a]
----
- libwnck/pager-accessible-factory.h     | 2 +-
- libwnck/workspace-accessible-factory.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libwnck/pager-accessible-factory.h b/libwnck/pager-accessible-factory.h
-index 8e2fe30c..25220fc2 100644
---- a/libwnck/pager-accessible-factory.h
-+++ b/libwnck/pager-accessible-factory.h
-@@ -17,7 +17,7 @@
-  */
- 
- #ifndef __WNCK_PAGER_ACCESSIBLE_FACTORY_H__
--#define __WBCK_PAGER_ACCESSIBLE_FACTORY_H__
-+#define __WNCK_PAGER_ACCESSIBLE_FACTORY_H__
- 
- #include <atk/atk.h>
- 
-diff --git a/libwnck/workspace-accessible-factory.h b/libwnck/workspace-accessible-factory.h
-index d2d4a84a..335b465b 100644
---- a/libwnck/workspace-accessible-factory.h
-+++ b/libwnck/workspace-accessible-factory.h
-@@ -17,7 +17,7 @@
-  */
- 
- #ifndef __WNCK_WORKSPACE_ACCESSIBLE_FACTORY_H__
--#define __WBCK_WORKSPACE_ACCESSIBLE_FACTORY_H__
-+#define __WNCK_WORKSPACE_ACCESSIBLE_FACTORY_H__
- 
- #include <atk/atk.h>
- 
--- 
-GitLab
-
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.3.bb
similarity index 75%
rename from meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb
rename to meta-gnome/recipes-gnome/libwnck/libwnck3_43.3.bb
index 13923a3e17..3a49c0e2f3 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.3.bb
@@ -19,8 +19,7 @@ inherit gnomebase gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI += "file://ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch;patch=1 \
-            file://0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch;patch=1"
-SRC_URI[archive.sha256sum] = "55a7444ec1fbb95c086d40967388f231b5c0bbc8cffaa086bf9290ae449e51d5"
+SRC_URI += "file://0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch;patch=1"
+SRC_URI[archive.sha256sum] = "6af8ac41a8f067ade1d3caaed254a83423b5f61ad3f7a460fcacbac2e192bdf7"
 
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.34.1


