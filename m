Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF00C98304
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:33:42 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.728.1790224418577209366
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FHJyYJl/;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso749657a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224418; x=1790829218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuAzQ3+RWfDXmSNzIjK5ByVvA5oNALsqD66ou7Sr9Yc=;
        b=FHJyYJl/hxf+rZTpEV3JMaNr9XXTQmDoyOGDTK7XGaaZYZr42lbqapEsrgSIadepCK
         /wk1LHKTk5YTCvrbHig0AdiB2TwOHKVgh/bCDnjO7SGxaz45H/FoYW7B5AZ/VhpDEnXO
         eQJowAF3ontHSw+leTJzs7kr0/6IfmNF/vrJp7yTxt5NrTak6zXGhh/uwUw4zx4GlcFd
         ETP/ucn51rX7/cite1DE8PhRDnjluaH4pMIvNWFSSegYpaMJzuzBRRSrYvFwjXqcirRP
         +y2XYWTVKM+klUMHtZ/4c4Qh0ydjgzPKyidhx3S6q0an7vb0Mj2YwneabiPUHB9Z+Doi
         kV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224418; x=1790829218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KuAzQ3+RWfDXmSNzIjK5ByVvA5oNALsqD66ou7Sr9Yc=;
        b=hZ2gPVXpAaa2AbTgoMCXMk3yT44xuMqanT3DVcdbXC8FU/D3eKUzeJq68cH3fozztE
         CQUnJfbxtEYaki3PCk2M8RfBLdpPeQQ7zA39m5aFrc9VAlMvG8RsrF6cgbnEPgGzpQIr
         xDJOKG26x3pXTz/crOKsPe0WkGnCe/Tjbw+j3Rl4nAZKWgCIxEX+nX6Ez3bnTAe1sYZ2
         joFcM7bUhrzlVR/Q1zKdafm/zlC/Z+CCwLBUQJxR7JN8r4Gxd6/7QpUuULrpm5tUa1bc
         oligH7VbD/zLAq4jDQF6PPdyoA+6DsBVXqKHH2564uZrz1BsESMlKgG2xASbbNgb2wpZ
         jlsg==
X-Gm-Message-State: AFuF++ng4FcHYRREJ8nSmyeh427QruXk2kxbbRkWinRI31FzlJEBoPwD
	/PnQyCtqnQiEhxjvrJHQQP/0//ZLAiajZV5N0aq0vNfy8c3G3m2cYap4OF/mIA==
X-Gm-Gg: AYBFou2VfQ8PiuXhcTAKNJ3n0e+CSzbvdgxA4+nY/88Zop6NNnFgw5HEO1IdaACMuJI
	twDS3XMz0zkFX3qdWhK1A4I+XA3kTtiFZtMgVKafPWHRhmmzr0VOvU3lSGhymyd/BYoDzH0xwln
	A1d++UJSU31XZp1iHxANCMXNnKDGjT9fUxAHvWS4SJjQXYy4NGb8eLPo/JoOHPPCgh+fwlgEd7k
	tajmGKWgEXFKjPKG0MwodHMb6eZfvtxKfUDSl37DJWn23xqHXm0R9bINBht9SH3k6LTSVMwN6Rb
	jIxgttdfIvhJOZOibjgBI0YhuYRLrJOCprqei0NCN6gi6MkGKddfkHgADwEjTxXGjNJM9Ks1UWc
	MWqfzmn2trL81ku8VrOdVgcWa/9eSBksiWEFFE6iDQDyeVwNLLdU79u8EZ8S9RAU5cZZjbN5AeT
	1dd9P239sgaCaLWwISfxAC2qYYzqbwhJwAjrkJZq9LiSXXGMNv6lD+bNjSKopVA2SoSccPGKMmh
	w+cv4kmZ37x29feQ8aO+bXfVNiKfIANGA==
X-Received: by 2002:a05:6a21:6e86:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3de0e708e51mr1206497637.12.1790224417768;
        Wed, 23 Sep 2026 21:33:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:33:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 8/24] strongswan: patch CVE-2026-78127
Date: Thu, 24 Sep 2026 16:32:58 +1200
Message-ID: <20260924043315.1663186-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130256

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78127

[1]https://download.strongswan.org/security/CVE-2026-78127/strongswan-5.3.1-6.0.7_message_log_leak.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78127).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78127.patch           | 115 ++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patch
new file mode 100644
index 0000000000..4f1358e59b
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
+Upstream-Status: Backport [https://github.com/strongiswan/strongswan/commit/4b7108ac0f84fbf40da2b510eb6333afa2a54240]
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
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index 82dbd3367c..2637c19d1e 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78123.patch \
            file://CVE-2026-78124.patch \
            file://CVE-2026-78126.patch \
+           file://CVE-2026-78127.patch \
 "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"

