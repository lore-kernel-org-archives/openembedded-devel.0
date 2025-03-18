Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF55C28B2F
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 17:54:15 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.1739.1742320448906808389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 10:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iQtSbSrS;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ff27ad48beso51510617b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 10:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742320448; x=1742925248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ygrEP0k9KDCZaSUnJU5Z5AoKfPedk1jn01Gco6mDYM=;
        b=iQtSbSrSZw32/19MdRtOnx4rRVmw+lWhbNa62oUxwRZDz6jrdX/ixNRY8tyUtT13ra
         BDtqrtQ6GIK5cw8PG2DX3jWtBJ6eC7jV4oKVYj4yFzlYMreBy/ZVX9oqyty55cl9TmUI
         1x+UD4qxhV11RCwSK2g1o6c01OLuZ/dGwtDZ1ItTNZ5yAL2855QSk85eG1JXCLDS5/d1
         Ovi/1m/wj47b/oD/xzj0EPcgpGlAPozyay3+5PKk3hQz9aHHFdbvst45uXcGa9ozS6w3
         x6DqffpqRQMQYll7/24wGvKiHObpdSI1H++zfbfyLKmNbwU6C8VV7Et7d2bmDzUIc8c3
         R3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742320448; x=1742925248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ygrEP0k9KDCZaSUnJU5Z5AoKfPedk1jn01Gco6mDYM=;
        b=nFxwffkhUcWbYUxqVe5Q8CyP7bl/PC5MVScki54wm/pqq2Gp+RoYrjOkHO57Qi94DQ
         rmWVILr1DKVAO5QK2KgklDKNmljKLVfGXHlj0yjrQKGSKaiFaXZKv1ub4r9Nr7Q1I7tA
         av8ewmeX9Jj1VyzTHadENXgu9TvhqN6AF4AXkl0ROnRPbj3/yPWE4RJ4G/2mj131aPGN
         14+RU0QafvE5SRnETbQeHoecvlFM+x1M5Tg7ZEt1HNfA5sC+Z+lNAX816rl/pFrQ56H+
         6fgNZt3VQD59h0cigReijMY+Wgl3ImL57ZyTsMJnaHMdV2i6LZixxv35sw+YCTBMQL01
         dMLQ==
X-Gm-Message-State: AOJu0YwgLIVKFJ2ppOZAfq9Vr6fiW9Tnbs4qo7tVZefMVrEUOcHR3PSz
	nhIRS8d9aS+OrHjkD2ICIEuABWPkFXpwwkZ+DrHK3rjkBWpwtzuHAISpyYkQ
X-Gm-Gg: ASbGncsAC11jnL7nuLW1fc9E+L0+gvdosFOBfJgB1LAYEBcnp/MksqmKEEGW7XC7cIa
	Poadt3MGZNMdxpbFVOxumdAOPUJrlfU0K7gHLeziDFp27eOi2q9Hb7dgSdo6/gXIjcNiP+aMjCX
	P2LHmz1w/6/GR8dPe+fCIWcYX/N5isAeZVzCqZxyQSKdNWaT38fPkl02SXgiAzF20wYy8Pge92K
	iI3YQiaSZ92jU+IKIwDHq+cvUNHVGn8smRaMsXGUW8MAifYC84DS31aQ6TI615U9kA3CXyitdCO
	1CX3rpBIE44CkO6aoOHEgyY+p3f6cQMm6n84Jia+PLOfH0a+yg==
X-Google-Smtp-Source: AGHT+IHDoYHTqP+qv7P0nIyO0+yk7ng5E8aqKTJ2isHESU/Fv+GTZCAPHorcxUxqmIvLGCxZamHrsg==
X-Received: by 2002:a05:690c:4b0b:b0:6fd:63e9:a441 with SMTP id 00721157ae682-6ffdcdba724mr64246717b3.28.1742320447331;
        Tue, 18 Mar 2025 10:54:07 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff3286006fsm27785457b3.33.2025.03.18.10.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 10:54:07 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.13.0 -> 22.14.0
Date: Tue, 18 Mar 2025 13:53:42 -0400
Message-ID: <20250318175342.3629-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 17:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116060

    License-Update: Change the location of the inspector_protocol
      https://github.com/nodejs/node/commit/a48430d4d34eb9f598522410dd7723f069c574d0

    Changelog: https://github.com/nodejs/node/releases/tag/v22.14.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_22.13.bb => nodejs-oe-cache-native_22.14.bb} | 0
 .../nodejs/{nodejs_22.13.1.bb => nodejs_22.14.0.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.13 => nodejs-oe-cache-22.14}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.13.bb => nodejs-oe-cache-native_22.14.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.13.1.bb => nodejs_22.14.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.13/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.14/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.13/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.14/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.13.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.14.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.13.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.14.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.13.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.13.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb
index 9c145695f7..dee4c9df4f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.13.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0bd28a461eccad39f85a29e33e8f879f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=da350b022352bee62fe22feb6ad681c8"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -37,7 +37,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "cfce282119390f7e0c2220410924428e90dadcb2df1744c0c4a0e7baae387cc2"
+SRC_URI[sha256sum] = "c609946bf793b55c7954c26582760808d54c16185d79cb2fb88065e52de21914"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.43.0


