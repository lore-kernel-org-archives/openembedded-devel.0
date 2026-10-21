Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7566.1792575039549645228
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e/hVtwDZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15354aa70e8so1573127c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575039; x=1793179839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5dlxhYWULY7TJ5uvh5yd2JOP2ZczBQ8SgMUQQkEb/M=;
        b=e/hVtwDZeqA5WU35UTEbp3O5ahkRqf7zOlqWbCyRmTb8hPZE6/bVyDRIb8IZCs0cwD
         j1jooEZPLk68VegHrD5J+c4//fXR3N8A7KutUaFDPKc5Oo2c+ADn7UJ3K8ODS2FAeuxJ
         m/A4XVnw4EOvbDUECpgLE0/4OPZN9TwPBdffQaIfzntyyXJQSF4oWzC9kroowZ1Vr6S4
         VkNGVJVZsRl3oR5lJMqxQr1MERF1QiMArj553y55J/pyjPaXH4OoK+vS/Ql6+uUwxj8V
         a9NUyQKzlWMn5G/kII3qzrsjijrwdV9Brvv4COL3/f42up/HpUUbe5KAishEWgVNRLHN
         awGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575039; x=1793179839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5dlxhYWULY7TJ5uvh5yd2JOP2ZczBQ8SgMUQQkEb/M=;
        b=XmJ7bNWPidD3InT3PHmJ4OhpRRea3IdTUSltOHdMz0RjYJIev7RBp9sUu+yDm/8efN
         jFa5xhDa5mTNQMTOzvA9vKS0e+zeAMcJyxN5WraJyPBGpEXISW++THGnBHnxdaqJvcnw
         DB9Tg7lgFECjn1jI82D08LyC8TBRTO/VOSicrxFpPuSPnayyxaivkjYVyLCWixm3M4oo
         gu823gGC7rNrvmcHnvky+GbVHfBI6Q+DLYWNZd1smytVvdP3SKqzN2j0/EmepbEGRRpW
         /+tWweGWo98Rrf9DnZawp1jxdcyjFJf527ieKrFYUjyk+QD8EDl6zRXld72jA+2PPOzh
         eBBg==
X-Gm-Message-State: AFq9FYITs+LsEm0TayHzod9eiNId08tNm6wtSTX4HOOUwHoGYI9OHGgi
	JRkpuvMzT4ZQNzfpXPkBFgAC02m+UaOPcZvHaN5U5CwThtEYoiSxI1b51rb2Kg==
X-Gm-Gg: AYBFou1/vFp85K5CmRLRhFCHzlb4k6H9BPnO7OMcW66K8Nkk2WELKSI968p6Dye9vd+
	IqFgxEHqwNQNa+VvLd+LQvGFm89pNiG+RK/RVjsPhvK/yIcmZDQjrKeD2D3QoCUZ4NVyFBFxWOE
	sTFBtzgNm5B5+XdC9YWkVv/BHbJLuBBtsZHBEiXg6MA4SDgnrRSg6AbQ4rOdQgOZMS+FcvtTEiB
	wYDMZkt9BCiUTQDSSKp3ABEUNN0b3QmU4PGEGJXzIWjEVaX8OWQ0l2Sh+RbOPYqQmJgn+0sxUuH
	+FLKFocu9NzVgRSJL6/uPdm+XYvGIJ/xsPYtfaBmV7IEt7pSuTiuhMknkocQUNZno5g2hGima7O
	ReDGGrSN+zlShl7yoE+n8t6cue4bgf8yJt/xTSlrUg1zvWQiEr4GnbYhSCaWW+oU2x7fOKhpCg4
	YsgU0JH0H3a1DySqwMSo00cjjVXGkn9uv6mWElAHdhglEcXWg6ZpsnGaqE4oT0Ki+6NRE4Akujv
	jOFv+ZqgGsRYxYCnI1Dbd8DXQKo3pQt/WTWUTXTBgy5YdQSPvOLJJ+nJyZxFCYp3PFUXwv9kau8
	8lK9At7hsu3MVheadMuViminFuGJTZU=
X-Received: by 2002:a05:701b:454c:20b0:151:5d01:9316 with SMTP id a92af1059eb24-190a52e25c3mr1853831c88.23.1792575038571;
        Wed, 21 Oct 2026 02:30:38 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 40/44] libvncserver: patch CVE-2026-44988
