Return-Path: <ghidoliemanuele@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31B2CCD1A2
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 10:40:59 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.12387.1760697658960693241
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 03:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g13B6aDA;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: ghidoliemanuele@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so17330285e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 03:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760697657; x=1761302457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/lc90qXOmA1qRmfL7Bo2xMu6I0sg8pJOg28EKO5Sa0=;
        b=g13B6aDAcHpHUrebyqfDWVqJ5dF/d4gy88zsmk+BFxzS+PCcU6J6ATu93OT42kqQP5
         Pxrul1/3Htf123aYAGHj9+M1VDDG0efcrhN3qFm82/psYarQs+JrPWrFCOxuqqYYnlTE
         IySekzVjGbxwOza2hKRDwDiZbGTLnijmKtiXCcTrQ2EyG9VHEKJiNOC34cDUAtLqcBnD
         +PX6GSOfzK17yT6JuaSoheBBmc42k1WD3FrqNb2FKeEQrZDfb74s7DFSBF4uk6ue8ezP
         DBK2++00pPVAf0EylfP7BsQQE9sJZD6M1dfWNmgYfK3n3dpV/ImaIXDn1faEqd8x3Xe2
         cVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760697657; x=1761302457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/lc90qXOmA1qRmfL7Bo2xMu6I0sg8pJOg28EKO5Sa0=;
        b=i2uG0kS3XQN6soOBDK27OmweO+kdXEHkpzW5hEtDyl3evuQbw/iKEqlgDc2oIEx3Ie
         TfRocm1EJMrNuiVpzRF/fs2kguVYNppS0WNZUILd/w7x56LfL90n37iB8mIrcjJqZhBo
         ErwKP1EjcamoWhkjVDcXdEXGIIjcXq8da6wDWIgcK14ECmdeJpGk5YMVkXb82Rr3FcX/
         e+OqR3DcvEUiOjYdq71n5rg3uvgIxjTWtzp4hnNm7KvvhhxNrPaa1CK+xp2NfgdEQcAS
         eQCmOxzAZM0zb3wkjxBR4QlDZVpHDg4MFlCtPk8v+HgIzuS3cHKz/Kl1NgYl88X0z3AG
         VAOg==
X-Gm-Message-State: AOJu0YxJs5GURZ9qywpgY/C2uYlMr97WGT/1Yg/KmHElcKEMSu2Dgl+J
	Tg5L8G0cC5+3QeWFr/yhiDOrny/ZH9F76MUnH3LAvd8oXg+r62kRd/MfuKUuUREX
X-Gm-Gg: ASbGncu3etP1IbWLPVElqR6JloNvmiJCr34+0Jj0nacTlEz9oVyoG2Po1+bcUOfq/K9
	ocWatirmzXXOadAOCJDI5rbPeRkqljnGD3iSVrD8mpviQDv5AjDcV+fq/gIy/aw05anOljaJei7
	UF6/3LGDQ1K8qxNckZvLUwnvleBc/p5gVGYZIMTKuPYkI5S2fFXa6g6ZVHSnCnduHoLJ+ExaSVx
	yjOlhhCSN6AZUjUxcg+nK57U9XlxuGI2QQWF+p3VLxjq5Z9Gg6M2wihNJblHkK0Jim8PPmDsxwW
	/oqh7qxJSdeE/ULshMv2myqZ/+BWxEi+Uqu6kmpWBxuU3kfuRQxwUZPjkQRBaUHs1FlCsBSz34w
	3qNm9fZZ0JJuqshvusi2rUZGMgBjtDz3sIsvckl25Cbkdrd8hGy75cFiJuo5btumAI+/FIkBgSP
	iWvQKwe6xleJda9ENdHtHEmm1TRx4UORc61cr6Bub9ug==
