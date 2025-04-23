Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBB8C369D3
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 10:13:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.4967.1745403182101142449
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Apr 2025 03:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=f9q/i4Cg;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edb40f357so46019645e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 03:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1745403180; x=1746007980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ai7jHXf5QJ9PrD83KaLjP8e/r8ukitHxniTuzmvWoss=;
        b=f9q/i4CgWJgZBy9g6tEECeDKJrvKmZqf7YY9UsBo8zNbzkONj5iuVEQGb8GEy8tdJZ
         CBvBH0RWpGn4SbzdIvZ46IzV0kpy1N5riXs4QE3l9kyJEe2uCBUCHK1F26a6xxy1lYr2
         i+L2su3VL+n1zPT57OgEp9w7/XtYoJbYScSmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745403180; x=1746007980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ai7jHXf5QJ9PrD83KaLjP8e/r8ukitHxniTuzmvWoss=;
        b=BxNBetf6lrKR8ZIkO416o42y8xEREsTI7TMeEWD1uYsvtmmN4XSJn89IaPqATWAs5n
         NfEy2IHSkgUrJjo7bkgxpp+PXo+qAaM5g+wWC68aehvI6iKl8e67dwt4IYZQtPBfRkbp
         RMo2LJKYepFXIjvmzhEh0LtZSXLR5QWG/dfLtqb9JQkFn8DDEihXhpNyA1uvNpWYalGc
         /TgxH+AwzWomJrKp8Ad+Sppe51bs4Dabe0dqadcEGCwHqOkBttqPokICP+/AxwlTOMQ0
         vy4oiG07WoOCyst1sdrgy+vFJsZJJV/iAW17Gs28fJ0jPDYotgM4ne6wZzFtaVzdJSsw
         6lWQ==
X-Gm-Message-State: AOJu0YwxJqiq85+18J4sFLnsP+JQG7aZCqHqA6Zv+3fGo82VP3vpZrtV
	xd4hHv6zh4v2/Vd4sQdm4YR9xqv1cYx1fVnJfCB/xflxArGdMLt9bBd7AugnwOVJSnNpFBu6FZ1
	r
X-Gm-Gg: ASbGncu8L2DZVo7VBfGOkG5Xc2xd64xsr1uXRacOrybShRj1Jjz1WNxvwTH67HdwDHl
	GP1FHTkZUnibwPdBNTe1cI/3mEwNaxWOO/L1rdBnrLQFawJf0R/+9wIUXTd4IFsIz1JSW/spou1
	QBa4H6EzmsWuAqQo/hv8sqLzqhNXkdxGPewpZ7Kr1Sy9bYXKJMxx4kEsMypT/Dy+KadOiq3d4v6
	a9tHkq/uGLeKm6zNmVZaZUu5SdU3TI44Os03PRNQ8W4Rh/dDNr0o7VnT963TPvae4MLgro9jUHH
	CFJpe/nhWTCQ0nIlOuBF8HGpmqLbRUZHxq6mkO6cz7hrFvXVGcyVHdE=
X-Google-Smtp-Source: AGHT+IHMO8IWTwG9TI05fgdelI51o0OmtDfPZ7vsPYJS8YgcaHo/SJGLX/Ksxjb1ITLYINS7CxWIvQ==
X-Received: by 2002:a5d:59ac:0:b0:390:e48a:3869 with SMTP id ffacd0b85a97d-39efba26071mr15225023f8f.11.1745403180144;
        Wed, 23 Apr 2025 03:13:00 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43beb4sm17896704f8f.42.2025.04.23.03.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:12:59 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-soupsieve: Upgrade 2.6 -> 2.7
Date: Wed, 23 Apr 2025 13:12:56 +0300
Message-Id: <20250423101257.3244224-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423101257.3244224-1-leon.anavi@konsulko.com>
References: <20250423101257.3244224-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 10:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117075

Upgrade to release 2.7:

- Add :open pseudo selector.
- Add :muted pseudo selector.
- Recognize the following pseudo selectors: :autofill, :buffering,
  :fullscreen, :picture-in-picture, :popover-open, :seeking,
  :stalled, and :volume-locked. These selectors, while recognized,
  will not match any element as they require a live environment to
  check element states and browser states. This just prevents Soup
  Sieve from failing when any of these selectors are specified.
- A number of existing pseudo-classes are no longer noted as
  experimental.
- Typing fixes.

License-Update: Updated copyright years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-soupsieve_2.6.bb => python3-soupsieve_2.7.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.6.bb => python3-soupsieve_2.7.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.7.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.7.bb
index 80596f6be8..684290ffad 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.7.bb
@@ -2,9 +2,9 @@ SUMMARY = "CSS selector library for python-beautifulsoup4"
 HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bdfa4c8e8b6830bcf8e78cba1669e4d"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a23cdb0cf58a8b6d3d25202783bd6553"
 
-SRC_URI[sha256sum] = "e2e68417777af359ec65daac1057404a3c8a5455bb8abc36f1a9866ab1a51abb"
+SRC_URI[sha256sum] = "ad282f9b6926286d2ead4750552c8a6142bc4c783fd66b0293547c8fe6ae126a"
 
 inherit pypi python_hatchling python_setuptools_build_meta ptest-python-pytest
 
-- 
2.39.5


