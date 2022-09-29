Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C04C07E9D
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 05:55:04 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.7004.1664430896188256245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Sep 2022 22:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F8vfEIhF;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id a80so535945pfa.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Sep 2022 22:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9LKOGGNNmEyk7ZXpFlthBmJpP9uGdvsus139ZzW5Pu0=;
        b=F8vfEIhFwJ+ycZgBDGCmrtDqK4/2Kf7Y2RRJE5lys5O1FvUooR+In15Sw4PYQIXPSU
         +f+RtjThd8+SRrR5+UzJ9yqPVzfG4F/FyEUdqCWk4atSB/tIq+/lVRb5het4jOYCJ9SX
         magVvyQo4W8ukjoBqTwAk4aFcHnqZuezcQMP+nAYUdglhI2XuLeVbQT7kk5HjO/ntOHc
         jg27Jb76Wb2xfvhCoKZggcXq+fAdm6vYKPIoNhY+2ggNoig4GYahNYAf/oR1ZV+xpEV2
         hm7jyqFLSPyCZ/399i6IzNCMzDzeQClAQWwbRuR/rO33W/rg61E8rNqY9BX2ouJfk1/3
         AWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9LKOGGNNmEyk7ZXpFlthBmJpP9uGdvsus139ZzW5Pu0=;
        b=rRvaDx8M2HY5D1+CPTDsFmnKfl7GtNOxeDMTx4L2aexJ3nKgzVhH/AGiRUHmMQ8dqf
         RU/KSA/6exNetxV6SSQPABQKbTf7heXLd52ga9METHvHnsaAT7DwWm16sEk4uK87dZB4
         vLQpY/Hs2M+IdtLo4N84tSd0GbachR56zrHozJlEb9tmgjjqrGsBZCLaCtR3QLKNGYqz
         ONFbOTV7H1xFuAwHQ+E7mPk2XMqi3J9VOoPInSPNlnxdGlSS6nXvwggfki4n0P3IVCFn
         rtOpdMnguMHuYnHMex1RLizLGtLMKS31h9GKfJ52PxW/I0ITXYXH360B5luEH8QF0nSE
         iT9Q==
X-Gm-Message-State: ACrzQf0vWR4rb43rYHB8mKNU1lBo7FwcQMsSCGsAtR9g4PeMH/Dym0p8
	zRzFr9KxognjdQpCkmpbE1QwmQoN4ivw2A==
X-Google-Smtp-Source: 
 AMsMyM4TwbnJoYYCfp1IPZIIwYZD/fetXM1a+OwfKWUKlauW3rJWFfljzdP0FLUNV2/B5GXzJ4LLEQ==
X-Received: by 2002:a05:6a00:114c:b0:528:2c7a:6302 with SMTP id
 b12-20020a056a00114c00b005282c7a6302mr1553758pfm.37.1664430895272;
        Wed, 28 Sep 2022 22:54:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::dee7])
        by smtp.gmail.com with ESMTPSA id
 s1-20020a170902b18100b00176e2fa216csm4878194plr.52.2022.09.28.22.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 22:54:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-gevent: Avoid building internal version
 of libev
Date: Wed, 28 Sep 2022 22:54:52 -0700
Message-Id: <20220929055452.63368-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Sep 2022 05:55:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99000

Use the system version. Moreover, internal version is not cross compile
friendly. Ends up with

| cc1: error: include location "/usr/include/python3.10" is unsafe for cross-compilation [-Werror=poison-system-directories]
| cc1: some warnings being treated as errors
| error: command '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-gevent/21.12.0-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc' failed with exit code 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-gevent_21.12.0.bb     | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb b/meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb
index 9efeec4d9f..5cbb3268b0 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb
@@ -4,7 +4,7 @@ a high-level synchronous API on top of the libevent event loop."
 HOMEPAGE = "http://www.gevent.org"
 LICENSE = "MIT & Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65"
-DEPENDS += "${PYTHON_PN}-greenlet libev c-ares"
+DEPENDS += "${PYTHON_PN}-greenlet libev libuv c-ares"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-greenlet \
 		  ${PYTHON_PN}-mime \
@@ -15,8 +15,10 @@ SRC_URI[sha256sum] = "f48b64578c367b91fa793bf8eaaaf4995cb93c8bc45860e473bf868070
 
 inherit pypi setuptools3
 
-# Don't embed libraries, link to the system instead
-export GEVENTSETUP_EMBED = "0"
+# Don't embed libraries, link to the system provided libs instead
+export GEVENTSETUP_EMBED_CARES = "0"
+export GEVENTSETUP_EMBED_LIBEV = "0"
+export GEVENTSETUP_EMBED_LIBUV = "0"
 
 # Delete the embedded copies of libraries so we can't accidentally link to them
 do_configure:append() {
-- 
2.37.3


