Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web08.243.1617899782471398213
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IXIHfsto;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id c16so2806740oib.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=YUGM4nbPlCyBO+mOdzHpISc4CfdYrHEHBe1YmSd3y/g=;
        b=IXIHfsto18B8dzaN29F72EmVIlmFF2dm6/QFCQ8CbvZTnAmkcuITOeLiDmQqAxe4Kg
         bf86dwADc5kFHV1bMxIDBjTVzzOofDHw4xxGFcjK/ZO+IqpZ8RYfCc9HtfA6k4xb+abJ
         lB7WLIppVLaW5i2IOms4OOQGB19XyQvA8XQcQLsC1i2nACj/Hqxio1KLE6SidxXc6mWj
         PqJJVO9+bas7cj7yfGkf3sP/zKJZeiU7R0rHwnyj5exI88klY4RVID7gFWRVC9ytQywC
         EEtcRqXpvO+xXqlVE0oSMfGrsL8iROTdqqoe0uEzbiB01uWhEkFewgmcbH7nKK+snVL9
         u/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=YUGM4nbPlCyBO+mOdzHpISc4CfdYrHEHBe1YmSd3y/g=;
        b=frZd74bo4YQGLIi0lPmR9g+RUwRDySyiCxoZtZaP3SNuQYnE9Hl/z1SvKUrLrYpu1r
         VovriiDbU0NzE4hMbCt2R1uOyi8L5XT5/JsfjxddQX9KZwmhGTlJbO/arNGbBV8Di3Kf
         AMqN73s9i34+mJuE0KOHkFjgnlRnxePOgDPw/IMTPH2PwuMegRcRFfk9qHWu3fQA6jm3
         M2nDQ08DM4HFpALbWHpKazNOz0lKwq9JDAEBtmHtYyAssq62Swg1UrAJQaeLLzYll5nt
         g9zsmeA9kS72UvaCyCZ54+KwlSXIMu+ilqXIDSqgGElQTBT4LBNsCUWO8ZNZVdfmInTc
         Qoeg==
X-Gm-Message-State: AOAM530PUrqavMnKa0VCU7Z8bNn6kKU59f/yh8Deu95V/k7tJcX1dGc+
	vopq4Itnk/ujy42QZ0siIxVSgjR8kk8=
X-Google-Smtp-Source: ABdhPJwxRTmutv+CPZcyUJ4KqZtbpL9RfRSqOerj1c8tZ+tNKPnRu/Ub0o0qrDf8eH8scD8co9g6sQ==
X-Received: by 2002:aca:1803:: with SMTP id h3mr6856425oih.65.1617899781725;
        Thu, 08 Apr 2021 09:36:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:21 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 07/64] packagegroup-meta-multimedia: include vlc only with x11 in DISTRO_FEATURES
Date: Thu,  8 Apr 2021 09:35:14 -0700
Message-Id: <96790373d132b5131fb083695a376a32982592ee.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit af3abbf90f82ae7277506d1b68b601462e4d5d23)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 0a82b8c2f1a..73b852a4a91 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -67,7 +67,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
     openal-soft \
     opusfile \
     libdvdcss \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "vlc", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", bb.utils.contains("DISTRO_FEATURES", "x11", "vlc", "", d), "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "sox streamripper", "", d)} \
     tinyalsa \
     tremor \
-- 
2.17.1

