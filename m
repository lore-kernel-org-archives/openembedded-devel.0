Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.12936.1589899419052302150
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YZpUEZLM;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id a5so1459976pjh.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=I2Sh1QG38vd5MAeWWh3cXrTH1i+ddUhgn7/2HAXmeEU=;
        b=YZpUEZLMuQwH1gaSK7s3ue4Tlow3DcDo336UuhuzarfjMmIaY6whmBzpotLdQjCOAx
         gxB7kaqASmTYWyujmE10HUP0Ognjy8ZnKriAX5f/GfpiW2/6kFdr7mrGIUjT62Iy2DYp
         C6A1OGcK1sAq4utV2uai/+v9P/UxZ6V3JwI34t270YkWTK+mVIKxHnm8OG2OCYc9EGx7
         qYttSFxisjfr2e5xI1io5vvzSJ9ELex9omFzEQ6iSMGnARuG9AZ0pBLMiRPvY+XfFD7G
         rFWeLzH81n+5Joo6Q6G/L4of7YqN1Dnuz0qmLvV3sxLj7tv7Bquv4ioB6Aj7nB6sGU3w
         zQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=I2Sh1QG38vd5MAeWWh3cXrTH1i+ddUhgn7/2HAXmeEU=;
        b=ZUbwnsszphdJw6t0qxJSTtGhhGoXfkwLSHzkAhLlMGfGOvaNKAcNy939u7jOXppba1
         DgmyGaVoBMbHXwXQM10P81mWOY3i7Wyi9TbFZpRUYl6wj12WlFhcj94qTNBQZeZeuWW2
         Q9GLuuSEJB2M48htOVS/YNwf5Vvc9zL9xfhfr+SrqzUoUR7+eJvAgc/1/+aLw5iTIWW8
         GF5f098AHqMZ6AAzotcXkOGNwBck6uVVYNH0xQhNooc36HZovEeUrPMhxGLdcTc183k0
         foJrVf6dJ77k/tgXxtHHcw7s50nVTBMM06EC5p+MhLNt1jcx6peC5AuwkD3ZoiGQs1eD
         DvnA==
X-Gm-Message-State: AOAM532DNnMMY/Q43W7SYi6x/dgywjbHLE4TAFyytCuScTspOrGzXMvT
	QVKqGlr4GTIVdloK73cTCiQ76oSY
X-Google-Smtp-Source: ABdhPJw+AehfzQoLZ8K5fj4lZ4pNUChI4G0VAQQFEubmKOuiXNjdjgsTsueQoWTE6nM59k38NSGJsQ==
X-Received: by 2002:a17:90a:6f26:: with SMTP id d35mr5492919pjk.210.1589899418431;
        Tue, 19 May 2020 07:43:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:38 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 04/18] python3-pyrsistent: add python3-numbers to RDEPENDS
Date: Tue, 19 May 2020 07:43:18 -0700
Message-Id: <20200519144332.12822-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Trevor Gamblin <trevor.gamblin@windriver.com>

python3-pyrsistent requires python3-numbers, so add it to RDEPENDS:

|Python 3.8.2 (default, Apr 27 2020, 08:51:00)
|[GCC 9.3.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import pyrsistent
|Traceback (most recent call last):
|File "<stdin>", line 1, in <module>
|File "/usr/lib64/python3.8/site-packages/pyrsistent/_init_.py", line 3, in <module>
|from pyrsistent._pmap import pmap, m, PMap
|File "/usr/lib64/python3.8/site-packages/pyrsistent/_pmap.py", line 4, in <module>
|from pyrsistent._pvector import pvector
|File "/usr/lib64/python3.8/site-packages/pyrsistent/_pvector.py", line 3, in <module>
|from numbers import Integral
|ModuleNotFoundError: No module named 'numbers'

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 06916cbfbe150561f9d78a32e162780689df5cf7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
index 5ef7140283..53251aa55c 100644
--- a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "cdc7b5e3ed77bed61270a47d35434a30617b9becdf2478af76ad2c6ade
 inherit pypi setuptools3
 
 RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-six \
 "
 
-- 
2.17.1

