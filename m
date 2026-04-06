Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA23EF4EBE
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 07:22:31 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50060.1775460146262178885
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 00:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nmzoSVxo;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c76bc3e8de3so1298793a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 00:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775460145; x=1776064945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Du4z1gkIOyDBkGK4ZpH/WoNJAp9AAPwlPE6KcJf3z8=;
        b=nmzoSVxoK7kXBXtyjngBhKjtbAiX4xhc8HqRu5NEVrq6XxQBR2GeUnURBorvRpzaYe
         eZCVhB1w4BspKpK2vFURsZfG69YymQwtSjZ2Tf6594RuzMwibhMgT70JK+/KAMNeWqbZ
         n5bT4DqF1vsC98eItQ+AMloN5sJH9WqjI05uxqn8wunoZbG+GyJqIYZcs7ttMYIKlUR4
         JSp7FcUX4lfdVKMPpf5tTGV64jdJSZJRLNeIGSEQBVqJzxytc7UoySGQ2C0f8jOZ/YFC
         GvUhdtLji+yrmBk6NuCRsy+1FY09PDvBsgdRx/KP45Ua1g9BVym/t0IgYF0o5r/dDin3
         JSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775460145; x=1776064945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Du4z1gkIOyDBkGK4ZpH/WoNJAp9AAPwlPE6KcJf3z8=;
        b=IVgMkbwtnGGLTUjYZlLQVgreOCAVpb8/C8Gl+HgsiGjzIP5IIIUL9wHsXmKPW5Aln1
         2ZzUJGsevurZ9HUuPBIZMLjKpmBTOzPsfIBfR/AQu0myA9jIakAaPA5eOc7LgyJnrrOE
         bZuqbD1/QZzMTMHJ9avkb/v8Hb53JgWE4hYJpLD4Wgcw2Flw901Myk3DgGi2k4vJy0Cg
         WgLsiKxtdD1H6lSTl7s23Hx188UNCRKgYuyM4BJjeEoqOaR4101/WZ7mtbn49k/Hq3V0
         AWIoF2cDzYTCDrKpYRM+786OOpqgidVH1pXKBUP8K686F6CyOUG6/kxAmbrW17VRmuMa
         WZ4g==
X-Gm-Message-State: AOJu0Yz1flqaga98b4nC75l6785H77D4TUElX3gJuSwhCr+OsOy26/Bf
	Y95v9Tu/gvIvTgLqZ5uv/DQnWpXxEJnrCWgxnfPPJnwdKG2UBfPb+vTcUsKeug==
X-Gm-Gg: AeBDies1CkSr9hRsIfzbYrFLAUNoDM7bL3QVWfKIViQNywOw9GRMswidE7ZYXoAdHl+
	yUA8h1xBYW6nMqjKaSyFQX+LMpVAZhHDgAXw34HVqSz/BDWgkSYwff1WFEfK6oWCHajLnLkcAwJ
	YJqODlnO2SCI4f5aTi8RB1kuDJTPWsGPwB+IRCFYPZ02sxE5R1bZYTjy123oQ/JCuKuxSCj98s5
	+RnWPpOjD1KhwXDiRIIn/DXmVvKJxsNIqftqQrFKMz6zjaT3MQ8hsU0fw0FozEYMe3yP0ywi6mV
	6hhNOfRNA6ymXN1Zho5mzxvU8uEm2ucFvqw1xlC/ylDP7HsGHRkjS6d9BLSo8AIGWFr22DuKc9O
	QBTGIkz4aHlJDypPmJwk0ydnTf/CYA1huudMzb0v4Xfm/NbdR/QXxD70R/w4GdQZZyzmTEbVWuV
	cBpkwRD3hUJZnJTGcIFYUGSeurc2RNL8NPZRo1WP/K
X-Received: by 2002:a17:902:e845:b0:2ae:54b2:27c7 with SMTP id d9443c01a7336-2b28186dd62mr121906055ad.39.1775460144912;
        Mon, 06 Apr 2026 00:22:24 -0700 (PDT)
