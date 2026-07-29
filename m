Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63541C54F55
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 05:29:12 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4928.1785302945522741304
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 22:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qN9aUKF4;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e08baf860so595785a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 22:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785302945; x=1785907745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RHXBM+b2sNZpdd7GVEjCkgd44fCrdui/bdUtXGzXcm4=;
        b=qN9aUKF4vYL6Tm6j8+hhI4tVsYddCoWqJdoTBUFHUH2C8kTsYOgrp+1ISM8d+ABptd
         BjtY3kNeR1uT3X6cLpuPf8uPwIGN5oh3tlqA9TyulX0IjUAmD8FynCqnAEAytjD/4e6e
         vJS13TDIliWIMb+oxIOBo4vnMugH+TWck5ow+QK8mA162fDJYFTQn1rmFk/7wOYOPMhr
         hrXrsVNCcs5hVpp3gyRUsgeumjNGleQLfrJB5LiKR4u04eMJ+mkGkqfsZHpSN+t2ba3G
         PtNvlmMKoIBZXOpIVb6KJ21VQfJmR1bSxQwLGmRAm3Ha6ZwYFYieP0L4QsVr5humO/6+
         UBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785302945; x=1785907745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHXBM+b2sNZpdd7GVEjCkgd44fCrdui/bdUtXGzXcm4=;
        b=iy5zKFyaQ0JyaaIq2nRjZtjZ4JGTaG2XFhe2NRnSXgTOYyOsBG4LeUo6Xsa+Cu5Lm5
         0zYSY/+z4rt0Bq1AvSjzGRjlGCz/VXzxgY3A/cYESxDi2Iksuy95Vzx0/Nly4+j+g5B4
         /75cr/SiMv6jN9RA7lZ0meU9Kc6JPW005NlofFS0dhvay//8k0Fd6fUaY6psoql8pCdv
         53/iXiWqeVaU/o8SAKw5mpZPbPomChpHOLizz9f55Y6vr2YAPV3gk0wqcQeISE1dMYzs
         QckXiTmGEtHH45kacecCohYguyD6NeQm12sl6wZKoRwqVhWCKhh5DkXE1n+hT8cZzX14
         S33g==
X-Gm-Message-State: AOJu0YyI3m8LSwAeZJWO8ies4KqM5StfcCprW/vU0WpO/G4l4/f9tRFd
	D1PkvetIoF8v05/ZsDghjuRuCIMImqPHS7WSalr/JRHYiH7wDJQQZ0E31piQzr+H
X-Gm-Gg: AR+sD139rAMvPGN92hvSkKXaowe9fZ+VJfU48Biwhq2RIaNrnAjpTiaMQEYVUyykQzI
	/mHyLCQYRF/dQSew0UJsxIb3B1rEH7K6HmztZdZ2axpy9AQWY7Fw96q9boUMlSxX78nE4KBPuNC
	2lbE5RJzf3Se8uaTrCup3FwxXFb+oAL754MHKc5UExexlTgyr/OxJ4xknn/FXjRf1nNk/7S+EAm
	w0XLyWoubl48YHg9A5aU+xbWxYCi8Rr1yhwe6Duj3rpdtJUZC2N8F+UJIpYZ6KKkkH+nlOGo50r
	hjE6efD8dUG7gZP8boeVnLTmzdO7xVupkEiuoWADwFPmI8qQQHTeulA+q50xtzBLQOlKT7LmTU6
	FoBX1v4RN0TurQ8suhd2xkbVKq18HrVVoNI07BTyr7KvUEyR2LknM0rWfMLLXRl7vP0C2k46O+4
	J95pQAD2SKWCaJDfn0kYE6r8s+JOp/Ow07yru148Kfqf6lZRDSdSDrueqnKWqvP7fhgcO0S6+Ii
	8jgQyJR2vKsGq7N6UNlhkjlvi2MiRxHceWjSA+XElVeaFvopwg0WbJ5nupRjTpoipmcWAWMTJ1h
	45rCROXcEiUw9Fzg89V5YgU17WkvpeHvjPHlVBJLVbyOsW10dZ7bvkW7FKqUAVLpLShwYdvFVou
	tjQ==
X-Received: by 2002:a05:6a21:3948:b0:3c3:68b0:e273 with SMTP id adf61e73a8af0-3c8aaf7b156mr6135610637.15.1785302944753;
        Tue, 28 Jul 2026 22:29:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7271f010sm6097316c88.9.2026.07.28.22.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:29:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/5] python3-thrift: Switch to python_setuptools_build_meta
Date: Tue, 28 Jul 2026 22:28:56 -0700
Message-ID: <20260729052901.2147056-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 05:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128535

From: Khem Raj <raj.khem@gmail.com>

thrift's pyproject.toml declares setuptools.build_meta as its build backend,
so setuptools3 is the wrong class and do_check_backend warns:

  QA Issue: inherits setuptools3 but has pyproject.toml with
  setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb
index f59a38a4eb..5f2bdc6e53 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62

 SRC_URI[sha256sum] = "9ef601c49e988475ff0e741d8e1b45feec23b48514e524341efc274191f1789c"

-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta

 # Use different filename to prevent conflicts with thrift itself
 PYPI_SRC_URI:append = ";downloadfilename=${BP}.${PYPI_PACKAGE_EXT}"

