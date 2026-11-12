Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7036.1794520742647735562
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 13:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZOXtL5uf;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3edaso148458f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 13:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794520741; x=1795125541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSAKyFxQQpPy0LQXMM++2tU2xmypqRYrY5LwViy6tJ8=;
        b=ZOXtL5ufwCcB321IahJLRgEbu1zJuk87DBHhS4ZVZTAiAPeh21Q5ztK0DlEJnVW5nA
         fIbfqsUE4IYw6CSXmM0y0TRVocuXh2CQhLnrz7E1BQrjvStZdzrReAVFJt1lvDJh/T9L
         4sxRc/EfgZuBRXiRNDq9mvMijJvGHpHZhpBZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520741; x=1795125541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSAKyFxQQpPy0LQXMM++2tU2xmypqRYrY5LwViy6tJ8=;
        b=nnfp6h4gu68D7ZS0Am3XiM8Yj0TasXrvscy4vpzGk1aTc8cyZoXOo0Yuj6c6MtUhQg
         t+PDun2ZUPmsSOD2Ej3qCoKJc11NETel+TJHU6wtwJUP1GZJeKUy3cqDKBZG8/LgZG/N
         vp4z6Clty66u6yonVQdbjEnHQwnx2wuFFOh8JlCQtnTAwya5r0oJaSzJadxSbkoFc8d6
         0dMwFEjaL3RRjg0auPyoLtYwO6O6K2YenWkPZP04App6s1iDRE4VoCuAuzbBA9sOeObW
         7dNnkWDy7nV1DdZgkCNNr2Of8FURuw2mvs8bOHh1lw4a0cVGWJ6IL7nbZcU/KOeZexFE
         wjdg==
X-Gm-Message-State: APuU4Z+9yxd4KwQeNp45Sw736oI6mfc7GrLYSwAJFEG2KXqdHcDkPVwz
	E4DnUBRPV7jcIZQY8r+mkglrhVdHtl0mDLgHvCtQclwxgdY8tn4hxxAAd2QHQfCKcq7xHvrovkQ
	eJPvG
X-Gm-Gg: AYBFou1GIEN9+YBzsjjAAS9GFOfxlipk0kV2g5c/iZaPY5NVWCXpAr4FUFRv8Ltr7/7
	WRF0FZZjOfuaZBJRtTv7ZHx+xC1ZyjisOLWMQ8PvoYVbj4Q3TY6Ttfn8vzZxUxyajaQRV9vL3BI
	TQcdwuHanqYF5gGl0NqZ66wc9r8SDuNLfTAg98EXDb9JP8zfZB/Z8eq0Hv5m+MRJMogb+jFAgrX
	+Ru0OYWNUOQhiEomWABIgg7r78j0dCO7g1WIGPuiSYjkNN5pvOqwl5kGxQWd9Y4ofesqq62TG4t
	9jmhPe4m51Sp0Eg4ADGbM5uXw6ZOWRY/Vs4N68BMuXCpiTM/BsOH4tvXUtOueY/DzIuL4SixcL7
	02YV8dSGdlCFjX9tFtk2DEg1UsmkvpmRRG5GLsTltFgmn7YhqlZT1f4GCN4kWeKuo/k7euqfzmR
	BZgnuckxdqkV0xYGRyWoDpkI7fjbhXJI6uz+znYcAli25AZa96YRM9o1pZuZLk6ftdTdWtnUhuS
	4yNLkI7rbHUQbC8YDzv3BD54xAR8L5yUbcJxSo0f5tU1SclviIrYwvsuFGt38r2nmW8JfuvBSq6
	T5SO7rsK5usxEjUKH16suYGJrQW3gJw6j7SggmUWh/Y0ATbzYdyU61Aw1B8ZZSP6WPGK9uVECWJ
	NrpYjJYiaucaaENQ3ZkPGbKT69acPa2LpRuRMNB1EuPMfR2AAI+vvhQG9K930AN3mykHMUrA5ZG
	U=
X-Received: by 2002:a05:6000:4718:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-49b0287cd7dmr8330013f8f.21.1794520740940;
        Thu, 12 Nov 2026 13:59:00 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm1043896f8f.18.2026.11.12.13.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:58:59 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-cucumber-expressions: Upgrade 20.1.0 -> 20.2.0
Date: Thu, 12 Nov 2026 23:58:51 +0200
Message-ID: <20261112215852.3336380-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112215852.3336380-1-leon.anavi@konsulko.com>
References: <20261112215852.3336380-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 21:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132220
Content-Type: text/plain; charset="utf-8"

Upgrade to release 20.2.0:

Added:

- [CPP] initial C++ implementation.
- [Dart] Add a Dart implementation of Cucumber Expressions

Fixed:

- [Java] Fix project url

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...e-dependency-uv_build-to-0.13.0-0.14.patch | 23 -------------------
 ...=> python3-cucumber-expressions_20.2.0.bb} |  3 +--
 2 files changed, 1 insertion(+), 25 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-cucumber-expressions/0001-chore-deps-update-dependency-uv_build-to-0.13.0-0.14.patch
 rename meta-python/recipes-devtools/python/{python3-cucumber-expressions_20.1.0.bb => python3-cucumber-expressions_20.2.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-cucumber-expressions/0001-chore-deps-update-dependency-uv_build-to-0.13.0-0.14.patch b/meta-python/recipes-devtools/python/python3-cucumber-expressions/0001-chore-deps-update-dependency-uv_build-to-0.13.0-0.14.patch
deleted file mode 100644
index 5a9796a8b3..0000000000
--- a/meta-python/recipes-devtools/python/python3-cucumber-expressions/0001-chore-deps-update-dependency-uv_build-to-0.13.0-0.14.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From f643f89f9150dcea8c97c8eda989baeef8a2b24d Mon Sep 17 00:00:00 2001
-From: "renovate[bot]" <29139614+renovate[bot]@users.noreply.github.com>
-Date: Sat, 10 Oct 2026 12:26:36 +0000
-Subject: [PATCH] chore(deps): update dependency uv_build to >=0.13.0,<0.14.0
-
-Upstream-Status: Backport [https://github.com/cucumber/cucumber-expressions/commit/b6e45a7ee46490996bf4a150832b0a4f0b75bad1]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 2fb5f57..e8fc3a5 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,6 +1,6 @@
- [build-system]
- build-backend = "uv_build"
--requires = ["uv_build>=0.12.0,<0.13.0"]
-+requires = ["uv_build>=0.13.0,<0.14.0"]
- 
- [project]
- name = "cucumber-expressions"
diff --git a/meta-python/recipes-devtools/python/python3-cucumber-expressions_20.1.0.bb b/meta-python/recipes-devtools/python/python3-cucumber-expressions_20.2.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-cucumber-expressions_20.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cucumber-expressions_20.2.0.bb
index 8f397e6c69..3a1d901963 100644
--- a/meta-python/recipes-devtools/python/python3-cucumber-expressions_20.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cucumber-expressions_20.2.0.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/cucumber/cucumber-expressions"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b2bb1048cefa23c375b8ce5f13313ea"
 
-SRC_URI += "file://0001-chore-deps-update-dependency-uv_build-to-0.13.0-0.14.patch"
-SRC_URI[sha256sum] = "0d216ec26e36c71b3e5643f2e72c41f9b266ef04eaa0c7e47a6e3b2caf523b1a"
+SRC_URI[sha256sum] = "f526dda8f3af10642afd5293ffdbe7b471d3c509633b88af03d05f62b387d294"
 
 inherit pypi python_uv_build
 
-- 
2.47.3

