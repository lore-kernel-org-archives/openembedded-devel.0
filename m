Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.4341.1597296781590970905
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 22:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SWk+fKon;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id f9so2220429pju.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 22:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OZweRZ8CntC8Ey2wn5O7e2Mp91HZk/sx/78OUIdWiy0=;
        b=SWk+fKonQ1KQZ6sxPrIsaJRcQQSsAclgBQuln8Fk70tPh2Dj09buX3IPizmQeZ/CTC
         hxZ8smPgeiwXGSSSJZklGEnrHdc41aLDpRdqbKZRNDx+FhYLrWO7soCX1YARhX7vjpa/
         RIqipDJ9tOTbosKBDEftTTywTrqEUGf9fxLCynZWRuYO2iHpgHrU1/uY7jme/nrXINtS
         ya6z6uvnFb75rjm3jbhX+GSwjZ+y0nTNP6FfljRemQvQm7GLlOHZF8OG5KYAIeDbWdXe
         qrHSHuokohKu5vkWz8ka2/Y8/EAyfmQB1WHfKRBOsN0mYOxQEX4RalATnhytNGUmEqZh
         621g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OZweRZ8CntC8Ey2wn5O7e2Mp91HZk/sx/78OUIdWiy0=;
        b=kPk/e569aUZJEMcL6qH7MpYwzMUtCnEb+DhpUH4s3tI1UW3bUbIu4j8XqQtchQBsOS
         7QDwV8mCXI+vjLN5s0CU+3ESPN9wO0mZtNlEP7zFS9zu9bLaedNJZ+rU7iwKT8Gii2Kg
         Jc4tqAQsvnrnb0dJUo3dI716VzcyKs1da8pFL6OwUOmO7h0aXFtqAn9B5XIanq+8ieJS
         /fHw7S4qaZOLEHmj6PJIzEeK9tlGMaLB9LKBJCk3eEy/lGXveRQu/LAKh4yF7rrdJIDr
         twMfIwo7w114CSuHPBqzxLBLpjG8dpczvmMKn1GoVwYqmfQe7QirGjvB7gCQwQ4dOGPx
         UBwg==
X-Gm-Message-State: AOAM532ZAqByQuwFu2duwOZjHRvlagZ2peqqUgJtuGFuy5eBSebnddui
	uJxMKrx0HemiP+EJ0T0QG78WAlLfRrg=
X-Google-Smtp-Source: ABdhPJwtsBtSFKTZfBqfqZ+eTePaYtAjJ7r/Bzv8jA9X3i0PTOGSkHClLci5tfTXnTgGiQCc0QNzSA==
X-Received: by 2002:a17:902:b941:: with SMTP id h1mr2567883pls.200.1597296780675;
        Wed, 12 Aug 2020 22:33:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id x28sm4336801pfj.73.2020.08.12.22.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 22:33:00 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 1/2] klibc: Compile with -fcommon
Date: Wed, 12 Aug 2020 22:32:57 -0700
Message-Id: <20200813053258.2386575-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc 10 defaults to -fno-common, but klibc does not build with
-fno-common, it will need some work to get there, until then use
-fcommon explicitly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 54cd3c24bc..243107e9ae 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -35,7 +35,7 @@ SRC_URI[sha256sum] = "abef2637ca823485d9c90ce9512e2b08a65047ec4da204635eeaef95a4
 
 S = "${WORKDIR}/klibc-${PV}"
 
-OPTFLAGS = "${TUNE_CCARGS} -Os"
+OPTFLAGS = "${TUNE_CCARGS} -Os -fcommon"
 OPTFLAGS_append_toolchain-clang = " -fno-builtin-bcmp"
 OPTFLAGS_append_toolchain-clang_mipsarch = " -no-integrated-as"
 
-- 
2.28.0

