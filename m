Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C660D33A02
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 08:29:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31225.1768465760350602610
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 00:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iPYX609B;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so3606935e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 00:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768465759; x=1769070559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bT2CUh+WeYg/HizhxPLNhQnOTr97WwLRp76vi/xrwhQ=;
        b=iPYX609BMTQ/UxSi87ZRWcknS5NH/hdwqJ0wcHxKgt/Wwcd4EHa6lFYo76u222aKtq
         i/IKNlAxAnA2hLPoHagwROeynyjlM0weJ49G/tNKFaDakJJ5oyZH/mjcZYvyv573TvCV
         pIhRcmkqPOXgxe7/FoLoof4crKNlvZg/w6tBqKKlrhbmdLs0+jnyEgBC8zD8pIY4RsCX
         3rOMJzvY0CBYKjLsijzDOJELUPkg6eJlIzHRH5vvo0MZFzwhEkRMj/2xUdvtsEhWGFSK
         VC3Y72ahxRJt7uAkISgkLxzyabOYyCablFZSHpyc3b+GRUYPqyItS9iYG+aspH8xWMT0
         SQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768465759; x=1769070559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bT2CUh+WeYg/HizhxPLNhQnOTr97WwLRp76vi/xrwhQ=;
        b=nGK0wlL36/6YF0NWk2pb3lnYpOuLN4O/aRYAqQiY16Us1BRqY0WKBo2y2/p0NvjCsg
         chJD8QEFswzv83B4Q9egZiGVbjsFwt2VGpagNbVjhXHDRWGTTAoidye1dvd8Y39WoHjC
         +tZlmktiIrjaESwbMii2LBGctnwRW1AcGnlzxp18bgVjHefo2DRds8QTr7tiDqCwB14r
         lDUZfczLT8jPAJb7w6IsDUzjBpq94wnyx7meV2B5eCNl6iweY6rLJzAF28CJgDoq5x5v
         DW3+QNeRoDhDjqk4rVuuqXJHv0riifcWhq2yQs5/8huJaicgDup0IFZHyFhY9yXUbu+6
         Eh2Q==
X-Gm-Message-State: AOJu0Ywo8pl3t9V0gX4zVf+Kcb3Lh7cqxtCoS/Z/WIqCfTvK65MU3l8M
	G5xBKFqn4O8tJdX1BOpwawgH3qPgHeZX/f86aZBUJU5Ym69sQok6i4nAB8Eo7A==
X-Gm-Gg: AY/fxX5GMJ7bvsYreq9Zc83MguKytF7Z2oVocbDDxWW1sAwpw30j6vO7pinjHF6pce1
	+9HxGnJsiDkfqEUMIoZ0v0wWxrKBcaxWBK2Njy2zVxKC2kSVWySPs72TaryEAKFFvN3QjWirLMQ
	ze6lzkC9uoFTvTfYj3q0z2u3Mosr4Wgj5/RL55DB5YmbX+dZX7QU9GX36w7PsKKOhRYtrd9uZfm
	GS6rCAGEna7yXJSAsQ8PWe0oIYnWvtNrAnqLJavKNrAPCoQ6vM8jkiVxqbaQxPPNlMewmPz4FqS
	ghq7YEZceTa7bPlrV5OgQvlHqMhRm+wI9G4IFOE1BkW61X8F5sM3wQEwaULa85ijJE/WVUV4Ljx
	jgtqgWar7QpSYW3olZKgxIPQii9A7xJfXzGb9YZLeYPdLbu9QhxfDIJnPgLMbIXIPSaFg8SLXpk
	cfwYXGLnmduQ+w3ABqeSo=
X-Received: by 2002:a05:600c:c0ca:b0:47e:e575:a33e with SMTP id 5b1f17b1804b1-47ee575a747mr34803255e9.33.1768465758687;
        Thu, 15 Jan 2026 00:29:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6d90aasm4310083f8f.29.2026.01.15.00.29.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:29:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 3/5] python3-django: fix hostname length validation in URLvalidator
Date: Thu, 15 Jan 2026 09:29:11 +0100
Message-ID: <20260115082915.2357544-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115082915.2357544-1-skandigraun@gmail.com>
References: <20260115082915.2357544-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 08:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123495

This patch is for python3-django_2.2.28

The hostname's length has been incorrectly validated, it was checking
an incorrect section of the URL, this made a testcase fail.
This backported patch mitigates this issue.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...d-URLValidator-hostname-length-valid.patch | 30 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fixed-32298-Fixed-URLValidator-hostname-length-valid.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Fixed-32298-Fixed-URLValidator-hostname-length-valid.patch b/meta-python/recipes-devtools/python/python3-django/0001-Fixed-32298-Fixed-URLValidator-hostname-length-valid.patch
new file mode 100644
index 0000000000..8cab678a36
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-Fixed-32298-Fixed-URLValidator-hostname-length-valid.patch
@@ -0,0 +1,30 @@
+From ee35cb8dd2f903ddde115ca10186e162ffd8dc62 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 26 Dec 2020 20:52:44 +0530
+Subject: [PATCH] Fixed #32298 -- Fixed URLValidator hostname length
+ validation.
+
+From: Akshat1Nar <akshat.dixit71@gmail.com>
+
+URLValidator now validates the maximum length of a hostname without
+the userinfo and port.
+
+Upstream-Status: Backport [https://github.com/django/django/commit/b41d38ae26b1da9519a6cd765bc2f2ce7d355007]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ django/core/validators.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/django/core/validators.py b/django/core/validators.py
+index 2dbd3bf..94cc3bf 100644
+--- a/django/core/validators.py
++++ b/django/core/validators.py
+@@ -151,7 +151,7 @@ class URLValidator(RegexValidator):
+         # section 3.1. It's defined to be 255 bytes or less, but this includes
+         # one byte for the length of the name and one byte for the trailing dot
+         # that's used to indicate absolute names in DNS.
+-        if len(urlsplit(value).netloc) > 253:
++        if len(urlsplit(value).hostname) > 253:
+             raise ValidationError(self.message, code=self.code)
+ 
+ 
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 3dd64a5507..bf7e182aba 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://0001-Fixed-35172-Fixed-intcomma-for-string-floats.patch \
             file://0001-implement-group-method-for-FakeMatch.patch \
             file://0001-fix-ipv6-test.patch \
+            file://0001-Fixed-32298-Fixed-URLValidator-hostname-length-valid.patch \
             "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"

