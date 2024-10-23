Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D0ACF5386
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:37:01 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.7968.1729687012372109960
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Fm7khPHQ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43159c9f617so65391785e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1729687010; x=1730291810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxwSvI98hUDVYJGZE6FV7BZa7eCdNTO9AfoX5uwX04g=;
        b=Fm7khPHQhVclAzhajnd05IiJocjJ21ZQz1SGr51qb8QzvbXcIsQ1zEhkDNfVhIL0Zc
         w/D3i2CjwObsy4ntykblzydVUbvQcmwFmIOSkE+KUilHsGEcYBplxpcFm41nZJnvMTRd
         eEEC7Z7q/0Nw4oCszJ9ZcUiPr4Odtl2vGyYdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729687010; x=1730291810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxwSvI98hUDVYJGZE6FV7BZa7eCdNTO9AfoX5uwX04g=;
        b=caQbnAglXJN+48XL32AGNL4piUGMjn7GIh0fgsIHck8K7bHnZ/FYVwxrEDanxeem/M
         ZE4h4DrX1/XtuJp9bLfcBDlmqAISmhmLzM7ewabkXR+kbSGC+V3R9Z5Xwu7lme/Mx1sn
         rE7JJRyDffFDXv68JD+kNHpHQZs1uQip6XaTE+kXDtq7pzYh3jJcgz7IHafHB1pp5ACW
         ih7ltUA7CpKzcBmWkFFYNzI5u+n30RX+j+VMcZUbfusf7BCWihWLowvGRBjfsQrrNFiH
         PH3A0jiw6BxnShnjdjoYe2MA/HDjvcz8A09YlIyNfLGLpWJbtp7DeIXWzpgkPqIqI1iX
         Gq7Q==
X-Gm-Message-State: AOJu0YyFirejZMbTDF43lF3WxU2kUsa1S757ug0QO6iP3WqBOQoHF44L
	I7S0irPd8va6fBv07lscrkTVk3uqISh90kmJIhARvyD9YOMx+ZdUtvaWrCvDENuKiKm4w+Dtbev
	M
X-Google-Smtp-Source: AGHT+IEns/vPFo2G0o/V4QKdPRI0fjyveFSsrB7mQ2nb7slQ24SnOx1QGka80/Yz+a1YBuP4Q2pkNA==
X-Received: by 2002:a05:600c:46c7:b0:431:50fa:89c4 with SMTP id 5b1f17b1804b1-4318412acc0mr23574815e9.3.1729687010559;
        Wed, 23 Oct 2024 05:36:50 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bc90sm8751248f8f.100.2024.10.23.05.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:36:50 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-trio: Upgrade 0.26.2 -> 0.27.0
Date: Wed, 23 Oct 2024 15:36:45 +0300
Message-Id: <20241023123646.1067047-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023123646.1067047-1-leon.anavi@konsulko.com>
References: <20241023123646.1067047-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 12:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113149

Upgrade to release 0.27.0:

- trio.move_on_after and trio.fail_after previously set the deadline
  relative to initialization time, instead of more intuitively upon
  entering the context manager.
- CancelScope.relative_deadline and CancelScope.is_relative added,
  as well as a relative_deadline parameter to __init__. This allows
  initializing scopes ahead of time, but where the specified
  relative deadline doesn't count down until the scope is entered
- trio.Lock and trio.StrictFIFOLock will now raise
  trio.BrokenResourceError when trio.Lock.acquire would previously
  stall due to the owner of the lock exiting without releasing the
  lock
- trio.move_on_at, trio.move_on_after, trio.fail_at and
  trio.fail_after now accept shield as a keyword argument. If
  specified, it provides an initial value for the
  ~trio.CancelScope.shield attribute of the trio.CancelScope
  object created by the context manager
- Added trio.lowlevel.add_parking_lot_breaker and
  trio.lowlevel.remove_parking_lot_breaker to allow creating
  custom lock/semaphore implementations that will break their
  underlying parking lot if a task exits unexpectedly.
  trio.lowlevel.ParkingLot.break_lot is also added, to allow
  breaking a parking lot intentionally
- Allow sockets to bind any os.PathLike object
- Update trio.lowlevel.open_process's documentation to allow bytes
- Update trio.sleep_forever to be NoReturn

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-trio_0.26.2.bb => python3-trio_0.27.0.bb} | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-trio_0.26.2.bb => python3-trio_0.27.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-trio_0.26.2.bb b/meta-python/recipes-devtools/python/python3-trio_0.27.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-trio_0.26.2.bb
rename to meta-python/recipes-devtools/python/python3-trio_0.27.0.bb
index 1272606f6..524e439d4 100644
--- a/meta-python/recipes-devtools/python/python3-trio_0.26.2.bb
+++ b/meta-python/recipes-devtools/python/python3-trio_0.27.0.bb
@@ -5,9 +5,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=447ea202d14d2aee40d8a2c26c865da9 \
                     file://LICENSE.APACHE2;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://LICENSE.MIT;md5=5f229c828e5a6f0a2ce90c7d3c054721"
 
-SRC_URI[sha256sum] = "0346c3852c15e5c7d40ea15972c4805689ef2cb8b5206f794c9c19450119f3a4"
+SRC_URI[sha256sum] = "1dcc95ab1726b2da054afea8fd761af74bad79bd52381b84eae408e983c76831"
 
 inherit pypi python_setuptools_build_meta
 
-PYPI_PACKAGE = "trio"
-RDEPENDS:${PN} = "python3-idna python3-sniffio"
+RDEPENDS:${PN} = " \
+	python3-idna \
+	python3-sniffio \
+	python3-attrs \
+	python3-outcome \
+	python3-sortedcontainers \
+"
-- 
2.39.5


