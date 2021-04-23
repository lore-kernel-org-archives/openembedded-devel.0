Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.622.1619212254951357059
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 14:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k/Y0xkZ1;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id s14so18897566pjl.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Apr 2021 14:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FdtMS+RX4BSulnr6JNeExmAVpj2+ZIEi9iVBDHwIRrU=;
        b=k/Y0xkZ1I4m+mSP+hj40QyWKczlRFOcaUjBZeFEL+2KicB8XdL5JXQMY/1cYaAKsDz
         pcPhLOiwM1vMFyRaw07kk7DaNRVAWnPiKy0yma6KlkymRgEIKeSs9xqCYLrbKdZAcFvk
         zL1qu3eWEvf1fuFfp0hvjvCQfOw2C0jhLVtIJsBef63hQeycwSZaaOrAwe0nYGleSMBR
         ODqk/+WhNLsFgDzz2OX+lyMbncDVISStJYZ3ZA/o/NWd2xD+xqCnSC6X6M4rGhkaMxeA
         Z/WKuYyZ6XG7daFNsjIYB7xp//fzeN07hdxoPI3ygUCChevzfJgdeJuvyg1Jnr4+I3Lq
         vhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FdtMS+RX4BSulnr6JNeExmAVpj2+ZIEi9iVBDHwIRrU=;
        b=Rsz/8pBcGww1J78d9FPJfsyybuNV1K9AZq+J0dFmNxiSR4niTAfaVEAxDnE65SrCn0
         p6tJej0D39WGYs754aC59frzyLKSOqXLIZocV0VNo1Ac6rmnEN06zp2RTgOOdcWqpZn1
         ozBnREaieH/E4gbytoUZ1B+poPtnNYio1s5dnh873e9n4MqsbzNZt1GFkvMGI/PqbSSA
         FBWPpEJ26ROBylUffEdsIPBPT7HDwvU4JaDJ6VGHaH0UZ6FI4Tgw9X6S0tk1K2Wmg3z5
         XucGMkluHC3Qp8R/yk1amxHq+0eGmkx+LtqWperBSTB7jhSvP3VOCInl6XKsKVwHjKrm
         Yi7A==
X-Gm-Message-State: AOAM530czsXECsxqn2kLl6dj3xpQPVoRoYJeSxeZfueuGM7iOf3kvwiB
	4B+PZOrvIHZZE5lPakytIVLpWuRcNfjVig==
X-Google-Smtp-Source: ABdhPJwyfIRgjEpZvXpyVMTaRQaj5lDi0HzInloAaMcxJhf8WPWNEgt3PiGaTqkuelfEmBx+OO8xYw==
X-Received: by 2002:a17:90a:352:: with SMTP id 18mr6296772pjf.223.1619212254183;
        Fri, 23 Apr 2021 14:10:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id n9sm5685072pgt.35.2021.04.23.14.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 14:10:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Kory Maincent <kory.maincent@bootlin.com>
Subject: [meta-oe][PATCH] nodejs: Enable snapshot
Date: Fri, 23 Apr 2021 14:10:51 -0700
Message-Id: <20210423211051.1134029-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New build method lets mksnaphot run so thsi is no longer needed

Reported-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
index 2953e9740b..48bf2f4a8a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
@@ -133,7 +133,7 @@ do_configure () {
     export LD="${CXX}"
     GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
-    python3 configure.py --prefix=${prefix} --cross-compiling --without-snapshot --shared-openssl \
+    python3 configure.py --prefix=${prefix} --cross-compiling --shared-openssl \
                --without-dtrace \
                --without-etw \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
-- 
2.31.1

