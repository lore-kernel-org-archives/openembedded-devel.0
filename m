Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E32C9832A
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 00:39:50 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30000.1790469588423674248
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 17:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I4fOJQHk;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so1027671a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 17:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469588; x=1791074388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vRhbPfu/diBys2eiwnkaQPpGzgrjxQ7ZK+5VlNahfw=;
        b=I4fOJQHkdz8fNvxPdVFXKUDxb64AhWLAuIBf4ti03qOe82cRnHCct48+2+poZs5O6O
         kRafeywC+iJSkuILkOgeb6mrkaXx624MGrK+uMxXrJLhV/L+SPeG8PpxDul1bZAnYBvQ
         uyEefjjcsLeb+KVoRu7z7MnSpUqnBu85oVBC9RQIVYlpmkMXXHk+jp/4ZCIB7cGQccgA
         QBEARYJ5N9t7gfgQ0KmDGB/MgviNRUQY79Y4e0kGjuJQYb+EK7RmaoISCKQPShyDMfpO
         dSNceKbK8+KwuKYkOPbHywZ8+S22Hji4qstVsMT2TzmlE82dJYIwDo7KQeGSJ0gNKtZr
         3ZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469588; x=1791074388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/vRhbPfu/diBys2eiwnkaQPpGzgrjxQ7ZK+5VlNahfw=;
        b=PAwHP1VP1qlvAKG2lMuOYBEtmcm1uIJC19PJ8pwEB7JCvbGBjPCQnNnG503FI4/Rua
         62vx+mpNWVKGw+m9lHeLbF5pkJTMLl/3EwZrni4EcPzs5N/crZ9YEwanDZSUx0i03vE6
         zPT6eLmn4JpZxx2E6vq2p9lecfTxBPUGl9YpqyEi8XaZlUdiutW3NWx6Vkj1PMIZXd0O
         S4t5nmRuaP7DOhwB3cmH7rUb2eYVZTxlELj8rRtlihMBAq1nW8w2txMvmkhHL+5yDanl
         gO8a+KvTyLXgsFZFKczCzIvxvK6Npwi1I+9TMt6TGf+aYKSU46j1GvplPwMzOZOp+UrV
         7U7Q==
X-Gm-Message-State: AFq9FYIBzs9ur7qCYnwB4aGl8fox54YjuWpe6ixOBFqRmsYkaMZWv1b/
	L2TGMLjs9JiQAErdosS4WYMsqVG1seTggP5vT76ejgbGLqKxj2hKtTa1fB9oiw==
X-Gm-Gg: AYBFou28obF1lT5QL4aGcOe52yf6J1JbbIIK1bm//uU4cKiyFjUVo/1ob44tbB9KA6M
	x/Q+gNKJKZuTTbNLTSQQFppHS+mG0cS5E4hE8SexyrWN2IHpA+DN04ry638kUiopR4Ri1vYR183
	t8vzdEqK98+y71tawMvy1Vluc4ywPsXCuWAExzgW7fEJ1qUTC6u3NuwPwjCm/jQ2syY4x381rtQ
	LbPvHyfMKCSZDIZHMqO7hJyB9tG1Rm7LhFNEm50re+78LegeNkTQDqNuLt/fo7ZXwysJLyhAI00
	ur5/iFAIgmXvU+hm91cRJgU6Wz1dCeO+AEM09Nv7fA+r8C7/8ZeQrA/HkT+6A1CK2FzlESGR1S5
	FTID8zLxsTCqjsKMJ+Bln9GXm/HqX0TcBHCQPxaDO69/Aql+xqdAz9e27jRfV7Nga7PaKlyQ/XA
	e5idE2080ArJt9cTUvRML1x18/7Py7JoRu1YUhgHRNPUhv/OQtVtu0WQ2bn8Bxoct090b0OWII1
	triknVgP2SX6yLmRDsRoLOtPaf1hytNzw==
