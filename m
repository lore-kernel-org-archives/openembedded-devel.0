Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18398CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:17:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45991.1778491056222476191
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 02:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EXYE+zMY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9591002d8a=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5e1LU3079746
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 09:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=uBpA+gy4KrDfWSaVh/lN
	MWwAACer6J+W5pABp4IIJEU=; b=EXYE+zMYvbkzQcRDpwBMe0LRj/L39IyKLH6G
	d3zpbaPKlteZdH9NWtzViTequFrWVHOxJNC3z151kUO9cEXL5cDP2tQ6/+L16WmB
	uGUtr4ruv18HkBcQiwVbtqQr3kKo85XfDmN89TCaQbDrgdXIdXPqse2npokEtlTL
	gpjIPnzODhlg6xwJ7diB91oaiEfqbzgqZ+K8JTVKDk0QzuAkb9h6UDZFoozK/0jx
	HQpl7msVvkGc3tdeyHiKCq2pTOtH/e56BnjKGbUv9omyAJEkVXsI8VSjNXiEPiQO
	o7JQSeqfMswbx/HiR3BYyX8vS5FCKMO9zgolmMoS/9SgSQOFOA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1uw6hspp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 09:17:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROFbNAvRFd13OdNohUUIO4fGDGF2OhOO29miaDQFxmVbTuvxSR+C1yNtcc26hP3p6V5p4LDqwLTZeFeUyk0Ofb7SeA8Lp57U1sX3H2uKu+9zYZGAJKDiuJ39wLemjXt4ndf+IPwqW7kBP6UcDtR7mns0DIVtfQMHQdxi+ohQKALvnbgGXi59sc7v0OAdOtxGbObwhUDzKQylZlbFMxdi9TMomSC1HqGuH6k9yXbcxtwvJ9CV7G94PegXdi6FcbzinQ6IrMB/LPyoaiTDPFLRvDsxXRrQhFzrH6nSVeozc89ySu3JKp37SKHWFJqaFV9qdrpZctHb/bFv8Do5t8Di/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBpA+gy4KrDfWSaVh/lNMWwAACer6J+W5pABp4IIJEU=;
 b=IgfyfzE8TGIyBRG7FmYPEyMaRiRtc31ynkqQgjNuha1AZSy/7xuhKep+TGnnW8hBSsq4kTZSvkYlRBL3yAeRjw41ZV71JdMhuEzldYvg5Ygw2jLT7M00G0520OO5mbjBgVrVWSz3xBZqoq+5EmAG/Pe/0iQgDUjwKNe5ZACcy5QE+hO3jglwISivaY6JJJWbvJDY3lYLzXg8JE7e2Is0ELfJ6Dg/YuEWwlYwiLdr5h47zxvMBGfH98SDFFKA4fm2g/JyDLW8x2lH9ujVeCSgqbs9EmTbhCPIz2jAMP066x3kNYtQQ7ICkgASLlUgKUlTLWM+yVb5XvRUoqZvaWkhqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by IA0PR11MB7696.namprd11.prod.outlook.com
 (2603:10b6:208:403::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 09:17:31 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%8]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:17:31 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][PATH] Rename static-{group,passwd}-meta* file to static-{group,passwd}
