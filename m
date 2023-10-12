Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D7EC46CA1
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 11:56:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9202.1697111791804017456
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 04:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=En6ofQIo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86490ded89=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39CBBcCD013736
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 04:56:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=ZtYD3/ni1ltVtbFtOK+vL1049l/QObVx79ifKxbfpGM=; b=
	En6ofQIocTaBb8pfIOtwpUN4ayxVLWpEyJ6BTBtNS1+jFVbaJT8uXcSS+0sq3vyP
	WqE+KonTopPRJKdnlxbkjtZuoDJ1WR5Xju5xi6jEkQGvxvAn0Fqf7tW+a94d0MCl
	Aj0Ucun1tR6v2aqs+N+dqekRaCdh4QTEPPL65WwfQDom33RB0z+hJoutNCtpvUgz
	fg4mwMuf7u1CorXo6A1Q4OUc4541pA1WFNt/eCvc8eJTU7RddUKldpEj2p1F+LsS
	CD4Pe++dVrcjWEDCgm3xbkRbVezM2+At+lLn+Z1xS9Mn1IHaA5UAG9E/Ao8+Cjnb
	c6ceuH6MojApThJ2mmSS6w==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhq4scca-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 04:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acCvZlvF5TW2CGCTWVyYdLcK+zfR8of/Ulj7hFZl1b9o2KaymlVJu2E81v/k8XPqHlDcPJ1w04WqW1MxIT3ZNtuMdIe9eVzJmYmDO0ktdU+oK7yXuEna27a4smjnlMRUm18l0fYylROCZTTshRVJOzIMh5aDBBsNiJKRWgHZ2mGbhXrLiXrjzxNkrjiGEKoA7/idcLJpDAs4cl2RdqoFoDgCAt+MM3pJcwVUdCoBvbb2IyG1CaGFP5v9tsCYbzTdvW6UD2K4IHMIYxSavkpDjF0Bt9CN0X/5m8CkPEfh9qhWVRG4MqsAqj65Coe9/Q+2QGvuLL/Aeuj3tPZm3Y3Tdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtYD3/ni1ltVtbFtOK+vL1049l/QObVx79ifKxbfpGM=;
 b=IMc3PM7azHub1yP+dfTTL+ARooqV2UkPUNWlYRjZhV5QTTRiB2yydf6LcNcWhJ70bQ/bZTjP78XzktUlQ6iz4DRXUkAKcJdJT3fE3ROLJxhGBfXGE3aJJYvDMtpgDldSfAZbTxQtTTm4l+3HeIptfxI8/YI62afXRT/Uc4ILDlE46O4nJWE7OboHa8I7NiIbju7S/wJYFbKPpXn0JcZTB1ygneGTVN/fQ4h/nK9yfK3suRQUa+R2k01gYvwz/vB0Osd++SAuhDVES4fbnle58IcEqCkSCyup0detYt0u66M3Yb1AM6N0rQFbhAGtnyZ6c5Atal7llb9skYHK7SRUEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 11:56:29 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 11:56:29 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/4] samba: use external cmocka instead of bundled cmocka
