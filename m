Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1100.1794332166876755475
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 09:36:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sTcD5VZH;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso16069765e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 09:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332165; x=1794936965; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEIqbx23pQ4jFN2aAD7c4LZ2i043tY0yFXbVnLVGwPE=;
        b=sTcD5VZHzh0G5beubLW+/E3mocxbwcaAy2rU+3mJdak3D9dM1HZS/y5Hwd/O26re1C
         BhbcAHZxq+IWuM+YRI5j+2iYNCm+oHh/Xw2fa0T5hja5r/aaFdj6fA52HMVGTYk/vY/K
         l26cgcvd+RqjATKKSKBg3wM7Qwey/z5m7eJrgL0W9xhUvOSj+klg/KiUy3DGCYblYqEP
         km1ncWqwWkDNyYMnhBuxph44uRni+VZ3vu9EIUTlPuGbFd+pteCStkfpbHgJZB8D5ehh
         uIS01qdbcuEiIyqcPqgMuFqE1Of6cGl7bs+3sUkMW0z08KevOfWIkZq0ZPW4toPlIOfT
         dPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332165; x=1794936965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEIqbx23pQ4jFN2aAD7c4LZ2i043tY0yFXbVnLVGwPE=;
        b=AX6fZkdkLXT6BaRldfS6GPP0nApIadfvcIq83WxebmhyeoXGd2Ek0SO/rHnMlDGM5m
         j+eiM3JuVyUAJ4hrS38cHtAe9bdz9rNDFjqvvcFGeq3JmyK16PMes5CVo8EX5I1p2sq5
         YhJMj0+Xebw27J5MueKsXsbwMU7Ov8JEjEZBqS9zlw36y/cn9T4ePKmAn/UZVG+jhEna
         US2/PZkgK6apQ5+QgLm//h3LAfCHAKwZMTYxdrC1PpPcO9KYIsVZEp1SUZvJuLu5gup3
         39rzvySU0/BJg5Y9JQ7nNZILnV2IROYS4/nBl5oKVe84FckXtDHfZv4z/CrnUoxpJK+m
         rHQw==
X-Gm-Message-State: APuU4Z9A37lQTN2qqhm1BtWUQv1F8G/3J/sw3N1G6PMTXfu4nfcbhiNM
	Ry8U3noMyOIXZRLSMlg8Pb9Wk/BLAE8l6bO82apx/b2+78vDoJXFj3kKoOGPKA==
X-Gm-Gg: AYBFou0QlEoBipdpPzCLUlwBRB/ygtatUymmEsXCMSz0VdOkedrZm5wPk3XGM8f4VhG
	OPuxfX02ng7Evt8zVulZWYeMJ7+lNa2uAMCe/Xay96Kv2s9PZwn6GoN7UQqtJdHLM3g5gyUN7YO
	Nwg+wBiLdivBxkvNEistKO6fjQShGZl9gcNdLlUGEE6B4JaAV86cG50DRHg6WN5NQJvNDiIMLa3
	4sxhJRZYN68v1ECje+dGlgAZJsUsWH0VPa7Sj8uNCt7dtqnDw43Z8GWA+iwK5zC6Rkz1rqr2k6u
	WsxMQmYDxYAuGOnDVPTyeCuqZIs+cEK1ZHcGVuMMk/0x6hrOdfF4qO2qAFmyaMJFpnhbixNPeeX
	wxjN8sgMdo7pEU7FNsZsCTtR/JTbM0R7VBtDwfuzzvDHN53nkihtHaeCwtYYyL6GME7G5IIDHBS
	M9nRirt/om0JciHsV39uKzbHuDNA3PJdv2AAoTHbs/3ArFaMSDOWyqnqLVkMpMyQs65y31tgkOr
	JcajZXD7+InEWCka5rQM3Ni2ar6mdxojOZNHNWqzYb9uvuPoLe2YefB0IPwas1Ybty/qMyO+NvG
	BUoxl5vMzpxuI94CQo41hDCa8SIJH82nJ83BP3x26GVdPTVYm+s2UvTqfriToagFcMhhgtAuoRT
	KeRo=
X-Received: by 2002:a05:600c:1d03:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4ba02343ca0mr68388365e9.13.1794332165080;
        Tue, 10 Nov 2026 09:36:05 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm122994405e9.11.2026.11.10.09.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:36:04 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 10 Nov 2026 17:35:39 +0000
Subject: [PATCH meta-oe 10/10] android-tools-conf: android-gadget-cleanup:
 don't killall adbd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-android-tools-adbd-v1-10-cc2176f381c3@gmail.com>
References: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
In-Reply-To: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 17:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132107

android-gadget-cleanup runs as the service's ExecStopPost, once adbd has
exited, so there is nothing left for `killall adbd` to stop. Under a
supervisor that respawns adbd it is worse than redundant: the new adbd
starts into a gadget that is being torn down. busybox builds without
killall also fail on it silently. Drop it, and stop quietly if there is
no adb gadget to clean up.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../android-tools/android-tools-conf/android-gadget-cleanup           | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-cleanup b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-cleanup
index f27d77df5120..5d32dbd2bcb1 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-cleanup
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-cleanup
@@ -4,12 +4,10 @@
 
 cd /sys/kernel/config/usb_gadget
 
-cd adb
+cd adb || exit 0
 
 echo -n "" > UDC || true
 
-killall adbd || true
-
 umount /dev/usb-ffs/adb
 
 rm configs/c.1/ffs.usb0

-- 
2.43.0

