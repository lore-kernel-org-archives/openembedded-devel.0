Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B9AD7788C
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:02:29 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.115.1769187747388512254
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V8+PIX0I;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee07570deso18967495e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769187746; x=1769792546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJPI0K/4y0sDpUuS4W8nsyLed9LctEUPeDvEeMFNXOc=;
        b=V8+PIX0I2pusBmrHta2N3nbMhH1l5YLtyLntTjhBCDMGE9OGAxO1HaUMJubY0042qY
         kYB3M4vsPGIASge1cDt7aBWoM9evSzL56rKMcmRjWm2zwWFwo1RG/al4fuvIh+MmqCfg
         f8qxf/EBR8STJLt/nlXBW5CKH66d/+fgmtBfkJjq/EVkM8rTblqAt7a++nLcLg2Ba4vn
         Wqw3OM/4vNo/RlRqGByC/L5AYQGHfVHw+I0PleEo5bxUCK9/rYEfCqwdoUQ85aKbP62d
         3VUSK2cRL6RNchhiAJvYrydunHpX35+7y92Z4Pi1FMWVwY8ZYyr80Qd4P0xt06hh3WRu
         YV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769187746; x=1769792546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SJPI0K/4y0sDpUuS4W8nsyLed9LctEUPeDvEeMFNXOc=;
        b=WYGoLj8mp1G6OE5sTdMQsbfBrC8mai7Owx9emU/PxU53F90YJF4NNjPKmfSuRh8nS5
         ugHJH7+xF1TnhOS4BJOKDMcmdsfW7/xE7eMw7VaYvmIswVRE8apqgMEspVw8w+Ocg+tC
         MbvRPHAJCGfWJ0Brs0ynKG5IhaL64GE5xlIS3BIjJUtk7tZu5IhIeX9vV5D2hjRIKGwq
         5PKyo355VJtA+LTgyB2KA9m31S+IVXp/1dfuGe6wOTwzXSQ56hPIKvMFstBVhtBIKnFR
         ms+Gt7TPBNo/1/C1JFhzdDXKF89oM2S0BUlQ8gLck6mI/uX5MRNyzQyQ/ihO9HIGMNsY
         G10w==
X-Gm-Message-State: AOJu0Yzjbjnzfpwe0SJMJS/MLT77l693iX/Pde0WehMVZVCJn2opCn5w
	ebXR2nUnaA0Qr6veq+ItY17lo4CS8e3gDGuN7gGyN+952iQbwj8QLg+E18wZxA==
X-Gm-Gg: AZuq6aLTTkCPKV41eqUpo3ypT+F+UGWPFoN6tHyoEY1JWitzhEIBvPUfvoRZ1kk5zOn
	Im3qMjlqc6e3M+zAdJe/+ptYIpQpRKqcOVQ7xw5eEWWL00UM+lKXFQEudSW/6fcuTdwh33uDpwg
	zhOLYnR5Dxjv10mGfe1NQ+71PNKXhW9rZC2hHUEsORv8f2ZLY38Z/IBsmyPNJeupAouUWGN+NPy
	UjSxdyoMLY6/G771yrIlHgdUiAAqvCKfrcsDRZWfhKc8CkRwPNCBM1GIYhMhHoqC+gmPGKne3ua
	v8ZdDNbQb1fo6crGy/TjuyKztWkVg39cfEJZ7+NZ+NmgbrlPxlq4oQw8zuiB5jUZ0haA+7WLMIA
	eQeJJ6DpjVjvrkuTq9pv7ZmTYXmEtKEJzU/yTaxzWwmJtXS+yGe+u6R6rpC5JW4oLISjApl49t1
	la+RUvD5f3Ad8y/P4a1/U=
X-Received: by 2002:a05:600c:6748:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-4804c9a4690mr60693365e9.6.1769187744772;
        Fri, 23 Jan 2026 09:02:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd4630sm25455165e9.17.2026.01.23.09.02.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:02:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 03/10] strongswan: patch CVE-2025-62291
Date: Fri, 23 Jan 2026 18:02:14 +0100
Message-ID: <20260123170221.671471-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123170221.671471-1-skandigraun@gmail.com>
References: <20260123170221.671471-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123789

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-62291

Pick the patch that is mentioned on the vendor's blog[1], that
is also referenced in the NVD report.

[1]: https://www.strongswan.org/blog/2025/10/27/strongswan-vulnerability-%28cve-2025-62291%29.html

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../strongswan/CVE-2025-62291.patch           | 45 +++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |  3 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2025-62291.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2025-62291.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2025-62291.patch
new file mode 100644
index 0000000000..df5568235e
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2025-62291.patch
@@ -0,0 +1,45 @@
+From 8412dbb2dc054191b03df8e7fbc3dd8bf4c10be3 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Thu, 9 Oct 2025 11:33:45 +0200
+Subject: [PATCH] eap-mschapv2: Fix length check for Failure Request packets on
+ the client
+
+For message lengths between 6 and 8, subtracting HEADER_LEN (9) causes
+`message_len` to become negative, which is then used in calls to malloc()
+and memcpy() that both take size_t arguments, causing an integer
+underflow.
+
+For 6 and 7, the huge size requested from malloc() will fail (it exceeds
+PTRDIFF_MAX) and the returned NULL pointer will cause a segmentation
+fault in memcpy().
+
+However, for 8, the allocation is 0, which succeeds.  But then the -1
+passed to memcpy() causes a heap-based buffer overflow (and possibly a
+segmentation fault when attempting to read/write that much data).
+Fortunately, if compiled with -D_FORTIFY_SOURCE=3 (the default on e.g.
+Ubuntu), the compiler will use __memcpy_chk(), which prevents that buffer
+overflow and causes the daemon to get aborted immediately instead.
+
+Fixes: f98cdf7a4765 ("adding plugin for EAP-MS-CHAPv2")
+Fixes: CVE-2025-62291
+
+CVE: CVE-2025-62291
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/c687ada6a6f68913651e355fd09f906893096b32]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
+index 1bb54c8..9ad509a 100644
+--- a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
++++ b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
+@@ -974,7 +974,7 @@ static status_t process_peer_failure(private_eap_mschapv2_t *this,
+ 	data = in->get_data(in);
+ 	eap = (eap_mschapv2_header_t*)data.ptr;
+ 
+-	if (data.len < 3) /* we want at least an error code: E=e */
++	if (data.len < HEADER_LEN + 3) /* we want at least an error code: E=e */
+ 	{
+ 		DBG1(DBG_IKE, "received invalid EAP-MS-CHAPv2 message: too short");
+ 		return FAILED;
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index 2e2da8274b..4592381a36 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -9,7 +9,8 @@ DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-          "
+           file://CVE-2025-62291.patch \
+           "
 
 SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
 

