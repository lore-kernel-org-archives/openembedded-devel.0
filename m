Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13026.1795503408540307490
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VnwijsAj;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4777; q=dns/txt;
  s=iport01; t=1795503408; x=1796713008;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p9bEZrUxMKrrhSUF95QJVYmz3z4pb8y1M2DVNtK7DX4=;
  b=VnwijsAj7UWbjRf/MOEbsJm7Pd/0ZGbUV8Wg84EqHYjqBrsyQhf2EiUj
   SGXH4wNZMbNGYWmJobVwFjjOtLceERQ183XszPxzmAgxX2kCPhCJVobxO
   Yci6FnyNvN9NduTxD0+nLOc+t1HsWKwhEYWv0m3j4UHEEX26NEpKIeJmH
   M1Z28ci02gGNm8CNiO54xwpf/IarJI957EC57eeHh2PyekXHijOdz51yf
   LUHAQnlxfh4X1/c/MPgeleCv+tba9aHwFvhehJLqDQTbOZENwZAiI/umO
   EvtdkZ9e3rk+rcen/Z572lSGxquqRjT72n6BjqseLqFCsHojIAKe81Auc
   w==;
X-CSE-ConnectionGUID: 3f1ftWqSTlG4592Urqj/8A==
X-CSE-MsgGUID: ev/U5T33RvuSTkuEOn04Zw==
X-IPAS-Result: =?us-ascii?q?A0BGAgBFNAVr/8pK/pBaglmCV3VhQkkDlkieLIF+DwEBA?=
 =?us-ascii?q?Q8uFg0EAQGEP0aOJAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQQmCwFGLAMBAlYEIyGDAgGCdAIBEborGzeBeTOBAYNuQ?=
 =?us-ascii?q?FDbMwELFAEFgTOFQogkXRgBhH0nGxuBcoEUAYNqgQWBXAEBgSdfhiAEgg0Vg?=
 =?us-ascii?q?QyBVBgGZIU6hlsCgU+ISUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBB?=
 =?us-ascii?q?xsGBYEcgR6BEoEDXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSC?=
 =?us-ascii?q?QETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CH?=
 =?us-ascii?q?xAGFiELGxgNSBEsNxUZBD5uB5QUgxpaCRgTASoBgSBLQQYLOqUqoREKKIN5j?=
 =?us-ascii?q?CSNPod8GjOqcguYfYkchG4WlSEyaIRqgWg8gVlwFYMiCUoZD445g2vOWyM1A?=
 =?us-ascii?q?gkDLwEBBwIHDgMLgWiQAAImB4FPAQE?=
IronPort-Data: A9a23:apHqw6MhSv9F0O3vrR3ylsFynXyQoLVcMsEvi/4bfWQNrUp30zwPx
 2YeXDiHO/mLZzDzKY0lb97l9h8P75LUndNjSXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gWUsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj665gVU8qApQjxuJYXTwfr
 8ECMTJKPjnW0opawJrjIgVtrs0uNozveYgYoHwllWifBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2I1BPjDS0Un1lM/AYkmlf2tj2PXeDxDo1XTrq0yi4TW5FEggeezboWIEjCMbchL2XvFm
 jmdxXrkOS0ZKfG4z2LZwG3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvOS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:cxBVk6sqPylWeTYOrwZBuLJU7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:Qp6YV2/u9rLicXy6Po6VvxUaQ845TWTm8HP/fxLpU1tzUb/SGXbFrQ==
X-Talos-MUID: 9a23:VaOaEQpmD7yhF7zIvXoezzx8c/o13//1Ml4QqqkFpuSjM3QsCSjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="59976675"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 06:56:44 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id 4002634407;
	Tue, 24 Nov 2026 06:56:44 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id CBA22CC1634; Mon, 23 Nov 2026 22:56:42 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [meta-oe][wrynose][PATCH 1/2] rsyslog: Fix CVE-2026-55556
Date: Mon, 23 Nov 2026 22:56:37 -0800
Message-Id: <20261124065638.3724216-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 06:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132932
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

