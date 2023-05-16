Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C889CC77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 05:51:00 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.14517.1684216251351893767
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 22:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MIcKVVyL;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-64a9335a8e7so3054981b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 22:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684216250; x=1686808250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qqiq41hOwXAL5iyvXlgh6KMiwboPyOBpkjLvQWWhbxw=;
        b=MIcKVVyLt226CbDa7RfUc43fpK7j9dEXGgLatL26kYQSSmQX07uqgO5YA3IjCZ4Bll
         Wo7ksP8qXxOnjEwZPTFwyhnstHoHKC3/TCPgI4vdONpP5v4k6QSBPMeKW4xVkNKPNT0H
         AlRr216TVHv2GnV8jssFh3FM4R373ruAtv/o6wPb1rUXZMQayOi04HiwaadyFk/zRx32
         BhV3ebg/lU086Luwj0+OszJfTOpBKhZTaQDq25z8tye6SWiIF1EFMn7/WyCtjZO+z4gA
         o3Gh6qNlnOhfdma6/0+dhjL7QU73OLGtNzZSSH/bHNGe5zGkNn1e17O733PX/P96F4yE
         aP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684216250; x=1686808250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qqiq41hOwXAL5iyvXlgh6KMiwboPyOBpkjLvQWWhbxw=;
        b=Ouj8k1CUuuoMaRY7226zctqicUM0vC3I1AqzJ5wsWdIbuTh6VV0so+BkM5g/oBbZ6e
         Bb4Y7em029sGM16jH4gn/lR87JJONAFp7MyoQbmmgXq8D/0rqP0aRpKGQcX9x3wi1HQj
         gKXoK/GuIRmlx/SL7GBfNsO+RdGM2lvPZNQvUEgRmM3jbmUlfbsNC/71Gdn/C/v5+8uu
         8/1DLIga7ePUr7EJRR0HfWb8sDcVDXdlzQgN2YqrnTGfCZmvY0VTvT2FwPcci5fbe1ga
         zpHvhydvUid5WwYdUdnL+AQFSKt5o8xUNGYeYBRdAosSfmRmwQ7zRr5Aky9MyXbEJLCt
         Jcfg==
X-Gm-Message-State: AC+VfDyXM3oQF8gCscR3W4gxMLa4ruJ00oJJ7mHMJZ75dHfiEIPQZ4rM
	ld2fH5iC4D1pw7fbdVkTVXkwg0Uafhc=
X-Google-Smtp-Source: ACHHUZ6CJMUGYRcuHMkL/oTEG3LiF3QrH7bUlQjXLYFI0R8E7Nv5WuUTO3zrfl7/fHO6/WvV6m2JpQ==
X-Received: by 2002:a05:6a00:a23:b0:63d:45f3:9fc with SMTP id p35-20020a056a000a2300b0063d45f309fcmr43835457pfh.5.1684216250221;
        Mon, 15 May 2023 22:50:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id a13-20020a62e20d000000b0063b6d68f4bcsm12719131pfi.41.2023.05.15.22.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 22:50:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] php: Remove buildpaths from scripts and generated headers
Date: Mon, 15 May 2023 22:50:47 -0700
Message-Id: <20230516055047.3236690-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 05:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102620

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/php/php_8.2.6.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.6.bb b/meta-oe/recipes-devtools/php/php_8.2.6.bb
index 833a70fac3..7e2ea78a15 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.6.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.6.bb
@@ -143,6 +143,13 @@ do_configure:append() {
     # No, libtool, we really don't want rpath set...
     sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
     sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
+    sed -i -e's@${RECIPE_SYSROOT}@@g' \
+        -e's@-ffile-prefix-map=[^ ]*[ ]*@@g' \
+        -e's@-fdebug-prefix-map=[^ ]*[ ]*@@g' \
+        -e's@-ffile-prefix-map=[^ ]*[ ]*@@g' \
+        -e's@-fmacro-prefix-map=[^ ]*[ ]*@@g' \
+        ${B}/main/build-defs.h \
+        ${B}/scripts/php-config
 }
 
 do_install:append:class-native() {
-- 
2.40.1


