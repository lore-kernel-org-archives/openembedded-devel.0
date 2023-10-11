Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59285CDB476
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 18:22:03 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.24192.1697048521460169931
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 11:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V4lRzMWg;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5789ffc8ae0so82352a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 11:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697048521; x=1697653321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J13PYXj7IPOHjBNkZfu2JtEcyaQ+fxDB9PqihVh7pQ8=;
        b=V4lRzMWgzLuZEyhrfNjowcvlv5RU/c+8PKKnEcicQyBm5Mzw7tjhAUZim+Uq2BnBWS
         a0yirKpOlu2qSec2Ycn+x4HDKiBOWOGXAvSW8k/rVV93a7b2CIqtqoL3HRvL6yvnmRJP
         nS16jCcGSNHEliWjDkEruOJSE21SB+6wqr0ONhKkJyoqqwDe5tz8BrQc5ZG7osRl5ugs
         Ns5vWXmT++B4E7o8QdzEj8qH0OwBquCT5Lk5C5G2C5JV4+Kn1K2aHPYZhFApb25TRQ7w
         2rYHGC+QDwG6V2LpZlE9vmYngZ0oVxHQiw0CAIgx06EO1ninKnO69LIIBnCoKb75a+hn
         f9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697048521; x=1697653321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J13PYXj7IPOHjBNkZfu2JtEcyaQ+fxDB9PqihVh7pQ8=;
        b=OwGmtAnwGTEdZVsk0dctKO2V1Jg3PGZk4KHQpAKFgnDjiA0asTiP6Cg3t1kZKDVhw0
         xfkIpwkc5xo1wtA7K20VRxpy8Xtff5NgWAnO2zibx9MGIEqEAF9hAJ/usRatuuRK2H9e
         ryt3b52Wi91OVUL4j4tbTdQ3PzCKwsRahpsUVbViQ1c1TLdYQ8vgOcI5LfIuqU55Xqlb
         HetAOqkBJePou3SJaStv+uyVXNBnR3iW0zPYB+0hxUJrmitrdsABPEpnIXUNKaVUV58A
         C0QFtV1SqtrCK2t96PgQ1n+Guji+ae2nJc8KSxn9byAgWzRjDnozCIt+7QSK9/pEl1qh
         bWBg==
X-Gm-Message-State: AOJu0YxNTzCwcqr9s2ox2ovzHsxoE3u/7Uy0ZqymvMLWIKmykc6hvEMs
	qkmETUCVIqmMAII1DO6UvQ/rxFxmkdQ2Og==
X-Google-Smtp-Source: AGHT+IGMiXzn+DpvsmHonUL2roKyWLDDB+jKl3E85RObIEcYNnaGIdXMd6M7zZ6JgNyfNcMhXekzEQ==
X-Received: by 2002:a17:90b:1a8c:b0:273:ed61:a682 with SMTP id ng12-20020a17090b1a8c00b00273ed61a682mr19179566pjb.1.1697048520626;
        Wed, 11 Oct 2023 11:22:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id nr11-20020a17090b240b00b002791d5a3e29sm238144pjb.6.2023.10.11.11.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:22:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] poco: Fix data race when create POSIX thread
Date: Wed, 11 Oct 2023 11:21:58 -0700
Message-ID: <20231011182158.2236069-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 18:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105433

This back fixes the ptest failures seen with musl

     AssertionError:-
     Failed ptests:
     {'poco': ['Foundation-testrunner', 'NetSSL-testrunner', 'Net-testrunner']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...x-data-race-when-create-POSIX-thread.patch | 33 +++++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.12.4.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/poco/poco/0001-Fix-data-race-when-create-POSIX-thread.patch

diff --git a/meta-oe/recipes-support/poco/poco/0001-Fix-data-race-when-create-POSIX-thread.patch b/meta-oe/recipes-support/poco/poco/0001-Fix-data-race-when-create-POSIX-thread.patch
new file mode 100644
index 0000000000..1a7f4dcdca
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0001-Fix-data-race-when-create-POSIX-thread.patch
@@ -0,0 +1,33 @@
+From 03b68fc924b24e12c87512d790d37fc6ddc352ac Mon Sep 17 00:00:00 2001
+From: Dawid Drozd <drozddawid@gmail.com>
+Date: Sat, 11 Feb 2023 14:48:39 +0400
+Subject: [PATCH] Fix data race when create POSIX thread
+
+When creating thread using pthread_create() `_pData->thread` will be set.
+It could lead to data race as in runnableEntry() we refer to that variable.
+
+Instead use pthread_self().
+getName() is already under mutex.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://github.com/pocoproject/poco/pull/3942/commits/9c8a79b994a367f626c5551e0f38c27d0d8431f1]
+---
+ Foundation/src/Thread_POSIX.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Foundation/src/Thread_POSIX.cpp b/Foundation/src/Thread_POSIX.cpp
+index ceab76e82..3e52cd31f 100644
+--- a/Foundation/src/Thread_POSIX.cpp
++++ b/Foundation/src/Thread_POSIX.cpp
+@@ -351,7 +351,7 @@ void* ThreadImpl::runnableEntry(void* pThread)
+ #endif
+ 
+ 	ThreadImpl* pThreadImpl = reinterpret_cast<ThreadImpl*>(pThread);
+-	setThreadName(pThreadImpl->_pData->thread, reinterpret_cast<Thread*>(pThread)->getName());
++	setThreadName(pthread_self(), reinterpret_cast<Thread*>(pThread)->getName());
+ 	AutoPtr<ThreadData> pData = pThreadImpl->_pData;
+ 	try
+ 	{
+-- 
+2.42.0
+
diff --git a/meta-oe/recipes-support/poco/poco_1.12.4.bb b/meta-oe/recipes-support/poco/poco_1.12.4.bb
index 8505f66e8b..12532e4ef1 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.4.bb
@@ -11,6 +11,7 @@ DEPENDS = "libpcre2 zlib"
 SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
            file://0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch \
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
+           file://0001-Fix-data-race-when-create-POSIX-thread.patch \
            file://run-ptest \
            "
 SRCREV = "1211613642269b7d53bea58b02de7fcd25ece3b9"
-- 
2.42.0


