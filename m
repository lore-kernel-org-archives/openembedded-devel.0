Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD74CA9ECF
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:11:34 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3505.1791763885332024619
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GvCvBdHV;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a8af3a704fso591462a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763885; x=1792368685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIyg5qq8b+2UqKvFnrtqZGTXonYDjkNyPtCICmTLpUI=;
        b=GvCvBdHVJsJoi0q4znOHUZiayu7KXjuIDgSSIGLpXyavj7ij2QRUJ09WOFSxEMH7sb
         LhhUXiO9sJPBqfiZT2UFgoc3rAvVbq1+froMlNA1HP2LcyL1SMVGPNNqFQcLxiqgIJso
         hRwloxNPKb7S3lKcWE8vFtjQtXWW9yvJpeA6i3xi36qQ+nZZuGg/z6TqNyhS0441ROjE
         CDU6T4huNssBqkMKpYcelXGFwqZNm0HlzgcD6FiejC5NKVNWSdhFu9ZHtWbN2LllpNsY
         KagsgwNghr96DSeD+GkP+0jfJtXlcHpEJTB+wBTj6plZuHqLXKA3d47l6yr28CB+DW40
         NlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763885; x=1792368685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DIyg5qq8b+2UqKvFnrtqZGTXonYDjkNyPtCICmTLpUI=;
        b=MSKHERyKvSjswuhnY6nmWCWnpjYpNS7apeapRi1zQNJ8E9rKwWYu+8WepMa+tESVUo
         tEhBsvBUQinjYLGdrKtMvvcUvG3WENrPlxdNHv/slzu+JloSBxn/8KRuDnTGAi4CvNBD
         O8bfWhNiPTlqCynila7b+VpREuzE7B6T53eh459Z+J1RT7nsrnL7GkseKoMJlY/U5AaO
         dpyBU4N33J2+kPKNWn5Sqvsf4UtvSPFNfKpmvyt8FhqtB/pHSXUjOH9dR+NlTnmG7Nrg
         z2e6vbKq0PaUNFXJpADSjnwv2ZyZLb/N8EWIHoYfv2JNStYkYcOgFiGfPAGQrl61N53E
         IS6g==
X-Gm-Message-State: AFq9FYJN3hDxaRpUnmdzEflXMXBw9jlPUJvwkrMo8n2fc5Xu/f2JbVDY
	t38GcTss2aYlSSwt9sz7WcuiadVZ3lgItJYDZLcagRB7LW2l0WOrIIOHjfwg4A==
X-Gm-Gg: AYBFou1wit1A5AP0Efxo1Z0C/z4tGDLvmsyGJ71Zt+zEr1tpyTA0sAHsILwwh2cLhg/
	PpQ5B02Fx0d0rgSQ2Trm6o4mBY2Fbc7CTIzlXNjM8BXeRXVgLHTYuAEjtW7NQ45xtP/gSjg8WPX
	ZXaYuY5dP3Zkpn3GX6jVqYMFyjBwTl8vYkyiHUOnRSytZjpnZ2CpAPEgyj1nNsnp1WMBJygx2/z
	moNk7QKLHxNaFV2rSVGOTqq0S5AGMoLzVPPQO43T8Xs6ZQKRdLvPG9wm0+WgYK2gmdVDrNUCDPr
	LUmMIS67xQWxARl93yfY/ypTbImb4zO3CsI1gTz/gIRx+F//Nz0SNdGxGaK/cjoBqMat7hMbQTX
	KMgSrqKMlqSZId/IXybC3K+cj1AJBFy7HUTfBvlTNXRqLSQ0HqTP3tEPqvob3BjdyfL7ckeeSI5
	LVyiFIxzyfa1T2XAHw7eArT+mKKau/dnwnIj9x+r89TfJQq4l97eMe09o8j/9oG4CNLT5mz5e9y
	UTl/9znpI7QFoIzDBX7LpddjuCwArY7CP+UTK0=
X-Received: by 2002:a17:90b:1d52:b0:3a6:e8fb:76b5 with SMTP id 98e67ed59e1d1-3ab3a79001bmr7085329a91.37.1791763884633;
        Sun, 11 Oct 2026 17:11:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:11:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][PATCH 26/28] tinyproxy: patch CVE-2026-31842
Date: Mon, 12 Oct 2026 13:10:04 +1300
Message-ID: <20261012001007.2541673-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130751

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
index 00000000000..6b8c02d6292
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
index 2555d2132d9..a0ef5fd62f9 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://run-ptest \
            file://CVE-2026-3945-1.patch \
            file://CVE-2026-3945-2.patch \
+           file://CVE-2026-31842.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

