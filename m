Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.1879.1621647334631578861
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UISI7dgJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id l1so33022065ejb.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ObUh87fEvOKPVs/mzDhVed8/9btnOEV1LXBjwNVTRTU=;
        b=UISI7dgJv+j84o0NBsW3RlSudJMNgKFxMmgZAlkkE4o17P0ccQ0CwRIvilFp/bR34J
         MkLi9PoJGBqD9T3qhUcHBRsWKhsXUA01AdfYUVUloXQwabpSUpIXEVihBxlW+e1b08en
         MmHpfirYivDgTphjAvpjsYnSFb1XEN/ADMmW7Xp93Ee4tV7BkMVGHzC2v2N6veT2E15D
         cm9EsCr11lt2qcm2MrvePREYop4kiVUJl72XT+N0Cii4HA4ZrmjSWppq0mOxf9MusM/g
         q3GiLHr1WR28HpBdegWehS2hu7Ft9sD5q7lr2fA20y5U8TcTWL0JhsCX7SsNrNlY16uj
         P8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ObUh87fEvOKPVs/mzDhVed8/9btnOEV1LXBjwNVTRTU=;
        b=JOakXC4nQXRNsXIaQ52fry9luTkvm3zCynxvAXDYoHExCUWTguuIqLeKJZ12W0Vk29
         +nOJEGfl0iftSoaDRcAeU/zjrCTAt/RVJLTiCxm5tlUJ/vlMqqfXNnRK7SjKW2/hZKP4
         KqAptcXfWStxthPoG/r+NjGo/qK7MTaTtZdO2Yt612uGb2ASvgQjHTw0lZDRdbs24NQR
         chNR2OnEbvW0XatI6YbqggoWE44p9qLy//xT2nLmyLRo2n7jWQlgdPDmqIt+yRNN+5Pk
         xECpjsDzIwFEZlvmvVEm0zHQUbTEbutQzHfOXz6fLaTFO7zEZc15XKYQePPvka482FjO
         UYJw==
X-Gm-Message-State: AOAM532AJ6CxyZ94y/3RawxW/sNNE6BJjR/FgcWxr/eLnBXRzFNA+r3I
	FiHiNUz6FQ69hAcsrqF9ImleZLpoplo=
X-Google-Smtp-Source: ABdhPJxopdob1KBBIfM6YMYgx7vtT2UgPGBzCrHMefaJnhVV8gQUsNin2sbFRLKcFTAwCPBUgnJvrw==
X-Received: by 2002:a17:907:20d1:: with SMTP id qq17mr12418899ejb.329.1621647333292;
        Fri, 21 May 2021 18:35:33 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:32 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/17] ttf-lohit: upgrade 2 -> 2.92.1
Date: Sat, 22 May 2021 03:35:08 +0200
Message-Id: <20210522013521.588774-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../ttf-fonts/{ttf-lohit_2.bb => ttf-lohit_2.92.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-lohit_2.bb => ttf-lohit_2.92.1.bb} (91%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.92.1.bb
similarity index 91%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.92.1.bb
index 0af0e91d6..c9cb74c9f 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.92.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://fedorahosted.org/lohit"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://OFL.txt;md5=7dfa0a236dc535ad2d2548e6170c4402"
 
-SRCREV = "d678f1b1807ea5602586279e90b5db6d62ed475e"
+SRCREV = "a403c9b7f509dad5e58dde85ef63b1c36fde3a21"
 SRC_URI = "git://github.com/pravins/lohit.git;branch=master"
 
 DEPENDS = "fontforge-native"
-- 
2.31.1