Date: Mon, 11 May 2026 02:17:24 -0700
Message-ID: <20260511091724.1342957-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::30) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f8adef-f68c-4979-f3cd-08deaf3e2142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: 
	CTvX6kcdYzHflqiy43EdLSPwxvLvYYGmvmI5pxCdPh3chLlIFt/iCTz+rlh4TX440RzIEG7JGGUR887V26rfw1l72pcTmtZG1iUCDfMWb1JarXJcPl2u5j+mfRTiCmjJikkbEmRJQYyqBWu3CU049JVfWtaqoj5yJSuOs5jaGLMt80IJSeDa7eOskVEfR6OQZ5SV8LqEY9jj4f5WApYtPebezL8jJ/bjnyIQ8+caFEAgyPjQQqyxg53yrvv/qaufUFj+SoiSVcu9OU55H/gPgruyfiqTkV8Ytm0I8qhuS+A6Tm8dWxR5JSjL7mGZbcrkYQeAp8YPylfH4tPZhWGEtnU/7WQ6sR1hOrtNen/CNvPHQYu9djiTJt2ho+9OHFOvNjWkKSVKfPkgUEzdot/txdIey8xxQKtifk+QNx1KGSvxptJuXX3vtrKZAejwU8qtRWBgmL3FlQrF+T6Afb8UWbrZidIMphrT8rLyLYI3VyNisuMU5K2n4yh/r+We+eRWkNwcrYiZzcccv++Z9yGKA5VfJ6TXa2dQl7ABHTYufi6ZnPPPFnYenLKLk4mhpHzGubVOwMs+xWlvByw0gmBKO2DNTws6yP3zVT+MuBvd0yeuiczkBzp/QXKjoO7oKk1bTqVLbDbnWSAP5d/Brq74A0RNf9ywyZPo/BL6rSTArQkKb3KfDWbRp2DBjyCQmnULvRzowr0v+ifycK9c42xXEw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2KRNoxc6yImbwHYfFyZy6iDqpPjbypq4AAO/Y5PVaDqFXRWCcU9Tj53YUjui?=
 =?us-ascii?Q?Y4RCRXud8VRoGY+MLhz7aDAvZm31A9Kg3y3tu2I9SwkF7k7CpnOSTz5IREJV?=
 =?us-ascii?Q?1O8kKP2Qe9VxIevqGdhHmLd2ZkoOcDXBYlVNhj7G9gfwDoC4I3lHlTxZXdwV?=
 =?us-ascii?Q?KVWRGAgXkhJ1crAH86fTgcDiUdQxCVkbqQK/z1u7WdaDtrvt6PTuGiZl2DzS?=
 =?us-ascii?Q?XSC+a+s8RwtODNnZi5PUslLmDZThpZwlTAYvo9NWYfksA2bp5yMO3aiop/tZ?=
 =?us-ascii?Q?6O7CyQvjNsc0vO5zyQVVVvi7hoMw2kJuvC4EAIhLUeTXaj47QrAzY93uTUzk?=
 =?us-ascii?Q?PfB3jqN5nVq2B7QqY7cTqmgruFmq02JuIH7uon7ZzBo1pOkRxJTgxzfznxES?=
 =?us-ascii?Q?MbWAgJ8jkJUbwPDXNHs2ffgai1NVnzuBKddpXgOfXYwlguAOFiJHkRcXwrv6?=
 =?us-ascii?Q?wfh2mcPJo+dnbHVLHzQWbB+lVF1EM5SL8mp6oBENAT50Tipv3PS6U5SyBwm0?=
 =?us-ascii?Q?ebvXgygShZMDt/krxNhVtpoTGeVk42gh7V63ox3NJTsBF1UnLjSHCeZmMBXW?=
 =?us-ascii?Q?Ny3eJxMdcxVFQjJxTrTnUXPVwxQQcKDNyACw/uhaQBsL+noUVA3TteF/jN9d?=
 =?us-ascii?Q?AAYGtUSGV3ynO4l7OQ+hLhaJwSAKnOt17ppjb+JwVgP5OYxc+sMEvTbQ6kQ4?=
 =?us-ascii?Q?ahSQ9IsyKvJ30pEfB8RI4n3LE/6145iWQZvZeZcIJCPIO2TCgecWRmChS8TT?=
 =?us-ascii?Q?domRr5EPjNoWpDO6cmrSArwxauV4VWHpTaEwZAwMYSLVza3L4eqkSQko+E2I?=
 =?us-ascii?Q?kPzKgKkTUZy2sl4N2cn8QXzdtKW7dudnOpmAQz8fKsAm7XqZQ6CpemrpyBYr?=
 =?us-ascii?Q?kPkkkX1EHhppxNI7cm0Pj9AA01EqHZjc+X5uId2LxS2uqx3agq26h0Bhz4BY?=
 =?us-ascii?Q?bYXmg0NPUWSRpMZ7cs9/8h5JhpsinSp4dGsBCRSO0voX26IMX45nkVxyRH9R?=
 =?us-ascii?Q?3ixWXGvkS9hCinqasr6OeyRMvJ5a4Pv1kZl2RiKuOmHVHN/Xx1u1g8WA6/su?=
 =?us-ascii?Q?iTAO3AXio/m3Kg6naHEpT6XDEiZpWjXzwZl8FlMiogBdbcRHT7gGQUw954Az?=
 =?us-ascii?Q?OspSFClo2cLPenvjuVtoR9TnuxSVKQnyNvkZJrbEf/OgVJyfaqkz5DyHwUR3?=
 =?us-ascii?Q?A4UUIXMafpE2rshIrmTjRyT7l+Usb/8EenXh9HsjhE621kqZK7/Ab8r1Qn5b?=
 =?us-ascii?Q?5YUN1io0er9OVtxMapZcNSrAEbv4xF0p69qAv+Q2H+BHUTGf1iMljVU6Eb8S?=
 =?us-ascii?Q?mV+2NAE7SURkwYll4D+OKatkB9vsWzZ/Z+gHBiutE2rh40BKHZ7igAt7v3Jb?=
 =?us-ascii?Q?a1uYl+Byol2QI9HP21NcPePdy36GObLnmIINGvBhztmA8n5V1grgbGFoT2Qs?=
 =?us-ascii?Q?TeGuy/PVXjN80pjSUzYOymWn5c7DaDjeOKg3eAg75pu1nPC2IZu6J1hxrdbO?=
 =?us-ascii?Q?Cv+AmFLT27hoo5iuT6gyr2VkuWNuXboCoPYWWPSajS/kNEm67UHwSqCJKrDW?=
 =?us-ascii?Q?qY3gBq7ao6H/rhXP4XGvSERfkc8/+NK3p95JfX0Ce4/CcMjBPfX+bipyXxMD?=
 =?us-ascii?Q?xAbtiHDGxe/HmyfNusr0StwGVOixTdW9aZnxPqt21adU6vU5wwqDrFpzHEFo?=
 =?us-ascii?Q?o+dVS92VFPuKsTwRonosbljBH5WueasC7YCdFff02pLvh5456RBpple4kUVh?=
 =?us-ascii?Q?VEkYynJCht6Tnv0mTSMvadkjRVfdgTY=3D?=
