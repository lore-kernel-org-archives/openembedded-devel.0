Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEDAC44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 15:21:21 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152672.1783351273578482615
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 08:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=G9KLfjcW;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3648; q=dns/txt;
  s=iport01; t=1783351273; x=1784560873;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=86j7EkND5fC/bK/P4UGwu0uN0yLplfDLSVF14Dap0VU=;
  b=G9KLfjcW7jutxvZRnNcGjp4rqlJC//LMPKHwTNciNVyKC9t6PJb7GaOi
   3MncNmmuNHIb0lE+FX1SbgdUYcljeDe5B4g3xCuKeHEsFckOQUqXquiCc
   Z2mP57OUTwvDrHJI19TtJgQbnJrwaYc2K4BwrjKkS6s52ROO9Ukk8Spzq
   XrM84NMY6bNgfFJNhxKMTdSJGawt7p/j3+1DyvtoV7wzxoS4cuklccnYf
   fyxiMMvAl3j97QHfYSaZsqgkfYM1iCsGkaawwdQNBq587CrP3Bz9oOsmo
   EhUyVmfeU0amBkC3XNNgv0U8ZfZns2kgPzhCrewEOKyG33ANMrLKPjyBt
   A==;
X-CSE-ConnectionGUID: NSnx/Fa1ROSiFRPMOMRD4g==
X-CSE-MsgGUID: 81TarQSVTRWC/8/ewcBWsA==
X-IPAS-Result: =?us-ascii?q?A0AaAABNx0tq/5H/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJA4xwiVgDnhuBfg8BAQEPRA0EAQGFBgKNTQImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAzIBGAEtEBwDA?=
 =?us-ascii?q?QIvKyMIGYMCAYJzAgERBrlXgiyBAYMoAT8CQ1DbLAELFAEFgTMBhT6IH1sYA?=
 =?us-ascii?q?YR6AicbG4FygRWDaYEFd2UCAhiBDYZ+BIIigQyBWh6PJ0iBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgWuBAoR5Ix8DOX+BMHVKeS2BAgESH?=
 =?us-ascii?q?gqBUoEpAwsYDUgRLDcUGwQ+bgeMexcPgj17EwErgixOpSihDwoog3WMIZU6G?=
 =?us-ascii?q?jOFW6URC5h9izeCU5ZQhGiBaDyBWXAVgyIJShkPjioOC4NghRPJRyQ1AgEBB?=
 =?us-ascii?q?wMvAQEHAgcOAwuBaJAAgX0BAQ?=
IronPort-Data: A9a23:RG5jjagInRyx0x3SwSvgL+7PX161MxEKZh0ujC45NGQN5FlHY01je
 htvXD+Hb6yCZWqmKIp2PY23pEMPupTRyNQ3GVc5qShmRC5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPrd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU+weBnRk9Hr
 MY/EzEjVCimoMeM7O60H7wEasQLdKEHPasFsX1miDWcBvE8TNWbE+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgp/5JEWxI9EglHkayBDqEqWrII84nPYy0p6172F3N/9J4TWGZsEzh7Ez
 o7A1zSgPhgADeeh9QC62TX8weLQlgnEQ6tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YRLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWriUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:1OAfbaiJ3olnQs8zNS8LNQ3+iHBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: =?us-ascii?q?9a23=3AU7t0tGh78KsOZDQ2ZQNqO6Od7jJuVEbb3DD+Kha?=
 =?us-ascii?q?CLl1oZoetbHi1wo84nJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ABvRqtQ3ntY+49AQLqVfVM03DqDUjs/2SAVo0qqs?=
 =?us-ascii?q?6gfavcnw3NiiWpgusa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,149,1779148800"; 
   d="scan'208";a="504469804"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Jul 2026 15:21:10 +0000
