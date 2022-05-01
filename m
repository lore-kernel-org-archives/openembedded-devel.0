Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7193C433FE
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:26:49 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.159.1651422407959557612
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ir7L2oGW;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 77so546656pgb.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4e7KU2SL0wMXQyXib3zr0XKx+4oh/E5Kou1gemAEUU8=;
        b=ir7L2oGWfQ4v+wCM1BHESG2esAMJkdyKqVMtaUfro523FE7nFPvVsRoApob7ZMbrjX
         KfZpvPT2fQqxZi1zCX7deCrmNUTWXRx7NjZTJINSu8WSCXnlQ7rVMEU6gU0nL+wbGzKL
         9IkZ2uIeqP5dPq22DlVUH8o6nbxZbPyteHeiZmkYVGc/dZ3eDWBiN3CrPJzq4JW13EFv
         c5nwdhiM2BLyF7rlL31ZjlIiLWtQJpJ3MpXLfY3UDPrVwKUPY3wLqMW1mbm8jCcFWvIx
         89FBt8K7GTP7VoWXdgZw7IwsOK3/HE0vrc2pD72OXIF0tafAo3O6VaJeHd0+IRfha2K5
         mL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4e7KU2SL0wMXQyXib3zr0XKx+4oh/E5Kou1gemAEUU8=;
        b=Orq4Z+VcwYitp9ixOzqNdM+5HvHloH+0lle3Ww2NxZtutJ04fWI0G2NZBNiCwbPyBy
         Clxo9XeIy47AM2j0rrfqxSo0wrrMNgUAdFGPdoQwbiBrY+vCoN8Ix15gPEOQtK+/6piG
         /2WdEnX4Yn8Jo9Ol4jmqvq5rwWdt2QC0Q5ih38G5wPE3M9jqY8gFUMQNS95L2BTQvf7n
         0efYWHiLgofY1yhZL7z5iFXuv8+IWaXoRMQqA++b4hh4iqmeaKYZnKZHnTgh927NL9vx
         aP1g3wDguofiKOQgmERjeFzJbE/jkyTa6DMS6+eEid48D6OPmaUWm03AW75hXwaH0evy
         yk4g==
X-Gm-Message-State: AOAM5316pctwFe/4Ev7OsbfuOkqZWzQ5Qmg9TzRs93HQALAI7PUp7hs6
	6yUm0NM2vpU28teycA9ee83WSHs3iZhH2w==
X-Google-Smtp-Source: 
 ABdhPJxcaFmdwEWXSzVYX4QzFQn06Vq1/Vrayd8bqLQuW6xlF23UYgh5fJjSYZxd4Dzw8FHMhaJfpA==
X-Received: by 2002:a63:2a4f:0:b0:3c1:bf77:b81f with SMTP id
 q76-20020a632a4f000000b003c1bf77b81fmr6623807pgq.364.1651422407007;
        Sun, 01 May 2022 09:26:47 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:9a0c:5968:29f0:efcf])
        by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b0015e8d4eb243sm3063569plc.141.2022.05.01.09.26.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:26:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 01/10] crda: move to a dynamic-layer for python
Date: Sun,  1 May 2022 09:26:34 -0700
Message-Id: <20220501162643.513646-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501162643.513646-1-akuster808@gmail.com>
References: <20220501162643.513646-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 16:26:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96913

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch      | 0
 .../crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch      | 0
 .../recipes-connectivity/crda/crda/crda-4.14-python-3.patch       | 0
 .../crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch         | 0
 .../crda/crda/fix-gcc-6-unused-variables.patch                    | 0
 .../crda/crda/fix-issues-when-USE_OPENSSL-1.patch                 | 0
 .../crda/crda/fix-linking-of-libraries-used-by-reglib.patch       | 0
 .../meta-python}/recipes-connectivity/crda/crda/make.patch        | 0
 .../crda/crda/use-target-word-size-instead-of-host-s.patch        | 0
 .../meta-python}/recipes-connectivity/crda/crda_3.18.bb           | 0
 10 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/crda-4.14-python-3.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/make.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda_3.18.bb (100%)

diff --git a/meta-networking/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/crda-4.14-python-3.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/make.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/make.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/make.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/make.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda_3.18.bb
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
-- 
2.25.1


