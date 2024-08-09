Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F687C52D7D
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:48:56 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.87151.1723218533793277886
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vqv41LrJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso16269575e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218532; x=1723823332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MEIHuwrlhp0H1+fs43QAlBJUczbIUi5oulKGRg7ZJc=;
        b=Vqv41LrJJ88EwQNd1hC1D1+flHrtuIgv66jk9LpixAJOHuM8LDlXQoXuvUwJj8rabb
         SO8E4bS6SzJykaDRmzR6aLK8z2+xxNh9xDMUCfmNamDFQeaOXMJbEjhv3n52aJT0e1AF
         i5Rh0nOfBvd/8NwfPz+Tld6kJ4jvpaBXkBtCUrKzIfeAJOd2R+rSLybNwJKtoCokYKS9
         4WgYr+l/XHCtev/tkImX2hSNWuI0BQYFLibP8RqIalwkn8VvMwrPBwxIrfWtH/zxmhgI
         +0mUcoPSoPXFFolTqk9kIRBZbYItl9OnPRSswBCEp3rBbjtall6lg9HDz8joTd43EKMj
         P6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218532; x=1723823332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MEIHuwrlhp0H1+fs43QAlBJUczbIUi5oulKGRg7ZJc=;
        b=So/W0VrolckkAo2j8K4nnfcJISz7za1eE1PaFvlOKLusD/9TVLUuaG3R0oafHVju60
         A45IbWJxQf8GfMY+MBnI5yZF2j/jX/0umlX6Rc2zzA6VYlr0y/nv3WLa+C6j+7YxqHkA
         RwKmwYq+qEyYBtlJv4V7jJGXYWKG1EX1J0uaomBSgGk4+w/b5qhOunmJ+xuhvxHNPlMz
         wjDLC9O3LVWJ0pYZEAcdNZNVRXc8HXQIrWr4H1NjhOxNUrVUigxfrpV1ZBZEzk5ipJSx
         tQKbSzJUzbwwe4lAYnNUC/QsGxQkIKV1OOD5AkdK2PSZbbGFiv3fcRZUoqHyVaix8Z+r
         YGWA==
X-Gm-Message-State: AOJu0Yw4Chv1eozhlt7oKKmXFm4M3LexCAPR5qjCXO5nXM1gzAzfsZwB
	BDL4faq/wPjy+mkrQbNv4YMoI/vSD8IjCDnyXEO+Z/HVnf1GzY3er1AGBXEy
X-Google-Smtp-Source: AGHT+IFviRAFKupXhO6tq6kzrCVKK/5A8rIdqKqjXeSKqKotavBjtVc0rGZjvBakM6A+nINvmUP/GQ==
X-Received: by 2002:a05:600c:c17:b0:426:6960:34ac with SMTP id 5b1f17b1804b1-429c3a6058dmr13017255e9.36.1723218531602;
        Fri, 09 Aug 2024 08:48:51 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738eb4sm81195555e9.14.2024.08.09.08.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:48:51 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 03/13] python3-parse-type: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 18:48:20 +0300
Message-Id: <20240809154830.14927-3-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809154830.14927-1-alperyasinak1@gmail.com>
References: <20240809154830.14927-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:48:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111699

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-parse-type-0.6.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
index a7d8cd86c..7e7ff8926 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2e469278ace89c246d52505acc39c3da"
 SRC_URI[sha256sum] = "79b1f2497060d0928bc46016793f1fca1057c4aacdf15ef876aa48d75a73a355"
 
 PYPI_PACKAGE = "parse_type"
-inherit pypi ptest setuptools3
+inherit pypi ptest python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-parse"
 
-- 
2.25.1


