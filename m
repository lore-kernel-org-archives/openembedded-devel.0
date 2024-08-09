Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5ADC52D7D
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:49:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.87188.1723218537209147015
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CO9RcJ0k;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42816ca797fso15970545e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218535; x=1723823335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrq54RDWjkeHglfj7Vg37qVBqN/gqOjiC/4+teGLVxY=;
        b=CO9RcJ0k4BLBkKhfI2BZFTF7c6AUf1zXtNW626Sco/6KCW3JHNqiYT+BR8l2HUFz9Y
         L+GIGE1sd/lOlnR+oq2gf64TbiVkI4qbn7jYfnCnCBCXXvv0SqUIiW2MnK8DtH6ZyXjo
         fEVWCq8agSnA7ZkX7vnQ2IniGNpdLDguU7/eH88WZvUgvqzLhz/WOwPCu2jote8TSP4F
         o48vao3BZXVU/eauYAoWXbhB6jr6hX028969M8aQvTw2NkPjckOB+PCulnmzX9ClHJfk
         4j2UeHEDjHwxU1XvHImI0gHLXu/v8n21PF3i3lFfdjtFFrM5EOcVdZQxNO/8xw2pirub
         HAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218535; x=1723823335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrq54RDWjkeHglfj7Vg37qVBqN/gqOjiC/4+teGLVxY=;
        b=j3VgW5EwRRxdLCrF8+hTwekI0NmIyScT+xCxlneag1z3U1+kimUHpxP4xU5hWOjEsg
         y7SFUkvd55WicmqBN5+F/PrW04mLt0kHYbqrT3CBCNrET2ANyqELD0ZxetnAnElVeBP8
         qkVRHR837FQpk/GFis2qbzS3kK8jP9xYsSTY35nMHYjkyrOTyE1l06rz9SR4QoK9LMFv
         diI0gk/1V8g4fcv1/kqVzUL6tkXromWR8qmxlRyEwVUCHWgnR7iS5IirF9lH90a54DGL
         Gf26VrKvV6B3iHd7ovpmR6QhCZXiQgrIhEvLFRPssOgp66n4u471WK1w78mac6lNiJHt
         pFMw==
X-Gm-Message-State: AOJu0YyCRrSjZ5X8a6G9LxGjVmzDIMoRDJy2B8nIL/obmre49ERPE5l5
	97FpYDA1AC4GIZYxEx352rpeYY4Z0cGevPGdSe8x9QHJ0/ycq879m7DyaoD3
X-Google-Smtp-Source: AGHT+IFbclSZQigd//HpBvR5Cq5eBOiTvlB5tAEELTTlrYQ9W2F2SdrUdMjcflt3bXrNgXc9sllSXg==
X-Received: by 2002:a05:600c:4e92:b0:428:17b6:bcf1 with SMTP id 5b1f17b1804b1-429c3a291f9mr15067445e9.22.1723218535091;
        Fri, 09 Aug 2024 08:48:55 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738eb4sm81195555e9.14.2024.08.09.08.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:48:54 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 04/13] python3-regex: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 18:48:21 +0300
Message-Id: <20240809154830.14927-4-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809154830.14927-1-alperyasinak1@gmail.com>
References: <20240809154830.14927-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111700

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-regex-2024.7.24-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb b/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
index 682c30fc9..b6e09fc83 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://bitbucket.org/mrabarnett/mrab-regex/src"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "9cfd009eed1a46b27c14039ad5bbc5e71b6367c5b2e6d5f5da0ea91600817506"
 
-- 
2.25.1


