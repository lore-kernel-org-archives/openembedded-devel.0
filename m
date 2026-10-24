Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3748.1792837526855535132
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Oct 2026 03:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RD++9QjC;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd633ef819bso666437a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 03:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792837526; x=1793442326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svEmN7YYG39FHgVZilDPTN60Rl1ggPeILZigdXLo0NE=;
        b=RD++9QjCH3uO18m416wBWxPlNQJOdxWqQ0LqEnhzS/t3wPF9iR9ch63kiAUPaFRLmI
         +8NBCWf1j+wj8ao+bxL/5tmSRimiThquyxoPS46LZYkIIJM7xluTBG/r4QljaLH6mUC7
         dddNqBQbrOmrpBXv2C6Ky+OLy1mDDsTeldP1sPKwJ1j5VXUdaVnJW/TJgug9X4YUCMd1
         i3lFIdgemf/TN2X7aJ/aCT56UMv3Z0a/RcmaOSN0fLzWhNcES8dzmMbdW14PoA5/fSxF
         45X8sQ4zb8NwcjcBiBcNQPe0+jvaqoZVBTdHqj1euXs40gHJrmHRJmENeFvlKwlQXZWl
         /mVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837526; x=1793442326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=svEmN7YYG39FHgVZilDPTN60Rl1ggPeILZigdXLo0NE=;
        b=WRe4/BeGchp5L9bMHxZ8bvFaPSskp4GTZMfDCkFdN4dwFWkuDS/5Wq2bBvftmJp6yt
         BtEmJJq23HSo+3zL5E0dSfqeVu6TpBXxW9rxwFiBzHXF7zGr1dIkjfc0Y6944e5sioII
         OMlirzLXhbKeHMHqcf8vWhLIw4w7ZJtB0v98ZXiqpOkNS2WHkYEg6IfLUZrFFLm5lvvk
         tot4KpU5+jKMbwezW7upcKc1Nki9fBlNoCprlX2YwYWz+VL3ggkRfSn/P4BlfoK/+bTQ
         w8jGXeL94yt6TH1frPR40+RZ02F466SqSwsZWSu8f2ah4lkhsiPlCg04wK2IVI3pHKqI
         Wcbg==
X-Gm-Message-State: AFq9FYJi41DLXcxnrx1DYXnu5gK64yoyyXy3jjs4O08KR1/8UEFS93xQ
	w5DuYNfew9hulzyZ+dY/dhv9YAvSEbjRKC1W7Uo+RjWqF8UnMtgN9ro6GgIE4dTv
X-Gm-Gg: AYBFou3T8f6aB/dX2t9fLl4WIkUFlR7+Xx0kaEGUw0eSAI9yE+Cy5s2KNnWrD0vNC1n
	oedr7PEVAc1KwRKFvH+BBIJPQVxtRhU3nzMN3I15vE4C1nDGLEde8Xc9RB2Varrttj27AhpRAFV
	69QpAuQn6tvz5iiJWUiRA/QiVlEYgyrFHeBtwRvxhUBCg4mwH6U79mfz7E6KlqnOoTayC3h01UX
	olPBcBEQH/FWTWb+aboTMKlXEcQCQI7IAXM70l0Zm25WPD6q1Hc+xKk1IlrFezVAz4G9FKsWEEi
	Bi3w1c4l6h1IV0tzs2mvVW/g3ARA4dmybipubWI18KEGkr5dk9N7JwnjB9hRFpDCxLWUkaI4Vfj
	SJ7mDGE73mxPGzwlFyGmxc8ZhWrrpBxImsCiYW5YsQvwnCh4L6T72cSrKUEuEDvDdfUAFUVh+An
	tF/7fKQmgNYj3M7R5O+GcpefDgTa+RruOGqkjIYRJZiHfoJWNLsVsMbiOrBWt2yebD5tZFjukf9
	L5xi9DidUABxVvNoQAxfAM4TwIctoQvpNUhCHMDddVGOAEYGhjS8nm4lsHdiLeD8GMKyBu4bQCp
	QuFeENmFOyJplmLISQBOwSV5p8hXYhY=
X-Received: by 2002:a17:903:26c4:b0:2e2:d09f:d770 with SMTP id d9443c01a7336-2ea9c7fe3bbmr13923355ad.26.1792837526237;
        Sat, 24 Oct 2026 03:25:26 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1dfee1sm4293935ad.64.2026.10.24.03.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:25:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/7] transmission: upgrade 4.1.3 -> 4.1.4
Date: Sat, 24 Oct 2026 23:25:05 +1300
Message-ID: <20261024102507.2256303-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024102507.2256303-1-ankur.tyagi85@gmail.com>
References: <20261024102507.2256303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 10:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131397
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/transmission/transmission/releases/tag/4.1.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{transmission_4.1.3.bb => transmission_4.1.4.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/transmission/{transmission_4.1.3.bb => transmission_4.1.4.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.1.3.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.1.4.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/transmission/transmission_4.1.3.bb
rename to meta-oe/recipes-connectivity/transmission/transmission_4.1.4.bb
index b2f1704d1f..03adb8ca59 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_4.1.3.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_4.1.4.bb
@@ -14,8 +14,7 @@ SRC_URI = " \
 	file://transmission-daemon \
 "
 
-# Transmission release 4.1.3
-SRCREV = "838877323facc4cc2b677fe817e203779c437bb1"
+SRCREV = "a6d907d9ea2313143af714d7830feb6c1b60b84c"
 
 
 inherit cmake gettext update-rc.d pkgconfig systemd mime-xdg
