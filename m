Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC96C27C52
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 07:52:35 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.9721.1717573951602223777
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jun 2024 00:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JtiGpUwJ;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eabd22d441so24789791fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 00:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717573949; x=1718178749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7PRbZlEBP6G4HrEnnTFsPNFCTYyULihjL1uIyhnxG0=;
        b=JtiGpUwJuCx7PSe0iRHIwfTu7yi+VmHKkos9936h4KJGmw30LAFMBCOspVX6aI3z4E
         un1K8PMvLcm4hxJTVpkHgQa3mCnyV7mzaIfEoXlk4Y42j9wqVReMobfsH92v7JN+l4Gh
         Msc4fuKFCir4cwb/o00RhCwte3GgkecjraxEjUZ9hyrnpa4E79gq3lCrXiAi2GxzRok+
         8XVQHOvH26obfGZd+vtbK1iH1BswQFooOAIP1XrNrRh0KHZZJxf1uKiy/GeunYcTbz5p
         SqU7AXnu75cH31XiUBFOMUUN7hX8vwGVpixYMF6YF44o9VpPjhTJwSnCwuOuLqurx9tt
         p5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573949; x=1718178749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7PRbZlEBP6G4HrEnnTFsPNFCTYyULihjL1uIyhnxG0=;
        b=DWfiXA/fyLBplpqWESDs1jSStVozNUKIBLeFR0m0ATzXsZPw9hGUWHW5DLRibXO84R
         GI2+al0Emvoo46NrNkFIRHk6gzclrJ9S10KKesLnYPZeZJmlujV6Rt84RIoc9GFnSTDC
         v4zgR/Sp0TgGbQ5R+OjCc5o1hXw7FsVAqoYB1jWKmCEKk5xTpZX0I2vCLCpiOx4tQFyl
         PqeiRWmC+tqOyyc52xbURCcxkGBAVxi4R4ZuYKRZ3MjPvifExWoR/F18fD6kP8jg+H5B
         1C23u4B+ygcB8F3ikzjMQ7ctb2QALvzpCwvRTDdmh7GrfN6wYc1lwnI6urGgz8JOFKTM
         jYmg==
X-Gm-Message-State: AOJu0Yxf0LKbtsJuHcy7F2HVnC9960duYz6OmIP5BRbGiVWJkJR1r1UM
	nOgkbqAhTzmDM1eixlhF7vq8r4MQTE50Vuww6NUWlo7SLKs+wRultHplW3/MNUw/a9cc08JGEfX
	0
X-Google-Smtp-Source: AGHT+IGC5KeiEhGYpxycuPz089gaFGAp07JrCF9B3vn9NHlOqOCVlH8XYdlEPFBWN9JZCiIlTYrbBQ==
X-Received: by 2002:ac2:48a7:0:b0:52b:77c9:182 with SMTP id 2adb3069b0e04-52bab50b8f9mr1313253e87.68.1717573949353;
        Wed, 05 Jun 2024 00:52:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b9c8a7766sm690199e87.181.2024.06.05.00.52.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:52:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v4 3/3] ntopng: fix building with GCC 14
Date: Wed,  5 Jun 2024 10:52:27 +0300
Message-Id: <20240605075227.1833641-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240605075227.1833641-1-dmitry.baryshkov@linaro.org>
References: <20240605075227.1833641-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 07:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110699

GCC 14 is more strict regarding const pointers conversion. Fix
conversion to let ntpong build with GCC 14 and updated rrdtool. The
patch is not submitted upstream yet, the project requires singing of
CLA.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../0001-Follow-rrd-post-1.8-change.patch     | 32 +++++++++++++++++++
 .../recipes-support/ntopng/ntopng_5.2.1.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-Follow-rrd-post-1.8-change.patch

diff --git a/meta-networking/recipes-support/ntopng/files/0001-Follow-rrd-post-1.8-change.patch b/meta-networking/recipes-support/ntopng/files/0001-Follow-rrd-post-1.8-change.patch
new file mode 100644
index 000000000000..eefd4e1ab2ef
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-Follow-rrd-post-1.8-change.patch
@@ -0,0 +1,32 @@
+From a3bd9efe78f9c381f19b99c8ceb7f52b4c2a52b8 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Date: Wed, 5 Jun 2024 09:40:17 +0300
+Subject: [PATCH] Follow rrd post-1.8 change
+
+Git version of rrdtool has changed rrd_tune argument from char pointer
+to const char pointer. GCC 14 is more strict regarding the pointer
+constantness checks and errors out in such a case. Update rrd_tune
+invokation.
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Upstream-Status: Pending [CLA is not signed on our side]
+---
+ src/LuaEngineNtop.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/LuaEngineNtop.cpp b/src/LuaEngineNtop.cpp
+index bd2de79e3021..dd00f1608f78 100644
+--- a/src/LuaEngineNtop.cpp
++++ b/src/LuaEngineNtop.cpp
+@@ -5427,7 +5427,7 @@ static int ntop_rrd_tune(lua_State* vm) {
+   filename = argv[1];
+ 
+   reset_rrd_state();
+-  status = rrd_tune(argc, (char**)argv);
++  status = rrd_tune(argc, (const char**)argv);
+ 
+   if(status != 0) {
+     char *err = rrd_get_error();
+-- 
+2.39.2
+
diff --git a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
index a9ace9b41267..9bb93910f89a 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/ntop/ntopng.git;protocol=https;branch=5.2-stable \
            file://0001-autogen.sh-generate-configure.ac-only.patch \
            file://0001-configure.ac.in-not-check-clang-on-host.patch \
            file://0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch \
+           file://0001-Follow-rrd-post-1.8-change.patch \
            file://ntopng.service \
            "
 
-- 
2.39.2


