Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F6CD767C7
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 13:41:37 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.12750.1730382093677828569
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 06:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aVKcHqHK;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso9162831fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 06:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730382092; x=1730986892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3Ntyem0hNVxnwb/NnCcEwiEzSU68mwf97PnMrU1AuI=;
        b=aVKcHqHKfLJJuGaLwods9EVkrptrGR1IjtjhGwouYATXrN1mVX3inHPCn9US+0NXx6
         EUFJFWqN5+DyNLMUXvpCbJyC1oDT96euEYTrBxPOuqKZP1ysdkCTOsv3A08ktB7liFTZ
         gTvwEo1HPcZtHBRFonY6sNzFx1kiuyb4JJBf17xxZwsOWrzoobE0QPKckxhxFdcO/ENP
         RH8nQetj3bbqQeENmx6fCY1cg4Da6x1bFtxmvUvdip6UvrcIb9IBhum5hSh6en+EgeXY
         uJFAJ3zZQnsB/y/x5o2cUiiXhbk6PQqzy93faeAUb/OgVii7HYvcCJo5yRGxs5VPUhSo
         Duzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382092; x=1730986892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3Ntyem0hNVxnwb/NnCcEwiEzSU68mwf97PnMrU1AuI=;
        b=i3gZFORU63b4xB11GynNe5DSFJDQGVh979WetCBr+XRvcKH5zX/qdn9bEA+iN+gDaG
         RfIZJjFzNbnhaJl4GBGes1WDVK2FeXIqKZ/W+jZ6WQ70kub5h3eubca5n9IBFtz7STmG
         yxZSuXQvKrEXku5b1wC3XssevRQub8xaZQQ3kquzbzMW2h8542mxWi+gJKDNoqUVrK0U
         6+k2aAwf3DIL8jfrWOM3fSySP3cobfyCFTPSNolW6iVArRGcft/RaIkOTG6KL+I6+Z/Y
         ARqx8ezgOP4ggqyzDQ1F1vzRJPTLls7H2a/XmuFrAFvDCfkKUNTT4PdJoDd9y2qKkZ8M
         hSFQ==
X-Gm-Message-State: AOJu0YwryxGHdO0EedjPCE/wof2nPhUqFYT/gIshZ4OLrqH5wI0FHvM5
	1ZiOWJGq70yltEq+2vZS4hrpi/HymaaT7K7UiR4bApFYM3F0ss0GBOo+Mw==
X-Google-Smtp-Source: AGHT+IEhGY+LN30/IRIB9y+zwotYWNiNrjAbjoBLOOjYZ49qSr9n0Xf5mfKUKS9k9AO92qoqoWQ9Gw==
X-Received: by 2002:a2e:4611:0:b0:2fb:382e:410b with SMTP id 38308e7fff4ca-2fd059d31f3mr34000271fa.32.1730382091524;
        Thu, 31 Oct 2024 06:41:31 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8c91sm594226a12.75.2024.10.31.06.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:41:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [master-next][meta-oe][PATCH 08/11] python3-django-south: fold .inc file into .bb
Date: Thu, 31 Oct 2024 14:41:11 +0100
Message-ID: <20241031134114.2791747-8-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031134114.2791747-1-martin.jansa@gmail.com>
References: <20241031134114.2791747-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 13:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113365

* python2 is long dead, kill .inc file as well

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python/python-django-south.inc             | 16 ----------------
 .../python/python3-django-south_1.0.2.bb       | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-django-south.inc

diff --git a/meta-python/recipes-devtools/python/python-django-south.inc b/meta-python/recipes-devtools/python/python-django-south.inc
deleted file mode 100644
index c2932f9230..0000000000
--- a/meta-python/recipes-devtools/python/python-django-south.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Migrations for Django"
-DESCRIPTION = "South is an intelligent database migrations library for the Django web framework. It is database-independent and DVCS-friendly, as well as a whole host of other features."
-HOMEPAGE = "http://south.aeracode.org/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=17;endline=18;md5=2155d8ae21e7c23101d5febac696b27e"
-
-SRC_URI[sha256sum] = "d360bd31898f9df59f6faa786551065bba45b35e7ee3c39b381b4fbfef7392f4"
-
-PYPI_PACKAGE = "South"
-inherit pypi
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS:${PN} += "\
-    python3-django \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb b/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
index 10519111fa..8237cf034d 100644
--- a/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
@@ -1,2 +1,16 @@
-require python-django-south.inc
-inherit setuptools3
+SUMMARY = "Migrations for Django"
+DESCRIPTION = "South is an intelligent database migrations library for the Django web framework. It is database-independent and DVCS-friendly, as well as a whole host of other features."
+HOMEPAGE = "http://south.aeracode.org/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=17;endline=18;md5=2155d8ae21e7c23101d5febac696b27e"
+
+SRC_URI[sha256sum] = "d360bd31898f9df59f6faa786551065bba45b35e7ee3c39b381b4fbfef7392f4"
+
+PYPI_PACKAGE = "South"
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += "\
+    python3-django \
+    "
-- 
2.47.0


