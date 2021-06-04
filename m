Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.5431.1622794160039300832
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 01:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=IAyX+Jjl;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f48.google.com with SMTP id r13so4849423wmq.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jun 2021 01:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KXOG5JT/Z04ljmG7jt0sAyYDtq3gtdVfSqoZ/m5bV/Y=;
        b=IAyX+JjlM2ilmW7ATGvRRA0xEvxanuXJH3gUWmhCwfyTCUyyun0aeGTwobc67zyEBJ
         gKW0g3lEac6UMxs019hirjBic2BmjPoc0VPTSjFqL0n+44E0CYPjSHIHpr+AVW+okW4D
         x7ynr4VD4g+Dnjv7FDeD13gnjAwS7ttf6RXgLBgq/CT9Ggcd0iow7c1reH7TlrdkDowE
         COmJgNPJG4RmwphpSFjiZ9YQdkGN1lQiQ6gBieG9ktWDBpS8HJISsrCexSuNid5QLa2Q
         79aGqHrFG6ZCU/NxlvbyaMH7nPBsi/OaieQtxZL0i25sMfQBVFhfrSgcCB7/LNBTifne
         pi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KXOG5JT/Z04ljmG7jt0sAyYDtq3gtdVfSqoZ/m5bV/Y=;
        b=RAJOiqMTMawtx1Z7BdAlXV1bvTDEus2LxtHNsUip8FQMks4Ps7IXlT0W2/efphiaiH
         Y9QinpH4GUxbxR/Kf49R+ywl1wiWlMvQAOrpV0H5g3sm5ELUz7/QbzYqhEExejrUIOAV
         lEBmZLABg6cEMtOhObC1Y+1jsS7G9jtYmrbSVb2x7NgQKLtccsPn6msmLYC4qdmfINKA
         ylylJ3yCeQUF3LBJO/F2bkpxw+6T+wyJ7WKBF9BWMRV8GUH8IVZfySDKkZCvmjFg9HtF
         WS4BY7qQ2ko52gYF+jIFzUJ7M5xHoUmkPJKwjcqTNosAauuYIqySWmh2Q09jx2P62OSs
         EXVw==
X-Gm-Message-State: AOAM531u3woFeh7OYW0/hk5qXqR2umTzb9rdWjSlJ4D6gJWQB451h/Ba
	G9RBt2INuoZBLiN4LJb64z/sVQ==
X-Google-Smtp-Source: ABdhPJwXxTgS2LR9LCGYD1DRasmEY4GYxRsuwsTPXwkaalOx6llbevmoXbL8Et044BEjdCFqOBwDTw==
X-Received: by 2002:a05:600c:3650:: with SMTP id y16mr2352773wmq.92.1622794158672;
        Fri, 04 Jun 2021 01:09:18 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id r18sm5908316wro.62.2021.06.04.01.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 01:09:18 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH] libgpiod: ptest: only rrecommend a single module that we need
Date: Fri,  4 Jun 2021 10:09:14 +0200
Message-Id: <20210604080914.20305-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't need to pull in all kernel modules. It's enough to just
rrecommend gpio-mockup.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index 8dda8a2a6..48a1e23ef 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -48,7 +48,7 @@ FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 
 RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '', d)}"
-RRECOMMENDS_${PN}-ptest += "kernel-modules"
+RRECOMMENDS_${PN}-ptest += "kernel-module-gpio-mockup"
 
 PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
 
-- 
2.30.1

