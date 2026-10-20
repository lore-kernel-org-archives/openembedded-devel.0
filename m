Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4900.1792494252530288845
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 04:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dbR5/7mL;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd623dfe420so2270580a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 04:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792494252; x=1793099052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quuckHUW88M0c3FHYx6XxuCwr9T1qdVWzn407ExGYz4=;
        b=dbR5/7mLmLF42SkydcVZESOrJYidmCSJ6XKKiHpTdhVm7WV2KYk0Luq+r80ysM/SjS
         mzw4AXH8i+ZD0Y1YLdPEYgY2wbX89CKLlFk0JHUcPlqjiMeR3h+qxfTcrpmNS4BTk5tK
         LgJWmiMhMkpcJcf4nplwan+vJeX39nr+zojoT9Zfo3fnboy8jc4aifRbLPsNNp2zHzFY
         ZrKr5xM+dE6r7pBl7JTJa1hsb1Uyq17na5oeXAMB9q2oCXnyjubZEvEoRMH/Lvebpu6M
         PY/bOMQHBiHc42lI2/xA6qX8bKLJydlO+zO3eXwhJWLucv9AlZZp2xDXUcJkuNhCwycR
         uPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494252; x=1793099052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quuckHUW88M0c3FHYx6XxuCwr9T1qdVWzn407ExGYz4=;
        b=e2sthoux3+veYut1E+++2x6gy5Ukj5L9QUbajyOseMBaqCbUERyzvzsywAHHRoFg51
         AdDHSrCgAjWxFx9mWl4FRaDKjL36KOkAOmnzUXoH2y93yNjNXA7MokbdRlaurwubJg7R
         Wy12siM2coPzPq9FtbaZd0tr8Qqme3siTIcuJ0GQArOhLPAL2v1A8bWcVdfSWUs7kfPQ
         Xb3d39mHxfg+x6gZ6ax8foWOK20cdylCxsY5wuuSNJNsFnjb7GjHjXy33oSdzJXNCnB6
         SVRTHcRginVAumh8uNbFMnEFYN0COq1TwdosnvbR/OiS5iqh91HfYO0BtdMPXyifiBad
         oUhg==
X-Gm-Message-State: AFq9FYJw1jUbr7FN2BMIuwBu7nsGXSnoP/7NXFH05IRZaaLx4YwYgYB/
	W2fsfzqwQpVgs0mSzj7+3LJlZ8U44k8/9pLlLU8cxOcGxeCay4HTtCncls9UEQ==
X-Gm-Gg: AYBFou0N/qqOtYPyUtKphaaYtlChk+e4rlhHMWUiKahYA7K4bcsdQnUWnuZLqrTT63j
	TUmDtP5cjdcwhT8omv68exrSIfQ2PGMFBPZa20qi05jY2ftMIxJ6Ger5mOMyIC4T3IE96kVGJcB
	a5iDoP12li4EfudDV4Q9MTl+CqG93GDZUTFiPXiXqhiY7zb5QgxMSdFPdZDPgnG4r8qEp4JehWx
	J4A1PyXEUL9xCLdN4OZjTKHc/kLODgo/SdVr3Ou+mD6PJapPPuDDpCP57plqAQFBvGOpImobcAY
	ouBgGEBSHf5RHUKKav5vk3QLwIh+Agtyqh8x1yw3f+VeGzFzlDFplBFp9WUcBggaWhSo6h5mrK5
	MmXptoXb0qi9G5fiqabW0/OQDS558EZ6C33YWUQEZDLboo7R+7iCKi/4BUaeDEUKf36d2rZ0WMt
	qtgMCvS6DspYFLmO6EVdVHVuvuryrImzfbp16VkTgaZzhoAE9myFT4AqzdEFa12XdANdKuJLB0o
	5QwCim74RTd9dJKa9mRl1MtB216A9RzvpQffraovkzb/0VnDCGUcScZR7QXgskJpnsiuU59tSaR
	I6HF+ERWTJAsMhUrNkjWn/Tq47q8wZE=
X-Received: by 2002:a17:90b:2646:b0:3ab:9c73:12a with SMTP id 98e67ed59e1d1-3acee277998mr8480194a91.2.1792494251765;
        Tue, 20 Oct 2026 04:04:11 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60f2c785sm3046683a91.7.2026.10.20.04.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:04:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/4] libvncserver: patch CVE-2026-32853
Date: Wed, 21 Oct 2026 00:03:56 +1300
Message-ID: <20261020110357.1995120-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020110357.1995120-1-ankur.tyagi85@gmail.com>
References: <20261020110357.1995120-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 11:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131157
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
 
