Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CADFEFF885D
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 13:04:32 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18130.1777208665044615905
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 06:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DAp32m8E;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35691a231a7so6193778a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 06:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777208664; x=1777813464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coZ9mKeOmTbUWRUsv6miH4O+Riqo7RfRnfXVWjntEkw=;
        b=DAp32m8EoezC0lgd4+DDzHSZfJbvOPSYYejmYeYUOpUPQaRm4FO4bi3WoxtyNiJSKo
         sr9r02mcfmUpHNC2pJ3pk0DRtHj7SAljF6MK2+U5vCmkNjap9UQQwZzO0Vc4xovm75S/
         vabM/PGkPrPJ+SEzM9E1HUn1bsQsfzt9mWw+hnC38OLP3MNHZg4+OJG2Jfxep/7PL7mz
         fPei7FDpS2SuT7u5gRORb/HE7EInlxsqe7BkueVpvrrMu/kWGnC71H+x0HSBJ6dUTQyI
         07eZJxpxURREbMyq25uhOeo7GORDn1fuCP3t420AHl2hEs9080AElGckRYtvGC5EzpmI
         wwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208664; x=1777813464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=coZ9mKeOmTbUWRUsv6miH4O+Riqo7RfRnfXVWjntEkw=;
        b=G6Ngi0e8rTBlapwteHWUBV3WZJmsNOC+gvHICsOLZE3t55zcZdS/FpsszrWHvt9oG/
         Z1nO2oSWoL+4mRiZE/anqvpY77TBR/tuy9ssU4vmXVSPuIgyJy6WHZulIG8BTfYi/QuB
         CyU/J5j6JeBMFh5qL2AYfUIAyXvCJD3PQQDeBDkTe1k47rwp+MF2TCL1W428xiw3Zt4f
         i6ZrB4oInREGQyRqGcqVrxVdSE61nonvcs7VoPyNhNqut/o7fWUaVA1XCIBPnk/3WLDE
         XYEE7uCVZfD6jKpFo1S58AozF0GfJc7b9JH7AuPQLCfSl07PmLRbPevCOFpyTkWtOMM7
         4+bA==
X-Gm-Message-State: AOJu0YzJQxsvRR0MfXHcEnDyFv9rRQWkULul2+6LKxs6bZiDO64vBI9b
	6Jg/5lkNGeqtabbBN7ua7cDNBcllRk1tawjgy1ggE84RzTxV1QYkWiESQ/eyNGS9
X-Gm-Gg: AeBDieu4w+EwC3YfM8wtVdgCC+NnTnGlmtRWmjQe6CwIxPOZcnnPNnIhf1iFHt89ZBe
	8jDmdMMAxiJYQNqph9/eoyXJ6zbpGu3d7LJfeUakLlmk5CDr6Wr/IhXZ8S7l0TIyRx6aZD+vaJg
	jsGk81Y4f71JkcEtD1r0mS2rkyeQMcU2JeH8MtOn58h+h2hJMtUfR8IXtJ4jOyTshVo9eEDf81J
	CqMUwwrNd8K7vZKiH+lEMeI8/q5d57r28g5zN296z2kGxCcO0FH6cQT1H+xapTZep7WT67pjP3X
	3DLQBxfPPF/2JDy8ridu6n4XxrcAIq20VCHo2pXIM6k1H68TdtIH7Z/B0rhmEpgJNuLCflJK6l9
	Yj3zs69R+nngjUhRlFBLXLJ0dsVhtUnlPSXf0Dq1wXVm6+9sfxhSn/xwOHrkUg/THDSs+usqeFj
	6q8Vb9JTbOTBAAaoZWT+VNmzBzUFeZIWhKqP0kmpsa2dBQPFk=
X-Received: by 2002:a17:903:b47:b0:2b0:c90f:449d with SMTP id d9443c01a7336-2b5f9f1ca53mr407655275ad.19.1777208664085;
        Sun, 26 Apr 2026 06:04:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm277490935ad.3.2026.04.26.06.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 06:04:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 8/9] opensc: patch CVE-2025-66038
Date: Mon, 27 Apr 2026 01:03:50 +1200
Message-ID: <20260426130351.793052-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
References: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 13:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126624

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-66038

Backport the patch referenced by the wiki[1] mentioned in the nvd.

[1] https://github.com/OpenSC/OpenSC/wiki/CVE-2025-66038

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../opensc/files/CVE-2025-66038.patch         | 41 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.25.1.bb   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-66038.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2025-66038.patch b/meta-oe/recipes-support/opensc/files/CVE-2025-66038.patch
new file mode 100644
index 0000000000..e5a27deae5
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2025-66038.patch
@@ -0,0 +1,41 @@
+From 2f5582340ac3fd2062d0f6561a13aa9b269062dd Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Tue, 18 Nov 2025 14:13:59 +0100
+Subject: [PATCH] compacttlv: Fix possible buffer overrun
+
+Fixes: GHSA-72x5-fwjx-2459
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+(cherry picked from commit a20b91adc2fc66785c0df98abc8ef456c0eaab9d)
+
+CVE: CVE-2025-66038
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/a20b91adc2fc66785c0df98abc8ef456c0eaab9d]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libopensc/sc.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/libopensc/sc.c b/src/libopensc/sc.c
+index 7c9e0d25e..eb88b9abe 100644
+--- a/src/libopensc/sc.c
++++ b/src/libopensc/sc.c
+@@ -1082,13 +1082,15 @@ const u8 *sc_compacttlv_find_tag(const u8 *buf, size_t len, u8 tag, size_t *outl
+ 		size_t expected_len = tag & 0x0F;
+ 
+ 	        for (idx = 0; idx < len; idx++) {
+-			if ((buf[idx] & 0xF0) == plain_tag && idx + expected_len < len &&
+-			    (expected_len == 0 || expected_len == (buf[idx] & 0x0F))) {
++			u8 ctag = buf[idx] & 0xF0;
++			size_t ctag_len = buf[idx] & 0x0F;
++			if (ctag == plain_tag && idx + ctag_len < len &&
++					(expected_len == 0 || expected_len == ctag_len)) {
+ 				if (outlen != NULL)
+-					*outlen = buf[idx] & 0x0F;
++					*outlen = ctag_len;
+ 				return buf + (idx + 1);
+ 			}
+-			idx += (buf[idx] & 0x0F);
++			idx += ctag_len;
+                 }
+         }
+ 	return NULL;
diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
index 999ae34b12..6772fe02f7 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=stable-0.25;protocol=https \
            file://CVE-2024-8443-0002.patch \
            file://CVE-2025-49010.patch \
            file://CVE-2025-66037.patch \
+           file://CVE-2025-66038.patch \
          "
 DEPENDS = "virtual/libiconv openssl"
 

