Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DFFC36001
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 20:27:05 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.5040.1742502416947538734
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 13:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=aUPc7cy3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250320202653dea6c06b45ff0e4a2a-8e2smk@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250320202653dea6c06b45ff0e4a2a
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 20 Mar 2025 21:26:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=eQy0HbiG8dXCeld+Ra8d89X+Wvkl5nxE4yDkc7otInk=;
 b=aUPc7cy3oRUiOy/4Bo9Eh8NUuXcsKI/8PdiWpu2yuo47oBZYm5JLK4k1AzQMwvDfHSEPSP
 Ao41ahniwTaecKu1t5JkBFOw+aM+pR+D9lFzkHV4ewT8mAbiH4d/DifGUjbciktiElmuRvQ5
 nbUKUmPBoAlpiqUhg6he8zNanC6wkRYJqkLTng/cXUuxphAykFwC5jNKLDAuYYSvTKFoif8S
 a0B65HNp9KBINH5NJP3unEXyyAw8OBlxcwZN2m8WmhdoYrywyKvgghO+ph0uFAV48ElAfLpH
 zf8pTjd7qyt3iYlOypcx11FQfOplAbnA3Xkyz2yB2WN6EGr5mKat26Gw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-something][PATCH 1/3] freerdp: patch CVE-2024-32661
Date: Thu, 20 Mar 2025 21:26:04 +0100
Message-Id: <20250320202606.1679616-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 20:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116142

From: Peter Marko <peter.marko@siemens.com>

Pick commit [1] as mentioned in [2] or [3].

[1] https://github.com/FreeRDP/FreeRDP/commit/71e463e31b4d69f4022d36bfc814592f56600793
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-32661
[3] https://security-tracker.debian.org/tracker/CVE-2024-32661

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../freerdp/freerdp/CVE-2024-32661.patch      | 27 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.11.7.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch
new file mode 100644
index 0000000000..002135b5e4
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch
@@ -0,0 +1,27 @@
+From 71e463e31b4d69f4022d36bfc814592f56600793 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Sun, 21 Apr 2024 13:56:13 +0200
+Subject: [PATCH] [core,info] fix missing check in rdp_write_logon_info_v1
+
+CVE: CVE-2024-32661
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/71e463e31b4d69f4022d36bfc814592f56600793]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libfreerdp/core/info.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libfreerdp/core/info.c b/libfreerdp/core/info.c
+index 7d6eec137..3395e4d2e 100644
+--- a/libfreerdp/core/info.c
++++ b/libfreerdp/core/info.c
+@@ -1322,6 +1322,10 @@ static BOOL rdp_write_logon_info_v1(wStream* s, logon_info* info)
+ 		return FALSE;
+ 
+ 	/* domain */
++	WINPR_ASSERT(info);
++	if (!info->domain || !info->username)
++		return FALSE;
++
+ 	ilen = ConvertToUnicode(CP_UTF8, 0, info->domain, -1, &wString, 0);
+ 
+ 	if (ilen < 0)
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index ee4d4530d6..870c3ffe2f 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://0001-Fix-const-qualifier-error.patch \
            file://0002-Do-not-install-tools-a-CMake-targets.patch \
            file://0001-Fixed-compilation-warnings-in-ainput-channel.patch \
+           file://CVE-2024-32661.patch \
            "
 
 S = "${WORKDIR}/git"

