Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1918.1795113430312825331
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=h5dUz6Mz;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso775428b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113430; x=1795718230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXDnuMmr3y9gcVgM0wnWPHDyc1JKSKw03AUnG1TJRpw=;
        b=h5dUz6Mz/9TTpbb0biiQEXGHcKojf4aw/5g9HtVncQI0CQsZUI15hefDTuK2nV3dUq
         JqOEdnJT+AaWTxKkJL2/SnI9/BTJWFdGeIB9PShy1/0drpMDx8uGiJ6NIphshf4qleSP
         i74aBqLNospd/v5VMzJfPC5K3WrMwHFTqohrmcWP7p7mmqMviPmU7xhbOQTJhQnzNsnD
         jSLnbpPkBU0UmrJaErp6uS9jPoPDdTcWhQIyEuycsnQWKVGMJ+WiAW4Y2EqwiGlDFgvD
         Xkdgawzfc+DS/D56UgHnsd24BhCZAAlfENgz225p1+8LIUEB38BOcQKrJRdWN++Jx3Ts
         6trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113430; x=1795718230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXDnuMmr3y9gcVgM0wnWPHDyc1JKSKw03AUnG1TJRpw=;
        b=GSByxJEivqBCJ91FPGfZDe8rTI1O0gtf/ZOdxQmPpMC3LK1/eH/nfse5RVfRzyRBIw
         pBWZb6NwnGLmNrsq6FBouyyHs/YjiIu322EwxGiuNBoJMSIkm+Ug9ffovmAMz3hzHYpN
         n8qnSxNClNYTMo0QZAVcaIeb8wIxCRHOxnsro7Sl0gw3WOM9P6/elm2lKI8pczyiQlqk
         1nOc+kJvtLlbXvFUohi291uwE+H6i+thqJgviLB+k+9RbYbLP3zCuIf9N3ltuntOvq5v
         Z0x/UcMpJdG7ynamJSA3slSq60pXTAJUfRL7ipC5yaxm8eHQPV1TbG5vfxyuFvTrnAHd
         1vmA==
X-Gm-Message-State: APuU4Z/TyADYnGk/09eBtsmOgEsSwkb1qq9kr6DyhGnGmwgI/Gc0EOTx
	Jv+D+0IRixrKschxfw0QzmMFg6WV8tVBOfxMfvdjEkW1g8r7DH4a54ib3kOnGw==
X-Gm-Gg: AYBFou0Fy4iM9aPNyA2PPc7pdwajIQJM711GotAAsvm1znzouZPZLejl+PYEzEdWZkd
	hM48O5Uu6Mh19TBZByx5mVruJTEQFVvcjDuYT3LrmgP/dgSqF9nz6qcdex115Plk+fAb736u4Uc
	aL8QpJ4HY0iO4z9ZMrsRJqk+hGAltaRRFK9hlxmWqs0vzsdLAWcfF9RKx/EoNi8Y+6DDBB5dgCe
	W4HMYdFr4kIZnwow/levBj4QTPl8mDDQVkwvDQcMWW1EieiU2kkurCKLf/3Mr/6RFPO9l7bMx3y
	TrCb2299a8l8xdVsBO87onqJsN6b3kzOBQs4lG5/ucwi+GJvMouP9RXMTy5Sz13PCYXISguSkKE
	LnpNjybLGhYMHqEtaPFzwB2Z5zimG82RnFGxDp0PWh4C7l3oXT155KqBP7Edsse9S6I8d9emw2K
	dyGyH5ouNQFqs7c8Kfna60AeAJ/GYO30oBNUrClZ1NTih4qwKMheC7g7LtHRn9/qEcaJUHD24uJ
	2kZS2oJjv/MPJWq1Q3GTbV9Cfv1eUGzGaGs3826d887QcfozpxIazYryNDvD2Z1hqHaxP77VPm9
	i/iHuFZzJEBk+O/XdEAY603S6LaRJT45nC+Tlriyu+dwucX8JT9PDW2n8JnvUQ==
X-Received: by 2002:a05:6a20:748a:b0:3f9:5b4a:5b7a with SMTP id adf61e73a8af0-40149f7bc4bmr363792637.3.1795113429559;
        Thu, 19 Nov 2026 10:37:09 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:09 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 29/64] libgphoto2: patch CVE-2026-120452
Date: Fri, 20 Nov 2026 07:32:57 +1300
Message-ID: <47be0f170ec658f4adb947223069fdc18a8f2847.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132719
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-120452

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-120452.patch  | 40 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.34.bb              |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch
new file mode 100644
index 0000000000..97e2318cbd
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch
@@ -0,0 +1,40 @@
+From 9fe9a565d4755d99255e34384bbb19f2a439b242 Mon Sep 17 00:00:00 2001
+From: TheProtagonist07 <63047129+TheProtagonist07@users.noreply.github.com>
+Date: Wed, 28 Oct 2026 19:19:32 +0530
+Subject: [PATCH] jl2005c: bound thumbnail conversion by the real input length
+
+jl2005bcd_decompress() picks thumbnail_width/height from a device header
+byte and then byte-swaps that many RGB565 samples starting at input+16.
+When the device claims a 128x120 thumbnail but the input buffer is smaller,
+the loop reads and writes about 30 KB past the heap buffer.
+
+Reject the conversion with GP_ERROR_CORRUPTED_DATA when the input is too
+small. Addresses finding 3 of #1326.
+
+(cherry picked from commit 30bf7ace6d47cfe1232ea73bde2aceb95aba4bfb)
+
+CVE: CVE-2026-120452
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/30bf7ace6d47cfe1232ea73bde2aceb95aba4bfb]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ camlibs/jl2005c/jl2005bcd_decompress.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/camlibs/jl2005c/jl2005bcd_decompress.c b/camlibs/jl2005c/jl2005bcd_decompress.c
+index 8c3307fd6..1c8a73c5b 100644
+--- a/camlibs/jl2005c/jl2005bcd_decompress.c
++++ b/camlibs/jl2005c/jl2005bcd_decompress.c
+@@ -123,6 +123,13 @@ jl2005bcd_decompress (unsigned char *output, unsigned char *input,
+ 			GP_DEBUG("No thumbnail is present!\n");
+ 			return GP_ERROR_NOT_SUPPORTED;
+ 		} else {
++			/* thumbnail_width/height come from a device header byte; the
++			 * RGB565 payload that follows the 16-byte header must actually
++			 * be large enough for that many samples. */
++			if (inputsize < 16 + 2 * thumbnail_width * thumbnail_height) {
++				GP_DEBUG("thumbnail larger than input\n");
++				return GP_ERROR_CORRUPTED_DATA;
++			}
+ 			out = malloc(thumbnail_width * thumbnail_height * 3);
+ 			thumb = (uint16_t *)(input + 16);
+ 			for (i = 0; i < thumbnail_width * thumbnail_height;
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
index 488364b542..d8cf86ade2 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://40-libgphoto2.rules \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
            file://CVE-2026-120451.patch \
+           file://CVE-2026-120452.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "51993f5d9bfb6b4e5925cbbe5883085791bff6f81bcacb8ffe1b783ce76d586a"
 
