Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BAAE77188
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 08:59:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.79688.1735635551429053800
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Dec 2024 00:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3095ea9653=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV7gNWT010181
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 08:59:10 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t8a82da7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 08:59:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JElBaHnsoIN1tZxLL2whhCCcwVS6RAMpyQR7ird6Wm/mm+o3qE4SqehiwKWBFanLNiUSooLXJ3Hq2elZjIpR8ysDQnGhxipHvXmMKo4nRRg8Fi0BWMYOIdGFAPYIwxoEhEsrgj5Inbh+sqys1FIEt96AV6hFYplBR/ZHhsxY+R9fYOyNP3L/syjo9SuGshfk+tSADymrIOFZUFqXpz9fj8Fo3yexo75M4hziqOd7FwKRI9Fz8twRP+UhzD8zAuX/6OYO+GfDq79JSjpoZY5jiEeCyN2lhNJoMHLUJ4Gj4WuXCqz8PbWgZgeBxLS4vIDFN6+tG6sHfuuyhOhGHCVxfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6F0OR+pbHg+e+VGDhysVLo50yKWnxd0NkUzUMJzekrs=;
 b=guGwehIeTHdVK9wiwWO1CgcijYkpSa25mtSgnjgCxEwh8ms9cJH4r2kRq8u1YSXkNEu/cAz88ChfQE41sOOrSAlbwHJYUed+/aN8e87iILb6Pv41UWR3tEmGXiKhFxAqDJzw4QqNhuD8tpuCmijzHeih9SVl2fpQNV3i5aO2+fpypMIopR9ygIrSbrSjbiMJA0ysiC1sJAaKYfe6ofKuEC1mFydP/jj2he6NbbJaaty42b1zCxPP+ao05qDhkYJFM4wGPJLK8ftDyaSqZLwjBA+zwbLbFdVUxDVm2ITBFJ2Ep4LX4Wl/aFq9hMFawdVl67NrqEUPESAbuH+qlQJ0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL4PR11MB8846.namprd11.prod.outlook.com (2603:10b6:208:5aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Tue, 31 Dec
 2024 08:59:03 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.011; Tue, 31 Dec 2024
 08:59:02 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] openldap: upgrade 2.6.8 -> 2.6.9
