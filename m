Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E2CCC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:18 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33256.1792043055858489663
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F3DMWlf0;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so3105722a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043055; x=1792647855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yjMuhQW7f9vMGDAtuTU7ix7lI22AZtBoFYZExtcwAyM=;
        b=F3DMWlf0NE4vm3XwFFBIegdQDdEbPtRuVuceKH2g9bvfGNsXUWNduYNsk7VKndD/O7
         srAQe/ap1utCmmedfgXodyNWu5YEr4G0t0DxcCYJ7Fsc9Bsb9K8YCOXgk970ryLxKMzA
         kcx0ReozH7Zz19PBohes0Xyd50GIYshJZY5UAisTAICxcjZS/UrI0zeLuDFIsHlUle7g
         ar7vEDUUZKjaYrYNZ4cWhiZf8mzGDVMdY/tnAjk3pMvrF+loxJ8u4Knibg7twrE+hbz2
         6SSLzpcoEcvr2BHN8vLeaTc+vHKvuXh/+RP2r51XU0QzC5r6qsmrIKxB0JPHlgKuS+UN
         kpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043055; x=1792647855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yjMuhQW7f9vMGDAtuTU7ix7lI22AZtBoFYZExtcwAyM=;
        b=MIHrq6YxDcpj6Yg2HwUKSpep5/TeQE7NwusYpCTL/66R8iS3QIUsOd7vUp1oJTawmP
         AJU0ZjZAlN6ptg7b8D0SsumkAKAQw9a5g6tYUyQfIDCLvYkkpAMOiLfVtjUWP+T6aqhs
         /yMwpbHmkBT8b9j0cnNd5zBql8Pp8xVoQxZCKraLNFy3jjnXJIGgsGZm1IhRadCTPMva
         WATpaUGrCGLwN7lEq1UMsSifNy2Z876xEzJBTXxWX6nQtbvqUa9GWbmrYxyGmyACv/Gs
         de8va17Z3o6zE1z9ZGgOmYAQD7dD642cZOWmpnmZyc7zOOcWGoHwt1Z6QzXi8fYBLh3r
         MZIQ==
X-Gm-Message-State: AFq9FYLJal0Y7lTkkxCo4BUgkds5tW37+ekFC8sqSp582u+U5Gce0owy
	Ng6ziN4G4VVQe3xqdKs+UQqg76Y0w+TuyOFX/87lkWSV8zUSOB4HhXs+7t1vsA==
X-Gm-Gg: AYBFou1fxsJiDCyvRjsQgasf7GDLBsQXrRdF2zzHCcev3ZxMTzOaGK+Jn1Gjf50F1tS
	RwHDoflcF46eo44Z9HnId7QXmLbMKISzP6dJZ4u7Dt3NmedttQgGTYBvAU/tqDMwjfA7wH8knb8
	5mthek6ZBJVlGYLGjcXKGb1jE1ye7mAkrKJ8G9JZWtJIk4NoDxP+CLkoP9b/5Y3cca4pwuHTGFB
	WuSkR1gIxlUc6oiSOeAw0itmbPwG+qxWCZj+qULMGtwzm4+eDgCIVgkKFMus3tc9n9ISkY24ii8
	eA4As0PTeLYNyhCslqr/36pQf3c9rT+ntBMOSKDuSfyRHrqsviYdUHE7EiA7XhYJMUUbOfbTk7k
	WGRIdR64+EUtr67X0mbyDXaRL2/vUgifQRE+8EzsITY5HWSO6wUW7q5mRZEcwoh6m5ffBF54IzZ
	uXpT5CsH5vI+id5vZLqDDuwkKwpoRiMZ9UOvDrYITGG32fVO+Q1Ohz8VBvmmwnORfgn1tOtLrlL
	yk5tn9naxhZfRUWn1VzUzpXxL0CARCvDQ==
X-Received: by 2002:a17:902:cf0a:b0:2e8:b5af:22e0 with SMTP id d9443c01a7336-2e8b5af2c29mr97649975ad.41.1792043055042;
        Wed, 14 Oct 2026 22:44:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 40/82] tinyproxy: patch CVE-2026-54387
Date: Thu, 15 Oct 2026 18:41:28 +1300
Message-ID: <1247ca6a89ab6acdd8ede30eb66555b3d86619d0.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130960

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
index 0000000000..c0199c1713
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
index a0ef5fd62f..e84aeae53c 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://CVE-2026-3945-1.patch \
            file://CVE-2026-3945-2.patch \
            file://CVE-2026-31842.patch \
+           file://CVE-2026-54387.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

