Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.3667.1617934856652120340
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Am4/PKZY;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id c24-20020a9d6c980000b02902662e210895so4295627otr.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=i7V9101yO3IYiGQy1Mu86sdrdGPEiHlw6FECtVIWuKA=;
        b=Am4/PKZY+WrdPnR2NRYt6fKpdIOShJaYPIK1TvS1akhW5UxMPxCeO2pj5qO71VsqK8
         pLP+j4dHjrC4MWpdJ6EvVxRXORxDdLoHCKnWMYbwMA6KIQXRzgeU4aQ4ALUkFmTrcm89
         qnBx1xWaEIZ671BXcVW5PlTxgcU1kwoOGNKusxKmZLuOxkhUAXpbNmN6dUtYMZXMR3el
         YyCz/Tu8ouc0BhHIGGKritUcvRycK8mKdx71hlYQg89dJd2VT87Zsm8H8gQLaAyeyaYP
         yb9Ln/ra+Cv8+TTw1Q2Ys3dom1lDCwegmSqU9hFtmbctcfNyX7AAGknfhHe1rCAmmHWQ
         H4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=i7V9101yO3IYiGQy1Mu86sdrdGPEiHlw6FECtVIWuKA=;
        b=LUD6GtUo6E1I0LtHBLESCf/NRAeEOdDeiXbTPuwiqpExbsEhze59tfPARdf+EtDj7x
         OeoUdKNIiI424Uc0eLlVxNAZfsnKqxQ1dwUQeYZv24VJ3sa7pfrhXXqppcdRMdqV/1kK
         jl0W2kPTHyNVuRj8EB7VTvD7jsUOahNsgG2EUR5hC1IASkDfdCI0BZ3eEZEVW9R6nOAm
         iPjjG3V4nWvlAwQBlmGAaIj7Yj4p0F5b11fLPk8pNrGNdpShZ+K0Eq3+IikBxvvziCqB
         8Vpx9HZkHUSOD0UNuslT6SZbCtx2X/tziTNgs4gF2t5jgsosEe+LaT62woKei3JFwOco
         uzKw==
X-Gm-Message-State: AOAM5309znVQmEuYSE/c4DHc/2cHFL3rCVfs7b3FmG7y1SzQVaU1CtZo
	rwWKuq1WqxMYFFuwdIvNcievHCqBHdg=
X-Google-Smtp-Source: ABdhPJznyaohApuZEGkGkheDLb7WDALQ94LFp2qdm5haPEBeHK9bMvNRCiFpujSDPjT/okULxilCZg==
X-Received: by 2002:a05:6830:14a:: with SMTP id j10mr10471202otp.143.1617934855901;
        Thu, 08 Apr 2021 19:20:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.20.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:20:55 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 02/36] libyui: switch to libyui-old repo which still has this SRCREV
Date: Thu,  8 Apr 2021 19:20:15 -0700
Message-Id: <85923fc9e3e732dc6ef643868b74ca7a8e47ba99.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* af06143017fc5f18c4b6488ba4aed26bcc43ff6e doesn't exist in current repo:
  libyui$ git branch -a --contains af06143017fc5f18c4b6488ba4aed26bcc43ff6e
  error: no such commit af06143017fc5f18c4b6488ba4aed26bcc43ff6e

* there are no common commits in the new libyui repo, but luckily old
  repo is kept as
  https://github.com/libyui/libyui-old
  similarly libyui-ncurses now contains only README about being obsolete in:
  https://github.com/libyui/libyui-ncurses
  but at least it wasn't rewritten to have the new content

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 902919167a97055e9be9cd3654f29823e81ae382)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb b/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb
index bba17962e25..e42c178e66f 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.gpl-3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                    "
 
-SRC_URI = "git://github.com/libyui/libyui.git \
+SRC_URI = "git://github.com/libyui/libyui-old.git \
            file://0001-Fix-build-with-clang.patch \
            file://0001-Use-relative-install-paths-for-CMake.patch \
            "
-- 
2.17.1

