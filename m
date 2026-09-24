Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F36C98310
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:33:42 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.726.1790224413547991577
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dgGxOf51;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso1026951a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224413; x=1790829213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUBEb+xvAXH2zkoe5y4mF+lOp8kxDJqVR167PVQu690=;
        b=dgGxOf51DgzQSlQofRSgXh6m0VYOt8U5IctbQi2y7dlsaqAtun0RCmBDDXexkioeql
         VYRo/sCKBG4m37JF6EJoecg3H9R/hThYrICTP7+7ANVnbinyF7AxN9X1Ok/smVk7F9sj
         TY0cniCd2s3IITJ3xVVXwW4nt7wCSE+voK3mbJRtxKbmriLrCK7oyz59DaXl51EbDEPX
         WdDn0XRDcbF8k0IaeTKvY0s4QFgLayFIykq6FAx5dYF6JTqTk6K/KM1Mr7VEdTL8Br/R
         7yGYP1Lbvq1lmcjUm0OcY2Z6Qu8LWguhqCmSNk3vzLTMiji6o7qiMgC7filQsh5b3Ts7
         rMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224413; x=1790829213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MUBEb+xvAXH2zkoe5y4mF+lOp8kxDJqVR167PVQu690=;
        b=Ge2fW6zo4SzQJs+e4PJCyNZxVJHF83NtPZw4xo5gfd9T9FHhP32YnMe0Z0PjU2W1Ib
         23qkY8pbq5sGhc/RWDGCeZHjvmjo9acWl+zs8DGp1o82ThHjbK3F7cf+xA23lUygqi6X
         hS464ZSATB7q4K9ZdJshngffHdFt7S0a77k/fF5YGYvW2G22S+cfzduRr7WADpN4yfgI
         UJYLosvjSBGdyOmV6GMLlLDtWvujb3zvrzSBm22XTB9OzvOoBLZcfpqsfw9KaOGNVphh
         sK1hMXRGXZ5wGVga3k+JVy6dTK+kGAehDK+RAYaco8etcw+1bWL1NR21goEP5qfIaRd/
         9XeQ==
X-Gm-Message-State: AFuF++mPGIrMJfrI3L6uzD+RSg3WNpM95QxZ8Jf7yqOaf/jgO141Nia+
	NJ/RWYMwRVGwpN5cczd3f0dTNteLPSQqQsifHDXITcXD27KdtGuN/IVvpQmkTA==
X-Gm-Gg: AYBFou1Nd+a80ca1HArvinMWsK0altNRVkAB01/fEa3XhgASpOicnTvAJHHSAxzoujE
	mpE9/u8iVGuQtOK6O36PJaE9gmAFm58V/q5b0fQ5PnTRQwM9VUCixch5RhufbXBhxYA85EdcpzR
	wNz96FEyXzBpK/fA8yl8gHbDyLfPOoqGc92Him77yEDuwHQw28fCuzPszP92RC2efphYIl8HqcH
	2uAz9ryTsbCFQpVxDd56tN4ZQu6LN45D4k9OTQKeyJgEi0rkCuLxRg6k3EVFubmrNvrZxF+9DId
	5wdB2NHHBKZ/QNPpTjMVIBwUhDJaBjyvf829qwvbjABPO4ioCMgaZwM57n7bz39BFxSLxVdTFAa
	4UMHXXBRec6krAr51Bcw1DgpZHEIAU1XD9yscf45f2St9qBWBFyhiJKxz0bGotC9YSoAssJOJfe
	6jCLO4a1ARgz1L5zZVQoa1/boari7qZt8hl+9MkLEA19PubM1XbbTAazbMDp6v11Jvo+B+w4IGZ
	wxsJ1P2uzzeReYQFAjZMcI=
X-Received: by 2002:a05:6a20:43a7:b0:3dd:a196:53a0 with SMTP id adf61e73a8af0-3de0e97679fmr1189747637.66.1790224412791;
        Wed, 23 Sep 2026 21:33:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:33:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 6/24] strongswan: patch CVE-2026-78124
Date: Thu, 24 Sep 2026 16:32:56 +1200
Message-ID: <20260924043315.1663186-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130254

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78124

[1]https://download.strongswan.org/security/CVE-2026-78124/strongswan-5.0.2-6.0.7_openssl_pkcs7_certs_leak.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78124).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78124.patch           | 34 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch
new file mode 100644
index 0000000000..b0b2a9eeef
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch
@@ -0,0 +1,34 @@
+From 36ce778a76b4b912699a52cf1109394fce109c83 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 15 Jun 2026 16:02:01 +0200
+Subject: [PATCH] openssl: Fix memory leaks after enumerating certificates in
+ PKCS#7 container
+
+This can be triggered via IKEv1.
+
+Fixes: 04884be3b5f7 ("Implement openssl PKCS#7 certficiate enumeration")
+Fixes: CVE-2026-78124
+
+CVE: CVE-2026-78124
+Upstream-Status: Backport [https://github.com/strongiswan/strongswan/commit/49bf0725fa61198d1e29d5b4c2651c9190b2c10c]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libstrongswan/plugins/openssl/openssl_pkcs7.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/libstrongswan/plugins/openssl/openssl_pkcs7.c b/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
+index b15c8d7..cefe1ae 100644
+--- a/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
++++ b/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
+@@ -132,6 +132,10 @@ typedef struct {
+ METHOD(enumerator_t, cert_destroy, void,
+ 	cert_enumerator_t *this)
+ {
++	if (this->certs)
++	{
++		sk_X509_pop_free(this->certs, X509_free);
++	}
+ 	DESTROY_IF(this->cert);
+ 	free(this);
+ }
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index 4d9fe14eb2..e7a5370f03 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -11,6 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-47895.patch \
            file://CVE-2026-78123.patch \
+           file://CVE-2026-78124.patch \
 "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"

