Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.4016.1619735999550379216
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Apr 2021 15:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ak468QpD;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id y2so1312956plr.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 15:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=302whN9IQny7GTuNPFvNvTfqkJdeGcxRMzSkoZJrYRE=;
        b=ak468QpDi5gcBSNqN/LWg6NFtc1DNl5bdM6o/dQgcBhxFei2M2ZzSbrhl2zv+E3yZY
         kQ8NwI363TVv+y87ATILkK74wddnCwBYAlW555Ss1x/uKQzxv8Bj+9lBYhrHCtrZMX7G
         wCzy/NyO8QatTV6+Bwe3p6FWe0rBRZRzCMrRVe6jxL3FRcvsLhRdOwd7oYLH+Ibq1yKQ
         Wvd3U4FgZX5XkDMZMMQuLit16Nnm9jPHy/A/2N5r27PmV2wBOQYXKPLA3LitNXhSy+x8
         KmdEWvVRkJN3nLsClLoNgcmzlr2w1nIVOZ2gyt5mUqyBMl5oBYs08pA6/ofDsNuw3KAY
         mmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=302whN9IQny7GTuNPFvNvTfqkJdeGcxRMzSkoZJrYRE=;
        b=mpfuornePAzjrqJFiQlqs4IQ133pdHY6MpkMYZiqHrAuRPyq72I+LCWiX5K3MqOg58
         i7v22X/UGHsfagRgnbI530vH6ySQfwcxdZHzUB4CkTmt/Zw75yZM3UbCm6geD/akPQjA
         r7YuM30YH8AjUJGdFeXJRnBPDl/6vhmrQDgP6b9q+Mr6xJWDGMFi9320vxyDcAHslR5+
         rcTBm2vHn0FkqBcwXPcIiV5YOOyaeRFGbBDQJeSdB37SeYZSlR223Nho2Ass4amiGGMf
         gBcaKA0EkLB5OB8BWW1il91nu7G5l3jVE+tLnB8V/R4nFycPfPSxY7d9E6DJp2fybkr/
         2Vdg==
X-Gm-Message-State: AOAM532j3RxQ+Fzs5/BOsa/g0jdwyA8uRs5yza/nXFa4dHqpNEzAeBmm
	ZSRasS5Yxxo+PrEwQUgHKbgAPGo6KigmuA==
X-Google-Smtp-Source: ABdhPJy5ssyFQ5h/iUUYf8FKEmajyoTKZZijuReHjAaNoMEoXUgnmXPX0xh/l1Hh3gV8flcue1TjJg==
X-Received: by 2002:a17:903:31c9:b029:ed:6f56:9d1e with SMTP id v9-20020a17090331c9b02900ed6f569d1emr2128363ple.46.1619735998850;
        Thu, 29 Apr 2021 15:39:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id u18sm30081pfm.4.2021.04.29.15.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 15:39:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 2/2] apache2: Deal with -ffile-prefix-map
Date: Thu, 29 Apr 2021 15:39:55 -0700
Message-Id: <20210429223955.1878527-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429223955.1878527-1-raj.khem@gmail.com>
References: <20210429223955.1878527-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Filter out -ffile-prefix-map as well along with other -f*-prefix-map
options

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
index 197cb83e64..e84f7eaa2a 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
@@ -115,7 +115,7 @@ do_install_append_class-target() {
 
     sed -i -e 's,${STAGING_DIR_TARGET},,g' \
            -e 's,${DEBUG_PREFIX_MAP},,g' \
-           -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g' \
+           -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-ffile-prefix-map[^ ]*,,g' \
            -e 's,${HOSTTOOLS_DIR}/,,g' \
            -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
            -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${datadir}/apache2/build/config_vars.mk
@@ -123,7 +123,7 @@ do_install_append_class-target() {
     sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
            -e 's,${DEBUG_PREFIX_MAP},,g' \
            -e 's,${RECIPE_SYSROOT},,g' \
-           -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g' \
+           -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g' \
            -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
            -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/build/config.nice
 
-- 
2.31.1

