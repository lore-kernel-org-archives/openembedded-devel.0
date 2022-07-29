Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A77AC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 17:52:54 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.15.1659117170898702271
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 10:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p8TMzJKi;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 12so4568838pga.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 10:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W/SZnk4tv78TspX9pNi2nl1BycBJTx/yyauI7551n/E=;
        b=p8TMzJKiV5lXdeiMsevdZks0clwO2YyiiVOuP8PUmu4Voy53J1H5129FH4uwcDbVv/
         FDUmiTVbzmaIMvp3m953W18hO5aydFcepY27oc8Tsd7DhU9A4mtwoMWbBAsAtUpC550n
         cJxmMM+PJ0vg7cXLJNej3Pd4khBDCRSvETv/8XzE/fEX04mNkqM5FFl0CiO6HZrzV9v0
         TLRukhfKRkYAOy+iT4mHtabR2VDI0Swr8g12EuArL2HCAg29jW0L+yIhM6ctETeLfY3/
         3dvrgA57+w5wlOfsHv9hwXoPqR2Moc/YxLijk0V+ZlyEZ0QhRxayazu/ZjOHwF6h+TpY
         B/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W/SZnk4tv78TspX9pNi2nl1BycBJTx/yyauI7551n/E=;
        b=uiSQeWRkyrol2NHCBE++JPIqoyhxoluW2IHuyVFif6J8uA7ssNbDktHgTycwvOuYMH
         ASPGOFOLWdk01kqz/KHAXVOBQWzH6Tpt5XHPzRDweZpaHe5pBfUIWwAazEWbEAnGUYfz
         NsQv3fcW+p6oKTzq/XycIm1VThE4ZbEqSjWSRK538vGYzhf8f7+Xm33KtNJI4HT1wJdN
         ANBB9hIvrSKQYUHRjSfisDkwNrJxDHxBk6ZjaWQQlXR7nmnuIc2G32rpK4Dfosw8O0AR
         gsKxpfYbuAo0xDONJcNoEb3zD9DwrwMJNMzVwqYBScEDt7oQNcpJWmjxfpi+dgH0pKK+
         ycCA==
X-Gm-Message-State: AJIora8R+rrF3s0QDYt92cfICLOqpyzvgYVtc9Li7w5Bn1WcHwRZ6BzP
	NVuNl2S0T1Ab36LjxKoMhPoP5YuZ2gBCTQ==
X-Google-Smtp-Source: 
 AGRyM1vdQbnDrW8jv5FONw258l3IQTT7cFoFw0Lp+tbirkOh+bpESGoYDeERQ7CJnjWIZZzehf0AIg==
X-Received: by 2002:a63:ff4c:0:b0:412:b100:786b with SMTP id
 s12-20020a63ff4c000000b00412b100786bmr3938152pgk.537.1659117169981;
        Fri, 29 Jul 2022 10:52:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8ca5])
        by smtp.gmail.com with ESMTPSA id
 j10-20020a17090276ca00b0016d5cf36ff4sm3790034plt.289.2022.07.29.10.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 10:52:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mozjs: Use RUST_HOST_SYS and RUST_TARGET_SYS
Date: Fri, 29 Jul 2022 10:52:47 -0700
Message-Id: <20220729175247.646743-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 17:52:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98054

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb      | 2 +-
 meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
index c23950301e..7d4e4a81fb 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
@@ -40,7 +40,7 @@ JIT ?= ""
 JIT:mipsarch = "--disable-jit"
 
 EXTRA_OECONF = " \
-    --target=${TARGET_SYS} \
+    --target=${RUST_TARGET_SYS} \
     --host=${BUILD_SYS} \
     --prefix=${prefix} \
     --libdir=${libdir} \
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
index 9b990ecdf3..8ade3bb4be 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
@@ -50,7 +50,7 @@ do_configure() {
     cd ${B}
     python3 ${S}/configure.py \
         --enable-project=js \
-        --target=${HOST_SYS} \
+        --target=${RUST_HOST_SYS} \
         --host=${BUILD_SYS} \
         --prefix=${prefix} \
         --libdir=${libdir} \
-- 
2.37.1