Date: Thu, 12 Oct 2023 19:56:12 +0800
Message-Id: <20231012115614.3133797-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231012115614.3133797-1-yi.zhao@windriver.com>
References: <20231012115614.3133797-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:3:17::14) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: c3214ee4-6bd5-44aa-e56d-08dbcb1a44fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cody39VvsbBp7k0X8AY2ObE2/MkUvFgt/AuypPjEtK9Zskqb3JgW+qe+LG7ZR2TCPmRrSnVmb41xLevC3LjxhQhvJIZEqnjY76V2ZK7RZCuEXdwoq8KMmW+GirAgUqyziSZfaX9wizPm7O3pL6uY/BZ4wgJV8Qro3vs+zxJLNeRTWcEwSEgT86pcNT1nxezZJh/K52Yn5G4YFNhiWipDqovxhOvaa8O+r09IRPhbMiWH2iaYuGBpznsC1rZnPDGYepAM+rhGT7fLrAvhrOEMMz6QXb4LhAUVa9+pLwnUc+ZvePLGs6/w5lfDhPFK2AEWR3uTUGVYwEzmxZ7nXgUrW+lWIwbiYDg90yj213F3TyoS3rdUuqanRQuwn+XxS5Qzau4lb4qCm6raCf/bVEdyGUxzrMHkmFtYLMqypjMWpAv1zCkViktnrDeQ6Op+6lGJbaTVOtoTk34iLzchjgDNi6uzSyAkvW0y1HZhNoLFaFzZuwfVERSF3oFVXTc0qgEVJc0A8jWbtUvkoE/XzLI1jAolCrbn5TYKbZn64+B6WeFnqofFk+/DW3OhrDBKBqEOYRJryj4yDoJWnRr5AuiuzG1GApz10spalLprtAHx62ioipvkuqXQwI/oWDwix9MG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(366004)(136003)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(1076003)(2616005)(83380400001)(26005)(6512007)(5660300002)(44832011)(66476007)(66556008)(316002)(38100700002)(6916009)(8936002)(8676002)(66946007)(2906002)(6666004)(41300700001)(38350700002)(478600001)(52116002)(6506007)(36756003)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7UXjcNS+35UsLQwKOeNSu2T9uFkV85DQcBv2GzktZzJEy3Va5fLAcErtzQ2n?=
 =?us-ascii?Q?A10fxbGYVcXXZEK99iel/Kt2Wr4OWJFriVP9qej2bPXgkROz9pbDS1t0kU9H?=
 =?us-ascii?Q?Gjr1tF+rEKoOsA5laR94cwO8xN+49oLznruQWhm18WU/3tw5BM9vvuFQ3ni2?=
 =?us-ascii?Q?/Ak1vJAMAje+Li7XV8hSYcEqO8uwRC3P7QsGIQycKxXY2szRe5At2ViMnRvC?=
 =?us-ascii?Q?knWQ8cfTo9uBjyesWXTTVILi2h+ByzT+aRye8sIZ54FIcWLRcrb5qiz6b3rP?=
 =?us-ascii?Q?GFwR4QhGDz4PurzvJxYWI74TjNG+bsOPuwy6mvgepiGubL/JfZs9nKS1AdiR?=
 =?us-ascii?Q?13yCC9J3LrMKsgEu9dFbA4xE29LdavQxnCtCJoZDqPBdzqq3dj2XMpJ1qZeC?=
 =?us-ascii?Q?do1aT9auC4ydkGZdPXB/WBrn99mcUsPS9d5JGKTJIDAbRYCkbiRbN57oAE+q?=
 =?us-ascii?Q?b/ER3+Zy+6iPxx2eSLaV3NODMHYDvex9h6vJ/iUt4tgh9DrQ/03LEcJl2WGW?=
 =?us-ascii?Q?Rdrvj7GFiJjYow3geekXzJWoCzVI79QmsiSHPmX8evmtVr0khrB/3Li0ekgR?=
 =?us-ascii?Q?zP+eCBdw2wH9wmXLylkkuJPe6dNuihfo5R7GZIe5gcFKfVcyl47bL8MV3oKl?=
 =?us-ascii?Q?C2eWBLPaYLNNQsnzjKHukGeHiddG1lFONERKKxDVWPtAyTT9JySoLKRoi3fh?=
 =?us-ascii?Q?UL/v8j2G4/svd6EutTSk4MUuCxaZwBiu2I5SSx+NnUTQ8JV2kO413fgmDaWm?=
 =?us-ascii?Q?qr53skRO+JCxXS1l2LdEBOtI54AHs19BRd4fi/c8OLGv9gY+FgXstkSklw1J?=
 =?us-ascii?Q?OR67EjmLtbx0jcp+4skgTU66NWtjBtmCPboSHzWreJwZ2liBjOsKfpYFd/Vs?=
 =?us-ascii?Q?QV17LOaSWpVLn0gvu4Tb4hm0oF4QH8wS1vYQSFaf+kBaqFffqPUfe4qYlLLi?=
 =?us-ascii?Q?dBmvLqIA2skDqgZ8KkdD5eFBLtBkRoptXeQyV68XmroDfPG1woYGfMGgJjef?=
 =?us-ascii?Q?sKiK8KHvx2az6ySzZXozucnSXuBTyKaPdwM7D8da/M17tGusD8pO8z81Frw6?=
 =?us-ascii?Q?+qy94d3RuiB3xowylCXeyGwGIdsE85KI3wYVp9lRTTnBD1zMexFjgbOMQmiQ?=
 =?us-ascii?Q?EJz9KRCd5DKW86T00gRvxNvnvaMapQDy0UdW7gPsr3VXI6zgN/927ZJY2EuB?=
 =?us-ascii?Q?/RxzhX24JWF0QVJH4Fui1O6l61hexYOzMu1M/TsujXsSg7w4koXpuWJTRS6Q?=
 =?us-ascii?Q?JUmdcpPqLpH8SFgFFjXmTLOiAekkK3kfLdjARUyo0KPGRs8BqMMoAVlOOL1I?=
 =?us-ascii?Q?jDM3U/Gb0++mJAZX96U0DFe2BmwHrqI9MFRhixn83DEgmJHEYyTaF/9oO3ki?=
 =?us-ascii?Q?RzrLxGuWA1Go5Vjy+5OP3KyNeGd6HaqqwKEHRijZdAxdR+lZueQ4nllyG0Pu?=
 =?us-ascii?Q?0xBNGnwX/jl6uwQ77oNx1c0LTmdgbzk3Pg6fkATLzxMuQsVK6cvMBvOg/HKY?=
 =?us-ascii?Q?5xonrUj3ml0OihaNI3VRLRo501f6reIfvzkduAilSHZoOkVCmGL3BGdNZHbv?=
 =?us-ascii?Q?MIyeLOPsz5oxPgUY0SVQscZDOwKhhjIrzWymm2G9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3214ee4-6bd5-44aa-e56d-08dbcb1a44fc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 11:56:29.1824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIM0Ho7f4YWtsoVlea0pvW5NZS3yt/1HskQVFAIauQNDh8G0NBn3jQiMuZSQgI34RYmAytlnucMq40X/N83W1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
