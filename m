Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1129C7EE3A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.9116.1685521544457981092
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=g4EAUsRg;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.50, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f606a80d34so40358605e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521543; x=1688113543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KR5SdRtdFHeM96BmWRhDHiCHD++0WDbo6Fr2IRPU+y8=;
        b=g4EAUsRgqXd4YYQUXrClnU/GA8tAc66O4aTBImAte3Nxax6/5ewT46SM0MiekjMn9m
         wJFPQlNyl29X34lo1jwmZu/dx+R6KDFsuzYoaHMhTnLfIlM0LlHsqnIkM7m472K9cXi7
         yyxgQ4knXge/doZCnvlQ5zMtjhngbyEUfNrIkbezGvloarTVedYDLCVdyrmAr5QTCUZQ
         9mxhAncakFXTbYvqdBJbtUGnKwtGXSiKBpfjFdLbJ8kWCAeXNwRInVFft8hi3fntkbaX
         ItUh3ATpx2YtqUJ/zsM27p6aKYDDkGzyDOcfAP0ZTcTql88kQA1yEAQwe2S9OCYYkL/A
         06tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521543; x=1688113543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KR5SdRtdFHeM96BmWRhDHiCHD++0WDbo6Fr2IRPU+y8=;
        b=jhWdjNqVLRveCXvvnWkDujb5oFQ5QSXW7QDO9mABYXCb1ioKwto5av0tkWF4X8Zvlw
         Tp3bEqaWjHlh/0lNkYDFW+Q4n0W2sUF+cyZkXGRm/onp0sh5rvZDTlEFp2Q1yTKBAWNH
         bXmpiF9McBZaItFZ7U2HlxFqvYtIwqCpAitJeI+wTuvQi2htj2df75GHAIwl5XjBKs8H
         x4ZJigb0Kkcd8yQ8SMOMPQg/Qe8B+jX6v7nIVgqVEeY8/EERQGbtF/pgbKEQzGe+oNWe
         6zdQclnWXvs0aVNKK/x5lPA0GQAKn4FBi2cPeQzsgukOFEJ36cC+lA+4nO3igLlrD21G
         kzMQ==
X-Gm-Message-State: AC+VfDzolqPtrCUPsyYAe+nTuqk+tl6bZMvWjzu/VUNKIemcAlNB97m8
	LWeUEcIya/gAytlAmlHeOh124g==
X-Google-Smtp-Source: ACHHUZ5A2YtF56EmMwmVKMja292YK/Ro9USd/p7xipy36ErHDI246fAPk1509A1Nk6WBa41ls2k7mw==
X-Received: by 2002:a05:600c:225a:b0:3f6:8f5:f9ee with SMTP id a26-20020a05600c225a00b003f608f5f9eemr3812496wmm.26.1685521543004;
        Wed, 31 May 2023 01:25:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 034/149] python3-thrift: don't use PYTHON_PN and improve coding style
Date: Wed, 31 May 2023 10:22:42 +0200
Message-Id: <20230531082437.10646-35-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102961

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2. Drop PYTHON_PN and use python3 explicitly.
While at it: make indentation consistent.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python-thrift/python3-thrift_0.16.0.bb                | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
index 6eb896d1d..93b225348 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
@@ -10,10 +10,10 @@ inherit pypi setuptools3
 PYPI_SRC_URI:append = ";downloadfilename=${BP}.${PYPI_PACKAGE_EXT}"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
+    python3-logging \
+    python3-six \
+    python3-stringold \
+    python3-threading \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


