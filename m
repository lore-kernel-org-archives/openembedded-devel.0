Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.2447.1625965730017992957
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jul 2021 18:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TG0Z0UUf;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id a14so7108058pls.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jul 2021 18:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jj2HVqnE7x0i+Zgi45ENeph8++ITjDFAT0EO+jmXvPE=;
        b=TG0Z0UUfixuil5uNj4pMxPxcJzuvkMAGjwaJjdSHDsHYDVqE+t8bvc8nLRFxq1qI/d
         myndBE7YR0hNeZRlVuseos89w3H2+0N9tLeomGnZaUViB9pRftPeDCaLtvi89vPfLab3
         O4C/HaCVKs7PJVFB6Y8Vy5ccAVuOU/HQ7556R3IU1f3/higAT+O7wemYgTMkGTcWYMTR
         cWirxHwpVcHiQZ1sSyzzDXHlWYVlmojjQBXF4YBWv7cCdLiA8K0CA0F+4su6L+9O9Ekf
         UEZSDouknfpoCStWoveVu/rjS6v9C9OxwI+jGSH2xGzuF/J2gBhVOoo8i7z7SohDKccm
         vp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jj2HVqnE7x0i+Zgi45ENeph8++ITjDFAT0EO+jmXvPE=;
        b=RnJ+ueHi5QKTHtmQtDwjCgj6D2DF6QKCRpAo3jWcBuY+ZhbyfTSejQutBaD1N+qJ69
         GHSyvGNw0tFvnlq/NDH83Yy2laS5BvZDRfPKNuMkB9g/J2JYZMAwmE5Z0eTar2nD4CXo
         D6d59wiBvF9ybe54+5jXYE8dLa7TU/yzyLaunK3cR/rXI2iVbW0SrM1lTnj8cTjrGzIA
         HijjlAyEFfBQew4k1LBP+TXA0R+acIBUZ/kIc8mGv8M5YEl3gJ+RkLgtqT9u2z9xN+sV
         Z7Yt+eC0raZASEF2c+nSZiyhbJYgOA3NVamBcH6U0zvRTfMNM7TFbmZy/YjjBQ2YtKBS
         mk8Q==
X-Gm-Message-State: AOAM531lTAMSQxfZivLRqjSCYx4BQMro/3AZwttqKwu9zA4nhLzBn0cs
	Oh8O8cvhsWhctgjH8cPLCl/40rDuCgT/jA==
X-Google-Smtp-Source: ABdhPJyHrOsmsP/i2vr0ykDr4quAIzfY/VZ9p1aOv0QjGbP1NGQEFOEYFDF7Jm8w4XPieVKFRaKMVA==
X-Received: by 2002:a17:90a:d50:: with SMTP id 16mr45588388pju.93.1625965729347;
        Sat, 10 Jul 2021 18:08:49 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::7ed6])
        by smtp.gmail.com with ESMTPSA id z3sm12199024pgl.77.2021.07.10.18.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 18:08:49 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [meta-perl][PATCH 7/8] libtest-warnings-perl: upgrade 0.028 -> 0.030
Date: Sun, 11 Jul 2021 01:08:03 +0000
Message-Id: <55b9f0d8ff6b544f43e9ab3391e92029ec05ba4c.1625965484.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1625965484.git.timothy.t.orling@intel.com>
References: <cover.1625965484.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

0.030     2020-03-21 16:56:30Z
          - fix tests that can fail when there is already an installed module
            named Foo::Bar::Baz (RT#132140)

0.029     2020-03-14 05:27:59Z
          - new :report_warnings feature, for printing all of the (unexpected)
            warning content when had_no_warnings() is called (Tina Mueller, PR#10)

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...t-warnings-perl_0.028.bb => libtest-warnings-perl_0.030.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libtest/{libtest-warnings-perl_0.028.bb => libtest-warnings-perl_0.030.bb} (88%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.030.bb
similarity index 88%
rename from meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
rename to meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.030.bb
index 7cd07b2c0b..78110ca475 100644
--- a/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.028.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-warnings-perl_0.030.bb
@@ -19,8 +19,7 @@ file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "cd007342017fedfb02d6fde75602e473"
-SRC_URI[sha256sum] = "26fda9f8d279e943d27e43a4a3a5cea8a6592cd36e7308695f8dc6602262c0e0"
+SRC_URI[sha256sum] = "89a4947ddf1564ae01122275584433d7f6c4370370bcf3768922d796956ae24f"
 
 S = "${WORKDIR}/Test-Warnings-${PV}"
 
-- 
2.30.2

