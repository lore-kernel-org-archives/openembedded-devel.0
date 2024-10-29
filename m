Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB041D5B85F
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 00:54:47 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.8867.1730163283858267849
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 17:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b+f0ZyQK;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20caccadbeeso53178335ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 17:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730163283; x=1730768083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nKbLtYU6Vbe4Y2VZHtZrqT/OsZuLCFbtZmeXjI0R5Mg=;
        b=b+f0ZyQKDm/aP6MYcZd0DvxqPanhyWoOiBgHHNcbs/W4vlbL8+rgw60tsl1jyglYGH
         LA5cIVvZr1XKss2HAi1Xq9mD+wo4yBtgRASJHduEoOKPr+GevnTH8eH8bNPftcoXoEAq
         k5iLTs9jH6kO4VsyZr5HPLrD4ffZ0Mrjk9HNmiqzKZx/Tvf1pPBIjH1NvXxXYl3OOydh
         sWTzWuT+h76frlJ30SegYUgVXDuwC3lWinJH83CXuwtLW0kGb7gAOMr2llHI1qxsKLvi
         +qul0cp7WkpaXUzltcvZxwV9bEUzSdo1OibPYoB+uHZI0CGVKLF6jTG63OMleLX2L/Gi
         kzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730163283; x=1730768083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKbLtYU6Vbe4Y2VZHtZrqT/OsZuLCFbtZmeXjI0R5Mg=;
        b=FHyFmxFfxIU9xOZfX6Yrks9xXpPPL5nNA0/gFwwXktc9/QaIva/OifvK9NrqP8OTTn
         ZZ5xvQlSeRsmVihjQyapyyVmKbALhAhl1scWuUm1rpBs9nmQLYuJcwGozbAOl1awOlo5
         M0Nl8ZbCVB9i1nwaSqZZuBkqGzBt7KJbE0xF88Dsi81wlBJow3SUqM/lu7kyyxCAihGT
         aOXsdaXs/7tXsL1Ot3McC6lQjMroXSdJydn5fBMqSGUdRnWOMKI+miHsqzTGkm9ZHSbt
         v5b8GPJIk0JgBuw8jN63qBvpJuvsZSE9AvR3ZHhovYLmRk0LNBLNggR8J7U8pAsS1Ajp
         o0yg==
X-Gm-Message-State: AOJu0YzwKJCDrsTvMUVaHlVWdL3r9IUBJDWtWc9CxSLpqrv4Um5qT8R4
	8LkRS3WI/r7O1+d7afYBnCvcenlSHy2oX7rn54O4ZHPFgLF5W9nE6qZ+epEA
X-Google-Smtp-Source: AGHT+IEHY3DYsccUGCYwrHVrCqQDvp/Qdg6RXXnka4iW99jQq2kTCZbbSkZOTpj7RW6ZX3W+rTO4hQ==
X-Received: by 2002:a17:902:ced2:b0:20c:ea0a:9665 with SMTP id d9443c01a7336-210c6c6e7c1mr157328105ad.32.1730163282917;
        Mon, 28 Oct 2024 17:54:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9a1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc082757sm56331965ad.290.2024.10.28.17.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 17:54:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-freezegun: Fix ptests with python 3.13
Date: Mon, 28 Oct 2024 17:54:38 -0700
Message-ID: <20241029005440.3916916-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 00:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113314

backport a patch with the needed fix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...174bb97c0b514033a09b820078b0d117f4a8.patch | 37 +++++++++++++++++++
 .../python/python3-freezegun_1.5.1.bb         |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-freezegun/1777174bb97c0b514033a09b820078b0d117f4a8.patch

diff --git a/meta-python/recipes-devtools/python/python3-freezegun/1777174bb97c0b514033a09b820078b0d117f4a8.patch b/meta-python/recipes-devtools/python/python3-freezegun/1777174bb97c0b514033a09b820078b0d117f4a8.patch
new file mode 100644
index 0000000000..4604da2b57
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-freezegun/1777174bb97c0b514033a09b820078b0d117f4a8.patch
@@ -0,0 +1,37 @@
+From 1777174bb97c0b514033a09b820078b0d117f4a8 Mon Sep 17 00:00:00 2001
+From: Bert Blommers <info@bertblommers.nl>
+Date: Fri, 28 Jun 2024 19:21:04 +0000
+Subject: [PATCH] Admin: Support Python 3.13
+
+Upstream-Status: Backport [https://github.com/spulec/freezegun/pull/550]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .github/workflows/ci.yaml | 9 ++++++---
+ tests/test_datetimes.py   | 6 +++---
+ 2 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/tests/test_datetimes.py b/tests/test_datetimes.py
+index a6f1989..b75ad3b 100644
+--- a/tests/test_datetimes.py
++++ b/tests/test_datetimes.py
+@@ -534,17 +534,17 @@ def test_method_decorator_works_on_unittest(self) -> None:
+     @freeze_time('2013-04-09', as_kwarg='frozen_time')
+     def test_method_decorator_works_on_unittest_kwarg_frozen_time(self, frozen_time: Any) -> None:
+         self.assertEqual(datetime.date(2013, 4, 9), datetime.date.today())
+-        self.assertEqual(datetime.date(2013, 4, 9), frozen_time.time_to_freeze.today())
++        assert frozen_time.time_to_freeze.today().strftime('%Y-%m-%d') == "2013-04-09"
+ 
+     @freeze_time('2013-04-09', as_kwarg='hello')
+     def test_method_decorator_works_on_unittest_kwarg_hello(self, **kwargs: Any) -> None:
+         self.assertEqual(datetime.date(2013, 4, 9), datetime.date.today())
+-        self.assertEqual(datetime.date(2013, 4, 9), kwargs.get('hello').time_to_freeze.today())  # type: ignore
++        assert kwargs.get("hello").time_to_freeze.today().strftime('%Y-%m-%d') == "2013-04-09"  # type: ignore
+ 
+     @freeze_time(lambda: datetime.date(year=2013, month=4, day=9), as_kwarg='frozen_time')
+     def test_method_decorator_works_on_unittest_kwarg_frozen_time_with_func(self, frozen_time: Any) -> None:
+         self.assertEqual(datetime.date(2013, 4, 9), datetime.date.today())
+-        self.assertEqual(datetime.date(2013, 4, 9), frozen_time.time_to_freeze.today())
++        assert frozen_time.time_to_freeze.today().strftime('%Y-%m-%d') == "2013-04-09"
+ 
+ 
+ @freeze_time('2013-04-09')
diff --git a/meta-python/recipes-devtools/python/python3-freezegun_1.5.1.bb b/meta-python/recipes-devtools/python/python3-freezegun_1.5.1.bb
index 8b5750df43..431843bde4 100644
--- a/meta-python/recipes-devtools/python/python3-freezegun_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-freezegun_1.5.1.bb
@@ -9,6 +9,7 @@ inherit pypi python_setuptools_build_meta ptest
 
 SRC_URI += " \
         file://run-ptest \
+        file://1777174bb97c0b514033a09b820078b0d117f4a8.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \

