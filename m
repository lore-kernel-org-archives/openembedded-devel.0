Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15150CD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 12:51:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.37049.1712235096556854847
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 05:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CPO/VC6i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4824332259=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4347jjFg020589
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Apr 2024 12:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Q0pkHsIfT+07S8lyOR
	JZKksGxClBlLA5OHnCMHWwx4s=; b=CPO/VC6izHUAaSzQqNhSN4Z79mLlePR8t/
	b6f5vs+aFo+cwxgqhcMx8AyeGQ+mqi06gLfmOohXoC90BbY4vD+XubP4+tfbLr2A
	vyS/h5YtTiUqXrmp3RRb0dzQYNXOrX4htr+B5TtOPApszTuJavp6J4w/G1qtrMZ1
	QfbxOC53U0++cnQPcbtP9ukT7zCFue1CbPKlFrtP/Hj2kYaXqcoEBE7Mvh3QE/VO
	69AaBlXl7cGtKIFt6PfX6J6U6rq69vqL6vZN3N6lK585400APPRY06Bg432B5Rq8
	SFRvskcq5EFy5DPcBdqWrZZrUngqpGTlOai6S/C+iNwCyMsC16PA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x9epd8k3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 12:51:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScH9a4zAL69wnmgXvJSFeQ80T/dorw88taLSXn9qwj88goPIP3KCBj5hZlPnv5wv1qz9DDBrT8EPGwWzLhrWOOl3zJiH1P5CQ5TZjStRJF6ocCEVw85FS5zMvTIAGDvjovDbS7a75gFAyLMqtqjKNILyraOdFRUNxnXyQt/HTk0FSFmXxaBlLD5y3nVTV9TpEctOHTTHAdrZm7jx3PTDDkgX+4fcX+Ea3dnnmJ/FTrMf3BPJbn0tqugpC/SArVHg22v+J/aOldtHh8IAXPKcVtNNIu0kUyeHY+FwClnxzB9CaH/CDQ8FQQB4nPKKE2NJNsA4jxbAtcj+V2XAsE/WyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0pkHsIfT+07S8lyORJZKksGxClBlLA5OHnCMHWwx4s=;
 b=Sy+jXMToiJhOHcgaSnWo3YFt3/O8GmwjOPJmMUtVhkALRJ+9YWkcc9C+QAmQhRoWsTvz4kHHyk/pMBQIVgJY/KPwIgVAfKXsPiqeEhgmTmZMi+wdDIa6OGQnp45HJL+DUiFKrlP/eQVodemuwZVec6xspAOCwd/gwEPQ9rC8loYbggxd92r0yev9KccqmDoIKTB4kxeNNXsxba0gJF/h/39z5FBLC0LEK7puKdHY2Rcl4ZPlj/u0kgIAnPBarGml1klkNsNqg4xwdz8SH6VtnwHIWVqkSDrQgR+FT2MaVfO8o6liLcl4rTeiJ1VAsnxCRZ+PsSIb9Ztg7j/ufcPbUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by SN7PR11MB8110.namprd11.prod.outlook.com (2603:10b6:806:2e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 4 Apr
 2024 12:51:32 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 12:51:30 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] rocksdb: fix build error for DEBUG_BUILD
