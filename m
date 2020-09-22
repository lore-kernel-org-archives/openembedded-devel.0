Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web11.948.1600750065311334622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 21:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=doRhDei3;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id x123so11303563pfc.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2020 21:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hDKXsfvw1VLqzNpfaRGiW0svkIp2NrAPzRnTAXupLIw=;
        b=doRhDei3cCdkQ7DKMlEHKhfE12bKga7zEA4KC0lT9ue4pPmJQjFM9qmwIDWQpDTpJM
         2ctplrAqE/9b45lSMJxUqW9wobWtyWElthNDgOBm/Mt4L6BXRC8VyxG7nx6FTc9wKzZH
         JIBRe0xutGf81VSEWQ67+lgHOHx/nEEy3B66K2+9x5HJOWCyRVENXi44qkfR05+RfJUc
         rEtwlo06I3gT80jQ0PI3qUPV7IMxzpLuiwylwlcnI+oMCRbgEBvKxGv71Wp9JdRWC6ce
         FI7gki+bCmN9OefpwvlL1lGrtnp1bDwTj42eIrqlosfTHEBTo+kSmNZ6j3zitlUTuQwK
         yMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hDKXsfvw1VLqzNpfaRGiW0svkIp2NrAPzRnTAXupLIw=;
        b=twX3a52t7/79pgJo6rxlM1m7SVvD7FWwq3yAkLMWDVTiqFeLeQh4rdsmfyPcuWkkn6
         vK8PuPShB6lBeAxE+x2HOHt49cua6/yTZKI4nF3qHARuxvV6pdD2MBxe+vpV4Wc4rfNs
         +M3WIWlbWX9TBnN5QvUCxW019rjrB7z5dkED0ESfiJKVjd+Ts38FN4y1AnH7DGWDGA3I
         GbRLIr2ARDjpT3BP1IggDL0OTNlrMIXxnRfSuVKU4Jymf4Mhxrt6K1ZUZKTyh++EMXSP
         3Z0weFKVhNjBXniI5nxgnI6ZnAXRHl9E6a/QxRNKpc0dl6YGTz4m/XRXJLu6NbRlh9yC
         SClQ==
X-Gm-Message-State: AOAM531WcnmVVR8iiXOoox6/Fv5bV3sVEBJtGgwjdNXuR1c9zcTs0gPa
	i5QyKTMOniKaCcuNMHZGCdTdJNPSZHk=
X-Google-Smtp-Source: ABdhPJxuQIw8XXDbmWmwh3/fifuCq1b6OeYraVj7DEWubHfYwD8ozVkoOGNQOBV0plHu+By/Ir+0lw==
X-Received: by 2002:a63:ed01:: with SMTP id d1mr2170226pgi.58.1600750063516;
        Mon, 21 Sep 2020 21:47:43 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:8176:7362:ce41:2f0c])
        by smtp.gmail.com with ESMTPSA id y13sm13563533pfr.141.2020.09.21.21.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 21:47:42 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-jinja2: bbappend for ptest
Date: Mon, 21 Sep 2020 21:47:26 -0700
Message-Id: <20200922044727.18107-2-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200922044727.18107-1-ticotimo@gmail.com>
References: <20200922044727.18107-1-ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

The main recipe has moved to oe-core, but with ptest
disabled. Here we simply conditionally inherit ptest
to enable it in meta-python.

Remove the original recipe and the python3-jinja2/
directory.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-jinja2/run-ptest           |  3 --
 .../python/python3-jinja2_2.%.bbappend        |  2 +
 .../python/python3-jinja2_2.11.2.bb           | 43 -------------------
 3 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-jinja2/run-ptest b/meta-python/recipes-devtools/python/python3-jinja2/run-ptest
deleted file mode 100644
index 5cec7116968..00000000000
--- a/meta-python/recipes-devtools/python/python3-jinja2/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend b/meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend
new file mode 100644
index 00000000000..91814e6cde9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend
@@ -0,0 +1,2 @@
+# Main recipe was moved to oe-core, but with ptest disabled
+inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
deleted file mode 100644
index 681acf8f1c0..00000000000
--- a/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
-
-SRC_URI[sha256sum] = "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
-
-PYPI_PACKAGE = "Jinja2"
-
-CLEANBROKEN = "1"
-
-inherit pypi setuptools3 ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unixadmin \
-"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-asyncio \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-markupsafe \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers\
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-threading \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

