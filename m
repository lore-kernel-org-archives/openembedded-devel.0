Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC8AC47BD6
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 09:43:07 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86606.1767692584420018735
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 01:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fgGAIkXi;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7ffa5d1b80so126422666b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767692582; x=1768297382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gHrx9tqxLJYeGCrawyiA43j53WaP8OHqYsTW6ZInlIQ=;
        b=fgGAIkXiVpzRL3oZ9gReEBqLjcfHJgfGIDRvu7qd/FsHz+AlA0sXmaaWrXxXZtsEpS
         wbiVdvTHlTk5y52aKABWsNa2cyRGkeMJCV0mYvSJIVrPj/p/Dc/b8VqISUcDKoGtECwn
         /gS9kjR7vNphLYevmghhfOqOalFHP8oyeJN8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692582; x=1768297382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHrx9tqxLJYeGCrawyiA43j53WaP8OHqYsTW6ZInlIQ=;
        b=XsHxJQiPkbm0Xf4gb/K5itFZ0bxJ6kBYdVLsoJuk/Kiunj7GxCDO2Tp01wJFu+hCdb
         5W5JGkuBVrrQaJoU541+SuDj+WSjXXU+DIZ7UFuvEQ/XubNmk/6ixhN4HF/ZrvNdLXX8
         GPtL88ZfkAqSjZXNhf/b+SlIc0u+K6ebzNQMbQ1bw7X5nrd70oC+gsSwgskxJJTzY6rs
         3PJjhM51CPQ7DK5ubNGKHBgP92galYAr/pW5fEVO7+rv/34kq2AG5EWgCUbiIrgSGevF
         S/+igZxTjThdQ/B7oUD2jiQNGqSir7VhPQNAwRPlWLbnMq5pUW0cwXCUyZOvg5VqBKws
         Ntaw==
X-Gm-Message-State: AOJu0YzLl+n1dxIseQAgZovPeQA2sm9k+thre+BZSDI+RlvqHDGeFWNB
	bnisC4iUm8sK5uMmmppmslFTKkT4DjD6+LfHlRMb8zuTM4cAdbd0UWC6wdTrI1z65+YTvvvY0sO
	RLVIz
X-Gm-Gg: AY/fxX4/pcWuP2aYFBFEV2H0MzIRwoVnUlb3r8z5etGGldK8gQpW5AKIk8jhHUg6mf+
	1FQUUyLBDMeTGneJxFliUXQDvoWsF0YLBQiwS1j8dJ7JzcvJU6r5UNjlHnN49nL4yA07Vlvm6zz
	he5oucMjtGboydzMkCFiKNbosc6mXrkie81xFufXyJCHNwGilqHXzjWlU78yuAssjw0prEU6HKU
	BX4TTh1ZKVMdZUGDkcldg3PaLuFEP5Yy8LvME0rHBE0Md2badpvhnWYqxqyjatYeByV0EwYW//D
	V/MLjGoQPsKuLmehSdb8xp62i1FT7TojU4BgQsmhpgMeiw3Y8QvdFx0owvrWtmqS/9l3rz1jWWG
	WT8Zjs5rs5x1X8Kvc6vWV15QvEzTe37IyNc8TBwy1iMlS8zuMHkNhlQ4EIL5nRQ0df9PmpCJBD9
	Bcmb8+Bhk/lSc/uWYLeJzKV6kw
X-Google-Smtp-Source: AGHT+IFo6P1N/LKb5m9lbj3KXeUKhHhk+URAeVGUquxtkfziyR4k4O6PUnl9liG8wEnUzKoiVMXObw==
X-Received: by 2002:a17:907:3cd5:b0:b7c:e4e9:b13f with SMTP id a640c23a62f3a-b8426bee32cmr279132166b.39.1767692582309;
        Tue, 06 Jan 2026 01:43:02 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5118e1sm176006966b.54.2026.01.06.01.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:43:01 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-pyro5: Upgrade 5.15 -> 5.16
Date: Tue,  6 Jan 2026 11:42:55 +0200
Message-ID: <20260106094259.36870-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 09:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123171

Upgrade to release 5.16:

- project going into super low maintenance mode, I don't plan on
  working on it any longer unless nasty bugs are reported.
- properties can now be a streaming generator too
- loopCondition is relayed from start_ns_loop() to its daemon
- removed Python 3.8 and 3.9 from the support list (they are EOL).
  Now supported on Python 3.10 or newer.
- docs: clarify @expose on a class not automatically exposing base
  class(es).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyro5_5.15.bb => python3-pyro5_5.16.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-pyro5/{python3-pyro5_5.15.bb => python3-pyro5_5.16.bb} (81%)

diff --git a/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.15.bb b/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.16.bb
similarity index 81%
rename from meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.15.bb
rename to meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.16.bb
index eb6fab27cb..63fb533920 100644
--- a/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.15.bb
+++ b/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.16.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python Remote Objects"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c1c9ccd5f4ca5d0f5057c0e690a0153d"
 
-SRC_URI[sha256sum] = "82c3dfc9860b49f897b28ff24fe6716c841672c600af8fe40d0e3a7fac9a3f5e"
+SRC_URI[sha256sum] = "d40418ed2acee0d9093daf5023ed0b0cb485a6b62342934adb9e801956f5738b"
 
-PYPI_PACKAGE = "Pyro5"
+PYPI_PACKAGE = "pyro5"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3 ptest-python-pytest
-- 
2.47.3


