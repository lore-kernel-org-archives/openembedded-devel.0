Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.13262.1589899420413798915
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=byGOjoZK;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id n15so1526789pjt.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wYC+gMsyiAJciRTIfiUKgJou/YdVoKh+hX4iL+CiKa8=;
        b=byGOjoZKJ3qp+ivymXzGeriZb19nzUNlZeDpnUZ2paXEfHa5vn7+IwVWV+Tp+VOHfZ
         xglmPT44DP2SclTRFSEGHyQo9PSAzQXW5wCUcZXrmAQHtHDIXrJRIik/hyms2ainsXDJ
         tXs5eE9cOgxcDtEXrEk1y/PtVid08shPODv8uim6YJ/McoJRI2Fq2TWNYwlKOZLxtM0k
         Bc94sJlz61JzBQRjzigtvgz1dDwA7ZlUAbsMBelANtinQkyqyfP0luoaj/tivXVDsl9U
         ocgXzMuSv9ufLeUAW2gnrC+dxWffYuevMICPgCXJZF/2Hv2jq8/XBMNCr4KwHVnmoEnY
         zxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wYC+gMsyiAJciRTIfiUKgJou/YdVoKh+hX4iL+CiKa8=;
        b=kzw8y/cTNZMq+K3jhQwgws6zhlQJEvt2TPe925KO4wH7aUEN4cRgdpctFk465dVeu1
         ydUcUQUfOxSKDg3QCECQQ/bc7fagKJ1hGaPy+sijoXWnmnGUHfGxWhlqmFfsUO6BSHyZ
         OuRbfUJNDjaWGDXD5imnE0SOQoO9CvzuarVInsUcrpHST4R3ekkbxCTXc2uUswDEHU/p
         Brm8dHFP6RGkXJNhwnCulVK2GsivQnP3xg5uSGGJ95Tu48uG+3fgPtOpYGF8NT+5llS7
         uZnSeIRYe9RXkRKflJw6KmxuBeZ/I7lmkl+8Y4qAXOBFc/QgCDKPVREVm3rJYHcr5Mxz
         QCnQ==
X-Gm-Message-State: AOAM531u0yY22mPFiSxONUgQDItpuPxxTyJOM0dp0Urma2MKjkyThq4W
	hxOhne5OeDBqERWyfKpJD9XlfuuM
X-Google-Smtp-Source: ABdhPJw4DvchkCQdocK3oIXTGrtAeszInyp32cztYdFEEAAKJaKGpzHO0pB5QJDOT+GnqqYc4iOyzA==
X-Received: by 2002:a17:90b:3014:: with SMTP id hg20mr5631526pjb.56.1589899419603;
        Tue, 19 May 2020 07:43:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:39 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 05/18] python3-pytoml: add datetime and stringold to RDEPENDS
Date: Tue, 19 May 2020 07:43:19 -0700
Message-Id: <20200519144332.12822-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Error messages like the following are encountered if datetime and stringold
are not in RDEPENDS for pytoml, so add them:

|Python 3.8.2 (default, Apr 27 2020, 08:51:00)
|[GCC 9.3.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import pytoml
|Traceback (most recent call last):
|File "<stdin>", line 1, in <module>
|File "/usr/lib64/python3.8/site-packages/pytoml/_init_.py", line 2, in <module>
|from .parser import load, loads
|File "/usr/lib64/python3.8/site-packages/pytoml/parser.py", line 3, in <module>
|from .utils import rfc3339_re, parse_rfc3339_re
|File "/usr/lib64/python3.8/site-packages/pytoml/utils.py", line 1, in <module>
|import datetime
|ModuleNotFoundError: No module named 'datetime'

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 75b3d7e7bf3ea451c633adc6906c0c1695359fff)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb b/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
index b09005ec9e..1533a895f3 100644
--- a/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
+++ b/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
@@ -15,6 +15,11 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-stringold \
+    "
+
 RDEPENDS_${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
-- 
2.17.1

