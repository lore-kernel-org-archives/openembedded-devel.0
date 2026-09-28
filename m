Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F63AC9830E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 02:38:18 +0000 (UTC)
Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49083.1790563083903200626
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 19:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R+uoo5XT;
 spf=pass (domain: gmail.com, ip: 74.125.229.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3427493501eso1038568eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 19:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790563083; x=1791167883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UEilX6q3HdVU8nYbAd7SBZ3GEA35dseH+VWYfYed8LE=;
        b=R+uoo5XTrgitO3bVFxO5jcJmrHR8HrAxhtC0b1pKhKThlXGnobTwTpDzxLzW0mvOjJ
         DSX+kedb10pcSPp/bZGIfQEbPfWRuA4+Uhe/iRTm/L58aLosU5D1cRjlhG9Wf2Uvy1Cy
         Nr4XXOC5qEwteR1mfvrUhyZUmNyIPjuMJRl0+w+0TpHYGF+vS6lQ2T/YwJIGr2RZ6s4X
         AnOdMwi5YCNcne2SHlEVyAzDAczeIFoS3TKs+OjUyMWR/Sgg59Kw/4dE2tIChS5WbsGh
         c/AMYrN8G2pk96Jhj9fAHVKmwfhQ88VfaK2+iEL7SDaGBnTdoC66/4Gllp3SXVUJHx4N
         Dkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790563083; x=1791167883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEilX6q3HdVU8nYbAd7SBZ3GEA35dseH+VWYfYed8LE=;
        b=dHyRb0OWy+anT6g6tq2gP5YMcEQbtYBVYigscZiY77fBQx+muEXCJASWc41WWMGRFx
         jBLrwt2kmEsCw+YN7p0Rs4Ik90XEKyGstmvRvLLO1x0C0z0i6s9B67UkursAh+G0loLe
         +GInTR3N3PCkJeanYQlqETX8mgHL+nZZzGFU28klQGly8RWh3DEIvBJC5iqYMocxqN6N
         W9yofwR+Lyp9sLxWaVE3FwtOHIN1lCFvua3kv3rs8U4jPZbtNrchqVbEVhUA1smeDcgp
         w0Bq2G+sFdpyHSShF7jRVEJXfP5h7FZk2h/DhJksu6Uodwm/fk646to2cCSsbLu18PgN
         jEVw==
X-Gm-Message-State: AFq9FYK6x7LbpgsPcvVTafVAG4qe6id9n9JLYmi8FD4kLUR/KFfWygEx
	ofumCGAppqOpkfUcxaUmOX31ygWmlIF8KyO3ewCs5R39yYaOtTdcvanTyj0QeWMm
X-Gm-Gg: AYBFou39EjOX2211GZJ391bevC8gTlNP/av2STo8jLr/PdjBj0JlYlOZF5N3ntYcgS9
	OUrtyZtJyZzvdwnxG/rhSvaEXKS18NTM2Up83guXolN7XAqL7+5l0DPz0xaSUnhAEiWBm2t6xbX
	c5YLpc6XwpUH4ZfcLzTPd46iWQgZosrc0lsj5wl7zF5JKd8EhVatSCkGA9zSoRFk6eVbU/t0S63
	N5Nwsez+OyTqpqhlFJMf75WuiVJ7qLEf5AcXIEsiWnAQWo5lqluUSB3hLxeRni8NPl5AfS4jon2
	CmBokFwnBfw/Gg1bfhJgplOUCpLBWg0hTplEWxhjjpUMD6hCyXjyqly5PHCOU2irZJ7HKzXsbrA
	SKJglCdi5PNBbr4Qg1sCoDQzJcN9ss/DvsACCrjktCRfEIxBOjZwUyTX/42vp9S5MzOP0Jtr1ve
	JJoOGUyS/D88yIWW+qs+sY9HJfYwVNflwUWEmpjToUfZ9skJNKq82p9mQbZ8eQ+Zm5l7TXbJl+/
	1FCAaTW3n/yqYeUt+PpReAGdh2HtjXqWq2gjCZTaPeTfltBm+wbyWv6gyzO3R8hIDJg1VQoBQ37
	OBUH6aJST7FsDaeMdAL1ZYEHR1EABZDHZrpO+gCYsNqDis+qPVLROGLGq5Kue1G+wXlhpInTBye
	Z5NcCEGgSm52FRMWtIlTP61BSPFwWgka4GGe2gpnoCg+duyMu7U8vI3ULgf/gPMu/MDegGQ9pQz
	lQxPiVr2NuDJz8L8o98f2DWHMNjP9AwBp4UllXAg==
X-Received: by 2002:a05:7300:ccb0:b0:347:2431:d3d4 with SMTP id 5a478bee46e88-3472431e0d0mr2263036eec.32.1790563082956;
        Sun, 27 Sep 2026 19:38:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347834cf4d3sm2207926eec.7.2026.09.27.19.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 19:38:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 1/2] lksctp-tools: fix sctp_connectx() and ptests on musl
