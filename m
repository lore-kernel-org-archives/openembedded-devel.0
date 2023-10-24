Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C890EC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 11:09:28 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.15466.1698145766206669115
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Oct 2023 04:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PfkyLO+W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40806e4106dso25086155e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 04:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698145764; x=1698750564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3v/3YA5BTFOog9Z4duE+9vZyJinUFO5N2xTz66X3axY=;
        b=PfkyLO+WObS2CDMQffGuST29bmzA9WpIm/bMlN5DNaiNflIXwBSrNOvws6YoHvOBbr
         pV42u4bU85PH3U3UXw+FNzwKftp08Uf41AqaOjxvpjcQ4H8Uggskss6yJ/wF7zq6pUKl
         226wXwKVYKB8l6+EYlojeJMkPzY08uh6Wlrpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698145764; x=1698750564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3v/3YA5BTFOog9Z4duE+9vZyJinUFO5N2xTz66X3axY=;
        b=rSBfz9OrDC2i+kdYB8VgLeBvV9ayHrA+IF+AJL5GnSQY+BXuUoqaJdAb3bN+BqqGAd
         kBCMaB/kixf7tcLKzKi+mTSReICQJLt2KZvLu3U0s6yfpDUBU85S/UMEbXBsk7kOqQBk
         bZWmIJLq+DGCyf7FuO+hklvYTaZfF9lwaV9H36fF8ZE5f7IZVJHqQGsXXbTuQ8G3Mi3i
         yjnnLysbdeiw/CgHLY+QiVStx7Ns3raP/Q9PMk/0HsXDhD1FGOU+ZJiH0s2SYWljOm/E
         5nJY4UiLnifvv7FD4feoQHSYSd+WneWt6xuGKwgB3Ti2+th8Jaw5jTWJnzp/sJqBBgcQ
         sIHw==
X-Gm-Message-State: AOJu0Yz7f84SvcLG7BePNjflFGCT45/290u8rt0zOmBFoJGPt/ugMkNA
	ZwWS4wpSqRaCWyoJOsf0rb/IKiIXmidZezNZpzA=
X-Google-Smtp-Source: AGHT+IEcZgK0MK4GbXjOmqohQx2w7xkGf2aMMXAEuRzmsZZCiN8ExTlR/kQ2Qnyse5KqXDO7IA7JYg==
X-Received: by 2002:a7b:c4d8:0:b0:408:36bb:5b0c with SMTP id g24-20020a7bc4d8000000b0040836bb5b0cmr13490936wmk.7.1698145764138;
        Tue, 24 Oct 2023 04:09:24 -0700 (PDT)
Received: from localhost.localdomain ([2001:8b0:aba:5f3c:ae1f:6bff:fe41:1692])
        by smtp.gmail.com with ESMTPSA id z2-20020a05600c0a0200b004060f0a0fd5sm11784047wmp.13.2023.10.24.04.09.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 04:09:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] meta-python: Drop broken BBCLASSEXTEND variants
Date: Tue, 24 Oct 2023 12:09:21 +0100
Message-Id: <20231024110921.57789-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 11:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105716

The command "bitbake universe -c fetch" currently throws a ton of warnings
as there are many 'impossible' dependencies.

In some cases these variants may never have worked and were just added by copy
and paste of recipes. In some cases they once clearly did work but became
broken somewhere along the way. Users may also be carrying local bbappend files
which add further BBCLASSEXTEND.

Having universe fetch work without warnings is desireable so clean up the broken
variants. Anyone actually needing something dropped here can propose adding it
and the correct functional dependencies back quite easily. This also then
ensures we're not carrying or fixing things nobody uses.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb | 2 +-
 .../recipes-devtools/python/python3-aiohttp-jinja2_1.5.1.bb     | 2 --
 meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb  | 2 --
 meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb     | 2 --
 meta-python/recipes-devtools/python/python3-can_4.2.2.bb        | 2 --
 .../recipes-devtools/python/python3-covdefaults_2.3.0.bb        | 2 --
 meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb     | 1 -
 meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb    | 2 --
 .../python/python3-robotframework-seriallibrary_0.4.3.bb        | 2 --
 meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb     | 2 --
 meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb     | 2 --
 meta-python/recipes-extended/pywbem/python3-pywbem_1.6.2.bb     | 2 --
 12 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
index 9bb3053885..63065e00ba 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += "\
     python3-threading \
 "
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.1.bb b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.1.bb
index 68cbb265f4..4c4ed3ffd9 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.1.bb
@@ -11,5 +11,3 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-jinja2 \
     ${PYTHON_PN}-aiohttp \
 "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
index 54c8f23fc3..42a8e0e7b5 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
@@ -19,5 +19,3 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-txaio \
     ${PYTHON_PN}-six \
 "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
index bccdf284e5..ede7f92e8d 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
@@ -17,5 +17,3 @@ RDEPENDS:${PN} += "\
         python3-six \
         python3-stevedore \
         "
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-can_4.2.2.bb b/meta-python/recipes-devtools/python/python3-can_4.2.2.bb
index f3cfd17244..9ca926d66c 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.2.2.bb
@@ -27,5 +27,3 @@ RDEPENDS:${PN} += " \
     python3-typing-extensions \
     python3-wrapt \
 "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb b/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
index b7709aa1ca..a0ef2af828 100644
--- a/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
@@ -27,5 +27,3 @@ do_install_ptest() {
         install -d ${D}${PTEST_PATH}
         cp -rf ${S}/tests ${D}${PTEST_PATH}
 }
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
index 3b9077f326..dd07968f03 100644
--- a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
@@ -22,4 +22,3 @@ RDEPENDS:${PN} = " \
     python3-ninja-syntax \
 "
 
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
index 98817f9312..6fcf346bc4 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
@@ -20,5 +20,3 @@ RDEPENDS:${PN} = "\
     ${PYTHON_PN}-fcntl \
     libudev \
 "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
index 4ad5c3601d..4c0bd7e3ec 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
@@ -13,5 +13,3 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-pyserial \
     ${PYTHON_PN}-robotframework \
 "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb b/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
index 8a30f7cb78..bd0979d0b4 100644
--- a/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
@@ -11,5 +11,3 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "python-snappy"
 
 RDEPENDS:${PN} += "snappy"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb b/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
index 7559accf41..3b0562421b 100644
--- a/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
@@ -10,5 +10,3 @@ inherit pypi setuptools3
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-twisted \
 "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.2.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.2.bb
index 01e4719ba4..f607de7799 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.2.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.2.bb
@@ -49,5 +49,3 @@ ALTERNATIVE:${PN} = "mof_compiler"
 ALTERNATIVE_TARGET[mof_compiler] = "${bindir}/mof_compiler"
 
 ALTERNATIVE_PRIORITY = "60"
-
-BBCLASSEXTEND = "native"
-- 
2.34.1


