Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.1257.1593029524103187833
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 13:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FVKBVrTv;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id g18so3543395wrm.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2020 13:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1lzvcbMjc4M6JTVTryj4t4onlpZV9gKFlVI288yoews=;
        b=FVKBVrTvbwWHkSYvkeiQus26swYHZYH/rsw22fACflIIp//2nJoyKunahgPKsJ+Pic
         ICgVD5ia6cvG/p8wwV7lNTFvd4ma1f7l4FaeibNkMCMFaSmS8muncMc0WTzmLCMdtF9R
         9j3y6gEG4twWEyubpJhRh2feZiiA7z8wEu4k3Qq6YOPEjQsEOOWFpYPxSivvniE8/ax8
         IBy1yh5Akfto/B1hcBUk/7so5uHpWt8nE+vqgYn/I/oNANceBHfBvJLhb4EQJtN/v/j0
         NbcVAS1j646QjTqBA80CME6rG8QjO90IeWwwNGw3H6NWQRB99N/hncBh85zTzZBL7Xru
         +jyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1lzvcbMjc4M6JTVTryj4t4onlpZV9gKFlVI288yoews=;
        b=bXRyXzVFpvfCVha47mYyTb5U65C4U/se6BHo5+G+4LaLv/rvd5YJqpmD3KwQQ+nYWn
         RcZhzk1QLzwMRlXDeuvy1/ncJlhXjfZYSZ0WrrhyuW6sL2h/+XVhdpdkac1mV4gGcnT2
         Z+sUlkWeEgrAqVV6sPMBGsN0+1yxWAaTnX4l2qCfiy1cRya/OQndsjjZUJgu6/GmLZXS
         U28LVgfrA0HipqmbaRoMU32ICdq7ZUjYScE8EdFfvKvBaMpDtRdt+oIfhRaIRXrK0SEX
         I/LsW1JK3QpQ4L4Ca6gRYlGVOERikq9xxyL//GtmILM0NNZ0ZhD1FNy6I6PO1TJ/rkzE
         U01A==
X-Gm-Message-State: AOAM5327/TCPkqbpStSmXwp3iGop01zjSjpLN07It4ZKLlNt9D0kiFQS
	/6sYZNedAdMKxm9gJhCb/hx40tkj
X-Google-Smtp-Source: ABdhPJxerM8t0COeObiu9VSbUtoFWdSvpVXto+FE16nvOIQhPWcSQqB7r9mlw38/e9j7xn5DjSzrDQ==
X-Received: by 2002:adf:fe46:: with SMTP id m6mr20450845wrs.192.1593029522226;
        Wed, 24 Jun 2020 13:12:02 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0371291f5497fdf9be4eca.dip0.t-ipconnect.de. [2003:f0:7f03:7129:1f54:97fd:f9be:4eca])
        by smtp.gmail.com with ESMTPSA id h18sm28125423wru.7.2020.06.24.13.12.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 13:12:01 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] Revert "packagegroup-xfce-base: add RDEPEND packagegroup-core-x11"
Date: Wed, 24 Jun 2020 22:11:48 +0200
Message-Id: <20200624201148.3151718-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

packagegroup-core-x11 drags stuff not everybody needs e.g xserver-nodm-init and
that's not what everybody wants. packagegroup-core-x11 is something to add into
images.

This reverts commit 394567c0078c627642e7b80b722f147da5a6f376.
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index 6ddf8ee91..70ef909ef 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -7,7 +7,6 @@ inherit packagegroup features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 RDEPENDS_${PN} = " \
-    packagegroup-core-x11 \
     xfwm4 \
     xfce4-session \
     xfconf \
-- 
2.26.2

