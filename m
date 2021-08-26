Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.30623.1629985600058809144
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 06:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=MSkDdV/I;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.180, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f180.google.com with SMTP id m4so5208225ljq.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 06:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=featfttNzvwk21MyesnAj089FnND/hw472XgM8ZYd8o=;
        b=MSkDdV/IqBGxU0QUIGn07fopPQZSv2BNNmbXnsJfYzfBVpevG/itBIY3WTNrpFORgq
         zHXKhl3LVdqMyrt9mw/G0rfkuVYXapIO1V2sn3p+s4zGHEQ0+bj+Yhve7k++6qsjx2qK
         dj9OvN3FeRFWu2IE10bNigFcD0gOfAVSncYjI7QeRGgrr+C0YhIiFODDjkOgpapL+lG3
         9GTkFM7EkQTN7uOyOe0t3A3z64R+PJl39x5r2jPS4mTg5BikfSmGwbPIenkWl72pUr6s
         nIRIJwblq18Ug2Z218TKzgvq3WqskdkdxuRsBVWBQoS0Gn6uI2qIN8kTI4AMGZ0XUiG1
         Loig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=featfttNzvwk21MyesnAj089FnND/hw472XgM8ZYd8o=;
        b=AZdKaqydbq5+P/PLa2EYp821dddD7wPM1WiRo6wWTh9usrtqDgXSYvPiyS8TpQ3PGW
         qgj7T17j2AhAU34/hMMfbenmfAYZOeBskFeMX+1+XeW6b9z4K9EdGfoDL7ThsCTlvFn9
         kQuwcLxcxI0MHvuMm1l/tZa/O8rUtVCOfqX52cumnMO1kXd+OstCgTy4+o1GIbRbm4zw
         TgB/yj0KRoCNaGrBgxFlwkDSN8+cPqihNH8zLLOvspEJXrjp+sepRpMDvQigXx0KR6eo
         Pv1mrPPZ3qGqNKcgGCvDw9m5JrEbFCYX40mwONBFo+K3y+7msEG3+iviF8ChNcum8H2P
         wHgw==
X-Gm-Message-State: AOAM531OO3L81wCSe8W0wOG37P2kpl6jcmWhKD9SG47i+gJ5QHg9S1Dm
	1avlCFjXApc17pz62FZAYuD1Mjq8Yov4Fzok
X-Google-Smtp-Source: ABdhPJy7E3+OGEYi6a0jRY4+BYGl+Z8d2CsFwI2YPFZ58dAUQ3DXX4TIDlXTNiOQdYPPScFbXzxB3w==
X-Received: by 2002:a2e:9b0b:: with SMTP id u11mr3101892lji.463.1629985597936;
        Thu, 26 Aug 2021 06:46:37 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id x16sm323757lfa.244.2021.08.26.06.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 06:46:37 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] iwd: update to 1.17
Date: Thu, 26 Aug 2021 15:46:35 +0200
Message-Id: <20210826134635.2545299-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
- Fix issue with sending additional and vendor IEs
- Fix issue with IE ordering for 802.11-2020 support
- Fix issue with frequency update on channel switch events
- Fix issue with drivers and handling of IF_OPER_UP setting

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.16.bb => iwd_1.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.16.bb => iwd_1.17.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.16.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.17.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.16.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.17.bb
index 6bace616a..00d94f36e 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.16.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.17.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
           "
-SRC_URI[sha256sum] = "af548398aea2089a3a5103e5586561f24791090a17d4b2e50785e2faab5ed03a"
+SRC_URI[sha256sum] = "6f946f823b0dc3205e4e72becf8ad1915448d194f5b10d8003e4c8c5a18e4ef7"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1

