Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2E8C7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 04:27:07 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.13894.1684816022645359175
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 21:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WPxvIcTk;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64d1e96c082so3824129b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 21:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684816026; x=1687408026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPTkRH+ulc9rCUECGvIiByhHMQr6jKRXc7Mxuk4+kTs=;
        b=WPxvIcTkDK+hxx50uueq6uZlwJHYLyZzgieMu4dZJd/vXkg/pqyE5/Fmq3XJp6yebP
         DO0cO5kuKubof+jDNwYBChodkZmQWu1FAyQMGaKsToBEnLNq1Kl4TeouqnHz0ht/6dpv
         kEQg8Gsd+d+G2irh2x1Mfirs4dHYy/Txg7xbC9hnZgvU50MpbDoPe2V71AUdU1mdmGbt
         ylHUciA/jIOBBsjBuYGYAgcpszwnJHD/wkv7dDWa0PWjhxyfIi0ctjcdVMx+HMBx/8Y5
         lfzG02nl3r7IC9NumEMwZCRh4Ypa7Ye855Ayp+j8GPYriO/nS08DhqF89cDQ6gcy4sbw
         ZzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684816026; x=1687408026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPTkRH+ulc9rCUECGvIiByhHMQr6jKRXc7Mxuk4+kTs=;
        b=EhJN+GTo5lZPHMzR2ij2M0P9/W4/07npVp+eh0vn03SXfpbOmZCoiQdE11+WimovXw
         JTDSqrHcZ9vyABaduSlXPsHMd81os3XXwnzqoug4RUlszAEBFrD5QkK5PkBlGtAPy7Jk
         LU+s+7hGXZVjju4KDGEuZHPNgn4IyEZh1ta1GTnKnyu/Yw+ePyiDgxWVqcaKvV+8zSXt
         1OUUCDvpVmwbL24UoXAUGFTmGj+6v+RtHcw1VBNdr01I3r2rGSmR1cl6iFBI0gu966vl
         v8q1q1uaCWa1ZBg2QaqxkBDW64Pnc5RAL7K0aR4Th8vCR/vqKmKf4uiFc/2MoVepGGwt
         QICg==
X-Gm-Message-State: AC+VfDwPUxQmWtZxIIvErMwrpl+ziDwzjoygAvt37jCYgQW88Abt1bn8
	7Yagw9VEDH+VEH1c90H8iMbq2PKgJds=
X-Google-Smtp-Source: ACHHUZ7ARed2G0o6vTos1m9b1cJZ8zsHHkhALZG2cSO8R6oyXJp0/eCmqLI97PLcS3Gr2laBuS/vDw==
X-Received: by 2002:a05:6a00:13a2:b0:643:85a0:57fe with SMTP id t34-20020a056a0013a200b0064385a057femr19779299pfg.2.1684816026143;
        Mon, 22 May 2023 21:27:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id n7-20020aa79047000000b0064d2c7ac49fsm4844332pfo.31.2023.05.22.21.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 21:27:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 10/11] curlpp: Remove references to buildpaths e.g. TMPDIR
Date: Mon, 22 May 2023 21:26:57 -0700
Message-Id: <20230523042658.4159559-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523042658.4159559-1-raj.khem@gmail.com>
References: <20230523042658.4159559-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 04:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102725

Fixes
WARNING: curlpp-0.8.1-r0 do_package_qa: QA Issue: File /usr/bin/curlpp-config in package curlpp-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Remove-references-to-absolute-build.patch | 40 +++++++++++++++++++
 .../recipes-support/curlpp/curlpp_0.8.1.bb    |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/curlpp/curlpp/0001-curlpp-config.in-Remove-references-to-absolute-build.patch

diff --git a/meta-networking/recipes-support/curlpp/curlpp/0001-curlpp-config.in-Remove-references-to-absolute-build.patch b/meta-networking/recipes-support/curlpp/curlpp/0001-curlpp-config.in-Remove-references-to-absolute-build.patch
new file mode 100644
index 0000000000..539e9cefb6
--- /dev/null
+++ b/meta-networking/recipes-support/curlpp/curlpp/0001-curlpp-config.in-Remove-references-to-absolute-build.patch
@@ -0,0 +1,40 @@
+From d6eee2d52f31e034f9d84d38a749d86a63d5b769 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 May 2023 20:37:47 -0700
+Subject: [PATCH] curlpp-config.in: Remove references to absolute buildpaths
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ extras/curlpp-config.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/extras/curlpp-config.in b/extras/curlpp-config.in
+index b0bd964..1416b94 100644
+--- a/extras/curlpp-config.in
++++ b/extras/curlpp-config.in
+@@ -43,7 +43,7 @@ while test $# -gt 0; do
+ 
+     case "$1" in
+     --cc)
+-	echo @CC@
++	curl-config --cc
+ 	;;
+ 
+     --prefix)
+@@ -73,10 +73,10 @@ while test $# -gt 0; do
+        	;;
+ 
+     --libs)
+-       	echo -L@libdir@ @LDFLAGS@ @LIBS@ `curl-config --libs` -lcurlpp
++       	echo `curl-config --libs` -lcurlpp
+        	;;
+     --static-libs)
+-       	echo @libdir_static@/libcurlpp.@libext@ @LDFLAGS@ @LIBS@ `curl-config --static-libs`
++       	echo $prefix/@libdir_static@/libcurlpp.@libext@ `curl-config --static-libs`
+         ;;
+ 
+     *)
+-- 
+2.40.1
+
diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
index e36a86fd09..131f1873a2 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=fd0c9adf285a69aa3b4faf34384e1029"
 DEPENDS = "curl"
 DEPENDS:class-native = "curl-native"
 
-SRC_URI = "git://github.com/jpbarrette/curlpp.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/jpbarrette/curlpp.git;branch=master;protocol=https \
+           file://0001-curlpp-config.in-Remove-references-to-absolute-build.patch"
 
 SRCREV = "592552a165cc569dac7674cb7fc9de3dc829906f"
 
-- 
2.40.1


