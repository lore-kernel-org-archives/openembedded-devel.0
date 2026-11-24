Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14660.1795513233790950911
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=h6ClHnQ/;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4163; q=dns/txt;
  s=iport01; t=1795513234; x=1796722834;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rVhhN9uwPYVGPmUedwq9yY/MKVwmq1Jf7sOLBF2fUKM=;
  b=h6ClHnQ/blBDy5Ldt//dorNBuC2S73QzmrCm87eJVXdDwhdvl+mP51tn
   eBLuMssRghZkOAuSwMPRuzXudCsaEBUICG9US+787aom39SZKmAf1qvh1
   ypow29FNTNNel+ZpgXKeTVA8lppknaVshjNx2oAPWthpuI2Ha4cfq/qqV
   VB1uvFbOyc92AWh/C+ijubAZ35fzzgj92DsjvvPvxCalufxsmNsq2ED/S
   Wbiv6N9uU3jqqHKNkxFm6InB+imO8sjHsdDkd1UgRzPB3b8Sc6h0QYtds
   mrGcXealklySPs6GvlqMLKCLDSDXDf4gPceZaFQvF1eKvuECREEM3vW/a
   Q==;
X-CSE-ConnectionGUID: 1WjpWiPVQd+/phAc6xtTog==
X-CSE-MsgGUID: UTB6QStLR/2MV5JuZCCvhw==
X-IPAS-Result: =?us-ascii?q?A0DJAgBeWgVr/9RK/pBaglmCV3VgHSZJlCqCIYEWilOSQ?=
 =?us-ascii?q?4F+DwEBAQ9EDQQBAZMpAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASATgBGAFZAwECTwsjIYMCAYI6AzcDEbpmgiyBAYMpAYFU2?=
 =?us-ascii?q?EwNgloBCxQBgTiFQoMAhSRdGYR9JxsbgXKBFYJ0doEFgRpCAoEnhn8EgiKBD?=
 =?us-ascii?q?IFUHox5AoFPiElIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBH?=
 =?us-ascii?q?IEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKg?=
 =?us-ascii?q?Ro1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELG?=
 =?us-ascii?q?xgNSBEsNxUZBD5uB5QUgxp7CQoBByQgcTwwpiSgIHEKKIN5jCSPPoV8GjOEB?=
 =?us-ascii?q?IFXkkOSVIcVkXOLN4JThAqSEDeEaoFoPIFZcBWDIglKGQ+OLQELC4NgzlsmM?=
 =?us-ascii?q?gIJMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:0wcxDq58y26AwfHBajS1WgxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mQYXG+OOP+CamP1c40gPIznoE1U6JGEx9MwSVBk+yA2Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOt/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eZLIa4tl2OV93+
 b9fMDAkZU6Tm96xz+fuIgVsrpxLwMjDNY4F/3UlxjbDALN/GNbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaOkcn1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FboCKKoDbFZ49ckCwm
 17soV3CHjUgc4a692en70CHrfHPgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPAXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:++ejzKDEnRu3zDjlHemc55DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEKhSqa3/3jbnByryssRZ1a
 tmbuxCLeeYNykesS4/izPIdOrJB7K8gcSVuds=
X-Talos-CUID: 9a23:JRaFyW2OEcCe9qavYLEuwrxfQ/8nakLc9EnpLwz/EWZAQ+OFVWOX9/Yx
X-Talos-MUID: 9a23:GL25sAhNCSehN1JrXPv3p8MpCftCvZ2VFGQ31s8jhZSmKB5bECmdk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62784983"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:40:31 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 14F79180001FD
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:40:31 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id BD987CC2EFA; Tue, 24 Nov 2026 01:40:29 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][blacksail][PATCH] jq: backport CVE-2026-40164 entropy follow-up
Date: Tue, 24 Nov 2026 01:40:29 -0800
Message-Id: <20261124094029.1551023-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132938
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

Backport the upstream follow-up to the CVE-2026-40164 hash seed fix.
Prefer getentropy() and try /dev/urandom if getentropy() fails.

Remove the redundant fixed-version entry so the patch CVE tag
reports the fix without a duplicate status warning.

https://github.com/jqlang/jq/commit/32580f5d83f4321588a1ebf8e3893f7fbecefe4e

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../jq/jq/CVE-2026-40164-follow-up.patch      | 61 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.2.bb       |  3 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch
new file mode 100644
index 0000000000000000000000000000000000000000..47ba4ddb1cfeadeb11137d76fddbec2c411becde
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch
@@ -0,0 +1,61 @@
+From fc85f740b3a926a385683a7ca08b4898858f7940 Mon Sep 17 00:00:00 2001
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
index 9f586eb18d32419f6f71a7e80d63545d1aa8bb9f..1c2e73eed5403720e26f24045f9437cb21daa280 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
@@ -12,6 +12,7 @@ SRCREV = "34f7186b86743a083a589741b6cea95293524108"
 
 SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${PV} \
            file://run-ptest \
+           file://CVE-2026-40164-follow-up.patch \
            "
 
 CVE_PRODUCT = "jq_project:jq jqlang:jq"
@@ -51,4 +52,4 @@ BBCLASSEXTEND = "native"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_ALREADY"
 CVE_STATUS_FIXED_ALREADY[status] = "fixed-version: The issue is fixed in v1.8.2"
-CVE_STATUS_FIXED_ALREADY = "CVE-2026-33948 CVE-2026-39979 CVE-2026-40164 CVE-2026-44777"
+CVE_STATUS_FIXED_ALREADY = "CVE-2026-33948 CVE-2026-39979 CVE-2026-44777"
-- 
2.35.6

