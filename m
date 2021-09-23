Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.1582.1632357512701471823
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 17:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oiokVF3A;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id y8so4166709pfa.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 17:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bLqoWhwCebACzJmlpx7LkGMlqHDMt2svUYtgou7lTGc=;
        b=oiokVF3ArnrvTgoAszzAepE156hIYsKq9H9D/u2B0Tp85Ne99sOBD4kugxM71Vf5HB
         +mV4fhVbZ4lazdGqQlEYYCPj+YpJBRkATcmK6LR0yOY5Mjp8sdu2aca/For9m29P7uEY
         79T5D3x1lk0HaKahQ+cqnLt2as2DIaq28eXrp0Hl8C91Kaa4LztEQekPXVW4L1gj+rAZ
         NekyFkImcxrBHa/la+OfY8pPAzWpxcnT+cBVqDLJqm8UVOMX/fvwoAekBwpFousbSYvb
         H1nJiTxe073fxiu/bA5RDTRd7N3YNiK+3BvFtLWabGyUNH57Gh7ePuUhJBB0gbONwhXV
         LEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bLqoWhwCebACzJmlpx7LkGMlqHDMt2svUYtgou7lTGc=;
        b=ngVCdtM00igqrQI6f59577kao8K7KmUDirxwmWY5SrxGaOOwW4sdY7sv/ivAPrAgRH
         5DMB1AwS5IPy0dAan8Ey3yzAuwGX3SSJpP0u+QhOXnxtiB4Jf+VvKBJIysbAiRGj8US8
         NAL+DJ2RNbPnKXhXv1jP9/cTVmbaPgnUJE78Bfx7ssVc6mlgg8AC2PIP5Nwzp1Cpicm9
         R8r7HK0Wy5XjDwWjrsM2C6UuYJOxM3YXRlG0fRdBECdSEBsyW3OunIDFnAP8OlwvBuHo
         F0l+iUKf6764S1gN0FS2F/UDhfEq1Dq05fX1UOJ0v0QpEQK3hUtRMVxYj8qAKKIXPww9
         BigQ==
X-Gm-Message-State: AOAM533a2ZAUZYP8yQvWct6qi/xk7qHQKoqweRszQ9JypeHA/dqUsuPT
	bfM7l9cCVzyN1QMY2dcY48C0wA+kdZ2r6Q==
X-Google-Smtp-Source: ABdhPJyO8NnDvcVVXaAZ8RAlCmoDK6SoPHnVzYpU0z8g8IcJVEorG8MkVYFSjFmTppD3FuIXo3kWLw==
X-Received: by 2002:a65:62c4:: with SMTP id m4mr1584752pgv.453.1632357512014;
        Wed, 22 Sep 2021 17:38:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id q12sm4101191pgv.26.2021.09.22.17.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 17:38:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] gerbera: Inherit pkgconfig
Date: Wed, 22 Sep 2021 17:38:29 -0700
Message-Id: <20210923003829.641905-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
-- Could NOT find Systemd (missing: SYSTEMD_FOUND)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/gerbera/gerbera_1.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.7.0.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.7.0.bb
index 045746aa61..f7d9c76370 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.7.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "expat fmt spdlog pugixml libebml libmatroska zlib curl libupnp e2fspr
 
 SYSTEMD_SERVICE:${PN} = "gerbera.service"
 
-inherit cmake systemd
+inherit cmake pkgconfig systemd
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=TRUE,-DWITH_SYSTEMD=FALSE,systemd"
-- 
2.33.0

