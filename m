Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F23CCD186
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 19:49:47 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.28497.1759866584468063906
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 12:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T6EMWuXg;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so1124321966b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 12:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759866583; x=1760471383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31Mgxso2MDjz+gJ7X+9WkOJXQtJ1g/9wdPLRiQ/GmPQ=;
        b=T6EMWuXgts/mBAh6VzpcbKb32hX2biB8uPW6Fh07LZZLU0j2QF+TizKjiO4qlCzIJj
         e28WWJbgMtQ5DxSZFm72LNQVHf27nqRzheZqvvEpBIkY4p2Lss8Qg5au2WxM9+PfafYe
         zGgpAR/uvCZJPAYwMeR1n/YRbQ4nss4TfCAabF0dS6kLn81GZkXoYeZHIW6PPNwOnTL7
         4JqmVIrGZRWrDd57maspysW9pl9FZKCDNHaXkZLYomzD4kllizqk9qHh4gxp22vH3pN6
         qku2b/LjJT+U9fsIeA7Et0921iYu6/OXhKMS82XdRSPcASKo77Z9DEaj3N66EX1/1ek3
         BMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759866583; x=1760471383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31Mgxso2MDjz+gJ7X+9WkOJXQtJ1g/9wdPLRiQ/GmPQ=;
        b=Jg1i+UEjJDQeFEcPBt3qb9Q9DwzIltlBBCD03WciwvOy3J9p608CpY/K+1LHVUIScq
         dpY6uKiJzaQM56KBYFgKOIHP1j6Yl6Z+DvReEgLXDiCF81A2pH381j3s4v+Rd068XwZL
         62pXW8u9YPzwMy9tkx3HzJbu0ZoUKyslH9jO0+ZXclXHPFgO1ickfQtFt9LbZbkbs+Kj
         faqK+VQBH21A8vkWkoIbsRYip9CWY5juOwtwkFgZRBrdo3tWmf+YUkqhuD2pnfX05PWz
         IwwuXfljTdYvj4BguHHBMnFZe3oMsLfvwiMUvypV4IY4JmPgi3SWVtro187QhdHnNFWL
         1FPA==
X-Gm-Message-State: AOJu0YwlV8o8JvbyOoq/7beX70/TTb1DoqPIikObAG1rhXsx1vl5btL7
	c/+gwhOEszygP2sHcY67jxfEt+a2UCFpgDh020fPDIhPsiZDGyMTKIL+/9i/pw==
X-Gm-Gg: ASbGncs9jY5AFgjs+NBplHWgvtiVQ4fsC1GAdjHhqemvuMKdhurnnuiNQI6sbwR++er
	yOR0cPBQN2VJhxTyU75cFasgb20evoD8US9IAVfdr6RQeHauboghS/hJdab583d1qx6Zsv7ptlC
	zjKaatjonr002psQtIGY6fRHmGCZgkxVmlzr/6xTBEAdQtghH5V+BaEF2cMF5lcZmmKKun0qDbF
	WqwqXyVILYBGbNJSS8uZIVgQ1J/GzvNkFIzyt6dVVsHzDsrMk1gvqskCAzUisItysZWliPMGezn
	358YyhYqi4iJH56aADnYw3Y/qzxxuzmDxIEhMao7KnKSBa893EfCeNP6lmh0qEqnfab+ZUjPiWR
	Z+3vZAxOf36p+XXy/rEuRPPqM6xAbm6Plj9TusVYYW5xg
X-Google-Smtp-Source: AGHT+IEgsa4znYqWbxHev1vkV8nKwOh9J51BQBKztLZQzJ/4ptsBXHoC+hqubye64/02pvbfh/NS6w==
X-Received: by 2002:a17:907:6d25:b0:b40:52:19c2 with SMTP id a640c23a62f3a-b50aaa9c937mr94559666b.20.1759866582502;
        Tue, 07 Oct 2025 12:49:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6378810112bsm12961955a12.26.2025.10.07.12.49.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:49:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 4/4] redis: patch CVE-2025-48367
Date: Tue,  7 Oct 2025 21:49:36 +0200
Message-ID: <20251007194936.146845-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007194936.146845-1-skandigraun@gmail.com>
References: <20251007194936.146845-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 19:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120349

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-48367

