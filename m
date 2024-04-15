Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85EBC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 20:19:43 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.3217.1713212374324950130
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 13:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Re2dz6dW;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5176f217b7bso6302984e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713212372; x=1713817172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DODcEAjMNDUw9UqSLhTmPo+uhWTpOBBDnxNJozc9b40=;
        b=Re2dz6dWMXGaPvm4yWquwPuWe0xVuU14q4JTMAPMs+7bOvfJ74UUvejZhhTUqZ+Q0o
         YHbeWNPPzxfcNpEDQ4uNcumkQmjDw6Pamozwl653biIiVsalkAGhMaZbheVpSrW10elR
         qMzSNzNF4Gcx2OWIhwmYo1qkZQJD/78ev8jBMBbCl6fMZ7EOcz4aqxf3/AJbXIaMqz+3
         YRX3GR8joUcUT4ZyFSIMkggvAnaUxJU2D4RJZNNZZV9dLydUVp34dg3cwLRHJ6YcPCz/
         xGI8EDBsusWWkUMUxmqQKe/bUnv4GqvG2F7WYiJkUWGdfTa2MtateEwo9v0zHHixhj9b
         pqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713212372; x=1713817172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DODcEAjMNDUw9UqSLhTmPo+uhWTpOBBDnxNJozc9b40=;
        b=ZStAUYTn0e5U6U+ZHWGFXIX3L44hLnLlpTGjn0CuLQvXdSsJqlCPz0opzaWVftWe9I
         4Xu5VwC4eijeJe95vhFvyAhi1eibhbGsvtPK1jedeDsWQXgZTvCCeXnUun1xV/nhgSy+
         bPyiOa1kmQnRduf0+2GLu+iUS+mBqu/+7EY0c2Ym1SdwioEl1suq5SX1sOnjb0Yd+uk4
         B1IBeNpaYrctfS3qWQF9K8fSYzM9KvVvnetKAPRy7dygVcwjxlHtnvqRhNIyG/elzlAS
         /PKB3aA+BxfStvz1XiwZYhl6Vtdc/yKuXU6Lwvm4AqpE6CZTmLJqRFYpg1zbGk2lYPWr
         LY9Q==
X-Gm-Message-State: AOJu0YyVcqrESjbvuuSiGzaHo5K8xc9p7ZhX/eCoU7krTVD1YMjdPC0d
	FdplwYXH1gPYTWPqQbXRJRgS3uZYSsjEl8r1+DGq2iEY4Pn4JVWJSAI64Ol6
X-Google-Smtp-Source: AGHT+IEa3BSUzRvjihyTA9C5TdLSELo77cJceVeen7u5IWKux8+qpyHPbsN+461zRgwVITjyD3JD2w==
X-Received: by 2002:ac2:4d09:0:b0:517:5ee6:4f59 with SMTP id r9-20020ac24d09000000b005175ee64f59mr9378351lfi.41.1713212371595;
        Mon, 15 Apr 2024 13:19:31 -0700 (PDT)
Received: from control-center.home (58-175-98-95.ftth.glasoperator.nl. [95.98.175.58])
        by smtp.gmail.com with ESMTPSA id jg25-20020a170907971900b00a4e5ab88803sm5850383ejc.183.2024.04.15.13.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 13:19:31 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-sqlalchemy: upgrade 2.0.27 -> 2.0.29
Date: Mon, 15 Apr 2024 19:49:33 +0000
Message-Id: <20240415194929.2315308-3-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240415194929.2315308-1-t.f.g.geelen@gmail.com>
References: <20240415194929.2315308-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 20:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109970

---
 ...ython3-sqlalchemy_2.0.27.bb => python3-sqlalchemy_2.0.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.27.bb => python3-sqlalchemy_2.0.29.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.27.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.29.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.27.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.29.bb
index e5a837659..e646bd0d9 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.27.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.29.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
 
-SRC_URI[sha256sum] = "86a6ed69a71fe6b88bf9331594fa390a2adda4a49b5c06f98e47bf0d392534f8"
+SRC_URI[sha256sum] = "bd9566b8e58cabd700bc367b60e90d9349cd16f0984973f98a9a09f9c64e86f0"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


