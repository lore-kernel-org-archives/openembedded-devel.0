Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.8331.1625151003184144236
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jul 2021 07:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PuhOaWA9;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id a2so6317800pgi.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jul 2021 07:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cVjq9p+06pUGJv4ueJEqMowKkLSlJy6DelskQVk8dW8=;
        b=PuhOaWA9uwU5NVRlR0oToAPSmbmYd+AoBJ1+D62x09qG1u6wP3p28WYOt3qEAa3MID
         /ZM8mv3vQfhFd54X7WiXL/PmrfvkeuQnzengse/YgmSQE/R4IxZV7ZCh13SzQg2UrVc9
         LNA84c+5FNVauorZe7IJdYRCYHviU+DPkvA09tIpBq2oYh5eNRczzH4pu/Oaz81WKp1j
         pHKO1vcSp4WoMPsweduwz4VDNZkcrMzQTRpu2weFwjd8DtrAKbw07dQZ16HReq+4W52E
         n2b1IIkAcwuuy4RzrixKUHBnZtLJnmBRjCAMsV7AX6hsY7vtOTUSzOCE46iZAkP3hiRF
         renw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cVjq9p+06pUGJv4ueJEqMowKkLSlJy6DelskQVk8dW8=;
        b=RE3L/EbNaU8UCG/ZJyrADBx3MVy2a0YMXjI+rZR06C1j9tLUkn8MqY6e1XudbktjK9
         9lsVwmU38N/dzxYv3WwQofZyLZrsqQE1RpcxTgIH0VFmK9g3E4kuYgh3R7VO0fJpaIKm
         b0mwcn92jc/rbTeZ/PN+Fr8hAu7L1fED3RitqNaGDyy1j/48l4vlok15U68eOiMdUvYy
         RckJ97R4V7aSowB6BFYPi3tBxXUeAljW97OWKoubkGS4LLzp7Lg3za8KtbaK7crh9ZsT
         sbllOAaHhWaJDTtxuhX9epfmIPMzQzxHPLZUkVGR9pdxUZk8FsskH1vXBBZF3LtU7TtW
         yQ6Q==
X-Gm-Message-State: AOAM531obsk9TlwZPGLrsYS2Qm9Wnqo7WLrllMWAYWln3+xYbKqc2pwp
	jvM3RPJgatRA4GyyingbZdURyJJwMC5Rrw==
X-Google-Smtp-Source: ABdhPJwXX0gh7c6gXkt40K99896JMrU1o1j44ZamwLhpTqJAiPCGun0PsIZtfgLp0YwjR+cazJjD2g==
X-Received: by 2002:a05:6a00:130a:b029:308:ebec:33d0 with SMTP id j10-20020a056a00130ab0290308ebec33d0mr407756pfu.20.1625151002469;
        Thu, 01 Jul 2021 07:50:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b522])
        by smtp.gmail.com with ESMTPSA id y130sm285461pfg.79.2021.07.01.07.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:50:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] suitesparse: Update to 5.10.1
Date: Thu,  1 Jul 2021 07:49:59 -0700
Message-Id: <20210701144959.14642-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to hardcoded SHA in SRCREV instead of tag

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{suitesparse_5.8.1.bb => suitesparse_5.10.1.bb}         | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/suitesparse/{suitesparse_5.8.1.bb => suitesparse_5.10.1.bb} (93%)

diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
similarity index 93%
rename from meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb
rename to meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
index 9ccf2d0bff..1e165039b1 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
@@ -5,11 +5,7 @@ SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https \
            file://0002-Preserve-links-when-installing-libmetis.patch \
            file://0003-Add-version-information-to-libmetis.patch \
            "
-
-SRC_URI[md5sum] = "c414679bbc9432a3def01b31ad921140"
-SRC_URI[sha256sum] = "06726e471fbaa55f792578f9b4ab282ea9d008cf39ddcc3b42b73400acddef40"
-
-SRCREV = "v${PV}"
+SRCREV = "538273cfd53720a10e34a3d80d3779b607e1ac26"
 
 S = "${WORKDIR}/git"
 
-- 
2.32.0

