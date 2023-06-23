Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B4BC001DF
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:17 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.209.1687531215488847247
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=KG/TeePS;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f8fe9dc27aso8062975e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531214; x=1690123214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y71r6Tu8NBru+3AZIB9gf8GcBOl4ojAx68BUKEmS2+o=;
        b=KG/TeePSrafEM5PVjPkKoBiR54rZU3KzTWFTWdgqnuQfIi8M/FcPmDdcUsTzl/B+Oa
         6cQM4XyLuwA3QdqY7GHnLfvjHXpNk+SVzB50JveUKSU1dp0hw3kJqsBnUA06NOpzIqiX
         3p11Kruau3z2ANGFQi1jHuJ4ZLVJ/o45VB8Am/rmQZZiS2g6AEB7zeoRw8ILK0LhCA2w
         1XwZ/aFg0hxGEe8Bvk8zZ8GoI6PMLUkeEVmqju57EZDW3qBBg59k2VPIkMlf9M3/cyvS
         AItEhvWNBm3w4Sxn8ZS2mMR83oNsCbx04ITjJk7B6s0bUqNWTkXjM5hJMz9N8wDYRIS9
         wA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531214; x=1690123214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y71r6Tu8NBru+3AZIB9gf8GcBOl4ojAx68BUKEmS2+o=;
        b=MiFWMh1BS33stBT5VkLbzCx9Ly1kSaXi0L0qGeG+GtsOazjSdAJS9Gv1pUPLTvMZT+
         R4wYeANsW3xwCWN05A/iR7jAv9CFd6WDugmsMabnzt8z6MnKxx1caxVEXd/2SGafxCZl
         5msmeYLpiUg3KDv2nvc0Xjo3ehQYjyc3z9gSeyu52dIqG2SF+OCX3LivcHkyrtEFVwuW
         t5oHxNHCpIIDP04D9og/u3lRnNnjSZrA7WHPzcY+zRCVk+lFR+Uq8NJrsRauvVc3YcYp
         pjyzGmtLt4YWq2GtmimDF1xt4DDvM5uygg0h5vH6F5a/q0wsW8e6qyiq/7RtQa496DLD
         bdxQ==
X-Gm-Message-State: AC+VfDwCnYX2xzazuDSERXFyynSjY5XM9DRmrH/oXyHXha0cZRn5R6SE
	5a1M3z09yUHaVvcxZ7nq1qMBoB5oAe2IXlQX4f0=
X-Google-Smtp-Source: ACHHUZ7N9pVdNXLiScOsNr7EJmJmrBUXDP8A8IVePmfHtRGbCKRkjWeLum9lUEZ/OXavlMcryj0MKg==
X-Received: by 2002:a05:600c:ad4:b0:3f9:b8b8:20e8 with SMTP id c20-20020a05600c0ad400b003f9b8b820e8mr8240270wmr.18.1687531214083;
        Fri, 23 Jun 2023 07:40:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 41/55] python3-click-spinner: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:07 +0200
Message-Id: <20230623143921.146338-42-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103537

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-click-spinner_0.1.10.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
index 418f8a32a..bd1136fd7 100644
--- a/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
+++ b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
@@ -7,3 +7,5 @@ SRC_URI[md5sum] = "ab68ed404401421819c81cc6c0677a87"
 SRC_URI[sha256sum] = "87eacf9d7298973a25d7615ef57d4782aebf913a532bba4b28a37e366e975daf"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-json"
-- 
2.39.2


