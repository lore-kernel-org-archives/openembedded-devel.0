Return-Path: <jbrunet@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AFDC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 15:12:18 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.9909.1634915537109082177
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 08:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=jlxLGPS/;
 spf=pass (domain: baylibre.com, ip: 209.85.221.48,
 mailfrom: jbrunet@baylibre.com)
Received: by mail-wr1-f48.google.com with SMTP id z14so4340160wrg.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jYlF94WNdzTEC01xMCtea/KfleaI2cfKzzUCoV/OdJE=;
        b=jlxLGPS/qRmNYdMV9HEXJeHDZupozeZmvTNe6G7LMfbZkObxuru2tEj80Fi5wPOR6z
         ugnvuYXmGB1d0o5pj9QlZ7wLtJ+hm6qyJgyv3PbYF/+cSPCjHHebvNWuN7iegq/VKebf
         Mdsz01KIkixWD3I4BKgldf2rJj6QyTb8oWlLgWYRhmiF8fMatxnMBArc95rgpTZ6phEW
         M28cqrqoUCKs/kSxwCnb9E++AMtPPoKLbgJquDEREViJHbkrmqOnvjW7t3PnytjgthDk
         3KISLkMt2Wj9jF6rHlaYDk+LSF3pBckUCyGBQ/PRj5Yf1dDtuBV6DYLtEamjoKZ9Jrvn
         ehUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jYlF94WNdzTEC01xMCtea/KfleaI2cfKzzUCoV/OdJE=;
        b=WcURArQBN18wgFxLIF+ddZc0LCJCptxLuVlhzjIyM+sxgRySG3gRV88zRCwLOrOa9Z
         YK1moD/woCjdtKYNiYP7Wbfr2iNY7crlTjoVMbc0vPb6fo1woqlC+W4DioI6myubXeyz
         6AAi7MLaPAGAAjZG+1UFHpj1/aPeTFOh2fxhY5YlSa3UfavqnddVw64hd5pvpnJfBN0+
         TXRIlQMEcvX6xiPsPlN8woIjc4sjg9AroW5GAx5g2UBx8fhQl0PtPIGSCTuBhR7/aSJp
         21yD9O9Vi3jTeFMPMuRgIqP3beZ+WFb/kfrUGEUJq0DEs3GZjRP1BRhCMS9F30BVTyju
         f/Jg==
X-Gm-Message-State: AOAM531AwwROu4OdMyEhJIzT1tYey0sb3koat4GDmbR6fL0XTHonZo+g
	43MxIBqoUZMgM5nNzwjRmGOZtfeZ+iU4sg==
X-Google-Smtp-Source: 
 ABdhPJxC16nF/CiAk/B/joea/3LiTzIZAfJsWhhZ+EcZ1F3VxjqxxoAWmb9sVnk8RyVkcOvDZziLIw==
X-Received: by 2002:a5d:5703:: with SMTP id a3mr521348wrv.372.1634915535144;
        Fri, 22 Oct 2021 08:12:15 -0700 (PDT)
Received: from jackdaw.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id
 k22sm8307795wrd.59.2021.10.22.08.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 08:12:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jerome Brunet <jbrunet@baylibre.com>
Subject: [meta-java][PATCH] openjdk-build-helper: fix arm64 build
Date: Fri, 22 Oct 2021 17:12:12 +0200
Message-Id: <20211022151212.268140-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Oct 2021 15:12:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93535

When trying to build for an arm64 machine, such as qemuarm64, parsing of
the recipes fails with the following messages:

WARNING: /meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb: Exception during build_dependencies for LLVM_CONFIGURE_ARCH
WARNING: /meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb: Error during finalise of /meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
ERROR: ExpansionError during parsing /meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
Traceback (most recent call last):
  File "Var <LLVM_CONFIGURE_ARCH>", line 1, in <module>
  File "/meta-java/classes/openjdk-build-helper.bbclass", line 86, in openjdk_build_helper_get_llvm_configure_arch(d=<bb.data_smart.DataSmart object at 0x7f08fed017c0>):
         else:
    >        if 'shark' in d.getVar('PACKAGECONFIG').split():
                 bb.warn("%s does not support %s in Shark builds yet" % (d.getVar('PN'), arch) );
bb.data_smart.ExpansionError: Failure expanding variable LLVM_CONFIGURE_ARCH, expression was ${@openjdk_build_helper_get_llvm_configure_arch(d)} which triggered exception AttributeError: 'NoneType' object has no attribute 'split'

Using 'bb.utils.contains' solves the problem.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 classes/openjdk-build-helper.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/openjdk-build-helper.bbclass b/classes/openjdk-build-helper.bbclass
index 4e334c26c166..5f838b4f8a17 100644
--- a/classes/openjdk-build-helper.bbclass
+++ b/classes/openjdk-build-helper.bbclass
@@ -83,7 +83,7 @@ def openjdk_build_helper_get_llvm_configure_arch(d):
     elif arch == "arm":
         arch = "arm"
     else:
-        if 'shark' in d.getVar('PACKAGECONFIG').split():
+        if bb.utils.contains('PACKAGECONFIG', 'shark', True, False, d):
             bb.warn("%s does not support %s in Shark builds yet" % (d.getVar('PN'), arch) );
 
     return arch
-- 
2.33.0


