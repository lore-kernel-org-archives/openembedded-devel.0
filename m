Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3705C3ABB8
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 06:21:54 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.44491.1746426110363323114
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 May 2025 23:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=er5fuRNr;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736a72220edso4479165b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 May 2025 23:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746426109; x=1747030909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JassYEXDa5PSD+6qDm2WldNRMkonsBR+x35oLrZF/74=;
        b=er5fuRNrLQPgla8F5iLQNuzP/NsfNDbymBv16LQ00N0HZvR2o1xdrlvIi6Uj9btncY
         23IXa1ZGFh/x5SZKjcVYNE9mRlziR5ForGkxRESj0S4DoMmdfnzM2qa+1D43mP7k+rUm
         uBkMoukLKrdXMs7GrJ+FGMm4Q7onTS4v0q9JvbuWqhUyCByzp1V/FiU9xinMfF5sqttd
         IKdlz8Mo8F+X55QWS+MtvLZxuJdeR73KKnstjeFQtw1nNpUMa0y2AlP+f0/672XnpaCc
         QBckoahVz9zvmwuIVUWVQjYnLkTxFnnXtT6M+IG2TG+59TiDDUplXzGsRPVLrJuzLsV9
         sNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746426109; x=1747030909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JassYEXDa5PSD+6qDm2WldNRMkonsBR+x35oLrZF/74=;
        b=hjxS8Lq2oCtNM589G7wXa7on5hdi9F2NHrS73Tb1KaxErfUkeMh0MgLc0otlN+xTbK
         0b89ItdcQo5uNXwVFafr55RoIUYsPyiz110VEiU7AD59aFbcDnptcAZyi1+Rd7+87LNQ
         Ca9lzjMgVetvLBjU+SZiZxZIvFyGXgYYhIV4UqWYdiKEwTogkGHEeUk84xziBr+PKeH3
         q5BJ7OCDRXTHmb7PUeGPw5hVopqosSNyq6c22z/lMB0rA+9NTx3g8q4YDjQprOyZI5CB
         OR+2vucB3murbeTSQfXJ8UZRm8hcJjjN7eMP9NQxgWHuM8o5cGFC/6cz62BvNLvQv8cs
         eG/w==
X-Gm-Message-State: AOJu0Yxww3236Bagm+j/KjXERD4IvTa3xZbAUfl8kCEnAFzwFBf9Wprh
	KlZEz7lWTXbPCPcxxVpWG6PKieUXYkUu6CHeTOVdZRwMjva3/TZj0f6HSG5r
X-Gm-Gg: ASbGncvB2vbr0FMYVnl5q4hLQh8AYk/7xpvlt1IebnSTxIHrE0cUXRRc15nX6dIQQvC
	YjYqXAE4wo32QA7j4XFKoVUW6arSZiy67FeQkK5zofzqws3nA+dDI/zDBPpVpJX6TNTbk6JUFaL
	7dwbRnTpXS3l7ZN6laukMI8V63XTMK9ARfynrmGegsSl6ThtZSxWlF1XX/mpCbWQkESd6fjHn6A
	BKV4e7+YcEygybxPdnjt3WZhqMDUSRJwo4nXAVwSvBKZu7Ni/lp8URkOj64ckYB0SKX8nD9LxWC
	0ywY115t2wKkYJKqI6FGmHzykHdCY6ID
X-Google-Smtp-Source: AGHT+IGuULc3mDAaukBiqUgqbXv9+V24nSf0sFILHIB7ACLdk5oxx5Oz0QTBGrWAwI3DNOyPfNNgjw==
X-Received: by 2002:a05:6a00:4409:b0:73b:71a9:a5ad with SMTP id d2e1a72fcca58-740673faa0bmr11005793b3a.16.1746426109537;
        Sun, 04 May 2025 23:21:49 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7b1cdsm5952352b3a.25.2025.05.04.23.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 23:21:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 6/7] python3-icu: Fix build with GCC-15
Date: Sun,  4 May 2025 23:21:41 -0700
Message-ID: <20250505062142.3478500-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505062142.3478500-1-raj.khem@gmail.com>
References: <20250505062142.3478500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 06:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117295

drop is_trivial check
Fixes
| In file included from bases.cpp:32:
| arg.h:856:37: error: static assertion failed
|   856 |   static_assert(std::is_trivial<T>::value);             \
|       |                 ~~~~~~~~~~~~~~~~~~~~^~~~~
| arg.h:859:1: note: in expansion of macro '_IS_POD'
|   859 | _IS_POD(AnyPythonObject);
|       | ^~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ove-assert-checking-for-trivial-type.patch | 26 +++++++++++++++++++
 .../python/python3-icu_2.15.2.bb              |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-icu/0001-Remove-assert-checking-for-trivial-type.patch

diff --git a/meta-python/recipes-devtools/python/python3-icu/0001-Remove-assert-checking-for-trivial-type.patch b/meta-python/recipes-devtools/python/python3-icu/0001-Remove-assert-checking-for-trivial-type.patch
new file mode 100644
index 0000000000..4c75eb5f7b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-icu/0001-Remove-assert-checking-for-trivial-type.patch
@@ -0,0 +1,26 @@
+From 3d58fb48bb1cef2177aab8e291167638993495f4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 May 2025 21:27:34 -0700
+Subject: [PATCH] Remove assert checking for trivial type
+
+This fails with GCC-15, is_trivial is deprecated in C++26
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arg.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/arg.h b/arg.h
+index a493d11..6cb232d 100644
+--- a/arg.h
++++ b/arg.h
+@@ -853,7 +853,6 @@ public:
+ };
+ 
+ #define _IS_POD(T)                                      \
+-  static_assert(std::is_trivial<T>::value);             \
+   static_assert(std::is_standard_layout<T>::value)
+ 
+ _IS_POD(AnyPythonObject);
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb b/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
index 77013330d8..d265a20975 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
@@ -12,7 +12,8 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "561e77eedff17cec6839f26211f7a5ce3c071b776e8a0ec9d1207f46cbce598f"
 
-SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
+SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch \
+            file://0001-Remove-assert-checking-for-trivial-type.patch"
 
 inherit pkgconfig pypi python_setuptools_build_meta
 

