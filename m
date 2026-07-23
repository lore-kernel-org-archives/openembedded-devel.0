Return-Path: <tugrul.kukul@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143D7C4452B
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 11:24:39 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21274.1784805873875450375
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 04:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gBbDURX2;
 spf=pass (domain: est.tech, ip: 40.107.130.4, mailfrom: tugrul.kukul@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+1pOdlZbjvXHwzmRC7vOI2kmO6ubzK+7Xrj2BqHUlru7vJLu8eCvdOiPhAIkuSlbBydwu+JueQ3PUM5faCv6Y34HtPqEy8qrs+um3iyvidG3u11JgGJrU9wwNDdY55vkUgkeWXQVBCckbufwF32aU2T/X2aRURKOulF2+QUgacsVgknUeCNUba8OhwBG6b551akOxe910Jhtl5APFO7RzPha6G7gzSAzCfaNZ5UCBO3bcXclfIZOzQo24nuvNFG4fCBBH0JmUyiEObY8zMyWfhSOVRw2Q2c1dyglPlERS8+KHMQg3evSr6K1qvMwnKxXkYzDWLTAa6QPbJ2Vj3nNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLbT6UzGaOwpUgwbyuJ1RYEEonCX15penP9rV+7dGU0=;
 b=EkSkr6FEpGGdzpbPI/68hEsa+r3pQUKBrcd2yU6OCOMyEz5R1LUp8jLQBI46zcUeJWS42JpFMda3X8sO6+x2Y47LNoDFQ3WE31vVQvpi6WIJq8PiRc9rEcSNljgGrioWG9ro1E7pDcHVupKys/8iuLNY3czhiqFsh26VvpyKiYEOtAiTE8SpUHz40WWI5NxC7DB5NHNkC/sWssR+jZnGOIrKSH/4JGSFPZ3ny8NRCgj0bzDalD6XhYg7y1mpjzUTM64PZbNivy5QqqwhfFEcEsBJQlDA05I0hp4yTn0LL4moRYiMQ1E8ExaQzfF9YHjWU2eUQa2VuEzuPrXJfE6+vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLbT6UzGaOwpUgwbyuJ1RYEEonCX15penP9rV+7dGU0=;
 b=gBbDURX2wpDvjOhi8k33lcVOcGKtPu/htjBnwWGW+gVL4QCn2x6EpuwwpJptOBRcqEAav7CSHhbEWsnZQgeBo1lrM96oTuCTj0WecO1MbjODNcGLYrVGfZiXueWiNGT4FroycY3kuCsYkS7Zil07z9PbefSPY/Mlkzxl0Z5RpUIUuSsC1fF09FfyHciTRhKJ4aOCS4GqIHDL9KiWrFzVYLsIqGXV3BWhUs0+bqwi7l7UCy/WidBCdxLJnm5mXOjqdZyAy4KriEzxIGHYs5eP9e38aoKJ4WoeeVKaEJCemIU4vpOypKzkHD8l8cYR9bXIDPH3iZ2BPb/vB3qnh/FgSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB8P189MB0966.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16b::8) by
 PA1P189MB3390.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4fa::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5; Thu, 23 Jul 2026 11:24:30 +0000
Received: from DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 ([fe80::48c:33b2:d870:d0ca]) by DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 ([fe80::48c:33b2:d870:d0ca%6]) with mapi id 15.21.0270.004; Thu, 23 Jul 2026
 11:24:30 +0000
