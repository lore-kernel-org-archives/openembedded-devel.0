Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F560C61DA7
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 05:54:48 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.96460.1674798884013357508
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 21:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GR2ibsQk;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso7592818pjj.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXpb91oY7OYnCRArreNCc8eVWPBYwVypOOjEldrHTBo=;
        b=GR2ibsQk1Uz+N88+WCL/R57tZJVrLSzWLdaGH9RUlCBEMnoyApc9lia3oaGFjLhRY0
         GFHd7nTRBq+R9ZSzP5zeu2ZnbsxNexecxMmBfS9XKeumSpFOHXGp0SrKUxpk2l6dwRk2
         uD8g63a2iQGu+ztMF2EEpX/UGrnCeaJBS1EWPmDuxChUEa8pVThzt2Tqrqj5dZyyeqV3
         n3cpAiQPIcl8GIrAJ0kEXWexargQtuW4DmAWLsdjNL0WxFLw7haRcR1lL7O84TFQt9j/
         iiqIFhMmiXmNH/5A4t9fSGfa9sxIbQ9HGiZ5VeJXQZD1DdBdbOT0YeQbLgt02oyaRYmx
         JCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXpb91oY7OYnCRArreNCc8eVWPBYwVypOOjEldrHTBo=;
        b=TeMyJkiULe7BvSKFnxSFsRSilStyNQ2UUnz5Fz/shEie/AZF87hhoEVPjmOqK4VUqL
         E7gzblWPzfUcHsiijjDnoSZBzT17C+5fqp43IwuKu43SKpwuFycYHHK6Q9aUv5O5dHzW
         3URdISNPZpCfqun6CuVEpOX+plQLZFz9UM9kWISr25ez5qx5qqLIBhds9IAowzCOB68V
         TOAmObia95O6q0ppxo3NhJrKoqM/gC53NDhxF9fY9KY/wItWsZ+foX45dmxDAPmEdY7D
         zL7zVE1D3wiWS4Pq1lyXWhzIj9aIOZ4twy6aQmxpdOc3gyBcQnzZm7zg6GSRd6/DIpXt
         47PQ==
X-Gm-Message-State: AO0yUKX61q8tqBn6GaRGtiHaIDYhnFtthEdPNR9InB56WD82/MYhGlMT
	mKExocH9e1sWFhVq5HIyMQ/Qeov+oMvydQ==
X-Google-Smtp-Source: AK7set+pYM4cBmJQTDubBvpUZMRLsEjg5mb4uN0knnCtSi5eerEnlqgfYhzWgq/725CE10zSFYl3NQ==
X-Received: by 2002:a05:6a20:d48d:b0:b8:76c7:bdda with SMTP id im13-20020a056a20d48d00b000b876c7bddamr4717206pzb.60.1674798882798;
        Thu, 26 Jan 2023 21:54:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902b60d00b001947982eb8fsm230074pls.60.2023.01.26.21.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 21:54:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/10] poco: Do not use std::atomic<bool>
Date: Thu, 26 Jan 2023 21:54:31 -0800
Message-Id: <20230127055440.2108933-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100805

They are not implemented for all arches e.g. RISCV on gcc 13 yet
Fixes
riscv64-yoe-linux/gcc/riscv64-yoe-linux/13.0.1/ld: lib/libPocoFoundation.so.94: unde
fined reference to `__atomic_exchange_1'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tomic-int-instead-of-std-atomic-bool.patch | 60 +++++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.12.4.bb   |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-support/poco/poco/0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch

diff --git a/meta-oe/recipes-support/poco/poco/0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch b/meta-oe/recipes-support/poco/poco/0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch
new file mode 100644
index 0000000000..b06135222a
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch
@@ -0,0 +1,60 @@
+From 4cbb225811205b51b65371d0d8abc2d2af8233b6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Jan 2023 14:56:36 -0800
+Subject: [PATCH] Use std::atomic<int> instead of std::atomic<bool>
+
+GCC on RISCV does not yet support inline subword atomics [1]
+Therefore avoid them until fixed
+
+Upstream-Status: Pending
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104338
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Foundation/include/Poco/AsyncChannel.h | 2 +-
+ Foundation/src/AsyncChannel.cpp        | 5 ++---
+ 2 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/Foundation/include/Poco/AsyncChannel.h b/Foundation/include/Poco/AsyncChannel.h
+index 190bae7dd..d73ea6c72 100644
+--- a/Foundation/include/Poco/AsyncChannel.h
++++ b/Foundation/include/Poco/AsyncChannel.h
+@@ -111,7 +111,7 @@ private:
+ 	NotificationQueue _queue;
+ 	std::size_t _queueSize = 0;
+ 	std::size_t _dropCount = 0;
+-	std::atomic<bool> _closed;
++	std::atomic<int> _closed;
+ };
+ 
+ 
+diff --git a/Foundation/src/AsyncChannel.cpp b/Foundation/src/AsyncChannel.cpp
+index 37cdec477..e829b180c 100644
+--- a/Foundation/src/AsyncChannel.cpp
++++ b/Foundation/src/AsyncChannel.cpp
+@@ -48,11 +48,10 @@ private:
+ 	Message _msg;
+ };
+ 
+-
+ AsyncChannel::AsyncChannel(Channel::Ptr pChannel, Thread::Priority prio):
+ 	_pChannel(pChannel),
+ 	_thread("AsyncChannel"),
+-	_closed(false)
++	_closed(0)
+ {
+ 	_thread.setPriority(prio);
+ }
+@@ -95,7 +94,7 @@ void AsyncChannel::open()
+ 
+ void AsyncChannel::close()
+ {
+-	if (!_closed.exchange(true))
++	if (!_closed.exchange(1))
+ 	{
+ 		if (_thread.isRunning())
+ 		{
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-support/poco/poco_1.12.4.bb b/meta-oe/recipes-support/poco/poco_1.12.4.bb
index f66a272524..51bd5611fb 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.4.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 DEPENDS = "libpcre2 zlib"
 
 SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
+           file://0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch \
            file://run-ptest \
            "
 SRCREV = "1211613642269b7d53bea58b02de7fcd25ece3b9"
-- 
2.39.1


