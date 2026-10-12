Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CC6CC6B03
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:28 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5077.1791839479545545545
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B/muw4aX;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1195602a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839479; x=1792444279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFyHMMfDcpk0PFp6O8K7ZmTSmldNP8zLDG3pTHQX+ag=;
        b=B/muw4aXUJR+Eh7pRixSezQ0Fea8RYdkxCEJwjxC0WSJF7EhSCtitAbwgPFiH6lbCX
         6VYYnWJwIzQb8nvdlMPRcoaPnVFB78RyjN+fWf0aSh0Pdj7IqFgdojQjqBV7axjLY5t1
         SASZ9ibcFB+D5hAp8MmP7qzlk79EYeRp9OvoF6rTpTWHJDckjmgQ4AN2UZlNiiAMn6sT
         ac3uKLzvnRswl44P+RHe8uzZDvHE0utCCjdHBjU+XIlZXl3R55xgImIbmQEtsrbDbV9B
         cfWSXgLVajU0mEQ7sBAC8PmBMDRlk45m+PUG1HXvIRrCusxgOwPWwWfS1acWO0cqxUcS
         YFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839479; x=1792444279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFyHMMfDcpk0PFp6O8K7ZmTSmldNP8zLDG3pTHQX+ag=;
        b=iDx+bjNjhJ8vQ+ZTkoYgFuVq4KYRVp8gM59Zq8+RU1nsZFRk0GXuGwBRhC5l70uADc
         /rTg+HcCM009mfj/m0jKBVQ0a46EqNk61pbum0lhbPIodXZ7wLRTwnfR20/tCBfiAaE9
         RAzVVRdw4c24YrfXkFqlYUvMdc7icFoW2ixPtaxSXvuyeAL4JgfHZalZITxd078b2Ac0
         WVhAzFGNhLnLUEp0cKk0eUibiYyqfiI9J1UHFE6WAQnfV5ldRq9/EdBUqUpxTxN+WFSe
         emN8YHWCTin7W3BfluD3h8+lzCkX9VAqgewer73oB+n+3Vgkt6EHhFCx++/jtS5iOSSL
         qF9A==
X-Gm-Message-State: AFq9FYINWDz8hp6anFf6lmOfXWJtZunyiLCQSNTc4V9IoLvMtONWv083
	YT8mPCI/O0a8Wn1mBN8GmpnCXHhzjB7LDim4OrjPWLZQ+pvNNbtVHyIBgrCQtytG
X-Gm-Gg: AYBFou0TM9GU6bFojxWEX1hEE/vE0ZmdPe2wcz9HFnwWgKdFUwvOB3fKxKmJfpIVxDp
	0ZIrJqBpgoxhJQRLgddTiHk1pPtNyQjv3qLObp4ky9Germ9SswOFwcvv9/fqmnuNIKs9Q+jZKu2
	+jQsdJva/XMGvlg44ux34rytyjRYT7NRZ2Y5MaUuY5sbxVLLgGiQTprsooncpqNZnPoWJK5LIXh
	lg+AyIZxYVxJps0yhA5Aux3yS1gU9LJg0xLQB+pf1hi2AKnYCn+bMqw7c5+bAsgmJxW2ifZJz0G
	tdzaBslcKK0qDkAX/RX4s0S0YSJOxKIGDRblOdc8/EKrJvZP9R7HYrnoRVjucbtlHrIMrIu/4ya
	0it/J/BzTDNdOWPLJxc4+YxlZcfBgYDueLqwcAZEwdbWFQXJGOd6DJBa1A1KuD4hrVV84MSus3X
	qlK9z/+zLN2wxASGItNnGbJPDPeQWCB+RY8IMp72frTRgHmVK9qokf/1qWSM/JDn3UCR9XjeV7I
	c0MCi8saxgRWFZntb3wTl8etzIQnBmLtQw3p5Lyitqe9JQ8Ow==
X-Received: by 2002:a17:90b:3a48:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3ab3a29185amr8986031a91.1.1791839478882;
        Mon, 12 Oct 2026 14:11:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 24/43] libnfs: patch CVE-2026-57918
Date: Tue, 13 Oct 2026 10:09:48 +1300
Message-ID: <20261012211009.3352822-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130794

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57918

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit bb3f5628f16b0ccac36287f6355c95000233c57b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libnfs/libnfs/CVE-2026-57918.patch        | 34 +++++++++++++++++++
 .../libnfs/libnfs_6.0.2.bb                    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch b/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch
new file mode 100644
index 00000000000..27c99b5704f
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
index 8068d35e1ca..ef99118230a 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=825301ba17efc9d188ee0abd4b924ada"
 SRC_URI = "git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
            file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch \
            file://CVE-2026-53689.patch \
+           file://CVE-2026-57918.patch \
            "
 SRCREV = "18c5c73ee88bb7dc8da0d55dc95164bb77e49dc6"
 

