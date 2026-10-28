Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36055.1793161502554780014
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oCGg1PVq;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so276939a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161502; x=1793766302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxYAX0lCPWv/um9gq489mogC8yAXGqw0/0rlkk/qW2U=;
        b=oCGg1PVqaeagDzMX84k1ZkcJA8db3XmXSzT2OtYJP/0cayC7yEBlYSk9UqPx6wK9UU
         4Nh4UioiWr22QDz0DPU7rWKvRRJIo3TZK1+S0bTztygovbAj5eZKHIpwDdT5e5XFjgLu
         yHIyRZqKHLxiw71a1noKgTcSDo4uNWRH047u4u2YVqeceJ37MHij6diYFh+UlsgvogHG
         pLUNzjcKvaFW6moIIzxzcUM/nFFAKhCJ0ii7iF1IxqL18WeuByAhAAkxW1IdM6R+hERM
         i4l8JJVF7tvE7Ix5dJt/xCG2ADYrVWv1iP62e7BF34I4UZpBto0Jk02h0pgfnY0DBfpn
         mQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161502; x=1793766302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XxYAX0lCPWv/um9gq489mogC8yAXGqw0/0rlkk/qW2U=;
        b=eVoTLbe75ndntU7uleLCQaIKvq4XkyPmfTOMli7wJRusqm6ctO6yGKxzCijTI+E85S
         /OyQc1bcElJCULTowg6ifk8bEh6zf3rKY1zuTXcZIwJ5KFujC6BjagUD3SL18/yvDSQg
         FonbuS/DGVk1Ns9yAOsCNaZTWiwOnXM+EyB0ga2+QTdN72YrRQ7V19uMkI/OsWENjUQh
         pb7vfJhJRvcMolGROi2IeF9GKBCx+YXaWmpTIqwZj1GmIOkIziaD6UCLSi+Zn9dDnAeC
         AsjgFcCpHNhuDIvZtViO1ULUIoeT5vz+ejGHxW/ZiPKMSlBo87VIJMocBjgO7V077New
         4M7A==
X-Gm-Message-State: AFq9FYJPJwa7UDckNLRqrIPaAWVZ3MC4SL1B/1HBamcWjq7DCMq0dc+U
	x+rcSpVxg0PYB/wK2yx7ScJvbn3KEOKyDV8h7ZHFImSbYWYwN+6P8VDAQvw+Sg==
X-Gm-Gg: AYBFou1NgYNOYvTVqi4tk03qIQYrrkEXKXDfnlayKK76zWGANnq/Y6Bo9SPJzkBIhxt
	IYJKnxdLkeTWHYD0zQrttiDOoKCt9hC3B0gCGwVL6SZqaeeeFe5GsLpPfN5zIExisB+wuGOoXBQ
	LuQsXgAw+9Zd0DHaQVSlxOSU69EIGUk2Vv/e/TWbGtlCg5z6l0NbPpJ5a2XFPIFSTxS69lFii0n
	1ofa/sIzOIvQc2nO1fwd2wyY8oOiEmyXOe05bWSVlsPYKZqNcB3fyioWcwK8Jy2A/gk2p1WmvzE
	UoJdyzxiig/ulQIXfSTvvGZNnTbVAAt2qWfB9/OQ7ZxmYrs8LLUp7lH5+bNz/fEECYiyFn+cr9Y
	E/xIDS0yHQ8IqGo55+4rMt8XINR7rcm5hzqlQiL3GTx+HonSVB2M3nwkCEX6KVzdXGgWCbbWlvV
	EDujZXUWe7Z3J4BXCeTBfPR2OC28AWfKY6e7ToBJva1Kq82B6dYlFsvkvqYzF5oHAGtV6zLX7nS
	iu84muGoqUwUXX5X4qhyZXt9yDoXC1eA06wzfahmSxjBsOe/IkbW8s8SgG/eyaIb2JJTyojBOmP
	mInZ9z+9Jatp1ajDDnqUv+BpAguyPZEAEK8GRnMwE8l6Pdp5UbPMjaEgOp0fSQ==
X-Received: by 2002:a17:90b:1b0f:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ae580cb98emr872923a91.21.1793161501911;
        Tue, 27 Oct 2026 21:25:01 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 24/60] pjproject: patch CVE-2026-57160
Date: Wed, 28 Oct 2026 17:23:22 +1300
Message-ID: <78f0ee20ccfb85b9cc8477e19bb143110d975962.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131576
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57160

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pjproject/pjproject/CVE-2026-57160.patch  | 42 +++++++++++++++++++
 .../pjproject/pjproject_2.17.bb               |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch
new file mode 100644
index 0000000000..a25ed5a28e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch
@@ -0,0 +1,42 @@
+From b14ebbccf5c228ca298ad11ecae2cedde792edae Mon Sep 17 00:00:00 2001
+From: Nanang Izzuddin <nanang@teluu.com>
+Date: Wed, 17 Jun 2026 15:43:46 +0700
+Subject: [PATCH] Merge commit from fork
+
+When printing a generic array header (e.g. Allow, Require, Supported,
+Unsupported), the ": " delimiter following the header name was written
+with two unchecked stores. copy_advance() only guarantees that the
+header name itself fits, leaving as little as one byte before the end
+of the buffer. The colon then consumed the last byte and the trailing
+space was written one byte past the buffer end.
+
+Use copy_advance_char_check() for both delimiter bytes, matching the
+boundary-checked pattern already used by every other header printer in
+this file.
+
+Co-Authored-By Claude Code
+
+(cherry picked from commit d6a0e7f76611c3a6f530ee051e3e7a622bb1748c)
+
+CVE: CVE-2026-57160
+Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/d6a0e7f76611c3a6f530ee051e3e7a622bb1748c]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ pjsip/src/pjsip/sip_msg.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pjsip/src/pjsip/sip_msg.c b/pjsip/src/pjsip/sip_msg.c
+index 06c8cce86..cdc99ff9e 100644
+--- a/pjsip/src/pjsip/sip_msg.c
++++ b/pjsip/src/pjsip/sip_msg.c
+@@ -964,8 +964,8 @@ static int pjsip_generic_array_hdr_print( pjsip_generic_array_hdr *hdr,
+                             &hdr->sname : &hdr->name;
+ 
+     copy_advance(p, (*hname));
+-    *p++ = ':';
+-    *p++ = ' ';
++    copy_advance_char_check(p, ':');
++    copy_advance_char_check(p, ' ');
+ 
+     if (hdr->count > 0) {
+         unsigned i;
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index 59684ac7c7..254a2952a2 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag=${PV} \
            file://0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility.patch \
+           file://CVE-2026-57160.patch \
            "
 SRCREV = "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
 
