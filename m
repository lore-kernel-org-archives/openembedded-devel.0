Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF784CF64BE
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 05:47:03 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28310.1763617614499313527
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 21:46:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LVSx9OwG;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2980d9b7df5so6524395ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 21:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763617614; x=1764222414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qT6+gPBe6pGHmL8jviHhJW94AVhnfgYfKesY2jXt2iI=;
        b=LVSx9OwGxV7sta0QihGVAc6gaE+nGqTU8uvnIfTi34g1fTINS2UyZPOa2hptNxwafx
         rlyWTDP8gwhbdIIw0/HIBUuJiP7ZiMdvxFvXCYd/rjGKgM416XMgTpeVm24QQlb6yUmP
         Ox/2KzE751n8Pxs7cpGC6MxASAOZEduQIRznNrJJDVyx2tw7UihE1RxV9SdnoHHwUD29
         1YDkdh5QlvFxSz9YBQjAXJBzhtKN+bZrgTs0NVKD6ghQ+eO6EKRDLpq3hrFqRxkAm7uf
         Gm2Z1dqfp98IGQ2/D7036jmunBlsIggv/n8x3Hph62oHn2ihLyIyMUTCidKixU0ul5yG
         Nf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763617614; x=1764222414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qT6+gPBe6pGHmL8jviHhJW94AVhnfgYfKesY2jXt2iI=;
        b=QZd3Ugl0OiDlwkntee0no2AgYebyw8u5S/X+EURFhj0DG7IeQWfkM/WJGtCE6YqOkl
         SkY+9bIjoShG6C5+mXamM8GMiEJ8tCWI3KQuseojmJnl+3B25JBSDEy8hZ82JNehueh7
         tApLYDe+TinFruMi1cCAsMe2EQrjhfiiGWfTFfZr+6vyiSX7u/pacUFTi/fzhEbY+vw1
         Yj+zQL7YubdbPyqq1WyMw2yAB/PJfqbBH578gtK9ZBsz1XJNBbpjfnTY3Xqx5zEVuyKZ
         Vg84AzvYzRLczFC/oK52diZ6wF7j7UQp34zVg/3L/7+W25FiG4kw+WAE60Zwkq4VT0M+
         Fmhg==
X-Gm-Message-State: AOJu0Yx1uEEhSuz0S5gt7PU6YRSbTCkLRbeMBZVPGSj7hc1uPh7AtK1S
	zzbF69e5j50rgeTQJSM/GAb31dhUKsfK1yIXcLQTYvsUHhNzDxjicgSknynHVA==
X-Gm-Gg: ASbGnctk1gN7rgt6YXYP4AikCwYPQJ67m3HVVvjybmLWgVj7rjenHqJb3sp1TgUzvjJ
	NKpEngaqE0oYpNf6vv1ohBKehQ+q/9m79XxqvVM42igX0+a5jMTFtbW0LXBfeMDp1olXZgUI/k+
	j1d9ngyHA4IbIIuislxZ0do5MxU6O9gsiWiWZMcfoqdgFX0cl+vmxTcv1QZvHdwxq9wsOczqPDi
	e6/QW964LMnJueNjp868WpcavjTim9+ySRRLxFNXjBA2fwWWsdGbWbrS/XFvN4folPCv8IKxUiA
	jjHUxK1yw0Bpm6HFBzFK7LOUWCtuncibTpOThU1uv2fQY+rkfApkr3sGV6Z8bVVmUt5vGlBWrqQ
	1jBy+esXZDVsEDxaE9ZSUkkAkBdcWCWvgvTxVouxkjj7X8KpSZ+iOAVJiXwxfRWd4gA6AEX4xfC
	ZRC6zrnJUbPJ8MvAfMfSQKDB3E
X-Google-Smtp-Source: AGHT+IFJ37e94TO3UNms6cdJj1ZBT/oLEj8itp5sRRUbleokoQlt1SjO/s3Ht5MTH59tp4yK+/1zww==
X-Received: by 2002:a17:903:1b43:b0:27e:ec72:f67 with SMTP id d9443c01a7336-29b5ccdc722mr21166505ad.6.1763617613572;
        Wed, 19 Nov 2025 21:46:53 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111f65sm13204825ad.13.2025.11.19.21.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 21:46:53 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH] libplist: fix ptest error
Date: Thu, 20 Nov 2025 18:46:46 +1300
Message-ID: <20251120054646.3709798-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 05:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121926

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-test-fix-operator-error.patch        | 68 +++++++++++++++++++
 .../libimobiledevice/libplist_2.6.0.bb        |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operator-error.patch

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operator-error.patch b/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operator-error.patch
new file mode 100644
index 0000000000..0866851537
--- /dev/null
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operator-error.patch
@@ -0,0 +1,68 @@
+From 18e5b22a71f85091127cc063db79c8df687c582c Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Date: Thu, 20 Nov 2025 16:01:58 +1300
+Subject: [PATCH] test: fix operator error
+
+Otherwise test fail with error [: -neq: binary operator expected
+
+Upstream-Status: Submitted [https://github.com/libimobiledevice/libplist/pull/284]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ test/json-invalid-types.test  | 6 +++---
+ test/ostep-invalid-types.test | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/test/json-invalid-types.test b/test/json-invalid-types.test
+index c532316..a21fcd9 100755
+--- a/test/json-invalid-types.test
++++ b/test/json-invalid-types.test
+@@ -14,19 +14,19 @@ export PLIST_JSON_DEBUG=1
+ 
+ echo "Converting (failure expected)"
+ $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE0 -o /dev/null
+-if [ $? -neq 2 ]; then
++if [ $? -ne 2 ]; then
+   exit 1
+ fi
+ 
+ echo "Converting (failure expected)"
+ $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE1 -o /dev/null
+-if [ $? -neq 2 ]; then
++if [ $? -ne 2 ]; then
+   exit 2
+ fi
+ 
+ echo "Converting (failure expected)"
+ $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE2 -o /dev/null
+-if [ $? -neq 2 ]; then
++if [ $? -ne 2 ]; then
+   exit 3
+ fi
+ 
+diff --git a/test/ostep-invalid-types.test b/test/ostep-invalid-types.test
+index 9222394..240505c 100755
+--- a/test/ostep-invalid-types.test
++++ b/test/ostep-invalid-types.test
+@@ -14,19 +14,19 @@ export PLIST_OSTEP_DEBUG=1
+ 
+ echo "Converting (failure expected)"
+ $top_builddir/tools/plistutil -f openstep -i $DATASRC/$TESTFILE0 -o /dev/null
+-if [ $? -neq 2 ]; then
++if [ $? -ne 2 ]; then
+   exit 1
+ fi
+ 
+ echo "Converting (failure expected)"
+ $top_builddir/tools/plistutil -f openstepn -i $DATASRC/$TESTFILE1 -o /dev/null
+-if [ $? -neq 2 ]; then
++if [ $? -ne 2 ]; then
+   exit 2
+ fi
+ 
+ echo "Converting (failure expected)"
+ $top_builddir/tools/plistutil -f openstep -i $DATASRC/$TESTFILE2 -o /dev/null
+-if [ $? -neq 2 ]; then
++if [ $? -ne 2 ]; then
+   exit 3
+ fi
+ 
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
index 69b9b46d62..17b1d7cfd3 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
@@ -11,6 +11,7 @@ inherit autotools pkgconfig python3native python3targetconfig ptest
 SRCREV = "2117b8fdb6b4096455bd2041a63e59a028120136"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master;tag=${PV} \
            file://run-ptest \
+           file://0001-test-fix-operator-error.patch \
 "
 
 

