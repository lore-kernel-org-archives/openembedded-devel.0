Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FD1CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 17:31:12 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.22631.1760722270769175714
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 10:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mk1dL/SD;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso1961393f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760722269; x=1761327069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5uHZFeXkhInjZRXlFCNXLiBf8Bin3CkGcE7B9IA+czI=;
        b=Mk1dL/SDoSSfUJTXL3MpoKf7ihyepxQUj0gnKnZOqhxn9t6jz01g0waUIWCaT2AMjs
         gM0oQesRn6mwbAD15WXuQA6zSKxZI3xumiE56OVXgJSpn4JfCH/W5DLqqPc/Iu1HMfA4
         x7EO/kWqyHYZgaH7nfmItACCuI9fydYAK7v3WgjN8JaicoJuPtn7S0SJ7X2hdCDV3E8L
         CKXDngTAVyPziQTVj9pB994a7IOqA8SwHieor4O7ZWsu4ZBwCN4LAEZl/nIVfGJxPQFS
         7dAwOszNDH5SlRAg2EBSO6P9nRx6bX7tWYOxdb2F99Nodqx1ZDN7kVHKPovSttStRJfo
         xVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760722269; x=1761327069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uHZFeXkhInjZRXlFCNXLiBf8Bin3CkGcE7B9IA+czI=;
        b=VFFWz4ouZME8hiCZ2+C8rwitQGEEPh6SzZ292vcnSc9wO5OK+TyPNZ5KGWIg0QCMTg
         rdxzSC+lXnfLcxmpH4w4rZ6KMVjx3JdVBMGNJ+FpE0biDmj0ROhl1YGRNYKzybg7J39W
         QRsTSdFKH/pg15Zx0FDfMFT31Uom+tNUjrzRM20tKlP/T6PPZEVJEZlUkAwYM18sqjnl
         QqH4rYyq5eIhiUjzE9YWF47DKbswauOosnwN5HKzTM/Hf6buK2E3sZqg1nir02dIiY/i
         6jOiLN0UVwjZcTFy+6iURWd1WH7LJW/nkDEFFHP6IZnpwUx9pK3K9aJaRVsX/w6Y6r1f
         cAfw==
X-Gm-Message-State: AOJu0YzaFCZwFcpmv/CLBZNqeFJ4l6hdU5OzrxVzv1lG4MyxxiKg+wMG
	p0qzBX3aA7RtZL0BLxslWbSYYCqWkRiirL3jvdZ008Y5yXg7/O9vpbfeEQ3OYA==
X-Gm-Gg: ASbGnct7vzQkuJzax6f+aNzVthfSbDvw/xplXJc7WYYKSMx+8/C0SxDn6Wk4ayvyIZ9
	2917lnfnLjosbG//auw8Ru4yXVv9HeE2eOLZM+wB0scdnsO9kbXrsWwjgmmSDaGsx9MoXPGPr9X
	LRMW/7u9R2V1Ou/CcP+wpHKrqzQcUBRVSx2wQhKeEcX4eufdZrXhHHiPob/5FAG9WX2bv1BdBH3
	XV6GGwuv4zEBmS36dhBqMhvRUK7qsmso1k7HDOBw6vXCBwmS+dc5huncIPvbhNi6G0IpKgWEbO2
	3KDMaQuXaOE+8EA6gWpmDGpMyaFj6We2BxyzkEafSYVtxFd3JyNSL69iM8+7wJMOeStPsz5Yy90
	iBRQ09XscJKwOHZmHQSBGIm9tQi7gZ6S/budobVdiPSppVDiMAuD9ypvnBoQcXSi8bcuzB1e7fg
	==
