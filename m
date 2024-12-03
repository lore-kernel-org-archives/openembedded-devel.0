Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CB3E6C61E
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 08:59:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15188.1733216356089697138
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Dec 2024 00:59:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2067e51382=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B36U3lB006047
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Dec 2024 00:59:15 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43833q2ntb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:59:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVUnfx/KMb2SbpwoXbx5a1Qtmz4TzvER4TfpEMiC1hnOnvXkeGNK6AIcaUob7y/tGjOE7KvQL3aG4pVo622c9ThgLM7PD1E0KLIe/yZIlh17ieS0N7EWMgcu1/0xz96jnM9HFX4dlCywxyMxBGxMy0JFVLmCo3xfFSL48l9ETyypaoGIPtMeTu28GHQTTeDs0fEO/YsDIVgTyySMCxarZPFAHPFFI6IVKTvrVsLG4ZfASRWlFD4kiI8p1bdN1PyPjpdHRI8dWZtmcBPlJK9NPmE3t63e4XsOhh3c0GnWBQHMOYnRjmUun9UdgMxXr/coKgJz0F2LI3ATarhGM/6kAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe+yHVpeToESSiJCBEgV3eWblw+7vJc4Tfwf8ZCHVpA=;
 b=g+DTYlv4/IsOHrTi+rGYw2hOblbaoJt6V3gkOlyL0COBziyGd0WFLZ4PpdLDP1YRSzvp2MPPwqG2GV8APILBFKo4jlaSbt4dIb5cIiteVx2u9ARPJL5jF12+Ix3mGg0ZSPrguUqnLJ73z4LwJU5x8xVrPKDyd1+riOra5Sr8SVGArvJDpxDaqWUMNG1COA3cDnxhpfZL2hNS7CHEHAQz8z1SM07bw1y7fB60/9VQw84He6wNtAVRsk+W7SMHT2BMOnfb1S8eWIbrQusDGNvUWCFAZckgO7r9pi6BATMzOW1b1+/z9hiiEFGDHlSpCcvgl6sqL7nGxwBOQOmm+FZdxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SJ2PR11MB7600.namprd11.prod.outlook.com (2603:10b6:a03:4cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 08:59:11 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 08:59:11 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH] libgsf: upgrade 1.14.52 -> 1.14.53
