Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A95EB64DD
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 21:08:29 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.6114.1690232903484813263
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 14:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Ivyt610E;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7659cb9c42aso388514085a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 14:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690232902; x=1690837702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7kG78x81PTJvcYbeqr/QIpvimyRg1vWnOSPGGy4VfY8=;
        b=Ivyt610E9FFpdjzEoXdNks/g1+nbN2UzY4/Zx+xVA074HzqMGhfGQMfsolgmDhW2Zr
         Mc5pWmAVA2ZeqjZ6QlZWYgLBXr8ESzG07tIbMZIt0KKfi14k1BJQlbDEyM1H/8/1S0bU
         wWJaAEwnfZ+GPo9YfYyPHpcbAAcPSll/riQC0dZiK200vPjr3w/cjEWN8tlBIJaD7qtM
         /hRmTHGVkCB7MRTdDxhk7uVwBmazWTs+mO/9DSzE08/I0bZ6nPm4gjMx9WJz8YAmyMjD
         jkQfvF3G46ODoOQLgwfuOpHtKzAWrU5+/vXN6c2PHBUdhYAB49BfIrt4pMVEQN3SbAoL
         kiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690232902; x=1690837702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kG78x81PTJvcYbeqr/QIpvimyRg1vWnOSPGGy4VfY8=;
        b=MKdbTzgSEOgU2bdV0mPoIZMJamqCg80JkF4gBoeZP5NAsip05qv0b5YyXFNIw8xzIo
         vXP4UKNc11zSyw3+kx/zQ7NlhMWnW4imthZ2Bv1EwoV1D5vnQWq0qoHRxbrD9gTcvTGn
         KPATxUjJhR771TUAphrG1p4slEfkP671fswzhchek/5dZ9rZZ4ZefL0EgnVrB/KHoMu6
         /adriwFJb/bMio+/CAHE9qxAgSaG16VA7JGzU8wKvmiO4+5hFI+BxN+l3GY7cq3CBCFb
         k4pnMIBLoqUuNbmSbRaGAZDIKNNtV+AtMmC7y3/NV6w4ihbYe4tRD1Qan7vkpmLzsyxh
         xk0w==
X-Gm-Message-State: ABy/qLYbxpUZQ0WvtaU+AI0277BMxzsugTagZh3t+Jn9JUz965u2ZyBn
	qsFoEah1STFCGgSmorpRabkg2iOAiwKaORlf2DA=
X-Google-Smtp-Source: APBJJlEXT19WCc9FUWuFj+5Bbar4WpWJrGvTw93Wr7UCaYaQF3FWhAYB6uSCL60JR/azeBuqIcLs6g==
X-Received: by 2002:a05:620a:102e:b0:767:6a3:e6a4 with SMTP id a14-20020a05620a102e00b0076706a3e6a4mr818519qkk.13.1690232901904;
        Mon, 24 Jul 2023 14:08:21 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id d26-20020a0caa1a000000b0063631be090csm3854528qvb.125.2023.07.24.14.08.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 14:08:21 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pyperf: upgrade 2.5.0 -> 2.6.1
Date: Mon, 24 Jul 2023 17:08:20 -0400
Message-ID: <20230724210820.384995-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 21:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104006

inherit python_setuptools_build_meta instead of setuptools3.

Changelog: https://github.com/psf/pyperf/releases

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-pyperf_2.5.0.bb => python3-pyperf_2.6.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.5.0.bb => python3-pyperf_2.6.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb
index d5eaa4f607..c63e75cf2e 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.6.1.bb
@@ -13,11 +13,11 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "9fd9be5b57224e68b5a5b88f7126f15b6c8667573f62a0a39faf14d6fdd13909"
+SRC_URI[sha256sum] = "171aea69b8efde61210e512166d8764e7765a9c7678b768052174b01f349f247"
 
 DEPENDS += "${PYTHON_PN}-six-native"
 
 PYPI_PACKAGE = "pyperf"
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "${PYTHON_PN}-misc ${PYTHON_PN}-statistics"
-- 
2.41.0


