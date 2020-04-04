Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.1590.1586020405882155792
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 111so10749306oth.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FdQs3ZVuIaogmDU0d3ZTgE0PAMGhKC/GwiNEGlXHeTY=;
        b=LnQYb+zKnSluyhXw4YoVa9RNnXenilxhrcTH9cs5mNuvZWMXUjRUzlZ5Kx5gyMFZok
         /YVtNaGEtY3W/8w/QYpbnBkqAo075RRaGSH6TwifOPgOJUreV+j94D9mQrNw++VfX8EG
         0jZxriFO0V6Ik01qjBRhuLHHv1R7jLzdVER4dKgO+XYnCIgz01DNbbOzKUml7SEa1tmM
         zENMhGx7sDtV9QXwcPKJQgCdNZoqK+7CDU3BnKNyKv6vszL8v1goYLP4WWgj1nAl6CuJ
         kMmM+29QWukn0u/zCN7dwRPb59dh4ktnrsgmeIAzXKX6kFL9IHdZk6Ndxn8vSXLdvouL
         1jqQ==
X-Gm-Message-State: AGi0Pub1gEJFpT2IYElYsHh15yb2oHST+TkfOvlmmZKZUR+hgk6TW+l+
	S26trlhLsAoeAymz5hayKVmOvgMwdt8=
X-Google-Smtp-Source: APiQypJ7sLYgHlrheWJvSkyz23pGlcHf9PR3ZfCHh24Ac4RnrV24A3neHwlbhoiS6v9ItnzPzg4HHg==
X-Received: by 2002:a4a:3150:: with SMTP id v16mr11291524oog.71.1586020404901;
        Sat, 04 Apr 2020 10:13:24 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:24 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 20/27] python-sijax: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:44 -0400
Message-Id: <20200404171251.19823-20-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-sijax.inc |  8 --------
 .../recipes-devtools/python/python3-sijax_0.3.2.bb   | 12 +++++++++---
 2 files changed, 9 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-sijax.inc

diff --git a/meta-python/recipes-devtools/python/python-sijax.inc b/meta-python/recipes-devtools/python/python-sijax.inc
deleted file mode 100644
index 9e46893d85..0000000000
--- a/meta-python/recipes-devtools/python/python-sijax.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-DESCRIPTION = "An easy to use AJAX library for Python based on jQuery.ajax"
-HOMEPAGE = "https://github.com/spantaleev/sijax-python"
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=16e213d75641a392478df50cf0841903"
-
-PYPI_PACKAGE = "Sijax"
-inherit pypi
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb b/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
index 24e683372e..9a28fc5586 100644
--- a/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
@@ -1,4 +1,10 @@
-inherit setuptools3
-require python-sijax.inc
+DESCRIPTION = "An easy to use AJAX library for Python based on jQuery.ajax"
+HOMEPAGE = "https://github.com/spantaleev/sijax-python"
+LICENSE = "BSD-3-Clause"
 
-SRC_URI[sha256sum] = "11b062f4a8b2aad95c87e7c09e5daf5a6b0d0f08abf9efe5f91a0075c6be7c0d"
\ No newline at end of file
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=16e213d75641a392478df50cf0841903"
+
+SRC_URI[sha256sum] = "11b062f4a8b2aad95c87e7c09e5daf5a6b0d0f08abf9efe5f91a0075c6be7c0d"
+
+PYPI_PACKAGE = "Sijax"
+inherit pypi setuptools3
-- 
2.17.1

