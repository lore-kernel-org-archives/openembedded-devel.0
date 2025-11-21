Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5635DCFC274
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 13:17:46 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11228.1763731061543712378
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Nov 2025 05:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mBgqSqdH;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b387483bbso1370317f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 05:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1763731060; x=1764335860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDLy+PWrbXuKSgdtmKBe9nY5dnBEC0rR7resNkGlZW8=;
        b=mBgqSqdHFLuYTnkEkgRchOyC7fJ/AEmzntlRsZAi46rTS+F3mWz8PFwgQL+yIpCQQ9
         +qEcrwJRe0dt/imyneE3LqGygcuL/tgAO4cjBtIgWyqCcxSU7tuwVcvOzEFyeqwF/rAe
         Lg5WpY4/yaApsDPo4lcNhhhIKo3sbN8n1olnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763731060; x=1764335860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TDLy+PWrbXuKSgdtmKBe9nY5dnBEC0rR7resNkGlZW8=;
        b=ZZQA4A7iAiIlyR7VVORHiDLqDlPcrapRY6QXqHaSnGCmfkUviPRgquiwcoj3AZZ67U
         4/qVd9NFU/AYP+3qRWETJsmyPemWfZPrxOwMh1OS8xXtNyJtjmOa+lFnviFFZdARAls8
         4FA/9TYreaLOpfHx9OOigm3hASsAbqdWPJ5bEJVvuGYpsydWltvnumpSfNVOnHVLOZf2
         qm6zNLfL8s8+6kR7cI9Nop+IDosLBzoIerATYKwbYmfozA1n2kdhMG/8p3fe5E9Y6Uuy
         udLu7S5nIbXBLsWRUVF8z8jwF3u4mMbO89MrSg2LQTuOn3jOljVvdZJPbfjVEjUzxwbH
         IJow==
X-Gm-Message-State: AOJu0YxTMvinXB8aOpkg/Snx/ETCoty5rqTb7QtobcaKNC9JLMUPWxsZ
	ELZFxidoxoYbKnYjgCARz9a/8CfSjpEgeK/7WXkBgTFqN3V1L1AaWxKUkAciOiZ46sAP1BA05/i
	ZtRPx
X-Gm-Gg: ASbGncuQi0gUgwIWmTL1EicYa+KmAl68f4Iddn6kQBZENCgVmnfRC262fU5PCV+NnZ0
	ghyDu/0WaHe0Act7Vj6N57Qt8PWwnui56dcogg9P/As8DwB/b8nuVtFVgBf2zHB8RG7mq5VUK/g
	F7fFPnTYI/6Vab0QHDoR0NrNnbnG+tUnk0VTg6e3PMCd38N+ZLIA8k8qDW9O8p83ax+A5E5IMpS
	m7slDjLhaWQDMr5q3yrx1xidnOoJgriRSuQQ1tdXwjv5LXwZ1xFBKr1RqTP+idEV8aDm81bQitq
	GyCqyQBHjPKRmHsvP97kiqsyjj17QCertlvKHvb8YhIm/mrEmC6xEiwroiN171Fe84CkqrP35Lu
	uRHzelmwgrmvvyIzKeTcxXUGqmS13/LS+O6KsfO70S4wreIxlU5EkVWjyTx/9xfC21NYiK2WZNN
	D7uyL83Vyoed9m1ScJC9aBazQw
X-Google-Smtp-Source: AGHT+IG371XtXLx6B9rVD1BYmCvrusBI/ok4xpgilqBxLPoLVjYMfdO1ypBS+55s8zO7Jd9Zi2Qpsw==
X-Received: by 2002:a05:6000:1889:b0:42b:3155:21da with SMTP id ffacd0b85a97d-42cc1cd8f1cmr2346852f8f.2.1763731059509;
        Fri, 21 Nov 2025 05:17:39 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm11348550f8f.26.2025.11.21.05.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:17:39 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pybind11: Upgrade 2.13.6 -> 3.0.1
Date: Fri, 21 Nov 2025 15:17:36 +0200
Message-ID: <20251121131736.2998314-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251121131736.2998314-1-leon.anavi@konsulko.com>
References: <20251121131736.2998314-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 13:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121962

Upgrade to version 3.0.1:

- Fixed compilation error in `type_caster_enum_type` when casting
  pointer-to-enum types. Added pointer overload to handle
  dereferencing before enum conversion.
- Implement binary version of `make_index_sequence` to reduce
  template depth requirements for functions with many parameters.
- Subinterpreter-specific exception handling code was removed to
  resolve segfaults.
- Fixed issue that caused ``PYBIND11_MODULE`` code to run again if
  the module was re-imported after being deleted from
  ``sys.modules``.
- Prevent concurrent creation of sub-interpreters as a workaround
  for stdlib concurrency issues in Python 3.12.
- Fixed potential crash when using `cpp_function` objects with
  sub-interpreters.
- Fixed non-entrant check in `implicitly_convertible()`.
- Support C++20 on platforms that have older c++ runtimes.
- Fix compilation with clang on msys2.
- Avoid `nullptr` dereference warning with GCC 13.3.0 and python
  3.11.13.
- Fix potential warning about number of threads being too large.
- Fix gcc 11.4+ warning about serial compilation using CMake.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pybind11_2.13.6.bb => python3-pybind11_3.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.13.6.bb => python3-pybind11_3.0.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb b/meta-python/recipes-devtools/python/python3-pybind11_3.0.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_3.0.1.bb
index 7d71767297..cc2f0c66dc 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_3.0.1.bb
@@ -7,7 +7,7 @@ DEPENDS = "\
     python3-ninja-native \
 "
 
-SRCREV = "a2e59f0e7065404b44dfe92a28aca47ba1378dc4"
+SRCREV = "f5fbe867d2d26e4a0a9177a51f6e568868ad3dc8"
 SRC_URI = "\
     git://github.com/pybind/pybind11.git;branch=stable;protocol=https \
 "
-- 
2.47.3


