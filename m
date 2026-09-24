Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4118BC9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 15:54:06 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1654.1790265240960057986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2026 08:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=CFWse+wv;
 spf=pass (domain: est.tech, ip: 52.101.83.12, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tB6fPInKrMyH4Aadt0HwH6P/e7vmLxunTtww2HkHJAt6UfN4l1EzIjyJM09aEUZ4+43G/6fEG5NlyMc94h5PzP9727MH9/1p4IdXXq+UOCnBv9PFk3buM5fOE0AlquWsewTMqOrbjt9lpXCwWJB+mEgR7NZkMgHjGL5zw/KNmJfTysag9Q0btJkYIk0TysZSoJUA+bDwnXYhRWtUFHSymThMu72dghcO7MmJrIW6eVUgqCEd3Xv6jcCFdy/pStGY1uVGbEafLa6jLNI8PgP8cqC/ry+6BjvYr9yknYw9R0Eh/B3qTMAIQqtq6CW7slYbG0Gb97yOP6cqtqTadhO5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NesRWLUr1tjVz58Gu6ME7a3peIJHJKFBUNGNPxUIiw=;
 b=W3TfZewXLWa02A6YN4xrwZj0NEMYGTUvKXMfFoZwK8jIR+sisy+KMX+lPrivawETyxsBjRTznA8KmstLpMbJqXmO0dXJPSgVWkuAqrEJJYjZZ/3XTVOolHHOBM1F9ihqZg2L8OCTMbpbHfwASwJbF1i2mAQ9EJgnsvntp4X7cgJVSGEqz0Huq/mC23bbHAs3RAUorHpTc/amQtmaoOPN2HGxlvwKv0P3MpOb5CyJ5l+biWA1DHneojyPesdjPPqyLqatFZp4DQwAaC8cD0VYkkCXtwFez69EtKYLX4wom0LuwjnV/Rdf8dpUq0p23cEEywazozTIaRLordkSsbaIvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NesRWLUr1tjVz58Gu6ME7a3peIJHJKFBUNGNPxUIiw=;
 b=CFWse+wvU5vP7gfCpfmqHi/NMKSiUT7Rbdx5tnxAM4kFc9b5vYbig35hNFDNNDX7Kr+9E2pYbHWlesPlUlh6S/eTYy7ZuIabqL/7U8WzbDhkIK0h6ikZFlIJCvywBNcqHyVEncJK0Xga+PsHW6mcBTkXNe/dE8M6uNoohdzVV5IGEsMxnGixUGooCq+n0oQKs61G/HBKlRHepoOZjiDET4bVx3nnoUHOBRErO2479XI1Dnp9WwnCTYuceWsGTywfGHpOCvZq4vMH/MbpRN3mz2eumNKSYEaGyylkC33JKxdnR6XmIFUWzKRxwKbYwUYa71utbWB8xWxHFux287fXjw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0731.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:53:56 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:53:56 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-oe,wrynose][PATCH] abseil-cpp: fix 32-bit x86 build of hash.cc
