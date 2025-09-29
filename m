Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2DDCAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:45 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.52853.1759151081812337565
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mDKrF3Lv;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb78ead12so804044266b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151080; x=1759755880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU8beQGWdCYBGKJtl91NeTq6p2S7rMN39h2dlZ5xuf8=;
        b=mDKrF3LvDMopl83ziOmnR1Ns69sjGJlheR0DM6PcAUS48iiZRWnLxJorCjgpcJYA/U
         /gjikxICY5yWym2ZZ+R7oSgQS1/lC+w0h4DqAK3RNgHlGe1LEHfqJdh/Z7kHY3wjKWuj
         +XgdyxhKzDmjvXdApKeiDNqQ64uaw16oyVoYvObL7JEuMK2jn1q+cwcBetB5m7IftdTL
         y4LslyPrbLFkGj+3kAqktaoKLushEQo192xBn/Nfvn+e+SZfsMUoD8a/dRg/I1iTHy+w
         L8Le3mnxVA0AmRwGUDblYJCvXz6NHhCUeYzcwvoxiViZu2hCaBWyBkqohDLQ+YpJu7bh
         5H3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151080; x=1759755880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QU8beQGWdCYBGKJtl91NeTq6p2S7rMN39h2dlZ5xuf8=;
        b=IQI10txlf9LTn9vaR6sntn941Ykx59UvgqA6T6cHvlWRePI3YdK33ITa8yi1ZW+ZEL
         RVHmFdicPjUJNgEfeRq2T8ghNwAoIswGDhuu8dwopQW/DU+whdwY7dEwyXKd7vXx5Ary
         52w/T+CEPLWNr9TGx+NnNVwxyqQ4VgxCqHHMU47O0To2iVyFfN7pVP7ChTWV3Y6p717w
         7HUJ8MADIVQXG6SVUwdyOfMKuCdJESuVMI2bJKAo8G2hrIk4AqIDtYkO7DCBlpmoGdmw
         2x239F0bBMq3nUZrHAMXa+0XpdC2oy+qMJHZCbgXruC8pSEJnw7Srr1wZw++nwXGk7W0
         dbbg==
X-Gm-Message-State: AOJu0YxuzzI5abQQyuKWNJ2u1A8fUlUof+XpA+T5B4xJ3bWSS9QyxtXf
	AoZeIiyiVXtgSxpaMEnOGROQct7SEEiWHX92fovb4DfmeXZplT3HQBblL8NkAw==
X-Gm-Gg: ASbGncsUtDMLVoOREChZg4lLjsGDoxOeLLk4AGQqYkoXaoQdi5+XA6OqMr0snBdZdlm
	dszO63BTBWYg/XpMZ5xomVKqnHUnckaWPbNcU5AJwBs+fMiB5k4TL84V+xQtqsHCdnChFkA1htV
	EMlgrmd9JkasoeunYCUJ6UVUnrmcEFG4rpWdtY3Seu2Z9zTxT/UDylD8ofEBVsvG+ayJL8TPMpm
	NOKfOYHcofWR0TbIHXLe/pQqCQ75clRHOtD+Vlb5xsKHU7PDftDBvlgh+afY8iYpJEWojvnyOpS
	W6CoQffKeUOjXmzTNFDTF/wYPGjF/CVv+MIa5olqJibYukvaZnqvz2guTXTo4bYsMiU8pvAdXzP
	MgjW0aHp1bRxRkWt8vfRd
X-Google-Smtp-Source: AGHT+IFPyxMsd/q2swYUKcf7mK277ri59q6E1fFAKkM9rmq6Frdu5Ge5NVNev6uAVbkDVuvEwyyEfw==
X-Received: by 2002:a17:907:1c89:b0:b3a:ecc1:7767 with SMTP id a640c23a62f3a-b3aecc18344mr890279466b.32.1759151079990;
        Mon, 29 Sep 2025 06:04:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 14/22] iperf3: upgrade 3.14 -> 3.15
