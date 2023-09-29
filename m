Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CA4E82CB7
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 22:00:29 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.30395.1696024820680880147
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 15:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-65afba4cfadso68512446d6.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 15:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696024819; x=1696629619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUobAThG65WzI6bVglRNTzEciGDhqq3fy6JOf/kj2Q8=;
        b=MnDpyFefST+CuvZtQg3LtYKY8WurQH/HdbZ+twADlBLLqaQjrFEMhA7ETQCbraqXtK
         JnMI4v4D8NhOQ51W25YP/tSh3zYZNFvnIt5uRoce/73onabdweU5FhTvJ9DbWXN/jkOA
         kob2xapQcxRsx7zMhoZDMMU3mB36li50jeSHXNeQoHoH+uPLQ0BUHbP7VauYp2RfbpZZ
         VuzML5gCsIBckfW/2uI7dj2v74GX49VxOfBKouPT5aTzJNSD7votTdYO+Dfioe5UZNiD
         2sWGoG9NQkmIHZBxa7QFLh8WcmCIJuLN4+AFTW9+4ZBQSFieusDqO4Nyv0WBhSg7cNqe
         UjwQ==
X-Gm-Message-State: AOJu0YySQfESV2hlDBv+G4gSDt78qVlyEtnmEFTonbQjks5S/CD8D7OK
	XsOhZYpeicG+ymozJhEPxxR0LcPSy8z3+Io+Nco=
X-Google-Smtp-Source: AGHT+IHFi33gTjC8NUQAssThOVEY4awEIs+p/+Rq+4kYHy36dBygjONdsXCE2Fms2bHhjoNEXKhSvg==
X-Received: by 2002:a0c:fb02:0:b0:64f:7110:8a9a with SMTP id c2-20020a0cfb02000000b0064f71108a9amr5467330qvp.56.1696024819368;
        Fri, 29 Sep 2023 15:00:19 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id a5-20020a0cb345000000b006588bd29c7esm3666550qvf.28.2023.09.29.15.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 15:00:18 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-flask-cors: add initial version of the recipe for 4.0.0
Date: Fri, 29 Sep 2023 22:00:09 +0000
Message-Id: <20230929220009.2146196-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 22:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105276

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-flask-cors_4.0.0.bb           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
new file mode 100644
index 000000000..1d0d86b4e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
@@ -0,0 +1,16 @@
+HOMEPAGE = "https://pypi.python.org/pypi/Flask-Cors/"
+SUMMARY = "A Flask extension adding a decorator for CORS support"
+DESCRIPTION = "\
+  A Flask extension for handling Cross Origin Resource Sharing (CORS), making cross-origin AJAX possible \
+  "
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=118fecaa576ab51c1520f95e98db61ce"
+
+PYPI_PACKAGE = "Flask-Cors"
+
+SRC_URI[sha256sum] = "f268522fcb2f73e2ecdde1ef45e2fd5c71cc48fe03cffb4b441c6d1b40684eb0"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-flask"
-- 
2.34.1


