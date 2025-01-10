Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75884E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 22:32:02 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.3973.1736548317966236276
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 14:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a813899384so7758245ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 14:31:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736548317; x=1737153117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjU39n6k64lE2Zlw1MfvMCMaHuVZyoKntZEht+kjq+Q=;
        b=ux7h+R6Gr8lR2vgToV62J2YoWFnvl8gOMwVtfDPghfAG2nG/v6YOAOjHGlIQR/Bdv1
         18yhL0oGzKl/PCw+Jm2cUxhPIl0hXU7XtFbfL7s1DASLPkeEyCGzPf48esGAtiIxbWQ1
         hg7n92cd7IGgDlIcKmTPXvZPvjgUPpg9CpMDI8k0halNIst+78Gxco/JM9UfRq2j7UuE
         tzekdIKj9Bta4lTcGRZj+G4I3xUS2E8xgFG6VazbvT2mtnyK2eOCO7+HFMwmLn4KMdJv
         GkbQc8Gkl8PDblxstA0gce9zmbV82UQZBHSTzPMrUQaoP2iGAkbn0K9EhEr/Z63PkHgS
         dfkw==
X-Gm-Message-State: AOJu0YzMu2939XrewFoFpbEVuTa9bzq1nVVmV2wdH8oVhvdMn3mD0fu3
	PdfHwc5nPRT7k0oURkfgd9qT9HiHGS5d1hIjZWocqs8iLgkfp8skd0iazQ==
X-Gm-Gg: ASbGncsErzLUKcNMoLJZdLKyeyTlbMA1c5L7vhY2fMsjWBnYtSLXeiTeQL6EYtUKdAl
	yGgy7gBDcSvO5JVF/rJ5Ra4xRD5etgz8U3JmwsbiP3sYc7/7+H19ePdmYlvMbeQhOMYDKjkBMJa
	TfNUiyaOUK+vpn0f4nqcIbLx2XOzKFD6nQWUsVGp1ETTo/qsOqXci2cGODifJ89JnR8hTyng6RO
	7EfRDzBOK3azXbS/LsUfFu8IzDW20CqGvaByksTOHdwW+LAg4+CHvkshKnkB90qZ5MUdDLWYZCL
	VcZBPSmCQLxkYi8uLT9hQWLbTw==
X-Google-Smtp-Source: AGHT+IF0RzvLH/+K2JhZvnBGTdaJgqNlAI2HVqXaYF0IwB8lQAjwW8IcwjbgkURaJ9t0rvbzCHWpTQ==
X-Received: by 2002:a05:6e02:1547:b0:3cd:b013:5c12 with SMTP id e9e14a558f8ab-3ce3a9d40b5mr98317025ab.20.1736548316845;
        Fri, 10 Jan 2025 14:31:56 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b614781sm1120035173.44.2025.01.10.14.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 14:31:55 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 5/5] python3-serpent: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 22:31:34 +0000
Message-Id: <20250110223134.4177993-5-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110223134.4177993-1-derek@asterius.io>
References: <20250110223134.4177993-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 22:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114814

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-serpent/run-ptest                 |  3 ---
 .../recipes-devtools/python/python3-serpent_1.41.bb  | 12 +-----------
 2 files changed, 1 insertion(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-serpent/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-serpent/run-ptest b/meta-python/recipes-devtools/python/python3-serpent/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-serpent/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.41.bb b/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
index 9265081fd..f6c7b5443 100644
--- a/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
+++ b/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
@@ -4,25 +4,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d7c28f460fafe7be454fcdcac0b60263"
 
 SRC_URI[sha256sum] = "0407035fe3c6644387d48cff1467d5aa9feff814d07372b78677ed0ee3ed7095"
 
-inherit pypi ptest setuptools3
+inherit pypi ptest-python-pytest setuptools3
 
-SRC_URI += " \
-    file://run-ptest \
-"
 # python3-misc for timeit.py
 RDEPENDS:${PN}-ptest += " \
     python3-attrs \
     python3-misc \
-    python3-pytest \
     python3-pytz \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN} += "\
     python3-netclient \
     python3-numbers \
-- 
2.34.1


