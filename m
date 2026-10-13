Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE92CC6B13
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:48 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3521.1791885586447823719
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=idlKCUil;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso1133977a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885586; x=1792490386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMOJ+wdKtsBYkFERsEOue3c/hDi2ukGCx5whtwPoGAo=;
        b=idlKCUil2SaM/ph3gDMMBJJjRqS7UPjqsSD0UXlyhGfqpehWdxqDxsK/k7J/GH69y6
         ht/oUL5iaHwXOEIESxP3lrCGfFJb8KGJ6Gis7enldpmFcf9fT75qp+13HE1na+CNwP5n
         yrtlVq8pzI8zrm8t75SgqfjJTpttmDfU+VUcItjXXNDCYqowdNNOSXANm/qLDgq+e2I+
         7vTSUgWDrBNpl5oUWdrjUol3dx6BmuD/tkyIrywBcatc2AF6HFzqaR3UUK+JRJ3pLFwE
         XnMIE5jKHvH94KCi0rsE0F2KXB1AAR/SIlapwHUFoBPd1LQAAdyXGamzpttpUbt9UZj3
         AfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885586; x=1792490386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMOJ+wdKtsBYkFERsEOue3c/hDi2ukGCx5whtwPoGAo=;
        b=EL0tztKmCHHPMfCSy+ZHPJOrVF2LSBAZ6EAgqvnCjGPgfKWSNZ5cOZeuo1IdWJgrwF
         2i5mGiVkOzjb/FXlXppIXQtWaEnqLBc69CoHVtGjX9vt3cdqD39ZhOFGDAj2ve49KgMt
         YqaQmEO22V+gqUSgScD+5H/xW47gGRmzlYq9OHOtuH6muWqrccSAE+v+lff7P8XvOIar
         n4Aa8z9DgmdQb9sRpZch5k6GjP/8z2cEyn2AMmoieUhC0nU99vpwdqOTG+nSw4SJbeAK
         jGCJe2vsyM/tQ1blpE88E2VcjdhactCg8EUJyHWBoh0l+oZgxYKVe0ojs6B60k+ENlFp
         vBcg==
X-Gm-Message-State: AFq9FYK2jnLBvvq6akHKD0RDZQWFSt/m8AhegvmvBcijwGFJ5oOCR/tS
	fLmRxED/DFs3wqcT4TEgPlQmCHX3TMG/Q0X15EH4ZSo9z4bW+HmHtPc2SiYb9A==
X-Gm-Gg: AYBFou3pGIzCBKyNL44k3O3z6ugAf2qOTC9eNTa3Cok5+V4Obr1suhj+/R60MRx1qJd
	lr9h75T62dQA9tCeVaoZFgfKFKzjbyjLTwQ8HGi0ZyvKqAFD2LVCxHgQujrOy8UW7ufULAS3f2Z
	Dk8OvYPf/L/YNrhtKlsJGl+5SSjTH+mNFGLwdCHwDCLQl5iXNMPqGaqr3JJb6KWdLw7TwLwwUXL
	mV4bRasmAFga9z0m3dPkRuSW8nQidinXTgSjtmbGnfUBMs9JKyMJcWZC5Q0ZmGxheTUif60pX2Z
	z7chbZtXZZfOEZLEunSX72jOLr/Cg+tzxSif0wM8NHNPCHLqgxkXY43u9BmSRqSzym9xKqAXRxj
	R7W5n9I1O7W5Euqs054Mogcy2oaSwTNEOIQHpPmWhaQqX3L1LyfasGSAUEX8VjfFoMYjZuKEl0k
	pV3gJCPaoGyxTCn6Bvn8q0d272g4AypqX87E78h6odhtrWCscXikbijN/QmXxdz4JqHkZhIA5sF
	TjWBxuZQ8YKRT6Hai2kOTimIpPtXogOD1kVwgs=
X-Received: by 2002:a17:90b:164d:b0:3a4:a370:d888 with SMTP id 98e67ed59e1d1-3ab3a99b4c2mr8344724a91.20.1791885585667;
        Tue, 13 Oct 2026 02:59:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:59:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 13/28] strongswan: patch CVE-2026-78127
Date: Tue, 13 Oct 2026 22:58:48 +1300
Message-ID: <20261013095903.3544906-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130846

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78127

