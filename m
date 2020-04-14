Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.890.1586890363893570110
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 11:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=f7QDdoiR;
 spf=pass (domain: broadcom.com, ip: 209.85.216.68, mailfrom: abhishek.shah@broadcom.com)
Received: by mail-pj1-f68.google.com with SMTP id e16so5394806pjp.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 11:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OAY4e+NSNfYZ7abMicASy+LpaGc6pMmet+FMYR/4gHo=;
        b=f7QDdoiRCdYoRDd3uIK4/uNsF0yobzciQ7fPr+ElI4Zzs62dKqgIbYep1fAVXGvK21
         /yPEA6HbILdiPjKxoTpObhRD/1RnqBLd/Txq/QnFo0V1MunaDwGPZDVueRXPKhrwnw8W
         SH8jFoNtfpGFD3DjPg29LbwzOI0WYXuo7WJlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OAY4e+NSNfYZ7abMicASy+LpaGc6pMmet+FMYR/4gHo=;
        b=HgdxqJW+3QiG6GEg8xOHSCmvKBXEqk+Gz7invqglGTUwbkASRyG+BIBVFpl4jE/yeZ
         jfxExbR+5UJGWuvNZJ36ED7MqdNPwqN7W+lJJcV8jNxRWgWPSGHs80reOnKpnHkA8JKa
         lPO6MAmkXOC42qc+RQSeXx2f/60h5cPHqfZeKNaftRwxkckwXVnVJxem5L8iwLWrxiDa
         vY0vveAusjGu0aO7eWzYmhgObMOjZQ0j8z6ZuqhxsNfr0s2QHliaJNk5OlADZgguYxZh
         GnrfnIJG0zf5svm0gEvRI3PIwXKH0RXFca0jBSQLCAs02H4gH7MCVuq3GBWNJmPsufTz
         mU4g==
X-Gm-Message-State: AGi0PuZTrCqq5wkgsMDFnvvD1HnvE/0QSmLi6wMuzcXm7xgICuLUj+mZ
	/OVwpHnra4GYcl5ryq51rmmcu5rKALJ+qKJP3MjkeBjLr/IYvlvW4txjIz+ZXbN5tIXq3xVjR3F
	NdcdvnsS8oS42EUpUdDHEUtRae6pH735coAhPAtw0sVf8CT+e5JQLxDQQAFsUKXgbvXoZyjHzXA
	OMT0Ha4pLIdiRFA/Zg0wTMkck=
X-Google-Smtp-Source: APiQypKp/dj7m/GmwKJlNokWAqiWstLgZdB1VE9Z2MtmXDNdcoGORxNBmQKG6AuifbotmprjlgYlOw==
X-Received: by 2002:a17:902:9f8f:: with SMTP id g15mr1236682plq.221.1586890362721;
        Tue, 14 Apr 2020 11:52:42 -0700 (PDT)
Return-Path: <abhishek.shah@broadcom.com>
Received: from ashah1-OptiPlex-7010.ibn.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id c59sm12851301pje.10.2020.04.14.11.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:52:42 -0700 (PDT)
From: "Abhishek Shah" <abhishek.shah@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek Shah <abhishek.shah@broadcom.com>
Subject: [meta-python][PATCH v2 2/2] python3-pykwalify: Add recipe for v1.7.0
Date: Wed, 15 Apr 2020 00:22:17 +0530
Message-Id: <20200414185217.24503-2-abhishek.shah@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200414185217.24503-1-abhishek.shah@broadcom.com>
References: <20200414185217.24503-1-abhishek.shah@broadcom.com>

Description of the package can be found at:
https://pypi.org/project/pykwalify/

Signed-off-by: Abhishek Shah <abhishek.shah@broadcom.com>

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
new file mode 100644
index 000000000..1107502ca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "YAML/JSON validation library"
+DESCRIPTION = "pykwalify is a schema validator for YAML and JSON"
+HOMEPAGE = "https://pypi.org/project/pykwalify/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a72ea5159364a2cd7f45c6dcbee37872"
+
+SRC_URI[md5sum] = "58357f1d0f77de976e73dbd3660af75b"
+SRC_URI[sha256sum] = "7e8b39c5a3a10bc176682b3bd9a7422c39ca247482df198b402e8015defcceb2"
+
+PYPI_PACKAGE = "pykwalify"
+inherit setuptools3 pypi
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-dateutil \
+    ${PYTHON_PN}-pyyaml \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