Date: Tue,  3 Dec 2024 16:59:01 +0800
Message-Id: <20241203085901.480849-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.39.4
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::12) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SJ2PR11MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0968d5-1e59-4ae1-06f7-08dd1378c0d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JtW3aVv2CHrt2WRwWykPHws8LPVnfKh6KqKixfhx1KEjl8sovpPuy6Xh60tP?=
 =?us-ascii?Q?c7vsakSJ5ltrmwpBQfm8PL/I5U0YPUi/FHh0hqtYIGKO90MdmlJWd6R5pgiH?=
 =?us-ascii?Q?JFb00RBGfgXMOXUoWQXhSxSNfDByrp8O7VJXmdp9bjO1J4YGyM0Vna/9QJMN?=
 =?us-ascii?Q?Kr1ueJv17Lap3TJ8pkd4zr/Fhb/GrBfWbDs2Z7GGV5jWqJ75kXujCNOkW/3L?=
 =?us-ascii?Q?m6nPB5jojTDsnJKclnY/07l8+ORNtG5lAEWTO1qWtedjJLtlTp1N4OtP+ktV?=
 =?us-ascii?Q?q1RxvMtFt15zZH3hMno7rD8NaTlUBnPXt6L0Ooq7fJ5QgnpgtVh2XDW9zoex?=
 =?us-ascii?Q?0zW0+oz9Ze9sHBOQFPrRpp51eg1KkUKxRtrEOHpbgHmju8jfk/ZZDMn+RK2B?=
 =?us-ascii?Q?cJnkN7qMWPaHUS1cNLe+fOCnQUOnlxKley6KHNCJTFXQTbeYKn9DgLzS9ubK?=
 =?us-ascii?Q?I0xniFs6mW9qj4tJWiXDwccKNGWm7K63NqMqG5II6oiY1/C0IhfzadAHtTCH?=
 =?us-ascii?Q?9PApWd7LuSEoc0waYl5lX4+i0uKmG38kkzY1ylXhH1FLSyQVDh5gzNKdjdYQ?=
 =?us-ascii?Q?t4ru3enMK4WmMX0SFV95Dds0bdV6Iw/pKczNfVxUlrn/xpsfcOLUEH6OWv5H?=
 =?us-ascii?Q?5eCCrUt/gpOR/FOhLdgFCFzN1W/lSIYU68Kji1W7B+v5r4jGG7+UkfuTjqCH?=
 =?us-ascii?Q?IBCZc6PaIr3PHhFtbQrrshb6ucN7Lkp1CDA5o4cbSdc9WflE7huSReasBI/n?=
 =?us-ascii?Q?jNr61NnK4GSA0ajRUYH3YLokMk/9cyRP6WEiZcTdL93wY9fqHe1i1ez9Qwz2?=
 =?us-ascii?Q?WGqo9uGM/GDoprI7txxOLVJusBRPBS7zTh+GVimnA/eE1vHwhXNVwNoJhP11?=
 =?us-ascii?Q?mSq8mfuFzxYsE3z3ldFr9EhokRaEHEYJVbxsmhz7HeD4wog8VqzysuPkyBET?=
 =?us-ascii?Q?RZkEXv+ileK2saNrRj+KfJcu68kaQUPcwCeg+Jxe++KQwt7/n+WJTgEzBnfW?=
 =?us-ascii?Q?ZpjV8fxAZ2VFOVVl0tLRGOO8JDGLma9cviuN8aI9S0Y8hab/rcj2xHw2YbLX?=
 =?us-ascii?Q?PKTL6koGQEW/FnTLbkQioJOCnlz68gXyIWZEZ7flG7u92rGx2VnFPcsvEjfs?=
 =?us-ascii?Q?pup4c2y8gAaA1TJx0T1qmKg3cmA5pS+9+lGmH6xYZBXpgc5lsJLo65F53EMp?=
 =?us-ascii?Q?bh0lu8OpMOQkdtAeZes10K60JhNlMg/LhJCtS7giWDLljp9lo8zjQfX1431y?=
 =?us-ascii?Q?E4VpiWXtIDhOoLX7mFtUS++XPrYdCEJBii25KK3jS9nxHFgZ+P0CS0CT660V?=
 =?us-ascii?Q?GCarD/qUZ9HwgBbpBrZb0hNASFcbmfx5yCm/kA1lOq1oPi0iRjiSfqfOaZO9?=
 =?us-ascii?Q?4fbvOW/2gUwtraWQcNMb3oBjVofm2IVQmOL4ovc48DLDAw8ASg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hE2kKeyJAepVgrS2nxVhEEI5y17AhOhRNKi4Q6PKQsmNpwKcj+fZbH3HstY5?=
 =?us-ascii?Q?hGP6eS07q6kr9bVnmLFFs/AZUXyEw4mhplamXTJpVg4kx1pC8A38SSszNpF2?=
 =?us-ascii?Q?tFCV/zL7Pxjmnnz8glHNaZbkL3B/UIrKHmdnIOe6oyOEpMvBF+/mroY0bI/D?=
 =?us-ascii?Q?WCCEnZ2KL+yS3Yl0lsiMehBkZOXiywYdaVDrKFDLe0LWWn9R5Iqq8oAXeIXK?=
 =?us-ascii?Q?WPu4GOHHbpEhTtl+oqUQ3qNl4QXkqgBNKL0oTIl47r1IvmTF34UbtvqqcopC?=
 =?us-ascii?Q?ZJTTVlj8xjJ8jDEusglGa0oMb84WpSEXJJi7F0IAH8UoYBVXHgAEijsy2r9b?=
 =?us-ascii?Q?bqWfupCJiHIg1+yD8ayP1+xWqqMco2PguYPDswzCGV0iht9kw3aK8wkCY+jN?=
 =?us-ascii?Q?OWgCr1p8SGkdsnBa2XBbq4gLu2ot3Kli6fgiWqD02Dv19w6kV7YXlcTYIrBv?=
 =?us-ascii?Q?gIeR2aecsJmufbSt6JBlJn1M3KfPLPpY6gTwdgQMCfLQVC/gVLTrYZQt/lCR?=
 =?us-ascii?Q?T3+J+bPBTM1mzpeUofS9YL+zvZJOPoSLIJueAlfnVXD4W1Aux0hlfSg6p8qy?=
 =?us-ascii?Q?xadr/PKKoT85csGsNTJoQNX72OowkMjV3mSJ4kN70LRTg654CDMWaekrc9+g?=
 =?us-ascii?Q?LeRJBCidJVlz/SA3PBWRTPq4TMAGN2b77i8Wy07xbs2bizLhZ7F3Jl2IzuLL?=
 =?us-ascii?Q?UvZKrh+x8NlCAEpTrWnPAWBDwjtYsLFF4mrP7idfRMmKTUoUdWZHVAEpLFKO?=
 =?us-ascii?Q?/h+Om6jA7yIiS2H+F3ybCLqmpnu5WcFqOFZBnISr7rjCm6ZQjNat31LeMKBl?=
 =?us-ascii?Q?JdEnmUAyHxUjZdGXPmzv0pfWjK8QiXY95fMnuMQOMfqVN2JK7WvxM4sG4leC?=
 =?us-ascii?Q?UqAaQ6z4Wck/eBfhe63r44D92tNR9znpIxx9BKv0aHSkUEt10+Zc7ZzwABxB?=
 =?us-ascii?Q?nwpKopFvypYPPj4SzqE59KJhkumsbOrCA3rtZb+/qxckXWpJpA5QxRGV66dE?=
 =?us-ascii?Q?GDbOG644ZkvInXjMUTfQE53ZhlCTC2iEDX2HChz7xY0fCcHerH6OQPxFwv0d?=
 =?us-ascii?Q?QrQC6uiHjgakJCuxc2nzv1lCt9W1/FwgsODCMwasnBQvTr3Exuh/o949DzrZ?=
 =?us-ascii?Q?2AIg0SPnccsbG74xO45iCvdbeiKds27EqXQ3eAacwrheQ+RJlQ1FjQQNyC80?=
 =?us-ascii?Q?65feeK/uVQ8q4F2Inb7DP23/osIz9omr6wIsaC0/UlQrmFyy2rAaVuDMN1f7?=
 =?us-ascii?Q?Kw31t7HPZep/jpNIOqc9HUQsqTZ3iRkgWgHfApnqAehhtU0IsQPczqqUYIs4?=
 =?us-ascii?Q?ppLQskwGhJMhqgzPVlV2EDh43W9q0kI8wnghHMIoOZwCh7H7yqyGOHQPol6i?=
 =?us-ascii?Q?5Q18YI8vkW2VDAPK71neD5gZH1zru+eiFNf9lv/9PrApVONsaUwYUDXNwYhG?=
 =?us-ascii?Q?C5B8voez2mzFUGZJTF3cPAhMdSm8DZBV+U/SugX2tSbCEmyIQbVnP+Dsxsjq?=
 =?us-ascii?Q?waHcr/jdR3Us4MLKIa2+elRbexaZocs16If856p6p8DBiPXFmF/tr2xGntHT?=
 =?us-ascii?Q?9QrDJdrYAD2vQk7qZyWTjGOSQAxHOWfA9TfhTTDAPphSKPjS2od3s8Ixovtz?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0968d5-1e59-4ae1-06f7-08dd1378c0d5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:59:11.0724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sh5iHNjBOZ1uMn1yHJep5/L17Mzz1yAFW6RdIw56tdDtwIRCCLEfhXyC8jfxwcMgE0CfGtPy5M+3qNoWCj2mvoNU3G5wFtxIKIzMdAqWAH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7600
