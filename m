Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web08.3613.1617934879054418216
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IYKf7fCV;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso4375066otp.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=TomsE8G7MUdVOomd8AA4PtTT6IiQEXcsZP7VFhCwM2c=;
        b=IYKf7fCVZuawNL6y+3cZudMU9CdCRw9rA8lkq/jtGdKdipxrhd2PKYaANI6Ro5ZVPa
         ACvN7gqimJXdlPNIF3Hs45WJwVgbuV6t6+DflEBADrQlt56sysDT4hUmfJNCclTsU5/N
         YZ0MrohYWcg1J6J4zrgtBXr//Hkiy2XIrqjF6Eip9wdYWmyg37pQOcJL66bcb3BhNWxt
         5HsU4BMWCg1nqXqSLtCEiVuoNfMmBOM4RGtv/eFH9XCxmDyLAkav7U4iE5UcJn+tzEPa
         oO0HbOFxjEotyT7419eWiN12ADYctWn5zki+bfk00HfsSYckp8UpAbzAUfcW9yxKeeCC
         +qDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=TomsE8G7MUdVOomd8AA4PtTT6IiQEXcsZP7VFhCwM2c=;
        b=DiG6YWsk4/7jAi3kkCil9FH240fP1nWcGqx0L0JzkHjIkU+0mEbF6Tkx9QatBKI0ER
         A8k6rQRPl9xwQf1Ur0bHgKWiSpyyPyu1xDRIxtsYvs2egwSXiMu2NkJTtHoso47aBhFF
         zjrd1Wtjpgx3OU8HPJlK9LDPD723MwWwKYxYAeGpxzX3YmmItGznUUj8byCtxSUgooc2
         ex/E9dvXmTqcObvoQYmq9ebGIxHVYfS3ZDk3FckhQHUSYeJNiy/C5cI1V6vbjsoC9OwZ
         8HY3Blg4BtCDtXGEpbPxX8Jxs6PqcEg3MniQEPpy2Pmb3YZq4zTMe6qw+9G+qa1EhgSs
         oW1g==
X-Gm-Message-State: AOAM531EjbwmHSvtKr+q8/EragAxRxtwj9xr+wJPEsHwnc05qfXo6KNC
	AaWHIsFgcoGPlJwSe7YXEer/q798MIc=
X-Google-Smtp-Source: ABdhPJwnjp+hSa7pN6766JbkOEJSBAPWojC3mFZ5qRDtiSzndw5B7ov1J6aQJ7BamqnePeuUUnLgug==
X-Received: by 2002:a9d:3423:: with SMTP id v32mr10525987otb.168.1617934878186;
        Thu, 08 Apr 2021 19:21:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:17 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 28/36] mosquitto: upgrade 2.0.9 -> 2.0.10
Date: Thu,  8 Apr 2021 19:20:41 -0700
Message-Id: <525c7ec0bf06752be7b32a8381c7e66d73ee8867.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bb60da5cfc3fd9a636a15f319a372d935f68355e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../mosquitto/{mosquitto_2.0.9.bb => mosquitto_2.0.10.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.9.bb => mosquitto_2.0.10.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.9.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.10.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.9.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.10.bb
index 97a380117e6..b815ac3b494 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.9.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.10.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://1571.patch \
 "
 
-SRC_URI[md5sum] = "b77cee4ee6f0d32ca8816a58167e8b1d"
-SRC_URI[sha256sum] = "1b8553ef64a1cf5e4f4cfbe098330ae612adccd3d37f35b2db6f6fab501b01d4"
+SRC_URI[md5sum] = "3d1c327d8c5881f56983bee1e3c8f068"
+SRC_URI[sha256sum] = "0188f7b21b91d6d80e992b8d6116ba851468b3bd154030e8a003ed28fb6f4a44"
 
 inherit systemd update-rc.d useradd cmake
 
-- 
2.17.1

