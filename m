Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.16634.1604949709894300664
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 11:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u6HHodNe;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id v12so9054509pfm.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 11:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hImjEdTSie1Uadc5+pMAfAN/Tb0/ZVBd1QYpgWbS5e0=;
        b=u6HHodNeUrcrtiAO6rLY6OvSwcBqKOF458IjShrlLLhyphHmAkyjDiUpImxS1ibQLm
         YK66BZphFFWr+nLclSdhcdN3KkasE4ABXQAQHsY1OaSrc+MIGwtrrOTejhKxqyP/0KBd
         h5d43T5/5XgL7E+5gp4rNsmjggwc6Bnbgfm8m0nJqzNei9S0nAPpT3ApPkz3GgV+E77t
         3XSY1ZYy6xYa53egcuwBqaM+2qP3NcwxvBLb7thIatPuqj99Xe+SDXT/H3HQ2Iq6W0+M
         MRYDO6M7eWLZMlErOP58BTe+Cwuq24ZwmUY5y1I2/zCfmDUOaJcaLHB+wS37kcsoOmyE
         OSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hImjEdTSie1Uadc5+pMAfAN/Tb0/ZVBd1QYpgWbS5e0=;
        b=OBegOf8vCAgeiVPo+surS6uUcWuIb8UmrbON3IIHhb/gwRgvTl/V6LZP/0XQVEiqp+
         gPTR4nuCh2jWDDs5GxktzLqf5iY+xtbH3cJUMk1fP2ktL0t8KhBPpLvRfGI2b6uo1p2X
         3B10tNhKvz5H8yMm9Na9BGp0A6QUfBilqjoddS3Rd3e6T3bW/dHxpzeGBuGipFzgIVsm
         H1hRyhRZRi4T0EDa09C8ewjeWqUXYsSa9IlPFoF/oGpCZ1EcBtLu2Jg7heQ7w+H+QWUz
         PZUbTg5j7IAjwxW9Y/g7zE3YTKVE+Ubt0caUSBDiLqRADNJaOm70znNfabBQEW/2IDJ1
         K3JA==
X-Gm-Message-State: AOAM531ja7vmxzcWJFCzKZ2nsdzt8pivhDtxCEmRumfgYRO7zolnZr6a
	YQTX75VgPZVwzmDac/O08DgTZyGd4m2GAA==
X-Google-Smtp-Source: ABdhPJzVlglyTJ9ieT5vRrH9OwN7HcaPYepGw2/IkViVntxcEcsBwy5Qu82mLhxMPW9dzYiFR3/QcQ==
X-Received: by 2002:a17:90a:a81:: with SMTP id 1mr671246pjw.165.1604949708977;
        Mon, 09 Nov 2020 11:21:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id p127sm11930685pfp.93.2020.11.09.11.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 11:21:48 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gregory Anders <greg@gpanders.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] Add python3-transitions
Date: Mon,  9 Nov 2020 11:21:41 -0800
Message-Id: <20201109192143.3739442-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gregory Anders <greg@gpanders.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb         |  1 +
 .../python/python3-transitions_0.8.4.bb               | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 6a30619866..248abaff7b 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -425,6 +425,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pycurl \
     gyp \
     python3-jsonref \
+    python3-transitions \
 "
 
 RDEPENDS_packagegroup-meta-python3-extended = "\
diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
new file mode 100644
index 0000000000..3da97ef95e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
@@ -0,0 +1,11 @@
+inherit pypi setuptools3
+
+SUMMARY = "A lightweight, object-oriented Python state machine implementation with many extensions."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39"
+
+SRC_URI = "https://files.pythonhosted.org/packages/32/32/305845f95f98b505e641aa3fc135b0a9747befcff06223a541d2aa388d47/transitions-${PV}.tar.gz"
+SRC_URI[md5sum] = "ef07ea90015a296653a4b095837b0354"
+SRC_URI[sha256sum] = "9a2841b24789dfd345267cb92e26b79da75fd03f6021d1a5222c71b5c9ae3c16"
+
+RDEPENDS_${PN} += "python3-six"
-- 
2.29.2