Date: Thu, 24 Sep 2026 17:53:52 +0200
Message-ID: <20260924155352.43207-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0731:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a997d8-9d66-4330-603f-08df1a540a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|11063799006|56012099006|6133799003|29003799003|25016099003|12006099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	NrpwOU+GsbzOHIVEjPkBZmfNcypJB5jNfghCxfLbFVTbu5oPET0lFVGBO2901TzDyLYDkg+/U1fx1PjHqi9xVN48LDKg88NmNz6RFa6Dlb4QNF8YsJIf9jbhFQesS3HHthncs8VtDZwKRfQvLbfpLHh+9NLhj9kWT5hAQmbWILAJjAztrsbRlW53/jddcTWA5OLYoajyEBJimdfo2nyx9lgyL9GjtOU6pr1NnL6cb/P/fsQdaB2k73JsWASZqLsXbZsT95dKDC+UdFYqnpCjguB9SptD6N9gFOkwvtHxBTmGcM9+DA92GfBqaVCA1bh66cn1rfwpGXvgqN9tF6lRMAcKiQUtdWVGfR5wRfcOF4hxNaEatGsWurraxmcCZL6RsgfrJ28PPcHtTaieiV/hnhfbm1mAX5BKtJvv68OWS3M4ovABi3UVxZ0yq0vhWjM4mh5lM9bdTR/yjTLssjjsav0pqQmbBS0Y6eQo4vqhyiFf6EURHG9eYS6QWwp64o4LtHiEKjbphtTcdK5d8LE7cB6iYAvkTRIcWT6NN6byNEx2GZ1UJkiMPPV85u2hgs1RSB3khrL9UnRlXe8HVs4aQoV533bOhp81zaey+JQ6Uf8dPurtYsqCPvr1+misk0dlow4ASlJklvCeBasB2Z3ImquGsDPQWSX5zcmQS3lGrdI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(29003799003)(25016099003)(12006099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v94/O3kCvRaw0WNDF0bZIQD6d44haqY7rhtSZoR3rQ9PTyXffjBBI0VJ8zBO?=
 =?us-ascii?Q?2FgKslj1uNje5gaJOTUWa3DJstBxvzirqQrFSxuqdgzzNaCF9BbxDM4O3lQg?=
 =?us-ascii?Q?xIRm5dBXi1xGHA0ruKS1D4g/d1tKVIt+FIlfdokzLWYaUwyazEg0TOcHBvPd?=
 =?us-ascii?Q?o+KhICSU8EP2eZVz1Be6zQyDuZRk4Z9tloZe9hwrkWbRSMHU0+oEGnjA4uU/?=
 =?us-ascii?Q?Hh70S0rnWQcWD8IuAS/XchuahTCsSfs1/7jVWfYVyYRHQzG8jjyWsFqRcXXZ?=
 =?us-ascii?Q?o4D8WP+ZP45B9EFxkfz5A0EeRjTE/W9nqEaObebGY1MFXDZEirw0AzUe2PkU?=
 =?us-ascii?Q?btWv3zcNZ/d0Z0WKyD1qvDOXe3E6NRJseC18+JNdBf4OdRfZuAi6EiK1Ujhg?=
 =?us-ascii?Q?p39S2Eb+wj/xNkcOYP/9jCv1bAbiQXOKXdwBzGjJiVK4bWlbPJXmTQD5lmv0?=
 =?us-ascii?Q?XpBYhxg+1FXK5LtMtyFu/irYxwzbmEyQMCkCVxyVmB56MXcr5hKwZgATsFp5?=
 =?us-ascii?Q?tNa4nw2FtE30MmKp+knFDNTV4Y9528mLZrxCowQANNq4TnWOXIsEIGBNPArn?=
 =?us-ascii?Q?unRMKwoBjWKwwh5HVbEjPfZcig3+utlIjOaiLEruIwOVtu8PXDG6e1mQSs2u?=
 =?us-ascii?Q?l6FYVsK4iE0ko/tYn8UgYRtZemqFO3YPOZKio+1iLBr+GBr6NEfTVnlx9n0+?=
 =?us-ascii?Q?AbJMsSRh+mjLd0478USyvLlPJ+YptBqb6Q0WM9FElxRbz0wqymCzi2pNQIMJ?=
 =?us-ascii?Q?vNWFbjQHNZBw/WQw0S/ynLCOhQAY3Pr/rwbwJ0ROVk8SlxqL6EgmlWb5Trzy?=
 =?us-ascii?Q?j2KQqKDfOiKRt37BEzxWYrUEkzHoP54w+W83KsXIFIrHZAzJWDAKfKc3Nunk?=
 =?us-ascii?Q?n7qDDKeUOI5+bxiR4IMfZnQU2SBctaU2drGbINiaevfXBow5g9ivkrlM5A3y?=
 =?us-ascii?Q?PJw/kJD7NryV+sP27EOcy6dWZfiFPgsxYZQYRkcqzidw+tcj7roqLTD2m5uN?=
 =?us-ascii?Q?a0ma4j5W2C76YuoN4sZEeQjPeX0jEUnd63UoohNvUoa/eHe3v7EtyNEGJwFT?=
 =?us-ascii?Q?yokFd3Hj6vKCUHX8lkiQiwG467zqU37dDH1U1mdQkjjw0tBkQmABxHev79Tp?=
 =?us-ascii?Q?GbE2Sso+LDsGPdZmfEVg4bVv6H8ou5RA+Yln8DCB2rV++AYIeIAVWenZc6ci?=
 =?us-ascii?Q?FWkPJN1xDSG0gwCE2Gfmxw8HJdD++kWxnETevisWYexJKENTicCtVAoQfW4/?=
 =?us-ascii?Q?M2qscAVn6Pu02cKFUQyRMBPLexYH75R5QzQskCQnvv3axoLzBilzi44FEgau?=
 =?us-ascii?Q?yzixWLjZnplcy3Uu7b87z3/tdjAGeuITGn6cY81iQQNjGPJntLtxHZHYykt9?=
 =?us-ascii?Q?whmHs6VsrhPaZUZtpkSZzR9gLBTsxOF9U5EPiBIRiCeoZFgncY1Y1tjOv4v+?=
 =?us-ascii?Q?c9vhl6AjaQpJOCvCF9BdmBal1V+MTiT7w+PM2DO0EmrLIWn+AttJ8oCvzRr8?=
 =?us-ascii?Q?q0AurO9z1AABrRyYWemfo1i9e/ufhh3eLSAZ59ukRpDfaT0szSfEafzK/f3g?=
 =?us-ascii?Q?I7Fl4xKJ4wuehEyZYJvSpl44/doLKBdtu0npub5BbpjJ7VyTN9bYWjAgkVbO?=
 =?us-ascii?Q?7srxyzYzxX1MNSubrjQpq4IiA4XSrGKi9HtziwGPHaLiJURQKuBcbh4MFBBx?=
 =?us-ascii?Q?9iehksbMy8yRbXxYgxmMyDH7NOvXMo0RZAxTW5awGBxm0xpKXAnIJxJ9QVrT?=
 =?us-ascii?Q?zHLh8VYM8Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a997d8-9d66-4330-603f-08df1a540a42
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:53:56.3089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: keuI6jSsqecPgREqgOjuXJlHuvt2UwIgFHq/MdXPARrdZyka5JgFRqFsMcwvX6DtFv/kfJODp8/mMjeI9U8Slur6xLZLOolqNsEjFWmPpW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0731
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 15:54:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130286

The x86 AES SIMD path in absl/hash/internal/hash.cc uses the 64-bit-only
_mm_cvtsi128_si64 and _mm_extract_epi64 intrinsics but is gated only on
__SSE4_2__ && __AES__, so the 32-bit multilib build fails to compile.

Add a patch that requires __x86_64__/_M_X64 for that path, matching the
existing guard in absl/crc/internal/crc32_x86_arm_combined_simd.h.

Upstream-Bug: https://github.com/abseil/abseil-cpp/issues/2176

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-x86-AES-SIMD-path-to-64-bit-targets.patch | 34 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_20260107.1.bb       |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-has=
h-restrict-x86-AES-SIMD-path-to-64-bit-targets.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-hash-restr=
ict-x86-AES-SIMD-path-to-64-bit-targets.patch b/meta-oe/recipes-devtools/ab=
seil-cpp/abseil-cpp/0003-hash-restrict-x86-AES-SIMD-path-to-64-bit-targets.=
patch
new file mode 100644
index 0000000000..88c1a503c7
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-hash-restrict-x86=
-AES-SIMD-path-to-64-bit-targets.patch
@@ -0,0 +1,34 @@
+From be307ee0aa505709f1fe8fc0563c8326ef2bf7a3 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 24 Sep 2026 14:59:26 +0000
+Subject: [PATCH] Fix 32-bit x86 build of hash.cc
+
+The x86 AES SIMD path in absl/hash/internal/hash.cc uses the 64-bit-only
+_mm_cvtsi128_si64 and _mm_extract_epi64 intrinsics but is gated only on
+__SSE4_2__ && __AES__, so 32-bit x86 builds fail to compile.
+
+Require __x86_64__/_M_X64 for that path, matching the existing guard in
+absl/crc/internal/crc32_x86_arm_combined_simd.h.
+
+Fixes: https://github.com/abseil/abseil-cpp/issues/2176
+
+Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/2177=
]
+Upstream-Bug: https://github.com/abseil/abseil-cpp/issues/2176
+---
+ absl/hash/internal/hash.cc | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/absl/hash/internal/hash.cc b/absl/hash/internal/hash.cc
+index 43cb561b..ef856254 100644
+--- a/absl/hash/internal/hash.cc
++++ b/absl/hash/internal/hash.cc
+@@ -28,7 +28,8 @@
+=20
+ #ifdef ABSL_AES_INTERNAL_HAVE_X86_SIMD
+ #error ABSL_AES_INTERNAL_HAVE_X86_SIMD cannot be directly set
+-#elif defined(__SSE4_2__) && defined(__AES__)
++#elif defined(__SSE4_2__) && defined(__AES__) && \
++    (defined(__x86_64__) || defined(_M_X64))
+ #define ABSL_AES_INTERNAL_HAVE_X86_SIMD
+ #endif
+=20
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.1.bb b=
/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.1.bb
index 128ed81556..86f337075c 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddf52c6edb7adc2=
2e533b2bacc3bd3915"
 SRC_URI =3D "https://github.com/abseil/${BPN}/releases/download/${PV}/${BP=
}.tar.gz \
            file://0001-absl-always-use-asm-sgidefs.h.patch \
            file://0002-abseil-ppc-fixes.patch \
+           file://0003-hash-restrict-x86-AES-SIMD-path-to-64-bit-targets.p=
atch \
            "
 SRC_URI[sha256sum] =3D "4314e2a7cbac89cac25a2f2322870f343d81579756ceff7f43=
1803c2c9090195"
=20

