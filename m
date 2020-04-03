Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.8871.1585954265500327215
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 15:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 22so9126626otf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 15:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=A3sLt9wNpgOdAhNgmnlVlnX+IdNVpdDhRhyucPwwk/E=;
        b=hVYDi5hwzSLF8OslbpcFO3SUOvotP5LMtVH1GzhJIdp+T6Xn89BsH2ejO/QOFSR3Na
         G4R9rnClczhCqL1WocBxlbf2MfsRyZcruC2E8bhE6JH3e+E9SuQMqvqX2FXloRxPt9Bq
         BWlDtKyyEkifQeZbPTgAY/2WozCwfi+foWVfTvMDxBDV0+UCf6FTLXTH5NTMyb9NCuez
         yvW0FkjE6ESMYJhMWCRVbzWe88KK4FE7UDwXyiVUs93kHAlrml/Z5DjcpPQiEtkNojBP
         kk2Q8dnEsARoG+dZYzK4sNf7sZI4UsTMdwfZAt4W962+FHa+FZqoAVkkd5JVWhiCH0BW
         dj9g==
X-Gm-Message-State: AGi0PuaZUzs3UeJ0ZCpxGI8oEi0HrBpBIS9KvZWNgfTxgzgWhpABd+sB
	Q7J2pNyazOdyeAkgY/JRCger0oRkJp4=
X-Google-Smtp-Source: APiQypK4Ji5IRtzsLH1F+Hvr5PH1+sESLnRCFMdYbgIRxCl3o8uYyK2g5kWtGf28LJVWZMGVhILG9g==
X-Received: by 2002:a9d:1921:: with SMTP id j33mr8583654ota.309.1585954264409;
        Fri, 03 Apr 2020 15:51:04 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id k4sm2456465otl.13.2020.04.03.15.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 15:51:03 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH] python-wrapt: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 18:50:50 -0400
Message-Id: <20200403225050.24530-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-wrapt.inc    | 15 ---------------
 .../python/python3-wrapt_1.12.1.bb              | 17 +++++++++++++++--
 2 files changed, 15 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-wrapt.inc

diff --git a/meta-python/recipes-devtools/python/python-wrapt.inc b/meta-python/recipes-devtools/python/python-wrapt.inc
deleted file mode 100644
index f4a8f19513..0000000000
--- a/meta-python/recipes-devtools/python/python-wrapt.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "A Python module for decorators, wrappers and monkey patching."
-HOMEPAGE = "http://wrapt.readthedocs.org/"
-LICENSE = "BSD-2-Clause"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fdfc019b57affbe1d7a32e3d34e83db4"
-
-SRC_URI[md5sum] = "6d56ed0de4336462a73350341462f45e"
-SRC_URI[sha256sum] = "b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7"
-
-inherit pypi
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
-"
diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb
index 85f446ef98..49fde1003d 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb
@@ -1,2 +1,15 @@
-inherit setuptools3
-require python-wrapt.inc
+SUMMARY = "A Python module for decorators, wrappers and monkey patching."
+HOMEPAGE = "http://wrapt.readthedocs.org/"
+LICENSE = "BSD-2-Clause"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fdfc019b57affbe1d7a32e3d34e83db4"
+
+SRC_URI[md5sum] = "6d56ed0de4336462a73350341462f45e"
+SRC_URI[sha256sum] = "b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7"
+
+inherit pypi setuptools3 
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-threading \
+"
-- 
2.17.1

