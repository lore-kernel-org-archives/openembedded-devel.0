Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91285D2B950
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.19640.1730817434210305070
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i/lSGbzP;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ea7c9226bbso32045897b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817433; x=1731422233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzXP0O6j3m1q/XaVYFq9r/08nZAN0FkScbJgSyqZihQ=;
        b=i/lSGbzPj3CwFv6U0NxSytEtSNSzh8ohg8G5+kmKEolST4gqUb2bQxiB5HWyTnwIfE
         0ifKXw2vYDMy2obbUTT3nJ3Oncp6fcqA5KDHscHVD/GkUOOjOJWJx+p1fpK+gnpDP2Yd
         7hAeBzd9Nis+O7HUCGHkyaDGYgzXI1LGbQarUk3dBvo3L1iDc8bpD9YgIx2OpJW/ct7k
         Jh1cCVtWkxisU25Q+BjeM2vVw4X28YbLelSmCj54DF6UDGJWwkM9ORZp2EFmMiOUvaPV
         qixc12xL8CeK5oCy7BuomqKvrYzU0vJzrxvkFRUDC+DQyK0CL7+2C/0VutSRq5kM+rGR
         oWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817433; x=1731422233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzXP0O6j3m1q/XaVYFq9r/08nZAN0FkScbJgSyqZihQ=;
        b=fT3TEpTKWvUYimmu+Ernkv3eY+mjGohBjCNAGmOnLRR1WzhC0vfX4wWyz1cMuGjxJb
         3in4nonSsouT7tg+xDIhjGJJZ0C5+Fk6ZnPIxG1G6a5ZtCUFtRM+3+Z6vvM2YZfntSTI
         BjZxSbd02kwc/08/qEsaBnbAn1OcLKqo6pOMd8CxZGZOFQaJXvj6f5G3RlrKwJAfpI7H
         CEaUoOE3rfB+W1aKID7DPInuJXPNI72OEhYFMfu8icNgo1u4KQlEA/TWzyIoWSdqFxq6
         13Y55IWk3hG0JlgYzVyCXJDqTNIiPVJa27NHOH/v+qgMBK9Eoqp07UpB676Q1DisYrfs
         SBog==
X-Gm-Message-State: AOJu0Yx9eFAVsvab+ntnDG1lnVFgjQZg+5QXxwKSL4pkJo5Y2pnW4DBE
	JH88qr/uP0SbCSUNV98AFMDCT2RLNC5VlCgMtUSCetwjLUvj733Hbs03Bg==
X-Google-Smtp-Source: AGHT+IG8Ap+gBvwx/dQ8BGVbXicf9Rfhy9p33SLmUK2ebAs8Invu53W+BSekOfkxFm812uFwlZM5mw==
X-Received: by 2002:a05:690c:89:b0:6e6:248:341e with SMTP id 00721157ae682-6ea3b72366amr259710157b3.0.1730817433286;
        Tue, 05 Nov 2024 06:37:13 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "J. S." <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 73/90] nodejs: upgrade 20.17.0 -> 20.18.0
Date: Tue,  5 Nov 2024 09:35:38 -0500
Message-ID: <20241105143638.2301245-74-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113491

From: "J. S." <schonm@gmail.com>

License checksum change due to whitespace changes.
https://github.com/nodejs/node/commit/1dfd238781

libatomic.patch change due to changes in node.gyp
https://github.com/nodejs/node/commit/25c788009f1fa7a392af51cb97d0a55f0f4a6983

Changelog :
https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V20.md#20.18.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 410a442f89ea394710d20d337b9da397b537cc25)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index bc51f99d85..d987ac50be 100644
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
index 38e5ca9ff1..cb11ad2965 100644
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


