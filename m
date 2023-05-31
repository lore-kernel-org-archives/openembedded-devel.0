Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7465AC7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:41 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.9057.1685521527357877125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=V8lcepwD;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-30ad8f33f1aso3928859f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521536; x=1688113536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghYW/GcBAQl+ncXpVP9K3Yz7LQTwVwmyq0lUSCL3GcY=;
        b=V8lcepwDEh0No2dnMEv3jo1O9J11J+pwmxDNxT1nG9Xs70/H4/IPzZoiDTvXaSzyQm
         NGAM97bjXgfoNh60dFWcuzt9R3c139nOIDxmQYnhazdQsJcK2RdkMarJ0YAQHKok6tf0
         6pVvu2UdkcdUmulN+pG9b/c8TzrbOpt+lhJxS0KK5bS4omH78A+OiJnh0lH5hY1+vvM1
         HCTHB1ifakH1ubhuAKSUl6DSd5EwOthWsq73lDZ4BGQA4tGfY8hDLQNudz2uyTY7ed1f
         gaSMDDsKswY8mdpdguP7kaJ5tdtLr5qzDZ1CyDn297lxs5TLGRvSLYDPJ/kP5/HEVIUZ
         ZM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521536; x=1688113536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghYW/GcBAQl+ncXpVP9K3Yz7LQTwVwmyq0lUSCL3GcY=;
        b=UNkH8W4OoLnecXX4xJzjbRyfr8X8XNzhCG6AfHzzqQ1taZk8ir60f4igJOJaYKZYNb
         XlVisnsbg9tkvDyyMz4VyftqA9Ia+xNHVHqku31bGdvC9Eo3ySeUVJCSzICJJJrgCJE4
         /mFiB9/3MY/2YT8/qIF0vj7qoqtFKAFnflbOkXduL6ydfOtuMNJPvEKPST9Y7qNhne4/
         R4W1nF5lGq9pUL2edIOwvSjiITnSwBW9SXgw+KdmX53cAbz4W8kzuF8Np8EEM4JKmIFU
         XLy2hTGbr5wM3XIXizgUgWJN6gRYukS6ICoxfDjw3J7Z+xtjdGTCuV09+8OGz+Ojb0xp
         MpCQ==
X-Gm-Message-State: AC+VfDwAsHTBjO5r94+3fYBXbDiBf/jEzQfn2xhrwAUZIs/htHZfZ/PG
	K/O6zSSWdKhh1QFU0J92xjGHYmEsjWxpIo0kXbY=
X-Google-Smtp-Source: ACHHUZ5O7essI6C3Q8tMWkvrx02aqam3KZj8oJXOHYIgeG5tVqK6rIgb9ivJzM3MpL8GhVoleYJRWg==
X-Received: by 2002:a05:6000:c3:b0:309:3bc3:7d25 with SMTP id q3-20020a05600000c300b003093bc37d25mr3749862wrx.62.1685521535952;
        Wed, 31 May 2023 01:25:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 028/149] python3-sqlalchemy: don't use PYTHON_PN and improve coding style
Date: Wed, 31 May 2023 10:22:36 +0200
Message-Id: <20230531082437.10646-29-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102955

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2. Drop PYTHON_PN and use python3 explicitly.
While at it: make indentation consistent.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-sqlalchemy_2.0.15.bb          | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
index 3af41bed2..b30437830 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
@@ -10,14 +10,14 @@ PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-profile \
+    python3-compression \
+    python3-json \
+    python3-logging \
+    python3-netclient \
+    python3-numbers \
+    python3-pickle \
+    python3-profile \
+    python3-threading \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


