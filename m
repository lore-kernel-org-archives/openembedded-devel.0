Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA66CA9EDC
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:43 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5118.1791839496437333340
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=npN9/5y6;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so992208a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839496; x=1792444296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXyyvuUcu5QLDCsKxmVu1m7pp0gj/ECe/+J84LPSuKM=;
        b=npN9/5y6gFuF3dQSvd6Fiqws7bPThbGtqIIIKRDwnjrOQul9fwayhpiK6h9JoIVfyC
         5EF0Pw9vH3PVuup3KUnZ3hsRWjhcStSOzuw8+jmD745W6rB3wzLWiiM5T0dpb8SneUpI
         bs56R3kEkoFmcHYQ5ToCHwwO7engUAxPCqeo4eoINxzC5y6M6EXrXdtUMh/f/0ngIeDB
         uGA+VQhcQcmM34Ep0jXjx5hWDZtWPGzNa37hfE/5tELk9vRJ/hzTLCiJMagB1R8xR8cS
         XLyKBkmHxw+RLoqRmQPqhvedW44mLnq4FZJ3c+FQEsBwNa2Zv60WN+FK9MYBBM3SWm9p
         xpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839496; x=1792444296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NXyyvuUcu5QLDCsKxmVu1m7pp0gj/ECe/+J84LPSuKM=;
        b=x4s392j0344ovVOFApRPT8wMGtYimAs6rgu0pJzNgMWz+Ww6zSQnoEorCfaxSIGxHY
         Kyt1n0dnUWRAEx1BY3daCIi/4cIE2F1itb6VXAoWStChRrd9FzgXeDS7sDHEEBOp40qR
         iKifKkb+ePSPUGdLX04TBMEGKBeIqnkGR0U3iTvM5cidNZJr2PMSUD3RKfLgX4W9RMKN
         ox/RApuNtr1eiSh6T7nK3538MLgIyRCfKtEyK8R8HiCbKYuIv8c9yb+DpDvSk1g8la99
         HgmuM4Y8OhOcWm/bW3TyvWCjGu4lKrVrY/kt2eqYyBhptIq1DAWupLdesGJwTYw8nKxO
         HuLg==
X-Gm-Message-State: AFq9FYJQ6hubQxfDQ1F5fheaF1/0Iv2nQWSQlyBSzIphyvmjTiXoFqc0
	pOG/b76SrhMKsbWfGOLpRFA6I5Y6MhI/TXKeGvLtAicwMxHPP9B8Wy7pRU+YBW8o
X-Gm-Gg: AYBFou14217OQQ9vZXOv+xCGuM/Bs9O0IJw+PfBcKzxqxFwbtYVF/WhNWE70iduQ3sL
	8henWMWigbe/3evnJ++P9E6rx/nW4FuPY9QQLuR1+9MFJn8GQoKtxbQhcSyoshH7Y8z4U2Apy/e
	/ICAk2TiDJ+FaSiwQ4CLe6cZHnlodw2y6E+fyVjYVo8GE0TdWkW0wARWKpoptMTL5Y9aF7+HaMX
	KAXGZTRUeIJnIQir7RqhaNSGRGQTPrnSE+n4LEJvlEiOukgo2guJWJKLEEAfn7Av5nytIq242y2
	1FdR33u38pyd94W3Xh54R976kIwDc1UfMMXvrZECoFtBPFzHSRQ+wVjQIsRCAvo/XJTNalPN/XJ
	CD4zupexX4Nj7JDALWyShoGNdKYpPW/h4O3Wziq6FBYJbUmU283wmvz8ca7fgSvHnsp8j6KTPcr
	ApLinNE4kfiRtTOpWbBybniVbO1u4eYEYq2APyMg96Ty+j8W6p63AZFno3GoMPbZgu0FqzJVCZu
	PIZ/ZuYwYfzw9vf+0dSrcZiCYjgtG++9sNn2DGEoq4+GAwJWg==
X-Received: by 2002:a17:90b:3851:b0:3ac:17c:6e88 with SMTP id 98e67ed59e1d1-3ac017c7026mr2593436a91.43.1791839495722;
        Mon, 12 Oct 2026 14:11:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 31/43] tinyproxy: patch CVE-2026-54387
Date: Tue, 13 Oct 2026 10:09:55 +1300
Message-ID: <20261012211009.3352822-31-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130801

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-54387

[1]https://security-tracker.debian.org/tracker/CVE-2026-54387

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 33649b065762429d18d1d9e9ec94deedb6edb63a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2026-54387.patch  | 37 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.3.bb             |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch
new file mode 100644
index 00000000000..c0199c1713c
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch
@@ -0,0 +1,37 @@
+From a9602e492cedd5d5d18dd3675d9be90e9b0d9e66 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Thu, 7 May 2026 16:33:11 +0000
+Subject: [PATCH] reqs: prevent request smuggling via both content-length and
+ chunked
+
+addressing point 1 of #609
+
+(cherry picked from commit 623bfc093df009296f0b85d40bc677ef9d5c09bb)
+
+CVE: CVE-2026-54387
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/623bfc093df009296f0b85d40bc677ef9d5c09bb]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/reqs.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index 8b68538..e3cfe76 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -942,8 +942,13 @@ process_client_headers (struct conn_s *connptr, pseudomap *hashofheaders)
+         connptr->content_length.client = get_content_length (hashofheaders);
+ 
+         /* Check whether client sends chunked data. */
+-        if (connptr->content_length.client == -1 && is_chunked_transfer (hashofheaders))
++        if (is_chunked_transfer (hashofheaders)) {
++                if (connptr->content_length.client != -1)
++                        /* request smuggling, see GH issue #609 */
++                        pseudomap_remove (hashofheaders, "content-length");
++
+                 connptr->content_length.client = -2;
++        }
+ 
+         /*
+          * See if there is a "Connection" header.  If so, we need to do a bit
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index a0ef5fd62f9..e84aeae53cc 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://CVE-2026-3945-1.patch \
            file://CVE-2026-3945-2.patch \
            file://CVE-2026-31842.patch \
+           file://CVE-2026-54387.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

