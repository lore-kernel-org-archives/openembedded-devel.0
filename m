Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA2BC83F07
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 06:38:36 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.web11.53756.1751870314978841290
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Jul 2025 23:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=JMzHF7P0;
 spf=pass (domain: est.tech, ip: 52.101.65.52, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKWXga5NSFoYUMsj0PkdmtX3obG8gPAn2Gnve+Ku/YecC6p8chTAlpmTVxCz+4jfk6fM8BO0/wx8VlyVp1x/27KAIawgYot9Yqnoc08Qc4AtCaDqJbAf6Ri3afx80/beD8qixu++qZHb7837r/Gc31wJgMOtpUCkPDQNeYaTIS5LAdCPWx0lwVYwXEA5UUMjLZ5AFZW3YvnT4GVHM3QAfz9Lf3ePjexekFv1NPi2gOrxkHPYu1kx5IFwOX0P40bmpd+qZauXiDtHe2F592toG2THISheyaDHv/pk35OmLQrmOiqE8O3di21NWT5NH27c9qCxb/kE6pVNlmFtQwt0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPVF1Xl3beEJJeyTugsFkVxrEgKiZzmMBVuMmQlkIgE=;
 b=JWlJ/6ezAypUq3Ppl/chOfEaVZsqF7+RKwmuMKq/Esvy9RXb1JtPpkguBP06pTF24/G5DMWpiV1en+4KLq+x/E34rF6ZQZG7DaoXeOYIZ7ToWxtVK14afYlVusPmlvqOxWzIq6yOixdwMWiBha+9gKlZMz8WVMi/b9yxUcAVpnN1cW30PdiKbWZ7I8Jzv4XcXFNcr2WN0xAvdIrhQIzQFcAbMY6uky4OfTDmTtXAFcEmWc42KpFaq3TgFFV/jFB7VwAND0unV2wBfrNNCvli+VL9mWQrGYw5cDUQ/Tfv8DytlWYOS5xseMiROE2pNNf2aFXJRcbPr/iBW3l9WPunow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPVF1Xl3beEJJeyTugsFkVxrEgKiZzmMBVuMmQlkIgE=;
 b=JMzHF7P0U7l4QMOrBLNLrEQSlqTturfrE+BiJ3vB/pfO+3pT2bh+8LaHDkZKkIKrfZhgoC21a1J7OfG2VvEbOtD0aGRjbWAi0NNmD9rpbWUtUF655fbNwbpg71FdBVLkWGrYuMG7FWlYTw173RUJwIg38C0R4mtG8W14b8Ux4K8D4V/uUSl0ov76quOwHhICDvWl5lxEa9vBGVKlHTE8P5qORDDre+xloJSALDZX7Nx47sBWRpNoTgbqpmv1v5g88lvsle7gj+yu8YImusIm194t1B3pkXA9yJiQnicE+P2fn/DQVQJwpOgRG9GvhYlux/Ti4uoe/7EdCO5/U6EoQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by MRVP189MB3123.EURP189.PROD.OUTLOOK.COM (2603:10a6:501:5a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Mon, 7 Jul
 2025 06:38:30 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07%6]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 06:38:29 +0000
From: roland.kovacs@est.tech
To: openembedded-devel@lists.openembedded.org
CC: Roland Kovacs <roland.kovacs@est.tech>
Subject: [meta-oe][scarthgap][PATCH] jq-1.7.1: Backport multiple CVE fixes
Date: Mon,  7 Jul 2025 08:38:09 +0200
Message-ID: <20250707063808.10872-2-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0015.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::20) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|MRVP189MB3123:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e5123d-81d8-4fd0-231d-08ddbd20e2b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5k0QMTBrm+BqjnbjrSfGhMazcsX8SaiZ650q9qv4qoCrnUfnVER4/x9qpIIV?=
 =?us-ascii?Q?mlyK77ZZzqOfWnvOuVWwQuSNWld6c0OfAqjEwkoz3cywzZLiH0BZxZkFUAOc?=
 =?us-ascii?Q?Y87t8SCveDdD4F92VAc9AtLLrYvcIobscElFc72VgKHw3dYTd/c6hrLu4ymi?=
 =?us-ascii?Q?zyGqgyUPhSIau1o8HlJSA0E3k4Zi2mYNBR5Zj6mgC/c/b/TCzfaifFmP0apo?=
 =?us-ascii?Q?/NxiDxlOjM2mahZAORkB4AK7FsuKhaaSUzT1FGflJkldMD1tYXg4LfuZMh+n?=
 =?us-ascii?Q?KkUL7EsCpRA8JVxh67K3VNuGtzMMoMfN46v3XXUOcPcb6YBdovEoPjMTwb30?=
 =?us-ascii?Q?YnHnLZFmCdobfXM4ConzcA6ZvtOh9rBu0IU497AgNvYf3OBLn/2sLf6Qr8o/?=
 =?us-ascii?Q?Jgf71yjaIeTQW+1ZdDNhtV6geEXg09q2uO7spicYS0HxmCdwqQtuN0d0ZZAQ?=
 =?us-ascii?Q?WDqO3jH4IM8kZ2gsdeDvvGelpR/OXjiFPw434ZU5B6xVb3RrtNYWQXLUSaxv?=
 =?us-ascii?Q?TLGhuUGKjLym6FsRRWL+khNEiXUoYObh27BKftof1brdjEVgv0MLzil7xS8D?=
 =?us-ascii?Q?JHeZ0eXBCrikAv0y/1UozfRYP3uN6rla6hzYV8GsehJ5SABG8+IMQtrQmQa8?=
 =?us-ascii?Q?7JBLxQSeiBpwvC1DTJQ1O1p1jfmLcrayzsaHmnZ1zJjbNNtQWpiyjkBPbjHZ?=
 =?us-ascii?Q?6q5IGZ/MIt9cTzFmq3rpqMsdbD7cTAlv5V4F6ziU/nT7ivZLQl0eunACyK8Z?=
 =?us-ascii?Q?fLRKXzH6ouWRgT1rXd1E6I0jl6UxtlTSfTHRBC30mcrQAPecSjZgU548xnu0?=
 =?us-ascii?Q?KpQOuX8iPDgtKhiqlgsfxQKA8lVx8g5ITMtnrlhbFBnAlmxHWcKG2Laoil4C?=
 =?us-ascii?Q?DJaADiS7/hY06mAagwHSb2NZhiSGtmr3/Kz7GbC4DS4mENDr3hWVGbmETwgS?=
 =?us-ascii?Q?fOuovEVc/QVl9PeLV9cfwmuA3p7dcWy0m7IZUlP2yDcQdU0vMxqwBwNH4zml?=
 =?us-ascii?Q?F6KojKe/dB46UHG6+0EujBXqNPtk2d5xmYXW9AW3OQBZVkZ7KD5+nStxzCPa?=
 =?us-ascii?Q?HKY0s8DwlHHiq7jSUMi8/H1+kAkvyEUOZFe4r1ivxmznIY4yU1gnBuNScz8m?=
 =?us-ascii?Q?oIfKmGyP0k2d1GQIr3Pqqz93V2XOFwW+Kw+3wIGc4QbpEA4S24KU7WVpqitI?=
 =?us-ascii?Q?rVgvlmdP9FClKUfpljqscQm7rCpTR9cRh9ZK02azBQFpXYwikOoapwaSZ3L7?=
 =?us-ascii?Q?ypIYtVcmXJGTpwCYu6gYAVcAWiW4aobFPWb9Ztyhh7Nl44rpYlohQdmacUOS?=
 =?us-ascii?Q?kO92azUTl+X61FcW9aJzXqTc/YVZBuZ4M+oKcHet/x3D7ezwRn+mhv2gV+8l?=
 =?us-ascii?Q?DUdNB7TYXCTkJHt9FUN6lSiTcEuBXixybeKW1hDv9lF4orS8G3bQo0ldDiKf?=
 =?us-ascii?Q?Zu879q/xCQg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?brEt1pHsWMU6vJbu2oWgbMo06LrUcLReBuzT7jOokuKtOX9Of43b2ag0zKRr?=
 =?us-ascii?Q?BknGAEM262nZJYumbNKhxf5/ZKtbuYncCEtkOP3oX3XQN1NSmCpSvv4pxDC7?=
 =?us-ascii?Q?EoaIGJUwXsiodtFV5QQ9SkkVOMKkL8X7h9105ZwHEz6shGPJWOR9b6oU/8D7?=
 =?us-ascii?Q?TF5HLfIPzmhHKigXKhvM37tEzoyyDrhgk7ZFeQKnuzbumAGD01HMJvz6Gnyb?=
 =?us-ascii?Q?CAC5MmTuDpW8Wjd70yp8SxU32hnChBCx04NY1pIB3SLpRrr8I2ZOrgIA2wzE?=
 =?us-ascii?Q?K/i/9feG7HXiPW76BetvrWHX75oGJJ/wyE9bBevY4nPC0ZI5W+klK9Dbj8Lu?=
 =?us-ascii?Q?VDVjmmhuR1YI+uKV9YBaWWNDg7NUbLMf1jHLIP26BrMc+DQw+TU4yP3NFf6/?=
 =?us-ascii?Q?U7kZn0hYVSFTpjgo5BeVXbwt4oK5Dtle+fNXFU29LV79EJGjWJahkMJxXrnP?=
 =?us-ascii?Q?9BBras2RwKNdHfYKT6ZLasbNZ2uenatygajsNqAP8OPz7TArGxaEhMw8HgG+?=
 =?us-ascii?Q?jvFgYW/EWhxhUPASWiridqZWjDvcKYIrFVSA47gVJapnVFQX5IJZWjmvFcYa?=
 =?us-ascii?Q?6wFi/xwpSQGCyhy5ChjDLpR+paVF9jc2wSXr9UKkZIt5FuJM5fGFT9ZZmVOB?=
 =?us-ascii?Q?a7oZmMGTmGEGCjvJAX09tQgQ7/LH+vNFPMMzD+YbF4nWsqdL8KGv0ZPKcVZG?=
 =?us-ascii?Q?t6Bmh1jV64xFvASrlvVPQw54n3sreRQ2yfidM30rMeSJaFpkB3hL/WD8Yx9g?=
 =?us-ascii?Q?aiN8AZfaU6xdcv/yPvtRpahmq0v+fPqLYgWf29l3oc3qjfXB5ZjV5e7IEN4i?=
 =?us-ascii?Q?0C6/SaTctqrasIiMCeMVV98UVE0WrLctRcrmpTkbIS6p8fVTsAZLLPplcx+/?=
 =?us-ascii?Q?5wrz/3+vSomwfx4GlDhYiZXD0OFEmQpgu4P1MhJUuCS5Dz9zKQGIvtVLmBl1?=
 =?us-ascii?Q?PvkAVzI3ggUG2UDV7/pD08N1pBdYKRICNCzOrURHTHATcbd6Pxh+2Zk4pJed?=
 =?us-ascii?Q?MDa3hOdzwRW6NSqCanOFsJkaM4RZeEkDLGxwTmzRKt4uAE2Y43WkYQOf7oHk?=
 =?us-ascii?Q?Ow2n5tAuNRj6UIw0J98sTtiCxUCgQqNdTAKqxk56cQLiM/YbPR7/pJ5mhPgh?=
 =?us-ascii?Q?tNfTbXB4E42K+TcvFDMn13yt1PcyU6NjpiHmf+pVLg5gKCyd/Z183/yhnNER?=
 =?us-ascii?Q?fPLo0y4l2z3ceCBR7RWjOBOoE6uBmiVU7UC+8fy71dLTesvsS4RxBePJYxpT?=
 =?us-ascii?Q?DhIYSqxISNG8T7g9B0XkUY7W+t63FRnSbpkaU3QYTAu5OY+sFYcLb2jNfGmf?=
 =?us-ascii?Q?DOB+jGQ0OH1Z/FVmpaa9yMrBgG47QXFLy9iRnu6EdUfXSUXgBgbmCF4FQood?=
 =?us-ascii?Q?VDsEsRLlXD2ky3wTK0zg+Or/Bkacu2VNo2AaP9ldHR52EvDNGuZwHdAiQMCI?=
 =?us-ascii?Q?ybrXQP3+Fz6MS4SpVGBVO4p0TRCBbWHpme0WopKV9PTc4nCn57NhdeQMUO0D?=
 =?us-ascii?Q?1kZpRIQGKoINmicTqrBFJETwuRRiZQMxFU8LxIzYdTSuFOM3HaJiTRQusOjA?=
 =?us-ascii?Q?+0t5GfC9a7w7DZuBlHzF+xtcnNp59tn0RPJc/q0u?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e5123d-81d8-4fd0-231d-08ddbd20e2b6
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 06:38:29.8256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tu4lryGyGp4t215VGKDWf5tPVvwh+/0ucvAzmKk6z3PcATMNQsUllXquO1XYNt3Lfn6e0Er8uL+hP6p+EmtOhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRVP189MB3123
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 06:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118243

