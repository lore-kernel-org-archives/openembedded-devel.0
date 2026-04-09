Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DF5E9DE47
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:09:42 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126696.1775718575370080357
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P75UR4xK;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82cf636dac8so317522b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718574; x=1776323374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRkWk/2Hh+OCHZGnd+wQVaRKZXNjQt5krRcnC1pon0M=;
        b=P75UR4xKLgxw+ZET1rcBHxEf/+caMlKm4/08hbkbtrKXzt7CqXXaJ2R7MIxrhSbNJN
         mRCw3seOmdMJkZfopZmPBDxwTAwBgTNgWbLbhhqGg0A1ocIjbfYsIsdWzm2dSAcxiIOC
         KWa4JxVci6TSbMw+bByg0T6+zZabn67xFXz3QSu8RhYYc/SrehRp38Gt0F4sAO92e7vG
         nRFam2kRRBud6HsIT0P2sowW7esNt95mc3iRyayFqpjz9/rYYrAtc0T5kDHOy3etnoWP
         qbdsf7r36sw42Ce7cc6aXvPSQJLJ6gqjXwt+tR/04yqnNYYj/GecZL8VN0ylJn4rsemD
         Jpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718574; x=1776323374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aRkWk/2Hh+OCHZGnd+wQVaRKZXNjQt5krRcnC1pon0M=;
        b=VLDCuzNft1Z8Ar9/3ArYLS5QZWAuztAHlu5zWFmUH4kEO001E6M6HijeiyNPrOCVTb
         oB9d4JjUVR4RetAF12TD/LssjsWxk7iZTx6NCyUjgtp2Oc/AONYPcVYpN/m1wReTSZkx
         SL7iIFJ4+MOQgw7l9pb9Ayr/nF60vNo8qgG0iL8KfnmmnCbnhD7F9hMdHq/+5JQOQxni
         niHtxeSiLiaf0Up0F6GX4+Fc36C/ndI7GdNDACDFTBsCK60w5WKKfkeqTi7AjO2uNPYq
         sXI606qQ+Lj4zMziJgkrDZyQc1Yd1Go6cnA7kCfMWOOI3O6nRooh5vExUb/JFcLfLcVl
         7nMw==
X-Gm-Message-State: AOJu0YziFaPLBuMLQIjiD6GXwdL0zN7fj/LLrmYjxdqGlePAdN34PaHn
	iBwHf5EJyKdX/i8hzaAU2gbo1XRl7LENe3hal9qswOROoJu92/3HLd+tl83zJw==
X-Gm-Gg: AeBDieufWQRuaii6m9Gb/zsUN5CUlTT+Gd1Xr+FF1Lk4JdTujv7ie2/wjjzU3nAQXoJ
	QUdbNNYDtZ69imCMiW0YukeYOKA0vJhgECAyKk0pbOBa5MZdnPFey3Nu+0nFlPebnWBoZfv/9l2
	egsWgwy6/lK9gfKR3PgNxrLXxP04BG6joazHCxo/QaFcKglEyQcNmANTIMbQk5OtQYoLVes6p0r
	PdVI5Y9Y4Oxog2rIPFMbAOf9d7htpD1VasYdLhiUQMr82SfPq2BlqTj2B8nk3S/+PxOzuHlqhFA
	mvcU++o8vAMlIAvvnb/ZGcyeqOqy+8z26yHci00QG5I6sMWr0nUKkDTFTKEvxiiGnsCtHmQp7X6
	kgyJbNuWfPqJIKxGtNkk5U3/CNZz/Vo/qwJrn/oFAMbGurRspGXLVeDpBYoRFnW8yVswrPJpFx3
	/P6g6+0hUjkFOdEecda80x6mqpOAy1dhALCh8=
X-Received: by 2002:a05:6a00:2d86:b0:82c:e775:d430 with SMTP id d2e1a72fcca58-82dd8a9203cmr2500679b3a.28.1775718574430;
        Thu, 09 Apr 2026 00:09:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:09:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/22] freerdp3: fix CVE-2026-33952
Date: Thu,  9 Apr 2026 19:09:00 +1200
Message-ID: <20260409070919.3968586-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126125

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-33952

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-33952.patch     | 38 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-33952.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-33952.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-33952.patch
new file mode 100644
index 0000000000..925843f6b5
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-33952.patch
@@ -0,0 +1,38 @@
+From 30e05bdaf4096decf4ce0b1c448cd03c6786323b Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Wed, 25 Mar 2026 09:04:43 +0100
+Subject: [PATCH] [core,gateway] Check rpcconn_common_hdr_t::auth_length is
+ valid
+
+Do sanity checks for rpcconn_common_hdr_t::auth_length read from
+network, abort if the value is out of range.
+
+(cherry picked from commit 4ac0b6467d371a1ad47c1f751c5b305e4c068adb)
+
+CVE: CVE-2026-33952
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/4ac0b6467d371a1ad47c1f751c5b305e4c068adb]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/core/gateway/rts.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/libfreerdp/core/gateway/rts.c b/libfreerdp/core/gateway/rts.c
+index 2ba757815..9702582da 100644
+--- a/libfreerdp/core/gateway/rts.c
++++ b/libfreerdp/core/gateway/rts.c
+@@ -253,6 +253,15 @@ BOOL rts_read_common_pdu_header(wStream* s, rpcconn_common_hdr_t* header, BOOL i
+ 			          header->frag_length, sizeof(rpcconn_common_hdr_t));
+ 		return FALSE;
+ 	}
++	if (header->auth_length > header->frag_length - 8ull)
++	{
++		if (!ignoreErrors)
++			WLog_WARN(TAG,
++			          "Invalid header->auth_length(%" PRIu16 ") > header->frag_length(%" PRIu16
++			          ") - 8ull",
++			          header->frag_length, header->auth_length);
++		return FALSE;
++	}
+ 
+ 	if (!ignoreErrors)
+ 	{
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index f9e6f64e2f..18795551ec 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2024-32662.patch \
            file://CVE-2025-4478.patch \
            file://CVE-2026-25941.patch \
+           file://CVE-2026-33952.patch \
            "
 
 S = "${WORKDIR}/git"

