Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.11331.1629036406207285741
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UDem0xWk;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id hv22-20020a17090ae416b0290178c579e424so23283214pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=On4xthMxiePw83lKJrr8JtnSnXXHFQJa88/yg8n5IxA=;
        b=UDem0xWkoeBK4wkJma14BEGcqqfn4JD8oUQYwqpl4+FDaiF23/EcLeaS+yqpt7G9Bq
         jNgxMS09vpyybWIuz0au0D3eXtuR7sebtkWA0SvgTJyBq4akarIhiARBc5VTaWGulPXJ
         YCpkvF6TMbeiiGeJxAMNICPRzq/NKWdLYeqcmsqZIeNUD6bpnLl6zI+4ZkpV3QBJiofm
         ikm/7nWH/IjbLF84wrFZGvc2pUJU34v++9q4domlMaUA7fSFtyu84fD9mZq2Wf0jF0y+
         gIEu6aCmW32ZndQRLwzV/P2ddKG19cRvzoymZZDOviGJ88M3wf/yMxWOBuPklp3TcXBI
         MWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=On4xthMxiePw83lKJrr8JtnSnXXHFQJa88/yg8n5IxA=;
        b=rUFEDjxTweCt7AbFjYWFuMVzR1K7kTw+f5UH5shG0xpFieHcC1O8MDZvE2MX06Q647
         orP0tyc6aa7SRJ326LvKAEyJb7FMZ8fJxNm+HDt/6zjvn5EY3GVQjvsUdxiRX1vg2sSG
         idHSxhA1Fw9mHwdqH7GYo6NikS5ca9XP/HQBMTmBeW6JUUlRG67eaPISl6H6WIWVFpJX
         vAIVNKGqpqGzYruhoX7uwhTYBr31PVqPnO3CoAoKCyxaX4eGs1nQ75XdT+F5P7BUcf6i
         qvW2fk5MyDCmkbFItuHviRmKc6dJvBm0F4oUPqLzNGLxnAVCMrP1RiWTMwO18b+221tQ
         loeg==
X-Gm-Message-State: AOAM531Rp7Upq1he2l0YHxrGtZArD//Hi/enad1W0DREd1+C4gwXWBB4
	jXvMFjoWjUnttnPRZrPnW6agIH4B/hdQuQ==
X-Google-Smtp-Source: ABdhPJy0TyJSLjOT5Lim6N58ke7+9wns9ahpywEssIHWjSR40b4d6ej5xhwN3axZ8d1stxg2lzx7bg==
X-Received: by 2002:a17:90b:1bc5:: with SMTP id oa5mr10653362pjb.170.1629036405705;
        Sun, 15 Aug 2021 07:06:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:45 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 06/18] php: move to version 7.4.21
Date: Sun, 15 Aug 2021 07:06:18 -0700
Message-Id: <69dcf5bac8adfd55f1a40cff1e989ed8806607cb.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joe Slater <joe.slater@windriver.com>

Lots of bug fixes.

CVE: CVE-2021-21704 CVE-2021-21705

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 93045c3db744a9f1cd0a9b0ce992d44d9c44c309)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.16.bb b/meta-oe/recipes-devtools/php/php_7.4.21.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_7.4.16.bb
rename to meta-oe/recipes-devtools/php/php_7.4.21.bb
index 821d9cd046..4d427252f1 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.16.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.21.bb
@@ -33,7 +33,8 @@ SRC_URI_append_class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "85710f007cfd0fae94e13a02a3a036f4e81ef43693260cae8a2e1ca93659ce3e"
+SRC_URI[sha256sum] = "36ec6102e757e2c2b7742057a700bbff77c76fa0ccbe9c860398c3d24e32822a"
+
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.25.1

