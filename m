Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.9854.1618086286514810099
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Apr 2021 13:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T02acIXa;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id y32so6351538pga.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Apr 2021 13:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=XwiyrCECxSUL1txGbusECESoay4ffuQxvOA8Skg3s1c=;
        b=T02acIXalejx6G38auPoxIlvudUzvygbn4Oq2aAve3ZrIdWk+e14hPbYtJAW8FC8rc
         0g+sqXPlmalpEnrbR0EbwCNbUnk/rE3Gquj4lskmBLxHS+beP8x8fttSmwTWAZocrjoC
         mpJEwKKJ4D9T1UjdtbsOHOeB/yU+qKMBHcy1UQJKh2w7zlXae4CFx0pUnoSAUpcblbDh
         gKP5C40HB8dxjNziNaimp+53+CjIVWSmjYiUMIQb4doyP4DCfASi2pbJS53S0wFznVhC
         O0rsLsAa4tUyIps4lToYdhlv13nlQ2Bl0Srti3KNUIPOuAMoTTrWTRrm9EVo97jyTFyU
         rIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=XwiyrCECxSUL1txGbusECESoay4ffuQxvOA8Skg3s1c=;
        b=JViiYjHQ70hWdZpOPFOKoZHc/GVYVpOPiM8wN4X7POWEeJwdW3KknjtAxT8ZrYepbd
         twkHiVDeZS1lnbQHBstyUT744JtAGUfxQlZ3yH2davejt2ie+shHtf1OgCUf/6dxSZWi
         C8ALAC/U9M367ykIOSDrYTjnBXQOxqnuoZf9V1I8xeovNhJILtMG9wNz4WUIS58QOd5v
         yIiGPLj5O8UD3ugdFFnrye6t48/4rf5Iw9mqcYoccFRBDM2PyFxNCGpw39jkVKYhMe0s
         5IvwBsh85PrjP1MKMZgtVFm+7eewhpEPeCYiEbc3ZRxZrWqsL7ZZcF/3f6r4CEOcKnKj
         uu3Q==
X-Gm-Message-State: AOAM533JY1ETUs9BKMllDFSWj1HjCJN33yCosTuuCH7uXTUvCjYXPxEc
	PvGUqy2v8wfDqiAWc83kYfgozjhIF0M=
X-Google-Smtp-Source: ABdhPJyg5kkpDmAV7q/qc2fRzU3TEgoAFBPUmdB5H1t6B8QftzXSxNWcQZsv0lE3DY3tblWqhZwtzw==
X-Received: by 2002:a63:d704:: with SMTP id d4mr18807387pgg.221.1618086285746;
        Sat, 10 Apr 2021 13:24:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8d5:10ce:6d52:dfc6])
        by smtp.gmail.com with ESMTPSA id t18sm6318743pgg.33.2021.04.10.13.24.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 13:24:45 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][master][hardknott][PATCH] wireguard: update to 1.0.20201112 +1
Date: Sat, 10 Apr 2021 13:24:44 -0700
Message-Id: <20210410202444.8053-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

The +1 fixes build issues for the 5.4 kernel.

This update looks like bugfixes

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...module_1.0.20201112.bb => wireguard-module_1.0.20210219.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_1.0.20201112.bb => wireguard-module_1.0.20210219.bb} (95%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb
similarity index 95%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb
index 64958a75b2d..0525b4135af 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb
@@ -1,6 +1,6 @@
 require wireguard.inc
 
-SRCREV = "fe402261666821514377d06c2c68ed9bc19e7634"
+SRCREV = "122f06bfd8fc7b06a0899fa9adc4ce8e06900d98"
 
 SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat"
 
@@ -31,3 +31,4 @@ module_do_install() {
 # OE-core post dunfell has moved to use kernel 5.8 which now means we cant build this module in world builds
 # for reference machines e.g. qemu
 EXCLUDE_FROM_WORLD = "1"
+
-- 
2.17.1

