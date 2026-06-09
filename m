Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2C7CD6E79
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 03:29:36 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71669.1780975775617887204
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2026 20:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RUxDjZV/;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304c520fe9aso8227111eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 20:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780975775; x=1781580575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9VsLslAkFxPTXk9HFu0iytQVIUgaYfvxL54+puOwDyY=;
        b=RUxDjZV/F0dh0RblxlBMlAlrNa3NpuMYSZAYVctF5DAZtJkw9sfhMfCnkCbiLZovIv
         zkZdlT3cN+5bfaH+79EMAQ8DjxeFpSy2HB7yajh+FxjgZ8p8Htt+KytAFDsKtHb6mYEe
         ZJPNAsqsqQcp9i0y4N7HG6CPnvpu57QM3r4aWazrekkrr8b0e1I2Qft7m4EvsLVlGKoN
         aXKrPFYcnb8ksrp92bVMpqXhJL0NGmuPS9Tm4amroymBHxDvv+t73xTaWUbW5hDpUy/b
         eDnCAW9rk6Oa4vFnoL4EPa0zZfTfi3XjpcdDD7iRK9HJf7Vd1XBNMpzzJaevQKD+cOwA
         hr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780975775; x=1781580575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VsLslAkFxPTXk9HFu0iytQVIUgaYfvxL54+puOwDyY=;
        b=szRMHOGdtqgch2Toyj7ss/wmG96fxODGK98AIwyL7cuswab98W61M6x5mL9K74xmNx
         tXknLzQ3aq74W2Wlh6vSKaYAjITKdUnvseArLD/rCddndJjb0rSMbPGPQnIVN7tDq4W8
         me28tnSW/43uXE2sdI8EkQ/lITk97t5vAGcjd5aZ/R4LL2JjPsQ8eikgpAgjUPuH1jzY
         3dUg4GYmPgRgh/I2juexEWpX5cdrurOQnVsFJY+t6PgMyVstA4Osr1582rzxK2cAmXTp
         IrRMkFUDua+S2U1rDkXS3Qf2vKrP+b4gyO0U3M9CTWqxctDboAs/lOlKMWHr+b9jE3vr
         pnrg==
X-Gm-Message-State: AOJu0Ywx6u6O8JkPRlA6qE3mhB2NMq1j5Pf6su7wWh0DmJB5oWDGumu8
	kKT8aoe5gNbWcR4BUQZYCXSdMvTlrQuJPcoyAUfNH/pejiTK9NguOfnXubcmjr6zS8c=
X-Gm-Gg: Acq92OF6302HHl30EvKE88V4Sz1pMOj40EPJePRMBf57saWMvtw7JGVgFNCPah20saT
	j/PIWETV5fbEH/yNt7TH0GRMRShSBN3LcyNsh7BhqTnM7CgMxana9azirEKJmq8uJFLoWPXfYQ+
	IRyRPCtzNoaaolNc8RRDUBjDuEkPDqd3Kdi4tVR8NxnMmMJVt7xkqG1NOCEavrLlpBGgs/WZetQ
	NozwoeS6kpjQfe0C/AuTjiKspd+IY8+QqjuCC4YLQ4GU6UG4lq9kfWnGksJ5jKa7Q2ImTYQz2NF
	giW20E2iM13bsz0lEYp+yrGkKawFkzHsZERalPmTv1ehTz3TkTmhDLpUiIx+3XRnVITS751ERtg
	wFLTS72hKidt4WlQKvM8xdR5a3hpZ6cGDy9WuNiQN6O1YLWf9ulACQfnsX7C5kVe4s/XMETZw6Z
	FXVGqIC2NaunFs6jWD9tMxmHdX4fY07joMf9aQ2xhDyY6+aD/7LEQc49I8FRwFYHoDjYHjlX5AG
	U9VsPWIbJGyduOJ9zx1YQUp3/q+Cmzion4aAWYLEI4aO36CZaV7Dh9yEJajNEa8i4Mb+OMEN2i5
	vzs9uz6TybOqrt6yiEylvq6UlhPzh5m6RZKispK1uMNI68UTEHwsCKLun6/LhA==
X-Received: by 2002:a05:7300:fd14:b0:2f1:6252:f8fe with SMTP id 5a478bee46e88-3077b357c3amr10513329eec.3.1780975774686;
        Mon, 08 Jun 2026 20:29:34 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db56697sm20169643eec.2.2026.06.08.20.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 20:29:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] pegtl: Upgrade to 4.0.0
Date: Mon,  8 Jun 2026 20:29:31 -0700
Message-ID: <20260609032931.1551181-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 03:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127429

Fixes build with gcc 16 as well.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb | 23 -------------------
 meta-oe/recipes-extended/pegtl/pegtl_4.0.0.bb | 21 +++++++++++++++++
 2 files changed, 21 insertions(+), 23 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
 create mode 100644 meta-oe/recipes-extended/pegtl/pegtl_4.0.0.bb

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb b/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
deleted file mode 100644
index 4d540d0180..0000000000
--- a/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "header-only library for creating parsers according to Parsing Expression Grammar"
-HOMEPAGE = "https://github.com/taocpp/PEGTL"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dccf35ef30bf912bb07b01d469965293"
-
-SRC_URI = " \
-	git://github.com/taocpp/PEGTL.git;protocol=https;branch=3.x \
-	file://run-ptest \
-"
-
-SRCREV = "be527327653e94b02e711f7eff59285ad13e1db0"
-
-inherit cmake ptest
-
-
-do_install_ptest () {
-    install -d ${D}${PTEST_PATH}/src/test/pegtl/data
-    install -m 0755 ${B}/src/test/pegtl/pegtl-test-* ${D}${PTEST_PATH}/src/test/pegtl
-    install ${S}/src/test/pegtl/file_*.txt ${D}${PTEST_PATH}/src/test/pegtl
-    install ${S}/src/test/pegtl/data/*.json ${D}${PTEST_PATH}/src/test/pegtl/data
-}
-
-CXXFLAGS += " -Wno-error=type-limits"
diff --git a/meta-oe/recipes-extended/pegtl/pegtl_4.0.0.bb b/meta-oe/recipes-extended/pegtl/pegtl_4.0.0.bb
new file mode 100644
index 0000000000..00ab23f025
--- /dev/null
+++ b/meta-oe/recipes-extended/pegtl/pegtl_4.0.0.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "header-only library for creating parsers according to Parsing Expression Grammar"
+HOMEPAGE = "https://github.com/taocpp/PEGTL"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+SRC_URI = " \
+	git://github.com/taocpp/PEGTL.git;protocol=https;branch=main \
+	file://run-ptest \
+"
+
+SRCREV = "708de300144de0ec8bd58491facfc5f34d0d0559"
+
+inherit cmake ptest
+
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/src/test/pegtl/data
+    install -m 0755 ${B}/src/test/pegtl-test-* ${D}${PTEST_PATH}/src/test/pegtl
+    install ${S}/src/test/file_*.txt ${D}${PTEST_PATH}/src/test/pegtl
+    install ${S}/src/test/data/*.json ${D}${PTEST_PATH}/src/test/pegtl/data
+}

