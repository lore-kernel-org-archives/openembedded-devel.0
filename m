Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A19E7109E
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 21:37:25 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.784.1695850639765067222
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 14:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-77575531382so131972585a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 14:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695850638; x=1696455438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdPrQ8QsoWxyQVqPGijotQWSakIHvdw1m1yYG8HmQhg=;
        b=eJHuHv/hlCNiNXTguYBqJ8NrZfbehSEGmJqgHwRh9NHpg1tnx4Mt9mcOwBxuRuExRJ
         vVaNSWa90ffhoDW6K8qahjkiwScvQT7r3kDiNY2Ol3y0GpUJCQ6EttRXy07rOOzoZvc+
         3tlIVn4nj8sTbTtTYBZ82biY3WCyRoyfvNFct8xjuNJ0UFQWVeTpmwmqHMmBCjvtgxCp
         7yngaGxGDvH/l/4SU3Ow7e5PeUA6+I6ugYO5n594vsuh3nKuroS45dFE7B3i6h5KREg7
         vrw1cXcfeGq8V/aMwHJIqjLzFuYJ1g9d+CBhAMtVqvtuOhffz1U0PdAbV5Xc0Jqg1Az1
         Rqmg==
X-Gm-Message-State: AOJu0Yx78JsDshI8nQpTNXXoEa6GKx122vTW5ylEdT9Gk5nMyY1dSoNC
	rn4V21EsIjI490sq6dvxt/j/bMGk7hBKIQ==
X-Google-Smtp-Source: AGHT+IGHz7JhKSASlCz7a7rcgaJgKcUQVRY+HGLxO8VRQg48HY3xHfvTBLSU43JFm9WKgMCFzcrh/A==
X-Received: by 2002:a0c:aa52:0:b0:65a:fa53:ed07 with SMTP id e18-20020a0caa52000000b0065afa53ed07mr3187913qvb.59.1695850638138;
        Wed, 27 Sep 2023 14:37:18 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id w9-20020a0cb549000000b0065d0b9bf316sm53735qvd.79.2023.09.27.14.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 14:37:17 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH v2 1/2] python3-pytz-deprecation-shim: Remove outdated recipe meant to be a short lived shim
Date: Wed, 27 Sep 2023 21:36:12 +0000
Message-Id: <20230927213613.1721447-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 21:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105212

The upstream package hasn't been updated since 2020 and was meant to be a short term
bridge to remote pytz. Anoted in the usage documents, "This library is intended for
temporary usage only, and should allow you to drop your dependency on pytz while
also giving your users notice that eventually you will remove support for the
pytz-specific interface."

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../packagegroups/packagegroup-meta-python.bb     |  1 -
 .../python3-pytz-deprecation-shim_0.1.0.post0.bb  | 15 ---------------
 2 files changed, 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index f75007e13..3b9a0f048 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -360,7 +360,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-python-vlc \
     python3-pytoml \
     python3-pytun \
-    python3-pytz-deprecation-shim \
     python3-pyudev \
     python3-pyusb \
     python3-pywbem \
diff --git a/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb b/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb
deleted file mode 100644
index 022cf39ac..000000000
--- a/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Shims to help you safely remove pytz"
-HOMEPAGE = "https://github.com/pganssle/pytz-deprecation-shim"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48"
-
-SRC_URI[sha256sum] = "af097bae1b616dde5c5744441e2ddc69e74dfdcb0c263129610d85b87445a59d"
-
-PYPI_PACKAGE = "pytz_deprecation_shim"
-PYPI_SRC_URI = "https://files.pythonhosted.org/packages/94/f0/909f94fea74759654390a3e1a9e4e185b6cd9aa810e533e3586f39da3097/${PYPI_PACKAGE}-${PV}.tar.gz"
-
-inherit pypi python_setuptools_build_meta
-
-RDEPENDS:${PN} += "\
-        ${PYTHON_PN}-zoneinfo \
-"
-- 
2.34.1


