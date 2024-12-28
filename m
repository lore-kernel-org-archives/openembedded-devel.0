Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77243E77188
	for <webhook@archiver.kernel.org>; Sat, 28 Dec 2024 18:43:59 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.33474.1735411435737836911
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Dec 2024 10:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TVC0pyON;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4368a293339so38836555e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Dec 2024 10:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735411434; x=1736016234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJBlVZ7v7YSxYCww5SsRlJoytk/9HLvbG2d5yDoFzsw=;
        b=TVC0pyONH1yYnPSXE7IVONZHziP0Pftr6gFh4QK+mXduzl+4lVpmdUpb5f5RaFNmef
         N+S8bDiOJx7YNKxHyS0AHVkMwSM/2cqSMKeMJcSzxMbqjBsHHmJZVui8+h1rswupYdGc
         swyPxSvSs0kTKsvlBOGvWlWJ0vxa/i9VEqBBo16qKRlXE0lxwNzKRe5Yh14v7LysWhBm
         SVJq0EoP6ZHput9y09yF+RxEdPRy8XITsuQsULDSUvTJTlnIhIMRAh72H/IvFKENSFyr
         WFZUrC2JGwDn/yIhnCVSTTFc9QrbliYK4e/xpZzK5lqOHbpqWuu62q9l3ZvKQPSeVcrC
         4I2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735411434; x=1736016234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJBlVZ7v7YSxYCww5SsRlJoytk/9HLvbG2d5yDoFzsw=;
        b=IGWx1H6KJ+XvmfAn9Ndj0rPzRw9ZseEX0/P3az9v52Z7qoZsRfgXEFFxhKCwBddCLr
         /9SVgCPrIqw6ZP/43zFCGsEqoAVq/4kMIRrofnQBy5yJC5ChbjAtIAtw37/x++uKV+BG
         OpXL0KVx7Ua8nkFFWVibHJPAJ++sWKssUrG4gzbS+wH6Oq96DCqIgq8d37TKkkTn03Fy
         iE3HNxncBryE24vxxiRoatArfy8VW7imph9pwRHsoK9+mM4Oo0YpkFJdjkD95qcoxNjn
         TvIrrUwVUcgRd/d6qC/A9234CXnJYvaWiF2lj45dvLJFcozAJWcuxTXEMLMV1KBoDcZ7
         ULNw==
X-Gm-Message-State: AOJu0Yz2/NFHdvuCFIC7lETMttrtG8fm/i7uLiq1flxbRxJwZ9QvhFBc
	H+w2DUooUFbunWpNb2tExaE7ZKdsrAoLq7lmxPBcaqDB+6Qf+tD1M6LT7I2s
X-Gm-Gg: ASbGncuDhGtPbKTx5HySMkL9Xp4JXHttgWyhl9pxH68s9hyFF0Rhw1RxSFBYWBZiQA9
	j+Toyxb8H/13VghPtmop72Izk9dztTRcc2DQjAYnTEbTTsGjiuITyzwwO1docG29dbg8dq7lY21
	bu6rlS2aVJhUq1d9a3WI+DjL+AmnHMxkWP9VC2mnq53yb99HVJXRw8wEUZgqGC/OqFXXWa+I37P
	mWbDJBVcqEL0jeDDTKvoo1Feq2gMUopUoS7YNbjBuzZ9RYglgcT+JNhX64SCw+uJwx3Kj5nItVj
	OpPABg==
X-Google-Smtp-Source: AGHT+IH+vFRb8qEI58ycM+D5AmIq/Cto3jlJyYpXIaJiRSiANfXsCpEunPRyM35zoiA3iCaHWc0WNQ==
X-Received: by 2002:a05:6000:1542:b0:385:fc70:7f6 with SMTP id ffacd0b85a97d-38a221e1f67mr24404524f8f.7.1735411433613;
        Sat, 28 Dec 2024 10:43:53 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436604e9c2csm304991445e9.43.2024.12.28.10.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 10:43:51 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH] python3-twisted: add python3-attrs to RDEPENDS
Date: Sat, 28 Dec 2024 18:43:34 +0000
Message-ID: <20241228184334.3565-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Dec 2024 18:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114577

This fixes the following issue:

python3[677]: Traceback (most recent call last):
python3[677]:   File "/usr/lib/python3.12/site-packages/myownscript.py", line 9, in <module>
python3[677]:     from twisted.internet import defer
python3[677]:   File "/usr/lib/python3.12/site-packages/twisted/internet/defer.py", line 44, in <module>
python3[677]:     import attr
python3[677]: ModuleNotFoundError: No module named 'attr'

Currently python3-attrs is provided indirectly by python3-automat. But when
python3-automat is updated to >= 24.8.1, python3-attrs is no longer indirectly
provided. The twisted recipe must declare the dependency on python3-attrs.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
index 272aecb8b..b63b62b2f 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
@@ -54,6 +54,7 @@ RDEPENDS:${PN} = "\
 
 RDEPENDS:${PN}-core = "python3-appdirs \
                        python3-asyncio \
+                       python3-attrs \
                        python3-automat \
                        python3-constantly \
                        python3-core \
-- 
2.43.0


