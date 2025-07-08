Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C09FC83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 08:02:42 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.6])
 by mx.groups.io with SMTP id smtpd.web10.13552.1751961755840291215
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 01:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=dnhnipQM;
 spf=pass (domain: est.tech, ip: 52.101.71.6, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w64hdh4EnaVjt2/TbddpwvkMYUJANXHndNKZBN3vWn7gjp4C70TcIzw2qXaNQf0FZ4LYqSWRGIINwjR62cp+Sl0MqwX37VGA3qwFF25mCf24xL90y1QiYErQqUjGZ+2IzsZiUwSYccnn36SPyg5q3FS+HpWbS5zyzy6LDz3bk1rHcdw9mQMkvaJEwsMag25GqYsG6wHFrN6B+do1Yc7cIfjAoUuTRqkAvKqpTsjq9Zlb7vqTqZdwk8LSKyGfJyqYPvpSB+NyMHrIbS0Er4S+1zykpnaRvUf6Rqe5gpVkXO743M55gEStTg96c2+3+5mz0m9iFmZOBcCsnca6yZ3XzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8Gr/rlAbJhE6+dKtjvZRexsrTnJ/ED6kIBhrjP3TNY=;
 b=GNQPodgbzQ5EU2f3YVluzdAwpFSkU5LhHYel5Rmxbxqc5FEKvAW6LNmH/j9SNlbNv8ubHt2LwRMbT7GR6nCS+o8Pr7n+Kw6gVkGbP6RI1rugchgrPcdwwcZrxTQyZnqOIlagwmysPblEhsBzVR7AzYbz4Ms0tsGVB7JtCiCHSNUK0cUzli+B9NKY+hUdDwvJ4qpVQjKlooDsxeQEcjngRokRz9KxfTw075ybj86ToK3rk7A5CU1BwPlmscJeohHn78YysuOXb8xAbpXe+uDuvB3hNxuq84Q/DvHfjLC9TFipoNYK/Lce7JlBcPJ0VjvYX0WbrY/f8DDyuRM0oHBTXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8Gr/rlAbJhE6+dKtjvZRexsrTnJ/ED6kIBhrjP3TNY=;
 b=dnhnipQMWCdP3vzv/ihkOybh9qJ46veoo1l7TYQahfezexU6Az/z/VGMPxOmv+rSbW3QnDFSGUu7xaCxVISAAmAV0aJ8ADkjCSSS7T2SHHPsmTXX6m3iSlgYJJoTCFQ5SoGwcTyPkQDJwbYh6pJxW0cDkzaoljUQwfgvfVVDj8ZSPB3sFS2kjzqq7TC3rlItF4F0biZKvOE3wao4PQXi3/pvkRji0NUzvwL99BhLssYSyeDCi9iWWkBB684BWsRjuPXoRu80ynhJOK4Km4eVfyCSXGZIponL2Yr5z5mwMn3jf87bGOEZFckmjFWk9XbJFYwpKJACUwtkk+2zE6HJOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by GV1P189MB2884.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:260::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 08:02:31 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 08:02:31 +0000
From: roland.kovacs@est.tech
To: openembedded-devel@lists.openembedded.org
CC: Roland Kovacs <roland.kovacs@est.tech>
Subject: [meta-oe][scarthgap][PATCH v2 1/1] jq-1.7.1: Backport multiple CVE fixes
Date: Tue,  8 Jul 2025 10:02:00 +0200
Message-ID: <20250708080158.50374-4-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708080158.50374-2-roland.kovacs@est.tech>
References: <20250708080158.50374-2-roland.kovacs@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P250CA0022.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::27) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|GV1P189MB2884:EE_
X-MS-Office365-Filtering-Correlation-Id: a01a9c27-05de-44e2-3a35-08ddbdf5ca4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WjciPcZyeU+cLdHO2tU9VAV+a4lpUfLyuOqjvrlLyq/Y/AjfBmTaBSr8p5D+?=
 =?us-ascii?Q?j9fN76swpd4gZBTUD2UJpOichO5URC+7lylROvU3pfI758jciUYi7IOhQH52?=
 =?us-ascii?Q?lSJ0fxhL5fTyiLx5XJP6NmiIpIKWeQWiWrWoh1PfnWfJvlipmtH5OHqlKl8d?=
 =?us-ascii?Q?2cyvfm2/CoqacVIiX7LJGpqvud1V7vekjRgocYkh8dtznQZWIaVqKmw76I/b?=
 =?us-ascii?Q?dvKlSsW6W6iLt/5b7rL8BVFPLyuwz3CjEX+TN36DMdTWjGeO+lFb+fi3/iYb?=
 =?us-ascii?Q?H0YLAzdmt1GKekizg03tRaz+wSBbsAMcMaA5SECcdSHwNP+j9TzQ8bKo9TcU?=
 =?us-ascii?Q?grNUUPhKSUHArzNqbzbxihPXb+A2Qgrd/TD6GrSDtK6sKfdiRRvcD23T8EUg?=
 =?us-ascii?Q?ikMZd0tcVb2QFLgR1YbYQf1NgTD56OopATvR3SSHKI8jFJmAAaYgbYD08FSN?=
 =?us-ascii?Q?jBzBA5yOR2PBpb4IakA+G61Cr7qA6G32sMNEN/OEa91ephG1ASY1LPNTHo1R?=
 =?us-ascii?Q?tBG9WGKdmoksp4tb3/oAsEo88p8s3hrILx5Fjh5GYBkcFYjWe1ak2b/IucvY?=
 =?us-ascii?Q?Mqr1a9CpWpSuwLxUQuQ9EM1POZg+SoRkIxcsq8J0EP5cuepX0OUnAesDQzWi?=
 =?us-ascii?Q?FYikrNRXOEDFO7OyV/tCcJOPSarvgFQzWA8x8z9FpukI02PE1YOERn2wvf15?=
 =?us-ascii?Q?zIdzMH81sXy2kK5l6S5iZEIaRQb31i5KL+fuVYtwbGf5830GGzi2XD8GbYpB?=
 =?us-ascii?Q?S3+Lva6f625MGLoBuNAvz2xow+/OWmlsaROlkOWSizZlK6WNoWkC1G34cLcF?=
 =?us-ascii?Q?37V/aW05Rnyj2IQDFqqGsj8VALhnQxn5F414a3nwA15T2BZSBmueJLvePg36?=
 =?us-ascii?Q?2LgplZq4RmZ7K6DQfJ0wH8NhuD7wPO3Jny2CLpV39e8t3/Q92UxcPFI3Euno?=
 =?us-ascii?Q?rtUFdCA3UGVrCc6TZKte5iDBe9y3CE1kuRtLOM+L2mtf/VCHeExIrMIUwCN3?=
 =?us-ascii?Q?eEFjhtz2PbOQZ4cHnEZ1OSxtsw9DOnQDaCrCRSEDhn+/EiP1pV4jz3WmJHbE?=
 =?us-ascii?Q?hyOHMfiLezZ6OMhLxCWGQ1suh1Xo6hV3Z8fa+8BXTTOlfjgrS8UgmmSXIKKI?=
 =?us-ascii?Q?g35Nb1AAEk19pLitIAWRjNJwHuxGHz+1k91jiszF7gWadJbDcVMbFSfazt2Y?=
 =?us-ascii?Q?CJx1KXihXvT6BlthNr3jhmCBxNtOiVBWf3iY0ppAOBC6IfCq8V4ghZfUzEYt?=
 =?us-ascii?Q?Y2bCtZ9mmwVBCU0lkBXxHMuj5HXWa+axn2jsLocw+yikeMbOUEGMsA0L59Cn?=
 =?us-ascii?Q?sQfucieTfPkxOQpKIkEuoWwutylTDEt6ltVdgw2Bf9tT2guSuGvN9NAQZP2m?=
 =?us-ascii?Q?qOI7MJw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tqlIOoYTILUsGHIQSEtAaC8HaPEc67LsLmmbUdavbwRDS4uCzrG1Kjk0BSsp?=
 =?us-ascii?Q?BaLBBFl8cTSrFcc6DgxVljnpxNKmjpml+ZZVRUzhuu8zgS6UqAlkKGqSoK1f?=
 =?us-ascii?Q?b2cam+w1x3Cl3K9+Tl+4o0mJqsCkPbw0m0aGwfi6VuxVNnNNJhKMBNQDji+g?=
 =?us-ascii?Q?XN+ldtzmBWMu/QvAqUIh2aNa4beUjAHfAPLgso4P8ZpMiEO+/ZD3qpuEDi4z?=
 =?us-ascii?Q?tAuk81gb1bV+3PgM/3/jsUOc5mEthMvWC8wQjCKa8NS8eD6lLT1JxCg6qsiF?=
 =?us-ascii?Q?/AH9iKKRTVuu3cthm6LptkV9z/P+1Y+qNV0gB8c+u2sOWz9g/g62Esblp5Km?=
 =?us-ascii?Q?DPJdv4FqEimVrfTdDQbuhwe2bnOYL6tbWZwtKrPCC9icEDDjgwy2bby3ZxAx?=
 =?us-ascii?Q?9bvdo8/B7noWZYtDnPPBhwmfvwPDKjBbaf4agtbAvhpHRUtWdZdZTrM3Wvqq?=
 =?us-ascii?Q?4PdSKoM7YK4W+HKcYbIgrMtIfrPGXlaGutdbVgJhzRFfN2A9qPKQHc5zPfMs?=
 =?us-ascii?Q?vA2di5KRc9Jj07hSp+3V03dGp45Mp9Oh2WCT9dJ4f+LIsrEQNfoUqPa0j56k?=
 =?us-ascii?Q?9XQPa3lh6LrvrsDqCmt4/89goheepdM6o4nYSgW4nKDuriYAn7JOh4C/Rpy4?=
 =?us-ascii?Q?+rUUbK0XknCKK5uUGAtIqFITUXiBt5q2m0d+XW5xYCiAGH8fw2v/VHE+STVq?=
 =?us-ascii?Q?KyQyUXp+L21qDmJPhjn2wEy2vVCcbIPcLRwZwvnDexFtBW8IzUTaY/fClmsO?=
 =?us-ascii?Q?W+/0MYRMDCM01x3WjCEWa3qiRSHBolMm2RUHWakzQ306pO35XJORaiAzg0AY?=
 =?us-ascii?Q?VKQS5Nc8NTeL6NnByDRkcuIC+N60m7CGVlbBZngEj1Lu6GpT/CbEVRRSFIwx?=
 =?us-ascii?Q?dsm24d7TzvZ/Q4XEwM3GZuwUUuxcGCEcVzvHwFmdvdPFDocH/HXk/9s1FYFY?=
 =?us-ascii?Q?fakiIJBr26KBhtnlQ9hVqbm9W9kG4fGn6imYA8NGThSBWgTuhmyigfaBF+JY?=
 =?us-ascii?Q?hRCZN4oTsg18/6miP4OInK64uE/dIrCDUCoLKqVlAt9lZ/jfW+B3eUDpD2an?=
 =?us-ascii?Q?UdrkdslIFw8iRT9818GlJPXTcEymknkH4C3FZfI+iPbX/F9yWdZK8/Y9G+T6?=
 =?us-ascii?Q?fK1TvMkQm3A3RoA0cVy3KlDUJLeOZI5GmElApSxASFs6uJv0sCWz86uWidW5?=
 =?us-ascii?Q?CJT/rW14yDtaQDnY1IMz18imkK23vfGRP0de220eeJ/GpgcW3yHisFesZlmD?=
 =?us-ascii?Q?GUHqGv6LaM9q+1q/2Z4Dm8RhNhpqX1I7yG2ZIA362nT0Yk7mQSkaIeURnzGS?=
 =?us-ascii?Q?S+56M4UROh62w531x+XC/chP0pgdjBy3JfljqqYwDoMMBmvS10W9GzoVT//X?=
 =?us-ascii?Q?EuX9LQMMG8Hm97eL/wgXXqhqbsnFiV6vbD2xvPjG6Eipz6vMxheircUw2WyJ?=
 =?us-ascii?Q?WObkKYamwdL47Go8OAPHpfvoxoKKSpyV7rx0FadvonxHJbRIYjHCfhVoR+P5?=
 =?us-ascii?Q?ZohRAkZQbml6Qk6dalAMNQdibj4Mn19uTh9NyM3tGPhvbcWsK/Qhgw3CUWuA?=
 =?us-ascii?Q?qqv8xz6Hn8TJr/8Do2qiDBPP6zr+aM+jsVdP5VRz?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a01a9c27-05de-44e2-3a35-08ddbdf5ca4f
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 08:02:31.6628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQ6jf/NV0W9c0oCzf9GpckBwb50yVLOy5ls14VNQmHCVxulg4n9tHd+3y5mOLnpqyN5w/VG6A8Pult3dl3AKGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2884
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 08:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118302