Date: Thu,  4 Apr 2024 20:51:18 +0800
Message-Id: <20240404125118.3067969-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::23)
 To DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|SN7PR11MB8110:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7lQUUSn3O+Ep4VtevclLdGL09DTp5ifyGrpVn1P9mqK/qsud+0fS9k6gWnmEZrUqYxZaICARK8XijLGER95MkxUbuRZ5SAeLJ9o4ntV8Msm2SJv5WNll/DcoGCfj5/j1B878j1izsTKkqkakbjL7WWOTeDcD+FjtMN9ASm8j/o0gKRfPV4Vqb3BJEjBUlnMuFeNc8gNXPv/bwJsxCDSOzeBWrdkSj/CdCTNCJCkD6Zo21juFkyfYlKoQuWPe6XWr7t6q/hagIPJXj+1rStxEzVcULsKz0nsTCTQGDcag0HM8pok4qmrq5f/fdbRREbtDTZlymOZv+9hO5zkgUPtyjn4m9zl1UD3ch3Mz6a7PHdHydC++Q8kQKPoGueBVMdTsll0Z+WMy4+8XaSjRfkTSOAJRVTZbrFAiXtlWn9+LkqB6HnsyM9DPKYBaBduvs1Taz3jyJaX2YlItRhpxPR+hUiazhRuJWIcFCVcM8vC3uvsLvDZCJZX8jPmaHpQh/aCaIiaId6BgqUHDU1qHSeb3blgFRuKtYxmoPDi9fpZiS8UJ7GCmLQS9GlvVDm7IT5wZ3Qz5NS/W+farT31k4Z2zbG0zbdHPNnqQBXc1uIRJJuSQ+6i1xAhKzH9tIznbN7Biy33TpjPdb7L9jX4mIsQbVwlaHgs5omOlzo7bk97xOuV4YwhV+v6TZ4rvfNzwVCTV9rIhd8CPeeLSGzJkxvLDaQgOHXT735Yf7zSRFKCZkdg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JBAmWWh53xQODqfz6X168cqawpEeFHIg+yxkCBgF9craz01BD1Y5Ipd9jPpT?=
 =?us-ascii?Q?1IoufUfLkflkyBnijaTAyo6nZTT+xoGQQBQf3P1bRrtEEGUnNH1L9hNLUOcz?=
 =?us-ascii?Q?rn9UZwDD9ftaIoyxCn3kWkhDQaSSlrF7IvF3Lv3bP5VCvNVmsW+vpWbJKMB3?=
 =?us-ascii?Q?u7k0O/UKLejHIo6Mkh9eAsSSAQyIOHlv1MvLMKC6v860BTMAhHP+QjKiz/x8?=
 =?us-ascii?Q?efAbeWCqGo0ZwUJx8V506t09hFqoZbFsS+1qS5TdxQRrf1nB7ZQE1faDT5Yf?=
 =?us-ascii?Q?9HjYYQF9Avx5sJZF8oGTmY0ZYE9fZs3ams0EuNtjNhb8RLV0pBW0IacZiWZY?=
 =?us-ascii?Q?yvKdhZedhCjfLjm/79wQLrMnbkofGWEZeHg4KExV3pVnlhQBWrdn4NlZOx2N?=
 =?us-ascii?Q?9QgZG0sq/2TVs2lno8sp5KQFSI1RdB+JkW3GA5q3DwFQYilN/6acMbXzm2/a?=
 =?us-ascii?Q?AttKvZQ/yxNC4ThCSgbxO4OUGb5EAzDyLKAAO82IKFJKNMY1YmZrLYkvYvHk?=
 =?us-ascii?Q?LIhhpp66XNDcM65Rw/jbV7dO8ZRqX4iPDWu0eySZ5Ev6qWt+x8cyof/jOQgV?=
 =?us-ascii?Q?RSWQKV2y5GBwZc+/FwoZdldbcjIFe6QM9lzTbvQPAYKJilbgr55ZC54vATed?=
 =?us-ascii?Q?cogLSTS4szNjuId8XU8GWjXHHzZx80g9fwU6HqAny1pNXfDHOcBJYZQakPlq?=
 =?us-ascii?Q?YxxfggmHClft79nMywnYz5YF2ML6oqkGShqXgPHVV7zU/LQ9x4eTsi8PSKlo?=
 =?us-ascii?Q?09QIkLxU5/sAvbgtx4VZzPdXfBB0mz6HqWK/jbXMEnA8NfBZi8ktfyRHsH4f?=
 =?us-ascii?Q?/T6jpuvCBLW3o+qtc8XsGeT55s/dU17BoulzSAT5kAQB08IxPYu4C3IvnFME?=
 =?us-ascii?Q?J9Qq5kFpAFfNaaEt/MRcRjpZoWdgukjQgUDFmEfCNAUyFCJYSJCBsNTQicKF?=
 =?us-ascii?Q?KkEKKb5ynqGogR6cvogHRYR7YWtAeVd6/qWDbOiQKtZp039fy27Fkw3cVMgj?=
 =?us-ascii?Q?Q3H2uB0DbAx1pLmxvLaenM0G+RpQUcjjdG+98tisPMLQt0pNxTYe7j34mr12?=
 =?us-ascii?Q?fUlc1e71jJhCp/he+VAmWdWJG3mCgdTlPtAjCLbny0q6885u2S2iGXm6iVNj?=
 =?us-ascii?Q?bW1fN4IwIHLa3hV/W/f0cYKyMNS6r1ziZ54XSkGupUKdVZ9oKDmSztSylZv7?=
 =?us-ascii?Q?e/ijtReXTGUo03trZ0fy9C3OOusXSWzQNZePMtZukP8b8gaE/cUHz/CXhl/W?=
 =?us-ascii?Q?2XS9uPl2lJI5NbQR7IRsg96KfZ0p2uDsyMXs9zsYNLZBAQ6gfo7BIyjvkIkC?=
 =?us-ascii?Q?x7tPlJhFvpo2VR54RTpMI9uylmMCS41KCJecSJByKPr8eXCy0t4lIXnmu7vW?=
 =?us-ascii?Q?pgzw0ZYxiH97IgkW8sPBgjxjuHm7m99tr6lFuYDI/3oT5SFFs1hORkRFHpvG?=
 =?us-ascii?Q?gZFmO1ab7HwLGElj9A9goPt0N9gGQarBYNr5tESPLGQlGL6/JLrwZfwnXE7J?=
 =?us-ascii?Q?Yyl3TFpQxQwH3fidE3Fgx8n+FNcVF8Io2Bz3WUaWEQ7kzJDYu+cWrAldaCBC?=
 =?us-ascii?Q?YUZ7X4IcIXhjNaxbqqRdLegXcy1CSnfLWqHHRolI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bb4b94-ce32-48dc-2669-08dc54a5f2e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 12:51:30.3270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: taWI5jNnoZSV+8TP2VJBC0sHiRDt5iDa7lKaxv/LB4NLOoOmuoyad5o4I+P+8k9DrVzbUbp7LK+ifdDPyJQBIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8110
