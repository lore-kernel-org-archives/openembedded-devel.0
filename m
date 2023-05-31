Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70719C7EE37
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.9056.1685521525217358994
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=ttO7jmvf;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f6da07ff00so57686485e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521523; x=1688113523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QwW7XBcVihoGokt+ueGvwdXWOb/vfwz8rIHwIU38Kg=;
        b=ttO7jmvfFfgiYzaUTeRaMByhVNhmZJV4mk0SccQW2RoJduSt1js5oZhlwCTA1I59gl
         T1ECjPe0mpWnJ4ki4o0+vYChG2rq7h4SgL9sd00a7SfKqrWug22ZUKP6/oSXzelaJnuW
         AHlLg1P5N/Y6czpBuBgDx5vL0AIb7CSEraCiv9Fp1utmBuCa5Ntxw/wGEpOVqkadTnP5
         9G8FxhRuwUyVbJIRIBu19nF5D8sy7ikA5ZGam3/55WObIHgGYWVcIzNiuceLet6zBhYY
         IMGpuH2oPmy/7eAu3W6YPlGo6mlTtP2ifEhgKMpsqXB9ZujYXjv5VdWOffqvi91Qa63n
         aYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521523; x=1688113523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QwW7XBcVihoGokt+ueGvwdXWOb/vfwz8rIHwIU38Kg=;
        b=UfKI3s0CuA1WTFYnwQAVT02ZpKDX8txwQsoAW7oduywrfQoFdOwIIjYn1sNvkIhVQG
         bqd3FM+wu8S1xsJdSd8C0ITvGF8UGi2eYSBzeFnEZwvInB6JQAthUZMWD+YHbeN52WCT
         5B5UEKrBuvam+A33D1TVGOvT2ff+KLuC057byV1kUxNDJ+fbzTFDTNzbm6qkzZnq67Pl
         hYLln9gzfHmp4ah8Txa/ORU+N88CEOjBo99XGgH4WtcUhILxpe3wqsc/S6l9Q+7qLjNh
         14tEIcSBCyzbgJJO0ZD4gyb6nIeAK8fwUlATKQOXS2RGx0ku7HeUXvYvydqbyPSOu/yu
         JoNA==
X-Gm-Message-State: AC+VfDz+IhdBi8/BguI5qFucm3ZbyJXnq7BPkUNatsQcNJ+H5Di7armA
	r8TLeqUORVi7bxLGDGtXOHQqgw==
X-Google-Smtp-Source: ACHHUZ52y+W/71on9AsN2SlBeK2Wj9BPljNHLzowE3vYdMnVQ0VXvQoPXi+DEKROuL1DXzFnyDM2cw==
X-Received: by 2002:a05:600c:208:b0:3f1:72e2:5d13 with SMTP id 8-20020a05600c020800b003f172e25d13mr3736429wmi.16.1685521523773;
        Wed, 31 May 2023 01:25:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 016/149] python3-meld3: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:24 +0200
Message-Id: <20230531082437.10646-17-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102943

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb b/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
index 1223ae953..1be3fa5ad 100644
--- a/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
@@ -12,3 +12,9 @@ SRC_URI[md5sum] = "1add16caefc9e6b82ef4f40532cb4918"
 SRC_URI[sha256sum] = "3ea266994f1aa83507679a67b493b852c232a7905e29440a6b868558cad5e775"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-cgitb \
+    python3-smtpd \
+    python3-xml \
+"
-- 
2.39.2


