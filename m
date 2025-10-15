Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84951CCD192
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 03:43:09 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.7493.1760499782633876786
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 20:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e31NFz6b;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-789fb76b466so5588731b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760499782; x=1761104582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVJElxumdMekaskMVY6vufY4iUEAXSJOc5pQM+kLHfI=;
        b=e31NFz6bS2tcubUPHICjzZsgAEV2NjJI88LxlcASRfe+HPyAD0jflEXGMq7HuR4JW8
         6EIlS/hppjRl+YriRFK2zF86emVQ2HJP8eoX4jOOk4NTv9A2HxF2klSHi423mAOcmODD
         ojup6RfAho0v/BbLqsBGWJLC5bQknX3FkzPSxossQ7AmI+WDPoHg6az6j5cxRNUqNOU8
         19kg/wzO253QDhfjEcPSfKpL9xRvFgIi2w+omx/YujN4veMPbmEQksWgWU8v7+Buoawi
         eidS/TyTpFSiqfd1XJi/DtIX4KtAwEecIeXUt9dGxkXQ9HljuRxjsLEHjm+BSrAGLPnR
         g2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760499782; x=1761104582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVJElxumdMekaskMVY6vufY4iUEAXSJOc5pQM+kLHfI=;
        b=rebh4Pscfrj2koOevUu5kO1K94SiM3I8FJhic0vzP1VT9qarIoVjJum+PZIkPOXwiL
         OE7nDDF3wkDv2nZ7nTuGwdCSGQqiQAZD3nb2VCgiM5sG3VlpHis5PQZIrQDHhkEu9Rqb
         6+e4J4gkczgHTDdNFpb7HIcXAwdmV5aR4nKZxrSG3R3LNMDMJSvw+B49ShXzGTya5oBh
         sDqaZ2snhtgUhPoaUfJ5Ub6VB4+H+AyblH7m6mDDtnNEkyF1ucADJ5vj5pMsgUOrmNVk
         FmSVjkWlmuz/TFUEC4Eh7+KOlpcyJ4ILsVb+NzEUxq+pwV3GwgoH6U3hIWabU8zGJD/y
         K10A==
X-Gm-Message-State: AOJu0YzWcgVpt1MY/Z1VcIJTQmjqtkjLsUYjUKGpq1JsQA73PuGfk+IK
	+Btj8w9vLW6tVvo5TWIo3uKtdu5DmOwfvjlKz1PzVuRr8/Yf/AoN2ko1pfRrOQ==
X-Gm-Gg: ASbGncu2HR2/yN2tqV9TaFWgmG/1LWVlhuBFN2oy8L422KOQBnVcPERHRcl5BN2nD4O
	0uDyCMVCpEwW7SvwySyhorw797A1rOjAQi4w56feLeNrZmTTemcOsU4UZ4Om5iqgx2kvRRb0nZL
	57qzhdHWSIpeoGUfBUCL2/YST12IVceB0i+TJF8M/Ht+S4FHURVX/DBr9khmmnrFhs6TitpLg9Y
	vmEo3OOk3Xau5qSFF2MXrpKn7lrKwcHst4x/S3798bnL90yoiZw39qacWO0xjvQ8h4WgqFAovNs
	aZRiTOu2EYkiMbs64jPzpgerUnOPGEcLX8fSNdFSTLYf485IHc6CLrPxu9sswVhbcNBwWlD9xlI
	A3OSpRY0j0tK8uwsIb1Dj91jJrPOmmM0DwQU1x31B9neDcJvALoT+2d8=
X-Google-Smtp-Source: AGHT+IGc6HCF8VpWAaOCIiu1SD2uI+CEEeWh58GpXUIT5uT/s7BMYnM9KKDELAoieHZHiWKQZLnlGg==
X-Received: by 2002:a05:6a21:3299:b0:306:51fd:5542 with SMTP id adf61e73a8af0-32da8461d0emr32942362637.44.1760499781730;
        Tue, 14 Oct 2025 20:43:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a096870a3sm888627a12.33.2025.10.14.20.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 20:43:01 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 3/4] memcached: patch CVE-2023-46852
Date: Wed, 15 Oct 2025 16:42:43 +1300
Message-ID: <20251015034244.1445689-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015034244.1445689-1-ankur.tyagi85@gmail.com>
References: <20251015034244.1445689-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 03:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120681

Details https://nvd.nist.gov/vuln/detail/CVE-2023-46852

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../memcached/memcached/CVE-2023-46852.patch  | 71 +++++++++++++++++++
 .../memcached/memcached_1.6.17.bb             |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta-networking/recipes-support/memcached/memcached/CVE-2023-46852.patch

diff --git a/meta-networking/recipes-support/memcached/memcached/CVE-2023-46852.patch b/meta-networking/recipes-support/memcached/memcached/CVE-2023-46852.patch
new file mode 100644
index 0000000000..2bb34af97a
--- /dev/null
+++ b/meta-networking/recipes-support/memcached/memcached/CVE-2023-46852.patch
@@ -0,0 +1,71 @@
+From 44d8cfad2500881447cbfe2089bfd80b85ffcd7e Mon Sep 17 00:00:00 2001
+From: dormando <dormando@rydia.net>
+Date: Fri, 28 Jul 2023 10:32:16 -0700
+Subject: [PATCH] CVE-2023-46852
+
+proxy: fix buffer overflow with multiget syntax
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
+(cherry picked from commit 76a6c363c18cfe7b6a1524ae64202ac9db330767)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ proto_proxy.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/proto_proxy.c b/proto_proxy.c
+index 3ee8c07..9bef26d 100644
+--- a/proto_proxy.c
++++ b/proto_proxy.c
+@@ -616,6 +616,12 @@ int proxy_run_coroutine(lua_State *Lc, mc_resp *resp, io_pending_proxy_t *p, con
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
+@@ -687,12 +693,18 @@ static void proxy_process_command(conn *c, char *command, size_t cmdlen, bool mu
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
diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
index 7234f02a13..b4c1847bf6 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
@@ -22,6 +22,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
            file://0001-Fix-function-protypes.patch \
+           file://CVE-2023-46852.patch \
            "
 SRC_URI[sha256sum] = "2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2bd1224"
 