Backport the patch mentioned in the details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...n-if-accepted-connection-reports-an-.patch | 117 ++++++++++++++++++
 ...n-if-accepted-connection-reports-an-.patch | 107 ++++++++++++++++
 .../recipes-extended/redis/redis_6.2.18.bb    |   1 +
 meta-oe/recipes-extended/redis/redis_7.2.8.bb |   1 +
 4 files changed, 226 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.2.8/0001-Retry-accept-even-if-accepted-connection-reports-an-.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/0001-Retry-accept-even-if-accepted-connection-reports-an-.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0001-Retry-accept-even-if-accepted-connection-reports-an-.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0001-Retry-accept-even-if-accepted-connection-reports-an-.patch
new file mode 100644
index 0000000000..8017345913
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.2.8/0001-Retry-accept-even-if-accepted-connection-reports-an-.patch
@@ -0,0 +1,117 @@
+From 05524dbadb1acc3d8d75905108fea39cdf43832c Mon Sep 17 00:00:00 2001
+From: Ozan Tezcan <ozantezcan@gmail.com>
+Date: Wed, 14 May 2025 11:02:30 +0300
+Subject: [PATCH] Retry accept() even if accepted connection reports an error
+ (CVE-2025-48367)
+
+In case of accept4() returns an error, we should check errno value and
+decide if we should retry accept4() without waiting next event loop iteration.
+
+CVE: CVE-2025-48367
+Upstream-Status: Backport [https://github.com/redis/redis/commit/c76d6182096cbe10bd3a1dc41095b5ab422e6a74]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/anet.c    | 24 ++++++++++++++++++++++++
+ src/anet.h    |  1 +
+ src/cluster.c |  2 ++
+ src/socket.c  |  2 ++
+ src/tls.c     |  2 ++
+ src/unix.c    |  2 ++
+ 6 files changed, 33 insertions(+)
+
+diff --git a/src/anet.c b/src/anet.c
+index 64824a2..6c539d5 100644
+--- a/src/anet.c
++++ b/src/anet.c
+@@ -704,3 +704,27 @@ int anetIsFifo(char *filepath) {
+     if (stat(filepath, &sb) == -1) return 0;
+     return S_ISFIFO(sb.st_mode);
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
++        return 1;
++
++#if defined(__linux__)
++    /* For details, see 'Error Handling' section on
++     * https://man7.org/linux/man-pages/man2/accept.2.html */
++    if (err == ENETDOWN || err == EPROTO || err == ENOPROTOOPT ||
++        err == EHOSTDOWN || err == ENONET || err == EHOSTUNREACH ||
++        err == EOPNOTSUPP || err == ENETUNREACH)
++    {
++        return 1;
++    }
++#endif
++    return 0;
++}
+diff --git a/src/anet.h b/src/anet.h
+index b13c14f..2319039 100644
+--- a/src/anet.h
++++ b/src/anet.h
+@@ -71,5 +71,6 @@ int anetPipe(int fds[2], int read_flags, int write_flags);
+ int anetSetSockMarkId(char *err, int fd, uint32_t id);
+ int anetGetError(int fd);
+ int anetIsFifo(char *filepath);
++int anetAcceptFailureNeedsRetry(int err);
+ 
+ #endif
+diff --git a/src/cluster.c b/src/cluster.c
+index 765958a..2130ffd 100644
+--- a/src/cluster.c
++++ b/src/cluster.c
+@@ -1309,6 +1309,8 @@ void clusterAcceptHandler(aeEventLoop *el, int fd, void *privdata, int mask) {
+     while(max--) {
+         cfd = anetTcpAccept(server.neterr, fd, cip, sizeof(cip), &cport);
+         if (cfd == ANET_ERR) {
++            if (anetAcceptFailureNeedsRetry(errno))
++                continue;
+             if (errno != EWOULDBLOCK)
+                 serverLog(LL_VERBOSE,
+                     "Error accepting cluster node: %s", server.neterr);
+diff --git a/src/socket.c b/src/socket.c
+index dad8e93..09d87bc 100644
+--- a/src/socket.c
++++ b/src/socket.c
+@@ -318,6 +318,8 @@ static void connSocketAcceptHandler(aeEventLoop *el, int fd, void *privdata, int
+     while(max--) {
+         cfd = anetTcpAccept(server.neterr, fd, cip, sizeof(cip), &cport);
+         if (cfd == ANET_ERR) {
++            if (anetAcceptFailureNeedsRetry(errno))
++                continue;
+             if (errno != EWOULDBLOCK)
+                 serverLog(LL_WARNING,
+                     "Accepting client connection: %s", server.neterr);
+diff --git a/src/tls.c b/src/tls.c
+index e709c99..9a66e81 100644
+--- a/src/tls.c
++++ b/src/tls.c
+@@ -774,6 +774,8 @@ static void tlsAcceptHandler(aeEventLoop *el, int fd, void *privdata, int mask)
+     while(max--) {
+         cfd = anetTcpAccept(server.neterr, fd, cip, sizeof(cip), &cport);
+         if (cfd == ANET_ERR) {
++            if (anetAcceptFailureNeedsRetry(errno))
++                continue;
+             if (errno != EWOULDBLOCK)
+                 serverLog(LL_WARNING,
+                     "Accepting client connection: %s", server.neterr);
+diff --git a/src/unix.c b/src/unix.c
+index bd146d0..8fdefe4 100644
+--- a/src/unix.c
++++ b/src/unix.c
+@@ -100,6 +100,8 @@ static void connUnixAcceptHandler(aeEventLoop *el, int fd, void *privdata, int m
+     while(max--) {
+         cfd = anetUnixAccept(server.neterr, fd);
+         if (cfd == ANET_ERR) {
++            if (anetAcceptFailureNeedsRetry(errno))
++                continue;
+             if (errno != EWOULDBLOCK)
+                 serverLog(LL_WARNING,
+                     "Accepting client connection: %s", server.neterr);
diff --git a/meta-oe/recipes-extended/redis/redis/0001-Retry-accept-even-if-accepted-connection-reports-an-.patch b/meta-oe/recipes-extended/redis/redis/0001-Retry-accept-even-if-accepted-connection-reports-an-.patch
new file mode 100644
index 0000000000..e16ad07e3e
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/0001-Retry-accept-even-if-accepted-connection-reports-an-.patch
@@ -0,0 +1,107 @@
+From 5cb320f03b7d619499d2d69f4371096b5d6a9bdf Mon Sep 17 00:00:00 2001
+From: Ozan Tezcan <ozantezcan@gmail.com>
+Date: Wed, 14 May 2025 11:02:30 +0300
+Subject: [PATCH] Retry accept() even if accepted connection reports an error
+ (CVE-2025-48367)
+
+In case of accept4() returns an error, we should check errno value and
+decide if we should retry accept4() without waiting next event loop iteration.
+
+CVE: CVE-2025-48367
+Upstream-Status: Backport [https://github.com/redis/redis/commit/0fe67435935cc5724ff6eb9c4ca4120c58a15765]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/anet.c       | 24 ++++++++++++++++++++++++
+ src/anet.h       |  2 +-
+ src/cluster.c    |  2 ++
+ src/networking.c |  6 ++++++
+ 4 files changed, 33 insertions(+), 1 deletion(-)
+
+diff --git a/src/anet.c b/src/anet.c
+index 91f6171..2e42fc5 100644
+--- a/src/anet.c
++++ b/src/anet.c
+@@ -594,3 +594,27 @@ int anetFormatFdAddr(int fd, char *buf, size_t buf_len, int fd_to_str_type) {
+     anetFdToString(fd,ip,sizeof(ip),&port,fd_to_str_type);
+     return anetFormatAddr(buf, buf_len, ip, port);
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
++        return 1;
++
++#if defined(__linux__)
++    /* For details, see 'Error Handling' section on
++     * https://man7.org/linux/man-pages/man2/accept.2.html */
++    if (err == ENETDOWN || err == EPROTO || err == ENOPROTOOPT ||
++        err == EHOSTDOWN || err == ENONET || err == EHOSTUNREACH ||
++        err == EOPNOTSUPP || err == ENETUNREACH)
++    {
++        return 1;
++    }
++#endif
++    return 0;
++}
+diff --git a/src/anet.h b/src/anet.h
+index 2a685cc..adedaf3 100644
+--- a/src/anet.h
++++ b/src/anet.h
+@@ -72,5 +72,5 @@ int anetFdToString(int fd, char *ip, size_t ip_len, int *port, int fd_to_str_typ
+ int anetKeepAlive(char *err, int fd, int interval);
+ int anetFormatAddr(char *fmt, size_t fmt_len, char *ip, int port);
+ int anetFormatFdAddr(int fd, char *buf, size_t buf_len, int fd_to_str_type);
+-
++int anetAcceptFailureNeedsRetry(int err);
+ #endif
+diff --git a/src/cluster.c b/src/cluster.c
+index 8807fe2..030897c 100644
+--- a/src/cluster.c
++++ b/src/cluster.c
+@@ -691,6 +691,8 @@ void clusterAcceptHandler(aeEventLoop *el, int fd, void *privdata, int mask) {
+     while(max--) {
+         cfd = anetTcpAccept(server.neterr, fd, cip, sizeof(cip), &cport);
+         if (cfd == ANET_ERR) {
++            if (anetAcceptFailureNeedsRetry(errno))
++                continue;
+             if (errno != EWOULDBLOCK)
+                 serverLog(LL_VERBOSE,
+                     "Error accepting cluster node: %s", server.neterr);
+diff --git a/src/networking.c b/src/networking.c
+index 11891d3..2598a58 100644
+--- a/src/networking.c
++++ b/src/networking.c
+@@ -1190,6 +1190,8 @@ void acceptTcpHandler(aeEventLoop *el, int fd, void *privdata, int mask) {
+     while(max--) {
+         cfd = anetTcpAccept(server.neterr, fd, cip, sizeof(cip), &cport);
+         if (cfd == ANET_ERR) {
++            if (anetAcceptFailureNeedsRetry(errno))
++                continue;
+             if (errno != EWOULDBLOCK)
+                 serverLog(LL_WARNING,
+                     "Accepting client connection: %s", server.neterr);
+@@ -1211,6 +1213,8 @@ void acceptTLSHandler(aeEventLoop *el, int fd, void *privdata, int mask) {
+     while(max--) {
+         cfd = anetTcpAccept(server.neterr, fd, cip, sizeof(cip), &cport);
+         if (cfd == ANET_ERR) {
++            if (anetAcceptFailureNeedsRetry(errno))
++                continue;
+             if (errno != EWOULDBLOCK)
+                 serverLog(LL_WARNING,
+                     "Accepting client connection: %s", server.neterr);
+@@ -1231,6 +1235,8 @@ void acceptUnixHandler(aeEventLoop *el, int fd, void *privdata, int mask) {
+     while(max--) {
+         cfd = anetUnixAccept(server.neterr, fd);
+         if (cfd == ANET_ERR) {
++            if (anetAcceptFailureNeedsRetry(errno))
++                continue;
+             if (errno != EWOULDBLOCK)
+                 serverLog(LL_WARNING,
+                     "Accepting client connection: %s", server.neterr);
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.18.bb b/meta-oe/recipes-extended/redis/redis_6.2.18.bb
index 9ce476e14e..5e3b8d4430 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.18.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.18.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            file://0001-CVE-2025-27151.patch \
            file://0001-Fix-out-of-bounds-write-in-hyperloglog-commands-CVE-.patch \
+           file://0001-Retry-accept-even-if-accepted-connection-reports-an-.patch \
           "
 
 SRC_URI[sha256sum] = "470c75bac73d7390be4dd66479c6f29e86371c5d380ce0c7efb4ba2bbda3612d"
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.8.bb b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
index f5ea3eaf5b..22f48afd17 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            file://0001-Check-length-of-AOF-file-name-in-redis-check-aof-CVE.patch \
            file://0001-Fix-out-of-bounds-write-in-hyperloglog-commands-CVE-.patch \
+           file://0001-Retry-accept-even-if-accepted-connection-reports-an-.patch \
           "
 
 SRC_URI[sha256sum] = "6be4fdfcdb2e5ac91454438246d00842d2671f792673390e742dfcaf1bf01574"