X-Proofpoint-ORIG-GUID: bqY6xVLiI5Gh7SPJBukRWIZserX71sXw
X-Authority-Analysis: v=2.4 cv=bqq2BFai c=1 sm=1 tr=0 ts=674ec863 cx=c_pps a=Bc47kgIQ+uE7vzpOcRUeGA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=aVKxnYC90OxDew9QUO4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: bqY6xVLiI5Gh7SPJBukRWIZserX71sXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=788 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412030076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 08:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114180

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
* Compilation fixes for libxml 2.13
* Fix ABR in gsf-vba-dump.
* Teach gsf (the tool) to handle odf properties.
* Fix integer overflows affecting memory allocation.
* Add missing "DocumentStatus" ole2 property.
* Avoid some undefined C behaviour in overflow checks.

Security fixes:
CVE-2024-42415
An integer overflow vulnerability exists in the Compound Document Binary
File format parser of v1.14.52 of the GNOME Project G Structured File
Library (libgsf). A specially crafted file can result in an integer
overflow that allows for a heap-based buffer overflow when processing
the sector allocation table. This can lead to arbitrary code execution.
An attacker can provide a malicious file to trigger this vulnerability.
CVE-2024-36474
An integer overflow vulnerability exists in the Compound Document Binary
File format parser of the GNOME Project G Structured File Library
(libgsf) version v1.14.52. A specially crafted file can result in an
integer overflow when processing the directory from the file that allows
for an out-of-bounds index to be used when reading and writing to an
array. This can lead to arbitrary code execution. An attacker can
provide a malicious file to trigger this vulnerability.

Reference:
[https://gitlab.gnome.org/GNOME/libgsf/-/issues/34]

(master rev: 6ed5891c18fc78a69764af0a29ad9b5feefb1aa8)

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../libgsf/{libgsf_1.14.52.bb => libgsf_1.14.53.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.52.bb => libgsf_1.14.53.bb} (72%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.52.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb
similarity index 72%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.52.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb
index 7e1842b1ac..ffa24e8120 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.52.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb
@@ -9,8 +9,8 @@ DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
 GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gobject-introspection gettext gtk-doc
 
-SRC_URI[archive.sha256sum] = "9181c914b9fac0e05d6bcaa34c7b552fe5fc0961d3c9f8c01ccc381fb084bcf0"
-SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
+SRC_URI[archive.sha256sum] = "0eb59a86e0c50f97ac9cfe4d8cc1969f623f2ae8c5296f2414571ff0a9e8bcba"
+SRC_URI += " file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gdk-pixbuf] = "--with-gdk-pixbuf,--without-gdk-pixbuf,gdk-pixbuf"
-- 
2.39.4


