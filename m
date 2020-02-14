Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4E106610F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 22:48:58 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 66so10685175otd.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j/kMfpujyRFQe+2fhN0i/omiN0P+kAVxDHkkgAv/N/o=;
	b=U8izyrL6mJyCCh03C18boguEqUqM8NaHxjYRwxZ1+6bS8dcEgJaPUXUgL+3wHWIDQ4
	EpZVMjsgwa1QBci7HM0qvPK3sqb8UGrkGjTnxlRwdSDEHPHqCHmceXqENpNNFOuQdYYR
	FhuIw+4lbUV6N7p9o15C9YKSe14kcThdu7i9yYnC/AQiBRa7ki8db2ggmi0uaq7+Idno
	e26Y6udNmA8Tod8KBC/rVYaF6QsmmU7QlKWQCisvu1NNTEBuvPdVAVTLoS8iUlrWdfdP
	11UmO2AZvuL3yn5UEU2dcmipJTFDzGunbh9bvfI6Os1l2HRCDB3x779JtHgV6MKxMl1m
	cLwg==
X-Gm-Message-State: APjAAAWs/d12PKAWN915cMUMU25wJ6EWGVGI/GVJhASK3miYEZYSQNI5
	qGSdvPwiQ94icu/6ciejrZNNex7VXuo=
X-Google-Smtp-Source: APXvYqzPRvDiqxNynCu3PqzMPk+KE8+NmH0R/xEoqGJiQE5LM6WVYQmxDNUTC+8LI8D3n8eXNXXZZw==
X-Received: by 2002:a9d:a68:: with SMTP id 95mr3955114otg.87.1581720539228;
	Fri, 14 Feb 2020 14:48:59 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id 60sm2642426otu.45.2020.02.14.14.48.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 14:48:58 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 17:48:02 -0500
Message-Id: <20200214224802.17411-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-chardet: consolidate inc and bb files into a single bb file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Feb 2020 22:48:59 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-chardet.inc                 | 23 ---------------
 .../python/python3-chardet_3.0.4.bb           | 29 +++++++++++++++----
 2 files changed, 23 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-chardet.inc

diff --git a/meta-python/recipes-devtools/python/python-chardet.inc b/meta-python/recipes-devtools/python/python-chardet.inc
deleted file mode 100644
index 6305299780..0000000000
--- a/meta-python/recipes-devtools/python/python-chardet.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Universal encoding detector for Python 2 and 3"
-LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-inherit pypi
-
-# setup.py of chardet needs this.
-DEPENDS += "${PYTHON_PN}-pytest-runner-native"
-
-SRC_URI[md5sum] = "7dd1ba7f9c77e32351b0a0cfacf4055c"
-SRC_URI[sha256sum] = "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
-
-BBCLASSEXTEND = "native nativesdk"
-
-PACKAGES =+ "${PN}-cli"
-RDEPENDS_${PN}-cli = "${PN} "
-FILES_${PN}-cli += " \
-    ${PYTHON_SITEPACKAGES_DIR}/chardet/cli \
-"
-
-RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-logging \
-"
diff --git a/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb b/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb
index 38d8122ce9..80785b8d4e 100644
--- a/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb
@@ -1,7 +1,24 @@
-inherit setuptools3
-require python-chardet.inc
+SUMMARY = "Universal encoding detector for Python 2 and 3"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-do_install_append () {
-    # rename scripts that would conflict with the Python 2 build of chardet
-    mv ${D}${bindir}/chardetect ${D}${bindir}/chardetect3
-}
+SRC_URI[md5sum] = "7dd1ba7f9c77e32351b0a0cfacf4055c"
+SRC_URI[sha256sum] = "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
+
+# setup.py of chardet needs this.
+DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+
+inherit pypi setuptools3
+
+PACKAGES =+ "${PN}-cli"
+FILES_${PN}-cli += " \
+    ${PYTHON_SITEPACKAGES_DIR}/chardet/cli \
+"
+
+RDEPENDS_${PN}-cli = "${PN} "
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-logging \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


