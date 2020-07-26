Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.25970.1595754918578252225
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 02:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=KjAX3een;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.46, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f46.google.com with SMTP id i80so7378388lfi.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 02:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O2H3PHHBLAkpL0V0rb+H97+Gliide9Nu7km+6opiucE=;
        b=KjAX3eenMmoURvxN6w+F9lyDD6jd3eWXAD26fvsKgox2puqTmS1kEgbbiILkDsqeJ+
         cN1tdjPjZa+XGUZMdADPoyKUaCOKiU+L6A/YWV86mzJo4ZiazroGM8/oAmjNG51b0YTI
         zjajJENP/uEvavj39ln9gi3YJcwPB/9pUReIbWQdaY3LaOYbAskKy3hWGM4+YEW3Nj30
         rMHtSnP0BS0E28xof6irrba+skhQwZ2W5t4tCiR28ZtXpajndfsQ6z8UwC9CzhdoL97/
         Y08OVrssxAHNGr0ZI/jveoV+Y2+S89T5+5bscdPZ4fV9OCg+l5d1yAmFjELpjIaXhbmz
         dlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O2H3PHHBLAkpL0V0rb+H97+Gliide9Nu7km+6opiucE=;
        b=d5xvLei0TOkOrgAfBhX5KYZvhqRsWVt7jSgENlI3gAL1PaSl9uGcmGPNBmJMpVX+5+
         HOQzHHZBCuKP3fBPMuqJYoyf1ehsmtRCbEXZXLqNW7nNAVNVTYlkxd8jI7lCn0GKqK4H
         D9yoqcMp777BjfedrZULysQC0CPU73EHRgjsRnAOyZGFHsW+wK6ghx1MOXheGHiMW8Zg
         t98dl7d2/F3sf3udFuJSy+TIz+5s9X2FHw0vDSWZ5wOB8EgdjEHY65blgn9l/Ld3mPDS
         Onau6pU5einZK+WlPpddtOlgpHuDrzM5I4UtV6Tmr0R+hVYEoHGBfcFsaIQfcyhPXe4q
         DYgA==
X-Gm-Message-State: AOAM531ucPCFigcmsjXKkA6x2QNC/mGtJcnOc3C701bQRI7wkBQAYNwv
	FNt5m4IPlIVLccFPLLuQnR3Wma46i24=
X-Google-Smtp-Source: ABdhPJw33T/e6Y/ZDpQnfRp5GkBWbFTIk5Ma8Sf3uenl0rRhH1X/cP4ZGTtktb7tQdytiuV0Cu4L+A==
X-Received: by 2002:ac2:568b:: with SMTP id 11mr9093924lfr.87.1595754915951;
        Sun, 26 Jul 2020 02:15:15 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id g4sm2205811lfh.13.2020.07.26.02.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 02:15:15 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libyui: update to 3.10.0
Date: Sun, 26 Jul 2020 11:15:13 +0200
Message-Id: <20200726091513.3923634-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libyui/{libyui_3.6.0.bb => libyui_3.10.0.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libyui/{libyui_3.6.0.bb => libyui_3.10.0.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb b/meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
rename to meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
index 7c6f4c13d2..d7f529e313 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/libyui/libyui.git \
            file://0001-Use-relative-install-paths-for-CMake.patch \
            "
 
-SRCREV = "8459235919f592b1bc099ecf9a947cb6344b6fa5"
+SRCREV = "de9134007d2d029fe5809ce48f57fe218e6ffe16"
 SRCREV_FORMAT = "default"
 S = "${WORKDIR}/git"
 
-- 
2.25.1