From: tugrul.kukul@est.tech
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] jq: fix infinite loop in CVE-2026-47770 backport
Date: Thu, 23 Jul 2026 13:24:19 +0200
Message-ID: <20260723112419.73941-1-tugrul.kukul@est.tech>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::23) To DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:16b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8P189MB0966:EE_|PA1P189MB3390:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b1151c-3788-4838-043f-08dee8acf66f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	VHm2hkrIRWxxKdkuyTK7y6Wv9P8tuX85jcusrJXef9dfmmycDMzYRBI23JArRocsDkMqkj94TCtrLRE6Ew7d8VO1isPfGPDdMXYZs/lPhn30xRiCHhRCup+4vqhb3RuRTpxTQPLPgoLBSwrMK/OHzvEpajo9Mru3T6lzgZ6kGl9ujmpwFPlqZdIH0gKNd6HwR8rYQBRjOBLoUQlKg5gVXKOX+plev3Ic4zkAQt3608OFdZRpxDxvIU/MUvLhlc1lvCV6jwdGFXy3TKg7JGXglXQ837XEhDBFfQC+FCk2uIFhXfp8DfC0wXI+Dh/mZhmK4XsjTJfO07MvZGP+oqNcz0HPEhe2ZqJ2H67n3mDMe2VQHDItV1Gl/RBLmcNfan5qJeB3Of9VHPewD+K/EJd1OSJF22a57p2s3LkFjX1uWS9GwT+Q3FZWDlemfuFCbrPp9F4KONanP10bkqjh9WQ+2Qm8y6XTwpek3PK7EWLcEGpjuaU9TBlLTFH2TgteHAJBxC+EZup9vlHyjyjhMDOFDwEjbT9Fh1G6jKv0jEUrVFrgiyes7woWKBHVqq1MglqtM0t2JNSq974JBqAtpK2CWU8Yy+jjczDJcyfnL0E+3s+YMK+JSX1JVBUeH12vB1pAFvKLlsrBFHWJ98U+/sezLqMMAoujwY1S80DwsjoicHk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P189MB0966.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L8YoJwtfNWubZOHq+j0xNMGzEx2r2lF5Aum3ATxXCqQBKBa62KP2AFeBCy9j?=
 =?us-ascii?Q?TRSBOXYpm+7Mla5Eflhw/IiQVEuw+MuC/HrZc6Win3rArXYEdlhXEKNm6M9P?=
 =?us-ascii?Q?l1hS/g2QAU6VNc2Hpl5/Fx0fj0emQe3BQItO5Vd4+/mDv9CnUEAbY8e2xuvi?=
 =?us-ascii?Q?DULXzmOXC80w/FGjr+tevhgCVw0Qu0aZH2CFC/CfYiKQgREcNhBlgDSbVmMZ?=
 =?us-ascii?Q?MFgmO91VmBT0ObCD/qFAyWPyIOJA5e+mRn3N4fok6tchBCiMLlfO4PHt4wZh?=
 =?us-ascii?Q?P2waqNAeZ3mOnsjmJ9xfgmK2T3gptfAYxfJjx5+vDtXKRbDY/FloLIPCFJEU?=
 =?us-ascii?Q?bgpn0GZJrXCdUqtiHHL9rWhpZakQQlbphelfAcjdu4fc0x/HO6hol8I87UEk?=
 =?us-ascii?Q?4cz2/+djD5lfM53IfE4uRA55M2dCWXCg7tqiIq14PpLYu5SbkJueXDzrxFlA?=
 =?us-ascii?Q?3NwsAXJGgTexRhSWyAeQpwPtU3sMTPzhRlz5KWNfFyKLqvQSZ6EXpxH2g/e+?=
 =?us-ascii?Q?++uA1sUYMoph8S4v3e2MEdW/G+6a/KWqJtiDCFEZJyA/RoyG2by77YCpK91W?=
 =?us-ascii?Q?JblvT9OC0zCF9aerRybNpb+uSgtt4d4L6iW+ZL6+lf3b2iwmYSrkRUiaIFl2?=
 =?us-ascii?Q?HxpLL3fbxPbneguSPNEprZFXa0EbpVSca+hWbCa7T4sYOoalM1FZXSBMFKQZ?=
 =?us-ascii?Q?jpx/RPGAHlyZdAjrWyAh6/4MfvP1/6QXlmRhVpQ2q8UDfFaRFFlAgu7pIRkC?=
 =?us-ascii?Q?Sr059APITQuGnrMgNtEvKgUe0BKyB4rVBQ2J7AVx7rbB10TDt02iULxWKyKt?=
 =?us-ascii?Q?e8KtZYSAoKSAbR0b24ufcWpP+uPkKO9oJq9oByl9Btsl+Wu2a1ZvJpiT0JOf?=
 =?us-ascii?Q?JtehUsldw0XG049M1Cy1Z23wrD3sJojS1RuPqLIeaXxTnWhs4ZSbZvy8wmVo?=
 =?us-ascii?Q?d6YWk9iBxOsmU3L0SAwQv2BeH10ZwRFRMs6b4nu97ag2U+4xQn+06WRkdBMt?=
 =?us-ascii?Q?dMGoU+kFZLdMdFR2xOzJBHPzncOxb5uEndibaC/HJ/7T72HdfdXzPMHRolkM?=
 =?us-ascii?Q?H5wiE4v7eRnQy+fb13H22ymCNsdI9WHyJVYkAld1CNP4FJFOrmMpll9BZXu2?=
 =?us-ascii?Q?bJrMwsjYsNwA4HVXEO/iC3Naw2Yvja44zQqujbrSDKxhvvIOGx0IsIH6xkOq?=
 =?us-ascii?Q?MePqA0v8835incb3xTTdRICjWEXMy//5ENPq2Du7anbKrgDRNgGfCNYZhHw3?=
 =?us-ascii?Q?9Vs07tZrzWdtqraqnKhqwww8aFiEeMUgx01pPzWojKazaV5PnjWSd7etN/vz?=
 =?us-ascii?Q?lA/fqHNsGPRlhavw7IvpLw+VXTJDQ1JGur4lZM5chu/Cq/oWA1P1rq1TGNi8?=
 =?us-ascii?Q?WfpuF94fwejSNESNUT4+1sE2bPY+oZk+0FsFrtyBVvEZzN9XPl/V3+3bhp3a?=
 =?us-ascii?Q?Uc9YQEB4SfbH11on93sNeXg5Sg0a71hUgyfZuMz5ON1B1xRbMHDSNDlmEOco?=
 =?us-ascii?Q?42fz3QcDjY/hFZYTcDy97SpudL6kJH1YYehDIMDO0CExk7r6+UIgq/HpmrGM?=
 =?us-ascii?Q?fBZSC3apuPx8aI6HACceYkCV7BX4EUgeirrBZExqQ8a86jsPSCXYn8iW7Ph8?=
 =?us-ascii?Q?zVfc0ewa1DjW5+L2XQHzbMRQyS+qdPiE3oLjvY1DFLq/L936bYnFqRNjgyyo?=
 =?us-ascii?Q?EqM/snrt7N8rlqb1CxX/PJLD04fVDn1JJTOENwzy+ZPPl5l1URPLQk8xrCVD?=
 =?us-ascii?Q?yQXVb8AnVg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b1151c-3788-4838-043f-08dee8acf66f
