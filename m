Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C25C25B7C
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 22:09:46 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.1800.1716415779214479161
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 May 2024 15:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LPx6IcTr;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e73359b979so33329731fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 15:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716415777; x=1717020577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LO2nix1oMhXpWYaOO5JXYFZKEHQjpUB6Vm39D+Lu8dQ=;
        b=LPx6IcTrKL1LMVpgWM95DkTVB4gbQ1I7D9pShLY2UQNTaZMJ55yHQRKlaJVsl6M/RM
         v3+rxuXWUAjFCHxagwMEQZR5M0CM9onVqmP5kH2oYwn8tWbkKSoHPycMQvEg2BT+kXLC
         EnsHst5Vhgw57Yirg3EP1mMs1dLa6HqWaGwhxn93YH0pXICODaeNZTPxvQGQNZJpu4D9
         Y+12boSH4fvuv/1lalXgfL2CK38LzNLQSoWV+B9NH1AqwdwoZzgLDZKnDn1X3eY+pOT/
         rtikbZHhil5OZY9RbAt8iEI306t5MShZSCoSZGYRIqpwcox4dcfVKhnhkCp6kGx55L82
         j9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716415777; x=1717020577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO2nix1oMhXpWYaOO5JXYFZKEHQjpUB6Vm39D+Lu8dQ=;
        b=PZFH7u+zfYs3p3luWg5kw/BtsJjutvdZ29rfrTH1kJa4tbJ5Rh7smGpZQNgPGXSoDg
         jgbfWdH7xsd6evega5mAXvaIrzQbpecrD+p7eNLQ9umsbwzm7BAejQE6Ne4l3w0vcF0P
         2CiV/yBc46OtIaSHIRtv6BPNFnk/U8Fr7sQn7BVFF+ZwHdups/bMYQVPdpTKK/aFu9Be
         mhV64KFPzH1h+3P6NKVi+hFL8CO0WC8dZIJcJE+bfQBfe0vVddTV43C+KxkJehJYO8wo
         u5AGR3moC2xrhRDvzXd+wikAkhdSKsU6vNgHIy0+Ueljn/HSh9dFPXXu5eZt0XSn/gTW
         hhoA==
X-Gm-Message-State: AOJu0YywQ2vQRzfK/KP7K5PRPBpnlPCX7bM3YQ4gXXOXy3J0P5UqKS6n
	hH63Rspn3jOtnrfuIOoltBKR/U8Tb0KuyYvLNKUGyAAn0ex0ZqjRHRHqug==
X-Google-Smtp-Source: AGHT+IHnQyjfgq7Wx9ahSV/OxN8TWvZcDVgwAAmuXiIDa8v+yGdig2R4xo/N0femwUzLoZjVdTi3gQ==
X-Received: by 2002:a2e:9119:0:b0:2e2:113c:cbab with SMTP id 38308e7fff4ca-2e9494efc0fmr21664321fa.21.1716415776704;
        Wed, 22 May 2024 15:09:36 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5734d4cf324sm18171737a12.24.2024.05.22.15.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 15:09:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] nodejs-oe-cache-native: use UNPACKDIR
Date: Thu, 23 May 2024 00:09:30 +0200
Message-ID: <20240522220930.3077640-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 22:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110491

* oe-npm-cache is now in UNPACKDIR not WORKDIR
* fixes:
  http://errors.yoctoproject.org/Errors/Details/771012/
  /OE/build/oe-core/tmp-glibc/work/x86_64-linux/nodejs-oe-cache-native/20.13/temp/run.do_configure.1268826: line 142: /OE/build/oe-core/tmp-glibc/work/x86_64-linux/nodejs-oe-cache-native/20.13/oe-npm-cache: No such file or directory

* set S and UNPACKDIR to avoid this as well:
  WARNING: nodejs-oe-cache-native-20.13-r0 do_unpack: nodejs-oe-cache-native: the directory ${WORKDIR}/${BP} (/OE/build/oe-core/tmp-glibc/work/x86_64-linux/nodejs-oe-cache-native/20.13/nodejs-oe-cache-20.13) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-devtools/nodejs/nodejs-oe-cache-native_20.13.bb  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.13.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.13.bb
index a61dd5018f..d4b818f967 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.13.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.13.bb
@@ -8,10 +8,13 @@ SRC_URI = "\
 
 inherit native
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 B = "${WORKDIR}/build"
 
 do_configure() {
-    sed -e 's!@@libdir@@!${libdir}!g' < '${WORKDIR}/oe-npm-cache' > '${B}/oe-npm-cache'
+    sed -e 's!@@libdir@@!${libdir}!g' < '${UNPACKDIR}/oe-npm-cache' > '${B}/oe-npm-cache'
 }
 
 do_install() {
-- 
2.45.1


