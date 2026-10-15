Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EFACC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:18 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33249.1792043049693237171
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AIhi9pBf;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e49fbf92aaso28796945ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043049; x=1792647849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3762WRPqgngK/ANfyMw/SS794fYDwkr0TqWj8F75NyM=;
        b=AIhi9pBf5g1Y86AFeXotg+ItrXL+BTvdDcdAiB9nAkzIiedYka58JOWzVYxfzKZbB4
         hdtqzyynB2KlFgC1fsdkcOr9DT/G45b97eeOkZ1jZF7+8+3VfXN1m08BfKmtuLDy324n
         GxN9n63XF+5/3oimdnZ0yz3MbnXIzHeJTzyH++3jg/QMOMfQe6mFWzDOFdSi/g1BA6FV
         Kiaz+N0cERNXLsQWhQYkXKsO8fNBQPk2vVRSvSf+Mt1eVhHuS91czEoOEOrGKPJv8b8d
         O+K8Oz613LfP+AOM+13YUQez45RYKs1lNvKKVjZf4/IiZB7yZgihqnMgPWboH0BzzOvr
         YEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043049; x=1792647849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3762WRPqgngK/ANfyMw/SS794fYDwkr0TqWj8F75NyM=;
        b=SlKi/itc5on77sg3KbQ0/G2CXBEU3Fe/c9UC+FlFbuLVOkn1TDp02vgewfCilMEDBR
         5LVLxMkecAUFxJQ6fR+ugQ+4GGH/tu/rzekd3hcqIhJiCvTdAf4vsBAnYrJ9noOSbHq0
         8U5e5OX20DdTBkIOMMjWblbwS/FdcgQPtwEJyXW5pwM20BKUL4WRKAzuOj/59LoahiOy
         xMYMzRUTR+jafkxbtKFM30oL3xi/7eem+py64XJNlww7SC73O9WXq5s3n8QLyarWCBVv
         yROKojLEXvUxBpl08k1gEmMIHhvxAS8Gs2sYH2LFvyF7J7hQrA4ynYB59m+oqS4cYpI5
         UxqA==
X-Gm-Message-State: AFq9FYI53+ZFbE6IMzckMxSBNdbt7oStA5gpT4Fzgt5W1647dNgTd7Og
	XHD13q7pW671oXPFGPuPrUSdJr6vtz5zlVt+ipdtU/sqdhlaX9VMzhSBFOlgdw==
X-Gm-Gg: AYBFou3/9pqg7hM1PeLxeHmt7cuO9A44V2AmGkW263RAPcH86Tv0wpIoje0TGpuPB6y
	DaBmuWINJLDaigP+h8XjRaktuYEwTPJtHgrEc22uDZ34soz4wi31252Ic7SxwTYwWf++1QYrCLK
	DNvgVA97+DECJqrlM5depbUd57Q97gq3dPiOMm8vev+HkSBcUwCQTQ49yVL2r/HiRNxrKGFCO3H
	hgrkoADb/vjoSQhJpRYhQ92oy6yADJrkJlDzXfR8yJ0t1Pl7ms3+MMoo0T/suGLb9WwfaLwocCW
	8twA1Mv/eA8va8BqZhE02VeVlRsxQRJrFIatzBPYaO+Tih+eWIpM7+qN99MXqLY0ArZdi0tLkLQ
	kWDyUEIABpausTRcQX9hMsSgxC6SrscwPhCUAtD3vEhXGsDXjiGKfhLCjvBQKpStUC1dPxCHm9e
	5yICSqKP3CUDYLEo/DKLnf0oJkz5mbftvDYRL/M7/B2wmpKLiqozpjrOKsG5Xmnx0Qo8jAv3ymV
	PsnZOo9js0WWJy2kZZuEyV09QbnVFoh2A==
X-Received: by 2002:a17:902:d549:b0:2e9:6788:937e with SMTP id d9443c01a7336-2e96788968cmr1081775ad.42.1792043048932;
        Wed, 14 Oct 2026 22:44:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 37/82] miniupnpd: patch CVE-2026-107159
Date: Thu, 15 Oct 2026 18:41:25 +1300
Message-ID: <25ed07136216d19d481a4555f9e2cf75d5d92f99.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130957

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-107159

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../miniupnpd/files/CVE-2026-107159.patch     | 78 +++++++++++++++++++
 .../miniupnpd/miniupnpd_2.3.11.bb             |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-107159.patch

