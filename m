Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B89AC282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 20:52:24 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.4453.1741985539596148229
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Mar 2025 13:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=I6advU51;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202503142052218a261d10380e2af460-duusya@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202503142052218a261d10380e2af460
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 14 Mar 2025 21:52:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FzqkZFnOdh7CArB+PymJgiQFg1UerHRsvmVsaacLqWE=;
 b=I6advU51+x36oEWznzGA4pLnZ4NWKwKPC0xnUfF1dZ6+t95EtX1X0XZFk0haet0c668vrV
 imTRXgFu1QkBOrLh3aw8o9FPJYSf2lL21IE+9Tm+u+rYJAyBtRqdOg33FnWRjIOV2Vqs8dRa
 XmjbAX+Fr2WoXXew8Kk0GhV/+OWFTw9rnlHlhwD5Zd6J1v1G86yyQ79bk23fL9tbGylGYRWe
 n8zqP5TPmGuKuUC8264kgr4lDF2LYXi85OJbWhr/lce7S73Yl+hAsMJARsFz6/v7Um2QWo0Y
 7dpPV4WpbZr1TepOq+DuS73ByPRPAwW1G2k9U9lxS/CUFILwIoKTN0Ww==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 6/7] fluentbit: add profiles package config
Date: Fri, 14 Mar 2025 21:50:34 +0100
Message-Id: <20250314205035.386919-6-peter.marko@siemens.com>
In-Reply-To: <20250314205035.386919-1-peter.marko@siemens.com>
References: <20250314205035.386919-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 20:52:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115993

From: Peter Marko <peter.marko@siemens.com>

Since the recipe tries to list every single option, add this one which
is missing. It is enabled by default in cmake to enabling it by default
in package config retains current settings.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
index c7fc7d1e19..406a5b7b9e 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
@@ -45,6 +45,7 @@ PACKAGECONFIG ??= "\
     metrics \
     parser \
     prefer-system-libs \
+    profiles \
     proxy-go \
     record-accessor \
     regex \
@@ -85,6 +86,7 @@ PACKAGECONFIG[metrics] = "-DFLB_METRICS=Yes,-DFLB_METRICS=No"
 PACKAGECONFIG[mtrace] = "-DFLB_MTRACE=Yes,-DFLB_MTRACE=No"
 PACKAGECONFIG[parser] = "-DFLB_PARSER=Yes,-DFLB_PARSER=No"
 PACKAGECONFIG[posix-tls] = "-DFLB_POSIX_TLS=Yes,-DFLB_POSIX_TLS=No"
+PACKAGECONFIG[profiles] = "-DFLB_PROFILES=Yes,-DFLB_PROFILES=No"
 PACKAGECONFIG[proxy-go] = "-DFLB_PROXY_GO=Yes,-DFLB_PROXY_GO=No"
 PACKAGECONFIG[record-accessor] = "-DFLB_RECORD_ACCESSOR=Yes,-DFLB_RECORD_ACCESSOR=No"
 PACKAGECONFIG[regex] = "-DFLB_REGEX=Yes,-DFLB_REGEX=No"

