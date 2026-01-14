Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96107D31A24
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 07:34:52 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5448.1768376087404247952
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 23:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ELtNSkZw;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so91539795e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 23:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768376086; x=1768980886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjH8abOsXrURua9xjmUu7b+bXRb29TbKeUuP6Du4eMY=;
        b=ELtNSkZwoxkcA1e+VqwxGNJTETlZUC+v2Gjn0mupJvTk/DuBVOnLtV6e8Vevdo1Qnl
         T3eDhO0aW/Vy2flINxGD6hiU5v5aL+lwXLBj8ABs1vFJ6IWllftQ9H49IS/G5N167LlL
         0THHwLUvNC43cxRHzG1nIbMBmjt5fHjhuRBYXoT+zw59WLdtNuuAAuJW9ZCfVlc5Mk6E
         7LnDyOuYlZ1sdkz+KJl+p2710SZCvw6ck8Av6GxY/kixso123W7c5kq52YRnzGfAcWx+
         LysSGL5V5kPztiZxsWZu2Bz/zR+b9Nd8Y2muctuIi3Bdgw2Pi+76DTsemAgz1flyiVx+
         fdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768376086; x=1768980886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cjH8abOsXrURua9xjmUu7b+bXRb29TbKeUuP6Du4eMY=;
        b=RSq1wyB2lfIu6IMmzW3KvFB3qlQ10PjXprf3X83mYHaIy47xPITYtBF5Ppnlaxf74v
         UgzuAneEeRPMqPnNY/s743ANxVuwJ30PYxK02SerIuHBpKjnlBaa0Gr5ExmNm+ESQeA6
         ynDg4FFWndwD7cq1AL2FwnvLSUFgUbJlcZYfGRLvQDMK0bgIF/iV4PJ2A4mTEdTN9h7u
         Vo+CE9wWc43gXQjN9PLuiiEkBWldSEEoTvEZ3RCA8l1vbyfu+bep000jqGw8fsJaoIyG
         frGESMKrIBhTzbxxV8G29QAyOil1YYgd55fq5oW+gPtRaftasrMegq0VVXR3wEpKGd4Y
         30zg==
X-Gm-Message-State: AOJu0YwMOMF1ZiLUy4CoroUiU6c1tFiJcRm0W4xbb4He7LJM5Naz4Oxr
	ZsPzHoYp8SqSOD1zQ9xHKy6HA7ehkxFCD9yvED7MUwsFg3uKWOMl759Af5phSQ==
X-Gm-Gg: AY/fxX6ggxK0GaIBhNH7ibjKwlYa4OqJGV5ITL89IHRTvZBYibOa+bN/1o4yFN8/h7D
	UtOhr8wDQu9BPOYjDxO148fpJNZabkja5VDlWMPh8PGO1qtHdINOD/mb0Zjv2RtVbZEh51NVlXg
	7EKMHZpQm3o3dfFQyn4ac5JRiScVRtAqdciVAwdMhceUoN9BGoTbL5yrKGIRn7Ycpn0t7vx+vRw
	I7DugZV/NRb0csnt7Re5llcFCXQxO6NVlg6+OrKpx+iQVhlM3FEiA8r0S8xDsbQPnAM3F3rOES/
	DYOMNk2xQFEIF+tEpwmp4/NoMokQYhj3nJMjIbO9FCgqo5Kso3u7llS41uPvK0TGr9eVfUhvg8n
	LGW/Mroesgt3m/t873By4E1OcW12SjLu+7ChhgpBiMJyIr9rkPd/Tg5CIXjnMe22P3ODoqory9g
	6h6FVOamssFnp5+lQEjR0=
X-Received: by 2002:a05:6000:18a7:b0:431:104:6daf with SMTP id ffacd0b85a97d-4342c56cffcmr1651732f8f.54.1768376085700;
        Tue, 13 Jan 2026 23:34:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df96asm47598289f8f.28.2026.01.13.23.34.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 23:34:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 5/5] python3-django: implement group method for FakeMatch
Date: Wed, 14 Jan 2026 08:34:39 +0100
Message-ID: <20260114073440.210915-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114073440.210915-1-skandigraun@gmail.com>
References: <20260114073440.210915-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 07:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123450

This change is for python3-django_2.2.28.

This patch is an extension for CVE-2024-27351.patch. The class that patch
introduced wasn't completely suitable for this version of the recipe, because
it was accessing a function of it that was not implemented (the upstream
version that introduced this class did not use that function, it is specific
to this old version).

This patch adds the missing implementation to avoid errors.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...implement-group-method-for-FakeMatch.patch | 42 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-implement-group-method-for-FakeMatch.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/0001-implement-group-method-for-FakeMatch.patch b/meta-python/recipes-devtools/python/python3-django/0001-implement-group-method-for-FakeMatch.patch
new file mode 100644
index 0000000000..450788b0fc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-implement-group-method-for-FakeMatch.patch
@@ -0,0 +1,42 @@
+From c78be5dd9f1772a22f3094d8c2cfe56bfb45b122 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 14 Jan 2026 00:24:12 +0100
+Subject: [PATCH] implement group method for FakeMatch
+
+FakeMatch class was introduced in a backported CVE patch for this
+recipe (CVE-2024-27351). These objects are later accessed in
+django/utils/text.py module, in Truncator._truncate_html() method.
+It is treated as a regex.search() object.
+
+This function, at the time when the upstream project introduced this
+CVE patch was using array-style access, with brackets, so it
+worked, because the FakeMatch class implements the __getitem__()
+method. However in version 2.x, it was using group() access to
+access the matches - which is not implemented for this class, making
+these accesses fail:
+
+AttributeError: 'FakeMatch' object has no attribute 'group'
+
+To avoid this issue, this patch implements this method for this class.
+
+Upstream-Status: Inappropriate [Backport-specific]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ django/utils/text.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/django/utils/text.py b/django/utils/text.py
+index e104b60..5033937 100644
+--- a/django/utils/text.py
++++ b/django/utils/text.py
+@@ -66,6 +66,9 @@ class FakeMatch:
+     def __init__(self, text, end):
+         self._text, self._end = text, end
+ 
++    def group(self, n):
++        return self[n]
++
+ 
+ # ----- End security-related performance workaround -----
+ 
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 72485295a7..3b5491cd5e 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -35,6 +35,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://Fix-undefined-_lazy_re_compile.patch \
             file://Fix-missing-JSONField-in-django.db.mo.patch \
             file://0001-Fixed-35172-Fixed-intcomma-for-string-floats.patch \
+            file://0001-implement-group-method-for-FakeMatch.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"

