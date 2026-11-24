Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14659.1795513233513539187
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Y5ND38de;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7693; q=dns/txt;
  s=iport01; t=1795513234; x=1796722834;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A6mQpQbjPZrsvn8YcW4K2AmE8eoCSq/YpnwIFDzcMo8=;
  b=Y5ND38deuoLSe6B5YIPvZcsjUAqfs8uKzcvnBMZXPdRr7qmJuqX/Zz/A
   8OzsMJGog2HRKBFhUYyrGGskEH35xDqjJEdmyWR0WXK2iylZgj2hzCDIs
   7Vr5mXJ9l1Z5Z4agLMZxkSTwrDWx9nO7k41DexpUl14m9Boc7odLAzE2t
   e7KZNhKsFdZjDILtkVuuGvLLg9sog+Jmcl8AUN4/nBDh28jFwV4fS7n+h
   ri7IbvurzjShhn2ArLskMN7eQywyANaMkwLgYDv9yroljAPT8LztWU286
   d9aesUeh4RHfNdjKWzRZgngd61nKspvjCq3mz5qS/wZKM0tFYxP4U51Iu
   g==;
X-CSE-ConnectionGUID: Y1wBavmoSlybhWRtk10i1A==
X-CSE-MsgGUID: 6CUEfZgQRVWYqfvGMYEK8w==
X-IPAS-Result: =?us-ascii?q?A0DJAgC4WQVr/9RK/pBaglmCV3VgQ0kDlCeCIYEWilOSQ?=
 =?us-ascii?q?4F+DwEBAQ9EDQQBAZMpAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASATgBGAFZAwECTwsjIYMCAYI6AzcDEbpmgiyBAYMpAYFU2?=
 =?us-ascii?q?EwNgloBCxQBgTiFQoMAhSRdGAGCSoIzJxsbgXKBFYJ0doEFgRpCAogmBIIig?=
 =?us-ascii?q?QyBVB6MeQKBT4hJSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFg?=
 =?us-ascii?q?RyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosC?=
 =?us-ascii?q?oEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBhYhC?=
 =?us-ascii?q?xsYDUgRLDcVGQQ+bgeUFIMaewkKAQckgREHKwpfpXWgIHEKKIN5jCSPPoV8G?=
 =?us-ascii?q?jOEBIFXkkOSVAuYfYs3glOECpJHhGqBaDyBWXAVgyIJShkPji0BCwuBUYIPz?=
 =?us-ascii?q?lsmMgIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:nzzBpaAgAYOUEBVW/37iw5YqxClBgxIJ4kV8jS/XYbTApDwqgzNVz
 TQfXj/VM/qKNGGjett2YYjjoUhQvJ6Gm9VnOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/gGYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE8qxxJkgoOIoj/vd9AV506
 f9BcDFUR0XW7w626OrTpuhEj8k5ac2uN4QFtzQ5lHfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMGAHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237klQojui3a4e9ltqiG+5os0iqq
 Vv8wVvIGx8EG/mu5BnV7Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTUk+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:GoNXIqrc39OYMsfym1R5EQsaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: 9a23:WQxOLGAbeuCCz/76Exg+62QdBMUiSXnMxnfvGVO7UD5oEZTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AZNRvMwzYFSSeTj9E+V6huAyWZxaaqPqFNW0Do5o?=
 =?us-ascii?q?/gfe7BDV+JRi4vRmUEpByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="60168235"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:40:32 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id EFC6A1800041B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:40:31 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id A23F4CCFFD2; Tue, 24 Nov 2026 01:40:30 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH] jq: fix CVE-2026-40164
Date: Tue, 24 Nov 2026 01:40:30 -0800
Message-Id: <20261124094030.1551180-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132939
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

Backport the upstream hash-seed randomization fix [1] for
CVE-2026-40164 [2]. Include its upstream follow-up [3] to prefer
getentropy() and try /dev/urandom if getentropy() fails. Apply the
follow-up after the original CVE patch.

[1] https://github.com/jqlang/jq/commit/0c7d133c3c7e37c00b6d46b658a02244fdd3c784
[2] https://github.com/jqlang/jq/security/advisories/GHSA-wwj8-gxm6-jc29
[3] https://github.com/jqlang/jq/commit/32580f5d83f4321588a1ebf8e3893f7fbecefe4e

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../jq/jq/CVE-2026-40164-follow-up.patch      | 61 +++++++++++++
 .../jq/jq/CVE-2026-40164.patch                | 91 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  2 +
 3 files changed, 154 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40164.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch
