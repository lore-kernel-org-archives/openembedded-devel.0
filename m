Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4898.1792494248458060135
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 04:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OrYzhkYa;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso2828363a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792494248; x=1793099048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5dlxhYWULY7TJ5uvh5yd2JOP2ZczBQ8SgMUQQkEb/M=;
        b=OrYzhkYaHts6jCEQ5jtQzdtLuJxhi2oGmjH61CCdvuK5IASO2Jk8L7aBhmCUxiZ1Q0
         qU2zM8OyKFSyOKhX7ncWTLB805lD2llYtWXcDxvAQBXbYC+9nc8THoD486bFgBV2/jzU
         CVZXqjbUYNQspdwiolb50//AEc59BIDE3kegde2R3iXiyQ4BrYm8WfRXqU8DCuwhkRAj
         m/4fMRHY4okgebgKxyYZPbnOBHHlsYDJw2ULd751Nfm0gow3E3cqpf1N1reCN2YG5rue
         bmzZYsK9hO6SU3bzS9azrmgwLliUbp/h8e2AtbIeHRhlexrH0/4OeJYLI0/s4I+28Kv0
         NwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494248; x=1793099048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5dlxhYWULY7TJ5uvh5yd2JOP2ZczBQ8SgMUQQkEb/M=;
        b=mofoIwUUDVuPYGio5DC+jsaUL9+sFgoEaxqATnzr10W+Df8Gsa3efq+K+BzCB2ziHF
         u6CJtArth2yVGQUzZFxnUo8vMLlsmp6xb50/NBp23ZT1vq4r6/CkK9ABcYlJ+Ezt4LYX
         NrgH6IpOm3fBiiCg79TvNn5TmAtXolw1HVkAhpx+66ZlWZj5HQjW+2j127cOa8s++Yk1
         q4wj2iwSJX3im0f1jML5O7Kuu8Z4b0dVo0jIIErCJNAtDUm6CkerioQrxx7CkyaPzGkK
         HX6sdm1IoWRDYc4jDe/9bShhjz+3LaWd4UFGkOqxOTePeLUmS2NfSUn5E4gzoVB+yyKr
         8B+A==
X-Gm-Message-State: AFq9FYJ11GEzCjYS5jM5fyw8DI24Whw6KZe23bb7cGtSYVdVjqWI0XSB
	BFykGiQjL80slYWFyWsXu5TSntyUyKVDikWbPpiNOCc4jdIIOQAxd1vdVKM59w==
X-Gm-Gg: AYBFou1NGIfQS5Es0SGTk0ksVCaxKPO2rWiV5k/0DVKTMe2qs6pFngnPPZ5dZS+ybQB
	BbYjmscvzp5uRw1CL+FOI6tt2MjTvhx8RUKx6iiavi4YMbpn5hEowFP+sUKiibv5OXQSKJGPH/9
	IWx9Rmob49t18aiaht8iYX+8bY4GzOztpBYgUrCmlvvLsZ9xYzvWcUvTF6ZMWYPNDU/pXQCCqrr
	2V3OaAN2c+PHgRqaHqr0lotm6XBLQmh4KdeO9/m6kPinN4LFeAvO1ZwlSp9635WWbnUj6BQACiU
	91J+hw8soO/EuNxfR4eMjVD242UV9vgoD4iZI6x/SyBcNjNTOm7YgwLsFHs3jArZmUhN8XsVzro
	UHan6836OgvUcEJrAfpwR+Uptk96xV1uY5kSIOPZhSnommlqp5O4uPsppq4I0UqRLsHQAzqvIaj
	JdgOmN+nmQnWITPkQpQt++SC62kOtjoosuicUMptDDBVjgf6gl7Ertoi/IxHJsZtODFTm6rDl4n
	/D/foydMgA/qfFHlLNrDfoQOWvzawi8EuaarLRxnr92PkBA7w==
X-Received: by 2002:a17:90b:390e:b0:3ac:ba49:2fed with SMTP id 98e67ed59e1d1-3acef5f1d7bmr10327906a91.58.1792494247550;
        Tue, 20 Oct 2026 04:04:07 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60f2c785sm3046683a91.7.2026.10.20.04.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:04:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/4] libvncserver: patch CVE-2026-44988
Date: Wed, 21 Oct 2026 00:03:54 +1300
Message-ID: <20261020110357.1995120-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 11:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131155
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
 
