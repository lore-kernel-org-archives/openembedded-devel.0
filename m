Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE997CC6B01
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 03:51:13 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8324.1775101865009680172
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 20:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gtzWQetM;
 spf=pass (domain: mvista.com, ip: 209.85.215.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c76864f4e58so147202a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 20:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775101864; x=1775706664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NvhRdNAadDIR/foJYanFWO6ctiKszGic5/OGQcWAL+I=;
        b=gtzWQetMXsBIZeNsvKzhQO6TH44lAVQyPuIS6saR/a1BdK+Kx8hXqeMOMCezYzTx9u
         HywCFpq222fOcxFrtgXHBKeYpiY+EGEB5Dj+ABN9suvktCsK6KzjAnWmhuUctjHwZcRl
         /EY0TIWlyPIZ5gGE3t6tuyE7xZ3wjxIp9Uy7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775101864; x=1775706664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvhRdNAadDIR/foJYanFWO6ctiKszGic5/OGQcWAL+I=;
        b=Wcr9BRq5E60XRquqRt1qblQ4uc0hsIUhrtn9J/C7Ti+aoPbcUc1Od4kpiaL//36Mx9
         xdu/hIL4kOsv9Be5mkwF3YMw18W9ZR5BZv1Q3tgn40EdCUyfK5J+JvSCR9MD7fK4G6/e
         pnJz/p3saabeitMdvBidT314NJuEyUzEVoaS14tmqXiVAHZRU3Shwrtgye6qo4El2jss
         W5aZJ/lGbvh8WANOC12HdF2E30NB4zbyZg8m/7MMjq7TkhiRPyXpRup0+H7FvGIs4u1B
         OF1jZmWiImQiIhk9O3Ag+qc3vYhMb425FdkSER3Kc4UHA0kq+tKye3u/W1Ky7X+NlgcG
         iwWQ==
X-Gm-Message-State: AOJu0Yzd/9GIiT1N+AhtSvwidVuGVpFXtcBcoCpxQzukhYdFcTGHO1u8
	6T8N3j2B2K1rTBx3fgtV1YBrraOgU4UCjjRjkPnoTtzfrd3h0At2F3li8eImL0pgvtXNpU5xJJ/
	nqRmtrdc=
X-Gm-Gg: ATEYQzxUq+77kpTmvk/FjAnwVmVplMiWf5oeSyZa0nY5VV1mgEqYksUkKzBKqF3RsI4
	cWFOp8wMd0PXB1qiG7Fv7sViGva3LW8P65ER7i+/+EtjzQ4FT8tZJpwZmknVSVmZZLrVx0GM7OQ
	dI0hlI5GLaif0j4dSzDm1wDg+k+GrCRYt0awMMRuCitltKy/Wkdl6R2AO31DZzsV+ysDOLAlz5I
	QabBtPdTaSfd9HPF6rvBkT4RpB3Su0hF6ZabUMOD5pLcbqtTbRXyxNlt7WbAYef8izwbfegA0lA
	1UtwwEb//qzQOVidhfVc2SsXHD3QacbhWhvbvSWyELhscAPl1s+ShAGIbka2RXRBkgKKL1t8BuF
	sR5i532/Wi1yx1BJRR2JlW6+mr4qeQFVQbI+k//BGsBdLn4wlSvTUvXYsR1KQoYfBbby23gDMi3
	zgVZDQRGotNdNKIgNHPLmawDfyNJxE1P4AghmHK0P22FJGvarcuQ==
X-Received: by 2002:a05:6a20:1595:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-39f1098ef84mr1941367637.24.1775101863654;
        Wed, 01 Apr 2026 20:51:03 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f29:1ab6:9597:7786:a64f:e7e8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c4387esm1436088b3a.31.2026.04.01.20.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:51:03 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][kirkstone][PATCH] strongswan: Fix CVE-2026-25075
Date: Thu,  2 Apr 2026 09:20:53 +0530
Message-Id: <20260402035053.69593-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 03:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125956

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://download.strongswan.org/security/CVE-2026-25075/
[2] https://www.strongswan.org/blog/2026/03/23/strongswan-vulnerability-(cve-2026-25075).html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../strongswan/files/CVE-2026-25075.patch     | 50 +++++++++++++++++++
 .../strongswan/strongswan_5.9.13.bb           |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/CVE-2026-25075.patch

diff --git a/meta-networking/recipes-support/strongswan/files/CVE-2026-25075.patch b/meta-networking/recipes-support/strongswan/files/CVE-2026-25075.patch
new file mode 100644
index 0000000000..3b38a099a2
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/CVE-2026-25075.patch
@@ -0,0 +1,50 @@
+From d4b3c39776f06948d875614a0eddea9561159f2a Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Thu, 5 Mar 2026 12:43:12 +0100
+Subject: [PATCH] eap-ttls: Prevent crash if AVP length header field is invalid
+
+The length field in the AVP header includes the 8 bytes of the header
+itself.  Not checking for that and later subtracting it causes an
+integer underflow that usually triggers a crash when accessing a
+NULL pointer that resulted from the failing chunk_alloc() call because
+of the high value.
+
+The attempted allocations for invalid lengths (0-7) are 0xfffffff8,
+0xfffffffc, or 0x100000000 (0 on 32-bit hosts), so this doesn't result
+in a buffer overflow even if the allocation succeeds.
+
+Fixes: 79f2102cb442 ("implemented server side support for EAP-TTLS")
+Fixes: CVE-2026-25075
+
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-25075/strongswan-4.5.0-6.0.4_eap_ttls_avp_len.patch]
+CVE: CVE-2026-25075
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/libcharon/plugins/eap_ttls/eap_ttls_avp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
+index 06389f7..2983bd0 100644
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
+@@ -119,7 +119,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
+ 		chunk_free(&this->input);
+ 		this->inpos = 0;
+ 
+-		if (!success)
++		if (!success || avp_len < AVP_HEADER_LEN)
+ 		{
+ 			DBG1(DBG_IKE, "received invalid AVP header");
+ 			return FAILED;
+@@ -130,7 +130,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
+ 			return FAILED;
+ 		}
+ 		this->process_header = FALSE;
+-		this->data_len = avp_len - 8;
++		this->data_len = avp_len - AVP_HEADER_LEN;
+ 		this->input = chunk_alloc(this->data_len + (4 - avp_len) % 4);
+ 	}
+ 
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
index 4c10636871..6a2b219275 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
@@ -10,6 +10,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2025-62291.patch \
+           file://CVE-2026-25075.patch \
            "
 
 SRC_URI[sha256sum] = "56e30effb578fd9426d8457e3b76c8c3728cd8a5589594b55649b2719308ba55"
-- 
2.25.1


