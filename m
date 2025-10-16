Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A97CCD19E
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:10:42 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.4595.1760609436517198768
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 03:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DpQnKsdF;
 spf=pass (domain: mvista.com, ip: 209.85.215.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b679450ecb6so410909a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 03:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760609435; x=1761214235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etaKVOOVHSTM6bOEfPIe3umSVTN7gd2frbtmNPy5xbY=;
        b=DpQnKsdFkYz76mh48R2f7SP732rsEyJgTdgFbKdriGT3LWVqsUKjluCvXVLBNMoA9y
         V4vQzgFoacOAoVClmLUvNxghMtO9fJaQcZrW15rvm7mN6CHVnnsUGXcXXigIz0jFIjLB
         c55DImecwP5KGJGghVSzAC2Ivk63JV7FhEdeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609435; x=1761214235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etaKVOOVHSTM6bOEfPIe3umSVTN7gd2frbtmNPy5xbY=;
        b=sHHBXQgdH02UDdpX9nb8zMGKKluZxC4MeqUFHgV/mBpkCjANWiFNZZVJu6tFLJPeVZ
         3O2Fr45/Vo+GjD47YdWPpVAbhtTxHmqDgt3MKn4koW6ZhDsUkOIGdp4RaIHI1qOpSzt+
         SCp7MNdUxNnuDrsbzxGfLfp8RywE+NUu5MyvI67A1R4H/l5CAJSCVzcdeNN0gKM2E7qy
         0yFYrbZLVr1BS8cL9OnGlQgziOslcr/sx/JMn4CfFiuns1ZYGQhXyatciWp54VnjB+lI
         H2vS++Pw3kUNIEGfdnQma3hbALjxqa8+cw82EXLbmHrLkt8SReNHqpiTwXwM/h9aCiXj
         1Nmw==
X-Gm-Message-State: AOJu0Yw1esdgWUaSHSxvgHJwzqYTUBCELUXb/Rptq/0dgNQLdoBBsv5P
	02ZeOG4I39Nx28OWjeiJOm6TrOxQtmC9YR9NgyaP9qtG+VbOa5J0cm6z2pfP0Fw0hfXT8kaFkzy
	1m6bOox8=
X-Gm-Gg: ASbGncuvQKHPD8xqG2nmUZxnZgahe2s6JnnvCggDT4+kAO2MFJ0wtpI87b3wdt+gTEP
	K50clnqY3plBXLjsWhTKaJG2NHsORIWjp6CstheMOLZoun45mdacW3wgQT4nxTWPKoIxnvX8AY9
	zJqKoteVjZBwzX3e5XX3Qt9u3CfUhA5sMa9OE9GyltnrveOrPcOHJSbsfIUGK/v3Jrv7uq6kBIB
	gJFNojuhO9oF97IuqlHIM+ns2G3XCu7qSoiuqx9pFIgP0xvbLNRf25tlapSMBnRcxZciyOddrNG
	fWnVxLavmfnxBNcvtPkMbCrve8va4KU2RQLX1vTy2UbUeLvXDwQwJfeD73ubyi1p6+Q5hKtFId0
	vMXOli3/jjEYo0g6qaRskDBTk2YnxWTW65AdSdKXWsXz3AODq+K1MQxDqgWCUkvJAB8YmDpxQXW
	db80SFJZDBR4wmPwc=
X-Google-Smtp-Source: AGHT+IHO4lknZGaOalEeH3ttfYNo4WmGQY5eLyFI3qOW1HPaydqn+TCDK99f5EfYgx9eHmlV6Zo7Ug==
X-Received: by 2002:a17:902:f60d:b0:26a:b9b4:8342 with SMTP id d9443c01a7336-2902726259dmr374089925ad.25.1760609435257;
        Thu, 16 Oct 2025 03:10:35 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fcc:1614:2a1b:7928:3155:7a64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7cebbsm24617685ad.64.2025.10.16.03.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:10:34 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH 3/7] redis: Fix CVE-2025-48367
Date: Thu, 16 Oct 2025 15:40:16 +0530
Message-Id: <20251016101020.279084-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251016101020.279084-1-vanusuri@mvista.com>
References: <20251016101020.279084-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 10:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120731

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from debian to fix
 CVE-2025-48367

