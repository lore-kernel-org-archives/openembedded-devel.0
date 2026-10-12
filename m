Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C763ACA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:32 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5084.1791839489180968032
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=byju2a1e;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1300898a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839488; x=1792444288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXbyCa13wnvjKK6vtk0O76lvNis4Bh3iBUF4NLnhi2Q=;
        b=byju2a1esIgZgctmcKVQ9r2SwgM4fsRUYbFjAab28o9TMwJV1WGBFYyEcWlu4b5wXp
         Z4nOXvYfj1gs8qZo7u1wIR0wrx/CDsP4cRczOLu0qOBEaW4aBIs1o/hVKamKU0QcIKxn
         XMg4yCYk6nHjUUowpygLKEOXF0h9VntRnxJLkj7sT7O1Z48G9pWjQgrnvnOzObo3eyyb
         AeShrBshtbaaQrFW4Pv7roGMUH4yNQY/NAcijAfykhWd+BufWKLKiMLsYDjDNxMzMMcp
         xhx6XoBuQ5QJnsP6ySGXCwzyh+JG8WHAvGaU8fi5Ejug/mpqkaj6PMSyNQsTrr/woE3Y
         OO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839488; x=1792444288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXbyCa13wnvjKK6vtk0O76lvNis4Bh3iBUF4NLnhi2Q=;
        b=yLeyEPPDnqsavUXGkQ4CTE0q3BxIdDacB9SlLnRU9lOl0f638dAEItub5rtYXor1Hm
         WU87z3vGVFBC7aILtLVb0kuySHQDJbM7o8jCN5tB/a9hOKGP6ctzkvy1bR2Lecs3ccB/
         m2N5IgDDMI29rs3gHRMxc5csHpBkPMMEJgYlHEEhA3ORpgsVf4Ju1Nc3U8U+1ktDxf5M
         3j2t4aJD21qfknhZdSmSf0aV2lN9eunSDpJleBYgTI8qYIpmrx/tvD0Wg9RT6DJw1DxQ
         k4b1UGIWaIwOeqoIg3mGnjpb1MHDAsrOqZ5qKGYDRZC6Elx4YIS1FiTq8jhTwp1rFXU4
         wkGg==
X-Gm-Message-State: AFq9FYKYtwejRnMSgD2OAdKwM2tcWo+nVVRzXP8JgiW4hKmOgJ02gzp0
	B3Bi76zX67Mc1xOwCjlz4ec7adPr2Nh4AuTW4gJeQ0rqqSx12e6a7uBp2aii+sA3
X-Gm-Gg: AYBFou1NsO2XTJzwFWfnUsekjW77AMxUiVSt6g/6X8M+eduTZVyG0BWxmSwW1TzROKo
	Ch9wnfXrnG3FJaPZvAykNCJCLFWNhBXrhetft0KOakkaymKe0+mxynH5pEFA020a7gbtsJVDpd2
	gDDp7NUDVljJXLTYoG/h8e3RqBBePBgO9SgZmBtdd3YpebN0SEyVZxUN985VCMPEZ+yWmtHfv/s
	qXpB4AQzxNmwbPcrSe1GE15geFkuqppruJPlpgooPUP3U22/of5ut23cWk6sWEaapx4zbOw1VPH
	7ClwQqu6Udt5xJRQuQVPXlDzV2x/7Ok+TGn7Hh352zuig7s5EbbOnx0B2So+DADh+ASUgAIr+83
	+u65vhl8j6EppH2UTBXJnsAo6O6lzjhwTikADja2P7y+unnVkY/6vTJTnWeHIcExUjuFWln+CbL
	mPXmkLAqmVZLFfCCwhyBwvGdJwyI5tmbX78GocBqF/NyXA5nGwiD7o6b09DUBrjdfTeadBXbwqI
	Z/EAMjwAnHNYZetLHcOBe2gxbaS6Gr1Q4M5eqU=
X-Received: by 2002:a17:90a:d48:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3abc674ea8dmr2570244a91.50.1791839488445;
        Mon, 12 Oct 2026 14:11:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][blacksail][PATCH 28/43] miniupnpd: patch CVE-2026-107159
Date: Tue, 13 Oct 2026 10:09:52 +1300
Message-ID: <20261012211009.3352822-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130798

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
index 00000000000..fa2401e0391
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
index 42a654e3278..920d33da94c 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.11.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.11.bb
@@ -13,6 +13,7 @@ DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack openssl"
 
 SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${BP}.tar.gz;downloadfilename=${BP}.tar.gz \
            file://miniupnpd.service \
+           file://CVE-2026-107159.patch \
            "
 SRC_URI[sha256sum] = "91994b127da735b2c97f19992e34420648c0e8c4ace8a4bcb0596e7685c48678"
 

