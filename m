Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.43845.1589813412591492456
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sm9jZIZ7;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id a5so5337664pjh.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=20XDdQK6E5t93901bKG9ksxsR0giM2K3pPZfpIYawg8=;
        b=Sm9jZIZ7eT4ine4FmFaysvxoBSs2Wy8ESubQDG0ImNNEZZSN7yHO0fVjlhjV6qLqDk
         zQiJbRbb39zV4M7/UTGL+4kqiEBTaqszgM3DbjdgzjGUPk7ScjIJdRtdrAATbDcU4rek
         3+tsxU5Ai6PHLmi3bVJpfnBtRt3kgN4XMgklRcTW9IQf8ZeqF77cwh4u3XGYUzlwJldr
         JgNfum9W0cpnUmWlhgMuTdmL+cLOSEpft7RgypVv+7Qhjy/37tD4XpabWNhyQlQ4x8hU
         FCBEHrA1MElpmV53VNRFPx9tErns0u8wmoiJYUqH61/8eIpou4lZiUJ8Nf29YDTitD7N
         Evwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=20XDdQK6E5t93901bKG9ksxsR0giM2K3pPZfpIYawg8=;
        b=ssOWmchXnQ+P/bb0cApOkoEVMDIAkG1LaTXTAA0FRkgxNTLfNMmhAuGmmH3WbtX4uW
         DMpr+mgANpkLG5cjGcHB5vFiHQzht69zJmvTnkBz0nKLHGIDcVqLDoKF1nHleXGU1Ua4
         H+GLq3TByoPaUJ0M7YE+MFLoUSeS1Iv5kyehKxiOXwBqfUF3diCfP+uCB6Vzjjzcvtsj
         3c8JmKRJM9DGDe9CZ6Lvi4Hu8Kt8MjWQtJsl0gKhtFAZFpaj5j0HsNazViYukjabn415
         THxPbgmwllFaf5ERVyK6VzhFS+Cs4AuzKmkW3ptfdzehB3bq9apXAj+0Q7f0akG+CdU0
         Pqsw==
X-Gm-Message-State: AOAM5301QP8/fL2aoeUQgRSAtbVJb8TLNuWCfjaNsfK6c0imIhZ4R4cA
	aHpUG2BsqfLojSw43yfoDtvDuAVN
X-Google-Smtp-Source: ABdhPJw1duIEMOEbHZ3r1hLd1jhNKentBhVekETCoFf/Ludwliy/l4URZXwnzANZYNfqr6QBQ8wG/Q==
X-Received: by 2002:a17:90a:268f:: with SMTP id m15mr21203370pje.190.1589813411902;
        Mon, 18 May 2020 07:50:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:11 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 05/57] python3-ntplib: add missing python3-io RDEPENDS
Date: Mon, 18 May 2020 07:49:10 -0700
Message-Id: <fde2510fd5a58316081b407416e8610cb8d2a52b.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing python3-io RDEPENDS to fix
below error:
 # python3
Python 3.8.2 (default, Apr 27 2020, 08:51:00)
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
 >>> import ntplib
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
File "/usr/lib64/python3.8/site-packages/ntplib.py", line 32, in <module>
import socket
ModuleNotFoundError: No module named 'socket'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0568dda628fa086aaedfa164c6b12654e09972a3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb b/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
index 93df83ad3c..ce2618b817 100644
--- a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
@@ -11,4 +11,4 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools3 python3native pypi
 
-RDEPENDS_${PN} += "${PYTHON_PN}-datetime"
+RDEPENDS_${PN} += "${PYTHON_PN}-datetime ${PYTHON_PN}-io"
-- 
2.17.1

