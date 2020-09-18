Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.9852.1600425249147567745
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2020 03:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tduWFFsA;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id u21so7466370eja.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2020 03:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OiNhrF8GIj7O7sot7cehTJD7H5iGm+iuLwvMiWfEZgk=;
        b=tduWFFsA7ZrgCG99CzsPkGsSUZUPiHROEHhrMkbVThDzJmg8+5IFteUbLPUB7ai0u0
         KZaAn5G6JOOIN3PDZ3k6UdGMO7aWNtIQ3kVPYqbvBknWIFA5ixpyR3/Xeo3wMmHS56Bi
         E5iJ4pLryUjlKFncu8LQs6J953uO/B0wORd/LiMZxG8ZJRmdF6kpyQpiCvA8UZnqNZBM
         cYwOmlhTJqjeouuQhV1mgx379EnccqRMJHAsE7LXxB9AmBRLLv7FD/GNuxrB2zpgCKAq
         DbqMROW1TnVqg/Qy0G5gB43b9ZZNJCQPWR4PcqzT2oMF2nborhOKXS47XMLRMJr9fKYN
         DYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OiNhrF8GIj7O7sot7cehTJD7H5iGm+iuLwvMiWfEZgk=;
        b=uT2AiCy7UjUW9L5wyaem+xcE9PtndQXLcyJCnXtk7JslB2z9nh8RrNdIZfjCUY/PAJ
         7FCZiRGbX9MYlJpW0HrKQcrWP7aKgts9DkiInS/s0ao8RqG5TbbjPEezhbonFkMQIrB6
         FpO5CpdVtBnx6WiAUazIg6kF0ERJtqN6kc9N2Dgml3chlHkM2CdS5yYLcLmLisWE0uxU
         tii7sSkl7nCzu0YgAkqnCas2l2dA8xe6oRKfgr3hlJiNBqd/Fw+Nd57aNKqXzDcRylpd
         1L1Giom3BQfh157cSQ+u6F7g5aA2nbpAG+jk+kQ9bc52ttj2P0BI+xP5x9SYvgYVon61
         1k+w==
X-Gm-Message-State: AOAM531+3FNuebiXpGhZJLFjMXubUkTmU2Q95UgX1pgGxwa8gOzrhSGW
	UC7gXOU1+71xRHjlgn6aQmFMArT21uE=
X-Google-Smtp-Source: ABdhPJwC2Soz00brUwuZagf9/yg6EQxrnjSiuXT+Kq63M6uhxuoO9IJo1wNyuL02EwZWE4S+FD387w==
X-Received: by 2002:a17:906:6005:: with SMTP id o5mr21893935ejj.465.1600425247417;
        Fri, 18 Sep 2020 03:34:07 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z23sm1929530eja.29.2020.09.18.03.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 03:34:06 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] iwd: Upgrade to 1.9
Date: Fri, 18 Sep 2020 12:34:05 +0200
Message-Id: <20200918103405.370524-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Need this upgrade to work with ell >= 0.33

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.8.bb => iwd_1.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.8.bb => iwd_1.9.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.9.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.9.bb
index bfbf3c7fa6..25500e6501 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.9.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 DEPENDS = "ell"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "a01754f56aacdc641c819f983c3c0ad374be77b2"
+SRCREV = "aa3dc1b95348dea177e9d8c2c3063b29e20fe2e9"
 S = "${WORKDIR}/git"
 
 inherit autotools manpages pkgconfig python3native systemd
-- 
2.25.1

