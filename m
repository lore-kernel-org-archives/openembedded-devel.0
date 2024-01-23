Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3DFC47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 19:56:23 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.4196.1706039775179986635
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jan 2024 11:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tr1vl1pI;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d720c7fc04so26401345ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 11:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706039774; x=1706644574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MMe+knYkN9rYD7lZaHYTxLenoQIzPSR5Q1f2yE1uvQY=;
        b=Tr1vl1pIhy9mGN/Ez1NBAQJQ0X+jJFBkpkV0hy0/jQv5l/JZe7lyROj8Jg0/aRFT8M
         NA3kydOL1LNqTjtk7mTca6BEmw1R4qBKvvgLwDiZ6reLS4BdZccHr2gfo02SkuNpqT9u
         6EpB09a5NXZiBpSoU2F4WdYURYen1wSpi67hwPhb0p769Q2Y71XulZ9V9gVDJ3zlVHbb
         /gBUIAj4yGGDDgXMjNVktRxfUU+YaLOTaMmZq6edLZADO/5syD5+w0/JV3U+FZo/5u6g
         Qr9+Vw7VtvyrErn6Z9OOJZ1+pMUnvaJgpyxzPvMfnYP/QdMzbHZDwRPZYrmC91HlAOiY
         7Yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706039774; x=1706644574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMe+knYkN9rYD7lZaHYTxLenoQIzPSR5Q1f2yE1uvQY=;
        b=K8ztKX3oGz2+4p5KnBrtGfwMY2MJQTlHxty+2wzBrDVAhHXvP/8hSIpzqCMPMvP63H
         yiXTTs02TfurJjUAWsJhGQOf4ZE9OUhrCtUUSzRZI0xeFW9nKBCR79OkoAiUiHrSvZEP
         UXGYx6Kml9XdtolAIbzX4pjgD658EfEyWi/x0HTdKfd84nUOFHjqnGG+csC8aLmQF7PL
         jgGMQhK7VX2izieZ23SxyPZGfZaEDXdHCvIDkJtLyKdd6X/WIV7iuTrGcoY7T6cyOA2V
         cBlJ1cexpcWVPr9ceal/QylqGgbexQ+DfrQAx5wd943QDU/zp90ct2Tg5GBv8pGjFiyr
         V4qA==
X-Gm-Message-State: AOJu0YwgVM6bST2f8hHwN8ngVD45nibDDgtGVmKZ2g5g8IAwNSUPKbQu
	IBA52bxzA0JSTtNrc6OOgHv/DEuZfjig9nlCKaSYARpy2H5r8b5PlT2PlSAxTcI=
X-Google-Smtp-Source: AGHT+IHAfhQXn4xQ/mQw5t7P8wkezVjFxAsQBpknCyCm0Jnt7df/IZ17Es3W2sywB33ILcRbH9Bstg==
X-Received: by 2002:a05:6a20:2452:b0:199:8c54:5868 with SMTP id t18-20020a056a20245200b001998c545868mr4077008pzc.35.1706039774247;
        Tue, 23 Jan 2024 11:56:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d592])
        by smtp.gmail.com with ESMTPSA id fa38-20020a056a002d2600b006dd810cdf60sm1424919pfb.163.2024.01.23.11.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 11:56:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minicoredumper: Fix build with clang
Date: Tue, 23 Jan 2024 11:56:11 -0800
Message-ID: <20240123195611.3106347-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 19:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108439

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...restripper-Fix-uninitialized-warning.patch | 53 +++++++++++++++++++
 .../minicoredumper/minicoredumper_2.0.7.bb    |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-corestripper-Fix-uninitialized-warning.patch

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-corestripper-Fix-uninitialized-warning.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-corestripper-Fix-uninitialized-warning.patch
new file mode 100644
index 0000000000..8b90d33e1b
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/0001-corestripper-Fix-uninitialized-warning.patch
@@ -0,0 +1,53 @@
+From bb44bb643cd2a2f937331b4d1a76b03556b718a2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 23 Jan 2024 11:36:41 -0800
+Subject: [PATCH] corestripper: Fix uninitialized warning
+
+Clang finds more open paths where ret can be uninitialized
+
+Fixes
+| ../../../git/src/minicoredumper/corestripper.c:2768:13: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
+|  2768 |         } else if (di->core_fd >= 0) {
+|       |                    ^~~~~~~~~~~~~~~~
+| ../../../git/src/minicoredumper/corestripper.c:2773:9: note: uninitialized use occurs here
+|  2773 |         return ret;
+|       |                ^~~
+| ../../../git/src/minicoredumper/corestripper.c:2768:9: note: remove the 'if' if its condition is always true
+|  2768 |         } else if (di->core_fd >= 0) {
+|       |                ^~~~~~~~~~~~~~~~~~~~~
+| ../../../git/src/minicoredumper/corestripper.c:2763:9: note: initialize the variable 'ret' to silence this warning
+|  2763 |         int ret;
+|       |                ^
+|       |                 = 0
+
+Upstream-Status: Submitted [https://github.com/diamon/minicoredumper/pull/15]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/minicoredumper/corestripper.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
+index 3eb9089..e9e3936 100644
+--- a/src/minicoredumper/corestripper.c
++++ b/src/minicoredumper/corestripper.c
+@@ -2707,7 +2707,7 @@ static int dump_data_content_file(struct dump_info *di,
+ 	char *tmp_path;
+ 	FILE *file;
+ 	int len;
+-	int ret;
++	int ret = -1;
+ 
+ 	len = strlen(di->dst_dir) + strlen("/dumps/") + 32 +
+ 	      strlen(dd->ident) + 1;
+@@ -2760,7 +2760,7 @@ out:
+ static int dump_data_content(struct dump_info *di, struct mcd_dump_data *dd,
+ 			     const char *symname)
+ {
+-	int ret;
++	int ret = -1;
+ 
+ 	if (dd->ident) {
+ 		/* dump to external file */
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
index 0c38271418..726aa60ce7 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
            file://minicoredumper.service \
            file://minicoredumper.init \
            file://run-ptest \
+           file://0001-corestripper-Fix-uninitialized-warning.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


