Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A426C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 09:41:45 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.45902.1748857301286128454
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 02:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=k3GgqQcy;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso41245135e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 02:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748857299; x=1749462099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbEPi6LSnyGHP5ePVrboQbimT+jmdkduVaGF5MUsdeA=;
        b=k3GgqQcyo7dgz8OpOif9NoYl3Hul7hEoaO/eQ6/BBfE5oDnma1hqFAWzfhm4ZhHrY2
         /Fn6mx+i3OdGiIiDJLmjF8VcWrGI3ATv3VlspZQoVSqw9rCTm0nIXEnvYDxK0V4lH8VM
         0ibF5zbz2jON2YSIaVf0JhbdZzAYkOgBqSGio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748857299; x=1749462099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbEPi6LSnyGHP5ePVrboQbimT+jmdkduVaGF5MUsdeA=;
        b=EnTl3kCUZS1+DmjWmWhW2y6IjqSEP836LANmVSvca97Bx6hIuuEI4yNbq1i9i8n8fK
         zV+gRsUVwJIatOKbfdap7CbeBtfwCScGPyJQmxyyM4zfjD/6Bv1ttRnwHATXhnE5GSgC
         AzgOsLdDPSULfLWCUkEFn5woLWCfYE7xJcPOxgdkoniI//yUOqmQPD+gMHGisyWXnzth
         ycKPT/6X1BpMGZNKG1oFVXzPq10fzGDCBIV1+j7/B5zNsyzeCaJ9r/2GmMfTEQBPp/QX
         mUIKeEIyL++tggJkO4pBTgsfUiNIepdn0MXSNBW7xn5qXOwIHr87u39BfW5+xPHgIyot
         5oow==
X-Gm-Message-State: AOJu0YxkiraKObB9uhLkevil5bR0PiWpgNNgTtHrNm/Btn2Hec0MGnm9
	2QmK8K9l18a1NDviWObbcoFZCs4wlR+x09c1oC189h33N01/Ixl+5wMZujzRvBln3tPE0dgJxs4
	Hcfh1
X-Gm-Gg: ASbGncvQcHkr6Z/UYN6HF2HMNLArp+und2GaPHWUW4VFam28LSHhZpT+lZfjuPG1GX1
	NsDGfGvchOZqkIENrCIyGFtQ77zIj/40ad9ceY9sPqRfP21pcPZms7P5qfXnZ9MO/kSTRYjDM0B
	7VJMLbk7yg4GlnmlXzJi3VZLEVQ4x0ZTychX08DRv7zBxqKegWmDwb/tZByBT1Nv8UpbllWpNAS
	MiVN0UHTsRNfLumo8JKCjTyGZLqUgSmp70KbdqZuiQaF98Yq32SInXAD5RnQA8x84YHcXEhp1AY
	uvCP2Gm8fnbNZBWUJBWIVDTgxmNbHHf9c2mRd9fBrlShgs+tEvoVONCSnd8aRlRAOA==
X-Google-Smtp-Source: AGHT+IHaBfl9hoa47zKrFbKtOnD0EXgnyZdSUBdb48spuFFDNsjy1xgn+witHJFc6bjmOvGn4fJa8g==
X-Received: by 2002:a05:6000:248a:b0:3a4:e706:530f with SMTP id ffacd0b85a97d-3a4fe398991mr5951531f8f.42.1748857299507;
        Mon, 02 Jun 2025 02:41:39 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73eadsm14025417f8f.41.2025.06.02.02.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 02:41:39 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-freezegun: Upgrade 1.5.1 -> 1.5.2
Date: Mon,  2 Jun 2025 12:41:33 +0300
Message-Id: <20250602094135.830557-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250602094135.830557-1-leon.anavi@konsulko.com>
References: <20250602094135.830557-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 09:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117699

Upgrade to release 1.5.2:

