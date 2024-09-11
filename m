Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23F9EE0201
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 02:56:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13581.1726023357420173939
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 19:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99845107e5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B2NtEn019022
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 02:55:56 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gdt8kuvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 02:55:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QeiMjgPfXOsNnip/W10vxxQrGcdoKoFoA52Ks3NCqRAO1a6w9j311MJSEM5IEDj32Kj5yr7jwn2QGny1YOnw37liLNptkx0FBVnHU1VFtp5DzKYSxNKrdfD4cg92lo7vIveMoHKzppsVyjXCbR1LNuO34rYjdZJ4AcWfmEmhbZ4Yn4Q1tEtNGyKZVvTHKp5gKzpkhkZjElfJ3iJIYQEVPpo61MJS+SpnagbvTVZ22DOcO85I/rno/zvxFNoYdHgpv/MN/a4I2EplLyIEyCehONpccqxug67hSSdoivNmYJRHoiU2h1VHmLk1LDRNQ+kqfmaX/n6XXNjyPMYkBiPmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfb2KTD88dvfdwQ1OIlPjj0URNWHZIZpdALdsclXr8I=;
 b=WW+3+RDjjIYamASmh422rfvx2jufqOiupCVIDFWouqvLkQeXU/97p8GVDuv/IInnO7Fqe34+xBu5WQ/WqDMgkN6kRXl+8a95NR1IIwZtnfYFSPOSSV+LEo//bSA8cfeMsCDJYw15YwtJNSH9b5BMgh79QNh921toNCycDUPl/ziAtbWpFkit5+VnNth9W2r3ffWs6EnIWOpvNnvDdmiwo02ihIL/zeFOUiOLNmkiSjnqAJOlI9M/Zubth/CtRFNCju6+KL+8lHN8c3mbBPxtOHnliPldijDvYf+q0rDoOtXy31i6udyJXuRoNcvQK+8sQS/lIGLtoufvtTXaeu8aDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.17; Wed, 11 Sep 2024 02:55:53 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 02:55:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] autofs: upgrade 5.1.8 -> 5.1.9
Date: Wed, 11 Sep 2024 10:55:42 +0800
Message-Id: <20240911025542.2672972-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0265.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH0PR11MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: bcddf30e-8c7e-4ae9-218e-08dcd20d3fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qupet6knOZyCif8PF/LBNQIJu+qPpgmPkTB8DL/+jO9LqQ99cb6upcnEc8Fe?=
 =?us-ascii?Q?RUeCZB2v8CLYLiQ4Eiw0i8XU5R6Bmh8RRYMPIxvzTF7Njk6r6BXZgxIKwl4T?=
 =?us-ascii?Q?F/wgXbiQ0WcsSn8glIe/1nyz8+na2xD81HI9HOSvpcGbngk+/QKYqGQVVIov?=
 =?us-ascii?Q?1mowU7PZRO/J8kryy7Gm3Giokew1SmfuaYl2Nw3oeH5hnb285wGcrN12RiHy?=
 =?us-ascii?Q?LZ6cwnVznNR/uHI3NRtLOWCiOwsv9QF5Js0y0hRk6hQf3Gpir/Anb2ByaROe?=
 =?us-ascii?Q?lMltYXAWZZhNTEcj6GGQDEJMbUy4mbLy/PGeoPxRC8TxK+Vq/JfJ1v3WIppc?=
 =?us-ascii?Q?CbAY/H05TOxSV88M+ltgYZVvu80STYsRLPCd+D+x140xE9+9aQxxuQzjHjh8?=
 =?us-ascii?Q?MOUNMj831yJ4exrRIBRnWtUcdYLEvyOpKrTHHE+jhEziEYpvK7op1cvpSfKj?=
 =?us-ascii?Q?+6m6WiGdBi6Ztr9yPNKzUAzqBw+TZ+yNQHOo4Ho6mPI2VrXFva0Gg/QFu5YB?=
 =?us-ascii?Q?JVAAr3WNQrSg8hQggsVFRVoiU3Xb6odRNCnk8dQZyENQrswvlhy99WCNkz5w?=
 =?us-ascii?Q?bTwqcT7kcUF71TaRO244mMHncNBuvdP80YhO/N2UDv6DMrPBTeITWpwns5UL?=
 =?us-ascii?Q?AzAhzxwzW8LXhDr+PUm+7pj1HqT9MwPAN6NMdl8w+gppHHNmpeJSGZhQtlG0?=
 =?us-ascii?Q?WQatsmwJQh9w3k7GMvjCmYEr5BvucCWH4EtBi5g5D7L12W7rzoYVhM+nUBU2?=
 =?us-ascii?Q?xr/KaN/nKihEqC/Z4NpeYaDZrN0oTQ7TVszf/6JKXsdLK35cz326KP0BXtSN?=
 =?us-ascii?Q?h4l9EHR3ptO10K1O6lIeaHc+IxFDAgSzTdorOre7wgdrqzrwHMm0jCEfjMND?=
 =?us-ascii?Q?6YVyMrJk8CDAJOXnK3P+EJMp6LIYep2f87TFn1eq+PDlcBxHOouoFxG8T6w0?=
 =?us-ascii?Q?GfOJBpnJy4/WZuBkKO4Ot5mB6Ds2pGW2ps+A72vHFo+X1z/o5SQmzb+2yZcc?=
 =?us-ascii?Q?j1zSYYrv9p1z+p0vTq7CSnFqwg9pfqWvDR6FJuElzuCqB8ZCkaX8cuftVwwI?=
 =?us-ascii?Q?QbecvUS8RgTbICNlZeFMFT7s/NCIUQvWP5zmcScLjX4rR4hQwi1w41CfklU5?=
 =?us-ascii?Q?7JedbzKAPJKCEF7eflf5adieLIBWwB0dN7cqP0vBO+pH9iJJJ512thg/7uGw?=
 =?us-ascii?Q?c2FCzci7FnxkZnDDITObZ9qrqrl96paQWyNtzOlkV9PT0mYMQE62O7ortK2G?=
 =?us-ascii?Q?plkwY2Uad2oOkVAlg7KPkCLfl37J3htmmLqkEroNvVxcFdsocctMK24lO+C3?=
 =?us-ascii?Q?R0C63bfOQ5OASW/smAKhQTon3MSYgbvjPddUPYiqiTkSJG7Eno4j/oNSZ0gZ?=
 =?us-ascii?Q?gb62CA4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kO7xjN0xgEYFr45BH4SjHGcPiQvMgpT6KFz9V0pgl2YK8iYbMVEp7ZSTRUiE?=
 =?us-ascii?Q?TzPq8v1LDXX3jG+hoU2Smvya0kRvv0S8MWig+qdrxeEmmlIzaGbwlti76Xv8?=
 =?us-ascii?Q?bIR3I5iHwf1cx3uQXPgVCUeJqwLpCCgN3PPV8x09h7ku0VcgG4f+Qgt6AlU7?=
 =?us-ascii?Q?7908DkbJh5U9CtfNOskKTq2NlemgC+CRQ3XXoS8W3sWGM1vNMaehHyxst5zv?=
 =?us-ascii?Q?dCC5KEGkjLmJzHlE/xV4xBptM3+3G/yfK8GJE6ebhEs/fMAx/PgkOUPio9lU?=
 =?us-ascii?Q?Um0BYUlsHx/yXIyABV8QNyIOGCDygR3ZE1bFMpzHgopoPb4BpVcKUrbE9vmZ?=
 =?us-ascii?Q?jU+G2cWPxG7m9IVciOmhuQjWhrxpagzLhNi0KtizHXlv0781L98Y5x8sOe23?=
 =?us-ascii?Q?T//Y6NEJpVqHiCPIiOCiW1oql9SnL9DtRIXfC2d4aA5mHJRP5p2v4gaVDRel?=
 =?us-ascii?Q?umvPQ241FYrikUT86STI1ZPCFcFDB+3Ox2V5XvGGeUYPQPIVHI1isq5KgdNl?=
 =?us-ascii?Q?m9C9/OapiU5at0ZT1XuQth3huepN19/HVuo8h07Le9iLzbu5+rtoZNexHBNZ?=
 =?us-ascii?Q?QiEGyisAcfPF3DbrWBXh53PhTEkTEfZ/0x8CDIVQtgJDV2fKqMM8hZRGnr+k?=
 =?us-ascii?Q?b5sYn4OaN09WPxTbHAbvCEsoMhlinpGF5MLPdln3VNGL4dEbA+ch7uwKUZNr?=
 =?us-ascii?Q?+FCpis/QPVhMT894aax1Uu/vV+DNZhKOyqbj9M1U8U0pA2r8PDszS7SdVESt?=
 =?us-ascii?Q?VBCSBPmJ6hNaFvBcidFiJNwDREhcxmqqlHoJOkck4pLj2mdNMTKVGmyS3kAd?=
 =?us-ascii?Q?OF8YTOFy4vas0TOoFfeEXA7qtoIn6bsNBjdgJjpWj4MKltVvvqHs15mO9A5v?=
 =?us-ascii?Q?o8O6wNPaM58soI/cW2EiM+bSs7Et+uLAasQ4IG7EpbAbFE6cxZRHqbjxfhFn?=
 =?us-ascii?Q?XDtUILehx7K7tHJKhJGsUzb4HTTB2B/3G1fpAAcejUwZTj3Y2HHx+L1hbdq8?=
 =?us-ascii?Q?2l4DwkYBWFpKLpLkUFMAsrlCJsheM7UvV6KVBqz/CuD22/1SaiyS3YQkL+2i?=
 =?us-ascii?Q?7/Uw6tQ/muSGxEuQ21zXM1pCdRXipou8ZklzSVOxfZYWvIjedxNeoC/OqmKa?=
 =?us-ascii?Q?h/2etWt6jNlBfH38AnnYrIBrfEPNrUvlrSMo5QtsjDHxiMu7tfzn7JkyPEwt?=
 =?us-ascii?Q?A5zQth5R9s+VhyYbQwIvLvibF63RMEw2mqadLDjs1L/QkjfceKoS16gdG3G0?=
 =?us-ascii?Q?OfQzOza0rBn8YQax9Bpm9kY2OEIXGqiJDFXntQ8l1p8OtgnxFQVpc/QW9Wpy?=
 =?us-ascii?Q?PPk2NiKiZEfSXqvOKc0uLdq4v4FpBh1X5uomJkVE9JLTkYB9w7Z7abO6zOip?=
 =?us-ascii?Q?ajO2a3suPjFaIor//zSfNmhZqehkTVt0btT7fM/ANH7F8aK7lKEAqTbnnJNM?=
 =?us-ascii?Q?yP8fgC6jxb1HRV1MojPCg0618ViMzREtF2XcE/GO53/xD+eToy7l8lvR8oC3?=
 =?us-ascii?Q?YtKrKPySYCUqCUAwent55HxAk4xuFbrDzTsr5Am/PTkIqGbE8YhXPRplaNBM?=
 =?us-ascii?Q?rGk/ORby0tBHVLdjiw4RzeI3W9oR0ivP1u52Ijnj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcddf30e-8c7e-4ae9-218e-08dcd20d3fed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 02:55:53.3338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HC/1oLmDU4O+RD+CQAN3YsGLDuuflfV8L4M48AKa0prTWqZ/V2rx7EXoXAs6+ZTXJ57jGy8bGtDSscB6n9cnlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4952
