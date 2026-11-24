Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14659.1795513233513539187
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hdZTc9Sx;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3683; q=dns/txt;
  s=iport01; t=1795513233; x=1796722833;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q6HT1z70uZiihphmCrQz0DMxnYJ+DxKSpwHVycnkVyo=;
  b=hdZTc9SxCaLLY6pwx2wwLlwD3958Azxr1HWfyThLz1Js3gbqO64+y03z
   eCtiv/ChyI4Xwk1+jf4yeVvmoc0+ufgEPy3cO+K4yAAlIZxJDte/qLCwM
   zRV4oVMdnnqh/d6JnsB8l3TP5YtMlXMlipGZFhcBF/6TYwu0gpQKWwGH5
   Dy8+IpLzUAaiOEtsFGgTywP0rQ0oZ/aigqYMWKLAGDuUdDCpjgY+wmnwl
   THFkNNJuFfKvZrbRGB8Ywg/sk03razSv6h9CF+0h6JPWTG6fIjidp6TRv
   iXfxrxsN4aYX0VQgLlBirApXIAcaa434Q5n6nScOsQUymfa+8HfyHULf9
   A==;
X-CSE-ConnectionGUID: 3sUetO7IR26GkMuizuHTtw==
X-CSE-MsgGUID: 72ElGmq/Qai7/6rNfjTzTg==
X-IPAS-Result: =?us-ascii?q?A0DJAgC4WQVr/9VK/pBaglmCV3VgHSZJlCqCIYEWilOSQ?=
 =?us-ascii?q?4F+DwEBAQ9EDQQBAZMpAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASATgBGAFZAwECTwsjIYMCAYI6AzcDEbpmgiyBAYMpAYFU2?=
 =?us-ascii?q?EwNgloBCxQBgTiFQoMAhSRdGYR9JxsbgXKBFYJ0doEFgRpCAogmBIIigQyBV?=
 =?us-ascii?q?B6MeQKBT4hJSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBH?=
 =?us-ascii?q?oESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaN?=
 =?us-ascii?q?TwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBhYhCxsYD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeUFIMaewkKAQckgRE8plSgIHEKKIN5jCSPPoV8GjOEBIFXk?=
 =?us-ascii?q?kOSVIcVkXOLN4JThAqSR4RqgWg8gVlwFYMiCUoZD44tAQsLg2DOWyYyAgkzA?=
 =?us-ascii?q?QcCBw8CgXORfgEB?=
IronPort-Data: A9a23:ts646KJ10Jcfwk9GFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS1DUEm
 2tKXjuCOKvbZWCmfowkbtzl8E8AsMDWx4dhHQEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQvajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN01F3w7IapH29wtX05N0
 OEZOi0tUgyc0rfeLLKTEoGAh+wqIdOuOMYUvWttiGiDS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A2N3wsYDUXUrsTIJ4zgu6unXnnWzZZs1mS46Ew5gA/ySQviOGzYICPK7RmQ+0KxGuci
 WffuF3wA05dasa5xzi54E6j07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/OOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:G8qVQaP5LWyBoMBcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5JktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: 9a23:oxn4yW9KTIVpxFp3Bg+VvxUPJ805VSL89i2ODEydFGd7VZ2pVUDFrQ==
X-Talos-MUID: 9a23:izNO5AnfzluGfzHWO8zwdno9bupszKG3T3kEkMpB5dOiOy5MKQuS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="60168229"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:40:31 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id ED6D318000AC2
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:40:30 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 9D2C0CC2EF3; Tue, 24 Nov 2026 01:40:29 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] jq: backport CVE-2026-40164 entropy follow-up
Date: Tue, 24 Nov 2026 01:40:29 -0800
Message-Id: <20261124094029.1550975-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132937
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

Backport the upstream follow-up to the CVE-2026-40164 hash seed fix.
Prefer getentropy() and try /dev/urandom if getentropy() fails.

https://github.com/jqlang/jq/commit/32580f5d83f4321588a1ebf8e3893f7fbecefe4e

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../jq/jq/CVE-2026-40164-follow-up.patch      | 61 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.2.bb       |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch
new file mode 100644
index 0000000000000000000000000000000000000000..18d5fc1a02d5f4488744e89368c0de43628c99ae
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch
@@ -0,0 +1,61 @@
+From 5465d963cefed0f5f58cba2278f697c7ef77548d Mon Sep 17 00:00:00 2001
+From: Brandon <breakouttradersc@gmail.com>
+Date: Fri, 25 Sep 2026 03:39:06 -0400
+Subject: [PATCH] Prefer getentropy() over arc4random() to seed the string hash
+ (#3629)
+
+glibc's arc4random() aborts with "Fatal glibc error: cannot get entropy
+for arc4random" when the kernel lacks getrandom(2), so jq died on
+startup on older kernels once 0c7d133 began seeding the hash on every
+run.  getentropy() merely returns -1/ENOSYS there, so prefer it, and
+route its failure through the existing `/dev/urandom` path - which works
+on precisely those kernels -- instead of a guessable `getpid() ^ time()`.
+
+CVE: CVE-2026-40164
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/32580f5d83f4321588a1ebf8e3893f7fbecefe4e]
+
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ src/jv.c | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index 48a63e6e55cacc3b3ad316586469605c6978a805..76d2bf82fb62f9436dc134d86fae2ee26168ba58 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1210,12 +1210,18 @@ static pthread_once_t hash_seed_once = PTHREAD_ONCE_INIT;
+ 
+ static void jvp_hash_seed_init(void) {
+   uint32_t seed;
+-#if defined(HAVE_ARC4RANDOM)
+-  seed = arc4random();
+-#elif defined(HAVE_GETENTROPY)
+-  if (getentropy(&seed, sizeof(seed)) != 0)
+-    seed = (uint32_t)getpid() ^ (uint32_t)time(NULL);
+-#else
++  /* Prefer getentropy() over arc4random(): glibc's arc4random() aborts the
++   * process when the kernel lacks getrandom(2) (#3584), while getentropy()
++   * merely fails, letting us fall back to /dev/urandom. */
++#if defined(HAVE_GETENTROPY)
++  if (getentropy(&seed, sizeof(seed)) == 0) {
++    hash_seed = seed;
++    return;
++  }
++#elif defined(HAVE_ARC4RANDOM)
++  hash_seed = arc4random();
++  return;
++#endif
+   int fd = open("/dev/urandom", O_RDONLY);
+   if (fd >= 0) {
+     if (read(fd, &seed, sizeof(seed)) != 4)
+@@ -1224,7 +1230,6 @@ static void jvp_hash_seed_init(void) {
+   } else {
+     seed = (uint32_t)getpid() ^ (uint32_t)time(NULL);
+   }
+-#endif
+   hash_seed = seed;
+ }
+ 
+-- 
+2.35.6
+
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.2.bb b/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
index 0bbe6e009fea16c29c439b1211b07963cbc446fd..4d21670e0f5acc2eb7bddf1951ea22df1ffddea2 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
@@ -12,6 +12,7 @@ SRCREV = "34f7186b86743a083a589741b6cea95293524108"
 
 SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${PV} \
            file://run-ptest \
+           file://CVE-2026-40164-follow-up.patch \
            "
 
 CVE_PRODUCT = "jq_project:jq jqlang:jq"
-- 
2.35.6

