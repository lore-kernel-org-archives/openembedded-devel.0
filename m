Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD29CD11C2
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 10:13:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.71282.1712484819583048342
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 03:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Gxa5MBad;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4827be4202=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 437ADcCd010430;
	Sun, 7 Apr 2024 10:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=l3XY5VzVX8u0Bkt3gw
	Zj6qCBm++MApQgCjJ03hqMK3o=; b=Gxa5MBadUv6tjMn5u185kYjzyHa1rq7dv0
	Dt4Se8ZVz8n8lalQWyzy+CrEgSUbGQThCFxTlyz1JrTwUIQeqT4o+BB8r4P+7fBR
	bNXJf5pMqmRHjRV5pvzspA4cYXhwRR7NnqD8zDV23hu05YwbSmN+I58pOEq1wgkc
	ZJyDPYwpAyj+IYdxJl30uvWJZzHZxNGmD+LNyGEI78fgGJV1uGEtzgCkBaC3GzqS
	ulrLY95JorcnWchk1PnOCLgx1OC2rKVKl+/lzTu4GXEKUXJ/NWEpfD4y0KcbPI/X
	tRkFhU57FCZdFPECMZaLNYH+e/vxi3PmPusZxSmFae1jAoKSNP1A==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xaukxrw9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 10:13:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0gizKtoUeEtVQaGVsOr4kuJfRgKpKYkUXVQqb76ISmBNj5TUssvXrk7zslGJv3qKnjyNoXww0/eeKs+cC4EWMaRpEU5XmHCElXZ/CFRXu8WOyNfhU6ujUu6OB/lci9HVGQZfsuEasHyRVKQt9gQs9ZXvnLr40uo2KSK8dKdH3ZJj2/Al+JRWev9gueQeK8gHJ+nuv0yJCx2Fhsi9tYqn6QjcMqGsO85tCwV7GegqViBOkIPWe/UqkwrkZ/D+XaBmGO6O3mg+kjhwhNvkf5DNWGx3eDveJ89pU+RDbC48eUEr6tj1Zm06LulXBTi+gZkHZH5q/D8Jjo/YJ9+FkirVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3XY5VzVX8u0Bkt3gwZj6qCBm++MApQgCjJ03hqMK3o=;
 b=gCmMO6ZwseyTE/E+s7Do6EI2MyGfTpH+j37yt86JgTrAbDG1No2feBL1IPRE04Qf2pE+pS8724+UKDxX1pvZ5wdEEB6UvK4slKn/j4WD9jynWT8G+do15jH/kCgMxk4zX3QIORpAhuEUPSB3gULS6WxtTVbotbzLAyRm3jONBpu7W9hJu5dxI6yX5pELphRRcYZ91ug4UPwm+fO0cyECyyIVE87F0lUkb7rc6rIXepPme9He1Z0KHkNrQgayYvhLSW5bGcCQzaIhQ3blWeYVL5/HdwOjKYMoe0DcJmTxDqeXTvVcsHbJOAXjUB9GW4wUhlmOKAoNOSj7x/sblFjp9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Sun, 7 Apr
 2024 10:13:36 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7452.019; Sun, 7 Apr 2024
 10:13:36 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] rocksdb: fix build error for multilib
