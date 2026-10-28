Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36068.1793161541790967515
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KP/u2GHe;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso266033a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161541; x=1793766341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5dlxhYWULY7TJ5uvh5yd2JOP2ZczBQ8SgMUQQkEb/M=;
        b=KP/u2GHeOuHjb8Qw9Jyrezr+f9C7iSk3Uonpw148nRq47j7sKPSUoYq7SGR2yO2Vd6
         RWr2jfZiKr8/N6cVvB8j9gj4EAOrlsMK2MQ9N40Utp+gIDI4xZyNmsLVbbs9+4CKdiEZ
         vfLUkJiChwk6yvMtAZqyzxqiJQ5mFo4ma2G3dfgx9/I+I46+fbVlf4/SyoaePNXJTHT4
         eQn8ivxZyOPB/7Hf9aiHQoJj1aM4DxbbWSIjNXRl7Cp4/caVEgLBOTrLx+d8LjJcB+1k
         RiZ0gd2X7DsDqcQuHBYTjn5/paubK+zlYbVahjKKTIJ66R+v3FuK7EsJDJuYgCKkVnkq
         ZOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161541; x=1793766341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5dlxhYWULY7TJ5uvh5yd2JOP2ZczBQ8SgMUQQkEb/M=;
        b=FLmhJoqHcOIR2FFyDio+ztpB2kpTcP76GQwEBEecHAoM2bIwk6LfKRXwI3FA+GGDP5
         Ta7ff+Are82Qi/0o0m/AYO5fKlbZf8eMOSndxPwu7pMY0aywg82/jGbxzBX7I+i3CMGR
         3Ux3DWYrVV2mETLSu7me6yHiBAU6ru4TNZk1C4rdZJ4Za80qh0TETW1q/FXGGD/ee27U
         l+7te6PMkHTrT1Zc35jz551TnYtastaalf7blsIsV+E2kPLlTDbdL/D3n9e+SBXG+seK
         aFq809E2/6DLT/vQQsnYCN/DRuEwluYkTyobKF26zdRfLgn/W8HxmgAfmbLNb0pSvJ8/
         Za4w==
X-Gm-Message-State: AFq9FYJF5ZXt7jmTj4SdETZHf2qtw5odvj/3qPrB2N6v23mHb0Tp6ch0
	tvMc+MnzdsknJy+HYzKDm2Stal7/+xiw21sF3zyAzf8tihH4CrxMvcUqYJ6Q2g==
X-Gm-Gg: AYBFou1vzdF7jUtprLH4wpd0sY/kdjLKIQSeeHizWgPV7438uafGri8M38GQRnBTZbV
	wwKHi+BBPahz8ESjGBGhxXiq1cg2NLGXgYFJs5c8v8acGC58b3N/iWeq2baOkgaXKAeA1mwhFlg
	4aV1UxktgRU4yULWlzZOfAXPAFLjuUViLhx6qaNf9Ge/7JE007AtO5UmicCp0j5Wir3g8VsGw/Q
	MP4Op2HFjtdEeY48xMedAhr6W82sU8foDQ/2GoCv+4gOD/a54rjZK3aQOpn8UiR9N7TS57NRhV8
	+7lvnqkJGcrtOhkyX7KdeX9THhRbIrdLfpoTVb5oYayAJJjXWfn6b/ZTDjxCuABDB0GACWjUils
	UTHNghEzpzWAw3422t1Y0NA1jmy2/tejUVghqV9TgIEhBchjL3OlkjEPAVu5GpSK9U03AIZmSE7
	zNRD52aCMktHasXXvjSJ5vrENZKuk373V0s2tuj+px5D9IsQyyNK0TWuGtUhcjoK6PsT3GX7swW
	J7RbcaHMDSnbvudmGvzu2MoXRHX8K958327Ew223OfjknXDS1dt+TFjw9Ukt7RqKDq8z9GQRWC2
	+DCWseg6UDnOM9QFOrCkQk3u47s/DOKBQ2jsOpWyhuhKFdzn/ww8HTZcRqqLYdt3
X-Received: by 2002:a17:90b:4c49:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3ae580cd137mr887057a91.26.1793161541072;
        Tue, 27 Oct 2026 21:25:41 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 40/60] libvncserver: patch CVE-2026-44988
Date: Wed, 28 Oct 2026 17:23:38 +1300
Message-ID: <4ba15423c73a0e260490a4954936a83ee6abb8b2.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131592
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
 
