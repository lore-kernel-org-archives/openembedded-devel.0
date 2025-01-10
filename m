Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E29E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 17:58:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.25868.1736531901219278718
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 09:58:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AjLc+eCe;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43690d4605dso17639895e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 09:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736531899; x=1737136699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AAxZ3jIfNf0tmx817HlJ5oN7O9SLgRZA9CuWys43/s=;
        b=AjLc+eCeWldOQ8iHNQdUQi/VE+Yi4ztPmxP3x0MLND3fRRYFCCX8kenuQw5B3KRyFB
         wT4oBkVXq9tgpOaSLdZWcruSLKqtmhZ2ysSWeZOQviZh37HLkf9WzT6x+fGJABqMGo/J
         ovva4ytJfpPZYhG6LHM9RYaNcocLbxch7RERI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736531899; x=1737136699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AAxZ3jIfNf0tmx817HlJ5oN7O9SLgRZA9CuWys43/s=;
        b=aheFTaPukBnH1FXCKj8BtC8cctRC6Z/LSZujXjU5RSZloHM3Amgq1xvGRDcCsHYsA8
         dHClmpBGdho3gWFe13jCmDuNKfBjnnNG4/kYQeaWN3PDd67jkFsOJ1TDzQ2FckdAiY4R
         iTln4CCosOYJJZgzoQEXz+4oGa2TTTK0XJk6Aayg0aSrKjrrZZaTqiwq4PnOVmiu+HVa
         mZibdtxHhEhG9qImtduNzIEhex2QzsVyTgCikfD0vUI7Ldj+f21VG2028Yqtc/PvRUIr
         8qmp3g30T+QS1FwXmzt7aqKUf4gem+Lv3acBPUto0fkQfWdJ0OL1wOS7YyNyf79+Bn7T
         fVww==
X-Gm-Message-State: AOJu0Yzeac/B8nR9e+IQltuwOvpvfxpEzmWwvckVdRVst5h0pYdvxsyL
	cONP5cirDoCLEyw+Cg8Z1xajk40sB7d6vfwFY+q6cGNb8/zWaClH4VBl8vkyR+9E/NtXhJIgnsZ
	n
X-Gm-Gg: ASbGncvvUii6QdJ+ZbBQigiYkxep8kiYikf9quNJXHicYZ+IopasAlOfvf1x7Gx+HUB
	2skkxKMfN9ulN7NjFqlA4wyok90V5/5EYiFr4DyP9dPPoA+qkcYUjxF8EfKkTCXyQ/LO9J575ld
	5E6HyUgJzMHOLXCY6SBxJQVTubPBsU+mqMbeFtR8CrPJ687sN1owtXIK+mUEE28ciwv+AJCwFTo
	0VTCRcwpH8H8iWuUAJRAKCmz7X51Pf4sL+JyW1Qj8UDIRucPFzGqOmeodQDQ/MEDBra5PY=
X-Google-Smtp-Source: AGHT+IGnXB+ftWhx9Ig0NXyJPU3GnN7FgNSr1lf9+lZbBTOvfvT4tEG7bCEuoj+Q3plK5UyddaXlqw==
X-Received: by 2002:a5d:6c63:0:b0:385:e22e:288f with SMTP id ffacd0b85a97d-38a872ea33fmr11259718f8f.31.1736531899237;
        Fri, 10 Jan 2025 09:58:19 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e8bea5sm93116095e9.31.2025.01.10.09.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 09:58:18 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-pyusb: Upgrade 1.3.0 -> 1.3.1
Date: Fri, 10 Jan 2025 19:58:13 +0200
Message-Id: <20250110175814.3601819-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110175814.3601819-1-leon.anavi@konsulko.com>
References: <20250110175814.3601819-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 17:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114786

Upgrade to release 1.3.1:

- core: fix a regression in ctrl_transfer where supplied read
  buffers were discarded

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pyusb_1.3.0.bb => python3-pyusb_1.3.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyusb_1.3.0.bb => python3-pyusb_1.3.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.3.0.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.3.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pyusb_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pyusb_1.3.1.bb
index 4f1c53df55..595033580a 100644
--- a/meta-python/recipes-devtools/python/python3-pyusb_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.3.1.bb
@@ -9,7 +9,7 @@ RDEPENDS:${PN} += " \
 	python3-logging \
 "
 
-SRC_URI[sha256sum] = "7e6de8ef79e164ced020d8131cd17d45a3cdeefb7afdaf41d7a2cbf2378828c3"
+SRC_URI[sha256sum] = "3af070b607467c1c164f49d5b0caabe8ac78dbed9298d703a8dbf9df4052d17e"
 
 inherit pypi setuptools3
 
-- 
2.39.5


