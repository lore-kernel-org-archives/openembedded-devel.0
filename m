Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261D3C05027
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 01:15:44 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.2333.1675473339018043425
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Feb 2023 17:15:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QFSti+/I;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so5894621pjp.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 17:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1nW6Lu2dB5q81Z+ZSXWwOqKWehY6EfLfUkc7ewesVdc=;
        b=QFSti+/ISC4Qe8302Xe9t26esKyFVYDi+/crNN2bnFSHO2Bam41dBzIKufDNJ43Z0K
         GYoLoHAl9GsAYQnZCT6dpqgo31kZRtMKwhKAmma16PVg4EVv+KpuskRjsJzEHxPRe3V3
         JMm6SAFxaEI7u3xS44CMIPleuxVhreuek9erzcrRW7ZucyDDZfy2r7K408URS0ZHX35J
         i4ZRvTcOKrFB9/ZQLDRS6hKMCVSVqatMavzlh3U41CttRspm69rFgCyxGDEYZBsoNmz0
         OGUmwgQrnvk+HLNhtkEYE0EOTyLYzXtVTDnqBgeWhxJAYhgYeIGBq2vnowWKYlJWIXgi
         KSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nW6Lu2dB5q81Z+ZSXWwOqKWehY6EfLfUkc7ewesVdc=;
        b=qq8GE3TVQAZQZ7+Zih8MQeaBEtgxFGPNaAXgAnww3WCkk6W5PPdA8oQYuglzAExmjy
         ZWzboOaqeIOfXPF+zOc/fXB71en1LAHtRO++25zyC/OvuKORE9fhtGERsiem9J3b2/oT
         jRA/l+9fT7WJiO9gQXtZUApxRfBaEFOY0zYXz4B0afDUHZenMa9nraKJocxxiVMTl0QO
         6cGcpUcNSbrgyfkp5Ey5rfdGE5wlkhyLN/LPiCoC/1EM8L/C+xHYRe7AhwzCRzIi18jy
         tfTWi3JkNKJhf2TjKJmEA5kmqDDFotkRoHG+9zMDUP8XgIiM433Zu+GP8udD3H6FdiKv
         Sh1w==
X-Gm-Message-State: AO0yUKWwxjixqUVc4EMAuUxiCnWwUQmghc8yNLMnKIaeXYllZbfZYObp
	wQC+2rOxlbXk36b5Fres4gVbhiGm9Fc=
X-Google-Smtp-Source: AK7set9ZhILPjMxNf0/M29h7AGBdvgBsOsiXEJKJfcTf1E6cfpzHbb4rs8ywsaYmzOLSbbKLshAuQg==
X-Received: by 2002:a17:90a:1a5e:b0:22c:59c3:8694 with SMTP id 30-20020a17090a1a5e00b0022c59c38694mr12516112pjl.44.1675473337824;
        Fri, 03 Feb 2023 17:15:37 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:8249:534d:6deb:94ee])
        by smtp.gmail.com with ESMTPSA id cv20-20020a17090afd1400b0020dc318a43esm2249146pjb.25.2023.02.03.17.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 17:15:37 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Archana Polampalli <archana.polampalli@windriver.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [meta-oe][kirkstone][langdale] nodejs: upgrade 16.18.1 -> 16.19.0
Date: Fri,  3 Feb 2023 17:15:16 -0800
Message-Id: <20230204011516.2347397-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Feb 2023 01:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100927

* 16.18.0 (npm 8.19.2) introduced a regression in git+ssh urls
  - https://github.com/nodejs/node/issues/44992
  - https://github.com/npm/cli/pull/5761

https://nodejs.org/ko/blog/release/v16.19.0/

License-Update: Clarify vendored OpenSSL Toolkit is OpenSSL and SSLeay
License-Update: JS Foundation -> OpenJS Foundation

https://github.com/nodejs/node/commit/e7ed56f501389978e4619ab697a812631c4061ff

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../oe-npm-cache                                            | 0
 ...ache-native_16.18.bb => nodejs-oe-cache-native_16.19.bb} | 0
 .../nodejs/{nodejs_16.18.1.bb => nodejs_16.19.0.bb}         | 6 +++---
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.18 => nodejs-oe-cache-16.19}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.18.bb => nodejs-oe-cache-native_16.19.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_16.18.1.bb => nodejs_16.19.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.19/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.19/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.19.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.18.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.19.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.19.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_16.19.0.bb
index e755d0c9aa..4e845f41dd 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.19.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6e54852cd826c41e80c6d80f6db00a85"
+LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & OpenSSL"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ab4d0d45e717c9978737499a3489e515"
 
 DEPENDS = "openssl"
 DEPENDS:append:class-target = " qemu-native"
@@ -36,7 +36,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "1f8051a88f86f42064f4415fe7a980e59b0a502ecc8def583f6303bc4d445238"
+SRC_URI[sha256sum] = "4f1fec1aea2392f6eb6d1d040b01e7ee3e51e762a9791dfea590920bc1156706"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.30.2


