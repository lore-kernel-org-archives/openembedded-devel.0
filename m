Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.931.1632338553708319884
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L1LXAnBE;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id g184so3783195pgc.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z9Vbv3TmsTmL42sAVTBvETQjADECncEpxGYlTq+fv8M=;
        b=L1LXAnBErgd31F7bWVl7Up8Xwcygg8mTjtjBQsVXpAE92GgP5CxjSZsaTbwf+tz4Oy
         ed/tsNPQWBFY1JDblylTZ5lFdC/hjDr4BIVItI4hhuX/zTniNUnS6nKHB340ETyxdmF7
         b0Ezc8mDrVoJdSjvQAEHqnsIUL4TMSlMzosAfn3pSXgQfK9VUfiDveL6SStOawAYyLnK
         SlW0Pn7D8Jld+t9r6qhWBEgNblOYuwTfndjv9cwJGY9XsTbOCkEae19Op1d+pLWAdcAJ
         DhRh5jkxWv64VRgCJa/qLxDaonHiWWngMIyUbAv5iAwUlZMQYuvZW5KlUs8qgwMcIqVR
         KZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z9Vbv3TmsTmL42sAVTBvETQjADECncEpxGYlTq+fv8M=;
        b=xhVM4DMFwwZ8bhUrp1jKZp3MHUZ/e/rs4i5mo8VkH1fD5s3W1jhaE+B4XGcsYsr+nU
         B3+3HD0F8OZJuKn3KmnVrXC0KVISFDV/Q14oQ2dTicCvcbRvLG166kGh48Yuf7Cm3dOx
         Xdd0UzQfDliJgrvr38IjceH2iFuer3VVgENJCgEp4+PjMT7h2cEC4IXYLr4xNN4r9eDM
         MJXjnSCa6KA4pk6yO0DPMtSxdGW7FPfzCYFY8GcYXnpMu5I8IWfJjQcCbG6vQcUMEPGf
         x0pqhIUJORjKp6M5RIwUzNZNJfqeVtfhBsob1eCJDgOYy3LGM2MKOphmpf5qwOvtzce1
         uJcA==
X-Gm-Message-State: AOAM530Ut8yhQ929tRvW9YLSQRvGW2GtUhRTPay07nPlgq0sJ8tAGKGe
	KLvIoYC1CdcanINOf+k7RWp/ukL7XGb8Cg==
X-Google-Smtp-Source: ABdhPJy0yctxnxtwoa+d83NP036mrmE2GbOm9FCr7ejnWu0pZZPLYOzcxmXP14reJqupQtp3Q6umWw==
X-Received: by 2002:a62:1dc5:0:b0:43e:f8a4:49a7 with SMTP id d188-20020a621dc5000000b0043ef8a449a7mr413276pfd.26.1632338553054;
        Wed, 22 Sep 2021 12:22:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 20/39] gst-shark: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:54 -0700
Message-Id: <20210922192213.3062719-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
configure: error: This package requires GLib >= 2.44.0 to compile.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/gstreamer-1.0/gst-shark_git.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
index fe4bd37442..baf75aa51d 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
@@ -32,4 +32,4 @@ FILES:${PN} += "\
        ${libdir}/gstreamer-1.0/libgstsharktracers.la \
 "
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
-- 
2.33.0

