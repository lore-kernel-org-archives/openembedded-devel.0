Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E394ED3C52A
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 08:16:20 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10968.1765354575470429282
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 00:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kkJ7XjSR;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso3846456a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 00:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765354574; x=1765959374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvkVo84j9RgrN2fwm6jRqeXFA7GKuXIFXFvtgQC0Wzw=;
        b=kkJ7XjSRNRBR0howf+nuUgPiwC+Sy+AnbVtuyjTi600jzVtlvwpRULM2slLQW1SNYX
         34K/Xhy9iLgnpEZL6JqLyRfCUTP8hb5v5zn23xbNWfiYn8WA7zluRsXMx7G8Bt+X0TmM
         jP+8PJUuhoEUxxTIjp8Z1VS+Eia8Zg5OQUToDrU6PqCtDxg3XEnuuI/PzKv0vWKubGgZ
         JhkcYlYo8wafSfIrYo/7ARfZyWCEd9wrcyER/lARbGd8osJ+mmGkT8kdPlJva+IiREFJ
         E+wImvCXghd/WEBa/QbpB7WOGOCDKPz396ukwuUwuppclOoXQuGb8lYu7natIaefxabu
         GlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765354574; x=1765959374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZvkVo84j9RgrN2fwm6jRqeXFA7GKuXIFXFvtgQC0Wzw=;
        b=DncM7OrbzygSa9CScSe6EeQQjnp9i12j4IFlNVHTp5NO+kodOOzGvEhaQwHtk7w7Qr
         5jOw7S3dyOutyGXssSvSN28VhsYW6Z5riCC4WnOFFJk7jm5Ba5EhbkXSLxoq2v/P+op9
         YzwMyF5h2accbEc+4Iq8ydeHgg2rDCeJDyc28zyE9FQZXHFcSYmzzoJ+jVeYQ7bN9wS+
         VNqTFnT5xvRJIazPTUatl5Ml+TKIZk8uHXLUiZgOOwPtDog2T+c6Aidtu0lxfOWyftgs
         n6mzrfTp7CiOUVXLx48nzetlhHI1n96CSQkIigsQQLAUB5kfPSAVJbxVrG8mgOCjQ5zh
         t0ZA==
X-Gm-Message-State: AOJu0Ywjf+y83/8v9IoE67oe8KqgdZsC2lMBQxo2snZBelqqwkoR5pmD
	KY1hz7fceuCEPA5ZW60aOGinFv7+ldgi3nYpVUCfIu43KHfB8PnuxwYneem5w6GV
X-Gm-Gg: ASbGncvfS0ECHxAXyZH0JSg5nSp7Lxi2olsDFncw9wl5tENaee+zwchjigSvrE8ahO2
	flg8+1iYRWViO55zaZDX3KQom76+XFg/K+aYQWq0S1LacyWtq4cdI/FHrLDmB6X2pr+yIKVdFs8
	SZANc/5de3uRWM+Gr8OCPOTwZWCiVHUgbb0ZZE5XWnkKHbHQ1jt3LZwhyi5csJuZDxBNBAqDsDY
	SEhT3Bsgm97Y1/FLMuVc22N9RuhbkLD95p4ZRUc23fCuMILDAxqh+iCiQ9QhzO4gNYNsjiZPJWu
	PyOUBYoYQk+DtgmEdNW6jqIEKGXL0CneM7G9XL+pneEr0jNU6csz+SXqqPMZpoSqB1cJeoi3nqd
	ykhTrRAoVTkIKapufLbhg09odD9u4oUrsX9CyFeh/ep9pVq802jJ+jOmllyuEIGTLIJMqrcjY8G
	sEwELFoHDh7RLwc4qapBVjokwEbQNUgZILgtOOdFxF+uGd6MuaJkJOurufaIlkvjibud7VAEj7Z
	L/aDCfP3hUJ87jeLuirABZlhIwKl1em
X-Google-Smtp-Source: AGHT+IEC06iI0X9bs4GUg61ecrbkrDju+DfRxfqU64XqtkUMJOa6yFgquxTv2pKFWfYnDNegz9mUPg==
X-Received: by 2002:a05:7022:ef06:b0:11b:9386:8254 with SMTP id a92af1059eb24-11f296b40c7mr1144509c88.41.1765354574346;
        Wed, 10 Dec 2025 00:16:14 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7703bd7sm80613086c88.10.2025.12.10.00.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:16:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 6/7] python3-traitlets: Fix ptests fails
Date: Wed, 10 Dec 2025 00:16:06 -0800
Message-ID: <20251210081607.3196421-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210081607.3196421-1-raj.khem@gmail.com>
References: <20251210081607.3196421-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 08:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122493

Python 3.13 changed how argparse handles % in help strings,
now treating them all as format placeholders

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-start-testing-on-3.14-and-3.14t-929.patch | 25 +++++++++++++++++++
 .../python/python3-traitlets_5.14.3.bb        |  3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-traitlets/0001-start-testing-on-3.14-and-3.14t-929.patch

diff --git a/meta-python/recipes-devtools/python/python3-traitlets/0001-start-testing-on-3.14-and-3.14t-929.patch b/meta-python/recipes-devtools/python/python3-traitlets/0001-start-testing-on-3.14-and-3.14t-929.patch
new file mode 100644
index 0000000000..275f77a371
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-traitlets/0001-start-testing-on-3.14-and-3.14t-929.patch
@@ -0,0 +1,25 @@
+From 472cf29d06edce66db4af7eb47f601e40cff71c8 Mon Sep 17 00:00:00 2001
+From: M Bussonnier <bussonniermatthias@gmail.com>
+Date: Tue, 14 Oct 2025 08:55:52 +0200
+Subject: [PATCH] start testing on 3.14 and 3.14t (#929)
+
+Upstream-Status: Backport [https://github.com/ipython/traitlets/pull/929]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ traitlets/config/application.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/traitlets/config/application.py b/traitlets/config/application.py
+index b01a11e..2860de7 100644
+--- a/traitlets/config/application.py
++++ b/traitlets/config/application.py
+@@ -215,7 +215,8 @@ class Application(SingletonConfigurable):
+     _log_formatter_cls = LevelFormatter
+
+     log_datefmt = Unicode(
+-        "%Y-%m-%d %H:%M:%S", help="The date format used by logging formatters for %(asctime)s"
++        "%Y-%m-%d %H:%M:%S",
++        help="The date format used by logging formatters for `asctime`",
+     ).tag(config=True)
+
+     log_format = Unicode(
diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.14.3.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.14.3.bb
index 5142e92a04..827fb4ca4e 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.14.3.bb
@@ -7,7 +7,8 @@ SRC_URI[sha256sum] = "9ed0579d3502c94b4b3732ac120375cda96f923114522847de4b3bb98b

 inherit pypi python_hatchling ptest

-SRC_URI += " \
+SRC_URI += "\
+        file://0001-start-testing-on-3.14-and-3.14t-929.patch \
         file://run-ptest \
 "


