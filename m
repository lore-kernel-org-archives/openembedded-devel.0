Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7255AE9E316
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 14:36:07 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20234.1770820561194931896
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 06:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PapA9aYX;
 spf=pass (domain: mvista.com, ip: 74.125.82.50, mailfrom: rsangam@mvista.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1271195d2a7so5358684c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 06:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1770820560; x=1771425360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fppuc5DS6GKCWot2aNP+FhQnrBl/SP9frOm8HpcK4TI=;
        b=PapA9aYXDRpd8jpVemT1LGQG/+zRBstymgm1YdJeUj5/g9zR8swg0LkR9tw+twsStb
         US1VtOSik22rNCH4htsXziT+olHiEB9QD6/n6PMeCFAoumzZ2J5WLJkHi8yV9S9/vOKU
         GfsNzE4CWZKfHZ2IV8Ya83eT2EFjRQZXCGdhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770820560; x=1771425360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fppuc5DS6GKCWot2aNP+FhQnrBl/SP9frOm8HpcK4TI=;
        b=FA92T1q0YxlkaNhIp5Krdbpo0D7KsUN+RSeI/Ql8E65IBa6yZ9m8LhFD/caQcsQMD/
         v4oiL1FuZdU9g7d5EnaweWpxoaWrPkPfNikIHFti0Cfgd/YybHV1jP2B8Vc4xXHgPRZx
         zJ8tfSLgVki7VgS3VZlZ1V67r9Yf0yQ3AVptcwlCIPous7LS6EFZNs4+1bLxYsO2LuCr
         uUsKFBDw4JVhoMIKtX46tbjFNx1n7J2hU0E40633EcVeI+Tv6gNGMo3fb/TVK0rM0Yim
         zymRM0jXicNzcda9gD8yf/WS/nPLLZFIhoc/y9EvmVp6w7kuVnsFf7sDLnKuPXiw78yZ
         taXg==
X-Gm-Message-State: AOJu0Yz/Uvq7htFaQ4X5i2v2vd3BN/zz6r8yFipauim7fO6xRk5CudqC
	seNXxxlN5ZqEwFiNqeY5FZCXGjRySUayrP2j2Hqe6ZDp61pNUl0T7RYpGPSgZ3ciUzgJ2IJi42p
	i3tKFuNg=
X-Gm-Gg: AZuq6aIcjr1RcdPsHOP0GQGtuy28L2n7Xwnw/UHCjFd+EL2AuNc4h2lmm+Ss4Y/acs3
	y49039F9iNyyk0A0eoztU3aAQfzxlsZzPdTGvHwyYfFTs2YgsCwCQS5rBxh48LBIFxhYaPoZej0
	Vq8o6nnSe2NdOKZFfh6VPQJJxcg6kMfjBrCF8bvmqKE2lbeh3zgyds+MxCz37zLPvdCkPKuWC9b
	NcWBWzY7ZAzEtQI0IMd7sV7QX3Ssz7KD2GGFKM/GM60bXtjcea8C1nHdNbQqadaiCTLRgYojifm
	S5PaKWtGPIjtBVXXkT4aiiRmuJo03v72rM4MoMXEu68bbGOVPsuTQc9yFbpCIlwi11iNYEa2Rr2
	Zp23mNy89OCN/YYp6SQzf8eckAs8fIwRw9xKcrZMoZ7P6qeWjFjgHqwOib0y2I365pdq1it1fBt
	AnzZ/YvajTsriVWeagpDex7HOp4OIKvmiBrBpt7ZsI5auHG7n4ZfEeUkAu
X-Received: by 2002:a05:7022:ba0:b0:119:e569:f27f with SMTP id a92af1059eb24-127299a1e0amr1139318c88.40.1770820560324;
        Wed, 11 Feb 2026 06:36:00 -0800 (PST)
Received: from MVIN00040.mvista.com ([2405:201:d00d:417b:59fd:c9d9:8cbf:b47f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dd00adcsm1336380eec.32.2026.02.11.06.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 06:36:00 -0800 (PST)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] strongswan: Security fix for CVE-2025-62291
Date: Wed, 11 Feb 2026 20:05:53 +0530
Message-Id: <20260211143553.106263-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 14:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124340

CVE fixed:
- CVE-2025-62291 strongswan: Arbitrary Code Execution and Denial of Service via crafted EAP-MSCHAPv2 message
Upstream-Status: Backport from https://download.strongswan.org/security/CVE-2025-62291/strongswan-4.4.0-6.0.2_eap_mschapv2_failure_request_len.patch

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../strongswan/files/CVE-2025-62291.patch     | 49 +++++++++++++++++++
 .../strongswan/strongswan_5.9.13.bb           |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/CVE-2025-62291.patch

diff --git a/meta-networking/recipes-support/strongswan/files/CVE-2025-62291.patch b/meta-networking/recipes-support/strongswan/files/CVE-2025-62291.patch
new file mode 100644
index 0000000000..d66c76971f
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/CVE-2025-62291.patch
@@ -0,0 +1,49 @@
+From dda24815d148b91209ebf2d27e3a7acefe9b6435 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport from https://download.strongswan.org/security/CVE-2025-62291/strongswan-4.4.0-6.0.2_eap_mschapv2_failure_request_len.patch
+CVE: CVE-2025-62291
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
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
+-- 
+2.35.7
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
index afa1a684b1..4c10636871 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
@@ -9,6 +9,7 @@ DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
+           file://CVE-2025-62291.patch \
            "
 
 SRC_URI[sha256sum] = "56e30effb578fd9426d8457e3b76c8c3728cd8a5589594b55649b2719308ba55"
-- 
2.34.1


