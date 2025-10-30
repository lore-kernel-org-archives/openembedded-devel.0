Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBE9CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 20:06:20 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.7371.1761854770534688287
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 13:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kd8OS+cH;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-426f1574a14so1019942f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 13:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761854769; x=1762459569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=50kOvlpHCrq0zOna52SLhTqf9GVs16dizwwMc4NYEXM=;
        b=kd8OS+cHW7IFqFzXzI7DlIm5QFtclUc9PO11DJn0vzoR8BFhlbpBQ2VTvuKvgnv9jl
         pOAB9dThvoMu2In0B8ZkklGIvlMve35C8WMQnxEpLKx7FAehDhEA12W8CI6hcJ0imVBK
         uq9sq54yhTRt7XEE4NyjA1gh28rz3zwJJ+hd6jaxJ4zDBjIcc3gmW1SduQJ6ChjsjUIN
         ziwZ27Bes8BCrthC9um0wSyro4Ni+6K2a2hqU2Rf+ljmVh3IAagoRE903XIhOPco8Iyv
         +kPMG5sTnHr/KmmngDj0I4/UPrsEui21ti3CM31nRpyOcDZoqtbEX34OP/lzsGoJQknW
         XgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761854769; x=1762459569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=50kOvlpHCrq0zOna52SLhTqf9GVs16dizwwMc4NYEXM=;
        b=Ky2XooEWc7CsUSNqKK9piRJJK01+xDNtkSnyVD22TwCasZf6WqE+n4t5cSehFa5CVn
         Q3SwoqkJLGUGOul1jQzq3EwEMrEqgelT2fO+S3w4H73DzVpMOiBkPeMlDIygUasqWUGL
         KodNTx+Z4+9FBqCE/6mGANxSGOYhlp0VVizgUoitBu7XBi9qOOVMlmhIXC4JcMRgxaaM
         hRQ/ri3ydGdO+exJnkxbw65+M47G98jPQY6Yi//pFvKF421Rx7Ly5PtEJHxAIrQO8AW2
         HcA3E0qXeZ/7RtxBEdxm2yQpYRh4Zftl9R/hcGJnqG4aD+JAlKmHXi0qr9gyBTQy7gzA
         gUbA==
X-Gm-Message-State: AOJu0YyUzEacLnFekWYCUJLzgGEoUmCfuTfChL5kDaNdO/yXkb4+qX+t
	vk4t81UzqocMI4Xkvk33svoBwcwqiie1syKxsgizlEOKU9fVlpI9ey5mRTjcoBEh
X-Gm-Gg: ASbGncsPhyS5gjpCA617nNCt4iTD7K5gSGo00UoMjGpHRUUAI2mKresrUEdYJtfET5V
	ywFeIx+T9bztCAPrRc0MKKSdoizjptvO6trwcNHBQ7RS8Dg4fflDfv/CQAqzC7zaW3gVC4IhOJy
	vcxxDICMlnP6pTh4azdfIfwr6ciOYRqyH1GyrL1ZxW+DtTygaz3uHAwk/EuoYYqk6bC8zhf4HmC
	5olpMRwK7Nmgx6LwaHQC4U5yB7zGiJrqlYhMCpBayN3E9dofH79+NmpSSr2+L2gmYWTWW2gPuCb
	mzOEZd3+R0zCdrAUCoAsvRf2Qr8o/pTKcT84qs66ayT6V1JZVPB3Bx4vX0OMEaVe66SXvczJ9mE
	ZSBfK9z/ux+irCYFruugN9CKIjryLEN/jF4BaUDDreOCjbDr7q39oKobbF98FDIaAaDV8Qdz0YQ
	==
X-Google-Smtp-Source: AGHT+IFQnkTybmeepwNSPZ3bHeNN9bC+XIoS+1O92ekWhkKMzQ+Iildu3RM0/UO/ZFEMTR7W7aUYww==
X-Received: by 2002:a05:6000:2211:b0:427:928:7888 with SMTP id ffacd0b85a97d-429bd6adbf3mr677288f8f.55.1761854768514;
        Thu, 30 Oct 2025 13:06:08 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477289a5932sm59942605e9.6.2025.10.30.13.06.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 13:06:08 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] ostree: fix ptests
Date: Thu, 30 Oct 2025 21:06:07 +0100
Message-ID: <20251030200607.386936-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 20:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121210

1. Fix tests that output colored text but try to verify uncolored text - filter the
   output through "tee" to remove coloring.
