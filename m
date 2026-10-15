Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D121CC6B3B
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:10 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33273.1792043109006847487
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r5EsaNT+;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e934449bb0so12232525ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043108; x=1792647908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DMOJ+wdKtsBYkFERsEOue3c/hDi2ukGCx5whtwPoGAo=;
        b=r5EsaNT+tIkAcnlD9hI4jJENBCF8zXIkodnZLNT6vXtDasufMD2RenRSiYFZNSscWw
         B7DiaH7HybMe7UshvD1qM4b9KCilPkA2LEj2hVDU2AFPAh1gx+MDCHEN5okl60Co82yM
         yqOlAR4KR0tF9YaovG9Gd+Pazn5utaQfOOPzv11KgctNcQZ2Jg4i92p5ceIJN62Iiifw
         rn8uBugKuvhFuohcNF7Fi50w1HqD4qIBjxsbipJfAcgBG9Y+vwPCjUzFdl38L6BILOls
         dIKKMGoWM1RlArnlnyYfqVSpzlD+CIa86JgosJ08D5WOgELt6LN+bGG2gNQtAj0BXFLZ
         L3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043108; x=1792647908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DMOJ+wdKtsBYkFERsEOue3c/hDi2ukGCx5whtwPoGAo=;
        b=v8wVuhYxzPjy+tEpx1py6Wd/NlAYVVovhI9WfkpfgTTs/SkakrqyUcVODeJtQkIXnQ
         6TrghrOf5cTfrg2vN+WKs0Rvz4gULiY85FzmqxM+x72otMiZt93gM3AxOO9bi2CC22XF
         oivTd2XOUcMGNSm2WJwQfiiX3aqjLbNQFVwdNYpBPXv8orAqylYThqc3g8O3rZky7fVX
         4swzYpFPqoYwRDGCU5SZSqdFsnoEgnEC1mcFeyRtA6Mr6S7lqWtqW7QBDrv9AL3YxaYT
         /1FUrEKf3p65SkXkB25wdP9zTeBRdAmfcr0T3v8i6oqgEwt4bVjSq+8LCPy6k52AOrYM
         CRfg==
X-Gm-Message-State: AFq9FYJlfoLiGklEtLSvMb59vx82Ud72f5ydKjlrUhDNCmTV0e9k8e8l
	itdfUwzsbBkWNu7WWVN7VJY7yAfgpFUT9zihbM3yZWAeZg7r7l+mrpKPi6J4+w==
X-Gm-Gg: AYBFou2Nxi8uKmVTNH8Ot6DkRhv7IVnWRLVhmZW87fjZlOifSbpuboiApUmrF81PhMU
	7HZCPu+EAR2SVkOtd50vhnYDgHR+TDpH68bsR/lTEWksq4YQR/hFB7HBZDTc+NZ6Y2ljdYleym1
	AN4BHcbVYxA6iWLCN4/FXeJayoSgsOWCF3zc0b/vYHIg16WjWH2dScLfrnoOjmgXS8OTKiBTi8Y
	s5yJO3XpXPUFuxSiPubAn/SOsZ4woO5XNiFxYxQi+5FPf7ccNvfkohISG4hqJf6Mu3wCh7sbjoI
	xjZDh8MZeWJDOEsGYPBP4m7AsagRf+/N92CLrTXduuVg4jMX99KzEbE8u5f61vVRAqxL3eV6yb2
	kZIHOvnwNIT1dOs9/CukcFkujF3wZpHzEXJdCypkihjgfX5zPTvIdwg90Z/BJokpQ/kdLqfIHjF
	XXhWmwyogtxXT465Znc70t1O+lkDBq0hs/3QAHffNBJ/NEoMUJv27ksBU/GAkGBOPO9cQHaH2Hz
	M/h7EkM/2y9zfiqRrQCbe0=
X-Received: by 2002:a17:90b:35c2:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ac7c52fe5amr3124149a91.50.1792043108197;
        Wed, 14 Oct 2026 22:45:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 65/82] strongswan: patch CVE-2026-78127
Date: Thu, 15 Oct 2026 18:41:53 +1300
Message-ID: <22d52d3b4230228ab48cdd1a2bc758b28211fe22.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130985

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