Date: Tue, 31 Dec 2024 16:58:45 +0800
Message-Id: <20241231085846.4022015-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231085846.4022015-1-yi.zhao@windriver.com>
References: <20241231085846.4022015-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL4PR11MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e7f9bb-c272-4b39-5f6c-08dd29795f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TxTYZAmTc6A6YHTHzKGLzG4z5jnPJl/t9lQYqGuzeZLt9ASQK25nOFr1GGeZ?=
 =?us-ascii?Q?hLYbBJ0U72Ltac+oR8eponeW48i4+iVki/FttBKqkVxDmvwamEYH5w/z6SWE?=
 =?us-ascii?Q?cpVxVrk9ZfSvbc0EJ1jo0M75gVwSEnMXrORX76S17g8vp9VkY8XOTNtgNZQ5?=
 =?us-ascii?Q?P3tVqwRENxja/HfxNyGBru2wfl5kudx7JdHZvsl6G3Qcpg/Y7YIibaK1m02x?=
 =?us-ascii?Q?5g0zioekf9pMjF+oj8qaKaacdoPuckhHW72QcagO5MtaMpXI5cu1KAedeOUH?=
 =?us-ascii?Q?8iUKqi/+xzaZOfxbqkY5GizDdsrfjQZSxcs4GqvQWqdn/x2Q8LXATYRKah20?=
 =?us-ascii?Q?o3GoS9reV7eSmO5N6IOlZb+LuujQ54sPt4HlHFRVgyB6Kgb/XxOp7kdG/Dfy?=
 =?us-ascii?Q?V0zul1v5mstp1z3b9WtMXknkqaMopCY/JB6N5SLQsK/rNa5pXlxop0iXeLFL?=
 =?us-ascii?Q?wVlvfSscGw7fMrNER4f+rQMWD8ipN650DxQwtKJiV18BEl+cdhXLB1Su+jcJ?=
 =?us-ascii?Q?VD055c/GS54s3jjF1sYqQKlVHSkBLyj5xx1X2DF+a3ly4EflJPn5zvRdcXx3?=
 =?us-ascii?Q?oT23iVFqhWqC6w0k7IFRnp0yTBa/KP4jONiqYT+6wwx3dY284iRPMFMjsFiE?=
 =?us-ascii?Q?TPZbnb3vxCXTgRzkhro0uvI1fht5RhJoj0OGBJUklHKrm0VS4ASS9kp34Vvg?=
 =?us-ascii?Q?asNz8Y6IZ35fRTyf77Q6Bl76bmSBQe1bMMjOe52/+ZTK2bN/QKZxCAAXTxyd?=
 =?us-ascii?Q?IgGn8LDdBeEz6iVSb5eRPFxhLwZ0Fnc5xymbgg82RbEmQbrNDPcwuozyASCv?=
 =?us-ascii?Q?rAHBBnI8y9LFUHwHHv+M681UCTNbxJRIApXQjijPGXrCGub1o8FnbGOmFRIE?=
 =?us-ascii?Q?a/p2WQPWH7gmZ1W6U6LfbI1lsFXacKLjAiKVwO7oR/WpXphg10Y4pRasoiVF?=
 =?us-ascii?Q?7EZMduLH3WQChC/7Y0xKQaKkd85QIVBetxAqhQpN6SkUqxr/AV1sff++/O+O?=
 =?us-ascii?Q?N8Lvu2EzfL7EO303YLwcL/c5jesfJd2I9v8jh1Vf6z8nmf/mYgLtXwMFOOIV?=
 =?us-ascii?Q?jlodVdUXpubvN2Rwwyge14b+DUHE/AopITbO04k3X37qyS5SJ08e8UERPfiX?=
 =?us-ascii?Q?vgYm4m9vyAfRGfwF4oWF42Ww8iWkj+OnH0duoa1nv0T7YL/5nZr8zzjsrH2g?=
 =?us-ascii?Q?IauodsczJDUTtgRcZ5ObQ0qlfTXJyeduNcavjKku8f1gxBlzlNCTX9o1ANhJ?=
 =?us-ascii?Q?OOkdgeWDqFFQ2l1Z7t+/d0167ak+8Qqa/bW2ty/kTj29V5iOXtLxpQjxPBEl?=
 =?us-ascii?Q?ET7WCDoR6Up/dkACmjT7mZxL8s4s9jym7n2UOgzG8OzSO0GI4tES8q2z75Lb?=
 =?us-ascii?Q?8ROhDxHvTeXwP82rxa1anwzR5KcdADIlRZFKzpICYT4pXVFRXA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l/pO+rw+DWBQMPLVn8HijltAw4rzDUnFoZ+Lbnrlmriv4ntqu3M8JPUhrCKc?=
 =?us-ascii?Q?/8xzFHqkYsz0MWY/5RH3M6HVEO6XS9pXEYnaYkqRpSp04bhuE0dY1t6U0hIQ?=
 =?us-ascii?Q?SN8RqIHuO/F6xDn0T+M3vpxCfQMG+8DPQzVWhn4PZLato9CZMiNoC7seMjj+?=
 =?us-ascii?Q?bBG6wbgtIKhVPIvO2ODIt2hzoYg9nhbMlZPJvoWBz0wHRmHIf51fItagwhh1?=
 =?us-ascii?Q?8+00yW4Bm3kUkujsWMpHF9Zi2EXHMWUy/iwawaQSrj2gDnPAk5nxtDhcB2EG?=
 =?us-ascii?Q?N5ejTTnAyIeeQ00TKmbgjxzH/qRAi7UpyWcNi0Q9zkjhV+lJ/mfC+9J6nWHq?=
 =?us-ascii?Q?lT4f7dS3zL/jocjwjsy1rfBAZnUSEOtCF9Q2FrwoxeDOHy3a7Y4+ATA4t2B5?=
 =?us-ascii?Q?NKgTvbuhNy2ZTY1yA7jH3H3ETHrwdhpjzPJROUWs4hENmxkG2oCIWJ9oF+qQ?=
 =?us-ascii?Q?N+4CPjKbBL3QPaSHzIjfAsF3siv6+8DqfSFqRthwQ6PDUxxC0LQz1KfkCtvJ?=
 =?us-ascii?Q?uSfpD+vsJj2MbUFWWOn+ecIZCsNHkbqAb6fqLb9nk2tHCt9YfE9/Zr1odU02?=
 =?us-ascii?Q?XenO43yRR3/NWwBzq6oDM4ijUZidcdXrIPvjkfYX6d0ncrhdNpZGkZwL++eq?=
 =?us-ascii?Q?MP8GIwEnCvyFoBM5TbiNCrFBxIieiOq0WqeMrl57dcloz48/jnOyEZgrAmhK?=
 =?us-ascii?Q?e02b9Dofpo1eDusA174E9H62VOoy03oWDQe+DvfuvtcXhRSSSFgbcTEojJdg?=
 =?us-ascii?Q?1hmwnJsHywPImN8IUm6SAzaoJHnXTdmBzA+S50SMOk2HIghPHHMmtOvf4pr6?=
 =?us-ascii?Q?e5+hqfFhxUmMtKNpbpO4aHEyQYNKYjrgAaB1/NOgrBQLkhpsViW06R+aoX8j?=
 =?us-ascii?Q?g+diBcoJ8DIq9b1+tYLrenQnKVwfFGHD9C+nkhgWNbYcQeE2+6mDgwxnyRV2?=
 =?us-ascii?Q?MvYWyLN0Yg1kqD//RPtP1LkEyBZWBaQJwFamp6xLHX0eZT+CivMiJWWY4HIV?=
 =?us-ascii?Q?jsUcx61pXCGeK4uvqy/K/VBHhl7oLV6mEfkT5Inkf2rS0E/WUm1Bd04yAwjQ?=
 =?us-ascii?Q?/cV2E9tjGIIwg3SpBc9tEKPyRWGnAI7tbda4rYBcE2rLIEYmvnwOwXLTn0wi?=
 =?us-ascii?Q?B6j10X+xHmROYjEsvIe0cK2psHU81oMDkrS5kayGJg0sT2H/w36SQsLDCqms?=
 =?us-ascii?Q?hRuRAvMGsCJ3wWmpWkUQLRQOVSyMIqFenxHfd4Ggu/G0sgJY1uyCkhDqgHeG?=
 =?us-ascii?Q?HFna7+TjHQHW9wUJ20GMC95jPjEcI9PhbANeJEkn8gVvKKUpawPEZnvvFTRS?=
 =?us-ascii?Q?1iYfUUcXD5ZxsI4GogA9Uwum/jq5YmXSdcLfoRt7hrW/ODbuq6y6bLlQ64yl?=
 =?us-ascii?Q?M8XyxN2nl1VRz6Pl+ioGP10yD+N48JVT6W3+OHAGG9Lg3lalyawf++8FRCzU?=
 =?us-ascii?Q?vbXs7fRDDb8cUKo71DeP+7hLE5VGBYt3JseqIvXCW+YhKep5OHGi+00BeLJR?=
 =?us-ascii?Q?JLaPPOquAHTtxqrm8yYfSFKKPR6Rm0v5Hg19DEY0hsuXfRNd2j2qrG/+EX/b?=
 =?us-ascii?Q?yuwlmSJ4KXq6/sRcEN0ZyGLligRpWov333B7odj0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e7f9bb-c272-4b39-5f6c-08dd29795f8e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 08:59:02.9016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8Y95Aje6mmq2/SqpJi1Wl9lPZMkR/YjtHzft6aQXVpV2YSDDS2AfLOGmtxGeHROTvL0vrTbM9YP610xMT+fig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8846