X-Google-Smtp-Source: AGHT+IF9PES2YlK5je7Lj/5NVaMnXmpP0hL6OmK5Y0SZSVlOP1f9QA0gJHlXKZQ0dorevHIaU7y93w==
X-Received: by 2002:a5d:5f48:0:b0:3ea:6680:8fb9 with SMTP id ffacd0b85a97d-42704b3dbb4mr4003208f8f.3.1760722268864;
        Fri, 17 Oct 2025 10:31:08 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce06bsm268356f8f.45.2025.10.17.10.31.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 10:31:07 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] jemalloc: include the missing shell scripts and source the corresponds shell scripts for some test cases.
Date: Fri, 17 Oct 2025 19:31:07 +0200
Message-ID: <20251017173107.2635464-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 17:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120770

From: Wentao Zhang <wentao.zhang@windriver.com>

The test cases in jemalloc require the appropriate value to be exported
to MALLOC_CONF, which is stored in shell scripts.
The privious script just ran the test cases without exporting value, causing
the tests to fail.
Include the missing shell scripts, and source them before running the test
cases now.

Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b3274b4e90fad106e2e76b48afb866d81170bd6f)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/jemalloc/files/run-ptest | 29 ++++++++++++++++++-
 .../jemalloc/jemalloc_5.2.1.bb                |  7 +++--
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/jemalloc/files/run-ptest b/meta-oe/recipes-devtools/jemalloc/files/run-ptest
index b351f947e8..5c826a1766 100644
--- a/meta-oe/recipes-devtools/jemalloc/files/run-ptest
+++ b/meta-oe/recipes-devtools/jemalloc/files/run-ptest
@@ -1,9 +1,37 @@
 #!/bin/sh
 
+export MALLOC_CONF_ALL=${MALLOC_CONF}
+# Concatenate the individual test's MALLOC_CONF and MALLOC_CONF_ALL.
+export_malloc_conf() {
+  if [ "x${MALLOC_CONF}" != "x" -a "x${MALLOC_CONF_ALL}" != "x" ] ; then
+    export MALLOC_CONF="${MALLOC_CONF},${MALLOC_CONF_ALL}"
+  else
+    export MALLOC_CONF="${MALLOC_CONF}${MALLOC_CONF_ALL}"
+  fi
+}
+
+
+
 saved_dir=$PWD
 for dir in tests/* ; do
 	cd $dir
 	for atest in * ; do
+		if [[ "${atest##*.}" == "sh" ]]; then
+			continue
+		fi
+		if [ -e "${atest}.sh" ] ; then
+		  	# Source the shell script corresponding to the test in a subshell and
+		  	# execute the test.  This allows the shell script to set MALLOC_CONF, which
+		  	# is then used to set MALLOC_CONF (thus allowing the
+		  	# per test shell script to ignore the  detail).
+		  	enable_fill=1 \
+		  	enable_prof=1 \
+		  	. $(pwd)/${atest}.sh && \
+		  	export_malloc_conf
+		else
+		  	export MALLOC_CONF= && \
+		  	export_malloc_conf
+		fi
 		if [ \( -x $atest \) -a \( -f $atest \) ] ; then
 			rm -rf tests.log
 			./$atest > tests.log 2>&1
@@ -18,4 +46,3 @@ for dir in tests/* ; do
 	done
 	cd $saved_dir
 done
-
diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
index 8618c8c6a7..f3f2a32889 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
@@ -43,10 +43,13 @@ do_compile_ptest() {
 
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
-	subdirs="test/unit test/integration test/stress "
+	subdirs="unit integration stress "
 	for tooltest in ${subdirs}
 	do
-		cp -r ${B}/${tooltest} ${D}${PTEST_PATH}/tests
+		cp -r ${B}/test/${tooltest} ${D}${PTEST_PATH}/tests
+        if find ${S}/test/${tooltest}/ -name '*.sh' -print -quit | grep -q .; then
+		    cp ${S}/test/${tooltest}/*.sh ${D}${PTEST_PATH}/tests/${tooltest}
+        fi
 	done
 	find ${D}${PTEST_PATH}/tests \( -name "*.d" -o -name "*.o" \) -exec rm -f {} \;
 }