diff --git a/meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-107159.patch b/meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-107159.patch
new file mode 100644
index 0000000000..fa2401e039
--- /dev/null
+++ b/meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-107159.patch
@@ -0,0 +1,78 @@
+From 8a3e282b22b16fc90740d62fe213c51696e8dc01 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Sat, 3 Oct 2026 23:42:55 +0200
+Subject: [PATCH] minissdp.c: MX: 0 is invalid as well. 1 is the minimum
+ accepted
+
+(cherry picked from commit 8f13b7a5843f5270db684099c0a083f98869636a)
+
+CVE: CVE-2026-107159
+Upstream-Status: Backport [https://github.com/miniupnp/miniupnp/commit/8f13b7a5843f5270db684099c0a083f98869636a]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ minissdp.c | 22 +++++++++++++++++-----
+ 1 file changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/minissdp.c b/minissdp.c
+index afb11ec..d825bf6 100644
+--- a/minissdp.c
++++ b/minissdp.c
+@@ -2,7 +2,7 @@
+ /* vim: tabstop=4 shiftwidth=4 noexpandtab
+  * MiniUPnP project
+  * http://miniupnp.free.fr/ or https://miniupnp.tuxfamily.org/
+- * (c) 2006-2025 Thomas Bernard
++ * (c) 2006-2026 Thomas Bernard
+  * This software is subject to the conditions detailed
+  * in the LICENCE file provided within the distribution */
+ 
+@@ -1015,7 +1015,7 @@ ProcessSSDPData(int s, const char *bufr, int n,
+ #endif
+ #endif
+ #if defined(UPNP_STRICT) || defined(DELAY_MSEARCH_RESPONSE)
+-	int mx_value = -1;
++	int mx_value = -1;	/* -1 => not set, -2 => invalid value (0 or negative) */
+ #endif
+ 	unsigned int delay = 50; /* Non-zero default delay to prevent flooding */
+ 	/* UPnP Device Architecture v1.1.  1.3.3 Search response :
+@@ -1113,7 +1113,16 @@ ProcessSSDPData(int s, const char *bufr, int n,
+ 				memset(atoi_buffer, 0, sizeof(atoi_buffer));
+ 				memcpy(atoi_buffer, mx, MIN((int)(sizeof(atoi_buffer) - 1), mx_len));
+ 				mx_value = atoi(atoi_buffer);
+-				syslog(LOG_DEBUG, "MX: %.*s (value=%d)", mx_len, mx, mx_value);
++				/* UPnP Device Architechture v2.0 :
++				 * MX
++				 * Required. Field value contains maximum wait time in seconds.
++				 * shall be greater than or equal to 1 and should be less than
++				 * 5 inclusive. */
++				if (mx_value <= 0) {
++					syslog(LOG_WARNING, "MX: %.*s (value=%d) INVALID (must be between 1 and 5 incl.)", mx_len, mx, mx_value);
++				} else {
++					syslog(LOG_DEBUG, "MX: %.*s (value=%d)", mx_len, mx, mx_value);
++				}
+ 			}
+ #endif /* defined(UPNP_STRICT) || defined(DELAY_MSEARCH_RESPONSE) */
+ #if defined(UPNP_STRICT)
+@@ -1140,9 +1149,12 @@ ProcessSSDPData(int s, const char *bufr, int n,
+ 		/* For multicast M-SEARCH requests, if the search request does
+ 		 * not contain an MX header field, the device MUST silently
+ 		 * discard and ignore the search request. */
+-		if(mx_value < 0) {
++		if(mx_value == -1) {
+ 			syslog(LOG_INFO, "ignoring SSDP packet missing MX: header");
+ 			return;
++		} else if(mx_value <= 0) {
++			syslog(LOG_WARNING, "ignoring SSDP packet with invalid value for MX: header");
++			return;
+ 		} else if(mx_value > 5) {
+ 			/* If the MX header field specifies a field value greater
+ 			 * than 5, the device SHOULD assume that it contained the
+@@ -1150,7 +1162,7 @@ ProcessSSDPData(int s, const char *bufr, int n,
+ 			mx_value = 5;
+ 		}
+ #elif defined(DELAY_MSEARCH_RESPONSE)
+-		if(mx_value < 0) {
++		if(mx_value <= 0) {
+ 			mx_value = 1;
+ 		} else if(mx_value > 5) {
+ 			/* If the MX header field specifies a field value greater
diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.11.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.11.bb
index 42a654e327..920d33da94 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.11.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.11.bb
@@ -13,6 +13,7 @@ DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack openssl"
 
 SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${BP}.tar.gz;downloadfilename=${BP}.tar.gz \
            file://miniupnpd.service \
+           file://CVE-2026-107159.patch \
            "
 SRC_URI[sha256sum] = "91994b127da735b2c97f19992e34420648c0e8c4ace8a4bcb0596e7685c48678"
 

