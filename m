Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0A2E88D7D
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:49:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34421.1775393396398179105
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b9ecMNdx;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a871daa98fso25723335ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 05:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393396; x=1775998196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fa1fDdJr6RX8vlFVdZrXzFlTqwgUk13obcBOVbAUf/8=;
        b=b9ecMNdxP2zImZd+WFHScJ9iC29TryruCBzk1W5ovTbqBShJ8X4x2L5dYK/uWav2lF
         VxUXI7huAy9aFyyaXhCgOLpz7RzQMptchPzqMf9wAqdrWEmkQsDHWuTiTP/4MN6qpfuK
         bpwISj73KM6vrHMpaE+68s8QXyZat+lZXmxfRJoem8HEcqAIWAfObG1kRnWsDexfq/kM
         BuyuOtpovbxi6VDsNbVXJuw9y3QCecJPLi6ayhI8rXBidNZ/bkRI+Ck0LiYUjdv6k8vi
         1XsKOwTrL1nUApWtLoUH6xxnZ5Hpi6IHCcjssmRsS/6qGgTMY/CQyIvnxjtpAEozAIew
         dSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393396; x=1775998196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fa1fDdJr6RX8vlFVdZrXzFlTqwgUk13obcBOVbAUf/8=;
        b=a0KZsrJwdFqYEdkKrx8JfJTpH/92K44t89qE0Rb45vU8w1svzHeunjGPpnBXBvu6DE
         9/9GV9OTbhNXcfppecFelEjDGp+h61qdNKC8YMd3tHlaV5HOm3ADyRRX//ZJGQiAoQct
         F9pXktt0gJ+BC8UBylabMwNFRaeOE8a2u4LQLv5tqEVcC1FsnPWoHuFZmKqnzeHMYptP
         3jH0MCqXMxwKQKBeIgWJV3buLIPjJzUkR/KxD7NlYs3djcdR30P14ouTD+JQqCBdAHJI
         kL5aWjrnN8hN6BZ1vYKhGygXXDLuMgiMIhWaM3kdWfCQRrZfM5WYExbsP45rAQ0uIpNc
         tshw==
X-Gm-Message-State: AOJu0YzF1/7Eau2BBqwRJs2ThUNZzZuBBT7iWr498J+T6EJV1qFkXtjA
	7/+rrOx2sP8ipDVpPG287Vi7u39NWVYfpFc/lZyjBPhW5+w+3VhUNouc7ViZ1OjwNpA=
X-Gm-Gg: AeBDietQSn/DftLn9JihZElpfA5xdirMBoqzQSF1UzsLsXAB2dVgcdUQ0pRn6yxF+n8
	MbN1jt2s3J+IN6yCYaCghspteJL7subdNf3lvikytHgMqUxCABLAtz/iHs81dZ4Oki7f4lSiusk
	dn9MZZ4BfoFdbF/FacfvBMxFDbB8eN5FbUjFKXzU6w5BOOy7RfI1YRKGGGFASW4eMfpZxVfF1Cf
	q0sP2kV1mFqwN74vUrPnRxj8AsXzoJ+D516M9vXkInRxHsg9ao/St0wOkkGMsvAwKEvBoBy95x5
	eTtR0efUydy4wLdxJyHtR7ptnrKmXIEsRlMZSxqb9dHE50gy2QUz0IsJBIytz7pSuL3HCr0EtIS
	CE/oacNrD/XVDIvF4lXxb9C4U8lq+E8SjCBmT7QioiEHJbKFvStLr6Ccwm5EZU0e4rxlAIYM1Jh
	skb9fGEn5+NOKmMYMAtXTY3kuobifVlr974AE=
X-Received: by 2002:a17:902:c943:b0:2ae:c358:bb7c with SMTP id d9443c01a7336-2b28183b8f9mr97813155ad.35.1775393395560;
        Sun, 05 Apr 2026 05:49:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm106828025ad.24.2026.04.05.05.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:49:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 11/14] strongswan: patch CVE-2026-25075
Date: Mon,  6 Apr 2026 00:49:13 +1200
Message-ID: <20260405124916.2881008-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
References: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 12:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126010

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25075

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-25075.patch           | 48 +++++++++++++++++++
 .../strongswan/strongswan_6.0.3.bb            |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-25075.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-25075.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-25075.patch
new file mode 100644
index 0000000000..cd45354523
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-25075.patch
@@ -0,0 +1,48 @@
+From 5ed074270e74a44cede84357ce791a58d22c4cd8 Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 73aff21077d88de7544e989a9af1485128fc5d6d)
+
+CVE: CVE-2026-25075
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/73aff21077d88de7544e989a9af1485128fc5d6d]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libcharon/plugins/eap_ttls/eap_ttls_avp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
+index 06389f7ca..2983bd021 100644
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
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.3.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.3.bb
index 438b5d5331..bf0eb3bc1b 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.3.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.3.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
-SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2"
+SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
+           file://CVE-2026-25075.patch \
+"
 
 SRC_URI[sha256sum] = "288f2111f5c9f6ec85fc08fa835bf39232f5c4044969bb4de7b4335163b1efa9"
 

