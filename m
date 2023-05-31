Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EEBC83003
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.9100.1685521513940978001
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=UrfT53l4;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f6ffc2b314so5095795e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521512; x=1688113512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOqzopYaD/5zZzqEgYwF2Ne0JuLo+KpUFi8ezhpd8s0=;
        b=UrfT53l4kPpgKmpXO5bIWH16hGTFUtzX6ZUhWahnISFv9gfG52VrwubO50zvU0FgSt
         kQzCwii2WY/DQF++g0rXjG2V9ZjwtMla8vPb64n9WnKlbhP7XSuAsfNod8Innh0WnJjZ
         pKR94GGU9v40t0m3u7irwkux8iqllmPUpYMglcnqUfFQiRCAhWh0O7Bi4wIuO4oJ7Yfo
         vne6nq/ZW6R9hByS3LsWUzm7s0ZbsmLZBNFWvp6P8Dg2E0/i+tUaflSpx3v1BmunoagR
         3u6W4+lnosRiV8Yiaj41n4FOyQ3UoMaf/T8uqO35rDmGTyObKdtFiGNPQ5yXK1IX3s4I
         pgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521512; x=1688113512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOqzopYaD/5zZzqEgYwF2Ne0JuLo+KpUFi8ezhpd8s0=;
        b=Xz2Y/nTxXGx9rvElEHwNDB/wmAFIdZMY2GdfqHRjzUlre1iix7rNteiHSJjL+6Wch7
         +hQVMvGNltGFB8529lZXOJRc0c4KmQ5cXKmXSCW/6I+IMkT9pcdkcWe396gIiYUOTuSG
         T2WPkxYV2AmwwY3NYOVcZqIqqM6wpYD1DwC+P7Ld6lPxtpiRt044xUdtIR79U80TYTpQ
         QNCMYuz5LPSTfII4Dc0Wr/g74m4GIofiI3bzFgJuCqed8fFJr3FG3mkmQ4q4ZPTDkSyu
         yQujcutz+ZnMZvJYm25lDrG4ZvwHqPTYe/ug7+Ls+UUqzHE/9pZaRDsvJOzTW0EUXC6h
         QzSQ==
X-Gm-Message-State: AC+VfDznzuSZKCMSupmvzSf3siOgZLcgDO4qb5HSGaTGodp22SgmA3O/
	99AJ84IuZKWSIsvWSxAUTxRTV8MML4hAQt+99Uk=
X-Google-Smtp-Source: ACHHUZ5sURWJsZF4VNE01yolB3ku0rd1zWCYz6Rn4JW8A2UpS8gmoIzgXl5bA8rYMJrIa1ZermDIUg==
X-Received: by 2002:adf:de81:0:b0:30a:d944:b765 with SMTP id w1-20020adfde81000000b0030ad944b765mr4100129wrl.15.1685521512298;
        Wed, 31 May 2023 01:25:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 005/149] python3-pywbem: order RDEPENDS alphabetically
Date: Wed, 31 May 2023 10:22:13 +0200
Message-Id: <20230531082437.10646-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102932

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Order run-time dependencies for clarity.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
index c84576382..6bff9844d 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
@@ -31,6 +31,8 @@ RDEPENDS:${PN} += "\
     python3-datetime \
     python3-io \
     python3-netclient \
+    python3-nocasedict \
+    python3-nocaselist \
     python3-ply \
     python3-pyyaml \
     python3-six \
@@ -38,8 +40,6 @@ RDEPENDS:${PN} += "\
     python3-threading \
     python3-unixadmin \
     python3-xml \
-    python3-nocasedict \
-    python3-nocaselist \
     python3-yamlloader \
 "
 
-- 
2.39.2


