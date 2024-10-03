Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED624CF34D1
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 22:54:39 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.9792.1727995886741923491
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 15:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q/RsX5g8;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e1f48e7c18so12097197b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 15:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727995886; x=1728600686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IjHx3rJJ4EUtzaXS03F0zSqpecj75XOOYaJlv7NVUIw=;
        b=Q/RsX5g8wKgkB5Ck1AfbQxB33rx0QNPAMaZNgabGdrH2IkD/PBihk8yPETltHizh3Q
         IBD8ONVWWG9litVpAuIVX+w/Uw8JaRLKsgjXpfrz4ZcXFfnIPHHbHq6hKkobsxhO5Sel
         QThN7ej6PnsV2pnZRpDkajMeMdQyYVKHmuDDwdxgJKChhLQqKzQ4b32fdS2ph05hGxSb
         MSm+WbDE6oS1Ygo5K2I/zhyPAw+YDf6BCmyc5jxfOws2Iys0QBYugaaI1ZXIy+CebvsD
         ZCWpYsoH6gd15fs88uXLHh9OPUv5kV83rbGikg+S/O0lmFG2dCq2vDFrjmjWVF9j5OJY
         dulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727995886; x=1728600686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjHx3rJJ4EUtzaXS03F0zSqpecj75XOOYaJlv7NVUIw=;
        b=a5M2FZs+MfkYv379Q4PlWugK8g0KxC1yaqci1+w0fjxXdtrQ9SCIQKXjsGB0lvfqtI
         DXft7vMVHvdT5Qs9SEA6DwtVOKquRRbxuiKJd6rwvkACu1AF1OKc7DUGr7RSurX6fP4+
         THI8awn99wSVN/mou36wxheg8Z9wAXjhnfsaNQTX8utqqOIVG7lkfs/rfj05onWBWNFh
         FVsGGEndlbtlKpInYhOw9bhCgwctKHkvYv+4C14IsSww7yjWN6ofEYpytZNoVObHKbIB
         z3CKoZeqgwWHCFoYWLMr5yW+AsAaiggA6l1IQgYETGK6UqTBtxScdCRWcbEeucfBa8zL
         wX5g==
X-Gm-Message-State: AOJu0Yy53NIuZl80WUM9qanJRpy05KYrHMaYq+S+cShRxT0Ld/S2lIvY
	IBjLUF9NjSsb0BlH4Vj/MEVBn4W7Lyqu5O1WWkz2zPT17ggN5iBxtByEpg==
X-Google-Smtp-Source: AGHT+IFVb/q52QpWIDjhZKMOyZlxqNMf3amf5EJaGBLsPCSB7pt1/8V5373E74ourL9xNWZUnszbPw==
X-Received: by 2002:a05:690c:f14:b0:6e2:1467:17c0 with SMTP id 00721157ae682-6e2c724119bmr9972307b3.8.1727995885381;
        Thu, 03 Oct 2024 15:51:25 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bc2d1c5csm4092177b3.67.2024.10.03.15.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 15:51:25 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 20.17.0 -> 20.18.0
Date: Thu,  3 Oct 2024 18:50:06 -0400
Message-ID: <20241003225007.4612-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 22:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112652

License checksum change due to whitespace changes.
https://github.com/nodejs/node/commit/1dfd238781

libatomic.patch change due to changes in node.gyp
https://github.com/nodejs/node/commit/25c788009f1fa7a392af51cb97d0a55f0f4a6983

Changelog :
https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V20.md#20.18.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_20.17.bb => nodejs-oe-cache-native_20.18.bb} | 0
 meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch        | 2 +-
 .../nodejs/{nodejs_20.17.0.bb => nodejs_20.18.0.bb}           | 4 ++--
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.17 => nodejs-oe-cache-20.18}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.17.bb => nodejs-oe-cache-native_20.18.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.17.0.bb => nodejs_20.18.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.17/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.18/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.17/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.18/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.17.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.18.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.17.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.18.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
index bc51f99d8..d987ac50b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
@@ -29,7 +29,7 @@ index b425f443..f296f35c 100644
 @@ -487,7 +487,18 @@
          ],
        }],
-       ['OS == "linux" and llvm_version != "0.0"', {
+       ['OS=="linux" and clang==1', {
 -        'libraries': ['-latomic'],
 +        'target_conditions': [
 +           ['_toolset=="host"', {
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_20.17.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.18.0.bb
index 38e5ca9ff..cb11ad296 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2ab85b3bae451276a10919163bcc5b74"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c83fcdcd43ab352be6429ee1fd8827a0"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "9abf03ac23362c60387ebb633a516303637145cb3c177be3348b16880fd8b28c"
+SRC_URI[sha256sum] = "7d9433e91fd88d82ba8de86e711ec41907638e227993d22e95126b02f6cd714a"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.43.0


