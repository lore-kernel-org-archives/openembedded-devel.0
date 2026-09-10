Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADB3C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 06:34:53 +0000 (UTC)
Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7843.1789022091057017850
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 23:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pOwzjzH3;
 spf=pass (domain: gmail.com, ip: 74.125.230.76, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a354118856so8726681fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 23:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022089; x=1789626889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TM2Tgu9FKiKID9l4yPl+iQoEsXfbhC/vWP1/SFCLt7M=;
        b=pOwzjzH3Iq1KAJj9jehffspDm+oCjnQEmVPCzJnHgB1zi8D8HNsVpGfnvqWy/treFX
         1ENmXrsfTr9OetUuuuP37gtX8TPsqNfnr4q2gNW4JjOfQkyogPQyXQIZKRxRfedyXHXu
         M9mctvP6wG+rUxU8fx7BzlpqW9BE3Vy+gNXawKuZ0NL+FYNxj7dF+sPRSyQhiOsAeXBV
         oCbKNYl0hhYemL5PYRIixUDAjifgVOrdVJarAKG9Zu4mUsW88ztr3wJeCNCJQr/qkr9D
         EGTAUS+v5sdU37ZyClFS16qIV2KtqFeJs3G2TfiAjiCNgmBorFtBH7+Uu2UTZPwatVTs
         R7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022089; x=1789626889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TM2Tgu9FKiKID9l4yPl+iQoEsXfbhC/vWP1/SFCLt7M=;
        b=ph1pXFylqsimHrmPb3T0os6nlAF+iG+P52zM+aNuw7HbAuJHIwoKHXg8IJzHaFLcAE
         +4bafViniezArXPIlq2p8eima0u5Er2LdQDtG5SoF9W7rSEGuaVSOoTXaQanhj6oG0s4
         nRTVtg0U/I87ce23QRzv+pERJMp8/XTv2UhtD9IRJvSxg2xHuPwiEJdwrXNjt0pIFkzN
         yzoFFBq5NT3qJ1jlnrVyuegeucwB09U/SnuiZ/DGINEUkabt1f1vuBgp4LTL8HL2vGHg
         OKNVrwybMeQuFKw/jY5ghXjxoNOL03f+LwGQO/HQGzic3W7Q+OIaVhQYy4xse08m11Qi
         otEQ==
X-Gm-Message-State: AFuF++nE8hyoA7OkMs7FcXzI+7M7eHSHMlUmUPNA/0sFUEikuzAOWXPr
	Ubyf5a1bUGaKFFuYtAmnjLFjxPKt/9JGtKFkx4ekkFOuKhslliWlnmLFVTtx4w==
X-Gm-Gg: AYBFou3oi+pJsXYlo1SFbh1O8Se2vT70IbsZf6xyoN4XcvsO5z2MXsyAa0a8JDLWVrx
	c1AglcH1QA7BBTzw1bzM9Eof+sIn36GMK31jHDR8cbRX9ipJE0WzXiAKfvCy7YWKDXCu7Sdfop/
	OJroMmaO7PjadHLLIoNBYTiehnOSNM5FpPcIUzZ1+ywe9VY6C4EfvKC9V0ntGg6NV5ZCNd9QVtU
	GVQgl8fjDiVNaeOvBQvTOT9u2NwRmTtGTaxZ1TVfAuQoEn+O+NxtXIK5PRD+KapPX/TIIMv0ESQ
	UzUvK6rzVG5PwpGsHchq3z4OP6dkHKS/rAgNg05/FBMLL5eimnTgnX50yjypPZELW7ib90JNa5p
	Edm1vfl7r9hb2dHXBrMvDfJ857PHvUPK728/4Kt9Q8KDU4AkIxLq5Su42n+/VS72qNoAtDR2WaW
	tUSF72Q+d9GeNPHIep8pykgB7yhcbvnZsXxq+jIB0dKmm+DDjFXt712yUgstzfEB04p3OTygDOm
	mJhmPXrMlOgCyxDKnOCofHThEjg742Wmu00cMFLatxRE10dS6FUBk32bnektkY4Y0a3AiyCel11
X-Received: by 2002:a2e:b8c8:0:b0:3a3:74b7:fc0b with SMTP id 38308e7fff4ca-3a58d55649fmr6689921fa.23.1789022088596;
        Wed, 09 Sep 2026 23:34:48 -0700 (PDT)
Received: from localhost.localdomain ([176.88.90.107])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a58f56c263sm3759221fa.25.2026.09.09.23.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:34:48 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xcursorgen: add missing util-macros-native dependency
Date: Thu, 10 Sep 2026 09:34:32 +0300
Message-ID: <20260910063432.221832-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 06:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129909

do_configure fails with:

  configure.ac:17: error: must install xorg-macros 1.8 or later before
  running autoconf/autogen

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.9.bb b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.9.bb
index 1287b09766..9e6db05daa 100644
--- a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.9.bb
@@ -1,7 +1,7 @@
 LICENSE = "LicenseRef-ManishSingh"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bd1fb9ee90eead85f7b171807b3ab4f2"
 
-DEPENDS = "libpng libxcursor"
+DEPENDS = "util-macros-native libpng libxcursor"
 
 SRC_URI = "http://xorg.freedesktop.org/archive/individual/app/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "0cc9e156ac84ca16ea902710af35e0faffa51d13797071e3b4b6cc7cbd493bbc"
-- 
2.43.0


