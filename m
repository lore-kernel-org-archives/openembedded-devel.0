Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36216.1793161546191393654
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PLNzSZfr;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so221668a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161545; x=1793766345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quuckHUW88M0c3FHYx6XxuCwr9T1qdVWzn407ExGYz4=;
        b=PLNzSZfr9q7RSXr8Tg1gD8Mubz5WdESUPLB3NNCKbGJ6mwpOxpmvlascYnFnrJ7NKq
         BM5qQus7GB/BwGAikNTJMQSGX03iejb+IglRWtAYHtmVUFBnyqocGx9+qquJEDbnUvvw
         q97WA2v5lOq//mn9FN+WmIdaoi4c/K1xdEuOu7CglLzZvPSUBcLRqFEkcg8vxJTDOr8Q
         YP9qS+somApUApRU2SWE9P1x03T5NQta8IXWEY5dRsYNLiAEt4ICJqpXfZw/wNzVVanL
         Z9SzUsWqqf3BlCB5CkMNODcOqkgilSy2Op3+U2JntywalDjXFxZeMchvNLpa/AEKQgWn
         WYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161545; x=1793766345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quuckHUW88M0c3FHYx6XxuCwr9T1qdVWzn407ExGYz4=;
        b=V8usJpz0c/U+V2zfXyGyOMyFhqjQykjh2GOXHMFtmV9Dkexu3hpoYHJu0MUlCVYJ0a
         QksymenNcV+H5T12xAcfOVV22wU85bUUj+dTMIjwk2lq38pyjWkebqyTU0c+9qpocIDt
         9lY6FnWR7bfZccAFNGkihxqZNh71lJUw2Irg5oQYzR7FPsNELM5l18WQXAAluzL9cy60
         cO3Xy8w0sJFdTUZZ8rEPU6zLEyMBBgQPUT+c+3jqm6NFfnS/UV8kPJmJXUX9AW3YyjmD
         YI+jvI6/BW1YOYE2mqytJMNCqGg2wIzQldlgvLpAbcEO7vTPkpXwe1AtOCjQIJxBcU0J
         p0kQ==
X-Gm-Message-State: AFq9FYJDPyHGMr3uxEYJAtdUln0E8vSa1yzKOIk5NO2s6TzsPy8lIsKs
	vPkRxgeg2HqmnKB2DWoshMDROi59nXzuD98BIl0Fu0wsoI+Y3d5DYtqaYj6FZg==
X-Gm-Gg: AYBFou08qTt8zgvC8/tT4iIHEazX9/lIjvqelH+6+Vp7Jho9eTaARds2M1zDzAC2hwy
	J8vMpLa33Im4ii+sIDtdGZluuA+Y16psbzYwnOcnn+yiJzq2patq8AJJUynLrkiA73WOx0o4X1b
	S27OXx/dnRj+4sxmYIoVAC6NFMNxLgkAsc+K7Xpl919obIMsMsdt6ocYv/yLUmsi2FxpT+Hgs6h
	WsYYVtYNCZzILOGt48R3Mjm2/wGZN8iphou1CKgTlTMnYdd4rVndSLpue1iDG1Mwr39q64bcXDQ
	PBPz3TxF7MjfAoX7/bbmyA6vWXXcGPvolZuI0FoAlYG2RyXw0WcVKzRHyKtkKQggHKHzipTFlrA
	Tkhj4OV8752pfWD+CV+WLwuzHD7yprhE+SIomYgAzWqbXq7rHJD2TQzVTcvP7qBl904OqFTHpGU
	n8woHBBHx4b9sL2b6c1cLBJL24sPo22mpCrzIbjoW0bj1Qa5nscJTNo3/O6d8S3IECTPW6z0og1
	DQTISKnivVDKMIVV4MhhWUby83o5IUoYTBI12EZtlCCD2wZogaF/b1izOFD3v73v+9WxcDb0KIR
	G4bwVZWWGjHJV/ds20l+edzKBYYTpyhjenRosSMO4CeWjkPYJ8eH7APQdlWj0w==
X-Received: by 2002:a17:90b:4d0e:b0:3ac:af8d:c839 with SMTP id 98e67ed59e1d1-3ae5822f6a2mr860040a91.35.1793161545503;
        Tue, 27 Oct 2026 21:25:45 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 42/60] libvncserver: patch CVE-2026-32853