X-Proofpoint-GUID: WyJG-q4a9oZqdxqANH82ePxhGYq878uO
X-Proofpoint-ORIG-GUID: WyJG-q4a9oZqdxqANH82ePxhGYq878uO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=818 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310120098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 11:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105446

Do not use bundled cmocka to get rid of bundled library
libcmocka-samba4.so.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/samba/cmocka-uintptr_t.patch        | 51 -------------------
 .../samba/samba_4.18.8.bb                     |  5 +-
 2 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch b/meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch
deleted file mode 100644
index e6e878433..000000000
--- a/meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 14f8ee7cd1318567b00e52217d57f0a528fd2cf7 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 25 Jul 2018 09:55:25 +0800
-Subject: [PATCH] samba: cmocka.h: fix musl libc conflicting types error
-
-Fix build on qemumips64(el)
-
-taken from:
-[PATCH] libldb: fix musl libc conflicting types error
-
-/third_party/cmocka/cmocka.h:126:28: error: conflicting types for 'uintptr_t'
-            typedef unsigned int uintptr_t;
-                                 ^~~~~~~~~
-use __DEFINED_uintptr_t in alltypes.h to check if uintptr already defined
-
-Upstream-Status: Pending
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- third_party/cmocka/cmocka.h | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/third_party/cmocka/cmocka.h b/third_party/cmocka/cmocka.h
-index e6861c8..238201d 100644
---- a/third_party/cmocka/cmocka.h
-+++ b/third_party/cmocka/cmocka.h
-@@ -111,7 +111,7 @@ typedef uintmax_t LargestIntegralType;
-     ((LargestIntegralType)(value))
- 
- /* Smallest integral type capable of holding a pointer. */
--#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED)
-+#if !defined(__DEFINED_uintptr_t)
- # if defined(_WIN32)
-     /* WIN32 is an ILP32 platform */
-     typedef unsigned int uintptr_t;
-@@ -135,9 +135,8 @@ typedef uintmax_t LargestIntegralType;
- #  endif /* __WORDSIZE */
- # endif /* _WIN32 */
- 
--# define _UINTPTR_T
--# define _UINTPTR_T_DEFINED
--#endif /* !defined(_UINTPTR_T) || !defined(_UINTPTR_T_DEFINED) */
-+# define __DEFINED_uintptr_t
-+#endif /* !defined(__DEFINED_uintptr_t) */
- 
- /* Perform an unsigned cast to uintptr_t. */
- #define cast_to_pointer_integral_type(value) \
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.18.8.bb
index 1ded9fe5e..dc9bc1a7f 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.8.bb
@@ -29,7 +29,6 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
 SRC_URI:append:libc-musl = " \
            file://samba-pam.patch \
            file://samba-4.3.9-remove-getpwent_r.patch \
-           file://cmocka-uintptr_t.patch \
            "
 
 SRC_URI[sha256sum] = "4fb87bceaeb01d832a59046c197a044b7e8e8000581548b5d577a6cda03344d1"
@@ -43,7 +42,7 @@ CVE_STATUS[CVE-2011-2411] = "not-applicable-platform: vulnerable only on HP NonS
 # remove default added RDEPENDS on perl
 RDEPENDS:${PN}:remove = "perl"
 
-DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libaio libpam libtasn1 jansson libparse-yapp-perl-native gnutls"
+DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libaio libpam libtasn1 libtasn1-native jansson libparse-yapp-perl-native gnutls cmocka"
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
@@ -105,7 +104,7 @@ SAMBA4_MODULES="${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_AUTH_MODU
 # .so files so there will not be a conflict.  This is not done consistantly, so be very careful
 # when adding to this list.
 #
-SAMBA4_LIBS="heimdal,cmocka,NONE"
+SAMBA4_LIBS="heimdal,NONE"
 
 EXTRA_OECONF += "--enable-fhs \
                  --with-piddir=/run \
-- 
2.25.1


