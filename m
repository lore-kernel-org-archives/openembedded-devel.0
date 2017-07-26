Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3A082781DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 18:55:55 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 123so7524447pgj.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 11:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bJ+xti2VvJbNuZR+rTfAq/Xl5YDnMyphREmvXuAmPcQ=;
	b=Gn5D8/xXYGiNf4knyN8NTjgjXQyeERboPwRnwyDrHvqy1LZmKwKo8kSQ5fUIJe3ZIZ
	s+a/aD1Cmv0aZK7XlrjVbakL6wGVAxL9i1ZU8bANBSKTtSrZ7yDVt9ubEImhfPWsuWNk
	4RwbVY9shoUFpGuEbpxhNBUbOt49gv6eQHtLPAH73g2ELFigPmyCsK/nBYDzUQ2zSXjq
	hp1uc+/6VOXov7pEDDdl8WoRtu3MHe5vppoDD9F0i5IGFTcdov8gTeeZgAdccJZmqKsS
	3Tmlka+Gz53nurfEH1ki55llSzfyWK6y3ouTcLSOnb5wU1ejsoHCsF2ekplhkhKMXAGN
	j8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bJ+xti2VvJbNuZR+rTfAq/Xl5YDnMyphREmvXuAmPcQ=;
	b=BBvO+Qd4k66XfCh3WYpmjjGkfkMzfjJhQ4MiInKoerAciqbCSSAI8MckUDA8+p1Xwo
	DCICs/c0hlSsA8WACG2k86G4dRXjYSYwMd3OiClVS6e6/P+ZUHPdX2fWwiSatjRjIanK
	YQgQcdpTn1gT2gdYJwRrgLcT678WrkN5lGubpeVE52r3S1x5h6gT3hrKkEDcquTBJ5zT
	7LPYskMcIL993PlluwaI9HQuh+reS3s6lDMRZM8PRDeHrVbWCqXfvVvJhAL2+4TJ09gk
	wx7uXP9d38Q39Xs7lOncNJhLfPKqN6Zic5A+LVaTUPPyqM18Y657q5nhMx9IsiNwhPhQ
	SJdQ==
X-Gm-Message-State: AIVw110RZUdNA+fE1oSJpRiz7MukdE3y/F2braz2kn0qVRm1vQRnww/A
	nJYIQ2PiwCGweCDd
X-Received: by 10.99.94.66 with SMTP id s63mr1822746pgb.253.1501095357093;
	Wed, 26 Jul 2017 11:55:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	y62sm31297252pfb.3.2017.07.26.11.55.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 11:55:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jul 2017 11:55:40 -0700
Message-Id: <20170726185540.24148-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-qt5][PATCH] qtbase: Fix ptests with clang
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jul 2017 18:55:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Disable-Wformat-security-with-clang-as-w.patch | 32 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0010-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch

diff --git a/recipes-qt/qt5/qtbase/0010-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch b/recipes-qt/qt5/qtbase/0010-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch
new file mode 100644
index 0000000..77b357c
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0010-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch
@@ -0,0 +1,32 @@
+From 8284ebfe59c0011db71df7fb143b8e6a99f6952e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Jul 2017 19:40:52 -0700
+Subject: [PATCH 10/10] tst_qstring: Disable Wformat-security with clang as
+ well
+
+Currently, its only disabled for gcc, but we need to disable
+it with clang as well in order to compile it successfully with
+clang
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/auto/corelib/tools/qstring/tst_qstring.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tests/auto/corelib/tools/qstring/tst_qstring.cpp b/tests/auto/corelib/tools/qstring/tst_qstring.cpp
+index a0a872710c..20a9a9f9db 100644
+--- a/tests/auto/corelib/tools/qstring/tst_qstring.cpp
++++ b/tests/auto/corelib/tools/qstring/tst_qstring.cpp
+@@ -1066,6 +1066,9 @@ void tst_QString::acc_01()
+ 
+ QT_WARNING_PUSH
+ QT_WARNING_DISABLE_GCC("-Wformat-security")
++#ifdef __clang__
++QT_WARNING_DISABLE_CLANG("-Wformat-security")
++#endif
+ 
+ void tst_QString::isNull()
+ {
+-- 
+2.13.3
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 8464873..7b82c00 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -24,6 +24,7 @@ SRC_URI += "\
     file://0009-Disable-all-unknown-features-instead-of-erroring-out.patch \
     file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
     file://0001-Delete-qlonglong-and-qulonglong.patch \
+    file://0010-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch \
     file://run-ptest \
 "
 
-- 
2.13.3