Date: Mon, 29 Sep 2025 15:04:17 +0200
Message-ID: <20250929130425.2912077-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120027

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  Several bugs that could allow the iperf3 server to hang waiting
  for input on the control connection has been fixed.

  A bug that caused garbled output with UDP tests on 32-bit hosts
  has been fixed (PR #1554, PR #1556). This bug was introduced in
  iperf-3.14.

  A bug in counting UDP messages has been fixed (PR #1367, PR
  #1380).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8765f02ffb85ddff21e461b716ef3f86d368cb4e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../iperf3/iperf3/CVE-2023-7250.patch         | 133 ------------------
 .../iperf3/{iperf3_3.14.bb => iperf3_3.15.bb} |   3 +-
 2 files changed, 1 insertion(+), 135 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2023-7250.patch
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.14.bb => iperf3_3.15.bb} (93%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2023-7250.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2023-7250.patch
deleted file mode 100644
index 6000480de7..0000000000
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2023-7250.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 5e3704dd850a5df2fb2b3eafd117963d017d07b4 Mon Sep 17 00:00:00 2001
-From: "Bruce A. Mah" <bmah@es.net>
-Date: Tue, 1 Aug 2023 14:02:54 -0700
-Subject: [PATCH] Implement fixes to make the control connection more robust.
-
-These include various timeouts in Nread() to guarantee that it will
-eventually exit, a 10-second timeout for each attempt to read data
-from the network and an approximately 30-second overall timeout per
-Nread() call.
-
-Also the iperf3 server now checks the length of the received session
-cookie, and errors out if this happens to be incorrect.
-
-Reported by Jorge Sancho Larraz - Canonical.
-
-CVE: CVE-2023-7250
-
-Upstream-Status: Backport [https://github.com/esnet/iperf/commit/5e3704dd850a5df2fb2b3eafd117963d017d07b4]
-
-Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
----
- src/iperf_server_api.c |  7 ++++-
- src/net.c              | 62 ++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 68 insertions(+), 1 deletion(-)
-
-diff --git a/src/iperf_server_api.c b/src/iperf_server_api.c
-index 18f105d..ae916f5 100644
---- a/src/iperf_server_api.c
-+++ b/src/iperf_server_api.c
-@@ -140,7 +140,12 @@ iperf_accept(struct iperf_test *test)
-         }
- #endif /* HAVE_TCP_USER_TIMEOUT */
- 
--        if (Nread(test->ctrl_sck, test->cookie, COOKIE_SIZE, Ptcp) < 0) {
-+        if (Nread(test->ctrl_sck, test->cookie, COOKIE_SIZE, Ptcp) != COOKIE_SIZE) {
-+            /*
-+             * Note this error covers both the case of a system error
-+             * or the inability to read the correct amount of data
-+             * (i.e. timed out).
-+             */
-             i_errno = IERECVCOOKIE;
-             return -1;
-         }
-diff --git a/src/net.c b/src/net.c
-index 1a88155..b80fb64 100644
---- a/src/net.c
-+++ b/src/net.c
-@@ -65,6 +65,9 @@
- #include "net.h"
- #include "timer.h"
- 
-+static int nread_read_timeout = 10;
-+static int nread_overall_timeout = 30;
-+
- /*
-  * Declaration of gerror in iperf_error.c.  Most other files in iperf3 can get this
-  * by including "iperf.h", but net.c lives "below" this layer.  Clearly the
-@@ -372,6 +375,32 @@ Nread(int fd, char *buf, size_t count, int prot)
- {
-     register ssize_t r;
-     register size_t nleft = count;
-+    struct iperf_time ftimeout = { 0, 0 };
-+
-+    fd_set rfdset;
-+    struct timeval timeout = { nread_read_timeout, 0 };
-+
-+    /*
-+     * fd might not be ready for reading on entry. Check for this
-+     * (with timeout) first.
-+     *
-+     * This check could go inside the while() loop below, except we're
-+     * currently considering whether it might make sense to support a
-+     * codepath that bypassese this check, for situations where we
-+     * already know that fd has data on it (for example if we'd gotten
-+     * to here as the result of a select() call.
-+     */
-+    {
-+        FD_ZERO(&rfdset);
-+        FD_SET(fd, &rfdset);
-+        r = select(fd + 1, &rfdset, NULL, NULL, &timeout);
-+        if (r < 0) {
-+            return NET_HARDERROR;
-+        }
-+        if (r == 0) {
-+            return 0;
-+        }
-+    }
- 
-     while (nleft > 0) {
-         r = read(fd, buf, nleft);
-@@ -385,6 +414,39 @@ Nread(int fd, char *buf, size_t count, int prot)
- 
-         nleft -= r;
-         buf += r;
-+
-+        /*
-+         * We need some more bytes but don't want to wait around
-+         * forever for them. In the case of partial results, we need
-+         * to be able to read some bytes every nread_timeout seconds.
-+         */
-+        if (nleft > 0) {
-+            struct iperf_time now;
-+
-+            /*
-+             * Also, we have an approximate upper limit for the total time
-+             * that a Nread call is supposed to take. We trade off accuracy
-+             * of this timeout for a hopefully lower performance impact.
-+             */
-+            iperf_time_now(&now);
-+            if (ftimeout.secs == 0) {
-+                ftimeout = now;
-+                iperf_time_add_usecs(&ftimeout, nread_overall_timeout * 1000000L);
-+            }
-+            if (iperf_time_compare(&ftimeout, &now) < 0) {
-+                break;
-+            }
-+
-+            FD_ZERO(&rfdset);
-+            FD_SET(fd, &rfdset);
-+            r = select(fd + 1, &rfdset, NULL, NULL, &timeout);
-+            if (r < 0) {
-+                return NET_HARDERROR;
-+            }
-+            if (r == 0) {
-+                break;
-+            }
-+        }
-     }
-     return count - nleft;
- }
--- 
-2.40.0
-
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb
similarity index 93%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb
index e93434fbf9..d708d74b38 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb
@@ -18,12 +18,11 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            file://CVE-2025-54350.patch \
            file://CVE-2025-54349.patch \
-           file://CVE-2023-7250.patch \
            file://CVE-2024-26306.patch \
            file://CVE-2024-53580.patch \
            "
 
-SRCREV = "a0be85934144bc04712a6695b14ea6e45c379e1d"
+SRCREV = "917d2f02188f6f4cdc443df7923a4bde72017d92"
 
 S = "${WORKDIR}/git"
 

