Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B57C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 18:34:20 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.1639.1703183659971805479
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 10:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-35f418f394dso3856275ab.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 10:34:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703183658; x=1703788458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1iZWPLYf2e146IQ6EIuD8l4gce7K3ukQg4IuWhgqWHg=;
        b=mEuwrUl4ul5Qdvq2ES3DY9I9VvwCxO7iRjr/HnmLBJ1hR/rLPzEt9ieVdwG59lJuUx
         QDPdAQMX5dDs7zvrB2+xYCKl9yNxe1jC+8LJH+mMiLXII1Z2HOuzdFtMSEXVYQZg5hQu
         B0ccuE1sNdUKVzhZvH5E2POzg+mIl7JjRLRLsUx7lYkMg76JbkwSrWo7zYqWFbCApAAm
         0B1Z22/uOVAGbuPlal0Vp3uYe0L5c+dHyPDozlTzzXd8wkZpqubvETK2NuG86qYMiRap
         G7BwRsnkhVHg2Sw3boXLf/7DM/KEIpbgH5dlkTJAbeMf9cEWk3qRqqsIQejQxAAX81fA
         xyQw==
X-Gm-Message-State: AOJu0YyFG9JBdOhnvjlyi9DrlSawdXFh1ilv9NHk4QYjBUzgoJfhym5O
	GEKozIdi9iiTB4hOFy05QyCdD9h0TOyiLw==
X-Google-Smtp-Source: AGHT+IGkzveV1Q2QsgsWVPwHg3Wqr1UgA9jqPoLIpQSogdJsL42Cdirsl7dzEMAT1RpAijhOnuO6zg==
X-Received: by 2002:a05:6e02:156c:b0:35f:d78e:764f with SMTP id k12-20020a056e02156c00b0035fd78e764fmr76132ilu.32.1703183658327;
        Thu, 21 Dec 2023 10:34:18 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id s18-20020a92d912000000b0035f70556998sm650240iln.34.2023.12.21.10.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:34:17 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-gspread: update to version 5.12.3
Date: Thu, 21 Dec 2023 18:34:08 +0000
Message-Id: <20231221183408.3923439-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 18:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107733

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python3-gspread/python3-gspread_5.10.0.bb       | 13 -------------
 .../python3-gspread/python3-gspread_5.12.3.bb       | 12 ++++++++++++
 2 files changed, 12 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb
 create mode 100644 meta-python/recipes-devtools/python3-gspread/python3-gspread_5.12.3.bb

diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb
deleted file mode 100644
index 3918ed3ac..000000000
--- a/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Google Spreadsheets Python API"
-HOMEPAGE = "https://github.com/burnash/gspread"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
-
-SRC_URI = "https://files.pythonhosted.org/packages/b4/4f/033ebf34778745061b67b104ef212ed5b05fa65a530f345f88c4355fdcc3/gspread-5.10.0.tar.gz"
-SRC_URI[sha256sum] = "2b6bba6dc111580170346a9bcd1893e0e8c52f67a9e537caec7b7a1e27c14435"
-
-S = "${WORKDIR}/gspread-${PV}"
-
-RDEPENDS:${PN} = "python3-requests"
-
-inherit python_poetry_core
diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.12.3.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.12.3.bb
new file mode 100644
index 000000000..932cf22b1
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.12.3.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Google Spreadsheets Python API"
+HOMEPAGE = "https://github.com/burnash/gspread"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
+
+SRC_URI[sha256sum] = "298ebab76e6ed6a998eabc81545ec58f5610f44e2ddb4858b539a0634093f8ce"
+
+S = "${WORKDIR}/gspread-${PV}"
+
+RDEPENDS:${PN} = "python3-requests"
+
+inherit pypi python_poetry_core
-- 
2.34.1


