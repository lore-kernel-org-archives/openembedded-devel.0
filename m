Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72E2CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:23:35 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15655.1792131805770128006
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JIP2geq4;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3235; q=dns/txt;
  s=iport01; t=1792131806; x=1793341406;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=tO1f+xHa1fuEwoP9Oygl8+Md9ooZscO5yhBMfOexx8U=;
  b=JIP2geq4GScupT8vbqpj/KvxC3h0GNsQ3930YQqWfKp5uWIE8wv/2jP8
   Fkk+N5v2RrTYE7FzUwvZba2ivsl42OArT+BuDiY34Qt6Kr7WS7cdSSeT8
   byDViW7FDkB7nEoGtGFoTRpBYSRx26T38uIrqMC6hqWhcD8Y80U6jpx/x
   /VncGn739ecV0qcHlC/BME9SrwppBDlbuT15bg73gCOVqX4UvnKcuzB0x
   0xYr3lh++v/ALBB2Pq8QZToRw4pGKNL5sT3kslG9q3dN+vjpoKLypFmvC
   EorckLQZKY78fh40lNRDyxnZYnPLwqMjsaHNYrnLjWNHyX7t6HE3visK9
   w==;
X-CSE-ConnectionGUID: +XjLbfKmShqlY6FI9ub1pA==
X-CSE-MsgGUID: HONV5rjZRImsdmjTnpCU5Q==
X-IPAS-Result: =?us-ascii?q?A0BJAgBRwtFq/5T/Ja1aglmCV3VgQ0kDlCaCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCdAMRvHSBeTOBA?=
 =?us-ascii?q?YMpAYFU2UqBaAELFAGBOIVAiCNdGAGEfCcbgUlEgRWBO4IugQWBXAKIJQSDH?=
 =?us-ascii?q?BKBWpVHSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWI?=
 =?us-ascii?q?xk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALg?=
 =?us-ascii?q?Rs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6CZYEOASsFehKBG?=
 =?us-ascii?q?x6lV6EPhCiMIpU6GjOFW6UUC5h9izeCU5ZPhGmBaDyBWTMaCBsVgyIJShkPj?=
 =?us-ascii?q?jmDa4VkyHYnMgIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:CG7PD6qAxKaJUBaFE6jP4wIpTQheBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnVPqmNYGr0coska9zkoR8EuJ7VyoNhHgporXs8QS8QpOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0qVHA0VE+
 98dEzAUaiHdqcPn3bjiUsA506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7WyxFsluZqII84nPYy0p6172F3N/9J4fUH5kPwxjGz
 o7A10TeJC9HLt6t8xuA6X6phNPJhQjGBbtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:40N0oqrF9BoxqxhbWIDi/CQaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:18l27GyvCdQAAw3MD/QZBgVXKsIBeHP+yUzQOkuJV0hIGaCfEEe5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AcfEFrA1vX8aXf7ufZqfjcggyODUjw4OINh0Xk6c?=
 =?us-ascii?q?8msyfOSlyBzGFpwnqe9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536242566"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:23:25 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 2F0F1180002E6
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:25 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 85EC4CBEF98; Thu, 15 Oct 2026 23:23:24 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 7/9] python3-pillow: Fix CVE-2026-59203
Date: Thu, 15 Oct 2026 23:23:21 -0700
Message-Id: <20261016062323.251925-8-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016062323.251925-1-yurade@cisco.com>
References: <20261016062323.251925-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131064

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/python-pillow/Pillow/commit/03992618118b4a76b6163cd72ab5ecd684133b83
[2] https://github.com/python-pillow/Pillow/security/advisories/GHSA-pg7v-jwj7-p798

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-pillow/CVE-2026-59203.patch       | 45 +++++++++++++++++++
 .../python/python3-pillow_12.2.0.bb           |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59203.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59203.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59203.patch
new file mode 100644
index 0000000000..73dad2b301
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59203.patch
@@ -0,0 +1,45 @@
+From 157289420e2b730688452c58a95a89974b25538d Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Tue, 23 Jun 2026 09:20:48 +1000
+Subject: [PATCH] Raise ValueError if EPS BeginBinary bytecount is negative
+ (#9708)
+
+CVE: CVE-2026-59203
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/03992618118b4a76b6163cd72ab5ecd684133b83]
+
+(cherry picked from commit 03992618118b4a76b6163cd72ab5ecd684133b83)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ Tests/test_file_eps.py    | 4 ++++
+ src/PIL/EpsImagePlugin.py | 3 +++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/Tests/test_file_eps.py b/Tests/test_file_eps.py
+index d4e8db4f4..d1886e9e2 100644
+--- a/Tests/test_file_eps.py
++++ b/Tests/test_file_eps.py
+@@ -204,6 +204,10 @@ def test_begin_binary() -> None:
+     with Image.open(io.BytesIO(data)) as img:
+         assert img.size == (399, 480)
+ 
++    data[76867:76873] = b"    -1"
++    with pytest.raises(ValueError, match="BeginBinary bytecount cannot be negative"):
++        Image.open(io.BytesIO(data))
++
+ 
+ @mark_if_feature_version(
+     pytest.mark.valgrind_known_error, "libjpeg_turbo", "2.0", reason="Known Failing"
+diff --git a/src/PIL/EpsImagePlugin.py b/src/PIL/EpsImagePlugin.py
+index aeb7b0c93..363ba19e1 100644
+--- a/src/PIL/EpsImagePlugin.py
++++ b/src/PIL/EpsImagePlugin.py
+@@ -357,6 +357,9 @@ class EpsImageFile(ImageFile.ImageFile):
+                 trailer_reached = True
+             elif bytes_mv[:14] == b"%%BeginBinary:":
+                 bytecount = int(byte_arr[14:bytes_read])
++                if bytecount < 0:
++                    msg = "BeginBinary bytecount cannot be negative"
++                    raise ValueError(msg)
+                 self.fp.seek(bytecount, os.SEEK_CUR)
+             bytes_read = 0
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
index 3a2efbf851..c9926ba076 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;
            file://CVE-2026-59198.patch \
            file://CVE-2026-59199.patch \
            file://CVE-2026-59200.patch \
+           file://CVE-2026-59203.patch \
            "
 SRCREV = "3c41c095064200a02672d89cc5ff629eaf4b0d4f"
 
-- 
2.35.6


