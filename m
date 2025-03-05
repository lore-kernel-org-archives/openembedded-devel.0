Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2747C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 17:07:15 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.18538.1741194346086523610
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 09:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BC33r+16;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: sofiane.hamam@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4398ec2abc2so63094505e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 09:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741194344; x=1741799144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ww4iw9RZIK/gIFmKMEMtbE19mC9ChAiH+N/Jen9cxyc=;
        b=BC33r+16KgwH58CrV/NxsQFSDtCBA17M6rix6d6bNHTPDkWC9p935u25079iqO2dyy
         XiAQVwM9FCkXGj0z7XRZV5Omf2DTj+4x8MjpRP5tIY6jNmINYLW06ibtkPHzvz3/3N8n
         hrOlrDwJNAMcS25Fa5iff7d8cG+ny1vT70uOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741194344; x=1741799144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ww4iw9RZIK/gIFmKMEMtbE19mC9ChAiH+N/Jen9cxyc=;
        b=HYzpQPFoANGdIph0X+WbmmfGp7aXmj/xdG1EKGMcSFAN5+ulJ7j8Yyajmxh3Y/HU0U
         Bebvfnd1BqIAJuQ8y5oY1XupslRTffX1Qds0F0nPfcnA+G7HaWyt7EUrnXs5xreIjtXg
         kklhPKVKXUVs80tH2BD77Sdfb3HPthRQY5qAnjbQQBZHK+zC0xxzyNT/Phn8obw3S5XR
         wQrwf726p3ypAsMOg/K5GJ8pexK8rE3MFVDcljhO14DQmk4dbf0CzkE2dHFBe1jTvBen
         eLGz+I5wxGHMlrS3vmUTHPbl8BboJ8o/IZS3shDCtuHhtelikzaz/+bfyzrg+k5HB7d4
         hE7g==
X-Gm-Message-State: AOJu0YxpdGhOcWVc69FbwWPFKINKY56TmZegWI9NjyisOT9kCMpJKog6
	8B97iL79wIOl6utTnWHcCrAkl27qO7eGVsDCXmFzBaHzkIYr2qhck80smVlp0c8rbwWag6LwvYZ
	S
X-Gm-Gg: ASbGncvTJt6jUqSlGPO4zIcJxdX51aaiWSTg74cjhMXaDG82lUeu5lpYBKKBrLrb5sp
	I7ipUZQJuhpfVcZDDNszftUrOA+0uey96Yzj8iJDCBbtr4aPMuugVbWbF6nJVUmC823BCGr3vZq
	HGtAJPGXjBlCcELtvwrvLDcTPtfkzMZWO7HM1jhSTgJo4NdwL9xn6zfEG/avGdsSTJehvJwRgke
	RWKMBUvPnqhpuVItVxAtETqWjAmgO1a3VVvMTa8D6R/z6jfCRI00IfPZHY1cwnLxBvqVbRHSFJ3
	KhD31SzhKyNKRTW8qFKSkNPB6o9/ZKEFTmf/Gd4YfMC9DjxJjpw59lzP
X-Google-Smtp-Source: AGHT+IFlyLajGXOHi4Tc4roGXoM+yr4GYKCgcTDxQYzhG5M1YR6K3S0muw8/mnxxkjjll+xCA2hOPg==
X-Received: by 2002:a05:600c:1c29:b0:43b:d1ac:13 with SMTP id 5b1f17b1804b1-43bd2ae6785mr34784425e9.30.1741194343975;
        Wed, 05 Mar 2025 09:05:43 -0800 (PST)
