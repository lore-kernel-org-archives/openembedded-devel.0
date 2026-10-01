Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6198CA5FD2
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 20:14:17 +0000 (UTC)
Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20678.1790885648328020913
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 13:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Sv9Z5Jqt;
 spf=pass (domain: gmail.com, ip: 74.125.229.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bb8b31660so2089643eec.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 13:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790885648; x=1791490448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6bxDzr7vwdJym53rdpoS6oQHL0pRG380Rr4WbqTSps=;
        b=Sv9Z5JqtNLg1FsaW7a8QzKyIWARKQSpoaOrBKWtMwVXtfBvp9hEylbGxvDb4ZehJZ/
         NOvOKesrPCL0YI+juCRq+PlXThvFwnpA2a8s7s8awNzaQ3s2dHGvyHikrv7dv8JsLX0v
         zdbrDMV/rSxILHbY4hZDwY9gBl5Ym/OBxBsBDwx+J8KBmJtmVrcApAHAUImyHtl0henw
         z7dot28PJqiL9zmnW/bNwRCa975LWGN6jzxLA/cpLZ+PSxmalblX9OKtvE4mM9UEmyL2
         WUg3TZZMCC6YBOcvafJg6Kl3FGumUVpUak1nXPyXsc0ABGUh6evYtELgwtuFNqg8aOF/
         o18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790885648; x=1791490448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6bxDzr7vwdJym53rdpoS6oQHL0pRG380Rr4WbqTSps=;
        b=tdt/fn7M0vu3zqg3eQ+YREsmyWH+pd7fR9s9n/XdaryIJFtrmmD6IKYYuQf1tTQKAH
         PuEeFbL7B/lKpb+TLXR7sfyzbtFl/5LT6QGgTheFJrFOOb3E2YTYz0ehJou+m0vD2NQU
         GoYUH4rYM48NCs7fijjcsIQlrgXH08MSNigBEF1opPiDo8vwvO32EYLq5s34jWAIdf10
         MbmJWQQ7Aec/S3/krAvMsPz7Ofaa81Erp5btIdeI6esgTacLv6tHu6PUqdW97E3D0wS8
         GN3qOh4k0emzC0HGKedPd6Vn7GOg6JRotbshuXfPW8VjoG5a49pfLUxbj+CFf33FpFTD
         3onQ==
X-Gm-Message-State: AFq9FYI/L+c3KauFtORGldG4B2DleBKy3VXWPu4oR6M7GAXVFxTcJ71n
	1CSjaeS9TPWS89o/pGnwDr+po/67gBR7Q6O02b5F9itRRKOifprj0rCWnjXqgw==
X-Gm-Gg: AYBFou0WJ51u1S93rNt7zHndbGqhwhqIc82KuzVsBcm0JtCVl2LnbI0wf4ws3TqHT1B
	9nLnY8YxlBhEJZB+W8eMFhLYaXpi58DTRw0fjYW8o9ZvFPh8B83qjKKL8kYrbrW/TqQ8nFjKpJA
	YVrIJrQrbFdKEc/I9Su9Uq8MyxCgJfdc+4mBhm6BsmdLVGa0u09Bx7+ppEuOct0hhpWT4GH3dgD
	0/Zm6qLVSjTy/4JLD9zg6PPY0WRGACvdp0XXvzgEmI+Szw0NEHStbod1gSDS4c8AFa+9ZFx64FH
	c/hQzqzZ5olvWG2BZxAqLlPJCM57Q+jHRZ9AqkSjZLTlJOZpw2ge0LAtSlJypOzEiJO/CvkaiEo
	AY04aT8+ZPq7EQMTG72drL2qvN+HKzljFEDxNnIn4RQY7AACNyGULX6BT0JjmyqLoBxlWq/Z3c0
	dKPYNvJ70M4T1I1Jri0aEZPIFN6p7vsUC3E7rut37P3Dsa2WEhUNEjeWKEWkmxWIojS0W1KmNf4
	1OeeeP4shN6iU97b8aDjdKvHm6PzeePG9Hus//yu/lPxIOu50ursmJW6DBhXPw1MfwrMsJ4oDp2
	76PB8xirT6oaigabehHBovGLRRAoKzZ9W5g+48Y6YlYcnIdOni34/7hU7wWwzl5BTLisXinrfpN
	F5Y0ZMQBNKgjNlOEyS1nghYkRnep6j4FgtE4rGx8a9ylFqeIHiojM27o/vCSm3gJ0xsKUP3QnOG
	3qZtRBj0uEZfn8GdF6GQ+V6TzKpE0aWLyVBNyKlQ==
X-Received: by 2002:a05:693c:66ce:10b0:33b:a766:ea6a with SMTP id 5a478bee46e88-34f2198158fmr395002eec.32.1790885647545;
        Thu, 01 Oct 2026 13:14:07 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fdfc58sm528055eec.24.2026.10.01.13.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 13:14:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] librelp: Skip tls-ossl-connect-failure-vg.sh when libtool is missing
