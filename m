Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.6896.1588079370296130213
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2020 06:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=MRkd6slF;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.194, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qt1-f194.google.com with SMTP id t20so5103107qtq.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2020 06:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=3pDKOJXjcxdHLYTnrvMKYYTtllgzxB0FhceieB0FMZ4=;
        b=MRkd6slF3MFCRo/LthYB1hCLIK3bj9Yzn9iwFGl+Q0r9QRSx+oB9CXLZKkwHccqPVs
         7fWuYj4LT1BRFRmO+ncR9hFfZUW27JXaJnbeqklxQcODIEWhNB3sEG/o7tXP84m53v8U
         iY/0VJ/o3mC5j0NFpeRTC2RrDqveusJcH6lwa6cHWsZ9C5/zBTPZX1KuT+Sy//Chaj20
         woyVHC+vuCm+8Kw+ctpeXGZHH6QSGvE9Ri95F5eZl9OYtHP6oaY+jVWni/ewusXPDrYO
         dLH3TBCTV1LbG1h2Wy9Iuqt1a7cQQg7VgDkEXhxm+H3Yat2JHywYUtsN4rO7cVwoEWF/
         bq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3pDKOJXjcxdHLYTnrvMKYYTtllgzxB0FhceieB0FMZ4=;
        b=qc/Jo2d7DtesM6jB433EU9usnzU0v29REE+ARzmwWLbG372iTSjReqpmntrxVFwux/
         oxyydr5NdTLBr8jZ6G9KVQo/yYGijf+wTqfPbSwnyHDNaJk6313foOafzrKIAJppQZqD
         8ERAdAmOAErZ36TAed7ged03luPBGWXhVHiLcDnZf9uxF7ExK9TPIsENqcrnil3BsUj0
         LvfHHDzXu09+Hos+jtINKSLPCB2efKwB+H5aiEtXhLE2fU5IvNPA5iVQtOeMtsNTal28
         OW7xSHNFDTMxkgFLw0aOMcv6f9x3RN2P2OgSygJZjalR04BKInrRiW5J7cBMHBPQRPoO
         RDbg==
X-Gm-Message-State: AGi0Puao5s+CoPb3rhQcOAU3CfOquoV6dSwFG/u8AYMQE2IblVIzuZxh
	py21Rx9y++WRb+IoUTdpv7rGVtf+vsg=
X-Google-Smtp-Source: APiQypLMPlLBQrWjWhyOwcHkzPaOlbIkVhR4gTsmSHBNQyMAFO6TmmXp+PSZhs/TzMkRCj5EAGZ1Dw==
X-Received: by 2002:ac8:312e:: with SMTP id g43mr28543028qtb.256.1588079369080;
        Tue, 28 Apr 2020 06:09:29 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from localhost.localdomain ([2804:7f4:c193:1cf5:44ed:61e4:a25c:b4f0])
        by smtp.gmail.com with ESMTPSA id a13sm13203103qkg.129.2020.04.28.06.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 06:09:28 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [meta-python][PATCH 1/8] python3-flask-jsonpify: Add recipe version 1.5.0
Date: Tue, 28 Apr 2020 10:09:07 -0300
Message-Id: <20200428130914.17398-1-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-flask-jsonpify_1.5.0.bb         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
new file mode 100644
index 000000000..5d7e9b517
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A Flask extension adding a decorator for JSONP support"
+HOMEPAGE = "https://github.com/CoryDolphin/flask-jsonpify"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.rst;md5=bd59445a234a0c8250b39178d42e3148"
+
+PYPI_PACKAGE = "Flask-Jsonpify"
+
+SRC_URI[md5sum] = "8a10e37942c43d93d107644a3fe77d98"
+SRC_URI[sha256sum] = "8ac4c732aa5b11d9f6c2de58065d3b669f139518ca8f529bce943817e2fedbfb"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-flask"
-- 
2.17.1

