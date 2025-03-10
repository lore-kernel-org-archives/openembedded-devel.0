Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BBDC28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 12:23:17 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.33376.1741597666221187112
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yIqJI1eX;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: sofiane.hamam@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3911748893aso2417232f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741597664; x=1742202464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aqYt+oOnaSP6I404FwWrZMH12P0l4SA7HXfpTxlTDGc=;
        b=yIqJI1eXMkVfYhLZNgp9+hBRsQez2riht3gaGLqmS1xy4z2dFpv2k+HL+qAHnQficf
         1dqXxTVufRA/vD3ghnNMzb+QphRDj4APGGXZyefmU3fD1hhJHDdLS9AXidFdP83FANCW
         RPVFTudpYBCzysuCCCRyrG7ORALqWl8jcDPlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741597664; x=1742202464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqYt+oOnaSP6I404FwWrZMH12P0l4SA7HXfpTxlTDGc=;
        b=h1fOCdE06GmRDNQK079CoHfrF3/7SserXN4/SNiQ2pw3Fc34gY/SV3+HtXUBU4oDa7
         rE1Ag4u4WmKEl/d9A7BnbRbqSJB7hpAMaVXXbq0cG20ya4bIp2GTuThAOUtXKn0z2MB+
         qBvZu+jFjto/EnSiYBq5NOVFZ0YgyvQxMShZ88SMiI0FRNPKXFW5JytcezscDtaiEb5p
         LKvZOm0NHa5NZeUIiInimfxGiBYAmiO2HHc79E8EFvIfAY/TBw1OPmXVKqGy7JFWx3aU
         sJl6M+Lt2NUBLYEYcuJFnX8b5PVn77pfDz0XgbK+0Hu0kPvYxyqDNnZmK4+j7OY61dRn
         xwFQ==
X-Gm-Message-State: AOJu0YyTSVWTVW+i1k3NY+y2+midNrqeUo3Wl5y3iv4ozl7tF8GKBGBS
	OJx820zoEOV80XNV1B1wbU/EkL5qNTFN1hmNRjo9EQmLBo2CSvnyQwm6GUBzwTyX59+JzFo4Xpp
	T
X-Gm-Gg: ASbGncuhJsjesvi/lA+M/RZJzgsYt4XYPNkaouRFQYq03U/MJjgCEP8Tlfp6q0lJpyu
	iCA+iQP/7oVjvhZzrVofarFaEInEGrsqzvcTqj4AbaaNnqlSIuq/EhwdQVdK35n7TZuVhA1IfZz
	vzcRUmmH0jb9qvLIS+3PtdlqNavR9RHHAdOlXK/xFtw19E4l7LWD25Y8vw4KCxi5E+1Xnt7/Srl
	6qbg38ZTqcP7zLqVSl0m5jmC3kflyD161lGjwnn56PcsQmXtGvkIOxkm4HTTtk7vQI0AE5wFHem
	+c9o2dNafc3CDFCXiEYGVRstY6gbvqiHIqS/E9BdQX1sr6eiS27upGLYiWKkPHBE6Er4lg1yZTq
	98OsEXleeRvz8EZdd9AphN5rEBX9GokClgZFAGDKT+RkncNE6MulN8A==
X-Google-Smtp-Source: AGHT+IHnS3Tbdg2LTm0VtsdHUoXd3ISAr1m63P3DTmDjxax+yEcvhBmUFyiKPdAtN0pIDr0C/YckAA==
X-Received: by 2002:a5d:47cd:0:b0:391:300f:7474 with SMTP id ffacd0b85a97d-39132d8b726mr7976447f8f.18.1741597664509;
        Mon, 10 Mar 2025 02:07:44 -0700 (PDT)
Received: from FRSMI25-BPYTOP.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0193bfsm14440776f8f.55.2025.03.10.02.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:07:44 -0700 (PDT)
From: "Sofiane HAMAM" <sofiane.hamam@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Sofiane HAMAM <sofiane.hamam@smile.fr>
Subject: [meta-networking][scarthgap][PATCH 1/2] Wolfssl: add ptest
Date: Mon, 10 Mar 2025 10:06:52 +0100
Message-ID: <20250310090653.2985649-1-sofiane.hamam@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 12:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115831

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
 .../wolfssl/wolfssl_5.7.0.bb                  | 23 ++++++++++++++++--
 .../images/meta-networking-image-ptest.bb     |  1 +
 4 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/run-ptest

diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
index 7ec6f9063..c3a2202de 100644
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
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb
index 47c14dd1a..119d76abb 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb
@@ -12,11 +12,30 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
-SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
+SRC_URI = " \
+    git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master \
+    file://run-ptest \
+"
 SRCREV = "8970ff4c34034dbb3594943d11f8c9d4c5512bd5"
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools ptest
 
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
 

