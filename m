Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA3FCF8540
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 21:08:59 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.5325.1727903332583395880
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Oct 2024 14:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XxAHv6ah;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso1548005e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Oct 2024 14:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727903331; x=1728508131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QbEYuAEVvNwn15xZvJslnGycPWJAXtY7YPTL7I8qJjs=;
        b=XxAHv6ah8NIL4VzGm6Itqm0AKBYc/gR9Suu1J2BjQYIYT57fswdWVpkHG9MqP0z/xf
         optcUhj5bTwHU2ZqA7VezfjhNGdbaqfzgDUX4heIgA5PBJKuNb1GgVTUh0K6GlLMOGqv
         lY7rXTUwJ/PbV46s9nOjrdQpBTDyTy4tyAIUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727903331; x=1728508131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbEYuAEVvNwn15xZvJslnGycPWJAXtY7YPTL7I8qJjs=;
        b=esdGoADyjva4i1+3TqeslQ1ZSsJpRRosA8T0I/6ZMsiqXw05e4xbYtKaAwxcdulejF
         gLIE96B6swBAgJOdWs4UMOamKzPvLsA8mFqyTj+9I9+b7uCETT4Ssm4/2vpzmuOBpgbg
         /iIjjInURWY6q+64EA7H6grwc1OGfy07mW7spzu15lzrRhPPzB3GnGw5oswI6irmZCoy
         Ygi7LTNRkEUmTUI/ASAcjI8b9S7Rig4nm+c9ZF2uM6dDXA654uTZ2KnwLRzUDu/Imu0t
         t7MxmN+e9VocJDdh54fK51T7iJuUyrufNsYz8p8/U+tHeLdEYYUF4fJZz21/gkrYOPB/
         TQ/Q==
X-Gm-Message-State: AOJu0YyR2mwiHJsbal7pb0GvaFqZSMV1/o6UfSp4dejLZbv6g9E7Tfec
	XPoshDrX18EymI+oZhRYd1qGd3Urt2tN8IW9CKlfGVjopAin2qi2YwmGgRC9ugoiv9M7SEvvyEB
	r
X-Google-Smtp-Source: AGHT+IERs5ARDGx9t5MoF+CdHpTK3A3SYwWiQGC4wmkejBz+XOc3/CNP18Qspa9C2vrT8J9RADvZsQ==
X-Received: by 2002:a05:600c:35d6:b0:42c:c1f6:6ded with SMTP id 5b1f17b1804b1-42f778f2b9cmr32018555e9.29.1727903330093;
        Wed, 02 Oct 2024 14:08:50 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79db1d6csm28980465e9.1.2024.10.02.14.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 14:08:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH] non-repro-meta-networking: update known non-reproducible list
Date: Wed,  2 Oct 2024 23:08:38 +0200
Message-Id: <20241002210838.2567828-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Oct 2024 21:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112644

From: Yoann Congal <yoann.congal@smile.fr>

Add:
* ntopng: date in version
* opensaf: build host hostname in /etc/ files

from: https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/45/steps/28/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-networking/conf/include/non-repro-meta-networking.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/conf/include/non-repro-meta-networking.inc b/meta-networking/conf/include/non-repro-meta-networking.inc
index c5313416a7..6519ef33ed 100755
--- a/meta-networking/conf/include/non-repro-meta-networking.inc
+++ b/meta-networking/conf/include/non-repro-meta-networking.inc
@@ -21,8 +21,11 @@ KNOWN_NON_REPRO_META_NETWORKING = " \
     ndisc6-rdnssd \
     ndisc6-rltraceroute6 \
     netsniff-ng-doc \
+    ntopng \
+    ntopng-dbg \
     ntpsec-src \
     openl2tp \
+    opensaf \
     postfix-cfg \
     rp-pppoe \
     udpcast-doc \

