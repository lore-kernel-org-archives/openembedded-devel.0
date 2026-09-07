Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C84C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:23:38 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31903.1788776611019318122
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XFrEBkDp;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2720985a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776610; x=1789381410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSIhpuBUtQzGa1mzyMB4MJfcTE6WMyIvFYwMQtldhpo=;
        b=XFrEBkDppYhXcOYsRchN9imaxfdbetSYkSmZM3XI3/62zO7DhetgwF3yEFFDRP7tgK
         eXQfIQ22uzhR3xKTKi3Xi5p+fHkwJGSWGHL9J+ksKMckEK4Nu7ZM7r5otoeTt87yZhga
         6rljjBeYvTNOvaG9whu0wtmWBpfCc+ZsXdYuDFky6dDl0rHVvYKXPGP+RgEg9EAYu8Zt
         bJQult6nrD0sKDxmeerPmpnDsmEHyWqupQqCSM70vi5VyOcUfO/OfUYCvocieNCd53J8
         yX1QZOphWfLZYu8bY5/YcOwxK8eg6opq1ma5RCexViJf21iaYWKmoC8evI1fvC9peAXw
         G7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776610; x=1789381410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSIhpuBUtQzGa1mzyMB4MJfcTE6WMyIvFYwMQtldhpo=;
        b=FV1kWLPq14DR0sqc/5XUFRtg3WJiMsyoT6LAl2NoQoxYeiMsZm8pScoGdH8083DCKF
         zByuTpS81Fx/dlYuGxgkkuW2WSjF0/Pz5nOFlJv1GgBykszaU0k7RlgDveuH/qxp1uS4
         1A5MtJZSLRuSxuROhtzel7rnh2j9PEMoZ4A5VM4Dh6AsfaWULP4niPCzDNQkSGZq5clh
         xsFp7JhhKy+/Rr7fjDY2TSB2vHaMgypTOmIcnbwTVdcnL/9978mbRQIJGZ4O+++pJNQ0
         8t60sTn3dgg46WJN9UqXBWwNe48+9Yxg9wZF1KeJz8Qkb8CYF7DGLSnKbI9zJKUNx7v3
         Fvyg==
X-Gm-Message-State: AFuF++my3kpGI8wwq0DBclxbEbcrBQIFJYVvFou+1Sy9gg3yihb8U6sq
	0TwP5jvsXnyeLR6a67N/M463IPZsX1t5+Mz/PLSsd7TKxAJnNDQavblX4QhKvvUL
X-Gm-Gg: AYBFou2BQFJnk0aTV26x2IpmhWxEaFxjBJpMyLvRApPGjykoXvjE2zyQxNIY3MpIoEa
	u1IjxcsAWOrSQnhuNP3YbU9kk3RLNL0VC9xojlFEsbGVv7eGRsGz7C72SIW+rL/TWq+ndPJ8YGT
	SaDxKvn6IHzwrHMDzUA7Ci4m90PnDrnbAPVJ7WBItGlYyc52c1L4FsR0uZK9T/OwZapr182r5KV
	pLRtFKHXRqRh46Rs5UM9M98qOOZU8ecljah3VA0itPa5c9ovAd2/Mf/UMh/q7Xxq2TGjMBYVi57
	ldc5iY63Lq/SXeEXZGB1ljaYq8WOMKjLrOH4Kdjt6/oXKuJOD4Z6NeWn8BCmmf31H6N+G62K5jj
	o+1JRsGzpzDlt+YlC5prE/dBminw0HPVNiHWo1PlUqfoMUsOO7QsxbitzLQ75DomWBxRGt1hAVd
	l85Xn5+iQlb6LPEPy2Od+hKLEundlBG6JHejetnrz1byPMxPG5VRLFT//4+OpsocQy7WEWqNMdr
	w==
X-Received: by 2002:a17:90b:578c:b0:398:e6b6:acc2 with SMTP id 98e67ed59e1d1-39b261e7649mr35340541a91.12.1788776610202;
        Mon, 07 Sep 2026 03:23:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 2/33] libnfs: patch CVE-2026-57918
Date: Mon,  7 Sep 2026 22:22:46 +1200
Message-ID: <20260907102318.2459883-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129814

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57918

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libnfs/libnfs/CVE-2026-57918.patch        | 34 +++++++++++++++++++
 .../libnfs/libnfs_6.0.2.bb                    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch b/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch
new file mode 100644
index 0000000000..27c99b5704
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch
@@ -0,0 +1,34 @@
+From 589568b88a06d92b298ecce563ae57b5fad91238 Mon Sep 17 00:00:00 2001
+From: Ronnie Sahlberg <ronniesahlberg@gmail.com>
+Date: Wed, 10 Jun 2026 12:21:58 +1000
+Subject: [PATCH] socket: prevent an underflow in xid
+
+if the expected pdu-size is larger than the absolute pdu size
+from the xid/record-marker.
+
+Reported-by: Nick Hummel <nickhummel@google.com>
+Signed-off-by: Ronnie Sahlberg <ronniesahlberg@gmail.com>
+(cherry picked from commit 935b8db712b3c6649bc57ddc276526c4a31680de)
+
+CVE: CVE-2026-57918
+Upstream-Status: Backport [https://github.com/sahlberg/libnfs/commit/935b8db712b3c6649bc57ddc276526c4a31680de]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/socket.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/socket.c b/lib/socket.c
+index f51ca4d..8e38eb8 100644
+--- a/lib/socket.c
++++ b/lib/socket.c
+@@ -929,6 +929,9 @@ rpc_read_from_socket(struct rpc_context *rpc)
+                                 break;
+                         case READ_IOVEC:
+                                 rpc->pdu->read_count -= rpc->pdu_size;
++                                if (rpc->rm_xid[0] < rpc->pdu_size) {
++                                        return -1;
++                                }
+                                 rpc->rm_xid[0] -= rpc->pdu_size;
+                                 if (!rpc->rm_xid[0]) {
+                                         rpc_finished_pdu(rpc);
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
index 403bae9465..36676708cb 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=825301ba17efc9d188ee0abd4b924ada"
 SRC_URI = "git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
            file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch \
            file://CVE-2026-53689.patch \
+           file://CVE-2026-57918.patch \
            "
 SRCREV = "18c5c73ee88bb7dc8da0d55dc95164bb77e49dc6"
 

