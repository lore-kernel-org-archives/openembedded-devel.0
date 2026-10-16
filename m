Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A6BCCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:21:02 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13830.1792120858226826201
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WgIfzpXN;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2189; q=dns/txt;
  s=iport01; t=1792120858; x=1793330458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z9ldcdWry9ahD51h1bDHzgZumiyf8SbsHDoo33U9Zkg=;
  b=WgIfzpXNQobRKl/Wj53LUSdQbrLiFunJuPXSGQFe+gETV6G8rps9GN6e
   osWH6xvbXPgbbgylLQPREhkLHKnldAx79a3RavWhAVQ/A+Wh12cI634A7
   V3yf1EpMMarP9dE6UNmuCnlNmRo48FAfDcGnczs8hzrCN/v2ZaiNtxzS/
   0GUdAOYiTLwOukzE9pBnso6cPe+LrOiTbAJHCYb7P/coY4ObV056GlV07
   JyvpCcWYXvgnWe4MmqKDqlP8gpump6+4I/ZvYYDCgIConQcN4Z4xFPIXQ
   OXdU5laPo85xeRstv9RxnwrqGHsUas4bZPaCREyayWB9Qi/m60zApWO2q
   g==;
X-CSE-ConnectionGUID: 0DZgIDSuS1eCHBnXN0UW7g==
X-CSE-MsgGUID: S+ANA0+0SNmGgATAHTvSng==
X-IPAS-Result: =?us-ascii?q?A0B2AwCRl9Fq/5X/Ja1aglmCV3VgQ0kDjVeIBGwDnhyBf?=
 =?us-ascii?q?g8BAQEPPRQEAQGFBQKOFQImNgcOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEwIBAzIBGAEtECAxKysZgwIBgnQDEQa8dIIsgQGDKQFDQ?=
 =?us-ascii?q?VDbMgELFAEFgTOFQIgjdQGEfCcbG4FygRWDaYEFgVwBAoIshXgEgiKBDIF4l?=
 =?us-ascii?q?SlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6g?=
 =?us-ascii?q?QlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4P?=
 =?us-ascii?q?AkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSEx6CZWEtASkBAQSCAaYco?=
 =?us-ascii?q?Q8KKIN2jCKVOhozqm8LmH2OCpZPhGmBbwgtgVlwFYMiCUoZD44vCguIc8lHJ?=
 =?us-ascii?q?zICDC8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:PLEbXK49Bikg1FPJYneYcwxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mYXDGmEOP+JZTT8fdh3aY+z9RwE6sSDz9FqGgNoqylmZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eZaEq9cdbOnx1r
 PEzCBoLXjbbut3pz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEeUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FbYGIK4zWFJ8F9qqej
 lmF1kLQWlJCD/qa5jWszluMuvH0myyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:yt/kEav3K6WMvqqHnRusGM0F7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:tapUyW8yJp5k8lFKe9KVvxY4KM8EXkbA9y7dCG+SD1ZPEICqFlDFrQ==
X-Talos-MUID: 9a23:7QVWVwYffDCp++BTjHzFohg6d59TxaGBB2kxuLU6pfKCOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535984928"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:20:57 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 4023518000301;
	Fri, 16 Oct 2026 03:20:57 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 97D1ACBEF6B; Thu, 15 Oct 2026 20:20:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 10/11] nginx: Ignore CVE-2026-40460
Date: Thu, 15 Oct 2026 20:20:55 -0700
Message-Id: <20261016032056.409095-11-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016032056.409095-1-hthakar@cisco.com>
References: <20261016032056.409095-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 03:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131029

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- CVE-2026-40460 affects nginx only when the HTTP/3
  QUIC module is enabled [1].
- The module requires the explicit --with-http_v3_module configure
  option, which neither Wrynose nginx recipe enables by default [2].
- Mark the CVE not applicable only when that option is absent; report it
  as unpatched when a bbappend enables the module.

Reference:
[1] https://nginx.org/en/security_advisories.html
[2] https://nginx.org/en/docs/configure.html

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb | 1 +
 meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 56050b84eb..ca8e7129fb 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -23,3 +23,4 @@ SRC_URI[sha256sum] = "2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee
 
 CVE_STATUS[CVE-2025-53859] = "cpe-stable-backport: Fix is included in 1.28.1"
 CVE_STATUS[CVE-2026-1642] = "fixed-version: fixed since v1.28.2"
+CVE_STATUS[CVE-2026-40460] = "${@ 'unpatched' if '--with-http_v3_module' in ((d.getVar('EXTRA_OECONF') or '').split() + (d.getVar('PACKAGECONFIG_CONFARGS') or '').split()) else 'not-applicable-config: ngx_http_v3_module is not enabled'}"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index 68015a12fa..2aae2091a0 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -25,3 +25,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
 SRC_URI[sha256sum] = "673f8fb8c0961c44fbd9410d6161831453609b44063d3f2948253fc2b5692139"
 
+CVE_STATUS[CVE-2026-40460] = "${@ 'unpatched' if '--with-http_v3_module' in ((d.getVar('EXTRA_OECONF') or '').split() + (d.getVar('PACKAGECONFIG_CONFARGS') or '').split()) else 'not-applicable-config: ngx_http_v3_module is not enabled'}"
-- 
2.35.6