Upstream-Status: Backport [import from debian redis_7.0.15-1~deb12u6.debian.tar.xz
Upstream commit
https://github.com/redis/redis/commit/0fe67435935cc5724ff6eb9c4ca4120c58a15765]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../redis/redis-7.0.13/CVE-2025-48367.patch   | 111 ++++++++++++++++++
 .../recipes-extended/redis/redis_7.0.13.bb    |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-48367.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-48367.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-48367.patch
new file mode 100644
index 0000000000..0084eaa04a
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-48367.patch
@@ -0,0 +1,111 @@
+From 0fe67435935cc5724ff6eb9c4ca4120c58a15765 Mon Sep 17 00:00:00 2001
+From: Ozan Tezcan <ozantezcan@gmail.com>
+Date: Wed, 14 May 2025 11:02:30 +0300
+Subject: [PATCH] Retry accept() even if accepted connection reports an error
+ (CVE-2025-48367)
+
+In case of accept4() returns an error, we should check errno value and
+decide if we should retry accept4() without waiting next event loop iteration.
+
+Upstream-Status: Backport [import from debian redis_7.0.15-1~deb12u6.debian.tar.xz
+Upstream commit
+https://github.com/redis/redis/commit/0fe67435935cc5724ff6eb9c4ca4120c58a15765]
+CVE: CVE-2025-48367
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/anet.c       | 24 ++++++++++++++++++++++++
+ src/anet.h       |  1 +
+ src/cluster.c    |  2 ++
+ src/networking.c |  6 ++++++
+ 4 files changed, 33 insertions(+)
+
+diff --git a/src/anet.c b/src/anet.c
+index 10840fc..a38ab1b 100644
+--- a/src/anet.c
++++ b/src/anet.c
+@@ -705,3 +705,27 @@ int anetSetSockMarkId(char *err, int fd, uint32_t id) {
+     return ANET_OK;
+ #endif
+ }
++
++/* This function must be called after accept4() fails. It returns 1 if 'err'
++ * indicates accepted connection faced an error, and it's okay to continue
++ * accepting next connection by calling accept4() again. Other errors either
++ * indicate programming errors, e.g. calling accept() on a closed fd or indicate
++ * a resource limit has been reached, e.g. -EMFILE, open fd limit has been
++ * reached. In the latter case, caller might wait until resources are available.
++ * See accept4() documentation for details. */
++int anetAcceptFailureNeedsRetry(int err) {
++    if (err == ECONNABORTED)
++	return 1;
++
++#if defined(__linux__)
++    /* For details, see 'Error Handling' section on
++     * https://man7.org/linux/man-pages/man2/accept.2.html */
++    if (err == ENETDOWN || err == EPROTO || err == ENOPROTOOPT ||
++	err == EHOSTDOWN || err == ENONET || err == EHOSTUNREACH ||
++	err == EOPNOTSUPP || err == ENETUNREACH)
++    {
++	return 1;
++    }
++#endif
++    return 0;
++}
+diff --git a/src/anet.h b/src/anet.h
+index ff86e20..864f756 100644
+--- a/src/anet.h
++++ b/src/anet.h
+@@ -74,5 +74,6 @@ int anetFormatAddr(char *fmt, size_t fmt_len, char *ip, int port);
+ int anetFormatFdAddr(int fd, char *buf, size_t buf_len, int fd_to_str_type);
+ int anetPipe(int fds[2], int read_flags, int write_flags);
+ int anetSetSockMarkId(char *err, int fd, uint32_t id);
++int anetAcceptFailureNeedsRetry(int err);
+ 
+ #endif
+diff --git a/src/cluster.c b/src/cluster.c
+index 70ede5c..cb37160 100644
+--- a/src/cluster.c
++++ b/src/cluster.c
+@@ -879,6 +879,8 @@ void clusterAcceptHandler(aeEventLoop *el, int fd, void *privdata, int mask) {
+     while(max--) {
+         cfd = anetTcpAccept(server.neterr, fd, cip, sizeof(cip), &cport);
+         if (cfd == ANET_ERR) {
++            if (anetAcceptFailureNeedsRetry(errno))
++                continue;
+             if (errno != EWOULDBLOCK)
+                 serverLog(LL_VERBOSE,
+                     "Error accepting cluster node: %s", server.neterr);
+diff --git a/src/networking.c b/src/networking.c
+index 386773e..0f9b7bf 100644
+--- a/src/networking.c
++++ b/src/networking.c
+@@ -1366,6 +1366,8 @@ void acceptTcpHandler(aeEventLoop *el, int fd, void *privdata, int mask) {
+     while(max--) {
+         cfd = anetTcpAccept(server.neterr, fd, cip, sizeof(cip), &cport);
+         if (cfd == ANET_ERR) {
++            if (anetAcceptFailureNeedsRetry(errno))
++                continue;
+             if (errno != EWOULDBLOCK)
+                 serverLog(LL_WARNING,
+                     "Accepting client connection: %s", server.neterr);
+@@ -1386,6 +1388,8 @@ void acceptTLSHandler(aeEventLoop *el, int fd, void *privdata, int mask) {
+     while(max--) {
+         cfd = anetTcpAccept(server.neterr, fd, cip, sizeof(cip), &cport);
+         if (cfd == ANET_ERR) {
++            if (anetAcceptFailureNeedsRetry(errno))
++                continue;
+             if (errno != EWOULDBLOCK)
+                 serverLog(LL_WARNING,
+                     "Accepting client connection: %s", server.neterr);
+@@ -1405,6 +1409,8 @@ void acceptUnixHandler(aeEventLoop *el, int fd, void *privdata, int mask) {
+     while(max--) {
+         cfd = anetUnixAccept(server.neterr, fd);
+         if (cfd == ANET_ERR) {
++            if (anetAcceptFailureNeedsRetry(errno))
++                continue;
+             if (errno != EWOULDBLOCK)
+                 serverLog(LL_WARNING,
+                     "Accepting client connection: %s", server.neterr);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
index 1c45784b6e..9e4b158b7a 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2025-21605.patch \
            file://CVE-2025-27151.patch \
            file://CVE-2025-32023.patch \
+           file://CVE-2025-48367.patch \
            "
 SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
-- 
2.25.1


