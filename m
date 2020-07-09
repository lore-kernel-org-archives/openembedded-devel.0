Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.4333.1594267692374641801
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2020 21:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JlXQqQfG;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id i14so422789pfu.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2020 21:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=Fbh+krsxJjWzrQ82jruMHHpfN4cZBJw3SmSjW/b/zrg=;
        b=JlXQqQfGKYJVT3ZTxG3wFf18hT2zYk4taJV03+DkvIx4yzuNXr2nUm76rUs89j8W7l
         tQ3ThcDQ29jRGUNaBRqYjNFucnQrwLfAb884K+Ath23udd4gCL6RMX11znP7TFpwGt8T
         b9ARu+Eoif0VxMushT7Yh9voZFna2PoPPFHrUBBo5+16QhJ2sOU3F2rVRxQlmD5xkEBk
         hgBhRB0wKoHRiEkIWRKju/BiCvTjZqXSpc7p6t5zW5StZHXQtdztldnv39Tj5uMO80It
         eyA62mHk3bEPOplk1d8ifZ3e1ZfXfXQtkTR08cVmQnSfbBzBq1YHG+nI/gqQW6rB20U2
         Xcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=Fbh+krsxJjWzrQ82jruMHHpfN4cZBJw3SmSjW/b/zrg=;
        b=GYxtMmqIv2XSFUiMw1DftmvKSSqOTU+UNrW+ePkY2Fy3kreBKREbsAhgwCA8GJ9Hvg
         JHQ5OrtALVw54+DiWnF/ydqNNolXDi1BlFzGdW+4nqLTXRRqqqB7GE+K5Q9nHxk+QHxv
         KUaeY4+w/kjp4qFEgSPqbkV/K6F9Qls992YoYO1ducd5lrhNZNc/HXusbYpy2TZFQ62j
         fMz6wr3+3pZgm+xkPTiG9onGDkC+icQZnCJPpwKy+6zL2PVDkKtTh1jUR4/3/D6jCMfW
         +pMV0KSNNFu2YC2ii/jSmRaBe6n5lbac3wskJ5TQlhOKeO9+CRW6F12HjN4AmeT+eYIq
         +KlQ==
X-Gm-Message-State: AOAM531GpU+/n6uueJ5aVkRZAZ87k4BGi3/GF0l8t9Qu8qTN7p8QwKoN
	veoxjf39Jg1vVe79gvkyAHGxK1XE8sU=
X-Google-Smtp-Source: ABdhPJwhkjGr4tUzqkRIRVngtVbgwVoZOrB+T+6rMg1TWbcb39aWAyoVo+xjYuN7vaOEKouYtv+McA==
X-Received: by 2002:a63:6cd:: with SMTP id 196mr52225576pgg.169.1594267691623;
        Wed, 08 Jul 2020 21:08:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e0fc:4d03:5c6c:3dcd])
        by smtp.gmail.com with ESMTPSA id b22sm835694pju.26.2020.07.08.21.08.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 21:08:11 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-flask-babel: update to 1.0.0 and consolidate
Date: Wed,  8 Jul 2020 21:08:10 -0700
Message-Id: <20200709040810.9754-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

The python3-werkzeug 1.0.0 requires this package to be updated.
Fixes:
File "/usr/lib/python3.8/site-packages/flask_babel/__init__.py", line 19, in <module>
    from werkzeug import ImmutableDict
ImportError: cannot import name 'ImmutableDict' from 'werkzeug' (/usr/lib/python3.8/site-packages/werkzeug/__init__.py)

https://github.com/python-babel/flask-babel/issues/162

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-flask-babel_0.12.2.bb    | 2 --
 .../{python-flask-babel.inc => python3-flask-babel_1.0.0.bb} | 5 ++---
 2 files changed, 2 insertions(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-flask-babel_0.12.2.bb
 rename meta-python/recipes-devtools/python/{python-flask-babel.inc => python3-flask-babel_1.0.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-babel_0.12.2.bb b/meta-python/recipes-devtools/python/python3-flask-babel_0.12.2.bb
deleted file mode 100644
index 104e7c28f1..0000000000
--- a/meta-python/recipes-devtools/python/python3-flask-babel_0.12.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-flask-babel.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-babel.inc b/meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python-flask-babel.inc
rename to meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
index 0e507f3372..d968be3ee2 100644
--- a/meta-python/recipes-devtools/python/python-flask-babel.inc
+++ b/meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
@@ -2,12 +2,11 @@ DESCRIPTION = "i18n and l10n support for Flask based on babel and pytz"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51917f3e8e858f5ae295a7d0e2eb3cc9"
 
-SRC_URI[md5sum] = "fcf2f360ff279d3133e40974804efd72"
-SRC_URI[sha256sum] = "316ad183e42003f3922957fa643d0a1e8e34a0f0301a88c3a8f605bc37ba5c86"
+SRC_URI[sha256sum] = "d6a70468f9a8919d59fba2a291a003da3a05ff884275dddbd965f3b98b09ab3e"
 
 PYPI_PACKAGE = "Flask-Babel"
 
-inherit pypi
+inherit pypi setuptools3
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-speaklater \
-- 
2.17.1