X-Exchange-RoutingPolicyChecked: 
	CbLBFFBafbXreHGg+Fh96nrurpDPMgyfDI91Blf+C8AT9biTeRRE/t/E/v2tNv43fgrpCePE4Gd/zGpWzOOljTxCs7qspPWy8WlETV3c36tWWGUYcNuZRO4Y68gWvgrSXGX88AfXbvpIyq57uV21/t9mWbyEy0iwGPUjyMrAsgLjoV6kI3MpMYocHrS90Up07i9jUAWX5oPbuHcFZahcwkMzNvfNgboY1Y20e07rjc4zd1M4mWjiTo/3cyN9DMy27cXFvxH3+u94e9Zimgr9l+xomGBb3gB0TWhyVuzqqbMi9EnJ24PNF/ogE863hWOCUelEreZNQxT4SsFKzcdOWg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f8adef-f68c-4979-f3cd-08deaf3e2142
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:17:31.5202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztP10xcRDDBvWgm7n9wAQr1ljACZdfqJiT2gCLmsW9UUhv0267GrLxHg23tX1GDl+GBHy7dAF8E6V4uknbns7JnuZriAImjwvtLdDea3qK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwMiBTYWx0ZWRfX/kBWT70wem72
 vXyZg/790Sowe1INLnZPtXmYyDhobjfSjIPhYBEI3E8LsWg9xTjnHl5UUTEvoMLYeMyitg6LSip
 BdH8R+STgklVqXdGweIYodaNI71R7XEZyu0xzExn2Qg87ABbxAjHA7LDpuEkiJoWdRfsnK0s3oR
 1smBpqfbjJjpUhhx+mXsbWH6lLbCuWCcEn2mMPx1rh/LFPV3eNbdjMdZqHldALE6BxMRwzIMAMU
 N5gX0CbOu2y/7UaOcIiCBB+R82j0UA/bbxTdrmcy+nTOrJYQcRX9NA8umuIReEz3nali9s6nsup
 g5hG/FmWaU1mXjQu8Iraui0fhQgN6XBJ781oM2Atz8K0pdgxVJ0nf6HVqwifRc9rrWa66rnvjQs
 T3EUWm2yyt8QHGeELwPUBVTWWYEL7EEiHLDuWqMqOHL5vH9IsgPIubVIQMx7rMav1CT7xSjTViq
 Oth/DQ483uenE2UNQAA==