X-MS-Exchange-CrossTenant-AuthSource: DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:24:30.0675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcIF0oriqurkv86OmDx6QH2BLRfO7Mxe6a+RWvKP6CA/vySBZC2pz7h8BvU3NTBqkpw8vGJZ1oeJR4Vz7Ufqvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3390
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 11:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128417

From: Tugrul Kukul <tugrul.kukul@est.tech>

The backport dropped the "j++" body of the delpaths_sorted() grouping
loop while adding the "=3D=3D 1" guard, turning "while (...) j++;" into an
empty-bodied "while (...);". The index never advances, so any update
that produces "empty" (which reaches _modify() -> delpaths()) hangs,
e.g. "map_values(. // empty)" and ".a |=3D empty". This also hangs the jq
ptest suite.

Restore the "j++" body while keeping the "=3D=3D 1" guard.

Assisted-by: kiro:claude-opus-4.8
Signed-off-by: Tugrul Kukul <tugrul.kukul@est.tech>
---
 meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-47770.patch
index 1d6664e842..9865de86cb 100644
--- a/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
@@ -13,6 +13,7 @@ Fixes CVE-2026-47770.
=20
 Signed-off-by: Anton Skorup <antonsk@axis.com>
 Upstream-Status: Backport [https://github.com/jqlang/jq/commit/71228668699=
60b55cea3646bc91334ef55787831]
+Signed-off-by: Tugrul Kukul <tugrul.kukul@est.tech>
 ---
  src/builtin.c |  36 +++++++++++++++--
  src/jv.c      |  46 +++++++++++++++++-----
@@ -237,13 +238,14 @@ index 594a21f..a39f1f1 100644
  static jv parse_slice(jv j, jv slice, int* pstart, int* pend) {
    // Array slices
    jv start_jv =3D jv_object_get(jv_copy(slice), jv_string("start"));
-@@ -471,8 +489,7 @@ static jv delpaths_sorted(jv object, jv paths, int sta=
rt) {
+@@ -471,8 +489,8 @@ static jv delpaths_sorted(jv object, jv paths, int sta=
rt) {
      int delkey =3D jv_array_length(jv_array_get(jv_copy(paths), i)) =3D=
=3D start + 1;
      jv key =3D jv_array_get(jv_array_get(jv_copy(paths), i), start);
      while (j < jv_array_length(jv_copy(paths)) &&
 -           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths=
), j), start)))
 -      j++;
-+           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths=
), j), start)) =3D=3D 1);
++           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths=
), j), start)) =3D=3D 1)
++      j++;
      // if i <=3D entry < j, then entry starts with key
      if (delkey) {
        // deleting this entire key, we don't care about any more specific =
deletions
--=20
2.34.1


