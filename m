Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1557DC001B3
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:07 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.199.1687531199809166887
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=11GlUi9J;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.51, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f973035d60so810012e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531198; x=1690123198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgN7CtaBxaxb/LjLqZZ9xUH/FEzjD6RJeWENjHCI174=;
        b=11GlUi9Jr60HKEewhVLrUm6B+ZQAWEq5JlDNEG8fqLNjQG9CfpZk6B4sKkCvSd/W3p
         MZlPQ7/DHwL1SjJUO/QmXmkxi1xw+cszW4OZjvSONFs+cCyFIhMe0OUCp5R8gNjK0FOY
         PymvCiiCNBqCMHxDxUFvQYejC7TR/gtBEUiOGSl7Vg++VOBwBKFPPRMz1K0tobT3lPOI
         3Do/HVkPg9SaGxN4FR9u1ANH/sumDlbwYO71QuWD3VkObDmin4I4kfKXx5RMCmNG288O
         SFYC82DgrkH4XgddCpKl1CQugXsXqIqECp2DxYGMc653Hgpi1XkBO9BzyAhmTiYnXytz
         ly5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531198; x=1690123198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgN7CtaBxaxb/LjLqZZ9xUH/FEzjD6RJeWENjHCI174=;
        b=jM9HjtjrBmxlt2IhLalz/Sl81QXXzGiqb5KQPEkBlUp0gETQsquqqdulKwLlMqQi6a
         WnEqM1yH7FHY/2U91LUq0Zqx9x+LnBuCtFaOfW/CC33wN6B2FzxeT86It6fjNws7Eicw
         O0Cd5Tylz60BK1hhlwfMAMNKVrqlmKYSjtdxqsufvLh0EdunXc40tHYRT30T/qfekECJ
         Dgt+14RPFnRwOShBrpXmtpRrQeVKv/5n8F8t+TArBM+fZLKDHU8X2M/4VYnhPva0tkhs
         uhmXFOTumq1cYbpOZJ2FMjSq2x1O8xs5cS4ftBzhggwMkBjoDCUdVm2GpiFbS6H4ifTF
         1b+Q==
X-Gm-Message-State: AC+VfDwzFCKedyxk6X45ERhHK3m0I9fiPNjlusCYu7KTMtPeNEs7K11U
	qguMqlFuQfBA0iDVGAIsVxgBQg==
X-Google-Smtp-Source: ACHHUZ4UQnS57qlolpRD5kqKVvj9YCbfDbN5t0AEU8wmaf1JrH/btNVDu5bA3ZEkooh9JhGVAhfAYg==
X-Received: by 2002:ac2:4f07:0:b0:4f9:6528:fb15 with SMTP id k7-20020ac24f07000000b004f96528fb15mr4412691lfr.12.1687531197851;
        Fri, 23 Jun 2023 07:39:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 26/55] python3-gsocketpool: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:52 +0200
Message-Id: <20230623143921.146338-27-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103522

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python-gsocketpool/python3-gsocketpool_0.1.6.bb          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
index ee0ffacbd..60ac18155 100644
--- a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
@@ -4,7 +4,10 @@ HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
 
-RDEPENDS:${PN} += "python3-gevent"
+RDEPENDS:${PN} += " \
+    python3-gevent \
+    python3-logging \
+"
 
 SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
 SRC_URI[sha256sum] = "f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14"
-- 
2.39.2


