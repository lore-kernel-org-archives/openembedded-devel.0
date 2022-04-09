Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71568C63704
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.6861.1649514825975745224
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 07:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H5lMNHr8;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id c23so10379218plo.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pBY5KqEw85wvKZN4uRfewhTnM6ckGAf9BJe5XgpwmcA=;
        b=H5lMNHr8mU6vHjIsO1V3iaXy296M8BG8Mnm3y8A4kQugkH3nXP4n21PfoVboC/yeo+
         0wV9iC/W7LEk+Jkg7UzsvCaQpxHG3rajBx+o/id1OnjW+f2q6FIM/gXQ31I4g0esCfgI
         m5Yc/ZmiS+zeoPFl0Jmij80wxZ1hi4/zFYTBEl2gTkYs1BjlTE5JSjEK64YfjghymtTn
         8hwHEjqvx6dIRCZZbBRcf+yHuHx42y5SVCzveg0XwVZ/KO4URhFLiaWvozK9ZF3VCPx9
         RovTuwDHZ0EjV1NCbfqSD0/L5UHFVc+U/DpntQSn1+RS2Ol4GcVucyrNwQ0JSbuQGPVK
         Hk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pBY5KqEw85wvKZN4uRfewhTnM6ckGAf9BJe5XgpwmcA=;
        b=2PKJTTNdAWr9QhJvbfIBKTfKdT1cJ7fmQ8FX8R3x/d3b9ZG0GTZVew19NhHrg6gXhz
         7g8MFh3bsqSkRCzXRK69MWgIBb2gjtuCAXFbc4pqLhscw8oorL+Fsk1bHE2hRcVTs/br
         7H7+HDeDO1y9htpsrvOjyLO1JeI8H/tKHfE1aelaop9pDoIN2clpkOpzLYyZM1pPArjp
         +7y2gxMdReNvvxbB/XIo7EBDbvIrDZz+CvIj68r/G+PUmAPWeuM0X4Ty+zZpHHxOwH4g
         pFD3besaGjJII311Vnpc4+1QxFwvHv+h1yBZeZ6fjAIlXwazbl9hUY3j9trFYTQ6wXqs
         lwbw==
X-Gm-Message-State: AOAM5307SnEgFvbNvrBNCDWZfCPIVY/Y2lj70v8jSUmj7jBC9t5w6rYv
	nUy3lcl0IqL4oeAu35sk6AXvwcxWk2XAVA==
X-Google-Smtp-Source: 
 ABdhPJwcgjv6sUlLmnfLjTsWRGGcqpJHqgYGORl4onJIt+5Fq64Wj+AHmwY0iN8/MZklQWUx9FcKRQ==
X-Received: by 2002:a17:90b:1d90:b0:1ca:9f55:3b78 with SMTP id
 pf16-20020a17090b1d9000b001ca9f553b78mr27301073pjb.38.1649514825195;
        Sat, 09 Apr 2022 07:33:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 oj16-20020a17090b4d9000b001c709bca712sm15945047pjb.29.2022.04.09.07.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 07:33:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gnuplot: Disable libcerf and fix typo
Date: Sat,  9 Apr 2022 07:33:42 -0700
Message-Id: <20220409143342.535499-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96499

We do not carry recipe for libcerf, so disable it explicitly so the
native builds are also a bit more deterministic.

Fix a typo in knob to disable wxwidgets

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
index 087b69faae..7343a08c7d 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
@@ -45,7 +45,8 @@ PACKAGECONFIG[qt5] = "--with-qt --with-qt5nativesysroot=${STAGING_DIR_NATIVE},--
 
 EXTRA_OECONF = " \
     --with-readline=${STAGING_LIBDIR}/.. \
-    -disable-wxwidgets \
+    --disable-wxwidgets \
+    --without-libcerf \
 "
 
 do_compile:prepend() {
-- 
2.35.1