X-Google-Smtp-Source: AGHT+IHha/1tB/NoF7OsfIiwBP7qs/HhxT/TBcqdxFmI+3CevnbO+NLYSOEV6WbO4YH2hCYlFZbJiw==
X-Received: by 2002:a05:6000:2911:b0:426:da92:d390 with SMTP id ffacd0b85a97d-42704d83ce7mr2323362f8f.10.1760697656804;
        Fri, 17 Oct 2025 03:40:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:aac:705d:ae36:2eb:35ce:6a7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42701a5f83bsm7799094f8f.16.2025.10.17.03.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:40:56 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: [meta-oe][master][PATCH 1/2] linux-serial-test: add patch to fix returned error code
Date: Fri, 17 Oct 2025 12:40:51 +0200
Message-ID: <20251017104053.2983626-2-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017104053.2983626-1-ghidoliemanuele@gmail.com>
References: <20251017104053.2983626-1-ghidoliemanuele@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 10:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120749

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

After commit 392f0f0ea76d ("linux-serial-test: Bump SRCREV to allow CMake 4+ compatibility"),
the behavior of linux-serial-test changed: it now returns 125 instead of 0
when the number of read characters differs from the written ones.

This patch fixes that regression.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 ...erial-test.c-fix-returned-error-code.patch | 62 +++++++++++++++++++
 .../linux-serial-test_git.bb                  |  4 +-
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch

diff --git a/meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch b/meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch
new file mode 100644
index 000000000000..91fdcf07ad63
--- /dev/null
+++ b/meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch
@@ -0,0 +1,62 @@
+From 1add8f3d228368665c3abd452640b91a86f41976 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Mon, 4 Aug 2025 14:57:22 +0200
+Subject: [PATCH 1/2] linux-serial-test.c: fix returned error code
+
+_cl_no_rx/_cl_no_rx are true in two cases, first when the relevant
+command line paramter is set and second when a rx or tx time is set
+and that time expired.
+
+This fixes the second case in a loopback test. With the change the
+application now correctly returns 125 if the number of written and
+read chars differ.
+
+E.g. `./linux-serial-test -o2 -i3 -b 115200 -p /dev/ttyS1 ; echo $?`
+returns now 0 with a loopback and 125 without, before it returned 0
+with or without a loopback.
+
+Upstream-Status: Submitted [https://github.com/cbrake/linux-serial-test/pull/61/]
+Fixes: 4e57f58c58ae ("compute error count valid when no_tx or no_rx")
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
+---
+ linux-serial-test.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/linux-serial-test.c b/linux-serial-test.c
+index d8f66c16c72f..c2c8882d601b 100644
+--- a/linux-serial-test.c
++++ b/linux-serial-test.c
+@@ -55,6 +55,8 @@ int _cl_loopback = 0;
+ int _cl_dump_err = 0;
+ int _cl_no_rx = 0;
+ int _cl_no_tx = 0;
++int _cl_no_rx_param = 0;
++int _cl_no_tx_param = 0;
+ int _cl_rx_delay = 0;
+ int _cl_tx_delay = 0;
+ int _cl_tx_bytes = 0;
+@@ -442,9 +444,11 @@ static void process_options(int argc, char * argv[])
+ 			break;
+ 		case 'r':
+ 			_cl_no_rx = 1;
++			_cl_no_rx_param = 1;
+ 			break;
+ 		case 't':
+ 			_cl_no_tx = 1;
++			_cl_no_tx_param = 1;
+ 			break;
+ 		case 'l': {
+ 			char *endptr;
+@@ -745,7 +749,7 @@ static int diff_s(const struct timespec *t1, const struct timespec *t2)
+ static int compute_error_count(void)
+ {
+ 	long long int result;
+-	if (_cl_no_rx == 1 || _cl_no_tx == 1)
++	if (_cl_no_rx_param == 1 || _cl_no_tx_param == 1)
+ 		result = _error_count;
+ 	else
+ 		result = llabs(_write_count - _read_count) + _error_count;
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
index 888b13e2f6fa..66511bd9c312 100644
--- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
+++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/cbrake/linux-serial-test"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSES/MIT;md5=544799d0b492f119fa04641d1b8868ed"
 
-SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master \
+           file://0001-linux-serial-test.c-fix-returned-error-code.patch \
+"
 PV = "0+git"
 SRCREV = "1a81f3c7be086ee01a9be8589a606426276c86d5"
 
-- 
2.43.0