Backport the maintainer-recommended correction for the imhttp
Basic Authentication buffer allocation. This protects builds that enable
the recipe's optional imhttp PACKAGECONFIG; it is disabled by default.

Keep rsyslog at 8.2512.0 and preserve the existing authentication API.

Upstream fix:
https://github.com/rsyslog/rsyslog/commit/acde2ba25ea33816694b787859f4a727a247b6d6
Stable-branch backport guidance:
https://www.openwall.com/lists/oss-security/2026/06/23/4

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsyslog/rsyslog/CVE-2026-55556.patch      | 72 +++++++++++++++++++
 .../rsyslog/rsyslog_8.2512.0.bb               |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-55556.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-55556.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-55556.patch
new file mode 100644
index 0000000000..a950d58a50
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-55556.patch
@@ -0,0 +1,72 @@
+From 8b9dbb6ddbc71fdbcd81e2b3b3d6f58dfde71adb Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Tue, 14 Apr 2026 07:55:43 +0000
+Subject: [PATCH] imhttp: add route-scoped API key authentication
+
+Why: Elastic Agent style HTTP ingestion needs a lighter auth mode
+than Basic auth, and imhttp also needs route-level flexibility for
+future endpoint-specific behavior.
+
+Impact: imhttp inputs, health checks, and metrics can now be run as
+no auth, Basic only, API key only, or Basic plus API key, with new
+shell and YAML regression coverage.
+
+Before/After: Basic auth was the only supported auth mode; imhttp
+now supports per-route API key auth and mixed auth selection.
+
+Technical Overview:
+Introduce a small route auth context so each registered CivetWeb
+handler can carry its own auth policy instead of relying on one
+module-wide Basic auth setting.
+
+Add apiKeyFile support for input endpoints plus matching
+healthCheckApiKeyFile and metricsApiKeyFile module settings.
+
+Accept API keys from Authorization: ApiKey and X-API-Key headers,
+with files parsed as one token per line while ignoring comments and
+blank lines.
+
+Trim leading whitespace for X-API-Key values and add an auth-header
+limits regression so oversized auth headers cannot silently bypass
+validation.
+
+Keep the implementation extensible for a larger route table so full
+Elasticsearch mock mode can build on the same registration path.
+
+Fix nearby imhttp defects worth addressing before further expansion,
+including safer auth parsing, better cleanup on partial failures,
+proper submit/flush error handling, and safer metadata string use.
+
+Document the new parameters and examples, and add focused shell and
+YAML tests for API-key and mixed-auth behavior.
+
+With the help of AI-Agents: Codex
+
+CVE: CVE-2026-55556
+Upstream-Status: Backport [https://github.com/rsyslog/rsyslog/commit/acde2ba25ea33816694b787859f4a727a247b6d6]
+
+Backport Changes:
+- Use the maintainer's one-line correction for the older Basic Auth
+  parser. The upstream commit replaces that parser as part of broader
+  route-scoped API-key authentication work.
+- Omit the API-key features, endpoint changes, documentation and test
+  changes belonging to that refactor. Preserve the existing auth API.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ contrib/imhttp/imhttp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/contrib/imhttp/imhttp.c b/contrib/imhttp/imhttp.c
+index 3b02e38..2d26fab 100644
+--- a/contrib/imhttp/imhttp.c
++++ b/contrib/imhttp/imhttp.c
+@@ -699,7 +699,7 @@ static int parse_auth_header(struct mg_connection *conn, struct auth_s *auth) {
+     size_t len = apr_base64_decode_len((const char *)src);
+     auth->pworkbuf = auth->workbuf;
+     if (len > sizeof(auth->workbuf)) {
+-        auth->pworkbuf = calloc(0, len);
++        auth->pworkbuf = calloc(1, len);
+         auth->workbuf_len = len;
+     }
+     len = apr_base64_decode(auth->pworkbuf, src);
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
index 5ab4a65e67..f132f4a764 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch \
            file://CVE-2026-19654.patch \
            file://CVE-2026-19654-regression.patch \
+           file://CVE-2026-55556.patch \
 "
 
 SRC_URI:append:libc-musl = " \
-- 
2.35.6

