Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.43852.1589813419204259672
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vMW+5BSk;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id u35so4938984pgk.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=SIgM8z+Viq70qH9siocsS6tMrAVSx0I7Ww8jShstI4I=;
        b=vMW+5BSk3GtwRO30hnCuVlywN3Cgi9uin550Q4OYbd4i0nHOmqvS735tc2Xj1l4BqY
         bMjVgrZOQrBntnPOnx8qHqIhTmegOQNVe7AxkqQzSQXyjoDz07VC1caBmNZ1SVDY3e3v
         kCP+6eVVhaon8dovAGyE5LtIiKVGvrC81k1TpVStZa1PFaAJcgYHJMvqFdiQNKVbNQ0d
         +nnSf3OsMoczgWjnukNPVFFEpIbDXwcOazFxvi6f4KqifR3YlCbPOhJH9aiIsAx/O4ld
         ltcHK4VzytXw3aDSZEz995szlB0DdrCSZan2OjEvSeSrgxe8x2NhX/E/VBIUfNFz0yVJ
         02eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=SIgM8z+Viq70qH9siocsS6tMrAVSx0I7Ww8jShstI4I=;
        b=JTpUnqDY3x8kYIHv7hozPLJn/9+A18qwyJCPQ/hCROgZMbVVcvpqovjMNAO2zhRK+a
         SGuoVBO6Kz/JI+8gjkEU12k01Y3YPYyYx79KPem6XvFOEWF7sJC1BrxnOiTxXa+9Fl9b
         ziZ4/kSyKOzJAEbilBGNKW2vmCMEAocau+OA5oi+HNHEqHAtvMDgnRekUo4sJHX7Jfoa
         G/kH7CZ8g3Mps8CvkjR0XVy1+m6+83LfVmS+GWB1/RjpsVlCX/UVCcpSQQJuRJiJtUhv
         kG7UyaXNJs6VRMuavpeCkuYxNVOk7p3bkBXqRR3+OSLI1jJDI0BPDl82e3256/8LXS3z
         TZiw==
X-Gm-Message-State: AOAM53344GISdtFOswrdA11ZF6J4pBS0l10TCFa6kPXugACDbzFTijvK
	eC7IraZ86kOEJyC0mSZ1snLBVNqb
X-Google-Smtp-Source: ABdhPJwTld0tpueLxEFq0YPMgHXIvaIPo8Z7xRDzH3DzjJrSolbClAht4p/N2qgsEDOwRwfAPfXgMg==
X-Received: by 2002:a62:fc06:: with SMTP id e6mr15169010pfh.125.1589813418217;
        Mon, 18 May 2020 07:50:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:17 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 12/57] python3-pathlib2: add the missing rdepends
Date: Mon, 18 May 2020 07:49:17 -0700
Message-Id: <691e34f773214083acd5fc8d39a99229be624353.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import pathlib2
 [snip]
 ModuleNotFoundError: No module named 'ctypes'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e65e8da5338ac71b7e5ca8b5a781978d4c319a34)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-pathlib2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pathlib2.inc b/meta-python/recipes-devtools/python/python-pathlib2.inc
index 3199b56a03..d69d5273ae 100644
--- a/meta-python/recipes-devtools/python/python-pathlib2.inc
+++ b/meta-python/recipes-devtools/python/python-pathlib2.inc
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a"
 SRC_URI[md5sum] = "f2bd0a363eb0f8fa0556f35c1d9e66fb"
 SRC_URI[sha256sum] = "6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-six"
+RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-ctypes"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