From: Roland Kovacs <roland.kovacs@est.tech>

CVE: CVE-2024-23337
CVE: CVE-2024-53427
CVE: CVE-2025-48060

Patches CVE-2024-23337.patch and CVE-2024-53427.patch are backported from
jq-1.8.0, and CVE-2025-48060.patch is backported from jq-1.8.1.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../jq/jq/CVE-2024-23337.patch                | 233 ++++++++++++++++++
 .../jq/jq/CVE-2024-53427.patch                |  79 ++++++
 .../jq/jq/CVE-2025-48060.patch                |  45 ++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   3 +
 4 files changed, 360 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2024-23337.patch
new file mode 100644
index 0000000000..93f55eecd0
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
@@ -0,0 +1,233 @@
+From d9237e3d607f946fe74540efa42a2eacca2a6fbd Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Wed, 21 May 2025 07:45:00 +0900
+Subject: [PATCH] Fix signed integer overflow in jvp_array_write and
+ jvp_object_rehash
+
+This commit fixes signed integer overflow and SEGV issues on growing
+arrays and objects. The size of arrays and objects is now limited to
+`536870912` (`0x20000000`). This fixes CVE-2024-23337 and fixes #3262.
+
+(cherry picked from commit de21386681c0df0104a99d9d09db23a9b2a78b1e)
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ src/jv.c      | 57 ++++++++++++++++++++++++++++++++++++++++-----------
+ src/jv_aux.c  |  9 ++++----
+ tests/jq.test |  4 ++++
+ 3 files changed, 54 insertions(+), 16 deletions(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index 34573b8..15990f1 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1001,6 +1001,11 @@ jv jv_array_set(jv j, int idx, jv val) {
+     jv_free(val);
+     return jv_invalid_with_msg(jv_string("Out of bounds negative array in=
dex"));
+   }
++  if (idx > (INT_MAX >> 2) - jvp_array_offset(j)) {
++    jv_free(j);
++    jv_free(val);
++    return jv_invalid_with_msg(jv_string("Array index too large"));
++  }
+   // copy/free of val,j coalesced
+   jv* slot =3D jvp_array_write(&j, idx);
+   jv_free(*slot);
+@@ -1020,6 +1025,7 @@ jv jv_array_concat(jv a, jv b) {
+   // FIXME: could be faster
+   jv_array_foreach(b, i, elem) {
+     a =3D jv_array_append(a, elem);
++    if (!jv_is_valid(a)) break;
+   }
+   jv_free(b);
+   return a;
+@@ -1283,15 +1289,22 @@ jv jv_string_indexes(jv j, jv k) {
+   assert(JVP_HAS_KIND(k, JV_KIND_STRING));
+   const char *jstr =3D jv_string_value(j);
+   const char *idxstr =3D jv_string_value(k);
+-  const char *p;
++  const char *p, *lp;
+   int jlen =3D jv_string_length_bytes(jv_copy(j));
+   int idxlen =3D jv_string_length_bytes(jv_copy(k));
+   jv a =3D jv_array();
+=20
+   if (idxlen !=3D 0) {
+-    p =3D jstr;
++    int n =3D 0;
++    p =3D lp =3D jstr;
+     while ((p =3D _jq_memmem(p, (jstr + jlen) - p, idxstr, idxlen)) !=3D =
NULL) {
+-      a =3D jv_array_append(a, jv_number(p - jstr));
++      while (lp < p) {
++        lp +=3D jvp_utf8_decode_length(*lp);
++        n++;
++      }
++
++      a =3D jv_array_append(a, jv_number(n));
++      if (!jv_is_valid(a)) break;
+       p++;
+     }
+   }
+@@ -1314,14 +1327,17 @@ jv jv_string_split(jv j, jv sep) {
+=20
+   if (seplen =3D=3D 0) {
+     int c;
+-    while ((jstr =3D jvp_utf8_next(jstr, jend, &c)))
++    while ((jstr =3D jvp_utf8_next(jstr, jend, &c))) {
+       a =3D jv_array_append(a, jv_string_append_codepoint(jv_string(""), =
c));
++      if (!jv_is_valid(a)) break;
++    }
+   } else {
+     for (p =3D jstr; p < jend; p =3D s + seplen) {
+       s =3D _jq_memmem(p, jend - p, sepstr, seplen);
+       if (s =3D=3D NULL)
+         s =3D jend;
+       a =3D jv_array_append(a, jv_string_sized(p, s - p));
++      if (!jv_is_valid(a)) break;
+       // Add an empty string to denote that j ends on a sep
+       if (s + seplen =3D=3D jend && seplen !=3D 0)
+         a =3D jv_array_append(a, jv_string(""));
+@@ -1339,8 +1355,10 @@ jv jv_string_explode(jv j) {
+   const char* end =3D i + len;
+   jv a =3D jv_array_sized(len);
+   int c;
+-  while ((i =3D jvp_utf8_next(i, end, &c)))
++  while ((i =3D jvp_utf8_next(i, end, &c))) {
+     a =3D jv_array_append(a, jv_number(c));
++    if (!jv_is_valid(a)) break;
++  }
+   jv_free(j);
+   return a;
+ }
+@@ -1614,10 +1632,13 @@ static void jvp_object_free(jv o) {
+   }
+ }
+=20
+-static jv jvp_object_rehash(jv object) {
++static int jvp_object_rehash(jv *objectp) {
++  jv object =3D *objectp;
+   assert(JVP_HAS_KIND(object, JV_KIND_OBJECT));
+   assert(jvp_refcnt_unshared(object.u.ptr));
+   int size =3D jvp_object_size(object);
++  if (size > INT_MAX >> 2)
++    return 0;
+   jv new_object =3D jvp_object_new(size * 2);
+   for (int i=3D0; i<size; i++) {
+     struct object_slot* slot =3D jvp_object_get_slot(object, i);
+@@ -1630,7 +1651,8 @@ static jv jvp_object_rehash(jv object) {
+   }
+   // references are transported, just drop the old table
+   jv_mem_free(jvp_object_ptr(object));
+-  return new_object;
++  *objectp =3D new_object;
++  return 1;
+ }
+=20
+ static jv jvp_object_unshare(jv object) {
+@@ -1659,27 +1681,32 @@ static jv jvp_object_unshare(jv object) {
+   return new_object;
+ }
+=20
+-static jv* jvp_object_write(jv* object, jv key) {
++static int jvp_object_write(jv* object, jv key, jv **valpp) {
+   *object =3D jvp_object_unshare(*object);
+   int* bucket =3D jvp_object_find_bucket(*object, key);
+   struct object_slot* slot =3D jvp_object_find_slot(*object, key, bucket)=
;
+   if (slot) {
+     // already has the key
+     jvp_string_free(key);
+-    return &slot->value;
++    *valpp =3D &slot->value;
++    return 1;
+   }
+   slot =3D jvp_object_add_slot(*object, key, bucket);
+   if (slot) {
+     slot->value =3D jv_invalid();
+   } else {
+-    *object =3D jvp_object_rehash(*object);
++    if (!jvp_object_rehash(object)) {
++      *valpp =3D NULL;
++      return 0;
++    }
+     bucket =3D jvp_object_find_bucket(*object, key);
+     assert(!jvp_object_find_slot(*object, key, bucket));
+     slot =3D jvp_object_add_slot(*object, key, bucket);
+     assert(slot);
+     slot->value =3D jv_invalid();
+   }
+-  return &slot->value;
++  *valpp =3D &slot->value;
++  return 1;
+ }
+=20
+ static int jvp_object_delete(jv* object, jv key) {
+@@ -1779,7 +1806,11 @@ jv jv_object_set(jv object, jv key, jv value) {
+   assert(JVP_HAS_KIND(object, JV_KIND_OBJECT));
+   assert(JVP_HAS_KIND(key, JV_KIND_STRING));
+   // copy/free of object, key, value coalesced
+-  jv* slot =3D jvp_object_write(&object, key);
++  jv* slot;
++  if (!jvp_object_write(&object, key, &slot)) {
++    jv_free(object);
++    return jv_invalid_with_msg(jv_string("Object too big"));
++  }
+   jv_free(*slot);
+   *slot =3D value;
+   return object;
+@@ -1804,6 +1835,7 @@ jv jv_object_merge(jv a, jv b) {
+   assert(JVP_HAS_KIND(a, JV_KIND_OBJECT));
+   jv_object_foreach(b, k, v) {
+     a =3D jv_object_set(a, k, v);
++    if (!jv_is_valid(a)) break;
+   }
+   jv_free(b);
+   return a;
+@@ -1823,6 +1855,7 @@ jv jv_object_merge_recursive(jv a, jv b) {
+       jv_free(elem);
+       a =3D jv_object_set(a, k, v);
+     }
++    if (!jv_is_valid(a)) break;
+   }
+   jv_free(b);
+   return a;
+diff --git a/src/jv_aux.c b/src/jv_aux.c
+index 6004799..bbe1c0d 100644
+--- a/src/jv_aux.c
++++ b/src/jv_aux.c
+@@ -193,18 +193,19 @@ jv jv_set(jv t, jv k, jv v) {
+         if (slice_len < insert_len) {
+           // array is growing
+           int shift =3D insert_len - slice_len;
+-          for (int i =3D array_len - 1; i >=3D end; i--) {
++          for (int i =3D array_len - 1; i >=3D end && jv_is_valid(t); i--=
) {
+             t =3D jv_array_set(t, i + shift, jv_array_get(jv_copy(t), i))=
;
+           }
+         } else if (slice_len > insert_len) {
+           // array is shrinking
+           int shift =3D slice_len - insert_len;
+-          for (int i =3D end; i < array_len; i++) {
++          for (int i =3D end; i < array_len && jv_is_valid(t); i++) {
+             t =3D jv_array_set(t, i - shift, jv_array_get(jv_copy(t), i))=
;
+           }
+-          t =3D jv_array_slice(t, 0, array_len - shift);
++          if (jv_is_valid(t))
++            t =3D jv_array_slice(t, 0, array_len - shift);
+         }
+-        for (int i=3D0; i < insert_len; i++) {
++        for (int i =3D 0; i < insert_len && jv_is_valid(t); i++) {
+           t =3D jv_array_set(t, start + i, jv_array_get(jv_copy(v), i));
+         }
+         jv_free(v);
+diff --git a/tests/jq.test b/tests/jq.test
+index d052b22..22bfd3a 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -198,6 +198,10 @@ null
+ [0,1,2]
+ [0,5,2]
+=20
++try (.[999999999] =3D 0) catch .
++null
++"Array index too large"
++
+ #
+ # Multiple outputs, iteration
+ #
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2024-53427.patch
new file mode 100644
index 0000000000..3e27a13036
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch
@@ -0,0 +1,79 @@
+From fa6131eb6e9d43e88e35982fa5f6049da2a77a87 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Wed, 5 Mar 2025 07:43:54 +0900
+Subject: [PATCH] Reject NaN with payload while parsing JSON
+
+This commit drops support for parsing NaN with payload in JSON like
+`NaN123` and fixes CVE-2024-53427. Other JSON extensions like `NaN` and
+`Infinity` are still supported. Fixes #3023, fixes #3196, fixes #3246.
+
+(cherry picked from commit a09a4dfd55e6c24d04b35062ccfe4509748b1dd3)
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ src/jv.c      |  9 +++++++++
+ tests/jq.test | 14 ++++++++++----
+ tests/shtest  |  5 -----
+ 3 files changed, 19 insertions(+), 9 deletions(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index e23d8ec..34573b8 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -589,6 +589,15 @@ static jv jvp_literal_number_new(const char * literal=
) {
+     jv_mem_free(n);
+     return JV_INVALID;
+   }
++  if (decNumberIsNaN(&n->num_decimal)) {
++    // Reject NaN with payload.
++    if (n->num_decimal.digits > 1 || *n->num_decimal.lsu !=3D 0) {
++      jv_mem_free(n);
++      return JV_INVALID;
++    }
++    jv_mem_free(n);
++    return jv_number(NAN);
++  }
+=20
+   jv r =3D {JVP_FLAGS_NUMBER_LITERAL, 0, 0, JV_NUMBER_SIZE_INIT, {&n->ref=
cnt}};
+   return r;
+diff --git a/tests/jq.test b/tests/jq.test
+index 7036df2..d052b22 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -1938,11 +1938,17 @@ tojson | fromjson
+ {"a":nan}
+ {"a":null}
+=20
+-# also "nan with payload" #2985
+-fromjson | isnan
+-"nan1234"
++# NaN with payload is not parsed
++.[] | try (fromjson | isnan) catch .
++["NaN","-NaN","NaN1","NaN10","NaN100","NaN1000","NaN10000","NaN100000"]
+ true
+-
++true
++"Invalid numeric literal at EOF at line 1, column 4 (while parsing 'NaN1'=
)"
++"Invalid numeric literal at EOF at line 1, column 5 (while parsing 'NaN10=
')"
++"Invalid numeric literal at EOF at line 1, column 6 (while parsing 'NaN10=
0')"
++"Invalid numeric literal at EOF at line 1, column 7 (while parsing 'NaN10=
00')"
++"Invalid numeric literal at EOF at line 1, column 8 (while parsing 'NaN10=
000')"
++"Invalid numeric literal at EOF at line 1, column 9 (while parsing 'NaN10=
0000')"
+=20
+ # calling input/0, or debug/0 in a test doesn't crash jq
+=20
+diff --git a/tests/shtest b/tests/shtest
+index 14aafbf..a471889 100755
+--- a/tests/shtest
++++ b/tests/shtest
+@@ -594,11 +594,6 @@ if ! x=3D$($JQ -n "1 # foo$cr + 2") || [ "$x" !=3D 1 =
]; then
+   exit 1
+ fi
+=20
+-# CVE-2023-50268: No stack overflow comparing a nan with a large payload
+-$VALGRIND $Q $JQ '1 !=3D .' <<\EOF >/dev/null
+-Nan4000
+-EOF
+-
+ # Allow passing the inline jq script before -- #2919
+ if ! r=3D$($JQ --args -rn -- '$ARGS.positional[0]' bar) || [ "$r" !=3D ba=
r ]; then
+     echo "passing the inline script after -- didn't work"
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2025-48060.patch
new file mode 100644
index 0000000000..237a50413f
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
@@ -0,0 +1,45 @@
+From 35c08446e4bcd89e0e87e7750c68306d6c0e9ec5 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Sat, 31 May 2025 11:46:40 +0900
+Subject: [PATCH] Fix heap buffer overflow when formatting an empty string
+
+The `jv_string_empty` did not properly null-terminate the string data,
+which could lead to a heap buffer overflow. The test case of
+GHSA-p7rr-28xf-3m5w (`0[""*0]`) was fixed by the commit dc849e9bb74a,
+but another case (`0[[]|implode]`) was still vulnerable. This commit
+ensures string data is properly null-terminated, and fixes CVE-2025-48060.
+
+(cherry picked from commit c6e041699d8cd31b97375a2596217aff2cfca85b)
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ src/jv.c      | 1 +
+ tests/jq.test | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/src/jv.c b/src/jv.c
+index 15990f1..18dbb54 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1125,6 +1125,7 @@ static jv jvp_string_empty_new(uint32_t length) {
+   jvp_string* s =3D jvp_string_alloc(length);
+   s->length_hashed =3D 0;
+   memset(s->data, 0, length);
++  s->data[length] =3D 0;
+   jv r =3D {JVP_FLAGS_STRING, 0, 0, 0, {&s->refcnt}};
+   return r;
+ }
+diff --git a/tests/jq.test b/tests/jq.test
+index 22bfd3a..ecb9116 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -2030,6 +2030,10 @@ map(try implode catch .)
+ [123,["a"],[nan]]
+ ["implode input must be an array","string (\"a\") can't be imploded, unic=
ode codepoint needs to be numeric","number (null) can't be imploded, unicod=
e codepoint needs to be numeric"]
+=20
++try 0[implode] catch .
++[]
++"Cannot index number with string \"\""
++
+ # walk
+ walk(.)
+ {"x":0}
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.7.1.bb
index 6b12335513..9238474319 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -11,6 +11,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D488f4e0b04c045=
6337fb70d1ac1758ba"
 GITHUB_BASE_URI =3D "https://github.com/jqlang/${BPN}/releases/"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz =
\
     file://run-ptest \
+    file://CVE-2024-23337.patch \
+    file://CVE-2024-53427.patch \
+    file://CVE-2025-48060.patch \
     "
 SRC_URI[sha256sum] =3D "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df70=
3873deeee580c2"
=20

