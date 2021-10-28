Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA91C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 08:20:48 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.9820.1635409247584346979
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Oct 2021 01:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BCXAPkXN;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id m42so4943698wms.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Oct 2021 01:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6lCK5SMeEmzAkrCJ7xCkLMdaz6vKxsIAQb5dV3hY3EA=;
        b=BCXAPkXNTq4z3pZh1GeTAh461sw3ccCX8rOVWgB+kN3cbiEiLALKYDub/yIvDCahS3
         WowOn/VVeyat9cINF2mXzHdxDZ1oaYhmkzAuQk2QMP5qbyZrm4Ep3JqGnNb+IJ3ke0nC
         C8m3xChmosCokG0l3jfu7jDqlCaOOkUu1n2IjakUu7hHQ1LjawL1I47tvDV6VD36GAWZ
         dQr5rhflAO/y6Ka5EeshI3pEkCAQ1bzuJ1K9UUC37Z35D7/CXIdvu/4fhd3wJfv/ze3Z
         ftj6zKrqrsQgeZ5mGTLjgeVieqErGmtS/MRFLHRyKxnRM7VoM1mLDtCa8ta+Oxo67Uhz
         tYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6lCK5SMeEmzAkrCJ7xCkLMdaz6vKxsIAQb5dV3hY3EA=;
        b=WhMChvGWKpWZ2LepBnvMJDK5FJVNZW5pxcu5132wxzJt28Omfmac/Kg1NcE71FVMLM
         goIpf73G1bplN/zNEvsgVjbOLXWJAqEz7laB100fN37R6UAjQLOYR74tfmIJ/yRI4gsG
         MfmOGzYgLISs+0BNuKEnV9lfETBXgoIzBXmxRmlECjPjo1CMs/ou2Ryln9ktb48ACqxO
         wSsq2F6XYf2t9Md6mjvQ6oRHCIqpoB1JBB+4EauRqPXmzcMA3o/H5u3PwGmjmLsYi9fg
         DyzdZbnfnYsh6A0Tn7OhGfnyVCxO1lZ8/5TMJXFXxpEGpdh5IW86mJMtq2lV4nmojv4t
         IBYw==
X-Gm-Message-State: AOAM532Vg+slo2LvbUKSIN2e1dW4jF3GlRLYgo5erdrWM+QvdSZP0hSp
	JmEdoybmCcuVmgs3hsmipYsACbJKbZ4=
X-Google-Smtp-Source: 
 ABdhPJw0y1tPlpe49zahPo7J7S2XkpOHW/hTBXTy5q+JC3CL0Ld9ECb9s+yDB/IhC39TYnpsaJTFXQ==
X-Received: by 2002:a1c:cc09:: with SMTP id h9mr2917421wmb.191.1635409246098;
        Thu, 28 Oct 2021 01:20:46 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 j15sm2339986wrh.39.2021.10.28.01.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 01:20:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] nodejs: fix build without scrypt
Date: Thu, 28 Oct 2021 10:20:43 +0200
Message-Id: <20211028082043.5991-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Oct 2021 08:20:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93638

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...0001-crypto-fix-build-without-scrypt.patch | 38 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.11.1.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-crypto-fix-build-without-scrypt.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-crypto-fix-build-without-scrypt.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-crypto-fix-build-without-scrypt.patch
new file mode 100644
index 0000000000..3a2719af34
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-crypto-fix-build-without-scrypt.patch
@@ -0,0 +1,38 @@
+From 048203c97009c907ff3891f6ffa8f375fcf1045c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 26 Oct 2021 08:34:39 -0700
+Subject: [PATCH] crypto: fix build without scrypt
+
+* add missing semicolon to fix:
+  In file included from ../src/node_crypto.h:47,
+                   from ../src/node.cc:46:
+  ../src/crypto/crypto_scrypt.h:80:2:
+  error: expected ';' after struct definition
+     80 | }
+        |  ^
+        |  ;
+
+  and fix typo in the comment
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Submitted [https://github.com/nodejs/node/pull/40613]
+
+---
+ src/crypto/crypto_scrypt.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/crypto/crypto_scrypt.h b/src/crypto/crypto_scrypt.h
+index 4ca888e31d..3d185637f4 100644
+--- a/src/crypto/crypto_scrypt.h
++++ b/src/crypto/crypto_scrypt.h
+@@ -77,8 +77,8 @@ struct ScryptJob {
+   static void Initialize(
+       Environment* env,
+       v8::Local<v8::Object> target) {}
+-}
+-#endif  // !OPENSSL_NO_SCRIPT
++};
++#endif  // !OPENSSL_NO_SCRYPT
+ 
+ }  // namespace crypto
+ }  // namespace node
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
index beed833c09..20e4c6614d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://mips-less-memory.patch \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
+           file://0001-crypto-fix-build-without-scrypt.patch \
            "
 SRC_URI:append:class-target = " \
            file://0002-Using-native-binaries.patch \
-- 
2.32.0