X-Received: by 2002:a17:90b:2704:b0:3a0:ce02:6dda with SMTP id 98e67ed59e1d1-3a0ce026f76mr2179744a91.19.1790469587761;
        Sat, 26 Sep 2026 17:39:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm2876420a91.1.2026.09.26.17.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:39:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 9/11] freerdp3: patch CVE-2026-85090
Date: Sun, 27 Sep 2026 13:39:19 +1300
Message-ID: <20260927003921.746786-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
References: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 00:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130328

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-85090

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-85090.patch     | 59 +++++++++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85090.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85090.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85090.patch
new file mode 100644
index 0000000000..ee3077c1c0
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85090.patch
@@ -0,0 +1,59 @@
+From 22476c6898945934fb86b1672a372894fb68a111 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Thu, 13 Aug 2026 16:09:28 +0200
+Subject: [PATCH] [primitives,yuv444] limit data read to actual height
+
+(cherry picked from commit d0a481cb74ab57bca24791fe11b89464a332d3f1)
+
+CVE: CVE-2026-85090
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/d0a481cb74ab57bca24791fe11b89464a332d3f1]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/primitives/neon/prim_YUV_neon.c  | 3 ++-
+ libfreerdp/primitives/prim_YUV.c            | 3 ++-
+ libfreerdp/primitives/sse/prim_YUV_sse4.1.c | 3 ++-
+ 3 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/libfreerdp/primitives/neon/prim_YUV_neon.c b/libfreerdp/primitives/neon/prim_YUV_neon.c
+index f44016cda..3e74c7ea1 100644
+--- a/libfreerdp/primitives/neon/prim_YUV_neon.c
++++ b/libfreerdp/primitives/neon/prim_YUV_neon.c
+@@ -668,7 +668,8 @@ static pstatus_t neon_ChromaV1ToYUV444(const BYTE* WINPR_RESTRICT pSrcRaw[3],
+ 			pX = pDst[2] + dstStep[2] * pos;
+ 		}
+ 
+-		memcpy(pX, Ya, nWidth);
++		if (y < nHeight)
++			memcpy(pX, Ya, nWidth);
+ 	}
+ 
+ 	/* B6 and B7 */
+diff --git a/libfreerdp/primitives/prim_YUV.c b/libfreerdp/primitives/prim_YUV.c
+index 65a5a8dd6..0db8c0e68 100644
+--- a/libfreerdp/primitives/prim_YUV.c
++++ b/libfreerdp/primitives/prim_YUV.c
+@@ -146,7 +146,8 @@ static inline pstatus_t general_ChromaV1ToYUV444(const BYTE* WINPR_RESTRICT pSrc
+ 			pX = pDst[2] + dstStep[2] * pos;
+ 		}
+ 
+-		memcpy(pX, Ya, nWidth);
++		if (y < nHeight)
++			memcpy(pX, Ya, nWidth);
+ 	}
+ 
+ 	/* B6 and B7 */
+diff --git a/libfreerdp/primitives/sse/prim_YUV_sse4.1.c b/libfreerdp/primitives/sse/prim_YUV_sse4.1.c
+index 6fed9945c..9ab1762a8 100644
+--- a/libfreerdp/primitives/sse/prim_YUV_sse4.1.c
++++ b/libfreerdp/primitives/sse/prim_YUV_sse4.1.c
+@@ -1534,7 +1534,8 @@ static pstatus_t sse41_ChromaV1ToYUV444(const BYTE* WINPR_RESTRICT pSrcRaw[3],
+ 			pX = pDst[2] + 1ULL * dstStep[2] * pos;
+ 		}
+ 
+-		memcpy(pX, Ya, nWidth);
++		if (y < nHeight)
++			memcpy(pX, Ya, nWidth);
+ 	}
+ 
+ 	/* B6 and B7 */
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index 1c46a8b9ca..6270ea6a2d 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${
            file://CVE-2026-67288.patch \
            file://CVE-2026-85089-1.patch \
            file://CVE-2026-85089-2.patch \
+           file://CVE-2026-85090.patch \
 "
 
 

