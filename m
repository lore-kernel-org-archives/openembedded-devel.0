Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636B2C433F5
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 16:52:29 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.12972.1634403148693224202
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 09:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AdaJrgY+;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso9621673pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bULuolZetwp3bP45sM2xvUvenKlroBy3rIJL8L7pC0A=;
        b=AdaJrgY+4UB7SYa/7KYnsSVi2oP5z2NdWtZafZjjUWvIP4UiZYUgQdzTxQws77PFSb
         5/7SRmRCjZFn+OoiPbE1qDesDwiMnHw2uvt174oRi0VfOkTKlGJcaQrQ1/DM/5WrdVso
         qdo7bcCFpud/2/GZe0ZmFCf6w7FTsf/h5UGGWMfYptigQsUctiHajm80hVKNAW9QiyMb
         CO1kMs7ZgTIOpNZjVVXWO+4vKFAvWP8xb/hJk9N0OL/ubN5DJdxlFshbA2ckjftcXbXj
         RxnWk2JOM1QNkJG6Vwpg13jyMDjwAf8qGlP/X85YeRRQTtt9Egy0nKDnyEzKGPmcYpBA
         7XBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bULuolZetwp3bP45sM2xvUvenKlroBy3rIJL8L7pC0A=;
        b=I33eDmsv5cyWvMRTPgZA8cHE7/mCgRo+N8mOy92oM/HNC0oP8cxpSgfH/6ornPE3SB
         0RfWD8upQ8OpcijTEWKdTf021nG6Ki4p56Mm2VtUsiCb9iVRUBfmlDAlYu80rsgsvwU3
         KfHUxuvL+3heYMHyiyUD3mE5Fo11xZkCgNSAT3bTtPBHDXcxdeKaR/HoPa8JW/iFrfKw
         VG4CiH+HmMKmoR6PI/ymjl0R3OPh/nT6uK+OZayAHNV6M0JK814S7p0W5/nvlU9QepT9
         EykGgaQQdBhI3OgE79uVJOsy3aW0c4r23hdIa3nN116Ld3Gn2zB3vP+peXTLGtaQWy0V
         6dhA==
X-Gm-Message-State: AOAM5335zi+7FPKm2SkAIloE8cUkk1foEgJ2n/zjVebe7QlisstDrcf9
	Lu449N+ldr9a+oofNvX23a4IDJw3wRhYnA==
X-Google-Smtp-Source: 
 ABdhPJx6SwbFVb70wrzs5dR90oo6QtvUrAEMqNsYfJSPdyngRXX+o9h7/R9btuFl2kyRAIkGwu+Zdg==
X-Received: by 2002:a17:902:d48a:b0:13f:4411:8ae9 with SMTP id
 c10-20020a170902d48a00b0013f44118ae9mr17391277plg.86.1634403147991;
        Sat, 16 Oct 2021 09:52:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 i2sm8740756pjt.21.2021.10.16.09.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 09:52:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] nodejs: Upgrade to 14.18.1
Date: Sat, 16 Oct 2021 09:52:23 -0700
Message-Id: <20211016165223.1271496-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211016165223.1271496-1-raj.khem@gmail.com>
References: <20211016165223.1271496-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 16:52:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93405

License-Update: Reflect new location of gtest sources
                remove node-inspect from license
		update Acorn to v8.4.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nodejs/{nodejs_14.17.1.bb => nodejs_14.18.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_14.17.1.bb => nodejs_14.18.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
index d468f2518e..a80811193e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a1016f9b7979cfe6fc3466a9bba60b1e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6768abdfc4dae4fde59d6b4df96930f3"
 
 DEPENDS = "openssl"
 DEPENDS:append:class-target = " qemu-native"
@@ -33,7 +33,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "ddf1d2d56ddf35ecd98c5ea5ddcd690b245899f289559b4330c921255f5a247f"
+SRC_URI[sha256sum] = "3fa1d71adddfab2f5e3e41874b4eddbdf92b65cade4a43922fb1e437afcf89ed"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.33.1


