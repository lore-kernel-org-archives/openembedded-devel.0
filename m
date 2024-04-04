Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339A0CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 21:19:54 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.4379.1712265590049073630
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 14:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=nXtwDle/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202404042119461a0a8f6ca3f8374c2f-7hrwbe@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202404042119461a0a8f6ca3f8374c2f
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 04 Apr 2024 23:19:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=DsZauLax8Zqw7v+hqe2Rk0ifJGbIpmjJsJR28u/gOuQ=;
 b=nXtwDle/kNMb+hgb4epweujxG39nkrUftW1FIJXhrW/jkrPU2E6q22ehy66fh0rTqaaDNo
 byZhcUy1R/XgpSs9+21pXTomjkjbraLJzJfc69ubq6UyOX2PJLF3d2VrLFLjKNOJF1CeECey
 nv71VUAY9+0Bt/PxcT9DiU8SRGlrA=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] syslog-ng: fix build without ipv6 in distro features
Date: Thu,  4 Apr 2024 23:18:57 +0200
Message-Id: <20240404211857.105186-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 21:19:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109807

From: Peter Marko <peter.marko@siemens.com>

Sumbitted to https://github.com/syslog-ng/syslog-ng/pull/4880

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch | 40 +++++++++++++++++++
 .../syslog-ng/syslog-ng_4.6.0.bb              |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch b/meta-oe/recipes-support/syslog-ng/files/0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch
new file mode 100644
index 000000000..f21ad5d70
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch
@@ -0,0 +1,40 @@
+From 896d77dd949b52d6ea5798e5a038ba97d6b802be Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Thu, 4 Apr 2024 15:44:18 +0200
+Subject: [PATCH] macros: guard ipv6 code with SYSLOG_NG_ENABLE_IPV6
+
+With ipv6 disabled, there are linking errors currently.
+This fixes it by not using the symbols when IPv6 is disabled.
+
+Solves #4810 with my config options
+https://github.com/openembedded/meta-openembedded/blob/2487e65ee3842b6ae0c7a2628985be6189ed9ebf/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
+
+Upstream-Status: Submitted [https://github.com/syslog-ng/syslog-ng/pull/4880]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/template/macros.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/template/macros.c b/lib/template/macros.c
+index 54142706c..fcb83637f 100644
+--- a/lib/template/macros.c
++++ b/lib/template/macros.c
+@@ -277,12 +277,14 @@ _get_originating_ip_protocol(const LogMessage *msg)
+     return 0;
+   if (g_sockaddr_inet_check(msg->saddr))
+     return 4;
++#if SYSLOG_NG_ENABLE_IPV6
+   if (g_sockaddr_inet6_check(msg->saddr))
+     {
+       if (g_sockaddr_inet6_is_v4_mapped(msg->saddr))
+         return 4;
+       return 6;
+     }
++#endif
+   return 0;
+ }
+ 
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
index 4cc5d8451..458494415 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
            file://syslog-ng-tmp.conf \
            file://syslog-ng.service-the-syslog-ng-service.patch \
            file://0001-Fix-buildpaths-warning.patch \
+           file://0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch \
 "
 SRC_URI:append:powerpc64le = " file://0001-plugin.c-workaround-powerpc64le-segfaults-error.patch"
 
-- 
2.30.2


