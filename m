Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C560EC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 15:21:00 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153650.1783351259219945479
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 08:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OXOp7Gv9;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3400; q=dns/txt;
  s=iport01; t=1783351259; x=1784560859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C4d94ttkm1WOvSglxGr8R6niloeGkV3dzqOQAWbYUCc=;
  b=OXOp7Gv9dHBZl6XeivLOl3QW5mzGY9DzrE8/Q7MgFKMdYdIPYSGdgZOg
   0RhaWRu5EKX6iUqR9dRST47JFm7BYrwCpIhSh2hHztRsDsN3auuSylmlz
   pFh1PtlXYmYP6aSNWoTWsekJowAhKof6/2mDln+zqmKtjcnPE6Tn9gxZM
   xy3pxSh5F8aTISeHB/X22dpL9OiDtuzKnJd8fcJ/yZakWRo3C+x37NiDE
   v5ZdwkSWPK/XsV5trQpJrmOeJlmHm0/reXS+gC3yXSdDX2YfHecfEpxHE
   mSZ7w20fLQQ9mTNW+N0ADH2TYEDh7gJc7uLlgO1wzKY2UjFD82ePJdr+s
   w==;
X-CSE-ConnectionGUID: yc++i7jmTdiP3IPqfNe5ag==
X-CSE-MsgGUID: REf6WSFdTWiiGjck3vyjLQ==
X-IPAS-Result: =?us-ascii?q?A0AaAADSxktq/4v/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJA4xwiVgDnhuBfg8BAQEPRA0EAQGFBgKNTQImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAzIBGAEtEBwDA?=
 =?us-ascii?q?QIvKyMIGYMCAYJzAgERBrlXgiyBAYMoAT8CQ1DbLAELFAEFgTMBhT6IH1sYA?=
 =?us-ascii?q?YR6AicbG4FygRWDaYEFd2UCAhiICwSCIoEMgVoejydIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQwbBwWBHYFrgQKEeSMfAzl/gTB1SnktgQIBEh4Kg?=
 =?us-ascii?q?VKBKQMLGA1IESw3FBsEPm4HjHsXD4I9exMBExiBUVuldqEPCiiDdYwhlToaM?=
 =?us-ascii?q?4VbpRELmH2LN4JTllCEaIFoPIFZcBWDIglKGQ+OKg4Lg2CFE8lHJDUCAQEHA?=
 =?us-ascii?q?y8BAQcCBw4DC4FokX0BAQ?=
IronPort-Data: A9a23:ZceBRq4gN0BtfWkQr1OXJQxRtGvGchMFZxGqfqrLsTDasY5as4F+v
 mEWUGHUM/3eZWXzfosiO4rnpkMHsceGnNZjHANo/io1Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1MtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eLIZbuecoA2Ry+
 f0gcxE1dx6lir+/z+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYeUrsUIMpWcOOAnWHiaD1Aq1u9rqss6G+Vxwt0uFToGIeNJ4fbHp8Nwy50o
 Er80mqnPSo0OOCgyDuq8Hmv3fHenwfCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/N8Vte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:LZKF8KE9zF3J10qgpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHPxOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:wj79+GBNB05XE9H6Ezhstw0VRcIgTnHc9CzxG1a2L2s0QbLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3APNwWaw5NGnDHnlDxoQFXd5GPxoxSzqrwN3sjnak?=
 =?us-ascii?q?5usirNydzYCmMjhCOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,149,1779148800"; 
   d="scan'208";a="505393205"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Jul 2026 15:20:57 +0000
Received: from sjc-ads-8093.cisco.com (sjc-ads-8093.cisco.com [171.68.208.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 57A3B180007D4;
	Mon,  6 Jul 2026 15:20:57 +0000 (GMT)
Received: by sjc-ads-8093.cisco.com (Postfix, from userid 1839047)
	id 03959CBEF99; Mon,  6 Jul 2026 08:20:57 -0700 (PDT)
From: "Shubham Pushpkar -X (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)" <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [meta-OE] [wrynose] [PATCH 2/6] jq: Fix CVE-2026-41256
Date: Mon,  6 Jul 2026 08:20:16 -0700
Message-ID: <20260706152022.873284-2-spushpka@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260706152022.873284-1-spushpka@cisco.com>
References: <20260706152022.873284-1-spushpka@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8093.cisco.com [171.68.208.131];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.131, sjc-ads-8093.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 15:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128046

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
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
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
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 9f0fcf8cb5..3e83464f0b 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
            file://CVE-2026-39979.patch \
            file://CVE-2026-47770.patch \
            file://CVE-2026-40612.patch \
+           file://CVE-2026-41256.patch \
            "
 
 inherit autotools ptest
-- 
2.44.1


