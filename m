Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4A8C369C2
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 10:16:03 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.15559.1744798562275203441
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 03:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dlnt4Snq;
 spf=pass (domain: konsulko.com, ip: 209.85.208.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso12047631a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 03:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1744798560; x=1745403360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sm8nk0NaRjkmQVZ0TP9OV/AvRSXgkqetJ76ni8CGctU=;
        b=dlnt4SnqX5UlZ50lsbtZHZNavgMqb9u4WCU+coK5w90sbnZi3jV6AHzq5/HFzzHEQv
         4YCb0l14VXeAgj4R8PE3YdvvEINSTztk6ut3pPr9tNR7CvR7sxZ4EkSvOfsK5WMrES+a
         NxunmbBaRzu2ShOC74xPd7tnQvXhAy2QSY88Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744798560; x=1745403360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sm8nk0NaRjkmQVZ0TP9OV/AvRSXgkqetJ76ni8CGctU=;
        b=t7ZXakL+huR0JFnUkOwIMLWxbR7volEwG7WCL1Nwk5OSgSRL3TsBRV5/0mcOdxTsQK
         PCUIQzYkDBJISbpYrNNLb75Ha23IbIH9el1t6s6YDTS1IkyToNk+2+SrgXUPQko85iNk
         w8j6bxUVv2SBAzOwpSWCgGv5S517LIjbbtwjtDPemvb9rc9w1acOnVW6vANtGkf5MBHF
         TVUtX8fCnDhjZgxbSHz+fISYRFYZL+Z5Q7K11tj8aXuH7k/PmYOjgK+BHvIKwEGjFDAe
         QC4XXf2djj4VSpMRZEMVxVgSmmxA6rZan15LjxZp0dFkxqm0VHXAMQqp0KHHkrLy2zel
         V/Ww==
X-Gm-Message-State: AOJu0Yzd69RVlAvWJHmtovUe145UB9gztOlImxTz1C7wxS4LAjh61+z+
	tXFFyt3nHaF9g1DGsis8DLTX30s+CtfUf/L2UHYeanizetYDQw2goa76Llw4Xpr2x5XMKqPTZZy
	s
X-Gm-Gg: ASbGncvmb9XXYBh1NYDJA5QXS6NFPWzIX2YO5Z60b+B/6+KIcaPZMV8voGXcoJFK+s3
	kjCcCRnKd2SiJArAf8Nk8Qa/mnWqm1BJSiYiY4OodQTaglGlLVoPegaeHs5Rx017peiDTDBI8hi
	Xqj/yYPS91BTajJjkgyrCEof5ikNUh+AAuvyqpZYJLrxXQWAO3dq5w+0eLY8jUTPsZofzoVMEmV
	dyyEBTNlOPecBcn9aECwe9mL6i7riGDipDya1g1LBIxB5hPqCqqHMxRkyRrxOrcdM43U/L5ZxXU
	OzEXuV6ieMoEzAK12QyCNK2Pfi/fvFK5q+BgdAwERa0vyGFIskVNEo0=
X-Google-Smtp-Source: AGHT+IGWvk0oEL9MKixmaja8ct8bK5Gg+jjL5MlD5EuEFRbmwrJVo96SjALZJ01U0xz8T8hygvJlPg==
X-Received: by 2002:a17:907:2da3:b0:aca:e2c0:ec3c with SMTP id a640c23a62f3a-acb42c47b92mr87806766b.45.1744798560182;
        Wed, 16 Apr 2025 03:16:00 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d32dca8sm97823366b.164.2025.04.16.03.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:15:59 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-pymysql: Upgrade 1.1.0 -> 1.1.1
Date: Wed, 16 Apr 2025 13:15:55 +0300
Message-Id: <20250416101555.1679536-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416101555.1679536-1-leon.anavi@konsulko.com>
References: <20250416101555.1679536-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 10:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116905

Upgrade to release 1.1.1:

- Fixes a vulnerability (CVE-2024-36039)
- Prohibit dict parameter for Cursor.execute(). It didn't produce
  valid SQL and might cause SQL injection.
- Added ssl_key_password param

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymysql_1.1.0.bb => python3-pymysql_1.1.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymysql_1.1.0.bb => python3-pymysql_1.1.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pymysql_1.1.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pymysql_1.1.1.bb
index 19e552bf88..1c2618c813 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_1.1.1.bb
@@ -8,9 +8,9 @@ HOMEPAGE = "https://pymysql.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
 
-SRC_URI[sha256sum] = "4f13a7df8bf36a51e81dd9f3605fede45a4878fe02f9236349fd82a3f0612f96"
+SRC_URI[sha256sum] = "e127611aaf2b417403c60bf4dc570124aeb4a57f5f37b8e95ae399a42f904cd0"
 
-PYPI_PACKAGE = "PyMySQL"
+PYPI_PACKAGE = "pymysql"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
-- 
2.39.5