X-Authority-Analysis: v=2.4 cv=d6nFDxjE c=1 sm=1 tr=0 ts=6a019eaf cx=c_pps
 a=0w/E51Vap1Xy1BB5zk4tLA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=_-l2EKAX8Fjl4dTZGMQA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QKzaGcmUpafnI1ESJdZpBwVy4uNalZG4
X-Proofpoint-ORIG-GUID: QKzaGcmUpafnI1ESJdZpBwVy4uNalZG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110102
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126840

The config variables were defined in the reproducible.py in oe-core
https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/cases/reproducible.py#n243
as follows:
  USERADDEXTENSION = "useradd-staticids"
  USERADD_ERROR_DYNAMIC = "skip"
  USERADD_UID_TABLES += "files/static-passwd"
  USERADD_GID_TABLES += "files/static-group"

We can see the help document in oe-core/meta/conf/documentation.conf:
>USERADDEXTENSION[doc] = "When set to 'useradd-staticids', causes the
 OpenEmbedded build system to base all user and group additions on
 files listed in USERADD_UID_TABLES and USERADD_GID_TABLES."

In the useradd-staticids.bbclass all static-{group,passwd} files in
BBPATH will be searched and merged.

All static-{group,passwd}-meta* file in this layer won't be parsered,
finally when we run the following oe-selftest command with the setting
'OEQA_REPRODUCIBLE_TEST_TARGET = "mariadb",
>$ oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds"
we will encounter the following error:
$timestamps - oe-selftest - INFO -       ERROR: Nothing PROVIDES 'mariadb'
$timestamps - oe-selftest - INFO -       mariadb was skipped: Recipe mariadb, package mariadb-setupdb:
system username "mysql" does not have a static ID defined. Add mysql to one of these files: /yocto
/openembedded-core/build-st/meta-selftest/files/static-passwd

The similiar error for postgresql can also been seen.