From: Roland Kovacs <roland.kovacs@est.tech>

Backported CVE-2024-23337, CVE-2024-53427 from jq-1.8.0 and CVE-2025-48060
from jq-1.8.1.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../jq/jq/CVE-2024-23337.patch                | 236 ++++++++++++++++++
 .../jq/jq/CVE-2024-53427.patch                |  82 ++++++
 .../jq/jq/CVE-2025-48060.patch                |  48 ++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   3 +
 4 files changed, 369 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2024-23337.patch
new file mode 100644
index 0000000000..8b8243b752
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
@@ -0,0 +1,236 @@
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
+Upstream-Status: Backport [https://github.com/jqlang/jq.git/commit/de21386=
681c0df0104a99d9d09db23a9b2a78b1e]
+CVE: CVE-2024-23337
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
index 0000000000..64a44a1307
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch
@@ -0,0 +1,82 @@
+From fa6131eb6e9d43e88e35982fa5f6049da2a77a87 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Wed, 5 Mar 2025 07:43:54 +0900
+Subject: [PATCH] Reject NaN with payload while parsing JSON
+
+This commit drops support for parsing NaN with payload in JSON like
+`NaN123` and fixes CVE-2024-53427. Other JSON extensions like `NaN` and
+`Infinity` are still supported. Fixes #3023, fixes #3196, fixes #3246.
+
+Upstream-Status: Backport [https://github.com/jqlang/jq.git/commit/a09a4df=
d55e6c24d04b35062ccfe4509748b1dd3]
+CVE: CVE-2024-53427
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
index 0000000000..c3dfd8ce21
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
@@ -0,0 +1,48 @@
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
+Upstream-Status: Backport [https://github.com/jqlang/jq.git/commit/c6e0416=
99d8cd31b97375a2596217aff2cfca85b]
+CVE: CVE-2025-48060
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

