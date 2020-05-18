Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.43848.1589813416231135163
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WEm7FK87;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id z26so4940653pfk.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PsZPEGGdos1Jxe9ph7JWD9wFqn2OvCvnSYlg1tsUdkk=;
        b=WEm7FK87QHEKF22xYawKR2dMJvS/n+p1YZmL6fmoqKtFKK6xXBGWZF8WkYGrVKryIe
         fc89MlLICCeACADZxjXH5VbdACH0V0K2ccqomOV8XS4FgZ0UuNiGBHZJUTV3y9mmUlRc
         UqBERFOw6s/GfCWwyIqJHkifLO98h0fU99XdKnLyrnxs6onbsxX2aRpFuFfMdzDbaE21
         pfAkAb7GW33akDeGCcV4+wyqjpID5ER0+tpQVjF6BWQwr0S4Lwuf6d7eMFy5iUaDmqwi
         pKSp6hjcGhJnVGZuaXKXQkctaGpCF/2M7gKtQ846d65ZEsurM0Qp5jJ3T1UYx7cRjJVX
         w2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PsZPEGGdos1Jxe9ph7JWD9wFqn2OvCvnSYlg1tsUdkk=;
        b=kT20plTelRFT/eR3O3Ai0b1qC5wxZKMo+4p6M3quq7IrdahWOoNtzVUSgrVHcfmU2n
         V9c/0yUVcPzsRXOkjvIZaVYWbq8fL8aaRlb+dfrRpt8ebduGlIvU2tqSCgk5n/7UxaxO
         ry3a3fs2hEfyrwOjjhLdePwXawYXViEJF8TL+pUwSsQmOwVCYjazdQ7Bs1fx6sXQHzv1
         l82vB0uTDnc3ImYzNMFF5C8LaEyIyLcYonNJWdNKN6R/Q4V9lQbyhdlf5llehHl78yOr
         5UA0YGqwIMkRtkB0YgNnXXP9FkzCbkFT1k4uNu0t3yDi3cT7sQbFYNWQl3cYJLQCNwxd
         vdTg==
X-Gm-Message-State: AOAM532bCVKqWk2irn921Zi0vXtGFnZTDsRcHcPvZRVczMvPbWlRUBka
	WhPbbhr1X//if9izW4/GkcPX63bf
X-Google-Smtp-Source: ABdhPJyquO5XlI5QdqtnbCOccRlPzYW/nB8M5i5f0y+cQRkYatpv/wTKEsOgtomD6knFJXWBouMeDA==
X-Received: by 2002:a63:3e0e:: with SMTP id l14mr15204284pga.187.1589813415608;
        Mon, 18 May 2020 07:50:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:15 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 09/57] python3-py: add python3-netclient to RDEPENDS
Date: Mon, 18 May 2020 07:49:14 -0700
Message-Id: <824b48dfdca6b1a602972691fb253f135f6e7657.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Trevor Gamblin <trevor.gamblin@windriver.com>

python3-py requires the uuid.py module, which is contained in
python3-netclient. Without it:

root@qemux86-64:~# python3

>>> import py._path.local
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
File "/usr/lib64/python3.8/site-packages/py/_path/local.py", line 7, in <module>
import sys, os, atexit, io, uuid
ModuleNotFoundError: No module named 'uuid'

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 71bb82f31283398a6bc6e614444b8b73f2763591)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-py_1.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-py_1.8.1.bb b/meta-python/recipes-devtools/python/python3-py_1.8.1.bb
index 73aaf9e46a..ff66aeaa2b 100644
--- a/meta-python/recipes-devtools/python/python3-py_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-py_1.8.1.bb
@@ -11,3 +11,5 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-netclient"
-- 
2.17.1