Received: from L-12443L.kpit.com ([106.51.46.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm126507475ad.24.2026.04.06.00.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 00:22:24 -0700 (PDT)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
X-Google-Original-From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	bhabu.bindu@kpit.com
Subject: [meta-oe][kirkstone][PATCH v2] neon: Backport redirect test debug improvements
Date: Mon,  6 Apr 2026 12:50:54 +0530
Message-Id: <20260406072054.536760-1-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331083134.378318-1-bhabu.bindu@...>
References: <20260331083134.378318-1-bhabu.bindu@...>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 07:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126033

The redirect test in neon 0.30.2 intermittently fails with
"did not get NE_REDIRECT", making it hard to debug.

Backport relevant upstream changes from updated neon version to:
- log actual return value when NE_REDIRECT is not received
- use double_serve_sstring for improved test reliability

Upstream-Status: Backport
[https://github.com/notroj/neon/commit/f7a3d8f1366c7df6578d79af3b5d28a316011be0]
[https://github.com/notroj/neon/commit/0f8dec6c8e7d672f74bb5f81fc7c6bd0d5c56619]
[https://github.com/notroj/neon/commit/1e562888d85efc492c434474c8d90cef3aaa8b18]
[https://github.com/notroj/neon/commit/9e836bb63bf41fd78e12175cd7b35bfb07a031e3]

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 ...0001-Temporarily-disable-no_redirect.patch | 45 +++++++++++++++++
 ...ling-no_redirect-with-more-debugging.patch | 50 +++++++++++++++++++
 ...Switch-to-using-double_serve_sstring.patch | 48 ++++++++++++++++++
 .../neon/0004-test-redirect.c-Cleanup.patch   | 49 ++++++++++++++++++
 meta-oe/recipes-support/neon/neon_0.30.2.bb   |  4 ++
 5 files changed, 196 insertions(+)
 create mode 100644 meta-oe/recipes-support/neon/neon/0001-Temporarily-disable-no_redirect.patch
 create mode 100644 meta-oe/recipes-support/neon/neon/0002-Re-enabling-no_redirect-with-more-debugging.patch
 create mode 100644 meta-oe/recipes-support/neon/neon/0003-no_redirect-Switch-to-using-double_serve_sstring.patch
 create mode 100644 meta-oe/recipes-support/neon/neon/0004-test-redirect.c-Cleanup.patch

diff --git a/meta-oe/recipes-support/neon/neon/0001-Temporarily-disable-no_redirect.patch b/meta-oe/recipes-support/neon/neon/0001-Temporarily-disable-no_redirect.patch
new file mode 100644
index 0000000000..e0c373d416
--- /dev/null
+++ b/meta-oe/recipes-support/neon/neon/0001-Temporarily-disable-no_redirect.patch
@@ -0,0 +1,45 @@
+From f7a3d8f1366c7df6578d79af3b5d28a316011be0 Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@redhat.com>
+Date: Thu, 7 Mar 2019 09:56:57 +0000
+Subject: [PATCH 1/4] Temporarily disable redirect.c:no_redirect
+
+Upstream-Status: Backport
+[https://github.com/notroj/neon/commit/f7a3d8f1366c7df6578d79af3b5d28a316011be0]
+Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
+---
+ test/redirect.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/test/redirect.c b/test/redirect.c
+index c93b388..920c481 100644
+--- a/test/redirect.c
++++ b/test/redirect.c
+@@ -162,6 +162,7 @@ static int fail_loop(void)
+ }
+ #endif
+ 
++#if 0
+ /* ensure that ne_redirect_location returns NULL when no redirect has
+  * been encountered, or redirect hooks aren't registered. */
+ static int no_redirect(void)
+@@ -187,6 +188,7 @@ static int no_redirect(void)
+     ne_session_destroy(sess);
+     return OK;
+ }
++#endif
+ 
+ ne_test tests[] = {
+     T(lookup_localhost),
+@@ -194,7 +196,9 @@ ne_test tests[] = {
+     T(non_absolute),
+     T(relative_1),
+     T(relative_2),
++#if 0
+     T(no_redirect),
++#endif
+     T(NULL) 
+ };
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/neon/neon/0002-Re-enabling-no_redirect-with-more-debugging.patch b/meta-oe/recipes-support/neon/neon/0002-Re-enabling-no_redirect-with-more-debugging.patch
new file mode 100644
index 0000000000..e21a43f0b6
--- /dev/null
+++ b/meta-oe/recipes-support/neon/neon/0002-Re-enabling-no_redirect-with-more-debugging.patch
@@ -0,0 +1,50 @@
+From 0f8dec6c8e7d672f74bb5f81fc7c6bd0d5c56619 Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@redhat.com>
+Date: Mon, 8 Apr 2019 10:22:52 +0100
+Subject: [PATCH 2/4] * test/redirect: Try re-enabling no_redirect with more
+ debugging.
+
+Upstream-Status: Backport
+[https://github.com/notroj/neon/commit/0f8dec6c8e7d672f74bb5f81fc7c6bd0d5c56619]
+Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
+---
+ test/redirect.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/test/redirect.c b/test/redirect.c
+index 920c481..e7ecc19 100644
+--- a/test/redirect.c
++++ b/test/redirect.c
+@@ -64,7 +64,10 @@ static int serve_redir(ne_socket *sock, void *ud)
+ static int process_redir(ne_session *sess, const char *path,
+                          const ne_uri **redir)
+ {
+-    ONN("did not get NE_REDIRECT", any_request(sess, path) != NE_REDIRECT);
++    int ret = any_request(sess, path);
++    ONV(ret != NE_REDIRECT,
++        ("request got %d (%s) rather than NE_REDIRECT",
++         ret, ne_get_error(sess)));
+     *redir = ne_redirect_location(sess);
+     return OK;
+ }
+@@ -162,7 +165,7 @@ static int fail_loop(void)
+ }
+ #endif
+ 
+-#if 0
++#if 01
+ /* ensure that ne_redirect_location returns NULL when no redirect has
+  * been encountered, or redirect hooks aren't registered. */
+ static int no_redirect(void)
+@@ -196,7 +199,7 @@ ne_test tests[] = {
+     T(non_absolute),
+     T(relative_1),
+     T(relative_2),
+-#if 0
++#if 1
+     T(no_redirect),
+ #endif
+     T(NULL) 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/neon/neon/0003-no_redirect-Switch-to-using-double_serve_sstring.patch b/meta-oe/recipes-support/neon/neon/0003-no_redirect-Switch-to-using-double_serve_sstring.patch
new file mode 100644
index 0000000000..21c011f8e5
--- /dev/null
+++ b/meta-oe/recipes-support/neon/neon/0003-no_redirect-Switch-to-using-double_serve_sstring.patch
@@ -0,0 +1,48 @@
+From 1e562888d85efc492c434474c8d90cef3aaa8b18 Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@redhat.com>
+Date: Mon, 8 Apr 2019 10:32:27 +0100
+Subject: [PATCH 3/4] * test/redirect.c (no_redirect): Switch to using
+ double_serve_sstring.
+
+Upstream-Status: Backport
+[https://github.com/notroj/neon/commit/1e562888d85efc492c434474c8d90cef3aaa8b18]
+Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
+---
+ test/redirect.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/test/redirect.c b/test/redirect.c
+index e7ecc19..42deadb 100644
+--- a/test/redirect.c
++++ b/test/redirect.c
+@@ -166,17 +166,23 @@ static int fail_loop(void)
+ #endif
+ 
+ #if 01
++
++#define RESP1 "HTTP/1.1 200 OK\r\n" "Content-Length: 0\r\n\r\n"
++#define RESP2 "HTTP/1.0 302 Get Ye Away\r\n" "Location: /blah\r\n" "\r\n"
+ /* ensure that ne_redirect_location returns NULL when no redirect has
+  * been encountered, or redirect hooks aren't registered. */
+ static int no_redirect(void)
+ {
+     ne_session *sess;
+     const ne_uri *loc;
++    struct double_serve_args resp;
++
++    resp.first.data = RESP1;
++    resp.first.len = strlen(RESP1);
++    resp.second.data = RESP2;
++    resp.second.len = strlen(RESP2);
+ 
+-    CALL(session_server(&sess, single_serve_string, 
+-                        "HTTP/1.1 200 OK\r\n" "Content-Length: 0\r\n\r\n"
+-                        "HTTP/1.0 302 Get Ye Away\r\n"
+-                        "Location: /blah\r\n" "\r\n"));
++    CALL(session_server(&sess, double_serve_sstring, &resp));
+     ONN("redirect non-NULL before register", ne_redirect_location(sess));
+     ne_redirect_register(sess);
+     ONN("initial redirect non-NULL", ne_redirect_location(sess));
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/neon/neon/0004-test-redirect.c-Cleanup.patch b/meta-oe/recipes-support/neon/neon/0004-test-redirect.c-Cleanup.patch
new file mode 100644
index 0000000000..602dd4286e
--- /dev/null
+++ b/meta-oe/recipes-support/neon/neon/0004-test-redirect.c-Cleanup.patch
@@ -0,0 +1,49 @@
+From 9e836bb63bf41fd78e12175cd7b35bfb07a031e3 Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@redhat.com>
+Date: Mon, 8 Apr 2019 10:35:42 +0100
+Subject: [PATCH 4/4] * test/redirect.c: Cleanup.
+
+Upstream-Status: Backport
+[https://github.com/notroj/neon/commit/9e836bb63bf41fd78e12175cd7b35bfb07a031e3]
+Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
+---
+ test/redirect.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/test/redirect.c b/test/redirect.c
+index 42deadb..682097d 100644
+--- a/test/redirect.c
++++ b/test/redirect.c
+@@ -165,10 +165,9 @@ static int fail_loop(void)
+ }
+ #endif
+ 
+-#if 01
+-
+ #define RESP1 "HTTP/1.1 200 OK\r\n" "Content-Length: 0\r\n\r\n"
+ #define RESP2 "HTTP/1.0 302 Get Ye Away\r\n" "Location: /blah\r\n" "\r\n"
++
+ /* ensure that ne_redirect_location returns NULL when no redirect has
+  * been encountered, or redirect hooks aren't registered. */
+ static int no_redirect(void)
+@@ -197,7 +196,6 @@ static int no_redirect(void)
+     ne_session_destroy(sess);
+     return OK;
+ }
+-#endif
+ 
+ ne_test tests[] = {
+     T(lookup_localhost),
+@@ -205,9 +203,7 @@ ne_test tests[] = {
+     T(non_absolute),
+     T(relative_1),
+     T(relative_2),
+-#if 1
+     T(no_redirect),
+-#endif
+     T(NULL) 
+ };
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/neon/neon_0.30.2.bb b/meta-oe/recipes-support/neon/neon_0.30.2.bb
index 646a9eca13..f620d547a9 100644
--- a/meta-oe/recipes-support/neon/neon_0.30.2.bb
+++ b/meta-oe/recipes-support/neon/neon_0.30.2.bb
@@ -9,6 +9,10 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/neon27/neon27_${PV}.orig.tar.gz \
            file://pkgconfig.patch \
            file://fix-package-check-for-libxml2.patch \
            file://run-ptest \
+           file://0001-Temporarily-disable-no_redirect.patch \
+           file://0002-Re-enabling-no_redirect-with-more-debugging.patch \
+           file://0003-no_redirect-Switch-to-using-double_serve_sstring.patch \
+           file://0004-test-redirect.c-Cleanup.patch \
           "
 
 SRC_URI[md5sum] = "e28d77bf14032d7f5046b3930704ef41"
-- 
2.34.1


