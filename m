Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14419.1795513235134679364
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iHiHohlI;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3737; q=dns/txt;
  s=iport01; t=1795513235; x=1796722835;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v8EuitC3XJ0Wd8hFK3xvR/0lsx2wWU6tdZK+0iZZHBQ=;
  b=iHiHohlIw30ydJX4X1RKXuIaBqD9Vlml8IAzNAGiXdeHPN7nksH+JT8U
   HC/ePyeIz2Z6EOk8jRqXgjjdWTXYPl1DVYBOwBkKXLha90IrT8VKwf7KH
   CKcXhN+HcYTVbf4AabEtL5GAFvdxvyt1nLTVbPWqhWjV/NPFlgn5bwM0B
   HFkJ845tz4kmsgR35ElNCBBm/7Zomrz8XX3nl88Rq3FP3aDtfSP+H1CQ+
   NrDcHELqW6qF7Bm2naBm9qqhEq1EKzYu1NegrpgIzHt3zzdeL4wJsFP6e
   8rzVU5YltSVlanwrgOLUhUd+diT5ANlEFULYSMV6c6B7MOBC/WHPvZVch
   Q==;
X-CSE-ConnectionGUID: 1EVmrWqGRJ6hRxZ70Ub3gQ==
X-CSE-MsgGUID: YtBA7BooTUm1rcswnJy1uA==
X-IPAS-Result: =?us-ascii?q?A0DJAgDbWAVr/9RK/pBaglmCV3VgHSZJlCqCIYEWilOSQ?=
 =?us-ascii?q?4F+DwEBAQ9EDQQBAZMpAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASATgBGAFZAwECTwsjIYMCAYI6AzcDEboRGzeCLIEBgykBg?=
 =?us-ascii?q?VTYTA2CWgELFAGBOIVCgwCFJF0ZhH0nGxuBcoEVgnR2gQWBGkICiCYEgiKBD?=
 =?us-ascii?q?IFUHox5AoFPiElIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBH?=
 =?us-ascii?q?IEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKg?=
 =?us-ascii?q?Ro1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELG?=
 =?us-ascii?q?xgNSBEsNxUZBD5uB5QUgxp7CQoBBySBETymVKAgcQoog3mMJI8+hXwaM4QEl?=
 =?us-ascii?q?BqSVIcVkXOOCoQKkkeEaoFoPIFZcBWDIglKGQ+OLQELC4NgzlsmMgIJMgEBB?=
 =?us-ascii?q?wIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:KgaA96/yq9t96rWb0xz7DrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jFKW2rUb/+LYWTye4ggaoiz9xlVscKHzIU2QQNqqnxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhPs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lvELMd4NluLltsq
 /wiOAJSNi2J3O2PlefTpulE3qzPLeHiMZlavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6ZOXWjOX9PYH46tOulmHD5aD1AgFmUvqEwpWPUyWSd1ZCza4aJK43QFK25mG6pu
 kjvoE7+BS0nMYWFwiGa9FC93/LmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl/AQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:4hjsO6g2VLCITRC6C7QSRdFJ/HBQXuoji2hC6mlwRA09TyX+rb
 HNoB1173HJYVoqNU3I+urwW5VoP0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrMdKB3tytHOuQ8YpE0dKT1XVw==
X-Talos-CUID: 9a23:aRnH4mF2o0+i8ILGqmI+2XARAP88XUf/knfqM33nUVtjE7KsHAo=
X-Talos-MUID: 9a23:Q6S+PAjIJmuQtsrzpp7I5MMpBdtCyvuED0cxrJBfocKfKipSKm6ApWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="63449929"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:40:31 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 3143718000424
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:40:31 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id D94B0CCA798; Tue, 24 Nov 2026 01:40:29 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] jq: backport CVE-2026-40164 entropy follow-up
Date: Tue, 24 Nov 2026 01:40:29 -0800
Message-Id: <20261124094029.1551086-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132940
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

Backport the upstream follow-up to the CVE-2026-40164 hash seed fix.
Prefer getentropy() and try /dev/urandom if getentropy() fails.

https://github.com/jqlang/jq/commit/32580f5d83f4321588a1ebf8e3893f7fbecefe4e

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../jq/jq/CVE-2026-40164-follow-up.patch      | 61 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch
new file mode 100644
index 0000000000000000000000000000000000000000..85f180ab9c647fa8414cd4fa950efc37c5173667
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40164-follow-up.patch
@@ -0,0 +1,61 @@
+From c5e838c81ef5e47ab3a544c195fb0f856f48257e Mon Sep 17 00:00:00 2001
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
+index 6f79693a1a2b8e398838053cb9f39981f98e7029..f524a29c47abadde9f7c569345cd3e1fdf31ebf1 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1207,12 +1207,18 @@ static pthread_once_t hash_seed_once = PTHREAD_ONCE_INIT;
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
+@@ -1221,7 +1227,6 @@ static void jvp_hash_seed_init(void) {
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
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 7cd3b3d483e8591c50e9786f7827f773f6281d1e..bd8aa5ba1aad9f304dcbb4562601d3a01b76bb3b 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2025-48060.patch \
     file://CVE-2025-9403.patch \
     file://CVE-2026-40164.patch \
+    file://CVE-2026-40164-follow-up.patch \
     file://CVE-2026-32316.patch \
     file://CVE-2026-33947.patch \
     file://CVE-2026-33948.patch \
-- 
2.35.6