Date: Wed, 28 Oct 2026 17:23:40 +1300
Message-ID: <105c0a7d4bae8ed71f4fb95973e660940163dc6d.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131594
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-32853

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libvncserver/CVE-2026-32853.patch         | 76 +++++++++++++++++++
 .../libvncserver/libvncserver_0.9.15.bb       |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32853.patch

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32853.patch b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32853.patch
new file mode 100644
index 0000000000..23d6a3df1f
--- /dev/null
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32853.patch
@@ -0,0 +1,76 @@
+From 4d5c0ea960e4a22cd8b8fb3c6e18b5a1b1797783 Mon Sep 17 00:00:00 2001
+From: Kazuma Matsumoto <269371721+y637F9QQ2x@users.noreply.github.com>
+Date: Sun, 22 Mar 2026 20:35:49 +0100
+Subject: [PATCH] libvncclient: add bounds checks to UltraZip subrectangle
+ parsing
+
+HandleUltraZipBPP() iterates over sub-rectangles using numCacheRects
+(derived from the attacker-controlled rect.r.x) without validating
+that the pointer stays within the decompressed data buffer. A malicious
+server can set a large numCacheRects value, causing heap out-of-bounds
+reads via the memcpy calls in the parsing loop.
+
+Add bounds checks before reading the 12-byte subrect header and before
+advancing the pointer by the raw pixel data size. Use uint64_t for the
+raw data size calculation to prevent integer overflow on 32-bit platforms.
+
+(cherry picked from commit 009008e2f4d5a54dd71f422070df3af7b3dbc931)
+
+CVE: CVE-2026-32853
+Upstream-Status: Backport [https://github.com/LibVNC/libvncserver/commit/009008e2f4d5a54dd71f422070df3af7b3dbc931]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libvncclient/ultra.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/src/libvncclient/ultra.c b/src/libvncclient/ultra.c
+index 1d3aaba6..5633b8cb 100644
+--- a/src/libvncclient/ultra.c
++++ b/src/libvncclient/ultra.c
+@@ -126,6 +126,7 @@ HandleUltraZipBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+   int toRead=0;
+   int inflateResult=0;
+   unsigned char *ptr=NULL;
++  unsigned char *ptr_end=NULL;
+   lzo_uint uncompressedBytes = ry + (rw * 65535);
+   unsigned int numCacheRects = rx;
+ 
+@@ -194,11 +195,18 @@ HandleUltraZipBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+   
+   /* Put the uncompressed contents of the update on the screen. */
+   ptr = (unsigned char *)client->raw_buffer;
++  ptr_end = ptr + uncompressedBytes;
+   for (i=0; i<numCacheRects; i++)
+   {
+     unsigned short sx, sy, sw, sh;
+     unsigned int se;
+ 
++    /* subrect header: sx(2) + sy(2) + sw(2) + sh(2) + se(4) = 12 bytes */
++    if (ptr + 12 > ptr_end) {
++      rfbClientLog("UltraZip: subrect %d header exceeds decompressed data bounds\n", i);
++      return FALSE;
++    }
++
+     memcpy((char *)&sx, ptr, 2); ptr += 2;
+     memcpy((char *)&sy, ptr, 2); ptr += 2;
+     memcpy((char *)&sw, ptr, 2); ptr += 2;
+@@ -213,8 +221,13 @@ HandleUltraZipBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+ 
+     if (se == rfbEncodingRaw)
+     {
++        uint64_t rawBytes = (uint64_t)sw * sh * (BPP / 8);
++        if (rawBytes > (size_t)(ptr_end - ptr)) {
++          rfbClientLog("UltraZip: subrect %d raw data exceeds decompressed data bounds\n", i);
++          return FALSE;
++        }
+         client->GotBitmap(client, (unsigned char *)ptr, sx, sy, sw, sh);
+-        ptr += ((sw * sh) * (BPP / 8));
++        ptr += (size_t)rawBytes;
+     }
+   }  
+ 
+@@ -222,3 +235,4 @@ HandleUltraZipBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+ }
+ 
+ #undef CARDBPP
++
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
index 9fbec58c72..e2f995947f 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
@@ -48,6 +48,7 @@ SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https;tag
            file://0001-CMake-require-at-least-CMake-3.5.patch \
            file://CVE-2026-44988.patch \
            file://CVE-2026-32854.patch \
+           file://CVE-2026-32853.patch \
 "
 SRCREV = "9b54b1ec32731bd23158ca014dc18014db4194c3"
 
