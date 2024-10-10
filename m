Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3BBD24445
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:41:34 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.53545.1728589290321225719
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kkh4gSTb;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c9454f3bfaso426557a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 12:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728589288; x=1729194088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kLAYGF/w/t+ZBSsdbNuuPg4/vmpVh9vQi99tDUGo9gc=;
        b=Kkh4gSTbZ8ZqxXclvrM5wmJjawb32E6XNkoPdXIOfQ4bGONPxr5cOi7tSqxD/Oj5zZ
         bISRohQytOe/v6ISihSg2HTpXPV5JkEYzipD25crKnXGr78BXvVK5c/w2I3XUFDThg7D
         kCx3zSJ6yBArAoSdSfb+EtlwhV/c65WdrpK1WKaiqqtpb+HHo4RM/fkPOR9DSvHuSYbm
         RXmXHftOMKzpWSxxHHLX9YV8shsSUcUrM6zBiR0ajYNAO7evoACSWGLsgyVygPHPgmtg
         4v9j61NZJGZRIqc6t7zC7N+tqGD7X+Nz8j1SbMZ88e94+FyrfV/L6mVwIThcBCFjgKIW
         tEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728589288; x=1729194088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLAYGF/w/t+ZBSsdbNuuPg4/vmpVh9vQi99tDUGo9gc=;
        b=tmenwtmKAHPobZMldT0auaIFMvYXSTdqjawxUgHRcfgj4qAZFqxLYg3/jKej2l7lY3
         eI4BkiK9yXq1WXsa7s5+MbzKccpI5kO1UztRflLSuLNo9rm9T/3CY1Xa2XBF5D2oHcnq
         19b4obD1edZ05ZbS/L3Y4JbosCKX5CMaGvDBd538+qsjZSgHKH9kQLeyJkeSGNHTRuGv
         /OqpSxA4KXxuDTL1/ZmYZXouK7gyuUsiy/IIv5fB1mYxB4q8OE62sTrdDq1jZEp8m/Em
         jKkFLas6tkvKavlTH8szYqkWoqLmKNWhZhIQcyjblyJNJ/KLMk0QOYRT4CV2N/OHwtJn
         qpuQ==
X-Gm-Message-State: AOJu0YyqkECbavppBhTiQiUGZP+c+4uNqZIZIMKIxvM8IwJIVBsFo0KP
	qgcH/1myfJ8Gcpo6VlLGsiA6L1R+6JBf7yAHAnId17ls4kUsaQh8J9XTrg==
X-Google-Smtp-Source: AGHT+IFWzHitUGeYcunvusx8WfvskplDnXXKZhxdF96rLYf7iY/deIY3y0EeFdAzmh/QMOzbwWbeYw==
X-Received: by 2002:a05:6402:210e:b0:5c8:8322:b154 with SMTP id 4fb4d7f45d1cf-5c91d634834mr7449051a12.16.1728589287684;
        Thu, 10 Oct 2024 12:41:27 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c93729675csm1177163a12.83.2024.10.10.12.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 12:41:26 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH v2 1/2] python3-pytest-aiohttp: Add new recipe
Date: Thu, 10 Oct 2024 19:41:14 +0000
Message-ID: <20241010194114.107827-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 19:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112777

Based on https://pypi.org/project/pytest-aiohttp/

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python/python3-pytest-aiohttp_1.0.5.bb            | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.0.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.0.5.bb b/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.0.5.bb
new file mode 100644
index 000000000..977ce807f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.0.5.bb
@@ -0,0 +1,11 @@
+SUMMARY = "pytest plugin for aiohttp support"
+HOMEPAGE = "https://github.com/aio-libs/pytest-aiohttp"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c251ea89d32d196dddd14c669ed3d482"
+
+DEPENDS = "python3-setuptools-scm-native"
+SRC_URI[sha256sum] = "880262bc5951e934463b15e3af8bb298f11f7d4d3ebac970aab425aff10a780a"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "pytest-aiohttp"
-- 
2.43.0


