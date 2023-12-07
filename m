Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C65C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 18:11:49 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web11.91524.1701972700541463583
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 10:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=KQF1UNZO;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.166.66, mailfrom: troth@openavr.org)
Received: by mail-io1-f66.google.com with SMTP id ca18e2360f4ac-7b459364167so43572039f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 10:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1701972699; x=1702577499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a0PQYtYdpfC8STlxu3BAQaR+wXlB4h6qbvXSnjTl29U=;
        b=KQF1UNZO3IUy2MANIaFY/m1ztlZAyTiLaHEb9jmDA4bCWxZx6N2OHkg7FEbH+H/Hrp
         e/W1DOO47oyR6KhwBaZP685XWJ1/5pF8/KW+4XD/gaeY5QxR561lZ8QRxkC4zlO+C4Gl
         S9Jat3vwN9IPvfBFLXho2d5kvaviLSE077sbWPnTjK6/Vgp3GHdjmp63cwLH8vw16o8w
         G5rokO4KvhozrtHh/f7D0kJcS2KiTTlhEVpwvQOrTszUWioGoUCfFHljxIhSwLBKejBc
         pVLPABFl6QajUw1ehwxbaqETJ7Ns5eAQI94vVqMSu4I6Fw9q0bFBIQoJ1RnZYa96I2xD
         I2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701972699; x=1702577499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0PQYtYdpfC8STlxu3BAQaR+wXlB4h6qbvXSnjTl29U=;
        b=keOYRdnP/2E0WeR0H2mrKrTDrJhJc30v6K74Swg45C1YBJcuJY6/szIGsoxsSdKyG1
         FG5m5DPHuo+nkFKDJ5FfeTU3anrX6BaxUNhoRMh9tWKk4V+8i8BUX2fUlsQ1quSh5DDT
         JN7pQQGxVmrdFdzH69kEQhiSoQTZEtvHX8hk9IjaevR5JJvNDgqICF05uzoFRVuH1Nwp
         26pfx30c04DNAyVBSshqieFrVwSNm6Q+sq4JTGt0Y6qH4HUMAZdCOeUuBQTvLlsrmSoQ
         zWPz/n/C76pt8PPgvim3TuW1DMtyl1iDhyP2O7ZWDOTNMVyV+KYVzd7dRZCrM3JJWDEz
         Gu2A==
X-Gm-Message-State: AOJu0YyjZoc1dmeTyV8Gg1DEkIvFt/nm0XUvRKUj2Tc7Yy0843mZshaK
	Nx/HxoN//JeO8DqwjNOEi8ul/CXPuDhWi1LV9cZqqven
X-Google-Smtp-Source: AGHT+IG6DPlj8Kaq/25xPLCnuALgfs3XSvMvT9XD9jqMU6OG7ON/xQOYsWIJxn/JqWHxwb/Gf/5EwA==
X-Received: by 2002:a05:6602:4913:b0:7b7:74a:d3a1 with SMTP id ef19-20020a056602491300b007b7074ad3a1mr640390iob.24.1701972698899;
        Thu, 07 Dec 2023 10:11:38 -0800 (PST)
Received: from beast.bozoland.org (c-98-38-168-139.hsd1.co.comcast.net. [98.38.168.139])
        by smtp.gmail.com with ESMTPSA id f8-20020a6bdd08000000b007b3e07371bbsm56418ioc.19.2023.12.07.10.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 10:11:38 -0800 (PST)
From: "Theodore A. Roth" <troth@openavr.org>
To: openembedded-devel@lists.openembedded.org
Cc: "Theodore A. Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: [meta-python][PATCH] python3-flask-sqlalchemy: upgrade 2.5.1 -> 3.1.1
Date: Thu,  7 Dec 2023 11:11:28 -0700
Message-Id: <20231207181128.2870223-1-troth@openavr.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 18:11:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107288

The 2.5.1 release is not comptabile with python3-sqlalchemy 2.0.23 which
is currently provided by meta-openembedded. This results in the
following error:

  root@host:~# python3
  Python 3.11.5 (main, Aug 24 2023, 12:23:19) [GCC 13.2.0] on linux
  Type "help", "copyright", "credits" or "license" for more information.
  >>> from flask_sqlalchemy import SQLAlchemy
  >>> from flask import Flask
  >>> app = Flask('foobar')
  >>> app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/test.db'
  >>> db = SQLAlchemy(app)
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
    File "/usr/lib/python3.11/site-packages/flask_sqlalchemy/__init__.py", line 758, in __init__
      _include_sqlalchemy(self, query_class)
    File "/usr/lib/python3.11/site-packages/flask_sqlalchemy/__init__.py", line 112, in _include_sqlalchemy
      for key in module.__all__:
                 ^^^^^^^^^^^^^^
  AttributeError: module 'sqlalchemy' has no attribute '__all__'. Did you mean: '__file__'?

Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
Signed-off-by: Theodore A. Roth <troth@openavr.org>
---
 ...qlalchemy_2.5.1.bb => python3-flask-sqlalchemy_3.1.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-sqlalchemy_2.5.1.bb => python3-flask-sqlalchemy_3.1.1.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.5.1.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.5.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb
index 3aa6303da..ecbcf16dd 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "2bda44b43e7cacb15d4e05ff3cc1f8bc97936cc464623424102bfc2c35e95912"
+SRC_URI[sha256sum] = "e4b68bb881802dda1a7d878b2fc84c06d1ee57fb40b874d3dc97dabfa36b8312"
 
-PYPI_PACKAGE = "Flask-SQLAlchemy"
+PYPI_PACKAGE = "flask_sqlalchemy"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
-- 
2.34.1


