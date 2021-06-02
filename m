Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.13817.1622643310841327073
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 07:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=QpWZpG+I;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id t4-20020a1c77040000b029019d22d84ebdso3869695wmi.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jun 2021 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sOZtExqOkhpwJtsX0O0Vh/BI27QDXKX3OQCVaN+9Ums=;
        b=QpWZpG+Iiz2AYaVWQw+LxbAXHdBsq4huD/1e6iP2I5tXpcq9Ps+zTqdEFuNNSdNHSJ
         wuO5UbkqGo5OxyrXcReIkyZgBPAgJx3yvmmqfnSvvR13NdfZFq7jOWPMgrZOQg4KjZiV
         gjzLbBecedD3Uh0OSvH8hDBLIi1Hxc2uLrEMxV8vY05ip2H7/ssHmWlJsFJgemPF6IT7
         w7Wp8DqOyLQ2sYlWAnjaYXEZoGJLdKFddiT3MtPS1lN9JwTOZuXFZukQRhNWFAUPv7ab
         f2j7YCKfOR91kXzEgMl0+BQo70wNpCSrlFd1IEe9cJIa3KA4O3uJOHEzzg67+8SMCeuF
         AFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sOZtExqOkhpwJtsX0O0Vh/BI27QDXKX3OQCVaN+9Ums=;
        b=oz4jL6IrJ6xYEupI4AYR1yEgPqt26hIuPMaPo5Q1gUMi+hvntwZZvUMKkAOby9r8RU
         767pUSuiVcqD2ye78pCVSJ55/nVZtwzoCD9w63YGg1qpbc/rZSHNkUsCESnI/Dqb4sHM
         gWatOikxggmdOkESgfWGM7/SgOex4hRMvp8IVVJ1m5nHPFm4iHHuKtbNJG/9WRkyD2Km
         iwnwotZMscz+G2otfpKIylpos0427zVtdmak13dysvV/0EAh8EDHPDDWMHEpZCxYSm19
         Dp8BDWKkNJuQnDyHJP7EEabdiU3sayaZE/IliFR4Z0/VkFmoQpGSOkxTWzsAy0WfyrIE
         qv6Q==
X-Gm-Message-State: AOAM531ME/ChBjiJnfY7X1BFLV8OjHhRz2LvBct5rxzLIWWeTzhVUNb3
	O7ZovGmGBWFj+ibTwUJdxLRkGg==
X-Google-Smtp-Source: ABdhPJwqXL8grjXRJECJm0gSUpP8XyU6UgE1cakpTCSwfOoy+DjBi27NyqDTOiYA4TFNYcFKPjsVUA==
X-Received: by 2002:a1c:9807:: with SMTP id a7mr5414935wme.10.1622643309376;
        Wed, 02 Jun 2021 07:15:09 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id i12sm2824697wmq.7.2021.06.02.07.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:15:09 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH 7/9] libgpiod: ptest: run all test-suites if possible
Date: Wed,  2 Jun 2021 16:14:59 +0200
Message-Id: <20210602141501.6174-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210602141501.6174-1-brgl@bgdev.pl>
References: <20210602141501.6174-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have four test-suites total in libgpiod: for the core C library,
gpio-tools and for C++ and Python bindings. Modify the recipe to install
all of them depending on build settings and make run-ptest execute them
if available.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../recipes-support/libgpiod/files/run-ptest  | 21 ++++++++++++-------
 .../libgpiod/libgpiod_1.6.3.bb                | 20 +++++++++++++++++-
 2 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/files/run-ptest b/meta-oe/recipes-support/libgpiod/files/run-ptest
index 3ad737dfc..60c661fc1 100644
--- a/meta-oe/recipes-support/libgpiod/files/run-ptest
+++ b/meta-oe/recipes-support/libgpiod/files/run-ptest
@@ -1,12 +1,19 @@
 #!/bin/sh
 
-testbin="gpiod-test"
+testbins="gpiod-test gpio-tools-test gpiod-cxx-test gpiod_py_test.py"
+
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd $ptestdir/tests
 
-./$testbin > ./$testbin.out
-if [ $? -ne 0 ]; then
-	echo "FAIL: $testbin"
-else
-	echo "PASS: $testbin"
-fi
+for testbin in $testbins; do
+	if test -e ./$testbin; then
+		./$testbin > ./$testbin.out
+		if [ $? -ne 0 ]; then
+			echo "FAIL: $testbin"
+		else
+			echo "PASS: $testbin"
+		fi
+	else
+		echo "SKIP: $testbin"
+	fi
+done
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index c0ebb8aa5..874453fbd 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -53,5 +53,23 @@ PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
-    cp ${B}/tests/.libs/gpiod-test ${D}${PTEST_PATH}/tests/
+
+    # These are the core C library tests
+    install -m 0755 ${B}/tests/.libs/gpiod-test ${D}${PTEST_PATH}/tests/
+
+    # Tools are always built so let's always install them for ptest even if
+    # we're not selecting libgpiod-tools.
+    install -m 0755 ${S}/tools/gpio-tools-test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${S}/tools/gpio-tools-test.bats ${D}${PTEST_PATH}/tests/
+    for tool in ${FILES_${PN}-tools}; do
+        install ${B}/tools/.libs/$(basename $tool) ${D}${PTEST_PATH}/tests/
+    done
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'cxx', 'true', 'false', d)}; then
+        install -m 0755 ${B}/bindings/cxx/tests/.libs/gpiod-cxx-test ${D}${PTEST_PATH}/tests/
+    fi
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'true', 'false', d)}; then
+        install -m 0755 ${S}/bindings/python/tests/gpiod_py_test.py ${D}${PTEST_PATH}/tests/
+    fi
 }
-- 
2.30.1

