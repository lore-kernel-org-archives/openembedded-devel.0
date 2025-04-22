Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E23AC369D8
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:18:46 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.41080.1745331518693037385
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AwET42xn;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ede096d73so38559475e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 07:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1745331517; x=1745936317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWskW+iUiG24SRMLMWpMf2dsO1Z+4618y7bdBHvWA9E=;
        b=AwET42xnY9pJRLJGK2uSABYeoNAXEWa03+Iyff1AwwC6AWPSzzSpMusrT8i9UeCuKj
         sJTezZpNi1xL/QuIwfVTajAoZWK6IF6Sl8kKeD3tc5SyWBzsR1sifoQ1AJTEdmi2e8Cs
         ulnVMKnXMc9aMSCLbdPCsCS4zXsbEZzJBDtlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331517; x=1745936317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWskW+iUiG24SRMLMWpMf2dsO1Z+4618y7bdBHvWA9E=;
        b=GLMo05DI9PZffxrhNjDdeq+aLQ0ZIATJAswaVuWKKjbn0Dppdx2abMZhx60L6dHmeI
         zBzx9nm3wjFe7FtHKaa045Xm2/KthIsPqcqfiDCc1YyatOHj4mAUkyNt7z+uazWWvmFG
         vdKvitV8gjBQehIVaLu01Vwgzj4dW6de6J+Jf+/FdHT5DZ0OcL7D5pD11invlbijyFhs
         grmsAQ8CgUI0w57JYyyrYMMYN5f9uU2/3SIo3BIl4nt1CR3C8QxjfNzTnz64zmJRIPhp
         JONZFfmAtdOvgu4mowUMNLBLb5lgjuJr9wSIlSklOuPqOSwYC23JamHImCzpl16EYx7V
         jljw==
X-Gm-Message-State: AOJu0Yy48YdWRn1EGNqOn5e+BQTLLSyufyOhCICQI9rWRxbPo0rAcycf
	4ioDpg/U/DKYR/Z8UiRceXXemqXX334dJAAnKY46N9iMLET7QrHpFUqa5YXEjzTOw3+GgCss0zK
	z
X-Gm-Gg: ASbGnctyhATIfw3Am4iFeEUcpLDRBt5jsUh5PYLJ0yADmnBlQIn4ypKvmA1BFzoJ3a5
	yBXdTZjh+v0kl7h08k18uNoCLwup2wa1P9Ea8wOOlVfjOnR/fBdeshybc2PRIJocjR+u9MNAm6n
	FMsmvPr8GR/NoHKdxgiMTjYAwkAuh0rlvugv/GhyRlRrPShmwXmD42ccTYNCvYqQCcR7Y0nZy3q
	9fCtMhiipluADvnKxtgDHy1KS650fMWGtzEL3dLDBXa813Nle6F4tNQ//DnJ8HelgRBj9EKnuJO
	ewM3BOBXLnX80M5YNRqtIF/zNoL+hBAbN4E2yjtXELG17IGi8cAaT0s=
X-Google-Smtp-Source: AGHT+IF0oxHigud9V98w5x50eUtyeDhnJ0aoiD/6fvzaI3pqTAazU1bFVp/AP9qUTlvYCspiveeWAw==
X-Received: by 2002:a05:600c:cc8:b0:43d:54a:221c with SMTP id 5b1f17b1804b1-44074f18848mr123671495e9.18.1745331516736;
        Tue, 22 Apr 2025 07:18:36 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d04802fsm12388875e9.1.2025.04.22.07.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:18:36 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-beautifulsoup4: Upgrade 4.13.3 -> 4.13.4
Date: Tue, 22 Apr 2025 17:18:31 +0300
Message-Id: <20250422141833.862036-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422141833.862036-1-leon.anavi@konsulko.com>
References: <20250422141833.862036-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 14:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117057

Upgrade to release 4.13.4:

- If you pass a function as the first argument to a find* method, the
  function will only ever be called once per tag, with the Tag object
  as the argument. Starting in 4.13.0, there were cases where the
  function would be called with a Tag object and then called again
  with the name of the tag.
- Added a passthrough implementation for NavigableString.__getitem__
  which gives a more helpful exception if the user tries to treat it
  as a Tag and access its HTML attributes.
- Fixed a bug that caused an exception when unpickling the result of
  parsing certain invalid markup with lxml as the tree builder.
- Converted the AUTHORS file to UTF-8 for PEP8 compliance.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...eautifulsoup4_4.13.3.bb => python3-beautifulsoup4_4.13.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.13.3.bb => python3-beautifulsoup4_4.13.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.3.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.3.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.4.bb
index a36c22e6f1..ba75b06396 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96e0034f7c9443910c486773aa1ed9ac"
 
-SRC_URI[sha256sum] = "1bd32405dacc920b42b83ba01644747ed77456a65760e285fbc47633ceddaf8b"
+SRC_URI[sha256sum] = "dbb3c4e1ceae6aefebdaf2423247260cd062430a410e38c66f2baa50a8437195"
 
 inherit pypi python_hatchling
 
-- 
2.39.5