2. Add missing dependency
3. Fix a test that fails when C.utf-8 locale is not available on the machine (patch submitted upstream)
4. Enable network connection by setting a nameserver in resolv.conf

While execution is possible, it still requires both ostree and busybox to be compiled statically.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-extended/ostree/ostree/run-ptest  |  13 ++-
 ...locales-in-remote-gpg-list-keys-test.patch | 102 ++++++++++++++++++
 .../recipes-extended/ostree/ostree_2021.6.bb  |   2 +
 3 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/tests-account-for-different-locales-in-remote-gpg-list-keys-test.patch

diff --git a/meta-oe/recipes-extended/ostree/ostree/run-ptest b/meta-oe/recipes-extended/ostree/ostree/run-ptest
index 963d1f6928..adcb278acb 100644
--- a/meta-oe/recipes-extended/ostree/ostree/run-ptest
+++ b/meta-oe/recipes-extended/ostree/ostree/run-ptest
@@ -1,3 +1,14 @@
 #! /bin/sh
 
-gnome-desktop-testing-runner libostree
+if ! nslookup openpgpkey.test.com; then
+    mv /etc/resolv.conf /etc/resolv.conf.bak
+    echo "nameserver 8.8.8.8" > /etc/resolv.conf
+    trap "mv /etc/resolv.conf.bak /etc/resolv.conf" INT EXIT
+fi
+
+# The tests use terminal colors when the output is a tty. This is a problem, because the tests
+# check the output of some commands, which might be colored - and the regex used for matching does not
+# account for the colors. This seemingly useless tee is here to get rid of the colors. (The application
+# doesn't respect the NO_COLOR envvar and doesn't seem to have other options to disable coloring)
+
+gnome-desktop-testing-runner libostree | tee
diff --git a/meta-oe/recipes-extended/ostree/ostree/tests-account-for-different-locales-in-remote-gpg-list-keys-test.patch b/meta-oe/recipes-extended/ostree/ostree/tests-account-for-different-locales-in-remote-gpg-list-keys-test.patch
new file mode 100644
index 0000000000..1b0d9fbed4
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/tests-account-for-different-locales-in-remote-gpg-list-keys-test.patch
@@ -0,0 +1,102 @@
+From 9060221fa24ee2d53de416ee4fa15dd5d3668123 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 30 Oct 2025 13:43:20 +0100
+Subject: [PATCH] tests: account for different locales in remote-gpg-list-keys
+ test
+
+During test preparation in libtest-core.sh either C or en_US locale
+is set for the test execution.
+
+The remote-gpg-list-keys compares outputs that contain locale-dependent
+dates, but the current test case expects the result to be in C locale.
+
+However in case C.utf-8 locale is not available, but en_US.utf-8 locale
+is available, then the latter will be used, and the testcase will fail,
+because it expects dates to be in this format:
+
+Tue 17 Mar 2015 02:00:32 PM UTC
+
+However with US locale it receives the date like this:
+
+Tue Mar 17 2015 02:00:32 PM UTC
+
+This change converts these dates to the current locale before comparing
+the expected gpg key content with the received one.
+
+Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/3545/commits/9060221fa24ee2d53de416ee4fa15dd5d3668123]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/test-remote-gpg-list-keys.sh | 32 ++++++++++++++++++++----------
+ 1 file changed, 22 insertions(+), 10 deletions(-)
+
+diff --git a/tests/test-remote-gpg-list-keys.sh b/tests/test-remote-gpg-list-keys.sh
+index de24bf4da2..a697ecce54 100755
+--- a/tests/test-remote-gpg-list-keys.sh
++++ b/tests/test-remote-gpg-list-keys.sh
+@@ -61,14 +61,19 @@ echo "ok remote with global keyring"
+ # Import a key and check that it's listed
+ ${OSTREE} remote gpg-import --keyring ${TEST_GPG_KEYHOME}/key1.asc R1
+ ${OSTREE} remote gpg-list-keys R1 > result
+-cat > expected <<"EOF"
++
++# In different locales the date is returned differently
++# Convert the known Creation date to the current locale.
++EXPECTED_DATE=$(date -d "Tue Sep 10 02:29:42 2013" "+%c")
++
++cat > expected <<EOF
+ Key: 5E65DE75AB1C501862D476347FCA23D8472CDAFA
+-  Created: Tue Sep 10 02:29:42 2013
++  Created: $EXPECTED_DATE
+   UID: Ostree Tester <test@test.com>
+   Advanced update URL: https://openpgpkey.test.com/.well-known/openpgpkey/test.com/hu/iffe93qcsgp4c8ncbb378rxjo6cn9q6u?l=test
+   Direct update URL: https://test.com/.well-known/openpgpkey/hu/iffe93qcsgp4c8ncbb378rxjo6cn9q6u?l=test
+   Subkey: CC47B2DFB520AEF231180725DF20F58B408DEA49
+-    Created: Tue Sep 10 02:29:42 2013
++    Created: $EXPECTED_DATE
+ EOF
+ assert_files_equal result expected
+ 
+@@ -85,28 +90,35 @@ echo "ok global no keyring"
+ OSTREE_GPG_HOME=${trusteddir}
+ ${OSTREE} remote gpg-list-keys > result
+ OSTREE_GPG_HOME=${emptydir}
+-cat > expected <<"EOF"
++
++# In different locales the date is returned differently
++# Convert the known Creation date to the current locale.
++EXPECTED_DATE=$(date -d "Tue Sep 10 02:29:42 2013" "+%c")
++EXPECTED_DATE2=$(date -d "Tue Mar 17 14:00:32 2015" "+%c")
++EXPECTED_DATE3=$(date -d "Tue Mar 17 14:01:05 2015" "+%c")
++
++cat > expected <<EOF
+ Key: 5E65DE75AB1C501862D476347FCA23D8472CDAFA
+-  Created: Tue Sep 10 02:29:42 2013
++  Created: $EXPECTED_DATE
+   UID: Ostree Tester <test@test.com>
+   Advanced update URL: https://openpgpkey.test.com/.well-known/openpgpkey/test.com/hu/iffe93qcsgp4c8ncbb378rxjo6cn9q6u?l=test
+   Direct update URL: https://test.com/.well-known/openpgpkey/hu/iffe93qcsgp4c8ncbb378rxjo6cn9q6u?l=test
+   Subkey: CC47B2DFB520AEF231180725DF20F58B408DEA49
+-    Created: Tue Sep 10 02:29:42 2013
++    Created: $EXPECTED_DATE
+ Key: 7B3B1020D74479687FDB2273D8228CFECA950D41
+-  Created: Tue Mar 17 14:00:32 2015
++  Created: $EXPECTED_DATE2
+   UID: Ostree Tester II <test2@test.com>
+   Advanced update URL: https://openpgpkey.test.com/.well-known/openpgpkey/test.com/hu/nnxwsxno46ap6hw7fgphp68j76egpfa9?l=test2
+   Direct update URL: https://test.com/.well-known/openpgpkey/hu/nnxwsxno46ap6hw7fgphp68j76egpfa9?l=test2
+   Subkey: 1EFA95C06EB1EB91754575E004B69C2560D53993
+-    Created: Tue Mar 17 14:00:32 2015
++    Created: $EXPECTED_DATE2
+ Key: 7D29CF060B8269CDF63BFBDD0D15FAE7DF444D67
+-  Created: Tue Mar 17 14:01:05 2015
++  Created: $EXPECTED_DATE3
+   UID: Ostree Tester III <test3@test.com>
+   Advanced update URL: https://openpgpkey.test.com/.well-known/openpgpkey/test.com/hu/8494gyqhmrcs6gn38tn6kgjexet117cj?l=test3
+   Direct update URL: https://test.com/.well-known/openpgpkey/hu/8494gyqhmrcs6gn38tn6kgjexet117cj?l=test3
+   Subkey: 0E45E48CBF7B360C0E04443E0C601A7402416340
+-    Created: Tue Mar 17 14:01:05 2015
++    Created: $EXPECTED_DATE3
+ EOF
+ assert_files_equal result expected
+ 
diff --git a/meta-oe/recipes-extended/ostree/ostree_2021.6.bb b/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
index b186ba1480..679fd74234 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
@@ -19,6 +19,7 @@ DEPENDS = " \
 
 SRC_URI = " \
     gitsm://github.com/ostreedev/ostree;branch=main;protocol=https \
+    file://tests-account-for-different-locales-in-remote-gpg-list-keys-test.patch \
     file://run-ptest \
 "
 SRCREV = "f1155c8d283c3c85d74d5e1050b0dcf8198f750a"
@@ -196,6 +197,7 @@ RDEPENDS:${PN}-ptest += " \
     util-linux \
     xz \
     ${PN}-trivial-httpd \
+    ${PN}-switchroot \
     python3-pyyaml \
     ${@bb.utils.contains('PACKAGECONFIG', 'gjs', 'gjs', '', d)} \
 "

