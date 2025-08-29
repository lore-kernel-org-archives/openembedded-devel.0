Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D889BCA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 01:10:07 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.3314.1756429800497645340
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Aug 2025 18:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ew3y+sZD;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d71bcac45so12295437b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Aug 2025 18:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756429799; x=1757034599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QabI1qN5eZUyuafh2LIUMKI/v70F2aeJkBkrm+WtaPM=;
        b=ew3y+sZDR/lQJgeilBxF7es4mlzHyY2FCNVEtcN/y7gMY+ePyjs/zmPZEDlasCVTyg
         Cmpbce9dJ76lKI/MGEElxraMeDw8CzRuoGofxNFNaUIaoVJXpUucb7jEXFbV8KUzDNmc
         bHTlXVjowyMnYkHuAlDiV319+DvELp+jlFGOVZiYVhMl47ZdgQunnccDArBx32ZlzHg+
         heFGSeFzLtsquhRujB0xrcXAbG/RNjIg1+m+Am2lybBvJVWHg2fie+yNj360aXMHpDf8
         Oc/2nKXsSFH6NnRb/ruyEbg5cRjbJfOyvBrYvw9ZOBBQsyNv/OSJRQe9hBtKvAaASMIA
         hxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756429799; x=1757034599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QabI1qN5eZUyuafh2LIUMKI/v70F2aeJkBkrm+WtaPM=;
        b=GKLt2ip85YR4YTpbt8QCl3uBUCmEBn8jwOzmPhVvCqLISeUxzow4wg+rQ0oojKg399
         fAYzLE486ppvfpxdEYErftHjyGiqsNeKSYq1f3g0PjKNUlcOlAHeZCw33NRJxN0INqEG
         qm7GdK9g+RWAVG8UnRijlNgGyB/gwEquXbne6sMdsa1oq3n661v+VnrFQN4/724nwqtj
         RzaXKCg+IRb/5zcTn45NvQYe9AmKazE5s6JMO/r+LV0/eDunRv3m0Qmi4UF5e2ESCFZq
         B6T65SLUesaP5z7Y5klzgzfsXustKdPEs5HUUH1eJLGgpeHXI60XqRIbXRLMY1iLtuKd
         DIGA==
X-Gm-Message-State: AOJu0Yw5AJoiWDz8qhZu9/kfxhWW729a+whIsCnhIJBtL0Au8pNmgqgX
	1z379a8q9amVLp2zyM6o/TZwicRAdQB2Ro4uhw43NzSU3El2DXnlp6736zw0yw==
X-Gm-Gg: ASbGnctJtgmtsLpNW/vZvfSkH1Igt6eET6z+TBzDfxhJGL9g8b+7POYTt4KRxcIgHgJ
	mFo7jqGx873i+EHjJ0zdX0kwQoULDWXfFI6cDK7EbR94xT1BA65ngbtPtnbQZhYJwp/lEzti5Cq
	RzlrQsry9ZNcM5aq3+scLIt6ec44QIIN1p/gEqnqoHql6Maw0hZEGVsDQz4RWoTOoYDWbztPJ6F
	ONADQLJB8T16QX8DzsHFrJvYdyvwFc+zKgjBN4z+wRvoUfVbQ+fKC6mKlB+ZM++0p01QLsvI0BZ
	WS93i9CsfnSEt66uM1PBE8HU4MQufwjOfhRMCiTbdmGcYp+zKm1dmX0H+3JTsds2rnUze/rXRnO
	WyQTOcF42G/m61BMZSqdjgaCWGU8NeqYrHU+5K2o=
X-Google-Smtp-Source: AGHT+IENicBEpKepx8bFEnnZiQpxTojObG1NzX7JMqK2xW7OSI8vdHb5dlR3wqstJLX1FYamvbloZQ==
X-Received: by 2002:a05:690c:60c5:b0:71f:b944:1025 with SMTP id 00721157ae682-71fdc43a608mr247498017b3.46.1756429797548;
        Thu, 28 Aug 2025 18:09:57 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-721c638ed95sm3498187b3.32.2025.08.28.18.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 18:09:57 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.18.0 -> 22.19.0
Date: Thu, 28 Aug 2025 21:09:38 -0400
Message-ID: <20250829010939.99522-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 01:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119132

License-Update: Add sonic-boom under MIT License
  https://github.com/nodejs/node/commit/0edf17198fe118c6cc39746feb8707a91d739f94

Changelog: https://github.com/nodejs/node/releases/tag/v22.19.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_22.18.bb => nodejs-oe-cache-native_22.19.bb} | 0
 .../nodejs/{nodejs_22.18.0.bb => nodejs_22.19.0.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.18 => nodejs-oe-cache-22.19}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.18.bb => nodejs-oe-cache-native_22.19.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.18.0.bb => nodejs_22.19.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.18/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.19/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.18/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.19/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.19.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.18.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.19.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.18.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.19.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.18.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.19.0.bb
index d2e7874a9f..c638228c34 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.18.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.19.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0c50f40949c25ef1b63d51a6ae6c6cbe"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1fdf4f79da4006c3b5183fddc768f1c8"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "120e0f74419097a9fafae1fd80b9de7791a587e6f1c48c22b193239ccd0f7084"
+SRC_URI[sha256sum] = "0272acfce50ce9ad060288321b1092719a7f19966f81419835410c59c09daa46"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