Received: from FRSMI25-BPYTOP.. ([213.248.108.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47965ddsm22050657f8f.18.2025.03.05.09.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 09:05:43 -0800 (PST)
From: "Sofiane HAMAM" <sofiane.hamam@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Sofiane HAMAM <sofiane.hamam@smile.fr>
Subject: [meta-networking][PATCH] Wolfssl: add ptest
Date: Wed,  5 Mar 2025 18:04:35 +0100
Message-ID: <20250305170435.3320386-1-sofiane.hamam@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 17:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115760

Add ptest for Wolfssl package.
Set IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-wolfssl to 700M
enough to avoid a "No space left on device".

BEGIN: /usr/lib/wolfssl/ptest
Wolfssl ptest logs are stored in /tmp/wolfss_temp.qvuQ9h/ptest.log
Test script returned: 0
unit_test: Success for all configured tests.
PASS: Wolfssl
DURATION: 7
END: /usr/lib/wolfssl/ptest

Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
---
 .../ptest-packagelists-meta-networking.inc    |  1 +
 .../wolfssl/files/run-ptest                   | 24 +++++++++++++++++++
 .../wolfssl/wolfssl_5.7.2.bb                  | 24 +++++++++++++++++--
 .../images/meta-networking-image-ptest.bb     |  1 +
 4 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/run-ptest

diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
index 2197a06e7..113725882 100644
--- a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
+++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
@@ -19,6 +19,7 @@ PTESTS_FAST_META_NETWORKING = "\
     openhpi \
     squid \
     tcpdump \
+    wolfssl \
 "
 
 # firewalld currently hangs forever so disable it for now
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/run-ptest b/meta-networking/recipes-connectivity/wolfssl/files/run-ptest
new file mode 100644
index 000000000..ff66f4ef6
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/run-ptest
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+echo "############ Running Wolfssl Ptest ##########"
+
+log_file=ptest.log
+temp_dir=$(mktemp -d /tmp/wolfss_temp.XXXXXX)
+echo "Wolfssl ptest logs are stored in ${temp_dir}/${log_file}"
+
+./test/unit.test > "$temp_dir/$log_file" 2>&1  
+
+echo "Test script returned: $?"
+
+MAGIC_SENTENCE=$(grep "unit_test: Success for all configured tests." $temp_dir/$log_file)
+
+if [ -n "$MAGIC_SENTENCE" ]; then
+    echo "$MAGIC_SENTENCE"
+    echo "PASS: Wolfssl"
+else
+    echo "#### Issue with at least one test !####"
+    echo "FAIL: Wolfssl"
+fi
+NUM_FAILS=$(grep -c "Failed" $temp_dir/$log_file)
+
+exit $NUM_FAILS
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
index 009434d96..b7ff23e71 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
@@ -12,14 +12,34 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
-SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
+SRC_URI = " \
+    git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master \
+    file://run-ptest \
+"
+
 SRCREV = "00e42151ca061463ba6a95adb2290f678cbca472"
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools ptest
 
 PACKAGECONFIG ?= "reproducible-build"
 
 PACKAGECONFIG[reproducible-build] = "--enable-reproducible-build,--disable-reproducible-build,"
 BBCLASSEXTEND += "native nativesdk"
+
+RDEPENDS:${PN}-ptest += " bash"
+
+do_install_ptest() {
+    # Prevent QA Error "package contains reference to TMPDIR [buildpaths]" for unit.test script
+    # Replace the occurences of ${B}/src with '${PTEST_PATH}'
+    sed -i 's|${B}/src|${PTEST_PATH}|g' ${B}/tests/unit.test
+
+    install -d ${D}${PTEST_PATH}/test
+
+    # create an empty folder examples, needed in wolfssl's tests/api.c to "Test loading path with no files"
+    install -d ${D}${PTEST_PATH}/examples
+    cp -rf ${B}/tests/. ${D}${PTEST_PATH}/test
+    cp -rf ${S}/certs  ${D}${PTEST_PATH}
+    cp -rf ${S}/tests  ${D}${PTEST_PATH}
+}
diff --git a/meta-networking/recipes-core/images/meta-networking-image-ptest.bb b/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
index 295da982e..b6238d610 100644
--- a/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
+++ b/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
@@ -20,6 +20,7 @@ BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS_META_NETWO
 # box) and explicitly add up to 1500MB.
 IMAGE_OVERHEAD_FACTOR = "1.0"
 IMAGE_ROOTFS_EXTRA_SPACE = "324288"
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-wolfssl = "714288" 
 # If a particular ptest needs more space, it can be customized:
 #IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-<pn> = "1024288"
 

