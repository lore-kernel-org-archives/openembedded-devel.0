Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6572D0C604
	for <webhook@archiver.kernel.org>; Sat, 26 Oct 2024 16:08:46 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.13471.1729958922503442258
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Oct 2024 09:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YAT+DcAt;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20b5affde14so21377425ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Oct 2024 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729958921; x=1730563721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7mW3s+chc7vYulAiuino7kGJCB1P3iMNfbdHS9etwo=;
        b=YAT+DcAtsxn7Zyyt/TaPTf30LDYoeIRRBaZVzpNOMRJekGrhKqEOPySnoBGOJQ9jIM
         yZHrM6eZ8dix1Lk2lk4jLrNmsDI+SHOs4A93QRDJPt55rDL8U1L8CzX0sgeDcCfOPZhf
         QcWTAaXOw2SV4BzL526BkGjHlnuS/X4Jw85EFZ4NXkdDyzXD0pT2gMBe/d6NtKjGxA8M
         zt7kLuqKWZXOKPtDn4xVAYdj2SzYHHP0yq/LTYxTKtz6S/PXfXi4HFfk5XM8208d7znB
         kEbspb181OXgZsgGI7Jh+qdkRTDTracx9r9+Veh58v27uJLJys9nlMJE+QlbttcoFjCV
         bPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729958921; x=1730563721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7mW3s+chc7vYulAiuino7kGJCB1P3iMNfbdHS9etwo=;
        b=ZDrQBd3dvBcPDPb1n87jUaDCRv0wlFLM5u5uahVAJC12AWlc8uomZbvzMMw4o5OzBG
         gxHqAWEn2mg7hiyc0QyNR3OnEC4K0XwiHfYd9+02mLG1kObY1tQQRbBaFKmg0Vrm3EF+
         74gxm1FcYQBav9BflEyeEQScd1X5dPI36v0Ot/3BeWUq6erODIt6ZimQc/darrCDBWIr
         21pRwJqClyfnWVI2FNPzVS04tIodWefNHMcErxcvLuld4p+0ms9DNGdIfI6yDHHm6J1N
         0+cR9AykvVHOYfMsW0+0jQi8rFHOtt0BtEnGQnPcifG6YJfK717nUZxzrj4O8LGu56AG
         taGw==
X-Gm-Message-State: AOJu0YxJKm69Ew/nXsSLlSGD0MT+U3d92ffvrHftL85PWEzVdxIoGcrh
	ek98qkVa3IF1eSZ0rTV15Q4vEociHa4WmULGowzyT6A1TJM+mjE/fkdBPTcO
X-Google-Smtp-Source: AGHT+IHSiknqo29Bl/zdGgJpu3TeyKLLVsfu/w8TOkJz8jfvntWd2JY1eYdArJrG0ruQ+R9/OOilHg==
X-Received: by 2002:a17:902:f547:b0:20d:2848:2bee with SMTP id d9443c01a7336-210c6892da8mr42590945ad.16.1729958921523;
        Sat, 26 Oct 2024 09:08:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f344])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc04575esm25668135ad.235.2024.10.26.09.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 09:08:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-ptyprocess: Fix ptests with python 3.13
Date: Sat, 26 Oct 2024 09:08:38 -0700
Message-ID: <20241026160838.2872370-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241026160838.2872370-1-raj.khem@gmail.com>
References: <20241026160838.2872370-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Oct 2024 16:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113237

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...12974bd9084aa568d2e18ce5b2a7e0e45983.patch | 35 +++++++++++++++++++
 .../python/python3-ptyprocess_0.7.0.bb        |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ptyprocess/a44312974bd9084aa568d2e18ce5b2a7e0e45983.patch

diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess/a44312974bd9084aa568d2e18ce5b2a7e0e45983.patch b/meta-python/recipes-devtools/python/python3-ptyprocess/a44312974bd9084aa568d2e18ce5b2a7e0e45983.patch
new file mode 100644
index 0000000000..0f1542341d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess/a44312974bd9084aa568d2e18ce5b2a7e0e45983.patch
@@ -0,0 +1,35 @@
+From a44312974bd9084aa568d2e18ce5b2a7e0e45983 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
+Date: Mon, 23 Oct 2023 15:18:02 +0200
+Subject: [PATCH] Remove unittest.makeSuite, gone from Python 3.13
+
+See https://docs.python.org/3.13/whatsnew/3.13.html
+
+"""
+Removed the following unittest functions, deprecated in Python 3.11:
+
+    unittest.findTestCases()
+    unittest.makeSuite()
+    unittest.getTestCaseNames()
+"""
+
+The removed call does not seem to have any effect when the file is executed
+directly, run trough unittest discover or pytest.
+
+Upstream-Status: Backport [https://github.com/pexpect/ptyprocess/pull/75]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test_invalid_binary.py | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/tests/test_invalid_binary.py b/tests/test_invalid_binary.py
+index cf28098..545f9f7 100755
+--- a/tests/test_invalid_binary.py
++++ b/tests/test_invalid_binary.py
+@@ -69,6 +69,3 @@ def test_invalid_binary(self):
+ 
+ if __name__ == '__main__':
+     unittest.main()
+-
+-suite = unittest.makeSuite(InvalidBinaryChars,'test')
+-
diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
index 4abec0a01c..e0c5e47199 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490"
 
 SRCNAME = "ptyprocess"
 
+SRC_URI += "file://a44312974bd9084aa568d2e18ce5b2a7e0e45983.patch"
 SRC_URI[sha256sum] = "5c5d0a3b48ceee0b48485e0c26037c0acd7d29765ca3fbb5cb3831d347423220"
 
 inherit pypi python_flit_core

