Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B80C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 09:39:47 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18888.1784626784725967895
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 02:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KsixpIRR;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2569; q=dns/txt;
  s=iport01; t=1784626784; x=1785836384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Qz1Mxh10ACApnDfv9cF6NUv/QKuFoSpTmkuY1ZT+Zk=;
  b=KsixpIRRpFxTYxwBv10Zi24z7oCc0VX4wKa3cBFVlR4nwnWmv6Ij/S1t
   RSTUK9BNc/5u7qrk3xYMliB7i3rMPbTrfyas/pN4tBmL9rWwQucW9B0uZ
   O1YcHhlv571X9MQi2bFxuf3gdT9/PWXPEq7hxyT0ru0OhgX690Z6l/Sys
   w8qybSMUlo38/22Hu3iHgSIniiqiSKt3/Rq2ZFNxuh6yFBIdRCuN2VwLo
   edRTiU/nm0fqW1PvMtKoHSlMckgMSmDLp3oqT9vMVU/pmdUA5/Du5MMD/
   Qy6eAfu7iu/Gd4vNQchTfeMD4kPeN428R/w+RD0iGk8mHKJY9YqsWjJn4
   A==;
X-CSE-ConnectionGUID: BGIGxmFMQy2YCv9KT30vsg==
X-CSE-MsgGUID: S3VCqIL7Q0OD0zz1QADicQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgD7PV9q/4//Ja1aglmCV3ReQ0kDlkcDgROdCIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo1XAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDMgEYAS0QHAMBAi8rIwgZgwIBgnQDEb4uGjeCLIEBg?=
 =?us-ascii?q?ygBgVTbLgELFAEFgTOFP4ggXBgBhHwnGxuBcoEVgnN2gQWBXAKBOHWFeASCI?=
 =?us-ascii?q?noSgVoehG+LHkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdg?=
 =?us-ascii?q?S6BAoRuIx8DOX+BL3VKdy1pARIXgSaCFIE6Ak4DCxgNSBEsNxQZBD5uB41QI?=
 =?us-ascii?q?4JAgQ4BKxeCFaV2oQ8KKIN1jCGVOhozqmwLmH2OCpZQhGmBaDyBWXAVgyIJS?=
 =?us-ascii?q?hkPjjiDa85aJzICCQMvAQEHAgcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:t/hMG6AVbKOyYBVW/3niw5YqxClBgxIJ4kV8jS/XYbTApGx20mZWm
 zAcCmvXPfbcNDPweYt3PIWxpkxSu8eEyNRiOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD/gmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE6dpPI1EzE6gh67xGKn8f1
 sBDcC4WYUXW7w626OrTpuhEnM8vKozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY0BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FEoi+azb4aPJrRmQ+1uxXizv
 0PioF2hJT1CJs7G8BOp83mV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:/UlPy6EQddMOPGhupLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3A4cRLYmi9kyl82V08z+pkPrpgxDJuWFL842fVDWq?=
 =?us-ascii?q?BGDxYY6PEamPLoL1/nJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AeSyI5Qx7Kh8T6MbySorRLNtVLzOaqJ/1NmsUsLF?=
 =?us-ascii?q?ZgpGjGXRiKW6kpRi2SbZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,176,1779148800"; 
   d="scan'208";a="513667424"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 09:39:42 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 01BA7180003B5;
	Tue, 21 Jul 2026 09:39:42 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 9DA2DCAB20D; Tue, 21 Jul 2026 02:39:41 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [meta-OE][scarthgap][PATCH 3/4] jq: Fix CVE-2026-49839
Date: Tue, 21 Jul 2026 02:39:37 -0700
Message-Id: <20260721093938.3983571-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260721093938.3983571-1-dkelaiya@cisco.com>
References: <20260721093938.3983571-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 09:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128349

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://github.com/jqlang/jq/commit/e987df0d463d85fd70825e042a082427e8275b86
[2] https://github.com/jqlang/jq/security/advisories/GHSA-cfh2-vwfq-qfmm

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../jq/jq/CVE-2026-49839.patch                | 37 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch
new file mode 100644
index 0000000000..bd40828373
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch
@@ -0,0 +1,37 @@
+From 851544d2a13cf8baca1824196ac15cfe81d63224 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 8 Jun 2026 22:14:48 +0900
+Subject: [PATCH] Fix heap-buffer-overflow in raw file loading
+
+When `jv_string_append_buf` overflows the string length limit,
+it returns an invalid `jv`; `jv_load_file` then re-entered it
+on the invalid value and overran the heap. Break out of the loop
+once the value is invalid.
+
+Fixes CVE-2026-49839.
+
+CVE: CVE-2026-49839
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/e987df0d463d85fd70825e042a082427e8275b86]
+
+(cherry picked from commit e987df0d463d85fd70825e042a082427e8275b86)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/jv_file.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/jv_file.c b/src/jv_file.c
+index b10bcc0..40137c3 100644
+--- a/src/jv_file.c
++++ b/src/jv_file.c
+@@ -57,6 +57,8 @@ jv jv_load_file(const char* filename, int raw) {
+ 
+     if (raw) {
+       data = jv_string_append_buf(data, buf, n);
++      if (!jv_is_valid(data))
++        break;
+     } else {
+       jv_parser_set_buf(parser, buf, n, !feof(file));
+       jv value;
+-- 
+2.44.4
+
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index f13548ddd3..56ac5b2032 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2026-43896.patch \
     file://CVE-2026-43895.patch \
     file://CVE-2026-47770.patch \
+    file://CVE-2026-49839.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 
-- 
2.35.6