- Remove support for Python 3.7
- Explicitly marks support for Python 3.13
- Improved project documentation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...174bb97c0b514033a09b820078b0d117f4a8.patch | 37 -------------------
 ...un_1.5.1.bb => python3-freezegun_1.5.2.bb} |  6 +--
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-freezegun/1777174bb97c0b514033a09b820078b0d117f4a8.patch
 rename meta-python/recipes-devtools/python/{python3-freezegun_1.5.1.bb => python3-freezegun_1.5.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-freezegun/1777174bb97c0b514033a09b820078b0d117f4a8.patch b/meta-python/recipes-devtools/python/python3-freezegun/1777174bb97c0b514033a09b820078b0d117f4a8.patch
deleted file mode 100644
index 4604da2b57..0000000000
--- a/meta-python/recipes-devtools/python/python3-freezegun/1777174bb97c0b514033a09b820078b0d117f4a8.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1777174bb97c0b514033a09b820078b0d117f4a8 Mon Sep 17 00:00:00 2001
-From: Bert Blommers <info@bertblommers.nl>
-Date: Fri, 28 Jun 2024 19:21:04 +0000
-Subject: [PATCH] Admin: Support Python 3.13
-
-Upstream-Status: Backport [https://github.com/spulec/freezegun/pull/550]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .github/workflows/ci.yaml | 9 ++++++---
- tests/test_datetimes.py   | 6 +++---
- 2 files changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/tests/test_datetimes.py b/tests/test_datetimes.py
-index a6f1989..b75ad3b 100644
---- a/tests/test_datetimes.py
-+++ b/tests/test_datetimes.py
-@@ -534,17 +534,17 @@ def test_method_decorator_works_on_unittest(self) -> None:
-     @freeze_time('2013-04-09', as_kwarg='frozen_time')
-     def test_method_decorator_works_on_unittest_kwarg_frozen_time(self, frozen_time: Any) -> None:
-         self.assertEqual(datetime.date(2013, 4, 9), datetime.date.today())
--        self.assertEqual(datetime.date(2013, 4, 9), frozen_time.time_to_freeze.today())
-+        assert frozen_time.time_to_freeze.today().strftime('%Y-%m-%d') == "2013-04-09"
- 
-     @freeze_time('2013-04-09', as_kwarg='hello')
-     def test_method_decorator_works_on_unittest_kwarg_hello(self, **kwargs: Any) -> None:
-         self.assertEqual(datetime.date(2013, 4, 9), datetime.date.today())
--        self.assertEqual(datetime.date(2013, 4, 9), kwargs.get('hello').time_to_freeze.today())  # type: ignore
-+        assert kwargs.get("hello").time_to_freeze.today().strftime('%Y-%m-%d') == "2013-04-09"  # type: ignore
- 
-     @freeze_time(lambda: datetime.date(year=2013, month=4, day=9), as_kwarg='frozen_time')
-     def test_method_decorator_works_on_unittest_kwarg_frozen_time_with_func(self, frozen_time: Any) -> None:
-         self.assertEqual(datetime.date(2013, 4, 9), datetime.date.today())
--        self.assertEqual(datetime.date(2013, 4, 9), frozen_time.time_to_freeze.today())
-+        assert frozen_time.time_to_freeze.today().strftime('%Y-%m-%d') == "2013-04-09"
- 
- 
- @freeze_time('2013-04-09')
diff --git a/meta-python/recipes-devtools/python/python3-freezegun_1.5.1.bb b/meta-python/recipes-devtools/python/python3-freezegun_1.5.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-freezegun_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-freezegun_1.5.2.bb
index 9d823da507..56674c448b 100644
--- a/meta-python/recipes-devtools/python/python3-freezegun_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-freezegun_1.5.2.bb
@@ -3,14 +3,10 @@ HOMEPAGE = "https://github.com/spulec/freezegun"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=acf1d209bb6eddae4cbe6ffd6a0144fe"
 
-SRC_URI[sha256sum] = "b29dedfcda6d5e8e083ce71b2b542753ad48cfec44037b3fc79702e2980a89e9"
+SRC_URI[sha256sum] = "a54ae1d2f9c02dbf42e02c18a3ab95ab4295818b549a34dac55592d72a905181"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI += " \
-        file://1777174bb97c0b514033a09b820078b0d117f4a8.patch \
-"
-
 RDEPENDS:${PN}-ptest += " \
         python3-sqlite3 \
 "
-- 
2.39.5


