Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D0CC64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 13:46:49 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.19289.1678456001642684665
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 05:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YVbSU/i/;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id a25so20817318edb.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678456000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PFB4XGcxdqdLUF66XOU3Ms3ebhv8FF8WJ3PmXey7L3Q=;
        b=YVbSU/i/omGBf4CrkL1T8cdo7u7rkKg5k3skLKB80cnmmc0688Rp+E/wd+7s7eZoQn
         hpGFnHaEnJag7vINUQniAOxepLDvA1V0Pt3KYGhc0AkazVe48TGGAYCoXUvI1oP4t4YR
         SCl8L68QLD+H8YypFb8FD0+LjMDISYeYp1qnWXG19MdiTYT8ep30EJn7fp6FmkFYyHRN
         zhSUl0rmbFtWJgs8n34aHmFsAavxILXPS+shHZwgXvjBqaF/uxziqnxywFJdA5PjK1uW
         e/t1Fe+4Fi9vasi43Shic9IQ+vSntSZh5Q3lAshrFkgE5Ngif55nQu9LOK9qSNAZAbCh
         7T5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678456000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFB4XGcxdqdLUF66XOU3Ms3ebhv8FF8WJ3PmXey7L3Q=;
        b=UqWfvY6Zu41M1YszztEWeeCuB1+EXfIIpnE90m8I6EoWiubqZ9MIjl+i+2oMWU7ELb
         usrhoPuyuLU4e1HxDI4KtowneYzh0kX/r5rr8UrsPCR6DifNSKrxvxr7Mi1F4LLMl3dx
         It36RWhfZkecMjWnpu7cwyTxDhW1++VY7wRGlUXGtIUZ/OkBLcdI+xWv4D33X6xzeEfD
         wXqXk/CDaMTujrJvtIXpY0NSLS4AbHeATbtoAXHBSFBoSDucEeZ80fIkOhWI68cxzM0u
         8qjZgtUY5xVRh//Q1+1vGfefQApgC4LX1de7QN1b+0quPOAhKGY7dAWRHf2uSMdVID9I
         yPTg==
X-Gm-Message-State: AO0yUKX9rF3XmeEH+QB3e1RjTq14D0NNDr8yiXxaGSzT2khzLfNE2sod
	fydVjf7goxZm0cSI91yFHWo7jOzPXTaeqQ==
X-Google-Smtp-Source: AK7set+j6e/KojujKjhAyXMZwKuG2CXARzEGKVLe8Buv1tYICBUjn6dkYqB2dk/ZmiQgyUU/dXRWcg==
X-Received: by 2002:a17:906:49c1:b0:878:5524:e932 with SMTP id w1-20020a17090649c100b008785524e932mr27067157ejv.5.1678455999936;
        Fri, 10 Mar 2023 05:46:39 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id o26-20020a1709062e9a00b008b17fe9ac6csm980198eji.178.2023.03.10.05.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:46:39 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH v2 1/3] python3-scikit-build: New recipe
Date: Fri, 10 Mar 2023 14:46:35 +0100
Message-Id: <20230310134637.108312-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 13:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101489

Used by python3-cmake and python3-ninja.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---

v2: Fixed BBCLASSEXTEND

 .../python/python3-scikit-build_0.16.7.bb     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb b/meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb
new file mode 100644
index 000000000..c033c56ba
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Improved build system generator for Python C/C++/Fortran/Cython extensions"
+LICENSE = "MIT & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c96d2b08b3cec6d3c67fb864d1fd8cc"
+
+DEPENDS = "python3-setuptools-scm-native"
+
+PYPI_PACKAGE = "scikit-build"
+
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "a9b9cc7479b71e6c8d434596dfade025253aae23adb22a9a2d85850fd51cecfd"
+
+RDEPENDS:${PN} = " \
+	python3-distro \
+	python3-packaging \
+	python3-setuptools \
+	python3-typing-extensions \
+	python3-wheel \
+	cmake \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


