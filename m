Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFAECCA460
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32826.1792043053706728898
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i6sUw+61;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e96502e447so1394625ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043053; x=1792647853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KpMwLnL6wAqNevPu8zxDJVvmLS6nwimunZtoBl7R2S0=;
        b=i6sUw+61wIvPbARNO30hL5CcfMRL+1z4a3OBCgwHzqXRS6aJxv4vkVX0DRZBeDwGmR
         iBwMGBcvO7xQWsKBOV1HLRMRC2nGOjFRZDajr1Owz/Hksy0ZpG0c3uPxn3mHtCTLEJlX
         H8iRugI3b9RDWHmCVhXCOf8ZRzfY/BBRwazP4Nzhequ8aaaWbsm0vK9TLBLHCGMqL2r4
         n+EuU0/rC8vJVUK3ORVrf8lPnjRqQmajdJw9AU6BhgsrO0tIsfipYJIKeNg9fg4lWPYL
         4Mx7mslK1fQrpCEGlTFg1N6gFEKgyQ7sKwnPdK6aGK9o1ef6af8YwJDKHIC2JAg1BlmY
         VGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043053; x=1792647853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KpMwLnL6wAqNevPu8zxDJVvmLS6nwimunZtoBl7R2S0=;
        b=I/HNUrI7cKkUlk2qExl1ZKH6Ykiy1GruFprawNVS0x4FfGyMKITIZZbyHFmuq9KEhe
         O3rMG2ZY1/UvtM30RB5gEs0nieXsIyjNwPKevdM1U8fBItS195EH9da11aElYCtZwMhw
         Q9EcEmucrk+hwQw19ssD7lDeMF+wCK5C+l8E5r9xHYy7RqMI8E6eSo6E2Extp0oPnUpG
         nm3tiugz1zWS7rGOFdkD8JO8UbleavqDbBUKS/k7OGuelRF4F+EY4+WfqA1jRIjNk9y1
         Dbcb5TDYf2nwUWT3I+4tfMzv2QQOnD3gTY08WMes8G7xZm5yr4iTw5RKAsOp4QWfUQCq
         EvEw==
X-Gm-Message-State: AFq9FYJ8lW+QIgvTxT/85F1RU2xp+hAMkj1baEN08JkAsA+YNTJTPCYY
	7yT0Jhnn1iZ1mu9njLMynMFj1FDz7P9rt7mgvThQvH4SEvpzAF6TU5V4jNO8DA==
X-Gm-Gg: AYBFou2j/wdiMt8WrsTN7qS72K8WFTjBygi8Ymwm59W5cqKLCtyvyLj1E9JLJSXJOaR
	wOJhOBeFZsy/ex2wEvSnE5dGJdrcMcXjOPzL8cCuTRY4OZLkAWqOEx7Bnbr+PrFr/g/jfbM/KCp
	EdYcSirdMb2snCKYgVXKnmUcO1kLOT4860WEor2CZFJ5ZFEhpZMtPEN1/bg//kAPcP0gMnUNKAr
	2pYz78Xeagh2TQF/TlZKxKzhHq7fMY7zFxpasDFBiP/rlHyPGxdHG1nGnwPdtKj4Vq4qPQIwKDZ
	THeialum/r5IDDt/Mv8kg2Zopmr9Riryq19SmMede+EhGhR6xway3LCkRzeYbga30FUOr3ChDpX
	xVKW6ENxI46K21syK7azLuX0tZk7uiKBxu/NIBZJQmwVnd0+oljWDuyjxbMSdLBPQgX9uq9miwj
	8FS1Y6m+DEheuMuRN20fA0xvKFHGRF9QnqN4lgCcThVca1O9cMKUwrFGREBPU/oQXSqyV7tMEVE
	iklY711DALiSF62oHqXpSg=
X-Received: by 2002:a17:903:291:b0:2e9:5a8c:5ad5 with SMTP id d9443c01a7336-2e95a8c5ecbmr11471065ad.20.1792043053013;
        Wed, 14 Oct 2026 22:44:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 39/82] tinyproxy: patch CVE-2026-31842
Date: Thu, 15 Oct 2026 18:41:27 +1300
Message-ID: <53ec96a06c93c49014d2890fff2554e549b6503d.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130959

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-31842

[1]https://security-tracker.debian.org/tracker/CVE-2026-31842

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 985acd9e7c375e17a674be4c21e9e80d0259eb38)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2026-31842.patch  | 33 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.3.bb             |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch
new file mode 100644
index 0000000000..6b8c02d629
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch
@@ -0,0 +1,33 @@
+From ed5252d213a68546feaff68e2b40e401d2c2afd4 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Fri, 3 Apr 2026 11:21:23 +0200
+Subject: [PATCH] reqs: fix case-sensitive matching of "chunked" (#605)
+
+the chunked transfer encoding needs to be matched in a case-
+insensitive manner.
+
+closes #604
+
+(cherry picked from commit 879bf844abffa0bf5fae6aff0c73179024dd9f98)
+
+CVE: CVE-2026-31842
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/879bf844abffa0bf5fae6aff0c73179024dd9f98]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/reqs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index 7aacfd3..8b68538 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -850,7 +850,7 @@ static int is_chunked_transfer (pseudomap *hashofheaders)
+ {
+         char *data;
+         data = pseudomap_find (hashofheaders, "transfer-encoding");
+-        return data ? !strcmp (data, "chunked") : 0;
++        return data ? !strcasecmp (data, "chunked") : 0;
+ }
+ 
+ /*
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index 2555d2132d..a0ef5fd62f 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://run-ptest \
            file://CVE-2026-3945-1.patch \
            file://CVE-2026-3945-2.patch \
+           file://CVE-2026-31842.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