Date: Sun,  7 Apr 2024 18:13:24 +0800
Message-Id: <20240407101324.3180691-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|DM4PR11MB7328:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mLt/SpfsNFFUwd+TEj9A+d0EBI92tYy7VLjpLHhXDqukX6/4JEXHWiPOaWAl1lm/Dk8+4rd6njY4qrvnaZmtL4COgX4mwtetVC6lU1HsB4a0ICjI+7SuR620Hzy1roZJbVBi9p8VkwG8H7ZEN6J/HTT6sV+WBG9G2CMGwyKN3lWS2NKY20JNty1BckF6PWqmp3wC5TLiUkus1fKsMZ8rLXwKNJ86ef8tLQUF4aPp46B8GcMJOnhKm2jXlkE7WP5RhCZ5CUWvBUKUUQw/0MK0jAnYbbqhiuP4CxNQHxleGUCff2iUbf9sSQM2WYSs1ZSSyb01Q//K6fcPDnaDQPdyoqNPRJ+ydyhNT8pZUiv4bDnuwsAyOnHiEH9FcQXZsSpPkr6EFRZUU59Albc5Lv9t7y7Mq6A/A3hT4p77pJUW+KNQDLNvYnDuDFSed/Rl605CvkGxebklop+tF6Vf0r2ErqRsk7G/9r5zAcW6FpGZV4zHTFxPANAHr+99v7FfmH1LQPMyCh6tkBeNl1aIeOnccAU41gm8vLXTF6H46jYUp+PibYOqdg8QltuY7ggyFxR4buXb08TWUJaSmCGPl/qo9afbPv0UJyaudei0uYT1oFiUwHmM3ObRyoapZxG5onJSygC5xdo5aGLqPDmqB0qlecoQId7jGFyzU51JdzkPHhQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ip6JXuAe/EBpmpSG7Ud8Vs8nLaoCHTuIPmf291v4yOujyIBV5zdgvfe2mW4R?=
 =?us-ascii?Q?sQKYgU8IZwB4zYKSZKFQi5fmGH6JzhKgKwAhfP+8rs0Ph8wYcs4POOYMuPDk?=
 =?us-ascii?Q?pCOEceknDtrH3LmXs1oK7wOkxt7y9Qc8/T1X04A+mgJwvSLX77nwcO1Zu89D?=
 =?us-ascii?Q?jlZNWTQ6YbPo4ozsvBjn7bDLIOc9q/3iDQssM7CNCMdxTUurTyreRDCPKmqO?=
 =?us-ascii?Q?iwpdptc8wXSBIMkgWi4Hvj/Y0SnTahpcR9JqPaBD4KwNHR3pWJrwkN9PqhPH?=
 =?us-ascii?Q?5Kcoocpyzj+fo9/a+2KthO2LuqNk/tTpgH69fC7wdN2+98iw7xigWOea8H+R?=
 =?us-ascii?Q?EW3++Y9Vu1p3BB9EkvhHsHdlZ9j4x++dBvCoQcBGPrIex9N/MI3Mu3x/9fpT?=
 =?us-ascii?Q?yQoVYf4H+OKFb0PQ3yVM1hG83LJEHJiUAWOgtDFf5qupXyXDdTrY9F1DhpBo?=
 =?us-ascii?Q?YZaAQIOyHctp2wUFebt6KmLV8m1geDaVUxMbFbyQIyjyK7mcYZjvcmBdKv0W?=
 =?us-ascii?Q?GaBnkUCQiijxASULebngRpoCmk5ziwDQhWTkIiUrDmoHwjj8TBIaBUjMiF9r?=
 =?us-ascii?Q?ZPSe+wA2OCqmAaYDUFIyaEjmsA12U2OZwuOBqVvH1XUsxoFXPgmMWdVHdzMh?=
 =?us-ascii?Q?jdJw90hTOuUyGsxGc+dZoz3OI0hRxvvWtoZ0pqNNrnB3mBdGk5oxJJN347BN?=
 =?us-ascii?Q?3wS7FQSysKmJW0qho5NsYwQGLbpkGWW/kLAHxBr0P7XbB7KOJobNf2oyddhb?=
 =?us-ascii?Q?lUNffcbMc1BO0xH2M3QjWCKUjmwZhw0xfnbs46pOsaSvYloHeeoKrlq9IFuw?=
 =?us-ascii?Q?ROlI1BJqja2NwjxIvhb/5YIJYO/eiwcmlruj9TyKOMjzUnW/R7WxYGM6nSXf?=
 =?us-ascii?Q?fSYn2L8HB/REp4IjYVa0zvA9ML7IqjSeoonumkwp9llCdCTUX5aJ/2bot8oD?=
 =?us-ascii?Q?kKErB5TlwWB9C2CAsTKT+MQm6teC35bw0jGUtFZNJJpFqf3+flliSRNQ6px5?=
 =?us-ascii?Q?dldEJZPlYI0c33h+WinqZ4BQ2zAyTPXBvJvZeafJ8CDFLP5lo+exZ8pcgnOM?=
 =?us-ascii?Q?2r++KzkLbUmsLMshLvL9OswxtnAPvr0Z0dPy3rlghvP716aNuJ4rf7Gs0zU3?=
 =?us-ascii?Q?8l/2mS0D89eieBDIcGCPnEFF6vfcV3PkVeGkmVLv810YF73rRxNxHWz8Cj9t?=
 =?us-ascii?Q?O5M9QpXW5mCa9o8E4KN+2iDcDjNY2l6QQpTUyPGS0eLGPwu+Dtdc/6p6Nhoe?=
 =?us-ascii?Q?og2JDly+7kWIfVwMLQICEalbvTVwGh+Cmsa1y1lvzH36HGuWsc0d4sgxb5zs?=
 =?us-ascii?Q?z3BhExTY1FAGqjLEBRuXY3RoOKX6NkvTGCuNuee9FktYnJhkEGO2gSVEK0xW?=
 =?us-ascii?Q?iHLn4RcL188mV6Lb1SsiEDJyZgrF4vZ0zX+fE0HscyYmzBgkjUKtnxx71XtZ?=
 =?us-ascii?Q?MpWdBedYGAHaB0JiXcJ1FAdMYB5wJ/RxRuTUO6tfXGPmMWa3S3SCctwdFGDX?=
 =?us-ascii?Q?wpl0zUovHxPGx5qHqVVkB8whZO3SmEoUl4Xi/l38Bx23qGJ52HQt/tq381Gx?=
 =?us-ascii?Q?CNn8M1Odb098SZetdcyzZGS8fOULCyuWImQK2xQz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1650f5-00c9-4502-4ec6-08dc56eb6363
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2024 10:13:36.6160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEmcoOpZuiTOzzbiXCtFJOD07NzQMt0AgvTv1MRxpVjFEGJxAAVSoWmzwqHkzb7zvXzUuG/6iNhhDDVlpTnP2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7328
X-Proofpoint-GUID: Cuj0KczDxTreH8qaqMYWxENk27CFteFk
X-Proofpoint-ORIG-GUID: Cuj0KczDxTreH8qaqMYWxENk27CFteFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-07_04,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404070081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 10:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109839

