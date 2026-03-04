Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79B7EB7ED7
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 11:40:04 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16228.1772624399562986039
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 03:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D5u9t07y;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-480706554beso73240855e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772624398; x=1773229198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bskCIYhzixQ00YPbrqg2IZ/qLAuJrG+D8J1BYwtQBho=;
        b=D5u9t07yM2eaTIBxc8Eoj1BLiSE9edTuzful4gzI4Qrt5kjR/G2NYmv+RaxWTijSNA
         JnMc2ok1cnO5PfQZs6qjf33T5JbICsBT4N9zWvsleiaOa8EygEJJ4p7T3UQ8vrrZR38O
         ceF7tzMJ9r5A68jKYlHtAG1gw58HndLmE5pi1fhPAh16Sm9fkwCyyDmMvxnkC10IEm8s
         uz0mMn/eteOn1wC50brF0nJnaPv3NW3T4Q383VI3eTPQBQDNCEDe0sy1xiUKf2Iiklmg
         hPCqycnelBlVyFFjcTe73qlFd/I3ji1SVwNRl/wdehIkPvUgst13Yjt6+k4mxfaJCNxf
         jZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624398; x=1773229198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bskCIYhzixQ00YPbrqg2IZ/qLAuJrG+D8J1BYwtQBho=;
        b=JvWrCVHN5zRmKwWk6TzKFhaR1ZbkJl0zi8tYsyGEvL29SFP++ROPf28h6Ep/s/JDkT
         dP5U80I0Qi4dcqtP3B4z1X11DwWoP0TRHEN7gyKQsylGEBQMbllLdMMSCudrakNql2Dn
         VRX0qcKlX1pNo78QFwMAk+KR88z6eEJEhOLrSI4TXFdaizwfsSoIu7MTzWlFTG9RnD2K
         ddKY1WmIS3zmJ8otWadjagr+lFP8DrJ1z0BLpjokW7uTRMgDkvhmqvIT2ZGWlKEk7R8j
         6f978/4VdUgBq5slO7Xt9XuTQxYow6+MDUhOm8CpyVG2bFSO+ayjqY6QkOm2ExQgPmVP
         Cq+g==
X-Gm-Message-State: AOJu0Ywx9UWYnfA9PPqdmcNsXr/wa+0ESeooNYECc1X4t43BNHDEyZu9
	Y6z1ZfYqzrjPlFqT8hVA3m3ysSLdvqLHYnGBbrszmGFsFMNfnONa05t90eFKUw==
X-Gm-Gg: ATEYQzwj3dsaP/bcUIdmKXcsI8odgW4Vmf2L1NGhGv3xtTgvLfyLk1jTdVMeVymBYZl
	XQNFv7OWIWiRzYsp8pQKb/TgnVk4oPG4Dem5qawvJ0rKdBClcvtDdCj+JxWjC6bpfeJKimeZiyi
	7pe7XSXzAbWrP3UkvhDKqaxW0y66OsdReWAUqfY9E2oQhpxyG06aukI90MJCPDNPcCJ92kPGHzX
	bHrc8CuRe6OuQ88QVgeemme2/zQm1RnaZwUfG6gEP+S30sMg6u/3I5WlgkbstOLUtuSXBhJdxWb
	iHMDOiYv35xDUNtMk6f6ntVx4UDbn1gw7LY1QQQdRxsCafVI9sc/4P8cJiN5c+Img9mdes9U2eS
	N1FN5aa47ObiNnkgyb3tLjFuRrKT7LrFjqGi+OmwCRb1CVmpEyoxQ15K0EDv7a8hEigC+IR8VJV
	WPXg4un+e+DV2DAkb670xB
X-Received: by 2002:a05:600c:470d:b0:47e:e87f:4bba with SMTP id 5b1f17b1804b1-485198a2b1emr27030345e9.29.1772624397642;
        Wed, 04 Mar 2026 03:39:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851880724esm88692195e9.9.2026.03.04.03.39.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:39:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 1/3] memcached: patch CVE-2023-46852
Date: Wed,  4 Mar 2026 12:39:54 +0100
Message-ID: <20260304113956.2245844-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 11:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124845

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-46852

Backport the patch that is referenced by the NVD advisory.

