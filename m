Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.3259.1596226731424612914
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 13:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eJKYhi1O;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id g19so5365249plq.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 13:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IMJVKZNL74rzcQenejc2bkjUUNPTgh8OKbFuPm0Vas8=;
        b=eJKYhi1OxD/H/tUHmFLKUB5jpDXjsKllIhYI6SJklVCvYEi+1+Mlj095KEYD5PLtra
         RPFVG8pGc28VaS5NBiZrM2szf7d+u0Zs2BjNdG3lGx0CwSmwloT6YY6SYG4+9m6LVTu8
         P2l/LyvxQTySFTPs6Jgvn0GB2VzaRhH0CbRsVqC/tHH1QZf4nsS79NJc8CwS93kunt6r
         97eNN9wRWVxgHYIwJrGByOpbgsSBm+Q5rMhGf7HJE3Nk1raQ48cg9m7K8xMc799aJvph
         QGxfpwjlc9th5HXak/smr8cLpqA5J2Ik0+NIlTl0SDAXbN73YqJ1kX0b5ZR4Dq6oWHyv
         nsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IMJVKZNL74rzcQenejc2bkjUUNPTgh8OKbFuPm0Vas8=;
        b=E3zpAqHW/55h3iGBdTjhh2FxeZv83Lx2c//lTiyH+Zc3Ztpq2bpsuH+Gd6L6s2j6Eg
         CoA7lHflrRUsFjncfiJy5PQOd5a6JP67EZ1RmWoVprxPywhBgPA3zCz8vbAZlQWlZEAd
         8QCEKp4ji0lleJIrkHKGNyzkloyynJavTgEIaXj9uqRoiEiG1jexDRhh8IijZjXpMnIZ
         3lZMF4Fllpl27oeoNJc2qcR/TAsVoSfhg/+E6n+oycIh1RHtfe5SdCqAhxz6AmPbWa/v
         WEmqJiLS77VjpHrJyk2Pj9msKBdofwju5rb7QyeLCU+4qxWp0BLwLMGE7Y0MrU947uG8
         VlLQ==
X-Gm-Message-State: AOAM532/3BScPb/xSMm65YgfNSKDZL0+tG6M69rTfRBzVy6y8N//qI5D
	bgYD38q6cGgZLNvdHDlOrKiUP4dgfBk=
X-Google-Smtp-Source: ABdhPJxT+GGZeAaJdXnpzbmnv+tAxl+rPPewXiRsxxx9wfoYJcSqYwyU4RycU6S5XCI10oobGdTvRQ==
X-Received: by 2002:a17:902:8b81:: with SMTP id ay1mr5192097plb.304.1596226730563;
        Fri, 31 Jul 2020 13:18:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e841])
        by smtp.gmail.com with ESMTPSA id s8sm10973727pfc.122.2020.07.31.13.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 13:18:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-pynacl: Added recipe
Date: Fri, 31 Jul 2020 13:18:45 -0700
Message-Id: <20200731201848.484776-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin McAllister <colinmca242@gmail.com>

Created Python3 recipe for PyNaCl.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pynacl_1.4.0.bb            | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb
new file mode 100644
index 0000000000..29b06232ba
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Python binding to the Networking and Cryptography (NaCl) library"
+DESCRIPTION = "Python binding to the Networking and Cryptography (NaCl) library"
+HOMEPAGE = "https://github.com/pyca/pynacl"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8cc789b082b3d97e1ccc5261f8594d3f"
+
+SRC_URI[md5sum] = "8c6c57893327a694c72510fb620e4744"
+SRC_URI[sha256sum] = "54e9a2c849c742006516ad56a88f5c74bf2ce92c9f67435187c3c5953b346505"
+
+PYPI_PACKAGE = "PyNaCl"
+
+inherit pypi setuptools3
+
+DEPENDS += "\
+    ${PYTHON_PN}-cffi-native \
+    libsodium \
+"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-cffi \
+    libsodium \
+"
+
+do_compile_prepend() {
+    export SODIUM_INSTALL=system
+}
+
+do_install_prepend() {
+    export SODIUM_INSTALL=system
+}
-- 
2.28.0

