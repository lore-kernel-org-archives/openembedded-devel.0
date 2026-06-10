Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A55CD98C8
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 07:53:36 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15158.1781078007473404577
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2026 00:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QLnSjctZ;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3553; q=dns/txt;
  s=iport01; t=1781078007; x=1782287607;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CRiLtHwzvroeaNZofHLaiI8ICE8ZD1PrGsyWe6NhNg0=;
  b=QLnSjctZK9ILhw+3jm4mSllnrlDfOj+vUq0okUMUqo/RZA/QmxteOdpF
   WN/9n1UERqBSFFRaHUHZK27xZ0eAAnwQW0PngJShaA1KSUvC9DPF9uSXW
   OC6qde5mTso/eOLP5TQFsQVC8mCFoQnb+z3H4jaNVALw7dPKLFwXrhMXL
   Ie3S4Bo2uWJ5N3QuEFFZ33SlaMOZqnkcYgZouG1QMcQPG2GNS/Hwsrh/J
   hzZpQyg5XUHq4+e89IgyD8i0KLddZ3OYgcYEyGS+d5j/6ICzlmNRO7F3L
   QIvjOZSwvWO2oCQEBOrcerlWmWierMfd3c6D5Ev0NilF7RgoQfh7RiQWf
   g==;
X-CSE-ConnectionGUID: yqzcvGTcSxKiQTpL8/8ByQ==
X-CSE-MsgGUID: HWDTMDfLQj+05dtaScdLHQ==
X-IPAS-Result: =?us-ascii?q?A0AaAADbFilq/4r/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJA4xwiVgDnhuBfg8BAQEPRA0EAQGFBgKNOgImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLARgBLRAcA?=
 =?us-ascii?q?wECLysjCBmDAgGCcwIBEQaxfho3gXkzgQGDKAE/AkNQ2ysBCxQBBYEzAYU+i?=
 =?us-ascii?q?B5bGAGEegInGxuBcoEVg2iBBXdlAgIYgQ2GfgSCInoSgV0ehWKJEkiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYFKgTdogQKFECMfAzmBFYF6g?=
 =?us-ascii?q?ShnaRUwNWwDCxgNSBEsNxQbBD5uB4w6Fw+COHsTASuCLE6lKKEPCiiDdIwhl?=
 =?us-ascii?q?ToaM6prC5h8jgqWT4RogWg8gVlwFYMiCUoZD44qDguDYIUTwzYkNQIBAQcDL?=
 =?us-ascii?q?wEBBwIHDgMLgWiQAIF9AQE?=
IronPort-Data: A9a23:ANoGN63GvOIt5AsLAvbD5YNwkn2cJEfYwER7XKvMYLTBsI5bpzNRy
 mIcC2iEa6mDMWv9KN1zb4Ti9htU6sPRy9djSVRv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 bsen+WFYAX7g2AtajpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGHVgkNpM3xu1MEUJPz
 MAADGBKPjqSvrfjqF67YrEEasULNsLnOsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNU+QC/FMEg9/5JYWh/+1nXnncDRwo1OOrq1x6G/WpOB0+OSyYIOPIYHWHa25mG64m
 U762kj3JigYd4TCxSaMyXmgos/2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:TLQBGKyRq6LrKVFE7QR8KrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3AutBuXmpjCB1EjL8d7lRpnWTmUdE8YHbD40vbGF+?=
 =?us-ascii?q?bCF9VUJnFDg+66Zoxxg=3D=3D?=
X-Talos-MUID: 9a23:ilpk2AtgR49w2w1vbM2npA5OCOJE7YCXCgNVzJkasvKPOQhQAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,197,1774310400"; 
   d="scan'208";a="478123540"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jun 2026 07:53:26 +0000
Received: from sjc-ads-10443.cisco.com (sjc-ads-10443.cisco.com [171.70.96.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 77818180001EA;
	Wed, 10 Jun 2026 07:53:26 +0000 (GMT)
Received: by sjc-ads-10443.cisco.com (Postfix, from userid 1839047)
	id 23FCECC1282; Wed, 10 Jun 2026 00:53:26 -0700 (PDT)
From: "Shubham Pushpkar -X (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)" <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [meta-OE] [scarthgap] [PATCH 4/5] jq: Fix CVE-2026-43894
Date: Wed, 10 Jun 2026 00:52:52 -0700
Message-Id: <20260610075253.1676404-4-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260610075253.1676404-1-spushpka@cisco.com>
References: <20260610075253.1676404-1-spushpka@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10443.cisco.com [171.70.96.196];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.96.196, sjc-ads-10443.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 07:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127512

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
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch
new file mode 100644
index 0000000000..0549128b7b
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
+index 34573b8..26ccfc0 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -579,8 +579,11 @@
+ }
+
+ static jv jvp_literal_number_new(const char * literal) {
++  size_t len = strlen(literal);
++  if (len > DEC_MAX_DIGITS)
++    return JV_INVALID;
+
+-  jvp_literal_number * n = jvp_literal_number_alloc(strlen(literal));
++  jvp_literal_number * n = jvp_literal_number_alloc(len);
+
+   n->refcnt = JV_REFCNT_INIT;
+   n->literal_data = NULL;
+diff --git a/src/jv_print.c b/src/jv_print.c
+index 7f1e312..25540c5 100644
+--- a/src/jv_print.c
++++ b/src/jv_print.c
+@@ -387,6 +387,10 @@
+ }
+
+ char *jv_dump_string_trunc(jv x, char *outbuf, size_t bufsize) {
++  if (jv_get_kind(x) == JV_KIND_STRING &&
++      (size_t)jv_string_length_bytes(jv_copy(x)) > bufsize) {
++    x = jv_string_slice(x, 0, bufsize);
++  }
+   x = jv_dump_string(x,0);
+   const char* p = jv_string_value(x);
+   const size_t len = strlen(p);
+--
+2.44.4
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 917196d7b5..54fa9f096d 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2026-40612.patch \
     file://CVE-2026-41256.patch \
     file://CVE-2026-41257.patch \
+    file://CVE-2026-43894.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 
-- 
2.35.6