X-Proofpoint-ORIG-GUID: OBAx9hKyxIBMGqC1GdLTYJ0NeA_UyTu-
X-Proofpoint-GUID: OBAx9hKyxIBMGqC1GdLTYJ0NeA_UyTu-
X-Authority-Analysis: v=2.4 cv=a+hi9lSF c=1 sm=1 tr=0 ts=66e106bc cx=c_pps a=JZW2CxG2E6UWpsn1SfDs7A==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=omOdbC7AAAAA:8
 a=pGLkceISAAAA:8 a=ZfRw4ET0AAAA:8 a=jUFqNg-nAAAA:8 a=7mOBRU54AAAA:8 a=LHb-yY2pAAAA:8 a=Z6EfDJrRAAAA:8 a=5KEJ3k9QAAAA:8 a=20KFwNOVAAAA:8 a=QwP3S9PjK4IOhSwZjz8A:9 a=ekEWIaPWhpEKppnr:21 a=RVmHIydaz68A:10 a=FdTzh2GWekK77mhwV6Dw:22 a=CCLsn7l-3eYpXwuFc0al:22
 a=-tElvS_Zar9K8zhlwiSp:22 a=wa9RWnbW_A1YIeRBVszw:22 a=xujH9fjlz3N7iSHvlmd2:22 a=GLvejNd0Yr38jcbvy3o4:22 a=olg2BfGzmf2haRflzj8J:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409110021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 02:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112238

ChangeLog:
https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/tree/CHANGELOG?h=release_5_1_9

* Drop backport patches:
  0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch
  0002-autofs-5.1.8-handle-innetgr-not-present-in-musl.patch

* Drop the following patches as the issues have been fixed upstream:
  cross.patch
  pkgconfig-libnsl.patch
  fix_disable_ldap.patch
  add-the-needed-stdarg.h.patch
  autofs-5.0.7-fix-lib-deps.patch
  0001-Define-__SWORD_TYPE-if-undefined.patch
  0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch
  0001-Bug-fix-for-pid_t-not-found-on-musl.patch
  0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch
  0002-Replace-__S_IEXEC-with-S_IEXEC.patch

* Reresh the following patches:
  no-bash.patch
  remove-bashism.patch
  mount_conflict.patch
  force-STRIP-to-emtpy.patch
  0001-include-libgen.h-for-basename.patch
  0001-Do-not-hardcode-path-for-pkg.m4.patch
  fix-the-YACC-rule-to-fix-a-building-failure.patch
  using-pkg-config-to-detect-libxml-2.0-and-krb5.patch

* Add patch to fix build on musl:
  0009-hash.h-include-sys-reg.h-instead-of-bits-reg.h.patch

* Backport patch to fix build with gcc14:
  0010-autofs-5.1.9-Fix-incompatible-function-pointer-types.patch

* Add PACKAGECONFIG[openldap] and PACKAGECONFIG[sasl]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-Bug-fix-for-pid_t-not-found-on-musl.patch |  30 -----
 ...__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch |  50 --------
 ...001-Define-__SWORD_TYPE-if-undefined.patch | 115 ------------------
 ...0001-Do-not-hardcode-path-for-pkg.m4.patch |  31 -----
 ...dd-autofs_strerror_r-helper-for-musl.patch |  56 ---------
 ...ulti.c-Replace-__S_IEXEC-with-S_IEXE.patch |  29 -----
 .../{no-bash.patch => 0001-no-bash.patch}     |  13 +-
 .../0002-Replace-__S_IEXEC-with-S_IEXEC.patch |  60 ---------
 ...8-handle-innetgr-not-present-in-musl.patch | 106 ----------------
 ...002-using-pkg-config-to-detect-krb5.patch} |  30 ++---
 ....patch => 0003-force-STRIP-to-emtpy.patch} |  16 +--
 ... 0004-autofs.init.in-remove-bashism.patch} |   6 +-
 ...YACC-rule-to-fix-a-building-failure.patch} |  67 +++++-----
 ...0006-Do-not-hardcode-path-for-pkg.m4.patch |  31 +++++
 ...etween-sys-mount.h-and-linux-mount..patch} |  17 ++-
 ... 0008-include-libgen.h-for-basename.patch} |  11 +-
 ...lude-sys-reg.h-instead-of-bits-reg.h.patch |  35 ++++++
 ...-incompatible-function-pointer-types.patch |  64 ++++++++++
 .../autofs/add-the-needed-stdarg.h.patch      |  25 ----
 .../autofs/autofs-5.0.7-fix-lib-deps.patch    |  26 ----
 .../recipes-daemons/autofs/autofs/cross.patch |  55 ---------
 .../autofs/autofs/fix_disable_ldap.patch      |  47 -------
 .../autofs/autofs/pkgconfig-libnsl.patch      |  37 ------
 .../{autofs_5.1.8.bb => autofs_5.1.9.bb}      |  43 +++----
 24 files changed, 236 insertions(+), 764 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/0001-Bug-fix-for-pid_t-not-found-on-musl.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-if-undefined.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch
 rename meta-networking/recipes-daemons/autofs/autofs/{no-bash.patch => 0001-no-bash.patch} (74%)
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/0002-autofs-5.1.8-handle-innetgr-not-present-in-musl.patch
 rename meta-networking/recipes-daemons/autofs/autofs/{using-pkg-config-to-detect-libxml-2.0-and-krb5.patch => 0002-using-pkg-config-to-detect-krb5.patch} (50%)
 rename meta-networking/recipes-daemons/autofs/autofs/{force-STRIP-to-emtpy.patch => 0003-force-STRIP-to-emtpy.patch} (72%)
 rename meta-networking/recipes-daemons/autofs/autofs/{remove-bashism.patch => 0004-autofs.init.in-remove-bashism.patch} (97%)
 rename meta-networking/recipes-daemons/autofs/autofs/{fix-the-YACC-rule-to-fix-a-building-failure.patch => 0005-fix-the-YACC-rule-to-fix-a-building-failure.patch} (65%)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/0006-Do-not-hardcode-path-for-pkg.m4.patch
 rename meta-networking/recipes-daemons/autofs/autofs/{mount_conflict.patch => 0007-Avoid-conflicts-between-sys-mount.h-and-linux-mount..patch} (60%)
 rename meta-networking/recipes-daemons/autofs/autofs/{0001-include-libgen.h-for-basename.patch => 0008-include-libgen.h-for-basename.patch} (89%)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/0009-hash.h-include-sys-reg.h-instead-of-bits-reg.h.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/0010-autofs-5.1.9-Fix-incompatible-function-pointer-types.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-fix-lib-deps.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/cross.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch
 rename meta-networking/recipes-daemons/autofs/{autofs_5.1.8.bb => autofs_5.1.9.bb} (62%)

diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Bug-fix-for-pid_t-not-found-on-musl.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Bug-fix-for-pid_t-not-found-on-musl.patch
deleted file mode 100644
index 2a583466e..000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-Bug-fix-for-pid_t-not-found-on-musl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d0d5ac317dab11610a5fc91ca3e7f5ad72ce2236 Mon Sep 17 00:00:00 2001
-From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
-Date: Tue, 29 Oct 2019 13:19:37 +0800
-Subject: [PATCH] Bug fix for pid_t not found on musl.
-
-When compiling version 5.1.6 on musl, the following error occurs:
-log.h:49:8: error: unknown type name 'pid_t'
-
-Upstream-Status: Pending
-
-Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
----
- lib/defaults.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/defaults.c b/lib/defaults.c
-index a6ea116..b3ecfa5 100644
---- a/lib/defaults.c
-+++ b/lib/defaults.c
-@@ -21,6 +21,7 @@
- #include <string.h>
- #include <sys/utsname.h>
- #include <sys/stat.h>
-+#include <sys/types.h>
- #include <stdarg.h>
- 
- #include "config.h"
--- 
-2.20.1
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch
deleted file mode 100644
index 6128f3d0e..000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 987c8f4a718cdd6b764592ba7510090a59623959 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 31 Mar 2017 19:10:57 -0700
-Subject: [PATCH] Define __SWORD_TYPE and _PATH_NSSWITCH_CONF
-
-if they are not defined as is in musl then define
-them here
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
-Upstream-Status: Pending
-
- include/automount.h | 8 ++++++++
- include/nsswitch.h  | 3 +++
- 2 files changed, 11 insertions(+)
-
-diff --git a/include/automount.h b/include/automount.h
-index cc336ad..8bdcf12 100644
---- a/include/automount.h
-+++ b/include/automount.h
-@@ -42,6 +42,14 @@
- 
- #define ENABLE_CORES	1
- 
-+#ifndef __SWORD_TYPE
-+# if __WORDSIZE == 32  /* System word size */
-+#  define __SWORD_TYPE int
-+# else /* __WORDSIZE == 64 */
-+#  define __SWORD_TYPE long int
-+# endif
-+#endif
-+
- /* We MUST have the paths to mount(8) and umount(8) */
- #ifndef HAVE_MOUNT
- #error Failed to locate mount(8)!
-diff --git a/include/nsswitch.h b/include/nsswitch.h
-index d3e4027..7a0c38f 100644
---- a/include/nsswitch.h
-+++ b/include/nsswitch.h
-@@ -24,6 +24,9 @@
- #include <netdb.h>
- #include "list.h"
- 
-+#ifndef _PATH_NSSWITCH_CONF
-+#define _PATH_NSSWITCH_CONF     "/etc/nsswitch.conf"
-+#endif
- #define NSSWITCH_FILE _PATH_NSSWITCH_CONF
- 
- enum nsswitch_status {
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-if-undefined.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-if-undefined.patch
deleted file mode 100644
index f16ae5277..000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-if-undefined.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From 9fe90ab1e333b2e2bed370ff13ba552eb54c3aaf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Jul 2021 09:56:28 -0700
-Subject: [PATCH] Define __SWORD_TYPE if undefined
-
-These fixes are inspired when building autofs on musl
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- daemon/automount.c | 20 ++++++++++++++------
- include/hash.h     |  5 +++++
- lib/log.c          |  6 +++++-
- 3 files changed, 24 insertions(+), 7 deletions(-)
-
---- a/daemon/automount.c
-+++ b/daemon/automount.c
-@@ -1,7 +1,7 @@
- /* ----------------------------------------------------------------------- *
-  *
-  *  automount.c - Linux automounter daemon
-- *   
-+ *
-  *   Copyright 1997 Transmeta Corporation - All Rights Reserved
-  *   Copyright 1999-2000 Jeremy Fitzhardinge <jeremy@goop.org>
-  *   Copyright 2001-2005 Ian Kent <raven@themaw.net>
-@@ -11,7 +11,7 @@
-  *   the Free Software Foundation, Inc., 675 Mass Ave, Cambridge MA 02139,
-  *   USA; either version 2 of the License, or (at your option) any later
-  *   version.
-- *   
-+ *
-  *   This program is distributed in the hope that it will be useful,
-  *   but WITHOUT ANY WARRANTY; without even the implied warranty of
-  *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-@@ -40,6 +40,14 @@
- #include <systemd/sd-daemon.h>
- #endif
- 
-+#ifndef __SWORD_TYPE
-+# if __WORDSIZE == 32  /* System word size */
-+#  define __SWORD_TYPE int
-+# else /* __WORDSIZE == 64 */
-+#  define __SWORD_TYPE long int
-+# endif
-+#endif
-+
- #include "automount.h"
- #if defined(LIBXML2_WORKAROUND) || defined(TIRPC_WORKAROUND)
- #include <dlfcn.h>
-@@ -282,7 +290,7 @@ int rmdir_path(struct autofs_point *ap,
- 			     dev, buf, st.st_dev);
- 			return -1;
- 		}
--			     
-+
- 		/*
- 		 * Last element of path may be a symbolic link; all others
- 		 * are directories (and the last directory element is
-@@ -455,7 +463,7 @@ int count_mounts(struct autofs_point *ap
- 
- 	counter.count = 0;
- 	counter.dev = dev;
--	
-+
- 	if (walk_tree(path, counter_fn, 1, ap, &counter) == -1)
- 		return -1;
- 
-@@ -811,7 +819,7 @@ static char *automount_path_to_fifo(unsi
- 	/*
- 	 *  An automount path can be made up of subdirectories.  So, to
- 	 *  create the fifo name, we will just replace instances of '/' with
--	 *  '-'. 
-+	 *  '-'.
- 	 */
- 	p = fifo_name + strlen(fifodir);
- 	while (*p != '\0') {
-@@ -1640,7 +1648,7 @@ static void return_start_status(void *ar
- 	sc->done = 1;
- 
- 	/*
--	 * Startup condition mutex must be locked during 
-+	 * Startup condition mutex must be locked during
- 	 * the startup process.
- 	 */
- 	status = pthread_cond_signal(&sc->cond);
---- a/include/hash.h
-+++ b/include/hash.h
-@@ -5,6 +5,11 @@
- 
- #include <sys/types.h>
- #include <stdint.h>
-+#include <linux/stddef.h>
-+
-+#ifndef __GLIBC__
-+#include <sys/reg.h>
-+#endif
- 
- /*
-  * The "GOLDEN_RATIO_PRIME" is used in ifs/btrfs/brtfs_inode.h and
---- a/lib/log.c
-+++ b/lib/log.c
-@@ -38,7 +38,11 @@ static char *prepare_attempt_prefix(cons
- 	char buffer[ATTEMPT_ID_SIZE + 1];
- 	char *prefixed_msg = NULL;
- 
--	attempt_id = pthread_getspecific(key_thread_attempt_id);
-+        if (key_thread_attempt_id) {
-+                attempt_id = pthread_getspecific(key_thread_attempt_id);
-+        } else {
-+                attempt_id = 0;
-+        }
- 	if (attempt_id) {
- 		int len = sizeof(buffer) + 1 + strlen(msg) + 1;
- 
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
deleted file mode 100644
index f18f237d9..000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d7a34bb388e33d16260b67275cdb58f9c877d324 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 27 Nov 2018 15:27:47 +0800
-Subject: [PATCH] From 6d24365f0828185fd1bb4d199209ca07eb95c41d Mon Sep 17
- 00:00:00 2001 From: Khem Raj <raj.khem@gmail.com> Date: Fri, 24 Aug 2018
- 06:24:36 +0000 Subject: [PATCH] Do not hardcode path for pkg.m4
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-update patch to version 5.1.6
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- configure.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index 07c2051..e85d718 100644
---- a/configure.in
-+++ b/configure.in
-@@ -12,7 +12,7 @@ define([AC_CACHE_SAVE], )dnl
- AC_INIT(.autofs-5.1.8)
- 
- # for pkg-config macros
--m4_include([/usr/share/aclocal/pkg.m4])
-+m4_include([pkg.m4])
- 
- #
- # autofs installs by default in /usr
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch
deleted file mode 100644
index caf010511..000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 88f991b0ebb6fb8fcaad3d0eb8fb51a7439d053e Mon Sep 17 00:00:00 2001
-From: Fabian Groffen <grobian@gentoo.org>
-Date: Wed, 2 Feb 2022 09:27:13 +0800
-Subject: [PATCH 1/2] autofs-5.1.8 - add autofs_strerror_r() helper for musl
-
-If using musl libc the XSI-compliant variant strerror_r() which returns
-an integer instead of a pointer so add a helper function to handle this
-case.
-
-Signed-off-by: Fabian Groffen <grobian@gentoo.org>
-Signed-off-by: Ian Kent <raven@themaw.net>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- include/automount.h |  5 +++++
- lib/log.c           | 10 ++++++++++
- 2 files changed, 15 insertions(+)
-
-diff --git a/include/automount.h b/include/automount.h
-index 8cd8b3a..f759e59 100644
---- a/include/automount.h
-+++ b/include/automount.h
-@@ -51,6 +51,11 @@
- # endif
- #endif
- 
-+#ifndef __GLIBC__
-+# define strerror_r(N,B,S) autofs_strerror_r(N,B,S)
-+char *autofs_strerror_r(int errnum, char *buf, size_t buflen);  /* GNU */
-+#endif
-+
- /* We MUST have the paths to mount(8) and umount(8) */
- #ifndef HAVE_MOUNT
- #error Failed to locate mount(8)!
-diff --git a/lib/log.c b/lib/log.c
-index 39b1e3b..b99fa39 100644
---- a/lib/log.c
-+++ b/lib/log.c
-@@ -368,3 +368,13 @@ pid_t log_pidinfo(struct autofs_point *ap, pid_t pid, char *label) {
- 
- 	return ppid;
- }
-+
-+#ifndef __GLIBC__
-+# undef strerror_r
-+char *autofs_strerror_r(int errnum, char *buf, size_t buflen) {
-+	int s = strerror_r(errnum, buf, buflen);
-+	if (s)
-+		return NULL;
-+	return buf;
-+}
-+#endif
--- 
-2.37.3
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch
deleted file mode 100644
index 8eec3014a..000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 745e355ac8b595a27e1fcca75bf01d3e244f4a5f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Sep 2017 22:22:31 -0700
-Subject: [PATCH] modules/lookup_multi.c: Replace __S_IEXEC with S_IEXEC
-
-__S_IEXEC is internal to libc and may not be available on
-all libc e.g. musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
-Upstream-Status: Pending
-
- modules/lookup_multi.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/lookup_multi.c b/modules/lookup_multi.c
-index 3ecda6d..cf109de 100644
---- a/modules/lookup_multi.c
-+++ b/modules/lookup_multi.c
-@@ -452,7 +452,7 @@ int lookup_reinit(const char *my_mapfmt,
- 					continue;
- 				}
- 
--				if (st.st_mode & __S_IEXEC)
-+				if (st.st_mode & S_IEXEC)
- 					type = src_prog;
- 				else
- 					type = src_file;
diff --git a/meta-networking/recipes-daemons/autofs/autofs/no-bash.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-no-bash.patch
similarity index 74%
rename from meta-networking/recipes-daemons/autofs/autofs/no-bash.patch
rename to meta-networking/recipes-daemons/autofs/autofs/0001-no-bash.patch
index f91c307d3..cd9b14358 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/no-bash.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-no-bash.patch
@@ -1,16 +1,18 @@
-From a3007d7ea930823926611081bb873ddd771325cb Mon Sep 17 00:00:00 2001
+From f53458e0b4cca0b0eedcd00b0e90b39d91228085 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Jan 2013 19:53:10 -0800
+Subject: [PATCH] no bash
 
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  samples/auto.net | 2 +-
  samples/auto.smb | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/samples/auto.net b/samples/auto.net
-index 0384f61..61215f6 100755
+index c5b145d..a09d56d 100755
 --- a/samples/auto.net
 +++ b/samples/auto.net
 @@ -1,4 +1,4 @@
@@ -20,7 +22,7 @@ index 0384f61..61215f6 100755
  # This file must be executable to work! chmod 755!
  
 diff --git a/samples/auto.smb b/samples/auto.smb
-index 6af5d85..d296b81 100755
+index f6d41d3..0d945ee 100755
 --- a/samples/auto.smb
 +++ b/samples/auto.smb
 @@ -1,4 +1,4 @@
@@ -29,3 +31,6 @@ index 6af5d85..d296b81 100755
  
  # This file must be executable to work! chmod 755!
  
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch b/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
deleted file mode 100644
index d67f6300c..000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 096e33743158e0e8c04d60d01cc66e2945d79777 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 27 Nov 2018 16:52:35 +0800
-Subject: [PATCH] From 557ca399f4b3a397f20bb147ec6dc4ab9732dd1e Mon Sep 17
- 00:00:00 2001 From: Khem Raj <raj.khem@gmail.com> Date: Fri, 31 Mar 2017
- 19:12:10 -0700 Subject: [PATCH] Replace __S_IEXEC with S_IEXEC
-
-S_IEXEC is portable
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-update patch to version 5.1.5
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
-Upstream-Status: Pending
-
- daemon/lookup.c        | 6 +++---
- modules/lookup_multi.c | 2 +-
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
---- a/daemon/lookup.c
-+++ b/daemon/lookup.c
-@@ -397,7 +397,7 @@ static int read_file_source_instance(str
- 		return NSS_STATUS_NOTFOUND;
- 	}
- 
--	if (st.st_mode & __S_IEXEC)
-+	if (st.st_mode & S_IEXEC)
- 		type = src_prog;
- 	else
- 		type = src_file;
-@@ -930,7 +930,7 @@ static int lookup_name_file_source_insta
- 		return NSS_STATUS_NOTFOUND;
- 	}
- 
--	if (st.st_mode & __S_IEXEC)
-+	if (st.st_mode & S_IEXEC)
- 		type = src_prog;
- 	else
- 		type = src_file;
-@@ -1077,7 +1077,7 @@ static struct map_source *lookup_get_map
- 	if (!S_ISREG(st.st_mode))
- 		return NULL;
- 
--	if (st.st_mode & __S_IEXEC)
-+	if (st.st_mode & S_IEXEC)
- 		type = "program";
- 	else
- 		type = "file";
---- a/modules/lookup_multi.c
-+++ b/modules/lookup_multi.c
-@@ -247,7 +247,7 @@ static struct lookup_mod *nss_open_looku
- 				continue;
- 			}
- 
--			if (st.st_mode & __S_IEXEC)
-+			if (st.st_mode & S_IEXEC)
- 				type = src_prog;
- 			else
- 				type = src_file;
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0002-autofs-5.1.8-handle-innetgr-not-present-in-musl.patch b/meta-networking/recipes-daemons/autofs/autofs/0002-autofs-5.1.8-handle-innetgr-not-present-in-musl.patch
deleted file mode 100644
index 9d0caae31..000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/0002-autofs-5.1.8-handle-innetgr-not-present-in-musl.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 1c0b0b70a276280f431d72319109a0bbc0267970 Mon Sep 17 00:00:00 2001
-From: Fabian Groffen <grobian@gentoo.org>
-Date: Wed, 2 Feb 2022 10:15:22 +0800
-Subject: [PATCH 2/2] autofs-5.1.8 - handle innetgr() not present in musl
-
-The function innetgr(3) may not be present in musl libc, add a check
-for this.
-
-Originally contributed by Fabian, modified by me.
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/commit/?id=f60e40af3c038b8955325a11b7294ad38c15c9e8]
-Signed-off-by: Fabian Groffen <grobian@gentoo.org>
-Signed-off-by: Ian Kent <raven@themaw.net>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure           | 6 ++++++
- configure.in        | 2 +-
- include/config.h.in | 3 +++
- modules/parse_amd.c | 7 +++++++
- 4 files changed, 17 insertions(+), 1 deletion(-)
-
---- a/configure.in
-+++ b/configure.in
-@@ -169,7 +169,7 @@ AF_CHECK_SSS_LIB(SSS_AUTOFS, libsss_auto
- AC_SUBST(HAVE_SSS_AUTOFS)
- AC_SUBST(sssldir)
- 
--AC_CHECK_FUNCS(pipe2)
-+AC_CHECK_FUNCS(pipe2 innetgr)
- 
- #
- # Newer mounts have the -s (sloppy) option to ignore unknown options,
---- a/include/config.h.in
-+++ b/include/config.h.in
-@@ -30,6 +30,9 @@
- /* Define to 1 if you have the `getservbyname' function. */
- #undef HAVE_GETSERVBYNAME
- 
-+/* Define to 1 if you have the `innetgr' function. */
-+#undef HAVE_INNETGR
-+
- /* Define to 1 if you have the <inttypes.h> header file. */
- #undef HAVE_INTTYPES_H
- 
-@@ -45,9 +48,6 @@
- /* Define if you have the Linux /proc filesystem. */
- #undef HAVE_LINUX_PROCFS
- 
--/* Define to 1 if you have the <memory.h> header file. */
--#undef HAVE_MEMORY_H
--
- /* define if you have MOUNT */
- #undef HAVE_MOUNT
- 
-@@ -69,6 +69,9 @@
- /* Define to 1 if you have the <stdint.h> header file. */
- #undef HAVE_STDINT_H
- 
-+/* Define to 1 if you have the <stdio.h> header file. */
-+#undef HAVE_STDIO_H
-+
- /* Define to 1 if you have the <stdlib.h> header file. */
- #undef HAVE_STDLIB_H
- 
-@@ -141,7 +144,9 @@
- /* define if you have YACC */
- #undef PATH_YACC
- 
--/* Define to 1 if you have the ANSI C header files. */
-+/* Define to 1 if all of the C90 standard headers exist (not just the ones
-+   required in a freestanding environment). This macro is provided for
-+   backward compatibility; new code need not use it. */
- #undef STDC_HEADERS
- 
- /* Define to 1 to use the libtirpc tsd usage workaround */
---- a/modules/parse_amd.c
-+++ b/modules/parse_amd.c
-@@ -424,6 +424,7 @@ static int sel_in_network(struct autofs_
- 	return ret;
- }
- 
-+#ifdef HAVE_INNETGR
- static int sel_netgrp(struct autofs_point *ap,
- 		      struct selector *s, struct substvar *sv)
- {
-@@ -488,6 +489,7 @@ out:
- 
- 	return ret;
- }
-+#endif
- 
- static int eval_selector(struct autofs_point *ap,
- 			 struct amd_entry *this, struct substvar *sv)
-@@ -627,7 +629,12 @@ static int eval_selector(struct autofs_p
- 		switch (s->sel->selector) {
- 		case SEL_NETGRP:
- 		case SEL_NETGRPD:
-+#ifndef HAVE_INNETGR
-+			error(logopt, MODPREFIX
-+			      "netgroups not available, function innetgr(3) not available");
-+#else
- 			ret = sel_netgrp(ap, s, sv);
-+#endif
- 			break;
- 
- 		default:
diff --git a/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch b/meta-networking/recipes-daemons/autofs/autofs/0002-using-pkg-config-to-detect-krb5.patch
similarity index 50%
rename from meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
rename to meta-networking/recipes-daemons/autofs/autofs/0002-using-pkg-config-to-detect-krb5.patch
index 41de373fd..1bf95b8a4 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0002-using-pkg-config-to-detect-krb5.patch
@@ -1,10 +1,7 @@
-From dd90a690f95569b999b8ac9ab57e834b3421dcbb Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 27 Nov 2018 15:19:07 +0800
-Subject: [PATCH] From dabcbdae38038a8e4ad2c4286112381c407c5ce7 Mon Sep 17
- 00:00:00 2001 From: Roy Li <rongqing.li@windriver.com> Date: Tue, 19 Aug 2014
- 11:31:35 +0800 Subject: [PATCH] using pkg-config to detect libxml-2.0 and
- krb5
+From 796f1b5cfca595ba4e11ca9dab5c2c46c0710d95 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Tue, 19 Aug 2014 11:31:35 +0800
+Subject: [PATCH] using pkg-config to detect krb5
 
 Upstream-Status: Pending
 
@@ -13,15 +10,17 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
 update patch to 5.1.5
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- configure.in | 16 ++++++++++++++--
- 1 file changed, 14 insertions(+), 2 deletions(-)
+ configure.ac | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
 
---- a/configure.in
-+++ b/configure.in
-@@ -215,7 +215,14 @@ PKG_CHECK_MODULES([XML], [libxml-2.0], [
+diff --git a/configure.ac b/configure.ac
+index 76a38f4..1bb1a52 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -214,7 +214,14 @@ PKG_CHECK_MODULES([XML], [libxml-2.0], [
    AC_DEFINE(LIBXML2_WORKAROUND, 1, [Use libxml2 tsd usage workaround])
  ], [HAVE_LIBXML=0])
-
+ 
 -AF_CHECK_KRB5()
 +PKG_CHECK_MODULES(KRB5, [krb5], [
 +  HAVE_KRB5=1
@@ -31,6 +30,9 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 +  LIBS="$LIBS $KRB5_LIBS"
 +  AC_CHECK_FUNCS([krb5_principal_get_realm])
 +], [HAVE_KRB5=0])
-
+ 
  AC_SEARCH_LIBS([versionsort],[])
  if test "$ac_cv_search_versionsort" = "no"; then
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch b/meta-networking/recipes-daemons/autofs/autofs/0003-force-STRIP-to-emtpy.patch
similarity index 72%
rename from meta-networking/recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch
rename to meta-networking/recipes-daemons/autofs/autofs/0003-force-STRIP-to-emtpy.patch
index 1fc500319..942f38d8b 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0003-force-STRIP-to-emtpy.patch
@@ -1,23 +1,22 @@
-From 3cbee00fe5725b87abdae80cfa2ee735e4513ca6 Mon Sep 17 00:00:00 2001
+From efacbbe29b7212735046a7d0f2cd61148546ce9e Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Tue, 19 Aug 2014 11:31:35 +0800
-Subject: [PATCH] [PATCH] force STRIP to emtpy
+Subject: [PATCH] force STRIP to emtpy
 
 otherwise the generate file will be stripped
 
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
----
 Upstream-Status: Pending
 
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
  Makefile.rules | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.rules b/Makefile.rules
-index 709dd04..b1f7e50 100644
+index 6ce39e5..a6dcd7b 100644
 --- a/Makefile.rules
 +++ b/Makefile.rules
-@@ -31,7 +31,7 @@ LDFLAGS   ?= -s
+@@ -36,7 +36,7 @@ LDFLAGS   ?= -s
  endif
  
  ifdef DONTSTRIP
@@ -26,3 +25,6 @@ index 709dd04..b1f7e50 100644
  else
  STRIP     ?= strip --strip-debug
  endif
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs/remove-bashism.patch b/meta-networking/recipes-daemons/autofs/autofs/0004-autofs.init.in-remove-bashism.patch
similarity index 97%
rename from meta-networking/recipes-daemons/autofs/autofs/remove-bashism.patch
rename to meta-networking/recipes-daemons/autofs/autofs/0004-autofs.init.in-remove-bashism.patch
index 4183069bb..6065bc71b 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/remove-bashism.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0004-autofs.init.in-remove-bashism.patch
@@ -1,4 +1,4 @@
-From cfacbb917f87b903b50132a5025f86b0cc522e9c Mon Sep 17 00:00:00 2001
+From b5f4a3c2f02244209ac613aeb8ea406bdc39af27 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sat, 13 Sep 2014 20:19:28 -0700
 Subject: [PATCH] autofs.init.in: remove bashism
@@ -9,7 +9,6 @@ Upstream-Status: Pending
 
 Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
 ---
  redhat/autofs.init.in | 12 ++++++------
  samples/rc.autofs.in  | 10 +++++-----
@@ -116,3 +115,6 @@ index 487669f..e96cde1 100644
  	pid=`pidof $prog`
  	if [ -z $pid ]; then
  		echo $"$prog not running"
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch b/meta-networking/recipes-daemons/autofs/autofs/0005-fix-the-YACC-rule-to-fix-a-building-failure.patch
similarity index 65%
rename from meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch
rename to meta-networking/recipes-daemons/autofs/autofs/0005-fix-the-YACC-rule-to-fix-a-building-failure.patch
index fd736296a..462644b01 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0005-fix-the-YACC-rule-to-fix-a-building-failure.patch
@@ -1,9 +1,7 @@
-From 971d48a00ef82880c34e89778bf430a01360ebd5 Mon Sep 17 00:00:00 2001
+From 40318f4f6109d9810b7cb31518a7879ae7632f58 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Mon, 18 May 2015 16:28:36 +0800
-Subject: [PATCH] [PATCH] fix the YACC rule to fix a building failure
-
-Upstream-Statu: Pending
+Subject: [PATCH] fix the YACC rule to fix a building failure
 
 The original rule will create the header file twice, one is that the header
 file as the object file is created, other time is when create the C source file.
@@ -16,18 +14,35 @@ This lead to a race when compile amd_tok.o, the header file maybe rewritten.
   |          ^
   |../Makefile.rules:64: recipe for target 'amd_tok.o' failed
   |----------------------
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
 
----
 Upstream-Status: Pending
 
- lib/Makefile     | 6 ++++--
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ daemon/Makefile  | 3 ++-
+ lib/Makefile     | 3 ++-
  modules/Makefile | 3 ++-
- 2 files changed, 6 insertions(+), 3 deletions(-)
+ 3 files changed, 6 insertions(+), 3 deletions(-)
 
+diff --git a/daemon/Makefile b/daemon/Makefile
+index 3af38e6..2a7ffe9 100644
+--- a/daemon/Makefile
++++ b/daemon/Makefile
+@@ -44,7 +44,8 @@ automount: $(OBJS) $(AUTOFS_LIB)
+ master_tok.c: master_tok.l
+ 	$(LEX) -o$@ -Pmaster_ $?
+ 
+-master_parse.tab.c master_parse.tab.h: master_parse.y
++master_parse.tab.h: master_parse.tab.c
++master_parse.tab.c: master_parse.y
+ 	$(YACC) -v -d -p master_ -b master_parse $?
+ 
+ master_tok.o: master_tok.c master_parse.tab.h
+diff --git a/lib/Makefile b/lib/Makefile
+index d18c67b..51445fd 100644
 --- a/lib/Makefile
 +++ b/lib/Makefile
-@@ -53,7 +53,8 @@ mount_xdr.o: mount_xdr.c
+@@ -35,7 +35,8 @@ libautofs.so: $(OBJS)
  nss_tok.c: nss_tok.l
  	$(LEX) -o$@ -Pnss_ $?
  
@@ -37,9 +52,11 @@ Upstream-Status: Pending
  	$(YACC) -v -d -p nss_ -b nss_parse $?
  
  nss_tok.o: nss_tok.c nss_parse.tab.h
+diff --git a/modules/Makefile b/modules/Makefile
+index 6908da0..00dd7ce 100644
 --- a/modules/Makefile
 +++ b/modules/Makefile
-@@ -103,7 +103,8 @@ amd_tok.c: amd_tok.l
+@@ -105,7 +105,8 @@ amd_tok.c: amd_tok.l
  
  amd_tok.o: amd_tok.c amd_parse.tab.h
  
@@ -49,30 +66,6 @@ Upstream-Status: Pending
  	$(YACC) -v -d -p amd_ -b amd_parse $?
  
  amd_parse.tab.o: amd_parse.tab.c amd_parse.tab.h
---- a/daemon/Makefile
-+++ b/daemon/Makefile
-@@ -16,7 +16,7 @@ YACCSRC = master_tok.c master_parse.tab.
- version := $(shell cat ../.version)
- 
- CFLAGS += -rdynamic $(DAEMON_CFLAGS) -D_GNU_SOURCE -I../include
--CFLAGS += -DAUTOFS_LIB_DIR=\"$(autofslibdir)\" 
-+CFLAGS += -DAUTOFS_LIB_DIR=\"$(autofslibdir)\"
- CFLAGS += -DAUTOFS_MAP_DIR=\"$(autofsmapdir)\"
- CFLAGS += -DAUTOFS_CONF_DIR=\"$(autofsconfdir)\"
- CFLAGS += -DAUTOFS_FIFO_DIR=\"$(autofsfifodir)\"
-@@ -44,7 +44,8 @@ automount: $(OBJS) $(AUTOFS_LIB)
- master_tok.c: master_tok.l
- 	$(LEX) -o$@ -Pmaster_ $?
- 
--master_parse.tab.c master_parse.tab.h: master_parse.y
-+master_parse.tab.h: master_parse.tab.c
-+master_parse.tab.c: master_parse.y
- 	$(YACC) -v -d -p master_ -b master_parse $?
- 
- master_tok.o: master_tok.c master_parse.tab.h
-@@ -57,5 +58,3 @@ clean:
- install: all
- 	install -d -m 755 $(INSTALLROOT)$(sbindir)
- 	install -c automount -m 755 $(INSTALLROOT)$(sbindir)
--
--
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0006-Do-not-hardcode-path-for-pkg.m4.patch b/meta-networking/recipes-daemons/autofs/autofs/0006-Do-not-hardcode-path-for-pkg.m4.patch
new file mode 100644
index 000000000..ab99a98cf
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs/0006-Do-not-hardcode-path-for-pkg.m4.patch
@@ -0,0 +1,31 @@
+From 349cc55c4cb7c7b2f5e7de937e11f3c581028b23 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 24 Aug 2018 06:24:36 +0000
+Subject: [PATCH] Do not hardcode path for pkg.m4
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+update patch to version 5.1.6
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1bb1a52..4cebbd2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -12,7 +12,7 @@ define([AC_CACHE_SAVE], )dnl
+ AC_INIT(.autofs-5.1.9)
+ 
+ # for pkg-config macros
+-m4_include([/usr/share/aclocal/pkg.m4])
++m4_include([pkg.m4])
+ 
+ #
+ # autofs installs by default in /usr
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs/mount_conflict.patch b/meta-networking/recipes-daemons/autofs/autofs/0007-Avoid-conflicts-between-sys-mount.h-and-linux-mount..patch
similarity index 60%
rename from meta-networking/recipes-daemons/autofs/autofs/mount_conflict.patch
rename to meta-networking/recipes-daemons/autofs/autofs/0007-Avoid-conflicts-between-sys-mount.h-and-linux-mount..patch
index e2a94bf82..14faa0c75 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/mount_conflict.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0007-Avoid-conflicts-between-sys-mount.h-and-linux-mount..patch
@@ -1,4 +1,7 @@
-Avoid conflicts between sys/mount.h and linux/mount.h
+From 96e0e3ed49a0e00573fa5907ae80e6d262cb7644 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 9 Sep 2024 23:01:06 +0800
+Subject: [PATCH] Avoid conflicts between sys/mount.h and linux/mount.h
 
 linux/fs.h includes linux/mount.h and this include file is unused so
 do not include it and avoid conflict too with glibc 2.36+ see [1]
@@ -8,6 +11,13 @@ do not include it and avoid conflict too with glibc 2.36+ see [1]
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/parse_amd.c | 1 -
+ modules/parse_sun.c | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/modules/parse_amd.c b/modules/parse_amd.c
+index fb6b1b7..d86adf1 100644
 --- a/modules/parse_amd.c
 +++ b/modules/parse_amd.c
 @@ -27,7 +27,6 @@
@@ -18,6 +28,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #define MODULE_PARSE
  #include "automount.h"
+diff --git a/modules/parse_sun.c b/modules/parse_sun.c
+index a5351fd..8509781 100644
 --- a/modules/parse_sun.c
 +++ b/modules/parse_sun.c
 @@ -30,7 +30,6 @@
@@ -28,3 +40,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #define MODULE_PARSE
  #include "automount.h"
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-include-libgen.h-for-basename.patch b/meta-networking/recipes-daemons/autofs/autofs/0008-include-libgen.h-for-basename.patch
similarity index 89%
rename from meta-networking/recipes-daemons/autofs/autofs/0001-include-libgen.h-for-basename.patch
rename to meta-networking/recipes-daemons/autofs/autofs/0008-include-libgen.h-for-basename.patch
index 4c8b4ef77..13254f2c4 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-include-libgen.h-for-basename.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0008-include-libgen.h-for-basename.patch
@@ -1,4 +1,4 @@
-From 1651e7a35be8b3e2fa90ca57b073f6944664fa62 Mon Sep 17 00:00:00 2001
+From c754222ce955c893e8e3ad75d8c73835950d1931 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 25 Mar 2024 12:04:03 -0700
 Subject: [PATCH] include libgen.h for basename
@@ -10,6 +10,7 @@ include libgen.h for providing it.
 [1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
 
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  daemon/automount.c    | 1 +
@@ -18,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 3 insertions(+)
 
 diff --git a/daemon/automount.c b/daemon/automount.c
-index 3d9461d..61b3478 100644
+index 6cb3b1b..efc2680 100644
 --- a/daemon/automount.c
 +++ b/daemon/automount.c
 @@ -21,6 +21,7 @@
@@ -30,7 +31,7 @@ index 3d9461d..61b3478 100644
  #include <stdio.h>
  #include <stdlib.h>
 diff --git a/daemon/master.c b/daemon/master.c
-index f99359c..3f56499 100644
+index f2c11e9..1455e40 100644
 --- a/daemon/master.c
 +++ b/daemon/master.c
 @@ -21,6 +21,7 @@
@@ -42,7 +43,7 @@ index f99359c..3f56499 100644
  #include <sys/types.h>
  #include <sys/stat.h>
 diff --git a/modules/lookup_file.c b/modules/lookup_file.c
-index 6afc558..82b1f28 100644
+index 99f2e21..4914395 100644
 --- a/modules/lookup_file.c
 +++ b/modules/lookup_file.c
 @@ -15,6 +15,7 @@
@@ -54,5 +55,5 @@ index 6afc558..82b1f28 100644
  #include <string.h>
  #include <time.h>
 -- 
-2.44.0
+2.25.1
 
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0009-hash.h-include-sys-reg.h-instead-of-bits-reg.h.patch b/meta-networking/recipes-daemons/autofs/autofs/0009-hash.h-include-sys-reg.h-instead-of-bits-reg.h.patch
new file mode 100644
index 000000000..442a3138c
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs/0009-hash.h-include-sys-reg.h-instead-of-bits-reg.h.patch
@@ -0,0 +1,35 @@
+From 1a08bbed376c0dfa0ce2d12a93b34fb2d5620c05 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 10 Sep 2024 21:08:09 +0800
+Subject: [PATCH] hash.h: include <sys/reg.h> instead of <bits/reg.h>
+
+Fix build on musl:
+In file included from ../include/automount.h:25,
+                 from parse_subs.c:29:
+../include/hash.h:27:2: error: #error Wordsize not 32 or 64
+   27 | #error Wordsize not 32 or 64
+      |  ^~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ include/hash.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/hash.h b/include/hash.h
+index 0f1d7b5..f465ab8 100644
+--- a/include/hash.h
++++ b/include/hash.h
+@@ -6,7 +6,7 @@
+ #ifdef __GLIBC__
+ #include <bits/wordsize.h>
+ #else
+-#include <bits/reg.h>
++#include <sys/reg.h>
+ #endif
+ #include <linux/stddef.h>
+ #include <sys/types.h>
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0010-autofs-5.1.9-Fix-incompatible-function-pointer-types.patch b/meta-networking/recipes-daemons/autofs/autofs/0010-autofs-5.1.9-Fix-incompatible-function-pointer-types.patch
new file mode 100644
index 000000000..0e1558734
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs/0010-autofs-5.1.9-Fix-incompatible-function-pointer-types.patch
@@ -0,0 +1,64 @@
+From a6a79230110e998f780796cb1d4c5d3f59f20d1d Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 18 Dec 2023 13:48:18 +0100
+Subject: [PATCH] autofs-5.1.9 - Fix incompatible function pointer types in
+ cyrus-sasl module
+
+Add casts to SASL callbacks to avoid incompatible-pointer-types
+errors.  Avoids a build failure with stricter compilers.
+
+Signed-off-by: Florian Weimer <fweimer@redhat.com>
+Signed-off-by: Ian Kent <raven@themaw.net>
+
+Upstream-Status: Backport
+[https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/commit/?id=b7ff971bb8aa3fc609bb531ddc4c2ce56226383f]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CHANGELOG            |  2 ++
+ modules/cyrus-sasl.c | 14 +++++++-------
+ 2 files changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 3e47daa..fd9d861 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -1,4 +1,6 @@
+ 
++- Fix incompatible function pointer types in cyrus-sasl module.
++
+ 02/11/2023 autofs-5.1.9
+ - fix kernel mount status notification.
+ - fix fedfs build flags.
+diff --git a/modules/cyrus-sasl.c b/modules/cyrus-sasl.c
+index e742eaf..78b7794 100644
+--- a/modules/cyrus-sasl.c
++++ b/modules/cyrus-sasl.c
+@@ -109,17 +109,17 @@ static int getpass_func(sasl_conn_t *, void *, int, sasl_secret_t **);
+ static int getuser_func(void *, int, const char **, unsigned *);
+ 
+ static sasl_callback_t callbacks[] = {
+-	{ SASL_CB_USER, &getuser_func, NULL },
+-	{ SASL_CB_AUTHNAME, &getuser_func, NULL },
+-	{ SASL_CB_PASS, &getpass_func, NULL },
++	{ SASL_CB_USER, (int(*)(void)) &getuser_func, NULL },
++	{ SASL_CB_AUTHNAME, (int(*)(void)) &getuser_func, NULL },
++	{ SASL_CB_PASS, (int(*)(void)) &getpass_func, NULL },
+ 	{ SASL_CB_LIST_END, NULL, NULL },
+ };
+ 
+ static sasl_callback_t debug_callbacks[] = {
+-	{ SASL_CB_LOG, &sasl_log_func, NULL },
+-	{ SASL_CB_USER, &getuser_func, NULL },
+-	{ SASL_CB_AUTHNAME, &getuser_func, NULL },
+-	{ SASL_CB_PASS, &getpass_func, NULL },
++	{ SASL_CB_LOG, (int(*)(void)) &sasl_log_func, NULL },
++	{ SASL_CB_USER, (int(*)(void)) &getuser_func, NULL },
++	{ SASL_CB_AUTHNAME, (int(*)(void)) &getuser_func, NULL },
++	{ SASL_CB_PASS, (int(*)(void)) &getpass_func, NULL },
+ 	{ SASL_CB_LIST_END, NULL, NULL },
+ };
+ 
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch b/meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch
deleted file mode 100644
index 4cfd8edf9..000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From df5d45b2d7ad7e7b5f0542a816d08b0409a529a1 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Tue, 19 Aug 2014 11:31:35 +0800
-Subject: [PATCH] [PATCH] add the needed stdarg.h
-
-Upstream-Status: Pending
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
----
- lib/defaults.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/defaults.c b/lib/defaults.c
-index 0e48a78..667f35d 100644
---- a/lib/defaults.c
-+++ b/lib/defaults.c
-@@ -16,6 +16,7 @@
- 
- #include <stdlib.h>
- #include <stdio.h>
-+#include <stdarg.h>
- #include <ctype.h>
- #include <string.h>
- #include <sys/utsname.h>
diff --git a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-fix-lib-deps.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-fix-lib-deps.patch
deleted file mode 100644
index 8e06db6e4..000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-fix-lib-deps.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 080626108c9ab70e2489752ef2a14006d0564b0c Mon Sep 17 00:00:00 2001
-From: Joe MacDonald <joe.macdonald@windriver.com>
-Date: Tue, 18 Jun 2013 10:05:21 -0400
-Subject: [PATCH] Fix the dependency issue
-
-Upstream-Status: Pending
-
-autofs's lib sources have a dependency on a number of files that are
-generated by rpcgen during buildtime
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
-Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
-
----
- lib/Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/Makefile b/lib/Makefile
-index 518b483..4798a4b 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -81,3 +81,4 @@ install: all
- clean:
- 	rm -f $(LIB) $(RPCS) $(OBJS) $(YACCSRC) *.output *~
- 
-+$(OBJS): $(RPCS)
diff --git a/meta-networking/recipes-daemons/autofs/autofs/cross.patch b/meta-networking/recipes-daemons/autofs/autofs/cross.patch
deleted file mode 100644
index 2a4f4fd0d..000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/cross.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From b9b44cd82caceeb638cc6a862b5bb90b93ad6c6a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 5 Jan 2013 19:53:10 -0800
-
----
-Upstream-Status: Pending
-
- aclocal.m4   | 2 ++
- configure.in | 8 ++++++--
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index 2115204..2a9a802 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -7,6 +7,8 @@ dnl --------------------------------------------------------------------------
- AC_DEFUN(AF_PATH_INCLUDE,
- [AC_PATH_PROGS($1,$2,$3,$4)
- if test -n "$$1"; then
-+  AH_TEMPLATE([HAVE_$1], [Have $2])
-+  AH_TEMPLATE([PATH_$1], [Have $2])
-   AC_DEFINE(HAVE_$1,1,[define if you have $1])
-   AC_DEFINE_UNQUOTED(PATH_$1, "$$1", [define if you have $1])
-   HAVE_$1=1
-diff --git a/configure.in b/configure.in
-index 25d7c4e..44a1c8b 100644
---- a/configure.in
-+++ b/configure.in
-@@ -324,13 +324,15 @@ AC_PROG_CC
- cat > pietest.c <<EOF
- int main(void) { return 0; }
- EOF
-+AF_tmp_ldflags="$LDFLAGS"
-+AF_tmp_cflags="$CFLAGS"
- CFLAGS=-fPIE
- LDFLAGS=-pie
- DAEMON_CFLAGS=
- DAEMON_LDFLAGS=
- AC_MSG_CHECKING([whether gcc -fPIE works])
--AC_RUN_IFELSE([AC_LANG_PROGRAM([[]], [[int main(void) {return 0;}]])],
--	      [gcc_supports_pie=yes], [gcc_supports_pie=no], [gcc_supports_pie=no])
-+AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[int main(void) {return 0;}]])],
-+	       [gcc_supports_pie=yes], [gcc_supports_pie=no], [gcc_supports_pie=no])
- AC_MSG_RESULT([$gcc_supports_pie])
- if test $gcc_supports_pie = yes ; then
- 	DAEMON_CFLAGS="-fPIE"
-@@ -339,6 +341,8 @@ fi
- rm -f pietest.c
- AC_SUBST(DAEMON_CFLAGS)
- AC_SUBST(DAEMON_LDFLAGS)
-+CFLAGS="${AF_tmp_cflags}"
-+LDFLAGS="${AF_tmp_ldflags}"
- 
- #
- # Enable ability to access value in external env variable
diff --git a/meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch b/meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch
deleted file mode 100644
index 414325974..000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From c500d9906f163bf716c872d37403b9de02ef0a86 Mon Sep 17 00:00:00 2001
-From: Amy Fong <amy.fong@windriver.com>
-Date: Fri, 18 Jan 2013 12:13:32 -0500
-Subject: [PATCH] autofs: fails to compile with openldap disabled
-
-As of 5.0.6, it appears that changes were introduced so that
-if you compile with openldap disabled and openldap headers are not
-available, then autofs fails to build.
-
-Upstream-Status: Pending
-
-Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
- lookup_ldap.h |    4 ++++
- 1 file changed, 4 insertions(+)
-
----
- include/lookup_ldap.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/include/lookup_ldap.h b/include/lookup_ldap.h
-index 3a7aba7..bfdb0b3 100644
---- a/include/lookup_ldap.h
-+++ b/include/lookup_ldap.h
-@@ -1,7 +1,9 @@
- #ifndef LOOKUP_LDAP_H
- #define LOOKUP_LDAP_H
- 
-+#ifdef WITH_LDAP
- #include <ldap.h>
-+#endif
- 
- #ifdef WITH_SASL
- #include <openssl/ssl.h>
-@@ -117,10 +119,12 @@ struct lookup_context {
- 
- #define LDAP_AUTH_USESIMPLE	0x0008
- 
-+#ifdef WITH_LDAP
- /* lookup_ldap.c */
- LDAP *init_ldap_connection(unsigned logopt, const char *uri, struct lookup_context *ctxt);
- int unbind_ldap_connection(unsigned logopt, struct ldap_conn *conn, struct lookup_context *ctxt);
- int authtype_requires_creds(const char *authtype);
-+#endif
- 
- #ifdef WITH_SASL
- /* cyrus-sasl.c */
diff --git a/meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch b/meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch
deleted file mode 100644
index be750ab89..000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/pkgconfig-libnsl.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 602f9ca83c2bdbf511bcb178fcb4b9fc54da955f Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 27 Nov 2018 15:20:46 +0800
-Subject: [PATCH] From e3ae56cf0bb4063c31295f45d04e3c504f4b6cc7 Mon Sep 17
- 00:00:00 2001 From: Khem Raj <raj.khem@gmail.com> Date: Mon, 24 Apr 2017
- 20:41:25 -0700 Subject: [PATCH] autofs: Upgrade to 5.1.2 release
-
-Use pkg-config first to look for external libnsl which is now
-split out from glibc, if it does not exist then see if its provided
-by glibc itself.
-
--Khem
-
-Upstream-Status: Pending
-
-update patch to version 5.1.5
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- configure.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index 76ecb40..493b9f1 100644
---- a/configure.in
-+++ b/configure.in
-@@ -238,7 +238,7 @@ AC_SUBST(LIBCLOCK_GETTIME)
- 
- PKG_CHECK_MODULES([NSL],[libnsl],,
- [
--AC_CHECK_LIB(nsl, yp_match, NSL_LIBS="-lnsl")
-+PKG_CHECK_MODULES([NSL], [libnsl], [], [AC_CHECK_LIB([nsl],[yp_match],[LIBNSL="-lnsl"],[LIBNSL=""])])
- AC_SUBST(NSL_LIBS)
- NSL_CFLAGS=""
- ])
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.9.bb
similarity index 62%
rename from meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
rename to meta-networking/recipes-daemons/autofs/autofs_5.1.9.bb
index e3f977738..bc52f40d1 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.9.bb
@@ -3,55 +3,44 @@ SECTION = "utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ee9324a6f564bb2376b63878ac396798"
 
-DEPENDS += "libtirpc flex-native bison-native e2fsprogs openssl libxml2 util-linux cyrus-sasl libnsl2"
+DEPENDS += "libtirpc flex-native bison-native e2fsprogs openssl util-linux libnsl2"
 
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 
 inherit autotools-brokensep systemd update-rc.d pkgconfig
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
-           file://no-bash.patch \
-           file://cross.patch \
-           file://fix_disable_ldap.patch \
-           file://autofs-5.0.7-fix-lib-deps.patch \
-           file://add-the-needed-stdarg.h.patch \
-           file://using-pkg-config-to-detect-libxml-2.0-and-krb5.patch \
-           file://force-STRIP-to-emtpy.patch \
-           file://remove-bashism.patch \
-           file://fix-the-YACC-rule-to-fix-a-building-failure.patch \
-           file://0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch \
-           file://0002-Replace-__S_IEXEC-with-S_IEXEC.patch \
-           file://pkgconfig-libnsl.patch \
-           file://0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch \
-           file://0001-Do-not-hardcode-path-for-pkg.m4.patch \
-           file://0001-Bug-fix-for-pid_t-not-found-on-musl.patch \
-           file://0001-Define-__SWORD_TYPE-if-undefined.patch \
-           file://mount_conflict.patch \
-           file://0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch \
-           file://0002-autofs-5.1.8-handle-innetgr-not-present-in-musl.patch \
-           file://0001-include-libgen.h-for-basename.patch \
+           file://0001-no-bash.patch \
+           file://0002-using-pkg-config-to-detect-krb5.patch \
+           file://0003-force-STRIP-to-emtpy.patch \
+           file://0004-autofs.init.in-remove-bashism.patch \
+           file://0005-fix-the-YACC-rule-to-fix-a-building-failure.patch \
+           file://0006-Do-not-hardcode-path-for-pkg.m4.patch \
+           file://0007-Avoid-conflicts-between-sys-mount.h-and-linux-mount..patch \
+           file://0008-include-libgen.h-for-basename.patch \
+           file://0009-hash.h-include-sys-reg.h-instead-of-bits-reg.h.patch \
+           file://0010-autofs-5.1.9-Fix-incompatible-function-pointer-types.patch \
            "
-SRC_URI[sha256sum] = "0bd401c56f0eb1ca6251344c3a3d70bface3eccf9c67117cd184422c4cace30c"
+SRC_URI[sha256sum] = "46c30b763ef896f4c4a6df6d62aaaef7afc410e0b7f50d52dbfc6cf728cacd4f"
 
 UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/"
 
 INITSCRIPT_NAME = "autofs"
 INITSCRIPT_PARAMS = "defaults"
 
-# FIXME: modules/Makefile has crappy rules that don't obey LDFLAGS
-#CFLAGS += "${LDFLAGS}"
-
 PACKAGECONFIG[systemd] = "--with-systemd=${systemd_unitdir}/system,--without-systemd,systemd"
+PACKAGECONFIG[openldap] = "--with-openldap=yes,--with-openldap=no,libxml2 openldap"
+PACKAGECONFIG[sasl] = "--with-sasl=yes,--with-sasl=no,cyrus-sasl krb5"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 EXTRA_OEMAKE = "DONTSTRIP=1"
 EXTRA_OECONF += "--disable-mount-locking \
-                --enable-ignore-busy --with-openldap=no \
+                --enable-ignore-busy \
                 --with-confdir=${sysconfdir}/default \
                 --with-fifodir=/run \
                 --with-flagdir=/run \
-                --with-sasl=no --with-libtirpc \
+                --with-libtirpc \
                 --with-mapdir=${sysconfdir} \
                 --with-path=${STAGING_BINDIR_NATIVE} \
                 --with-fifodir=${localstatedir}/run \
-- 
2.25.1