new file mode 100644
index 0000000000000000000000000000000000000000..46a90266dcc9a9e6ee5ac1500dc5742ebd63905e
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch
@@ -0,0 +1,61 @@
+From b45a29badd76b3cbca4a5e6682adad1d887de92e Mon Sep 17 00:00:00 2001
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
+index fdb2c72d53e8be74eb0e7013552fdfb4f90adf59..3211e8eaa9df75a278733c69ae8481b304070e31 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1230,12 +1230,18 @@ static pthread_once_t hash_seed_once = PTHREAD_ONCE_INIT;
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
+@@ -1244,7 +1250,6 @@ static void jvp_hash_seed_init(void) {
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
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164.patch
new file mode 100644
index 0000000000000000000000000000000000000000..4a4dd3f2a7263e2eab3ad016b7d7d40e5b8d73f0
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164.patch
@@ -0,0 +1,91 @@
+From 48386cda5636fbf51c9cc77ffbc29948e22d225a Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 13 Apr 2026 08:53:26 +0900
+Subject: [PATCH] Randomize hash seed to mitigate hash collision DoS attacks
+
+The hash function used a fixed seed, allowing attackers to craft colliding keys
+and cause O(n^2) object parsing performance. Initialize the seed from a random
+source at process startup to prevent the attack. This fixes CVE-2026-40164.
+
+CVE: CVE-2026-40164
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/0c7d133c3c7e37c00b6d46b658a02244fdd3c784]
+
+Co-authored-by: Asaf Meizner <asafmeizner@gmail.com>
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ configure.ac |  2 ++
+ src/jv.c     | 34 ++++++++++++++++++++++++++++++++--
+ 2 files changed, 34 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index bc1d273..c0bc5d6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -143,6 +143,8 @@ AC_CHECK_MEMBER([struct tm.tm_gmtoff], [AC_DEFINE([HAVE_TM_TM_GMT_OFF],1,[Define
+ AC_CHECK_MEMBER([struct tm.__tm_gmtoff], [AC_DEFINE([HAVE_TM___TM_GMT_OFF],1,[Define to 1 if the system has the __tm_gmt_off field in struct tm])],
+                 [], [[#include <time.h>]])
+ AC_FIND_FUNC([setlocale], [c], [#include <locale.h>], [0,0])
++AC_FIND_FUNC([arc4random], [c], [#include <stdlib.h>], [])
++AC_FIND_FUNC([getentropy], [c], [#include <unistd.h>], [0, 0])
+ 
+ dnl Figure out if we have the pthread functions we actually need
+ AC_FIND_FUNC_NO_LIBS([pthread_key_create], [], [#include <pthread.h>], [NULL, NULL])
+diff --git a/src/jv.c b/src/jv.c
+index 76c70c2..fdb2c72 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -40,6 +40,10 @@
+ #include <limits.h>
+ #include <math.h>
+ #include <float.h>
++#include <time.h>
++#include <unistd.h>
++#include <fcntl.h>
++#include <pthread.h>
+ 
+ #include "jv_alloc.h"
+ #include "jv.h"
+@@ -1221,7 +1225,33 @@ static jv jvp_string_append(jv string, const char* data, uint32_t len) {
+   }
+ }
+ 
+-static const uint32_t HASH_SEED = 0x432A9843;
++static uint32_t hash_seed;
++static pthread_once_t hash_seed_once = PTHREAD_ONCE_INIT;
++
++static void jvp_hash_seed_init(void) {
++  uint32_t seed;
++#if defined(HAVE_ARC4RANDOM)
++  seed = arc4random();
++#elif defined(HAVE_GETENTROPY)
++  if (getentropy(&seed, sizeof(seed)) != 0)
++    seed = (uint32_t)getpid() ^ (uint32_t)time(NULL);
++#else
++  int fd = open("/dev/urandom", O_RDONLY);
++  if (fd >= 0) {
++    if (read(fd, &seed, sizeof(seed)) != 4)
++      seed = (uint32_t)getpid() ^ (uint32_t)time(NULL);
++    close(fd);
++  } else {
++    seed = (uint32_t)getpid() ^ (uint32_t)time(NULL);
++  }
++#endif
++  hash_seed = seed;
++}
++
++static uint32_t jvp_hash_seed(void) {
++  pthread_once(&hash_seed_once, jvp_hash_seed_init);
++  return hash_seed;
++}
+ 
+ static uint32_t rotl32 (uint32_t x, int8_t r){
+   return (x << r) | (x >> (32 - r));
+@@ -1240,7 +1270,7 @@ static uint32_t jvp_string_hash(jv jstr) {
+   int len = (int)jvp_string_length(str);
+   const int nblocks = len / 4;
+ 
+-  uint32_t h1 = HASH_SEED;
++  uint32_t h1 = jvp_hash_seed();
+ 
+   const uint32_t c1 = 0xcc9e2d51;
+   const uint32_t c2 = 0x1b873593;
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index af9704420c4327b88ade99f003660a5494d39294..4fbc72b3f37b16b6e23496a9ee23853ec2986198 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -28,6 +28,8 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
            file://CVE-2026-49839.patch \
            file://CVE-2026-54679.patch \
            file://CVE-2026-39956.patch \
+           file://CVE-2026-40164.patch \
+           file://CVE-2026-40164-follow-up.patch \
            "
 
 CVE_STATUS[CVE-2025-49014] = "fixed-version: fixed in v1.8.1"
-- 
2.35.6

