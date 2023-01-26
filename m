Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D8CC636BD
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:17:51 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.68626.1674717460429623922
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 23:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bcV8QEfg;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id jm10so1099534plb.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 23:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X41mspqlHm/qJmoQ4MEaKS4VXiC0uK/wOsBA8BA2ABY=;
        b=bcV8QEfgrNb7ASnNejNmoD9IKStkTLiDtOpFzoqRM9cfCEbPlmRaiN4sV3WSjgyzJO
         u/onksYJCzEofZLdm64N2DJ4JAiqYo4By6y4xcS8HgK1RiDXqiyTcdMc+xsIR+Gygm5n
         F8CnF1pZDSc/0BffjIt8/J9iB5tqClvU/yZy+5Rm9gFyV5ygiga5SztLjtw01w+RZPab
         xrih3rI6IOcmM6vSVbdUTkr7+W98WYEdignsK1W8gho0mr49pYuPFf++M3KTwJPCZ7ef
         ySTjDcb3Rgk6QjZbQ+MfKATht9LYnQdlPsmd1HzPEgMnKt7mcGex7WGCDufhiuuRB8ID
         BoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X41mspqlHm/qJmoQ4MEaKS4VXiC0uK/wOsBA8BA2ABY=;
        b=n3Br0ZdfViKLjWRl0+MiU40rjq5plszKxlvoou2nbKwTfKcsc5oVr6sk9bXr+EJhEb
         seYS4AsX7iyxMHPwuheYctgfxn/V1qfhxj2zTq+ZzWCJYlZDRC91ag/19VFSMHdNso2Y
         /3/6eMkY28+Cmk9XEtuxNiEoTX0Pfd9alEzpEP5gHjFUs5xNOYaXPg7uRqMSNgCHMzbT
         OdIDcK8KqTVf7UP6QIYM5Pq/ZN4fHkAGouXnWpvmVBpIjENkKCmxSfhW4v8WcgOhXA96
         PuocRoMFdPA6qAUac/MEuew0OmKXMoTbT1Uj/KIyd5QglGe7BlJfhr247iimzZdaokBQ
         jbiA==
X-Gm-Message-State: AFqh2kphzC8R0yE4QEHAesO2T5QVQerqN4LOG2T5aweaOqFh6vB0NQQR
	RhMUyZYjdKqrkk0DCbzg3W75i2AUnN5mcA==
X-Google-Smtp-Source: AMrXdXvF01ACGRf8BNXjlfo7OILONPMeVBjCLpNe5JZk0AgCEmmhmudBOGJUeZirQcLHSthM0n2mXA==
X-Received: by 2002:a17:902:7608:b0:194:66db:778d with SMTP id k8-20020a170902760800b0019466db778dmr34321861pll.32.1674717466760;
        Wed, 25 Jan 2023 23:17:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902b69100b00196025a34b9sm458815pls.159.2023.01.25.23.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:17:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 10/13] crossguid: Fix build with gcc13
Date: Wed, 25 Jan 2023 23:17:32 -0800
Message-Id: <20230126071735.2444745-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126071735.2444745-1-raj.khem@gmail.com>
References: <20230126071735.2444745-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 07:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100792

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-missing-cstdint.patch        | 31 +++++++++++++++++++
 .../crossguid/crossguid_0.2.2.bb              |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-support/crossguid/crossguid/0001-include-missing-cstdint.patch

diff --git a/meta-multimedia/recipes-support/crossguid/crossguid/0001-include-missing-cstdint.patch b/meta-multimedia/recipes-support/crossguid/crossguid/0001-include-missing-cstdint.patch
new file mode 100644
index 0000000000..a12eba8ebf
--- /dev/null
+++ b/meta-multimedia/recipes-support/crossguid/crossguid/0001-include-missing-cstdint.patch
@@ -0,0 +1,31 @@
+From 1eb9bea38c320b2b588635cffceaaa2a8d434780 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jan 2023 22:09:26 -0800
+Subject: [PATCH] include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
+included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/graeme-hill/crossguid/pull/67]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/crossguid/guid.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/crossguid/guid.hpp b/include/crossguid/guid.hpp
+index 61e0f17..70966f2 100644
+--- a/include/crossguid/guid.hpp
++++ b/include/crossguid/guid.hpp
+@@ -29,6 +29,7 @@ THE SOFTWARE.
+ #include <jni.h>
+ #endif
+ 
++#include <cstdint>
+ #include <functional>
+ #include <iostream>
+ #include <array>
+-- 
+2.39.1
+
diff --git a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
index b496531ab1..58b049bb4f 100644
--- a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
+++ b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1373274bc8d8001edc54933919f36f68"
 DEPENDS += "util-linux"
 
 SRCREV = "ca1bf4b810e2d188d04cb6286f957008ee1b7681"
-SRC_URI = "git://github.com/graeme-hill/crossguid;protocol=https;branch=master"
+SRC_URI = "git://github.com/graeme-hill/crossguid;protocol=https;branch=master \
+           file://0001-include-missing-cstdint.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.1