Here we rename all static-{group,passwd}-meta* to static-{group,passwd}.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../files/{static-passwd-meta-filesystems => static-passwd}       | 0
 meta-gnome/files/{static-passwd-meta-gnome => static-passwd}      | 0
 .../files/{static-group-meta-multimedia => static-group}          | 0
 .../files/{static-passwd-meta-multimedia => static-passwd}        | 0
 .../files/{static-group-meta-networking => static-group}          | 0
 .../files/{static-passwd-meta-networking => static-passwd}        | 0
 meta-oe/files/{static-group-meta-oe => static-group}              | 0
 meta-oe/files/{static-passwd-meta-oe => static-passwd}            | 0
 meta-perl/files/{static-group-meta-perl => static-group}          | 0
 meta-perl/files/{static-passwd-meta-perl => static-passwd}        | 0
 .../files/{static-group-meta-webserver => static-group}           | 0
 .../files/{static-passwd-meta-webserver => static-passwd}         | 0
 12 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-filesystems/files/{static-passwd-meta-filesystems => static-passwd} (100%)
 rename meta-gnome/files/{static-passwd-meta-gnome => static-passwd} (100%)
 rename meta-multimedia/files/{static-group-meta-multimedia => static-group} (100%)
 rename meta-multimedia/files/{static-passwd-meta-multimedia => static-passwd} (100%)
 rename meta-networking/files/{static-group-meta-networking => static-group} (100%)
 rename meta-networking/files/{static-passwd-meta-networking => static-passwd} (100%)
 rename meta-oe/files/{static-group-meta-oe => static-group} (100%)
 rename meta-oe/files/{static-passwd-meta-oe => static-passwd} (100%)
 rename meta-perl/files/{static-group-meta-perl => static-group} (100%)
 rename meta-perl/files/{static-passwd-meta-perl => static-passwd} (100%)
 rename meta-webserver/files/{static-group-meta-webserver => static-group} (100%)
 rename meta-webserver/files/{static-passwd-meta-webserver => static-passwd} (100%)

diff --git a/meta-filesystems/files/static-passwd-meta-filesystems b/meta-filesystems/files/static-passwd
similarity index 100%
rename from meta-filesystems/files/static-passwd-meta-filesystems
rename to meta-filesystems/files/static-passwd
diff --git a/meta-gnome/files/static-passwd-meta-gnome b/meta-gnome/files/static-passwd
similarity index 100%
rename from meta-gnome/files/static-passwd-meta-gnome
rename to meta-gnome/files/static-passwd
diff --git a/meta-multimedia/files/static-group-meta-multimedia b/meta-multimedia/files/static-group
similarity index 100%
rename from meta-multimedia/files/static-group-meta-multimedia
rename to meta-multimedia/files/static-group
diff --git a/meta-multimedia/files/static-passwd-meta-multimedia b/meta-multimedia/files/static-passwd
similarity index 100%
rename from meta-multimedia/files/static-passwd-meta-multimedia
rename to meta-multimedia/files/static-passwd
diff --git a/meta-networking/files/static-group-meta-networking b/meta-networking/files/static-group
similarity index 100%
rename from meta-networking/files/static-group-meta-networking
rename to meta-networking/files/static-group
diff --git a/meta-networking/files/static-passwd-meta-networking b/meta-networking/files/static-passwd
similarity index 100%
rename from meta-networking/files/static-passwd-meta-networking
rename to meta-networking/files/static-passwd
diff --git a/meta-oe/files/static-group-meta-oe b/meta-oe/files/static-group
similarity index 100%
rename from meta-oe/files/static-group-meta-oe
rename to meta-oe/files/static-group
diff --git a/meta-oe/files/static-passwd-meta-oe b/meta-oe/files/static-passwd
similarity index 100%
rename from meta-oe/files/static-passwd-meta-oe
rename to meta-oe/files/static-passwd
diff --git a/meta-perl/files/static-group-meta-perl b/meta-perl/files/static-group
similarity index 100%
rename from meta-perl/files/static-group-meta-perl
rename to meta-perl/files/static-group
diff --git a/meta-perl/files/static-passwd-meta-perl b/meta-perl/files/static-passwd
similarity index 100%
rename from meta-perl/files/static-passwd-meta-perl
rename to meta-perl/files/static-passwd
diff --git a/meta-webserver/files/static-group-meta-webserver b/meta-webserver/files/static-group
similarity index 100%
rename from meta-webserver/files/static-group-meta-webserver
rename to meta-webserver/files/static-group
diff --git a/meta-webserver/files/static-passwd-meta-webserver b/meta-webserver/files/static-passwd
similarity index 100%
rename from meta-webserver/files/static-passwd-meta-webserver
rename to meta-webserver/files/static-passwd
-- 
2.49.0


