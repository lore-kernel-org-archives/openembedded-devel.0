Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41401C79F9F
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:09 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31917.1788776644679346530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FgHTrgos;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398b3c37877so3082714a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776644; x=1789381444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFI8F9qA3BdlK1kvw0Ujwxue9TfOw8o+bdHfSOX9Q5Y=;
        b=FgHTrgosPLI9XQS1I80Ffu1dlIclnWq3nu078kLckWOVvH1oxg4laRtuq1Ou0VV91y
         IHHlKg3t5atFI3Nm7GvzG+S+JC4TkR9OQdaXwjpHoiixQsiqJ1ykoNanBrw4BfZxwenr
         1790TBJrxfsDktMFf7Nr275c8j63jpiXO7+0d6QhJENHuQA2r6qP6kANSSKPB204IENI
         RF2aBCrlxR/r1Sh1PMa+X2+6XyEpn8OP/MxdgiMtlJl0qjo3EenJ/lWuiYwGO3A2+iVH
         Fqm2RWqRGSs1VD+0/T1YdAEJgKz5KkCw9TAD1OMzMdEdzbDX3MwWdW/YF0w7G0BaZMI5
         4ZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776644; x=1789381444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aFI8F9qA3BdlK1kvw0Ujwxue9TfOw8o+bdHfSOX9Q5Y=;
        b=miuqM6qZGcIzYNvQ2sFzJpLQ8/4OcA8mqt+qlZXCUF36qujUNvfug0oFLSjmvlot8i
         AkGznRxQUv5RHXE5MNj1U/8PFG2qdJ/AydfJcmjCR35o/CIFB8XAhbGo20qU/cezuTRG
         xzzgg5MzeP66mXBGZoFyuXgP3usSOOGJibe+dvlgGMl0KNxDGf8dlMuO6NCmZIKRj6es
         ybNzKpGPZbXasUTYYVerVuEY0gK3TuWEg2uj5HdRvaQUx9OzcmcgInUj44/chErT0eGw
         OW4D7rz6kkd63s1mV2LprCbssA3gIOV0ms5bFECwzxAD5blODhJF8ljA76pw1Rs6YwKR
         f3Ww==
X-Gm-Message-State: AFuF++nP7zGYba9g0b7JMOAHIHVoeuhUmke6866CBmxoU8he8lC4wHg5
	7HmK86pd6fk3beqOGcQwirnw0n1sagb3kX1IYdO/7Ogo26FZyJd8Sexbl1rKNTnu
X-Gm-Gg: AYBFou1oBZPrz1J1jdDWQgYgmtMbmI9hog1kb5ca3+Ue1ueH94KdUR9U/NAk3roQwvw
	aAngJLUt4qGawTfeSOVMHKQE0nEOjNOHR1ntuLtFDehgO23588rqlHyvBs7Db7I5fdBTPdv29Y0
	e/QM5zBwGkyDURkhYoUlt6mqly6IIy3+cNgBc95GY7gDgJjGir4r9Wxsq7H7mGTflPeo8RayEvN
	42JmlKEjTBD26XkepoqMr6EmobiZiLoFIBMybzqNXrYcIZ7nvQbz6bUxU5I/bsoyOiR63LVZhDX
	l82YE94G3gDjCmJQBNe1qwMwk+MGbH9RQi3ZdtNwl45DcR7poENHzKDZWzRHf4ipC2UM8fQTk1M
	UIJ2eBBPU+MVMMZxFB2a41zNfFsBsxDOpruP6dvGfKtl0BaePnndw7oVveOU1R4HZn9/GSPqIGZ
	4gMBOnm8V4paJNmMg6nJhreha9ckeXhV/mlD+KZco1YSgcOAIXrsfFGCni6QBHswS3T58oKnAQr
	JviNbvNrXw=
X-Received: by 2002:a17:90b:2b4e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39b261d0d8emr34214430a91.15.1788776640839;
        Mon, 07 Sep 2026 03:24:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 13/33] tinyproxy: patch CVE-2026-54387
Date: Mon,  7 Sep 2026 22:22:57 +1200
Message-ID: <20260907102318.2459883-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129825

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-54387

[1]https://security-tracker.debian.org/tracker/CVE-2026-54387

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2026-54387.patch  | 37 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.3.bb             |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch
new file mode 100644
index 0000000000..b12572f0ad
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
+Upstream-Statys: Backport [https://github.com/tinyproxy/tinyproxy/commit/623bfc093df009296f0b85d40bc677ef9d5c09bb]
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
index 4ce766b40b..b8a508d8d4 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://CVE-2026-3945-1.patch \
            file://CVE-2026-3945-2.patch \
            file://CVE-2026-31842.patch \
+           file://CVE-2026-54387.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

