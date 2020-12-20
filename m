Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.25760.1608483248259591041
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Dec 2020 08:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dZKejToT;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id x12so4353201plr.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Dec 2020 08:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1UBC245Dq3sb/tASk6MsPf475HWArjaoeiUhCRYxJRA=;
        b=dZKejToTWfQoal4YHQ3h9gkaj7ue8Nl6s3YSCWRtbZzYbn5wNCv+vLjayDczAM8Vga
         +PLJoGeF/xR8kcJmpCM9Omvs+5OqH8S3YSMvJgjQl3k1qNBzysPtavVp3N3ihV6PChoJ
         oIzLdmjZlXR/Lgar8/sNaaDxrbufuH0HC7P26eph5GZSsrRk1RQhWpxmanXJBF11UaST
         mMEq+WNXLE/N9UpLiPvcx7LcmAsTqn6/t2jjJ/XY+w5z/RryHllE701yrU8oLTOqw3hX
         TSIEcpznSNmX6Klp5OpzFCtxmd38GdQcPBbfLJ/iICTY8B1Z9eSU9Hl1Do0+7R9pIQDC
         Qvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1UBC245Dq3sb/tASk6MsPf475HWArjaoeiUhCRYxJRA=;
        b=DrZoe1aqh8w4wmUkSptTalf3bWKEtRGhGJOrkUVou6CHN8zNZUec/jY3+X4IWcEfzD
         X8OnJfy9rFHnziVyJCd891W7gNc76PI9fhVT5U2X/aFyQT8jM3eUK6ahNbZcTCttfUil
         CnaaZq7rBUEjTq8cY7PuTMgP8yjm71mBRITxMx9TMVLrRBOBmPxZBX7nsKOUV+toCokW
         ow3OoP8MsiTi3Tx8iMXh1dANVk3nqRP/ft5PuwUW8lxFnAjAv3pm+FNX9b9+CNYeVpJm
         XTDZWwRfMgbgMz8LEnYo2ypRMkvDPCH27SNWPYcDMkMH1OUtVz5IC8WXa6GMuBg++0ks
         CI3g==
X-Gm-Message-State: AOAM533PhLQjpOZdBusz9cA8MvswaeBhWBqN59HICNNxvYzA0D9Zz/+g
	PKyTfoIW63N4NEI5p8OrDflxCSPAxQlalg==
X-Google-Smtp-Source: ABdhPJxm4RscjGSzaLQeRJ/dRdTXnR5tMf7RWnRVJlcnwUevGejEEx9JORAvyNs8JGju+pizTnG0Hw==
X-Received: by 2002:a17:902:a511:b029:dc:103:db16 with SMTP id s17-20020a170902a511b02900dc0103db16mr12753120plq.80.1608483247503;
        Sun, 20 Dec 2020 08:54:07 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:81b4:28ec:120:f083])
        by smtp.gmail.com with ESMTPSA id j15sm14192234pfn.180.2020.12.20.08.54.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 08:54:07 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 3/6] php: remove the failing ${D}/${TMPDIR} code
Date: Sun, 20 Dec 2020 08:53:57 -0800
Message-Id: <f6338892d9c57c51ed48b04f587b468f7718a8ba.1608483161.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608483161.git.akuster808@gmail.com>
References: <cover.1608483161.git.akuster808@gmail.com>

From: Max Kellermann <max.kellermann@gmail.com>

Appending ${TMPDIR} to ${D} doesn't make any sense, because both are
absolute paths.  And additionally, the code fails:

 rmdir: failed to remove '/usr/src/oe/tmp-musl/work/core2-64-oe-linux-musl/php/7.1.9-r0/image//usr': Directory not empty

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/php_7.4.9.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-devtools/php/php_7.4.9.bb
index abd8b167237..1da56078350 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
@@ -155,7 +155,6 @@ do_install_prepend_class-target() {
 # fixme
 do_install_append_class-target() {
     install -d ${D}${sysconfdir}/
-    rm -rf ${D}/${TMPDIR}
     rm -rf ${D}/.registry
     rm -rf ${D}/.channels
     rm -rf ${D}/.[a-z]*
@@ -179,14 +178,6 @@ do_install_append_class-target() {
             ${D}${systemd_unitdir}/system/php-fpm.service
     fi
 
-    TMP=`dirname ${D}/${TMPDIR}`
-    while test ${TMP} != ${D}; do
-        if [ -d ${TMP} ]; then
-            rmdir ${TMP}
-        fi
-        TMP=`dirname ${TMP}`;
-    done
-
     if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/apache2/modules.d
         install -d ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}
-- 
2.17.1