X-Proofpoint-ORIG-GUID: CbYKFkw4X-i4dZ3hJ2KVTEsBTQ-jmgJs
X-Proofpoint-GUID: CbYKFkw4X-i4dZ3hJ2KVTEsBTQ-jmgJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-04_08,2024-04-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 mlxlogscore=751 adultscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404040086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 12:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109796

It fails to build rocksdb when '-Og' is set in CXXFLAGS (e.g.
DEBUG_BUILD = '1' in local.conf):

rocksdb/9.0.0/git/util/xxhash.h:4491:1: error: inlining failed in call
to 'always_inline' 'void XXH3_scrambleAcc_sse2(void*, const void*)':
function not considered for inlining
 4491 | XXH3_scrambleAcc_sse2(void* XXH_RESTRICT acc, const void* XXH_RESTRICT secret)
      | ^~~~~~~~~~~~~~~~~~~~~
rocksdb/9.0.0/git/util/xxhash.h:5139:19: note: called from here
 5139 |         f_scramble(acc, secret + secretSize - XXH_STRIPE_LEN);
      |         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rocksdb/9.0.0/git/util/xxhash.h:4177:1: error: inlining failed in call
to 'always_inline' 'void XXH3_accumulate_sse2(xxh_u64*, const xxh_u8*, const xxh_u8*, size_t)':
function not considered for inlining
 4177 | XXH3_accumulate_##name(xxh_u64* XXH_RESTRICT acc,           \
      | ^~~~~~~~~~~~~~~~

Check and disable inlining when "-Og" is present.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
index 76d75f2b5..ee007acfa 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
@@ -44,6 +44,8 @@ EXTRA_OECMAKE = "\
     -DFAIL_ON_WARNINGS=OFF \
 "
 
+CXXFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}"
+
 do_install:append() {
     # Fix for qa check buildpaths
     sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/rocksdb/RocksDBTargets.cmake
-- 
2.25.1


