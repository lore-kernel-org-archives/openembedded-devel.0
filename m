Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29135E93808
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 23:41:57 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.260876.1776037311004045092
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2026 16:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CNEtHfDf;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2d7bdb5ffffso2670396eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Apr 2026 16:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776037310; x=1776642110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ugo7SHj8tFpovRlOU4xFTZn33szVVfAX+E11uYqofk=;
        b=CNEtHfDfoS6xqkkgBExPdNf5WOZtjCpRIivkLHD6m9XYClv3MfvBtn8NBN/AAVopG2
         I9GgJCtbdGiotQI3TNvnJTDpY3cgFb+K4Wae/LR2FfWI8Lc31LCgt2cbLv5kkT0NS7B4
         9tSZKh/eKfba5VUqEXeTbOK7+CdHrnpBTB7VND0k/2BQ8bqwZrypJxB4EeyZuJlA2OUZ
         3kMXmDdaTMFLloa40lYztE/JSmiPHGyARegVpZme3JolW5OIvXj37Fx/jnUDl5E37p1Y
         4oOZzV6aYLRwqPKI3JwvDr0KwMEJeqivKcQ3AJ/iSOYjMPQ1j4yIpiBa6ucyTPkYsIOM
         CHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776037310; x=1776642110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ugo7SHj8tFpovRlOU4xFTZn33szVVfAX+E11uYqofk=;
        b=g2qBLu3wJzY40C4Awkt7+pznTZU+MbCdiINvHa5jWXjRmxYnh16BgXbs1904v28nvt
         ddpaKGxonaFsDPTvLnQihCDyb4nneDFlb4Ff+2Rpgx87E+jX0PmyFw+/0FxO2Anav7NY
         hd7EuWrLc+AAjatsdEcPqXgEf7zpIfFAyxC4qzpoZM0wkwG6J4SHh8pgVoFnG1PE8MJZ
         F6Nqq0Xdt2ZXXzIXhdWMhxIT/lgurqFKKq1YgwUpIWer74vSfnUTlI3NHV+yWAWVO4z5
         Uum2IxYP2C5rp4DzW/e/5AlHxDkDthmveZmQtXJSPX+rDAt6b9zzsYT9FbD3qXYZs32A
         ZFoQ==
X-Gm-Message-State: AOJu0Yx+7GN2CXDwb/X1g+IsZLTmPCVX8QdO0NKcSPASvbNIriOtIRXE
	DwR1ZlzzOe6Tv7LTFIXZkgstmKIfwwgFLLV/IM+G9AhtVVDggJdbF9qVke1ELfVm
X-Gm-Gg: AeBDiev8NVSoT7Wq/4OeKUrp8faGUeHF01XNeyvcKztyDo0CRw+fuFHqUku3GBEodNe
	WmWbLocGHZim+wcvtp71C1ik/GxDRU/ME8OgNkZxPeL/7ozwEyh+vnx+8zYtWIAtyUNTMvz0D4C
	99jSw1fPfpfGmj9RSzKG+iKyVXFqCUe+vtqZvF5L0JOlCNgJwqEscTxGh+blCBAcAu4gOdaE9SM
	SvybtCU6r4qeIpGQxvmiBnQHyntSBMllD3nON9pUXfUjQh6ai33msOc8AxnpzaCodnMZMJ1YYgo
	hx48FEsTZKUOP739q7dS4WOw4Ol6Trnh7Nh72qTuGbOx/vSOLEjRor/tDhpS2xHFsT+i76uXRIw
	tKkaveMFcDsaijbwGdleuE6OYCrO0MT/QstlFv8Vo+k/iB77PlCTdSQJKqyUj+SbwFdoidYDm6I
	jZCsDMFbQ1KjUPQYvo6lcKxdDQ4dOuRvaUzpGD/IQ5PXNVTa3LAqlId+KiEbw0OsCzvpd4ii9hW
	SitJ24odoRqxxm5zwwRL0uazTQBFnwMyF5xswTw7xkYyva1UOQnQWMLfMdVezaBsTr331rBn45X
	EK/mEebaVdHxVTmpXWse1/XhL17gRtqCXKlYvaCQ/Bl6JOyHhMI=
X-Received: by 2002:a05:7301:470e:b0:2d8:1efe:51dc with SMTP id 5a478bee46e88-2d81efe56c0mr1386390eec.6.1776037310021;
        Sun, 12 Apr 2026 16:41:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d851e5bb3csm5348617eec.1.2026.04.12.16.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 16:41:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH] netperf: Fix build with std=gnu23
Date: Sun, 12 Apr 2026 16:41:47 -0700
Message-ID: <20260412234147.3378566-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Apr 2026 23:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126263

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-sendfile_tcp_stream-signature-from.patch | 25 +++++++++++++++++++
 .../recipes-support/netperf/netperf_git.bb    |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-networking/recipes-support/netperf/files/0001-cleanup-modernize-sendfile_tcp_stream-signature-from.patch

diff --git a/meta-networking/recipes-support/netperf/files/0001-cleanup-modernize-sendfile_tcp_stream-signature-from.patch b/meta-networking/recipes-support/netperf/files/0001-cleanup-modernize-sendfile_tcp_stream-signature-from.patch
new file mode 100644
index 0000000000..4e8731fb25
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/0001-cleanup-modernize-sendfile_tcp_stream-signature-from.patch
@@ -0,0 +1,25 @@
+From ea9ce6ae6154660f2a1dc7a73aedf906cc935a72 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 12 Apr 2026 16:38:28 -0700
+Subject: [PATCH] cleanup: modernize sendfile_tcp_stream signature from K&R to ANSI C style
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/nettest_bsd.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/nettest_bsd.c b/src/nettest_bsd.c
+index 36f5810..e7feb83 100644
+--- a/src/nettest_bsd.c
++++ b/src/nettest_bsd.c
+@@ -4270,8 +4270,7 @@ Size (bytes)\n\
+    all it knows, nothig is different. */
+
+ void
+-sendfile_tcp_stream(remote_host)
+-     char	remote_host[];
++sendfile_tcp_stream (char	remote_host[])
+ {
+
+   char *tput_title = "\
diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index d5a717b0f6..8f49a7596b 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/HewlettPackard/netperf.git;branch=master;protocol=ht
            file://0001-Makefile.am-add-ACLOCAL_AMFLAGS.patch \
            file://0001-Fix-too-many-arguments-error-occurring-in-gcc-15.patch \
            file://0001-Fix-multiple-definitions-with-enable-intervals.patch \
+           file://0001-cleanup-modernize-sendfile_tcp_stream-signature-from.patch \
            "

 SRCREV = "3bc455b23f901dae377ca0a558e1e32aa56b31c4"