Date: Thu,  1 Oct 2026 13:14:03 -0700
Message-ID: <20261001201404.3518829-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 20:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130600

The test added in 1.13 runs the sender through ${srcdir}/../libtool,
which only exists in the build tree. In ptest the sender cannot start
and the test fails with exit status 127. Skip it like the other valgrind
tests already do when libtool is not available.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ssl-connect-failure-vg.sh-without-li.patch | 36 +++++++++++++++++++
 .../recipes-extended/rsyslog/librelp_1.13.bb  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-tests-skip-tls-ossl-connect-failure-vg.sh-without-li.patch

diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-skip-tls-ossl-connect-failure-vg.sh-without-li.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-skip-tls-ossl-connect-failure-vg.sh-without-li.patch
new file mode 100644
index 0000000000..903c6a5bcc
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-skip-tls-ossl-connect-failure-vg.sh-without-li.patch
@@ -0,0 +1,36 @@
+From 1bd587299f7578f4e08242eb45282933b8c10b36 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 1 Oct 2026 10:31:31 -0700
+Subject: [PATCH] tests: skip tls-ossl-connect-failure-vg.sh without libtool
+
+The test runs the sender through ${srcdir}/../libtool, which only exists
+in a build tree. When the test suite is installed and run elsewhere, as
+with ptest, the sender cannot be started and the test fails with:
+
+  tls-ossl-connect-failure-vg.sh: line 22: .../tests/../libtool: No such file or directory
+  unexpected sender exit status 127 (expected authentication failure)
+
+The other valgrind tests already skip in this case through
+startup_receiver_valgrind(). Skip this one as well.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/tls-ossl-connect-failure-vg.sh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tests/tls-ossl-connect-failure-vg.sh b/tests/tls-ossl-connect-failure-vg.sh
+index d67378d..08bf018 100755
+--- a/tests/tls-ossl-connect-failure-vg.sh
++++ b/tests/tls-ossl-connect-failure-vg.sh
+@@ -9,6 +9,10 @@ if ! ./have_tlslib "openssl"; then
+ 	echo "OpenSSL support is not available"
+ 	exit 77
+ fi
++if [ ! -x "${srcdir}/../libtool" ]; then
++	echo "libtool not available, cannot run under valgrind"
++	exit 77
++fi
+
+ export errorlog="error.$LIBRELP_DYN.log"
+ export TLSLIB="-l openssl"
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.13.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.13.bb
index 479905f728..b7d64fcb9d 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.13.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.13.bb
@@ -8,6 +8,7 @@ DEPENDS = "gmp libidn zlib"

 SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=main;tag=v${PV} \
            file://run-ptest \
+           file://0001-tests-skip-tls-ossl-connect-failure-vg.sh-without-li.patch \
 "

 SRCREV = "bedc657e519568b25f611c8efc83eab6ac1068e9"

