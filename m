Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112F7E80A8C
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 05:35:36 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.11316.1695792929260730158
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 22:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6588cc0e238so55450726d6.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 22:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695792928; x=1696397728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PeqpqJj8dmnCM5zcj7UGYwH3+BzA2DKzhAYBpjm4GKs=;
        b=Xzzpf1hpPhqO6cKk4u7Ck0u5s8GSG9KBW+Yqwzi1eV4IRc6WPf333N6YeW/R0g5usU
         FwZbF+LGTtfYxQG66FM7BQ7mcldOYm/vzmtTKyExE/fjgRCa7Nbx9ZrvtiNwZ3IVOwiA
         K/MuFaRq4OecIjI9Vl+lchtID7ItKVPc5ZZ2/smxMxHKX3GJZE42C+FZHqeNOjEnh92s
         RlhFH4eUZEu7EhqOeZvUvm6EImuscJRmkggCoSkq3MedRiRb6rqdxpbw3OjwUgPpu+Ml
         G4rFWt8RZMlQ32YUfqihuhR3Nu9Lf3bYGXYSQR9mweveETyHlRJQJj4NBwrG78DrfB/b
         YrHw==
X-Gm-Message-State: AOJu0Yy2q7gvlXLYfPQnCLGSpIKc/smCWyh+cABihpQbaD34YEDqwXlX
	xcShp0Q8aaVZO/y+tFi4tcujZHf8LfLjYQ==
X-Google-Smtp-Source: AGHT+IE+iVY9phvSe9zuCc8u911lHBG1pVXntTdnk6KWs5KEJg6C6MtRq/enzuQfpEgNM6JV6/Y1NA==
X-Received: by 2002:a0c:a9dd:0:b0:656:2696:9947 with SMTP id c29-20020a0ca9dd000000b0065626969947mr1063149qvb.18.1695792927811;
        Tue, 26 Sep 2023 22:35:27 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id vq14-20020a05620a558e00b0076efaec147csm819533qkn.45.2023.09.26.22.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 22:35:27 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-idna-ssl: Fix upstream check by specifying the UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX
Date: Wed, 27 Sep 2023 05:35:18 +0000
Message-Id: <20230927053518.1699513-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 05:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105167

Consolidated inc into the recipe to remove a unneeded layer of indirection

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-idna-ssl.inc                | 15 ---------------
 .../python/python3-idna-ssl_1.1.0.bb          | 19 +++++++++++++++++--
 2 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-idna-ssl.inc

diff --git a/meta-python/recipes-devtools/python/python-idna-ssl.inc b/meta-python/recipes-devtools/python/python-idna-ssl.inc
deleted file mode 100644
index 356a3873e..000000000
--- a/meta-python/recipes-devtools/python/python-idna-ssl.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Patch ssl.match_hostname for Unicode(idna) domains support"
-HOMEPAGE = "https://github.com/aio-libs/idna-ssl"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a61b9c5aec8796b64a6bf15d42605073"
-
-SRC_URI[md5sum] = "dd44ec53bac36e68446766fd8d3835bd"
-SRC_URI[sha256sum] = "a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78c6b36f311254d6d0d92c6c7c"
-
-PYPI_PACKAGE = "idna-ssl"
-inherit pypi
-
-RDEPENDS:${PN} += " \
-    python3-idna \
-    python3-io \
-"
diff --git a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
index 3643fcfd3..503b79d66 100644
--- a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
@@ -1,2 +1,17 @@
-inherit setuptools3
-require python-idna-ssl.inc
+SUMMARY = "Patch ssl.match_hostname for Unicode(idna) domains support"
+HOMEPAGE = "https://github.com/aio-libs/idna-ssl"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a61b9c5aec8796b64a6bf15d42605073"
+
+SRC_URI[sha256sum] = "a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78c6b36f311254d6d0d92c6c7c"
+
+PYPI_PACKAGE = "idna-ssl"
+inherit pypi setuptools3
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/idna_ssl/"
+UPSTREAM_CHECK_REGEX = "/idna_ssl/(?P<pver>(\d+[\.\-_]*)+)"
+
+RDEPENDS:${PN} += " \
+    python3-idna \
+    python3-io \
+"
-- 
2.34.1