Received: from sjc-ads-8093.cisco.com (sjc-ads-8093.cisco.com [171.68.208.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 87C5C1800045E;
	Mon,  6 Jul 2026 15:21:10 +0000 (GMT)
Received: by sjc-ads-8093.cisco.com (Postfix, from userid 1839047)
	id 35B6ECBEF99; Mon,  6 Jul 2026 08:21:10 -0700 (PDT)
From: "Shubham Pushpkar -X (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)" <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [meta-OE] [wrynose] [PATCH 4/6] jq: Fix CVE-2026-43894
Date: Mon,  6 Jul 2026 08:20:18 -0700
Message-ID: <20260706152022.873284-4-spushpka@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260706152022.873284-1-spushpka@cisco.com>
References: <20260706152022.873284-1-spushpka@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8093.cisco.com [171.68.208.131];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.131, sjc-ads-8093.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 15:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128048

From: Shubham Pushpkar <spushpka@cisco.com>

The upstream fix [3] is for a newer jq codebase. Debian has already
backported this fix in jq 1.8.1-7. Use the Debian patch [1], which fixes
this CVE as tracked in Debian bug #1136445 [2].

[1] https://sources.debian.org/src/jq/1.8.1-7/debian/patches/CVE-2026-43894.patch
[2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1136445
[3] https://github.com/jqlang/jq/commit/9761ceb7d6cc48c16b25f0ab1baaef0e701927e4

Reference:
https://github.com/jqlang/jq/security/advisories/GHSA-5v7p-2r57-2g4g

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 .../jq/jq/CVE-2026-43894.patch                | 56 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch
new file mode 100644
index 0000000000..ea85c6b355
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch
@@ -0,0 +1,56 @@
+From 9761ceb7d6cc48c16b25f0ab1baaef0e701927e4 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Wed, 13 May 2026 19:41:49 +0900
+Subject: [PATCH] Reject numeric literals longer than DEC_MAX_DIGITS
+ (999999999)
+
+A signed-int overflow in decNumber's D2U macro lets huge literals write
+attacker-controlled bytes past a stack buffer. Cap the length before
+calling decNumberFromString, and pre-slice long strings in
+jv_dump_string_trunc so the resulting error message doesn't itself
+allocate a multi-GiB buffer. Fixes CVE-2026-43894.
+
+CVE: CVE-2026-43894
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/9761ceb7d6cc48c16b25f0ab1baaef0e701927e4]
+
+(cherry picked from commit 9761ceb7d6cc48c16b25f0ab1baaef0e701927e4)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ src/jv.c       | 5 ++++-
+ src/jv_print.c | 4 ++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index e4529a4..dd10b8b 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -574,7 +574,11 @@ static jvp_literal_number* jvp_literal_number_alloc(unsigned literal_length) {
+ }
+
+ static jv jvp_literal_number_new(const char * literal) {
+-  jvp_literal_number* n = jvp_literal_number_alloc(strlen(literal));
++  size_t len = strlen(literal);
++  if (len > DEC_MAX_DIGITS)
++    return JV_INVALID;
++
++  jvp_literal_number* n = jvp_literal_number_alloc(len);
+
+   decContext *ctx = DEC_CONTEXT();
+   decContextClearStatus(ctx, DEC_Conversion_syntax);
+diff --git a/src/jv_print.c b/src/jv_print.c
+index 791af17..c032d87 100644
+--- a/src/jv_print.c
++++ b/src/jv_print.c
+@@ -408,6 +408,10 @@ jv jv_dump_string(jv x, int flags) {
+ }
+
+ char *jv_dump_string_trunc(jv x, char *outbuf, size_t bufsize) {
++  if (jv_get_kind(x) == JV_KIND_STRING &&
++      (size_t)jv_string_length_bytes(jv_copy(x)) > bufsize) {
++    x = jv_string_slice(x, 0, bufsize);
++  }
+   x = jv_dump_string(x, 0);
+   const char *str = jv_string_value(x);
+   const size_t len = strlen(str);
+--
+2.44.4
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index d45d88951c..62de3a4117 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
            file://CVE-2026-40612.patch \
            file://CVE-2026-41256.patch \
            file://CVE-2026-41257.patch \
+           file://CVE-2026-43894.patch \
            "
 
 inherit autotools ptest
-- 
2.44.1