[1]https://download.strongswan.org/security/CVE-2026-78127/strongswan-5.3.1-6.0.7_message_log_leak.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78127).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 7b8fd4df2e4eb82ad4558d6d3ddde57524ce9216)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78127.patch           | 115 ++++++++++++++++++
 .../strongswan/strongswan_6.0.7.bb            |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patch
new file mode 100644
index 0000000000..43def8b9b1
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patch
@@ -0,0 +1,115 @@
+From b38d55b7df137e599c0364a8f0e6d3e1ab84ed50 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 8 Jun 2026 09:19:42 +0200
+Subject: [PATCH] message: Avoid memory leak if string buffer for message is
+ too small
+
+This leaked 40 or 80 bytes per parsed message for the enumerators that
+were not destroyed.  While triggering an OOM condition will require quite
+a lot of messages and the DoS protection also helps avoiding that this
+is triggered quickly, it all depends on the memory constraints of the
+system and the time available to the attacker.  Also, if IKEv1 is allowed,
+it could get quicker as the lack of message IDs doesn't allow dismissing
+unexpected messages before parsing them.
+
+Fixes: 092958c89d52 ("fixed payload debug message")
+Fixes: 6a4a47511f75 ("Show contents of the CP payload in message_t stringification")
+Fixes: CVE-2026-78127
+
+CVE: CVE-2026-78127
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/4b7108ac0f84fbf40da2b510eb6333afa2a54240]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libcharon/encoding/message.c | 23 ++++++++++++-----------
+ 1 file changed, 12 insertions(+), 11 deletions(-)
+
+diff --git a/src/libcharon/encoding/message.c b/src/libcharon/encoding/message.c
+index 8da9a1d..a4bf9cb 100644
+--- a/src/libcharon/encoding/message.c
++++ b/src/libcharon/encoding/message.c
+@@ -1398,7 +1398,7 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 						   payload->get_type(payload));
+ 		if (written >= len || written < 0)
+ 		{
+-			return buf;
++			goto err;
+ 		}
+ 		pos += written;
+ 		len -= written;
+@@ -1424,7 +1424,7 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 			}
+ 			if (written >= len || written < 0)
+ 			{
+-				return buf;
++				goto err;
+ 			}
+ 			pos += written;
+ 			len -= written;
+@@ -1454,7 +1454,7 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 							   eap->get_code(eap), method);
+ 			if (written >= len || written < 0)
+ 			{
+-				return buf;
++				goto err;
+ 			}
+ 			pos += written;
+ 			len -= written;
+@@ -1495,7 +1495,8 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 								   attribute->get_type(attribute));
+ 				if (written >= len || written < 0)
+ 				{
+-					return buf;
++					attributes->destroy(attributes);
++					goto err;
+ 				}
+ 				pos += written;
+ 				len -= written;
+@@ -1507,7 +1508,7 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 				written = snprintf(pos, len, ")");
+ 				if (written >= len || written < 0)
+ 				{
+-					return buf;
++					goto err;
+ 				}
+ 				pos += written;
+ 				len -= written;
+@@ -1529,7 +1530,7 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 			}
+ 			if (written >= len || written < 0)
+ 			{
+-				return buf;
++				goto err;
+ 			}
+ 			pos += written;
+ 			len -= written;
+@@ -1544,7 +1545,7 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 							   frag->get_total_fragments(frag));
+ 			if (written >= len || written < 0)
+ 			{
+-				return buf;
++				goto err;
+ 			}
+ 			pos += written;
+ 			len -= written;
+@@ -1557,16 +1558,16 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 			written = snprintf(pos, len, "(%d)", unknown->get_type(unknown));
+ 			if (written >= len || written < 0)
+ 			{
+-				return buf;
++				goto err;
+ 			}
+ 			pos += written;
+ 			len -= written;
+ 		}
+ 	}
+-	enumerator->destroy(enumerator);
+-
+-	/* remove last space */
+ 	snprintf(pos, len, " ]");
++
++err:
++	enumerator->destroy(enumerator);
+ 	return buf;
+ }
+ #endif
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index 2abc616c37..d8ed26d841 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78123.patch \
            file://CVE-2026-78124.patch \
            file://CVE-2026-78126.patch \
+           file://CVE-2026-78127.patch \
 "
 
 SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"

