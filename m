Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F743C7EE43
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:41 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.9059.1685521532438247023
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=CAdT3Yv5;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.53, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f3bb61f860so6485353e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521530; x=1688113530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDBNdz240U6QWqttdYdRyiNYKZQ/AVlfcX+TF2bHkAY=;
        b=CAdT3Yv5Z6JbOtzG6FWJlyBv5PIurwX21/1XQD3c6KdhuO7AJhkk0RKPuySUKNLSsh
         qhn/b+Gblv6K3yhX6fPi115ILcN4jd2UrG6lulihtYrXmRXAmVyH/MpwVSaHcaU+IkEP
         VuE0izNht6NLnAo0JOBjjI8fb8J5J7ZV9KpgY86qfgZgLjtGfPZhck9k9AvvcarbdIeA
         u8r9gp4FjotmgCFkn8jXHGFrrRL45t4G9VOF2HkXrvALXga2bYeA+S919QJrXJEqkRAe
         3RH/Dva82kZtaID2kh36MnyNyUEPq4oqZxo6UaM/Ce/RGaUr60dv53PxS9T+Ede9ar2F
         UGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521530; x=1688113530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDBNdz240U6QWqttdYdRyiNYKZQ/AVlfcX+TF2bHkAY=;
        b=cHGENvLY6/Ph6HORUj4VfmJmx/InzrrxbHK5D/JZ4JtqQ3lNw9Fx5iQRRJ1OXFG7U4
         HzQIoFuiWLBg7Ap5A/09/VRW0ND4ULib0EKlJxsJC4punorG2KFrBvahKlAWbvj6iCiz
         JOs9eA00rt3wYDvA7twBQx8bJTXBS/VQENdvUQ31I9wKWFmfCYg7XBgHB9jRA7kD1ucC
         9Sy7Gv0boGgZjsmD2GDEuONu9i3oUehwgfO6Ps/Ro9IFkjH1FIJR+vFnf3ynVH5Pc85J
         EIS2BN0qaEYWZ73XEkAgsSPT4DU+bQ94VIXZgkVKad4AqtzNIMYJGgGtchw45IPDK22t
         QXbg==
X-Gm-Message-State: AC+VfDwMFDgEB/0SF+ATx8RqfUYi0NJKXwdo5i9c8qqSm+Da5/Kz2Bkg
	/8N44quPxCH6HNTD6WsVGLi+nw==
X-Google-Smtp-Source: ACHHUZ6j2eyF8bkfx8xPzJUr+MNG7AJU+AxD+GKXZGW/eFx6Etmvt8nMuUO33izYXazOikH+VAWH5Q==
X-Received: by 2002:ac2:5544:0:b0:4f2:50ea:c7a2 with SMTP id l4-20020ac25544000000b004f250eac7a2mr2104257lfk.40.1685521530687;
        Wed, 31 May 2023 01:25:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 022/149] python3-pykwalify: don't use PYTHON_PN and improve coding style
Date: Wed, 31 May 2023 10:22:30 +0200
Message-Id: <20230531082437.10646-23-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102949

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2. Drop PYTHON_PN and use python3 explicitly.
While at it: make indentation consistent

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-pykwalify_1.8.0.bb      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
index 6d93f384e..01196d864 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
@@ -11,9 +11,9 @@ PYPI_PACKAGE = "pykwalify"
 inherit setuptools3 pypi
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-docopt \
-    ${PYTHON_PN}-dateutil \
-    ${PYTHON_PN}-ruamel-yaml \
+    python3-dateutil \
+    python3-docopt \
+    python3-ruamel-yaml \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