X-Proofpoint-GUID: lsqmW6moCBTvtGyGQlNAusZ-8pog12AI
X-Proofpoint-ORIG-GUID: lsqmW6moCBTvtGyGQlNAusZ-8pog12AI
X-Authority-Analysis: v=2.4 cv=f8qyBPyM c=1 sm=1 tr=0 ts=6773b25e cx=c_pps a=LJpgAVzrtcldLI4wrjuEkA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NPAVlATjAAAA:8
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=omOdbC7AAAAA:8 a=KYYBbj57iOmQYoz2jPgA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=-8FpEQFizJoA:10 a=nC1j-RkR7Y4A:10 a=cu1Uyvz4t9k2bJ5fYRxP:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-31_03,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412310075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 08:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114603

ChangeLog:
https://www.openldap.org/software/release/changes.html

Drop 0001-fix-incompatible-pointer-type-error.patch as the issue has
been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-fix-incompatible-pointer-type-error.patch | 40 -------------------
 .../{openldap_2.6.8.bb => openldap_2.6.9.bb}  |  8 +---
 2 files changed, 1 insertion(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/0001-fix-incompatible-pointer-type-error.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.6.8.bb => openldap_2.6.9.bb} (95%)

diff --git a/meta-oe/recipes-support/openldap/openldap/0001-fix-incompatible-pointer-type-error.patch b/meta-oe/recipes-support/openldap/openldap/0001-fix-incompatible-pointer-type-error.patch
deleted file mode 100644
index e6ab4e5a46..0000000000
--- a/meta-oe/recipes-support/openldap/openldap/0001-fix-incompatible-pointer-type-error.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 634017950c1c920d0de63fffa5c52e621de1d603 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Wed, 26 Jun 2024 07:41:01 +0000
-Subject: Fix incompatible pointer type error with gcc option
- -Wincompatible-pointer-types
-
-lib32-openldap do_compile failure with gcc-14:
-| tls_g.c:971:57: error: passing argument 4 of 'gnutls_fingerprint' from incompatible pointer type [-Wincompatible-pointer-types]
-|   971 |                                         keyhash.bv_val, &keyhash.bv_len ) < 0 ) {
-|       |                                                         ^~~~~~~~~~~~~~~
-|       |                                                         |
-|       |                                                         ber_len_t * {aka long unsigned int *}
-| In file included from tls_g.c:44:
-| /usr/include/gnutls/gnutls.h:2406:32: note: expected 'size_t *' {aka 'unsigned int *'} but argument is of type 'ber_len_t *' {aka 'long unsigned int *'}
-|  2406 |                        size_t *result_size);
-|       |                        ^~~
-
-Upstream-Status: Submitted
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- libraries/libldap/tls_g.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libraries/libldap/tls_g.c b/libraries/libldap/tls_g.c
-index 7c23875..b4b487d 100644
---- a/libraries/libldap/tls_g.c
-+++ b/libraries/libldap/tls_g.c
-@@ -968,7 +968,7 @@ tlsg_session_pinning( LDAP *ld, tls_session *sess, char *hashalg, struct berval
- 		keyhash.bv_len = gnutls_hash_get_len( alg );
- 		keyhash.bv_val = LDAP_MALLOC( keyhash.bv_len );
- 		if ( !keyhash.bv_val || gnutls_fingerprint( alg, &key,
--					keyhash.bv_val, &keyhash.bv_len ) < 0 ) {
-+					keyhash.bv_val, (size_t *)&keyhash.bv_len ) < 0 ) {
- 			goto done;
- 		}
- 	} else {
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.8.bb b/meta-oe/recipes-support/openldap/openldap_2.6.9.bb
similarity index 95%
rename from meta-oe/recipes-support/openldap/openldap_2.6.8.bb
rename to meta-oe/recipes-support/openldap/openldap_2.6.9.bb
index ca27ab23ec..6d76a727ba 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.8.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.9.bb
@@ -19,10 +19,9 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://slapd.service \
     file://remove-user-host-pwd-from-version.patch \
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
-    file://0001-fix-incompatible-pointer-type-error.patch \
 "
 
-SRC_URI[sha256sum] = "48969323e94e3be3b03c6a132942dcba7ef8d545f2ad35401709019f696c3c4e"
+SRC_URI[sha256sum] = "2cb7dc73e9c8340dff0d99357fbaa578abf30cc6619f0521972c555681e6b2ff"
 
 DEPENDS = "util-linux groff-native"
 
@@ -230,8 +229,3 @@ python populate_packages:prepend () {
 }
 
 BBCLASSEXTEND = "native"
-
-# This one is reproducible only on 32bit MACHINEs
-# http://errors.yoctoproject.org/Errors/Details/766968/
-# tls_g.c:971:57: error: passing argument 4 of 'gnutls_fingerprint' from incompatible pointer type [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.25.1