The test extension was not backported, because the modified testcase
does not exist in the recipe version yet.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../memcached/memcached/CVE-2023-46852.patch  | 68 +++++++++++++++++++
 .../memcached/memcached_1.6.15.bb             |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-networking/recipes-support/memcached/memcached/CVE-2023-46852.patch

diff --git a/meta-networking/recipes-support/memcached/memcached/CVE-2023-46852.patch b/meta-networking/recipes-support/memcached/memcached/CVE-2023-46852.patch
new file mode 100644
index 0000000000..d0b5db23b7
--- /dev/null
+++ b/meta-networking/recipes-support/memcached/memcached/CVE-2023-46852.patch
@@ -0,0 +1,68 @@
+From 3e7027caf6b1eb79d3d98a77e17051b120c30b9b Mon Sep 17 00:00:00 2001
+From: dormando <dormando@rydia.net>
+Date: Fri, 28 Jul 2023 10:32:16 -0700
+Subject: [PATCH] proxy: fix buffer overflow with multiget syntax
+
+"get[200 spaces]key1 key2\r\n" would overflow a temporary buffer used to
+process multiget syntax.
+
+To exploit this you must first pass the check in try_read_command_proxy:
+- The request before the first newline must be less than 1024 bytes.
+- If it is more than 1024 bytes there is a limit of 100 spaces.
+- The key length is still checked at 250 bytes
+- Meaning you have up to 772 spaces and then the key to create stack
+  corruption.
+
+So the amount of data you can shove in here isn't unlimited.
+
+The fix caps the amount of data pre-key to be reasonable. Something like
+GAT needs space for a 32bit TTL which is at most going to be 15 bytes +
+spaces, so we limit it to 20 bytes.
+
+I hate hate hate hate hate the multiget syntax. hate it.
+
+CVE: CVE-2023-46852
+Upstream-Status: Backport [https://github.com/memcached/memcached/commit/76a6c363c18cfe7b6a1524ae64202ac9db330767]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ proto_proxy.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/proto_proxy.c b/proto_proxy.c
+index 6c028f4..94e38b6 100644
+--- a/proto_proxy.c
++++ b/proto_proxy.c
+@@ -613,6 +613,12 @@ int proxy_run_coroutine(lua_State *Lc, mc_resp *resp, io_pending_proxy_t *p, con
+     return 0;
+ }
+ 
++// basically any data before the first key.
++// max is like 15ish plus spaces. we can be more strict about how many spaces
++// to expect because any client spamming space is being deliberately stupid
++// anyway.
++#define MAX_CMD_PREFIX 20
++
+ static void proxy_process_command(conn *c, char *command, size_t cmdlen, bool multiget) {
+     assert(c != NULL);
+     LIBEVENT_THREAD *thr = c->thread;
+@@ -670,12 +676,18 @@ static void proxy_process_command(conn *c, char *command, size_t cmdlen, bool mu
+     if (!multiget && pr.cmd_type == CMD_TYPE_GET && pr.has_space) {
+         uint32_t keyoff = pr.tokens[pr.keytoken];
+         while (pr.klen != 0) {
+-            char temp[KEY_MAX_LENGTH + 30];
++            char temp[KEY_MAX_LENGTH + MAX_CMD_PREFIX + 30];
+             char *cur = temp;
+             // Core daemon can abort the entire command if one key is bad, but
+             // we cannot from the proxy. Instead we have to inject errors into
+             // the stream. This should, thankfully, be rare at least.
+-            if (pr.klen > KEY_MAX_LENGTH) {
++            if (pr.tokens[pr.keytoken] > MAX_CMD_PREFIX) {
++                if (!resp_start(c)) {
++                    conn_set_state(c, conn_closing);
++                    return;
++                }
++                proxy_out_errstring(c->resp, PROXY_CLIENT_ERROR, "malformed request");
++            } else if (pr.klen > KEY_MAX_LENGTH) {
+                 if (!resp_start(c)) {
+                     conn_set_state(c, conn_closing);
+                     return;
diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.15.bb b/meta-networking/recipes-support/memcached/memcached_1.6.15.bb
index 76e4768fb9..64065e8547 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.15.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.15.bb
@@ -21,6 +21,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
+           file://CVE-2023-46852.patch \
            "
 SRC_URI[sha256sum] = "8d7abe3d649378edbba16f42ef1d66ca3f2ac075f2eb97145ce164388e6ed515"
 

