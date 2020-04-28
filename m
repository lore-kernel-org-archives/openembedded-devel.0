Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.6935.1588079380000530402
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2020 06:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=iAITExJk;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.68, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qv1-f68.google.com with SMTP id 59so8190651qva.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2020 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M/AuLJadeB6sURVPF7YBDIA6oTP9tCxXcuPHtnI6eYo=;
        b=iAITExJkNgmE7UIKrdbd3uh49n/yjavSjVl7Zp98vEVIpIZDsLn7hn9qsv4VCOZ+dC
         tmEFxMAQCGvlAyLn3XtUZnU9b5vV3MnuCrC3xcKrHUs/PK6jOyv1/1O/qPFfh7ckyGIZ
         6XQlNdh62YLip++KcToWVvO8uxAO5JK2B80eW3TWMwlDtYC1EWEuC0Btj+yfQP3VdoRy
         9AGUb/78KfQUnQX5wwlhv7S0lvfcm80DD3B25SomcmCehJsmtik6YgwhiAOy2KolRzT3
         IkylUTT/wmj7o37J42ylLovZiIVfEzS3pEEzs4qCgCnbqQ/uNsz0h8vBRWm+8MzFBPuQ
         mOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M/AuLJadeB6sURVPF7YBDIA6oTP9tCxXcuPHtnI6eYo=;
        b=CRz+vCT0pu1uPMFcJZH0GxoeXlwmWl5kq+6W55mzM9P6ACdrJ+HlPnHjhL2s32AU3j
         HlGzGirZkRz+Avlf1235VsdABy1xjKvp+H3wopJQX1e9Lv4df9jmsAy6/8u3RIwpwGoo
         uaTlTLJxLB1mgoqpEOH2XhsZ4qx5RqIsfaiGck3xceCs0TT027DUnW55NoxNI065Tea8
         JNxVQ393j0Awo4OpMo9qh40Spj7XldJTtvbjO1tg0D+ZlrErRPAC8IBmFQOtzmaCXeul
         999CSU6SeYk3tuE+DGSXXVUJv0VkZQjo2dTw6/AntDXzfC+i1MUsvKdZsEI+8sNvnjVx
         aJ4Q==
X-Gm-Message-State: AGi0PuZKyQmZbG/Q7WCx1sLgZ6/u8cmkYfU41XH1sQeWgnDb/EgYgFzD
	bshN9FaeVMxJ4jNkFLDZYtxzC5ftGoI=
X-Google-Smtp-Source: APiQypJZOn70BheOzOd4Itk7GUqAfy7x1Q3DqB5IgtVv9v1TsO31E4SR8Zpnxmz82uiRVArTnRUA4g==
X-Received: by 2002:a0c:ba20:: with SMTP id w32mr27071836qvf.3.1588079378964;
        Tue, 28 Apr 2020 06:09:38 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from localhost.localdomain ([2804:7f4:c193:1cf5:44ed:61e4:a25c:b4f0])
        by smtp.gmail.com with ESMTPSA id a13sm13203103qkg.129.2020.04.28.06.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 06:09:38 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [meta-python][PATCH 7/8] python3-werkzeug: Upgrade 1.0.0 -> 1.0.1
Date: Tue, 28 Apr 2020 10:09:13 -0300
Message-Id: <20200428130914.17398-7-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428130914.17398-1-domarys.correa@ossystems.com.br>
References: <20200428130914.17398-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-werkzeug_1.0.1.bb          | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
new file mode 100644
index 000000000..b54399e1c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
@@ -0,0 +1,38 @@
+SUMMARY = "The Swiss Army knife of Python web development"
+DESCRIPTION = "\
+Werkzeug started as simple collection of various utilities for WSGI \
+applications and has become one of the most advanced WSGI utility modules. \
+It includes a powerful debugger, full featured request and response objects, \
+HTTP utilities to handle entity tags, cache control headers, HTTP dates, \
+cookie handling, file uploads, a powerful URL routing system and a bunch \
+of community contributed addon modules."
+HOMEPAGE = "http://werkzeug.pocoo.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
+
+PYPI_PACKAGE = "Werkzeug"
+
+SRC_URI[md5sum] = "5d499cfdd30de5d9c946994783772efd"
+SRC_URI[sha256sum] = "6c80b1e5ad3665290ea39320b91e1be1e0d5f60652b964a3070216de83d2e47c"
+
+inherit pypi setuptools3
+
+CLEANBROKEN = "1"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-difflib \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-html \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-simplejson \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-unixadmin \
+    ${PYTHON_PN}-misc \
+"
-- 
2.17.1

