Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C52C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 16:33:05 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.547.1660149177269738820
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Aug 2022 09:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BeSn1UQa;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id f14so11566362qkm.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Aug 2022 09:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=YQzZZ+dXbHvP7jYb2fxZbXXHcy9Dh2XHs/FxjkDbIAI=;
        b=BeSn1UQaKtrgyXi8ZFnwrzY+cLOZQHBn58BZl70XTiedZ4eL1jbgThLQYhGEYXuHNG
         Aa6Oo08c1frvD/FSJ4hQZqSAFlkzBY7Vp3YpoA/ovAsPXdqs4KGotHgAII46dnzZ658j
         toRxQUtqg214FIzeR3fyeLTIRhYfJuArZ2NZUXVjA1cK+Vl6Mfw838zo974Yhus/oauP
         W7HV1bqjLoPwK6RaBzVtqXbwOkxrmb9mYZ/NJDUQNrHm0bPla9Wigo+4oasd5pg3QeKI
         SeK83prdRTKtuu/Y5UrLl9gpjFMklqvO/P94kqs80BuUKrth22+FAZ0XntcxD6eP9Jvc
         99uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=YQzZZ+dXbHvP7jYb2fxZbXXHcy9Dh2XHs/FxjkDbIAI=;
        b=V21W4nXP9wP5RPgkUa+PxM60nnSSih9jvHA5zAc4PHzKmhEvLdrBGb1p3TysN9j+EC
         6wZNwsbZXm9zTBtrmTJny6jYhYUrfCRMzwcR5d6I9hislsG8ihRRCPzu+k9Owzq//SOQ
         LJ5JVQ/wNYLlHAS1BCigpFRv0WEC/eHaGlTgVRDwQjmPbraGyn1IDLYrxIXKLYp7kUmo
         Rz//yLpT7V+kxbgl5krSaSi96zEybVBQR3xzxuQI+0LNVCw5up6hu6Pt1Km/exalU2TQ
         CJZM83lW0dcozVXdWbHGjL1iJk871wbVCen/3fylfneRfb7rei0JKHFrMSo9rWAiXbyA
         /dyA==
X-Gm-Message-State: ACgBeo0U51OfjJGOo00i+3Hx7KPmG+Ae/AA5DkJPT78NJGOiIAtqgChq
	Z/10aAQsv+9CfuiBLZOHgOQ=
X-Google-Smtp-Source: 
 AA6agR4X86LPelcvUnCzvt4mkZ/GiQDSF5oPnDWl+ShD9yjF7RTM0lmtxEwFpbmwHfEbM7/9wu87BQ==
X-Received: by 2002:a05:620a:4414:b0:6b9:a836:694e with SMTP id
 v20-20020a05620a441400b006b9a836694emr2116638qkp.74.1660149176288;
        Wed, 10 Aug 2022 09:32:56 -0700 (PDT)
Received: from localhost.localdomain ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 m2-20020a05620a290200b006b5e50057basm120021qkp.95.2022.08.10.09.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 09:32:55 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH] vboxguestdrivers: make kernel shared directory dependency
 explicit
Date: Wed, 10 Aug 2022 12:32:54 -0400
Message-Id: <20220810163254.2885711-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Aug 2022 16:33:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98189

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When fixing the build against 5.19, we added a copy of stdarg.h out of
the kernel source. That of course works fine if the kernel-source has
already been staged, but is an error otherwise.

We add the explicit dependency to the export_source task, to make sure
that the source files are present. We already have a DEPENDS on virutal/kernel
in the recipe, so we just tweak when the source will be in place.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
index 06dc8a4c8..7eb497ab1 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
@@ -29,6 +29,7 @@ EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1"
 MAKE_TARGETS = "all"
 
 addtask export_sources after do_patch before do_configure
+do_export_sources[depends] += "virtual/kernel:do_shared_workdir"
 
 do_export_sources() {
     mkdir -p "${S}"
-- 
2.25.1


