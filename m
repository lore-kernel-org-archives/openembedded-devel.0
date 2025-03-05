Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A67C282EC
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:34:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.13112.1741181657809414379
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pRkhwzip;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43995b907cfso43965655e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 05:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741181656; x=1741786456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BK82jU29diRWALPMFqwD9Oe5/XB7Wj1tk0ZKb9lSMI=;
        b=pRkhwzipRRpt8uVVJmnNM1FP99wxQ7xHUyXnQA2/UIViAibP/NeNVJmdUhv/iY7mER
         dXZ+68BpdMKm3beLxqwgh7M+W8GE8yfbtKryaLsuZeAugWbvz41JxqTi7RbRCvU3s7SJ
         8USF/NXCJ9hPqSz7LD+tsm7hT7AEDKBWDERBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181656; x=1741786456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BK82jU29diRWALPMFqwD9Oe5/XB7Wj1tk0ZKb9lSMI=;
        b=FViY6SKvX9ZlH9rDScZi+Qk1XJ5bwAoLh7mgF9XwYi5GBKXKzautTePbs5jwpmQ7R1
         1TfAVuL3UJevN13ELBeitStDdcHn/TLiM8dAiOrQChp13F53NfDH66ahYP4ujfro37OH
         3u8YOxjmu+44t3MsWlIBuY3215YClOY0NGn8DXu2XblAfF2ciGJwom79edrg8lrp801U
         UKpg+Rzzy58l3Z5Zl/TMZPYrt9y4caMcr0ioLkfoEJbbE3rW3iw5EtoaNE+2mGtyF4me
         o1+g1dmNiK2A+v5JUmAuo5Ffrk8quTpb/a9xApXtL/zAuFaxxovi7WJnfjBMObzjc/R2
         OJGg==
X-Gm-Message-State: AOJu0YwywacVBszk0mbnzhUpUjFHcikYMjfJbUidEVNmWgy0zwLEPen8
	uQYgv9QsWmBshpZQwEEsbBPJlE0z8DVxjNAa7DiXGfErhnPE+p0kqs8wiEkRqz1bB7gwv5647WO
	w
X-Gm-Gg: ASbGncsusEGcgpwuV5i5bPhoEH/F3enBp4vZV2gOZ0btUdv4NgxZV9qy9CrB8rJRXvQ
	5Mo5auXsjysR4HyqZcSQpbB+rZ00GtM+HGD/NV1Or4eBrfmjPVIaMlPTJpRhzkWfZYnxdlyHnHr
	DF/Smq39e/t+pQvAlBoLus99k0NEgbEniprK7Z1NyohVJOKRetms2S4IPBWjgcUS1gmgjcmPJh3
	MN6KpDE0itw++Hv39Rqbe3pMzwgjzdl+3+RT2lJnviUwZLf2laZMnZ2Os+Z1XbQyVOsmJkQtNSN
	CQtUHIJE5cxUBRW4hIAZo4Vvr5KTRcLN2WcRsfQ4qxbRsvlwUFwYwnQYp7A=
X-Google-Smtp-Source: AGHT+IGphHcowibJ+RpFSvZw4nP7c8QmUjXk9TJw9W35hhy+aqzOPnO/iB5cEhWiB1n9s9Mlz29Ewg==
X-Received: by 2002:a05:6000:1542:b0:391:23e7:968d with SMTP id ffacd0b85a97d-39123e79937mr1759008f8f.47.1741181656007;
        Wed, 05 Mar 2025 05:34:16 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485df5asm21266361f8f.96.2025.03.05.05.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:34:15 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-sh: Upgrade 2.2.1 -> 2.2.2
Date: Wed,  5 Mar 2025 15:34:10 +0200
Message-Id: <20250305133412.3463021-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250305133412.3463021-1-leon.anavi@konsulko.com>
References: <20250305133412.3463021-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 13:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115752

Upgrade to release 2.2.2:

- Bugfix where it was impossible to use a signal as an ok_code

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-sh_2.2.1.bb => python3-sh_2.2.2.bb}       | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sh_2.2.1.bb => python3-sh_2.2.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_2.2.1.bb b/meta-python/recipes-devtools/python/python3-sh_2.2.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sh_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-sh_2.2.2.bb
index f75932fd72..a84017a393 100644
--- a/meta-python/recipes-devtools/python/python3-sh_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_2.2.2.bb
@@ -3,9 +3,7 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[sha256sum] = "287021ae84183dea49787985e33797dda7fe769e4f95f2c94dff8e245ab4cb00"
-
-PYPI_PACKAGE = "sh"
+SRC_URI[sha256sum] = "653227a7c41a284ec5302173fbc044ee817c7bad5e6e4d8d55741b9aeb9eb65b"
 
 inherit pypi python_poetry_core
 
-- 
2.39.5


