Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECCFC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 22:19:51 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.1817.1634249990045527994
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=LTuq+ar5;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.49, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f49.google.com with SMTP id z11so31886803lfj.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NuxHbyqIG0Dyxi10aljIwbo3Mi/fJO9mdHZI4iht8rM=;
        b=LTuq+ar5O6EGL+aoq/I7L08DPJNj/8rCo4ItN2MPBJ1LgJOPyLNu9yzd3VLMhcEqO5
         ZFs2I+gqhiobgE9+GkjR9vI8tGw11KAErAYm/jF+isl5OqYbRYJA9lq9sdyXHKfR+4Ao
         xxaKpZTgcwJ+Z0HEyHQHdWO6yu+rRGWc+gTCl1f+MjqsFQAGl6C/mgSWa3jCZFmMzFGI
         I/W0Ehwj+atG1Va+mdjgOfgbq+QbNDPfRQc2lCWoQZtAxqS1HcWBwMw3lNTDA6wi56g2
         DA/Grn5D9gBwE43UNzkEqbLcb9AvJCicJ9Pn7qFEExohFYYSGoq96COQDcGDfTJ8Khsh
         DQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NuxHbyqIG0Dyxi10aljIwbo3Mi/fJO9mdHZI4iht8rM=;
        b=aOyGZ6TNIt8wAOIhNuvavF8cpcqq1io+CUCNGDPTbeFDr7wdrBGfpSNIQ8Rc9MIXT5
         5QyCBnat1WRXgjgfqcTnwkR7SFoRGITfgDg2TZla7a4cJfjxCoerHGKDgpVTnvFX3wbO
         FlNZ8XuHRUaS2Uyc9JHfThFIi4t4J5ony6youGvtxp0uRISgngLcz+HUGx9G7tE7Sw1E
         inwdQ1t0ThdWDuhlyDasQKN7bYSNPW5WO+xuDFRPXE++rGXv0Iiv0sUSASUcgf0rsWf4
         8mD31dvWFK6y+AEtimuySwoOFEyTJwyPsnjU3PIS3aKjgG8if5jLCHrl1uZWRjCYTos2
         BkAg==
X-Gm-Message-State: AOAM533UQOxTW+snMoUhqRmTA415wbY1KyQFMAouEnKip725QxegQidb
	bEQZmOjbOB6s6YL+EqAivRVI6Z9rtQScnFNf
X-Google-Smtp-Source: 
 ABdhPJzkxfkBSkxDVUnqtShx3IanhxQz7rbNF75YV7cSUy3OjlY7wcwC19eFLSRtSDO62s+MVTNMeQ==
X-Received: by 2002:a05:6512:2248:: with SMTP id
 i8mr7593987lfu.655.1634249987558;
        Thu, 14 Oct 2021 15:19:47 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id x3sm363912lff.20.2021.10.14.15.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 15:19:47 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] ostree: update to 2021.5
Date: Fri, 15 Oct 2021 00:18:56 +0200
Message-Id: <20211014221856.3839405-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 22:19:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93307

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ostree/{ostree_2021.3.bb => ostree_2021.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2021.3.bb => ostree_2021.5.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2021.3.bb b/meta-oe/recipes-extended/ostree/ostree_2021.5.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2021.3.bb
rename to meta-oe/recipes-extended/ostree/ostree_2021.5.bb
index b0c9849fa..08cfb136e 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2021.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2021.5.bb
@@ -25,7 +25,7 @@ SRC_URI = " \
     gitsm://github.com/ostreedev/ostree;branch=main \
     file://run-ptest \
 "
-SRCREV = "38c14b374567f736533f7f515595208fe359819f"
+SRCREV = "63bf5e606b24c7343bfe622bf6af2110ee6beabc"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.25.1


