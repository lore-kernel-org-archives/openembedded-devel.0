Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD69CC7EE37
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:01 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9061.1685521538688831426
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=Hevtbn39;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30ad458f085so538616f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521554; x=1688113554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/72+DbRVnA+TPjL1qfg9Vh36xO+mox2z7IFhuLbzl4E=;
        b=Hevtbn396SEU1mRpPHitOnRIdhVqFqn/nIOvXtxb4l9zNfR9xA/Km8ajlgOnn9Gspg
         NZBBsbviZjgLH5vm/Kbu98wee0MeMeqwXh4YnN9/IzpJ+bdajMu3a44S5SOur0YstHvl
         ekxK5g5qiv2YP1tCxvmc7YN/GtOBD4F4S1OYBY3TN5TzHvIKAUs/3hEfW7lhWxDAqG0V
         splz1BOnq4a8jK/3tldHaEevSQPLPRlNYvGylcQnkxSPS3vK6zrb4H5XZsCT5eFnsBLK
         4yJNHY0DAW1jFNGGuzvbs52Jk3vPB5mIjUxngoLVjSdoTId+GJKe5HKbisHDlrYaiwsD
         7UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521554; x=1688113554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/72+DbRVnA+TPjL1qfg9Vh36xO+mox2z7IFhuLbzl4E=;
        b=T8EOcBDILMw9rkQn3gaH2oQKrsHk3IOhRvjGS56EHbBPkAzEwx+XeFiTsLsvcizUDA
         1krnLzr0qh4cvPn0N1TCXEHvT7JPWNUxg7rsvOXMx45ABRGAZ7thQSjOlDD1VadSwuFH
         VyDTk9xK86WTRuA6SMnNk4Nxbds83SlVjYgmmzGom31rdK0stSuii9ig83tDFHOC0VD6
         OndSSLjRameJsaRCJ1+SOxDz93tQSVq2AnHGBP1Hy/L8uIQWYlh9seuGrxvB73P14KZe
         DUqnI9Gs49PBlChp0j5w3DHuVOYB3NCTDYHVG8DBpOLFeUIXrEelxzEsvFOXbx10rorK
         ZWEg==
X-Gm-Message-State: AC+VfDx2Un+Tk0tt5CY9X/pZ2eTtM3P6BNBaGBS04httEB/PEndfhsc2
	EyrEqkm1ohiD6yNSlg9pie3Ksg==
X-Google-Smtp-Source: ACHHUZ7SdiNSuRRSeVd6lyVPoCMcEuGhREU2Tg3YkS4rGlkLXanODh4nkd3HOGvhncpaytWjHqTsLQ==
X-Received: by 2002:a5d:62cc:0:b0:309:6fe4:a20d with SMTP id o12-20020a5d62cc000000b003096fe4a20dmr3972251wrv.9.1685521553887;
        Wed, 31 May 2023 01:25:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 043/149] python3-txws: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:51 +0200
Message-Id: <20230531082437.10646-44-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102970

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-connectivity/python-txws/python3-txws_0.9.1.bb   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
index c075e4270..ef6375546 100644
--- a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
+++ b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
@@ -6,6 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76699830db7fa9e897f6a1ad05f98ec8"
 
 DEPENDS = "python3-twisted python3-six python3-vcversioner python3-six-native python3-vcversioner-native"
 
+RDEPENDS:${PN} += " \
+    python3-six \
+    python3-twisted \
+"
+
 SRC_URI = "git://github.com/MostAwesomeDude/txWS.git;branch=master;protocol=https"
 SRCREV= "88cf6d9b9b685ffa1720644bd53c742afb10a414"
 
-- 
2.39.2