Date: Sun, 27 Sep 2026 19:37:59 -0700
Message-ID: <20260928023800.2665021-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 02:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130422

Three func_tests failed on musl:

- test_1_to_1_sendmsg and test_1_to_1_recvmsg died with SIGSEGV. They
  pass (struct msghdr *)-1 and expect EFAULT, but on 64-bit musl the
  sendmsg()/recvmsg() wrappers copy the msghdr to clear its padding
  before making the syscall. Issue those two calls with syscall(2) so
  they test the kernel's handling of the bad pointer.

- test_connectx reported "Association id mismatch: connectx returned 3,
  notification returned:240". libsctp exports an unversioned
  sctp_connectx alias of the original API next to the VERS_1..VERS_3
  versions. musl's dynamic linker does not implement symbol versioning
  and binds that alias, so every sctp_connectx() call on musl ran the old
  API, which never returns the association id. The alias only serves
  binaries linked before libsctp was versioned, so only emit it on
  glibc; sctp_connectx@@VERS_3 is then the one musl resolves.

Tested with meta-networking-image-ptest-lksctp-tools on qemux86-64 with
yoe-musl-systemd-wayland: TOTAL: 1 FAIL: 0.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...invalid-msghdr-pointers-straight-to-.patch | 72 +++++++++++++++++++
 ...port-the-unversioned-sctp_connectx-a.patch | 49 +++++++++++++
 .../lksctp-tools/lksctp-tools_1.0.21.bb       |  2 +
 3 files changed, 123 insertions(+)
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0002-func_tests-pass-invalid-msghdr-pointers-straight-to-.patch
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0003-connectx-only-export-the-unversioned-sctp_connectx-a.patch

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0002-func_tests-pass-invalid-msghdr-pointers-straight-to-.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0002-func_tests-pass-invalid-msghdr-pointers-straight-to-.patch
new file mode 100644
index 0000000000..b73dff2025
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0002-func_tests-pass-invalid-msghdr-pointers-straight-to-.patch
@@ -0,0 +1,72 @@
+From 5402bce533c3ba8dae022eded7c6ffe7967b7248 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 27 Sep 2026 15:52:39 -0700
+Subject: [PATCH 2/3] func_tests: pass invalid msghdr pointers straight to the
+ kernel
+
+test_1_to_1_sendmsg TEST6 and test_1_to_1_recvmsg TEST4 hand
+(struct msghdr *)-1 to sendmsg()/recvmsg() and expect EFAULT from the
+kernel. Passing an invalid pointer to a libc function is undefined, and
+on 64-bit musl both wrappers copy the msghdr first to clear its padding
+fields, so the tests die with SIGSEGV before reaching the syscall.
+
+Use syscall(2) for these two cases so they test what they mean to: the
+kernel's handling of a bad msghdr pointer.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/func_tests/test_1_to_1_recvmsg.c | 7 ++++++-
+ src/func_tests/test_1_to_1_sendmsg.c | 7 ++++++-
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/src/func_tests/test_1_to_1_recvmsg.c b/src/func_tests/test_1_to_1_recvmsg.c
+index 962b7b5..0ccf087 100644
+--- a/src/func_tests/test_1_to_1_recvmsg.c
++++ b/src/func_tests/test_1_to_1_recvmsg.c
+@@ -56,6 +56,7 @@
+ #include <sys/uio.h>
+ #include <linux/socket.h>
+ #include <sctputil.h>
++#include <sys/syscall.h>
+
+ char *TCID = __FILE__;
+ int TST_TOTAL = 8;
+@@ -158,7 +159,11 @@ main(int argc, char *argv[])
+ 	inmessage.msg_iov = &iov_rcv;
+
+ 	/*recvmsg () TEST4: Invalid msghdr pointer EFAULT, Expected error*/
+-	count = recvmsg(acpt_sk, (struct msghdr *)-1, flag);
++	/* Call the kernel directly: libc wrappers may read the msghdr
++	 * themselves (musl copies it to clear padding on 64-bit), which
++	 * crashes instead of returning EFAULT.
++	 */
++	count = syscall(SYS_recvmsg, acpt_sk, (struct msghdr *)-1, flag);
+ 	if (count != -1 || errno != EFAULT)
+ 		tst_brkm(TBROK, tst_exit, "recvmsg with invalid msghdr "
+ 			 "pointer count:%d, errno:%d", count, errno);
+diff --git a/src/func_tests/test_1_to_1_sendmsg.c b/src/func_tests/test_1_to_1_sendmsg.c
+index f2949e7..4f46c78 100644
+--- a/src/func_tests/test_1_to_1_sendmsg.c
++++ b/src/func_tests/test_1_to_1_sendmsg.c
+@@ -63,6 +63,7 @@
+ #include <sys/uio.h>
+ #include <linux/socket.h>
+ #include <sctputil.h>
++#include <sys/syscall.h>
+
+ char *TCID = __FILE__;
+ int TST_TOTAL = 14;
+@@ -200,7 +201,11 @@ main(int argc, char *argv[])
+ 	outmessage.msg_iovlen = 1;
+
+ 	/*sendmsg () TEST6: Invalid msghdr pointer EFAULT, Expected error*/
+-	count = sendmsg(sk, (struct msghdr *)-1, flag);
++	/* Call the kernel directly: libc wrappers may read the msghdr
++	 * themselves (musl copies it to clear padding on 64-bit), which
++	 * crashes instead of returning EFAULT.
++	 */
++	count = syscall(SYS_sendmsg, sk, (struct msghdr *)-1, flag);
+ 	if (count != -1 || errno != EFAULT)
+ 		tst_brkm(TBROK, tst_exit, "sendmsg with invalid msghdr "
+ 			 "pointer count:%d, errno:%d", count, errno);
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0003-connectx-only-export-the-unversioned-sctp_connectx-a.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0003-connectx-only-export-the-unversioned-sctp_connectx-a.patch
new file mode 100644
index 0000000000..002da14b82
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0003-connectx-only-export-the-unversioned-sctp_connectx-a.patch
@@ -0,0 +1,49 @@
+From fb2fa4a7af169878f7e7cb2fbf3dba00639d73ed Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 27 Sep 2026 15:52:39 -0700
+Subject: [PATCH 3/3] connectx: only export the unversioned sctp_connectx alias
+ on glibc
+
+libsctp exports sctp_connectx four times: an unversioned alias of the
+original three-argument API plus the VERS_1, VERS_2 and default VERS_3
+versions. glibc honours the version recorded in the caller, but musl's
+dynamic linker does not implement symbol versioning: it skips the
+hidden VERS_1/VERS_2 entries yet accepts both the unversioned alias and
+sctp_connectx@@VERS_3, and whichever comes first in the hash chain wins.
+That is the unversioned alias, so on musl every sctp_connectx() call
+runs the old API, which ignores the association id argument. The caller
+then reads an uninitialised id, e.g. test_connectx:
+
+  test_connectx.c 3 BROK : Association id mismatch: connectx returned 3,
+  notification returned:240
+
+The alias only exists for binaries linked before libsctp was versioned,
+which is a glibc concern. Emit it only when building against glibc, so
+sctp_connectx@@VERS_3 is the only visible definition elsewhere.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/lib/connectx.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/lib/connectx.c b/src/lib/connectx.c
+index 2a21e3a..119f6c9 100644
+--- a/src/lib/connectx.c
++++ b/src/lib/connectx.c
+@@ -76,7 +76,15 @@ static int __connectx_addrsize(const struct sockaddr *addrs,
+ }
+
+
++/* The unversioned alias lets glibc resolve references from binaries
++ * built before libsctp had symbol versions. Dynamic linkers without
++ * symbol versioning, such as musl's, pick the first matching name
++ * instead and would bind every sctp_connectx() call to this old API,
++ * which never reports the association id.
++ */
++#ifdef __GLIBC__
+ SYMVER(__sctp_connectx, sctp_connectx@)
++#endif
+ int __sctp_connectx(int fd, struct sockaddr *addrs, int addrcnt)
+ {
+ 	int addrs_size = __connectx_addrsize(addrs, addrcnt);
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
index f30b7439d5..1f27a04b0c 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
@@ -13,6 +13,8 @@ SRCREV = "37d5f1225573b91d706a5e547d081f79963a9deb"
 SRC_URI = " \
     git://github.com/sctp/lksctp-tools.git;branch=master;protocol=https \
     file://0001-func_tests-disable-FORTIFY_SOURCE-for-test_1_to_1_re.patch \
+    file://0002-func_tests-pass-invalid-msghdr-pointers-straight-to-.patch \
+    file://0003-connectx-only-export-the-unversioned-sctp_connectx-a.patch \
     file://run-ptest \
     file://v4test.sh \
     file://v6test.sh \

