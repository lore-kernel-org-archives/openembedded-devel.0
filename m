Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF93D31A22
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 07:34:52 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5447.1768376086657652209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 23:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CPbL4ceE;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so4454847f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 23:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768376085; x=1768980885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBCJ/pc3hamz5qg8VoRjlGp5I48DDmuv1vtDuVCflVQ=;
        b=CPbL4ceEi6kicy/1WQE6Cnt87m8a8KHtgLlUnNGIeCb39qnKvNbBB4mWX001C4ifxc
         vqN/eDC8jE7H3uIrOKpO1lSWUiFyiBmTJPnzp6/ePBEwblF7udRlon/aVNW4fZPUCQXg
         nwytKvoLgbWfabWQvnbQbNsCZ3oz89QISe7zBRJHSCMdQzrz6PMWsD65fESRb3proFs7
         L5kkAhUDSFtUNekzHJpixs3kRk/HPI11/eSpftLtzsaExYemSlqEXjG5hI7hvZSXeA/4
         nuiipmNkNE9x9Z+Irol9Ccpts5jB5Fb6bA7Nnm+HjrHUv2aF6EnxjMw9Ed/UOX+/NLK3
         vnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768376085; x=1768980885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XBCJ/pc3hamz5qg8VoRjlGp5I48DDmuv1vtDuVCflVQ=;
        b=gTAojVMCDxeAJ4Y03QH+g8y0T2HaXFM95QDw+lBa73CM3wED6wqlyJtX8lQpYLFhiI
         V1QrXAOrVudYaJ7Ih3MT7MGw0nOUDECPnQo483sw+Q2Gn8FsA2hlFFskmXCtwJkGM2jW
         N2RBbriV8H6YoWUhmwMixkcxX/V0lNW3LGh1oTtv71v9n9vb1rrHENb3kbeW4u5EdLxJ
         fkDvn5wLFyH92DCJkerXM0FEsVwrg3/htC2JH23xg0W7ifUHteN1w43q8siRqyRHqMB0
         R9Q1UsarWQ72qV546VNGT1Zf2uvACDc9bg3FMEXYg/MOattiWyPVZZ2sirmW1GvxGUPK
         qm6A==
X-Gm-Message-State: AOJu0YwDBKlfIQUquAiSZrjof+YAYUmKwjm6JaC8oC5J+OEI1OTKq69p
	Odv0iw4ugxkLQFpJkhxwfc+jMEKUahmVUxK+qq//QhqeFwBo0lL4025GHVwNCw==
X-Gm-Gg: AY/fxX4egcZVJ15vtE7b5ZiX15fdpmmaC4Ncvlnr6CSoWUHZYwSOIPgTcYdNQBXfUoQ
	SiQyT4gN6P6OJN1g1tb0SjizhTQYNFXGxzBSE67aESkzql/ifHT58mzEz5XE6X0ob7lTCrdyMwc
	1AKcDoxKWLfgvAlptxoLA93cm3D/Hz7ymbhlYIdyrykye+6qg37+gYQwupXNRqyA1Di+P6XQnWX
	GH13f9Lv+9y0i61mR81bGhst3s1WV6KOgI+ufIae8A07k4lcimBSn3EnTwqn3rnEV3nZ+7AIong
	+zQfFqT1Lb24DtiK68nY0zDRZcncA/l+Qyd4mvkcT5Uw+pxM91MjgSGxk3Y4MmfuzK7pEyeZRWO
	OmxGJOcX+V/fPloT9OSyH9yTy3ZtLNH0B9G1KsbnfZUX9jlv5/8pesQA/KnOgkv2XHqfrPkHfWS
	H3ar22clcKJMxvePRBfpI=
X-Received: by 2002:a5d:5889:0:b0:430:f5ed:83d3 with SMTP id ffacd0b85a97d-4342c4f4d35mr1712117f8f.5.1768376084919;
        Tue, 13 Jan 2026 23:34:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df96asm47598289f8f.28.2026.01.13.23.34.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 23:34:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 4/5] python3-django: fix regression from CVE-2024-24680 patch
Date: Wed, 14 Jan 2026 08:34:38 +0100
Message-ID: <20260114073440.210915-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114073440.210915-1-skandigraun@gmail.com>
References: <20260114073440.210915-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 07:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123449

This change is for python3-django_2.2.28.

The patch that mitigated CVE-2024-246680 accidentally also brought
a regression, some numbers were converted to (human-friendly) string incorrectly.

This backported patch mitigates this problem.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...172-Fixed-intcomma-for-string-floats.patch | 30 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fixed-35172-Fixed-intcomma-for-string-floats.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Fixed-35172-Fixed-intcomma-for-string-floats.patch b/meta-python/recipes-devtools/python/python3-django/0001-Fixed-35172-Fixed-intcomma-for-string-floats.patch
new file mode 100644
index 0000000000..75b816ab55
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-Fixed-35172-Fixed-intcomma-for-string-floats.patch
@@ -0,0 +1,30 @@
+From 820af24fcaae817ab7c0733035673afc3b37eeac Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 8 Feb 2024 10:58:54 +0100
+Subject: [PATCH] Fixed #35172 -- Fixed intcomma for string floats.
+
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+
+Thanks Warwick Brown for the report.
+
+Regression in 55519d6cf8998fe4c8f5c8abffc2b10a7c3d14e9.
+
+Upstream-Status: Backport [https://github.com/django/django/commit/2f14c2cedc9c92373471c1f98a80c81ba299584a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ django/contrib/humanize/templatetags/humanize.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/django/contrib/humanize/templatetags/humanize.py b/django/contrib/humanize/templatetags/humanize.py
+index ee22a45..8490b5e 100644
+--- a/django/contrib/humanize/templatetags/humanize.py
++++ b/django/contrib/humanize/templatetags/humanize.py
+@@ -77,6 +77,8 @@ def intcomma(value, use_l10n=True):
+     if match:
+         prefix = match[0]
+         prefix_with_commas = re.sub(r"\d{3}", r"\g<0>,", prefix[::-1])[::-1]
++        # Remove a leading comma, if needed.
++        prefix_with_commas = re.sub(r"^(-?),", r"\1", prefix_with_commas)
+         result = prefix_with_commas + result[len(prefix) :]
+     return result
+ 
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 8e826b9b61..72485295a7 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -34,6 +34,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2025-64459.patch \
             file://Fix-undefined-_lazy_re_compile.patch \
             file://Fix-missing-JSONField-in-django.db.mo.patch \
+            file://0001-Fixed-35172-Fixed-intcomma-for-string-floats.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"

