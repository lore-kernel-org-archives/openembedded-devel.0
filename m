Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC233EC1132
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:19:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2741.1771874337833428277
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:18:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cwvP8eP1;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483abed83b6so15080345e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874336; x=1772479136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTRaA8Lk/KgoUc44s0fDmWITnMR1fWWfVOakw0V2Ymw=;
        b=cwvP8eP1Z2d1AZJXFl+gO7X+QjwEOkNo2C7lPmRZ6adnX4vuWsjX9H5VL0GTMTz43r
         Jwm5AfygnEkcJxyr5ocq2aJe0e572mWOOgudzMWnhtldmtOKJseRWyo17hIp+UPEoAkc
         9zxEXYXTNw8pr9K5yLA3rL8/iMYk+5h4ZvkBKGMA3yHYP3JPM5U4mnmNzEXFwgsAqHCj
         tsw+bRRZOLPCmk4+zZeaSvzHP1l3lIHSibUJg9XzFs5DxGL6VYia8qvui0Ac8+0xKYBw
         5r46ZJ36H5BoiFK8aJxpISL/uwsAEvEvxzI4NhzuBQ2h1Hifp6c8Jzxebejy6zgANt3M
         qONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874336; x=1772479136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MTRaA8Lk/KgoUc44s0fDmWITnMR1fWWfVOakw0V2Ymw=;
        b=ocDfqA0TiYvVx1cmYVt2uab3dncbsG9Cclr8CCUyUHjlCcRmH4SNq2+DZ38GRIXeZe
         jyo1zUAYrzoH1OnQNzvQYPrqLMwRR1bQSwQv6uu9kicFG/tKWKylomF4icm5Mjoy8Gut
         CQo8JW4vHvNbw42lBQWyXapvL9TMkDFOjNvUE6SbS/cYzlYIi1aYWp2zdFs5BSh2LDyn
         vVPj8k2U1P5KapjllW/4FPV0sqGLQefZafoKcCzUwrBGQECcMEWcNrdZh/cEV25lwOD7
         Bh2JnhzoVxReL4V6aGscFTSOEVOtygLCb7gGBWyye1UCK9MG3vJFmi4Dc7dO6jis8gJp
         wZ2w==
X-Gm-Message-State: AOJu0Yz48sMGOVZAF+NZmACAeCkWzB5oe3cbhy+rTrT2ds83WQvRMGP8
	I5Q23EdxH2EQ80JKFJsVWMaLZz3BcijLGXcDGc0nZvpz5xmkIa7J1fe7HnX6iQ==
X-Gm-Gg: AZuq6aKbvba0DE94d2p27IuWw/fSwhkARQTI3J6rdWTVUeguBquCDPS8qWvW1QivqtG
	a5+Ja2WXz1Unv/m80TfHpI9+2shBvZiOMa7kNXul1hOBJ25BqfvvKYUDVc2pjzsNN5MTOxWsK6r
	NYdCRqImTYhLD3BP+1xIjddLd4HMeKg2l33813yLjt/sPXaHItSSbGa6MSQRaQuHOqa5sym76eW
	cmvrEo0m/rGBJP6yxo4VN6GZk9UBbZH1A6DXzND1oLyMDrOjasXk1ZXXdVcL0qkP/pQAAEQwBnu
	msN9ti8VV1jraloI/J+61tslHRsZ2ggzmBv4hBNJ4fCHbkprIo0F7MMwudfzd/17kC7zrXuGbim
	Dr5X1Smd+TJ91zHJdx2pguFgwj793cPCZx+AfJoY+Kp0oCyfxy9mHBMV4tX27Fal0zhXWi71bqq
	9nOSgEc/UuXuNsJ3hfoNNn
X-Received: by 2002:a05:600c:46c9:b0:483:6f37:1b51 with SMTP id 5b1f17b1804b1-483a95ea9c9mr140192565e9.23.1771874336104;
        Mon, 23 Feb 2026 11:18:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54760sm21308781f8f.35.2026.02.23.11.18.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:18:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 07/13] openjpeg: patch CVE-2023-39327
Date: Mon, 23 Feb 2026 20:18:44 +0100
Message-ID: <20260223191850.1049304-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223191850.1049304-1-skandigraun@gmail.com>
References: <20260223191850.1049304-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124561

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-39327

Take the patch that is used by OpenSUSE to mitigate this vulnerability.
Upstream seems to be unresponsive to this issue.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../openjpeg/openjpeg/CVE-2023-39327.patch    | 50 +++++++++++++++++++
 .../openjpeg/openjpeg_2.5.4.bb                |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
new file mode 100644
index 0000000000..05e504a18e
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
@@ -0,0 +1,50 @@
+From a3504b2484cf7443c547037511c40f59aff8ae5a Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 23 Feb 2026 17:22:18 +0100
+Subject: [PATCH] CVE-2023-39327
+
+This patch fixes CVE-2023-39327.
+
+This patch comes from OpenSuse:
+https://build.opensuse.org/projects/openSUSE:Factory/packages/openjpeg2/files/openjpeg2-cve-2023-39327-limit-iterations.patch
+
+Upstream seems to unresponsive to this vulnerability.
+
+Upstream-Status: Inactive-Upstream [inactive, when it comes to CVEs]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/openjp2/t2.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/src/lib/openjp2/t2.c b/src/lib/openjp2/t2.c
+index 4e8cf601..ad39cd74 100644
+--- a/src/lib/openjp2/t2.c
++++ b/src/lib/openjp2/t2.c
+@@ -441,6 +441,8 @@ OPJ_BOOL opj_t2_decode_packets(opj_tcd_t* tcd,
+          * and no l_img_comp->resno_decoded are computed
+          */
+         OPJ_BOOL* first_pass_failed = NULL;
++        OPJ_UINT32 l_packet_count = 0;
++        OPJ_UINT32 l_max_packets = 100000;
+ 
+         if (l_current_pi->poc.prg == OPJ_PROG_UNKNOWN) {
+             /* TODO ADE : add an error */
+@@ -457,6 +459,17 @@ OPJ_BOOL opj_t2_decode_packets(opj_tcd_t* tcd,
+ 
+         while (opj_pi_next(l_current_pi)) {
+             OPJ_BOOL skip_packet = OPJ_FALSE;
++            
++            /* CVE-2023-39327: Check for excessive packet iterations */
++            if (++l_packet_count > l_max_packets) {
++                opj_event_msg(p_manager, EVT_ERROR,
++                              "Excessive packet iterations detected (>%u). Possible malformed stream.\n",
++                              l_max_packets);
++                opj_pi_destroy(l_pi, l_nb_pocs);
++                opj_free(first_pass_failed);
++                return OPJ_FALSE;
++            }
++            
+             JAS_FPRINTF(stderr,
+                         "packet offset=00000166 prg=%d cmptno=%02d rlvlno=%02d prcno=%03d lyrno=%02d\n\n",
+                         l_current_pi->poc.prg1, l_current_pi->compno, l_current_pi->resno,
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
index 6d7d87f5f1..33dc48b2ea 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
@@ -7,6 +7,7 @@ DEPENDS = "libpng tiff lcms zlib"
 
 SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
+           file://CVE-2023-39327.patch \
            "
 SRCREV = "6c4a29b00211eb0430fa0e5e890f1ce5c80f409f"
 

