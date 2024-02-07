Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2EEC4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 06:23:29 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.14737.1707287005083278024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 22:23:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JW+8OfSV;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-511531f03f6so267135e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 22:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707287003; x=1707891803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LgC+ShBu7ztlHdFbPBcFqnlPl4a6MDUgVKJ43QMtrAA=;
        b=JW+8OfSVybCOMAtBEjTBCgUuBcSQ7q2D3r1/sEwGuc02YFDBJOcX0XvqYKUdNKMEiL
         fOKqW6LlbXXFhgu3J++LMmNv6U7S8dxp6YTkjxVZZXsxjaSObg5HRaPKXzHDAfDtQsoJ
         HHxnkL9CmlK7b/DE5k6iMt7iBTH5I6KAwiBZWukn3q2Sb4d15pvQ/erStf35AL9GvUWL
         i8ZfxOM8aMWGhU8C3cfrQ1bpMmHVI3R2dV02rGHmRNUBcnFYO48KdBY27lZOYb5zaZbG
         AgVnXz/eFx+5PDL7TfT9fg17QsxGBJ1y5aEacUFxCaLuExeRadzq/VkfntTgjtjxfFjS
         PSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707287003; x=1707891803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgC+ShBu7ztlHdFbPBcFqnlPl4a6MDUgVKJ43QMtrAA=;
        b=d+vOMzST6gVg9t7ZZrjwE4JuUBHGcxLbm9F/bdFG8q9IPPsMMLmlhSiENOw3oGo47f
         BQSdzZH7EF6D7sQK9XT2u3rZBmsocDYNaeqJxeIMtPFupEcgYQxqw3NZdm0SJBdo1zC9
         2ZfOjQHSYSIszZO8RRcyc/64grbArUAVSNWxD9bd8zwaHBWcyjTDxVwR13f8gg5J6ASc
         MYEOeSph33e8BAK90tYZt1YXSONjviNWRZoyT7pJ6b6fB85R5B0dulfkYXMPORTQ0kCn
         2FhnuyLNnje4gNFgum941zwwkjvSlw62g63FnAnt9bVFUdfRS2feo8Q4ZhMUfbIy2LhB
         bEGg==
X-Gm-Message-State: AOJu0Yx6Fw6OgFbuAZ+eWK0jzqwSPGajIp3z3pvIE6oUWecSnUNdda7J
	tb1wH/BkbSiRd4ZLfz9VAjlZZTqKIauH1aNfvq/DLfWVNmeIIpvt/CYfXosPRIg=
X-Google-Smtp-Source: AGHT+IE2Dn168w5nTd+JJpH8hGakCHvX8TsRV/BK4MH5KjCUSvZxcue4ls6ctQEOJod5x2b/bEC5AA==
X-Received: by 2002:a19:9154:0:b0:511:63d1:b623 with SMTP id y20-20020a199154000000b0051163d1b623mr847830lfj.69.1707287002441;
        Tue, 06 Feb 2024 22:23:22 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id m8-20020a1709066d0800b00a3785efe1c4sm380838ejr.85.2024.02.06.22.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 22:23:21 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-pyunormalize: add recipe
Date: Wed,  7 Feb 2024 09:23:14 +0300
Message-Id: <20240207062314.15952-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 06:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108647

A pure Python implementation of the Unicode normalization algorithm independent from the Python core Unicode database. This package supports version 15.1 of the Unicode standard (released in September 2023)

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-pyunormalize_15.1.0.bb                 | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyunormalize_15.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyunormalize_15.1.0.bb b/meta-python/recipes-devtools/python/python3-pyunormalize_15.1.0.bb
new file mode 100644
index 000000000..6992ca24c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyunormalize_15.1.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Unicode normalization forms (NFC, NFKC, NFD, NFKD). A library independent from the Python core Unicode database."
+HOMEPAGE = "https://github.com/mlodewijck/pyunormalize"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dc15b678c3bac1f5b2c873591a330eae"
+
+SRC_URI[sha256sum] = "cf4a87451a0f1cb76911aa97f432f4579e1f564a2f0c84ce488c73a73901b6c1"
+
+inherit pypi setuptools3
-- 
2.25.1


