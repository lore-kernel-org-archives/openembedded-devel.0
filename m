Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8982CC0219D
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 14:36:38 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web10.96514.1726324591668294414
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Sep 2024 07:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JuPsp/yd;
 spf=pass (domain: smile.fr, ip: 209.85.167.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-536584f6c84so3999109e87.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 07:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1726324589; x=1726929389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2jtrORoDOWuhoBRUj1cu1GTC3yo34MN+r0BahVsvEIc=;
        b=JuPsp/ydnAGJAkKmGymr5EbRxGATY34O9PMtL2JllRdY3cnLOne9tb+BphMWHQP21T
         mmjKJKDc993ZVWpiOeGGqr/7VoVKt1cyuh+h6p9+7DIpGVbG0UzxwXgvje+QnRL8tbrD
         G+W9QwOQdlWVlxEK4yquNj5vKXu2/RB9Mu1d4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726324589; x=1726929389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jtrORoDOWuhoBRUj1cu1GTC3yo34MN+r0BahVsvEIc=;
        b=QN+f2C7wfBn7audf0w5N0dTsHac44AFgg7eyWm07/5HeBnnR38C9JzZuHYzswdqyeL
         U4coDGJeZPv+VjUE3u9EE9+jMRHjcyk9ekNxB9tKcLOPij2vKrXnQyz0wiJkgR2mP7uD
         0bnp6vo9UwnKq4BRyr2Cc0C0OvzGwqNrP8FhBMfi40HnrwFDhg0RvbS5XQvWr71De893
         LswO25DjBsQdRN+P5SnKkK7wbQo6pUK67gUpeH7xv0f3LTzorWMoYtZ2AEG4Pi+ByJoQ
         /qUROA2JS2GLQsbRteK/pvBlhXgbiA7b1ugR2zzICXn2LK18WNHxCQ9NyvEbCVyR5Wy+
         sicg==
X-Gm-Message-State: AOJu0YzWWsbBoHdmNi/8BkpKcxuDMDX4emr4PNwiHCVJ/oKxz9eh6/Yd
	FUWe8HRYST3bmt6ExCCISHQt64UwKuKnTxx+14AtP81x64G1vSR52WdQbA9zSM54Y+SygvPOge3
	9pXM/gA==
X-Google-Smtp-Source: AGHT+IEcDfTH0GYkyJq2tQuwDuBiplBwRlQtXqWBdpWXyhCgfJ83gNa7eAlJ5oerqIWxQDelkRRKgQ==
X-Received: by 2002:a05:6512:a90:b0:52e:8b15:7c55 with SMTP id 2adb3069b0e04-53678fce6eemr5082588e87.27.1726324588488;
        Sat, 14 Sep 2024 07:36:28 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870966c9sm273261e87.149.2024.09.14.07.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 07:36:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH] non-repro-meta-python: exclude packages that failed previously
Date: Sat, 14 Sep 2024 16:35:57 +0200
Message-Id: <20240914143557.2211085-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 14:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112286

From: Yoann Congal <yoann.congal@smile.fr>

Those are the non-reproducible packages from:
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/43

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/conf/include/non-repro-meta-python.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/conf/include/non-repro-meta-python.inc b/meta-python/conf/include/non-repro-meta-python.inc
index 629dc4aa04..64dc69ed55 100755
--- a/meta-python/conf/include/non-repro-meta-python.inc
+++ b/meta-python/conf/include/non-repro-meta-python.inc
@@ -1,6 +1,8 @@
 # List of known non-reproducible package of the meta-python layer
 # Please keep this list sorted
 KNOWN_NON_REPRO_META_PYTHON = " \
+    python3-evdev \
+    python3-evdev-dbg \
     python3-evdev-src \
     python3-frozenlist \
     python3-frozenlist-dbg \
@@ -8,6 +10,7 @@ KNOWN_NON_REPRO_META_PYTHON = " \
     python3-pandas \
     python3-pandas-dbg \
     python3-pandas-src \
+    python3-pybind11-json-dev \
     python3-pycocotools-src \
     python3-pydantic-core \
     python3-pynacl \