Date: Wed, 21 Oct 2026 22:28:53 +1300
Message-ID: <20261021092857.3585453-40-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131227
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-44988

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libvncserver/CVE-2026-44988.patch         | 71 +++++++++++++++++++
 .../libvncserver/libvncserver_0.9.15.bb       |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-44988.patch

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-44988.patch b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-44988.patch
new file mode 100644
index 0000000000..e26abc9db7
--- /dev/null
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-44988.patch
@@ -0,0 +1,71 @@
+From db5779f2bec717f577fb66321b3b079ff156da95 Mon Sep 17 00:00:00 2001
+From: Kang Hee chan <24s101h0659@sonline20.sen.go.kr>
+Date: Wed, 6 May 2026 21:48:54 +0900
+Subject: [PATCH] libvncclient: fix Tight gradient decoding overflow
+
+(cherry picked from commit 5b270544b85233668b98161323297d418a8f5fd1)
+
+CVE: CVE-2026-44988
+Upstream-Status: Backport [https://github.com/LibVNC/libvncserver/commit/5b270544b85233668b98161323297d418a8f5fd1]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ include/rfb/rfbclient.h  |  3 ++-
+ src/libvncclient/tight.c | 10 +++++++---
+ 2 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/include/rfb/rfbclient.h b/include/rfb/rfbclient.h
+index a974ff5f..666dcb90 100644
+--- a/include/rfb/rfbclient.h
++++ b/include/rfb/rfbclient.h
+@@ -314,10 +314,11 @@ typedef struct _rfbClient {
+ 	rfbBool zlibStreamActive[4];
+ 
+ 	/* Filter stuff. Should be initialized by filter initialization code. */
++#define TIGHT_GRADIENT_MAX_WIDTH 2048
+ 	rfbBool cutZeros;
+ 	int rectWidth, rectColors;
+ 	char tightPalette[256*4];
+-	uint8_t tightPrevRow[2048*3*sizeof(uint16_t)];
++	uint8_t tightPrevRow[TIGHT_GRADIENT_MAX_WIDTH*3*sizeof(uint16_t)];
+ 
+ #ifdef LIBVNCSERVER_HAVE_LIBJPEG
+ 	/** JPEG decoder state (obsolete-- do not use). */
+diff --git a/src/libvncclient/tight.c b/src/libvncclient/tight.c
+index 57a3715b..dad5514f 100644
+--- a/src/libvncclient/tight.c
++++ b/src/libvncclient/tight.c
+@@ -229,6 +229,11 @@ HandleTightBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+       bitsPixel = InitFilterPaletteBPP(client, rw, rh);
+       break;
+     case rfbTightFilterGradient:
++      if (rw > TIGHT_GRADIENT_MAX_WIDTH) {
++	rfbClientLog("Tight Gradient rectangle width %d exceeds maximum %d.\n",
++		     rw, TIGHT_GRADIENT_MAX_WIDTH);
++	return FALSE;
++      }
+       filterFn = FilterGradientBPP;
+       bitsPixel = InitFilterGradientBPP(client, rw, rh);
+       break;
+@@ -430,7 +435,7 @@ FilterGradient24 (rfbClient* client, int srcx, int srcy, int numRows)
+   CARDBPP *dst =
+     (CARDBPP *)&client->frameBuffer[(srcy * client->width + srcx) * BPP / 8];
+   int x, y, c;
+-  uint8_t thisRow[2048*3];
++  uint8_t thisRow[TIGHT_GRADIENT_MAX_WIDTH*3];
+   uint8_t pix[3];
+   int est[3];
+ 
+@@ -473,7 +478,7 @@ FilterGradientBPP (rfbClient* client, int srcx, int srcy, int numRows)
+   int x, y, c;
+   CARDBPP *src = (CARDBPP *)client->buffer;
+   uint16_t *thatRow = (uint16_t *)client->tightPrevRow;
+-  uint16_t thisRow[2048*3];
++  uint16_t thisRow[TIGHT_GRADIENT_MAX_WIDTH*3];
+   uint16_t pix[3];
+   uint16_t max[3];
+   int shift[3];
+@@ -705,4 +710,3 @@ ReadCompactLen (rfbClient* client)
+ /* LIBVNCSERVER_HAVE_LIBZ and LIBVNCSERVER_HAVE_LIBJPEG */
+ #endif
+ #endif
+-
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
index 77612e1626..47e42cd094 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
@@ -46,6 +46,7 @@ inherit cmake pkgconfig
 
 SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https;tag=LibVNCServer-${PV} \
            file://0001-CMake-require-at-least-CMake-3.5.patch \
+           file://CVE-2026-44988.patch \
 "
 SRCREV = "9b54b1ec32731bd23158ca014dc18014db4194c3"
 
