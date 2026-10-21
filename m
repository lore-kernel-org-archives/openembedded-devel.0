Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7570.1792575044644955606
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cDJw7W/K;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-18cdcfc05ffso502632c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575044; x=1793179844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quuckHUW88M0c3FHYx6XxuCwr9T1qdVWzn407ExGYz4=;
        b=cDJw7W/KHPIIOsXgqxgs8+0uzXrF8fIwuV79r8hS40KLxYHyYk5BNQYsVQfEutpetj
         RaN20iQVeuwkroRSamXCKxlt3/yN+tl7+1ZMe+USnqn4bcvVZJ4dDSoJ9oszxFVd1Cvc
         1wFVaQSpyFOpvZ256Jz5op0EPYnh2kkcE3paX/COWNzDUwg82IyvJCWU2R3pXQ7+gQlF
         FaDV6WWVSQs+OvF2uR+FU7yY9K+Qm9ChbMVB1FOlkIYnys92BTirSzUPyEVVseb2htIV
         TZ7lbgn2EkK8yGKaQcW+BClwYSltl1eOAFHGBYBGPaKx3TLXUcOoqxiks6S6TOjth50i
         vbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575044; x=1793179844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quuckHUW88M0c3FHYx6XxuCwr9T1qdVWzn407ExGYz4=;
        b=0L/ZXLvy4deFt7RWTieXwhJHOVuCeKW2RsyLX65GEams96VZGJI4pX11QKrL8Xq2Qi
         t97r5pWJxurRGrlRdHolQQ4f/iDbudpzm0fo9MJ220aNtEnMWTkClEpa8ve8h9YO+ZHd
         2ctrE4uZfb05sGRoy2JZpyyO5iIApiqHQEBf/FsxRJQdHfz7JBgzIGPSiCpnV9gFW6hw
         FYz+4C07qNfK4UDRyt6i6Ft9q3sP/IhTUa8YRJ7ECmRzyrsWI9AfnDd76yjfNi3maTzx
         /g9E3zEHYdr0/pKi9AxXCVZuiwjzEMMyKBbSpKiKuAh6tuSgEQeGACmbuk501aP9BXO8
         kt6A==
X-Gm-Message-State: AFq9FYIWwljZgjsRNA81icwzc6UcivF0UcjR/sDEKLBYL0irDO5ix+r1
	IBbsB5ztZZgzq2R958E011KX3Ved6hHPjN17GdwoxSQGwyGD/hHDY5AWFmuycQ==
X-Gm-Gg: AYBFou29agBsqUJF6Fhi8UwsQSnK9KiP6wZjhHSzBFryktLlqJkCoKn0XyJyWUEr/nT
	UnA648YgXSf9ga9gBGdZ0gwED37wqE9xgoq7Xk7QjqtnM7L9yK6RIJ6Pi8+pDcFnaEMM/xyiGi2
	HjSvbT8Xf0+PoIPc+rzjocCB9R20D9VlPvRM8YMHA+gZmSrBs9FvHBrdGu+m9oQyzBFx9u7nee6
	LwZA5ZdskBdBuVDHyJOpWHLaeAQS1C0YYLjFz7/rJUl7nIZ+D/RH0fvgXM6IrUxwEaKtGUvcb6n
	kl221Bjwy1RvGapFktBuXrApUjNe+Pg872B9ckIl0yZVdTCbQkbKlO3C5+b7jFI61GhgTBqsMCw
	2wC3SM2qyEplDmKgnoQG71ylRRJFXTbMKLJkETTXdiGRkQuN9z/uoVTWPPzDi9WjahgsQLJpOD4
	XvlBgDNzWFliZd9atMa+U2ef/OV2gebWPakixNhMWlWSJfMwsh9prYe5vIfxsAtza3CyG3HrfCL
	UM524OGNe1208Q807+gZA7opNFpRlHUBL67fJiBlyB8DrPJMciWkNJ028BKk3VA6U50jRbQKVT8
	jmEQt7DYbnR3GYDjM4Xnr5n+wo8ab/Q=
X-Received: by 2002:a05:701b:230e:b0:176:a225:e364 with SMTP id a92af1059eb24-190a77580damr1939243c88.35.1792575043752;
        Wed, 21 Oct 2026 02:30:43 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 42/44] libvncserver: patch CVE-2026-32853
Date: Wed, 21 Oct 2026 22:28:55 +1300
Message-ID: <20261021092857.3585453-42-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131229
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
 