Fix declaration scope of LE_LOAD32 in crc32c when building
lib32-rocksdb:
util/crc32c.cc: In function 'void rocksdb::crc32c::DefaultCRC32(uint64_t*, const uint8_t**)':
util/crc32c.cc:267:53: error: 'LE_LOAD32' was not declared in this scope
  267 |   *l = _mm_crc32_u32(static_cast<unsigned int>(*l), LE_LOAD32(*p));
      |                                                     ^~~~~~~~~

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...aration-scope-of-LE_LOAD32-in-crc32c.patch | 39 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0007-Fix-declaration-scope-of-LE_LOAD32-in-crc32c.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0007-Fix-declaration-scope-of-LE_LOAD32-in-crc32c.patch b/meta-oe/recipes-dbs/rocksdb/files/0007-Fix-declaration-scope-of-LE_LOAD32-in-crc32c.patch
new file mode 100644
index 000000000..9ba34450b
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0007-Fix-declaration-scope-of-LE_LOAD32-in-crc32c.patch
@@ -0,0 +1,39 @@
+From ed549d43c8b691cd7891c7e5c76df189feb04b4f Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Sun, 7 Apr 2024 17:16:53 +0800
+Subject: [PATCH] Fix declaration scope of LE_LOAD32 in crc32c
+
+Fix build error when __SSE4_2__ is defined:
+util/crc32c.cc: In function 'void rocksdb::crc32c::DefaultCRC32(uint64_t*, const uint8_t**)':
+util/crc32c.cc:267:53: error: 'LE_LOAD32' was not declared in this scope
+  267 |   *l = _mm_crc32_u32(static_cast<unsigned int>(*l), LE_LOAD32(*p));
+      |                                                     ^~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/12515]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ util/crc32c.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util/crc32c.cc b/util/crc32c.cc
+index 38a69bb50..aa13ad882 100644
+--- a/util/crc32c.cc
++++ b/util/crc32c.cc
+@@ -242,12 +242,12 @@ static const uint32_t table3_[256] = {
+     0xc747336e, 0x1a0299d6, 0x782010ef, 0xa565ba57, 0xbc65029d, 0x6120a825,
+     0x0302211c, 0xde478ba4, 0x31035088, 0xec46fa30, 0x8e647309, 0x5321d9b1,
+     0x4a21617b, 0x9764cbc3, 0xf54642fa, 0x2803e842};
++#endif  // !__SSE4_2__
+ 
+ // Used to fetch a naturally-aligned 32-bit word in little endian byte-order
+ static inline uint32_t LE_LOAD32(const uint8_t* p) {
+   return DecodeFixed32(reinterpret_cast<const char*>(p));
+ }
+-#endif  // !__SSE4_2__
+ 
+ static inline void DefaultCRC32(uint64_t* l, uint8_t const** p) {
+ #ifndef __SSE4_2__
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
index ee007acfa..444351dbb 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=htt
            file://0004-Implement-support-for-musl-ppc64.patch \
            file://0005-Implement-timer-implementation-for-mips-platform.patch \
            file://0006-Implement-timer-for-arm-v6.patch \
+           file://0007-Fix-declaration-scope-of-LE_LOAD32-in-crc32c.patch \
           "
 
 SRC_URI:append:riscv32 = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
-- 
2.25.1


