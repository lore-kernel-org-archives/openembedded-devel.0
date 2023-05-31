Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0379C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:41 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.9085.1685521597275680244
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=GkSxoGQZ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f606a80d34so40366355e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521596; x=1688113596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryAuhn8V0Yt0KW1HS2gPipBrbECmGn/Rj4wFhgXetsI=;
        b=GkSxoGQZOslp7H6V7CHA5DejLcFjdvkxBUqFhF4F6VH1UbDU2fq4cFQG/3XezqbQAV
         T0iQVa9fGjzcyb5wzruK0QK98i9qCcmyntPhnqPa2KnsfZO4P0z8DQN70Ai/k0Jupf2B
         qynTjuoNzjh2qQfYB+yv1rBjELKhG0QkPeaN4Jxwx3GHDSVI4tSg+z6IZReLtTljsPm3
         h9Zvq4KJqhN9vnbRYJaMcfEvl76NYLiyCE83ATM91c3Be75t7bc+NxNQN5+xHb1r/w+b
         RPLg0c90OrtPM96xfTrDXowZgLDlTcOe+R8MfPCt1Uj+3tyFQz+pjIp4kBWT3roaswl6
         56vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521596; x=1688113596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryAuhn8V0Yt0KW1HS2gPipBrbECmGn/Rj4wFhgXetsI=;
        b=DLhwijNlAYLUoy5VFneciN+uW5syyRZq9kw8SpoW7MfB7KgNEzyzm+8oJrvE87knx6
         xbYkBfFdiNPXzbKCjJ07uuE3k6D/B2GjEi85qIec0+khXrgYMIcpH4LUvJGseXGbyCuc
         ZsTaJFRqneqPu74Z+7xP6WyrLk5h+ezNbE9nC7bQKMMsbntSc1fWSrDO0FarHF+1p432
         PvCoU5P0AM9uFfyikgFK4vQQ4THaL7o3CQuTgsKNKbSZsGsNOnlTjQbkGOqMGH4nKSUJ
         LaWhSmwhratH/V1H5hkRzdWH292FiYhpjccX9qBILBAyCmPB91Om4XxVkVOKm5eYfSvL
         I8xw==
X-Gm-Message-State: AC+VfDwDPNpx2b0jX3l0l5uyPa4pco8OkAAzAhwjg+L+ERVlonbysCRB
	vbdyd807IRP5G1xxVBSGKTGrBw==
X-Google-Smtp-Source: ACHHUZ7SLH9rvmv+wMGDm9ERDtqMZvp7V7PIkDYimumn46hn6asTYOC6/4hWpU8731TDJlwxM29s3w==
X-Received: by 2002:a5d:5544:0:b0:30a:e86d:17a3 with SMTP id g4-20020a5d5544000000b0030ae86d17a3mr3489518wrw.46.1685521595801;
        Wed, 31 May 2023 01:26:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 080/149] python3-pickleshare: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:28 +0200
Message-Id: <20230531082437.10646-81-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103007

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-pickleshare_0.7.5.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb b/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
index 9d67e4f33..826091308 100644
--- a/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
@@ -10,3 +10,5 @@ SRC_URI[md5sum] = "44ab782615894a812ab96669a122a634"
 SRC_URI[sha256sum] = "87683d47965c1da65cdacaf31c8441d12b8044cdec9aca500cd78fc2c683afca"
 
 inherit setuptools3 pypi
+
+RDEPENDS:${PN} += "python3-pickle"
-- 
2.39.2


