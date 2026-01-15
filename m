Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2948D4117C
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 12:24:43 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34460.1768479879127280435
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 04:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gPlOWbfY;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so5125215e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 04:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768479877; x=1769084677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2xn8w/tNs9q17KfIzFJh9gWifmETdFAaSxqV3NfQygI=;
        b=gPlOWbfYU5lTFMbVYNf0s+VsJ32rfTl023ofHft65TjbwzulrTe1GypB9dUPe+x2od
         SCBxAkI5WPlp3raaiPv7ENJP9U52R/i7Yk+TOHGuFpGBBG8fVjZFnwYC2xivb6xqTE4R
         JYIjMgxmFRZc8YylJY8IFVx98vC4XUPX+ky+kHP8tyTwaGwJNATzTVsJVYb+4PJ5CEcx
         ARZLZjqw/FMEhNklS8jgP4YYpVFbYLB6LgaPpY3oFeFK9fT83oq63qZR8+mT4D45bbsv
         rINWbG+m1t9ZmR96ikz5NJaj7unwzJ6ihYgkO2DMvXnr8IlMQqpfvwA+mXEiCtzDIYab
         jMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768479877; x=1769084677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xn8w/tNs9q17KfIzFJh9gWifmETdFAaSxqV3NfQygI=;
        b=LdYnX6X/t1lxBaeT1vUutYSpX4344Yrd0CmWQj22zntamwvzRqEG7R8fUc9ihJ5NcQ
         TQaICBxoF2SRfmdFsRgoNnZnH5l3zYSVmWKX0TzAh48z0TXg4k8RgwbfLdEKjJDPnOgZ
         9G+PEw+WGRS1MQDmEDeqp+1tFrTUG9/69h1SjQ7O870vtxR8RSxt4oR87XHZV43b2NY2
         2OmFtUC18BVbFFsPtD8tTHqFDEgEr97W5jfMiV1b/6TV6JmLi7oYp1d6ISXzRToa1+7y
         tk021vtQS+4Ay0OEdpRP6iIQa09wNCh1e58AVU1hPw1OcwzLf6uslTJPOQ8q1+oZKjaf
         0gqQ==
X-Gm-Message-State: AOJu0YzNPiGobQjDD019ugWqMzBjrIOg/2VmHxZuD6GVzzs7dsco8VPy
	WIJHrrG3+gvKP0Xhw2FbDI97tcXAIjPvKzqGLdzAALiZ+OnsJmQ/ECb2rX1Asw==
X-Gm-Gg: AY/fxX7cw5EJL4G/t7KCRuwWV7+GciYzDgpiso3ti/MvJnUwyQhgwsKuqHnSgju1NTd
	OyrFZlGQK+Reel4oY9y+INd+CFwl6+EsYB5oJOX/CrR/cEO8zEqxQx3DYBVwrVsCyv5vBzMrGo2
	9G4v4swf3ikj5f7cGWV/13hpHD7etRl5a2ANiHXgwNF3QHnPHSO1qjGK8fj+4ZhWVxhkUyX35MH
	q0KK3g6zkY/96jnazzp6YwVtOZZicdk5uJxEYrCne7zTtdeu1T5Fd6N/Pbhyh1sotUowtcUCv53
	XunlbjtsVi4aXimXlkCFibAbxrWxVFia/byafoI5H8erqY9pTXixfVjcb/N1FuT2ZyQZfcevVYD
	PQFnA6qtnEbJyplcyBQUzY2a+mTdrvEeyKb89X2A3mkGSeBawFa2MVSU9Qt7KzizQqi+xwhhIcR
	lHRk216TVV
X-Received: by 2002:a05:600c:34cd:b0:477:55ce:f3c2 with SMTP id 5b1f17b1804b1-47ee32fcad5mr67539805e9.14.1768479876974;
        Thu, 15 Jan 2026 04:24:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6b2988sm5436126f8f.28.2026.01.15.04.24.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:24:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 1/2] python3-django: fix ipv6 validation
Date: Thu, 15 Jan 2026 13:24:34 +0100
Message-ID: <20260115122435.2583676-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 12:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123504

This patch is only for python3-django_3.2.25.

The URL validator didn't detect invalid IPv6 addresses, treating them
as correct ones, making a testcase fail. (Also, according to the comment,
it could also crash in some cases, though I haven't encountered that)

This backported patch mitigates this behavior.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...d-URLValidator-crash-in-some-edge-ca.patch | 56 +++++++++++++++++++
 .../python/python3-django_3.2.25.bb           |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch b/meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch
new file mode 100644
index 0000000000..24ed73e9b5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch
@@ -0,0 +1,56 @@
+From 065b10e2757af671f3e64f0c8714e6f2e4eca727 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 15 Dec 2021 11:55:19 -0300
+Subject: [PATCH] Fixed #33367 -- Fixed URLValidator crash in some edge cases.
+
+From: mendespedro <windowsxpedro@gmail.com>
+
+Upstream-Status: Backport [https://github.com/django/django/commit/e8b4feddc34ffe5759ec21da8fa027e86e653f1c]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ django/core/validators.py | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/django/core/validators.py b/django/core/validators.py
+index 94cc3bf..03cd9b8 100644
+--- a/django/core/validators.py
++++ b/django/core/validators.py
+@@ -111,15 +111,16 @@ class URLValidator(RegexValidator):
+             raise ValidationError(self.message, code=self.code, params={'value': value})
+ 
+         # Then check full URL
++        try:
++            splitted_url = urlsplit(value)
++        except ValueError:
++            raise ValidationError(self.message, code=self.code, params={'value': value})
+         try:
+             super().__call__(value)
+         except ValidationError as e:
+             # Trivial case failed. Try for possible IDN domain
+             if value:
+-                try:
+-                    scheme, netloc, path, query, fragment = urlsplit(value)
+-                except ValueError:  # for example, "Invalid IPv6 URL"
+-                    raise ValidationError(self.message, code=self.code, params={'value': value})
++                scheme, netloc, path, query, fragment = splitted_url
+                 try:
+                     netloc = punycode(netloc)  # IDN -> ACE
+                 except UnicodeError:  # invalid domain part
+@@ -130,7 +131,7 @@ class URLValidator(RegexValidator):
+                 raise
+         else:
+             # Now verify IPv6 in the netloc part
+-            host_match = re.search(r'^\[(.+)\](?::\d{2,5})?$', urlsplit(value).netloc)
++            host_match = re.search(r'^\[(.+)\](?::\d{2,5})?$', splitted_url.netloc)
+             if host_match:
+                 potential_ip = host_match[1]
+                 try:
+@@ -142,7 +143,7 @@ class URLValidator(RegexValidator):
+         # section 3.1. It's defined to be 255 bytes or less, but this includes
+         # one byte for the length of the name and one byte for the trailing dot
+         # that's used to indicate absolute names in DNS.
+-        if len(urlsplit(value).hostname) > 253:
++        if splitted_url.hostname is None or len(splitted_url.hostname) > 253:
+             raise ValidationError(self.message, code=self.code, params={'value': value})
+ 
+ 
diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
index 68b60a784e..15ee178115 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
@@ -15,6 +15,7 @@ SRC_URI += "\
        file://CVE-2024-41991.patch \
        file://CVE-2024-53907.patch \
        file://CVE-2025-32873.patch \
+       file://0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch \
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by

