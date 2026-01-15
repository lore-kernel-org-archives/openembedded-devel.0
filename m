Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C746D33A07
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 08:29:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31198.1768465761073337537
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 00:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T1LOBDyP;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso5641855e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 00:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768465759; x=1769070559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqnoN430bXi8WmvGm0hV9jz1+BGAL5ffoIO/ycLu+lo=;
        b=T1LOBDyPGclJXzMU0K7XQCgjBKpnAilpBSqHj1MNByZ676pA7ySAdbBZFEpvo5J+wT
         n5NzaH/AJ6UZxke5DlzWVmvrCyB7sCfYlO2FNexAaZxu9URS4gTYZzQO3jkDK1zn9os4
         WWUWMGlmfyQHNebP/z9zPpNLYWFA7t5Gp7DUBw1MXxAqz1VWo0krRtsF7Ds7ku8O1nTm
         B6d6nw3VunlJsgeLZriuu5Z07nNIRk61hzhCZnHUMoiak7fgiXyLJgjO0meoUC2t0Mg5
         w/7AaQa8K92A3RA9lc06VQe0QB+7h8jwLJJtMz8MMw2q+BfnnlGx2bg5LXXb6ECyBnkU
         Z69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768465759; x=1769070559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iqnoN430bXi8WmvGm0hV9jz1+BGAL5ffoIO/ycLu+lo=;
        b=k7nH5IC3s9rJS545U7ZmgxsTCaceSbkSmpTeKm+M0zJgI/tajQcbATeDOWVDWJTVKO
         pGglf/DX2mTRrSScgkaV7dyy9IMWHG5onUa1P1ouER5Xh6sX38qZHKMeKUz1Gsg2jRku
         MySZCizeDARi5X64vqRtGFeeqgEdFjORsRHzeQ4II4fVv3z7bJKau7DdZ08f3SuGuL9Q
         /HEIpzKUM96b/wy6A+m1eJy9Zujaj0FBjcmwWRIHbNgtJNZNhdao1TQuXTW2F+qHn5nU
         VoLxLyG7/G+B4zrwbCTyRglzroe5XlgTBslsN9AGzwiZb42CFdRR+iSUZNmECS2Q/xFa
         3umg==
X-Gm-Message-State: AOJu0YxsiBvkIJFvt7nZXAjt5egA56dhhahQY1EUZvNaThxRrpXIUP80
	y8eH+WixBNbr7V51N7tgLDYssiD/dqd77RLDZphCI9XbS44mmrt1rRn6sWjDlQ==
X-Gm-Gg: AY/fxX6Nj2wCmOtgP2x41Yp4kl1tvmh6sQ2wjnNnXJ+GzEWDZ/JpoUDjShv5igxW4+E
	vBCv5CI8oh/e48Hkv+5ULk3p2Nr53MbgU5vzQWRo4vc0Jf3A42TDECmbYo+yS0yp6HogtXqqCIP
	KIJLBFwlrjHm4o1EXdlhRIlfTP71NkGAL3/FWqOCMsuUtjyGT4Vg+UuAQYrKsp6Gt+qUtWlbSnR
	Hd27sgfj+QS6xpFS1zebnzkQyulHv6Fbk5J/jvm47PeDJh6R4emcCTaOuaC4RXjKdhveHua+mJY
	SDne4Jit/+XZyIHuMZ99+dji9s7yjeQLoOy6kxtLOZdmya16Ed6sUtznDZNd2Yls5daTrLByxXf
	/0LOZMnrWwCi04XH5AZ+KwCaJvEY0Pr12o+OVzPgn3fK98NYhiVtndYpa6Dz6WYli8IqFBAOyrz
	U7TYNYt0Tv
X-Received: by 2002:adf:8b83:0:b0:431:855:c79a with SMTP id ffacd0b85a97d-4342c503310mr5109291f8f.27.1768465759354;
        Thu, 15 Jan 2026 00:29:19 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6d90aasm4310083f8f.29.2026.01.15.00.29.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:29:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 4/5] python3-django: fix ipv6 validation
Date: Thu, 15 Jan 2026 09:29:12 +0100
Message-ID: <20260115082915.2357544-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115082915.2357544-1-skandigraun@gmail.com>
References: <20260115082915.2357544-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 08:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123496

This patch is only for python3-django_2.2.28.

The URL validator didn't detect invalid IPv6 addresses, treating them
as correct ones, making a testcase fail. (Also, according to the comment,
it could also crash in some cases, though I haven't encountered that)

This backported patch mitigates this behavior.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...d-URLValidator-crash-in-some-edge-ca.patch | 57 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch b/meta-python/recipes-devtools/python/python3-django/0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch
new file mode 100644
index 0000000000..549e761ec3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch
@@ -0,0 +1,57 @@
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
+@@ -120,15 +120,17 @@ class URLValidator(RegexValidator):
+             raise ValidationError(self.message, code=self.code)
+ 
+         # Then check full URL
++        
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
+-                    raise ValidationError(self.message, code=self.code)
++                scheme, netloc, path, query, fragment = splitted_url
+                 try:
+                     netloc = netloc.encode('idna').decode('ascii')  # IDN -> ACE
+                 except UnicodeError:  # invalid domain part
+@@ -139,7 +141,7 @@ class URLValidator(RegexValidator):
+                 raise
+         else:
+             # Now verify IPv6 in the netloc part
+-            host_match = re.search(r'^\[(.+)\](?::\d{2,5})?$', urlsplit(value).netloc)
++            host_match = re.search(r'^\[(.+)\](?::\d{2,5})?$', splitted_url.netloc)
+             if host_match:
+                 potential_ip = host_match.groups()[0]
+                 try:
+@@ -151,7 +153,7 @@ class URLValidator(RegexValidator):
+         # section 3.1. It's defined to be 255 bytes or less, but this includes
+         # one byte for the length of the name and one byte for the trailing dot
+         # that's used to indicate absolute names in DNS.
+-        if len(urlsplit(value).hostname) > 253:
++        if splitted_url.hostname is None or len(splitted_url.hostname) > 253:
+             raise ValidationError(self.message, code=self.code)
+ 
+ 
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index bf7e182aba..0f6f8fc4d0 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -38,6 +38,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://0001-implement-group-method-for-FakeMatch.patch \
             file://0001-fix-ipv6-test.patch \
             file://0001-Fixed-32298-Fixed-URLValidator-hostname-length-valid.patch \
+            file://0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch \
             "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"

