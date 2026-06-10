Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9BBCD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 07:53:16 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14952.1781077994749485319
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2026 00:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Rhhf+yZm;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3457; q=dns/txt;
  s=iport01; t=1781077994; x=1782287594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gb7jnqnmvGlHYGWXpb3d5fArBc9Ve+7Zy28Io4Hdxi4=;
  b=Rhhf+yZmO8yLAUJ93tzNc9k+Q3HqMKaMxIK3M1y4GU5MH98WZqNf5TYP
   piUO47GBgXB8Uy0KDQ+BzrplqK2BAZ9mYgEtA1hnI89JlEUvsnq2OXvk/
   XDcN4BQYemtZdAqXGP8+N8Fc1yPYK0KzotYmWDp2T5j0FC2rO8Ci4o9YZ
   MFxTXn6nwOYVr0nNl6x8XtmPPSU6QhFRkDlhUff1EgcUMsdaCsPJwcW4L
   p/5aIYQj0wSsC9YnLNmyrP3QdGoxUy/xBBRBeZj63pQ403ewNgdFkTe+g
   SeyFsBKwmA8jCFxdlWrgKfL0Z2N9WBAAu9y68VUk6jk1HDkI+rX5rgbm8
   g==;
X-CSE-ConnectionGUID: GroeptnASvGd9CH08zYbRA==
X-CSE-MsgGUID: Pa5qx2PJS9ePBQeFYka9Ww==
X-IPAS-Result: =?us-ascii?q?A0AnAADbFilq/5D/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJA4xwiVgDnhuBfg8BAQEPRA0EAQGFBgKNOgImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAzIBGAEtEBwDAQIvKyMIG?=
 =?us-ascii?q?YMCAYJzAgERBrF+GjeCLIEBgygBPwJDUNsrAQsUAQWBMwGFPogeWxgBhHoCJ?=
 =?us-ascii?q?xsbgXKBFYNogQV3ZQICGIgLBIIiehKBXR6FYokSSIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4EMGwcFgUqBN2iBAoUQIx8DOYEVgXqBKGdpFTA1bAMLG?=
 =?us-ascii?q?A1IESw3FBsEPm4HjDoXD4I4exMBExiBUVuldqEPCiiDdIwhlToaM6prC5h8j?=
 =?us-ascii?q?gqWT4RogWg8gVlwFYMiCUoZD44qDguDYIUTwzYkNQIBAQcDLwEBBwIHDgMLg?=
 =?us-ascii?q?WiRfQEB?=
IronPort-Data: A9a23:AcSye659l6wFkSpL/qHaugxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 mMZXm+POP6CY2CjfNp1a9nn8kkBvp7Tn9JrTVE4rno8Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxNs/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eEpcf9/5rB0h16
 9MUeRstNkCRtuiM6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGc+FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkETUrsUIMpWcOOAnWHiaD1Aq1u9rqss6G+Vxwt0uFToGIaEIITQGJsNxi50o
 Er+9jngEksiFufOxAKvy3+Ct+zGzBzkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:88iwnqiHRljFUBcs1cn7oZjrhXBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: =?us-ascii?q?9a23=3Anzg752maGFb+VBzkV/ms5/g6s9fXOVLHy3rIP0m?=
 =?us-ascii?q?RMnhGROy+aQfA6pJuqeM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AS8Je2QzknnIc2Xug0qJ3OH3t9EmaqJynVVkdy60?=
 =?us-ascii?q?kgJiJDQZJNhmsjz3mfZByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,197,1774310400"; 
   d="scan'208";a="492025600"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jun 2026 07:53:13 +0000
Received: from sjc-ads-10443.cisco.com (sjc-ads-10443.cisco.com [171.70.96.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id A974918000481;
	Wed, 10 Jun 2026 07:53:13 +0000 (GMT)
Received: by sjc-ads-10443.cisco.com (Postfix, from userid 1839047)
	id 574A1CC1282; Wed, 10 Jun 2026 00:53:13 -0700 (PDT)
From: "Shubham Pushpkar -X (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)" <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [meta-OE] [scarthgap] [PATCH 2/5] jq: Fix CVE-2026-41256
Date: Wed, 10 Jun 2026 00:52:50 -0700
Message-Id: <20260610075253.1676404-2-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260610075253.1676404-1-spushpka@cisco.com>
References: <20260610075253.1676404-1-spushpka@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10443.cisco.com [171.70.96.196];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.96.196, sjc-ads-10443.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 07:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127510

From: Shubham Pushpkar <spushpka@cisco.com>

The upstream fix [3] is for a newer jq codebase. Debian has already
backported this fix in jq 1.8.1-6. Use the Debian patch [1], which fixes
this CVE as tracked in Debian bug #1136445 [2].

[1] https://sources.debian.org/src/jq/1.8.1-7/debian/patches/CVE-2026-41256.patch
[2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1136445
[3] https://github.com/jqlang/jq/commit/5a015deae35d19e3ebbc65db6c157a80e76df738

Reference:
https://github.com/jqlang/jq/security/advisories/GHSA-vf2h-chrj-q3fg

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 .../jq/jq/CVE-2026-41256.patch                | 54 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patch
new file mode 100644
index 0000000000..224bb103da
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patch
@@ -0,0 +1,54 @@
+From f4efca339cadef8ce7a5d5be98d0d2a8e0a77989 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Fri, 24 Apr 2026 22:15:08 +0900
+Subject: [PATCH] Fix NUL truncation in program files loaded with -f
+
+This fixes CVE-2026-41256.
+
+CVE: CVE-2026-41256
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/5a015deae35d19e3ebbc65db6c157a80e76df738]
+
+(cherry picked from commit 5a015deae35d19e3ebbc65db6c157a80e76df738)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ src/main.c   | 8 ++++++++
+ tests/shtest | 7 +++++++
+ 2 files changed, 15 insertions(+)
+
+diff --git a/src/main.c b/src/main.c
+index 43586c4..f462e4d 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -677,6 +677,14 @@ int main(int argc, char* argv[]) {
+       ret = JQ_ERROR_SYSTEM;
+       goto out;
+     }
++    int len = jv_string_length_bytes(jv_copy(data));
++    if ((size_t)len != strlen(jv_string_value(data))) {
++      fprintf(stderr, "jq: program file contains NUL bytes\n");
++      free(program_origin);
++      jv_free(data);
++      ret = JQ_ERROR_SYSTEM;
++      goto out;
++    }
+     jq_set_attr(jq, jv_string("PROGRAM_ORIGIN"), jq_realpath(jv_string(dirname(program_origin))));
+     ARGS = JV_OBJECT(jv_string("positional"), ARGS,
+                      jv_string("named"), jv_copy(program_arguments));
+diff --git a/tests/shtest b/tests/shtest
+index 0397ca0..505d45d 100755
+--- a/tests/shtest
++++ b/tests/shtest
+@@ -615,4 +615,11 @@ if printf '{}\x00{}' | $JQ >/dev/null 2> /dev/null; then
+   exit 1
+ fi
+
++# CVE-2026-41256: No NUL truncation in program files loaded with -f
++printf '.\x00invalid' > "$d/nul_prog.jq"
++if echo '42' | $JQ -f "$d/nul_prog.jq" >/dev/null 2>/dev/null; then
++  printf 'Error expected for program file with NUL bytes\n' 1>&2
++  exit 1
++fi
++
+ exit 0
+--
+2.44.4
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index b35e5579b2..c50ffc4cbe 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2026-33948.patch \
     file://CVE-2026-39979.patch \
     file://CVE-2026-40612.patch \
+    file://CVE-2026-41256.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 
-- 
2.35.6


