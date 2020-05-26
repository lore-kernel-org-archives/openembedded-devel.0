Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.54920.1590511674436391768
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 May 2020 09:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=gnz8uA5i;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.196, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f196.google.com with SMTP id s1so21242225qkf.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2020 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=/vgr6MgBYhLBi/Xs9+JFxvfFuVzYw9A2XD1hY08swc4=;
        b=gnz8uA5iyxBkoLvDjs50yGKfhmij3w56RUg3r9Tor9Z7AIp9TqMLfvDtPstv/PD6kQ
         AcxlmxZTVTvtM+/VDhNHQ4Yzycx/qNe+gnLivY+w+5Y118DeBmS9Wy2PFDQJepnGF9V9
         NHHfxY3ub6/FjmWO6RbwvTM5CI+YyVNC9HnLuV205Ane+nRkeL4hgnL+KC2QfN27xA5i
         odD1+HHdZCEiwHrOFVxHfiBhmiMoWVsU+R+wuCzvunbE/TavQnncJSzF7061SDpXnKQE
         kJ3wOVVanZjRIBSzzzq4wA44Bm0TA65hsUgPVCpQ0jp/UTpZHny+vUJzxrZ4pM0xNDCG
         ZxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/vgr6MgBYhLBi/Xs9+JFxvfFuVzYw9A2XD1hY08swc4=;
        b=aNsTv0vOW11jc3WD2pfGL2ArREJegVxc/iiqs1Oiy21eOk1aBRz+5n3Y96TUWALbNi
         g5arnHmZh4xbVnjeQWzHIP3T3zUZg/yZIbxMJEddOQ5Zjps+3eQQDYi0gXEsOknZ9mWn
         PvB7nR5l8AW+Wf2do234E9QRd6o43saeE0gWGU2RDGwGSVdWGjysUxMSU1oyC0FY5FF3
         HeiN1b66BGtnjRcOSzr4BgMPvq4QOQY3iY7kdln4q9NskaPcaUBS/JbPs316prnt45R7
         AttndO07hVRUo2PCOspMTz00VsxXE2lgXREiRMS/owFk0BK9WNIJFnsq/YzMU6DT5+9D
         pC9w==
X-Gm-Message-State: AOAM5305BYyp6RE+jXC5eHR+3aqTtqjBF0W5GUarCCSQFfslxPyCauAl
	+73CzAS1Uxbt9nME9IJ1+zUGLNGdLR0=
X-Google-Smtp-Source: ABdhPJwGq/erBBOnHCPkuLN3hOtXEyKnQpD1pLilCON4UW4NqWzJeV7DGI4IyOHzTe5TrVCByAUqsQ==
X-Received: by 2002:a37:e101:: with SMTP id c1mr2209433qkm.433.1590511673403;
        Tue, 26 May 2020 09:47:53 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:4033:fb82:ae47:2b33])
        by smtp.gmail.com with ESMTPSA id h22sm170070qtn.23.2020.05.26.09.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 09:47:52 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [meta-oe][PATCH v2] python3-pyyaml: Update 5.3 -> 5.3.1
Date: Tue, 26 May 2020 13:47:21 -0300
Message-Id: <20200526164721.7901-1-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
v1 had problems to be added to the master-next due to lack
of rebase with it. The current version is fixed on the
master-next and successfully tested.

.../python/python3-pyyaml_5.3.1.bb            | 18 ++++++++++++++++++
 .../python/python3-pyyaml_5.3.bb              | 19 -------------------
 2 files changed, 18 insertions(+), 19 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
new file mode 100644
index 000000000..8cf909304
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Python support for YAML"
+DEPENDS += "libyaml ${PYTHON_PN}-cython-native"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7bbd28caa69f81f5cd5f48647236663d"
+
+PYPI_PACKAGE = "PyYAML"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-netclient \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
deleted file mode 100644
index 17868a25d..000000000
--- a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Python support for YAML"
-HOMEPAGE = "http://www.pyyaml.org"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
-DEPENDS = "libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}"
-
-PYPI_PACKAGE = "PyYAML"
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = "adbb0d336b509d6472d3b095a0f1cf30"
-SRC_URI[sha256sum] = "e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-netclient \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

