Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C78C28B30
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 20:52:34 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.4453.1741985539596148229
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Mar 2025 13:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=l8+QU5EW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250314205223e695d3a5ec3b1c27d3-1fwk2h@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250314205223e695d3a5ec3b1c27d3
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 14 Mar 2025 21:52:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=jgHVlSLZZSHNlUuTXTBrHmtvPVkpQHgRce2lK5BpQwA=;
 b=l8+QU5EWsdY06VwItJLX7E05VrfGFrv1p0ltiZmjLX+JMjEgOsc5KkWYEoto1/Zj0ybudX
 3RZU5dZcpexQJZzygQBhCpigSgJsArK3snIDwXAhAa3MHWn7DNvqxB9RMYqKO60yCSLOdWr2
 npFDuFF9J+nbEVReWzEOy1SBzUvBmgK1QvTHhE1IdOvCF4eB/4VBuQPzPZz17h0AL/YmLp6G
 GSCuEaGhwkRn0+xLqyyi8ChNMxhBzb0mUdO37yUg6XJmw1uUCUvcKIj9Ki+XwhLZ+u9oGhkD
 hXpEj7NKt8CNs7S4SV7as6WFb19JGyFvTk1Ka3qoBobaIjRM14WQXCQA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 7/7] fluentbit: fix aws-error-reporter package config
Date: Fri, 14 Mar 2025 21:50:35 +0100
Message-Id: <20250314205035.386919-7-peter.marko@siemens.com>
In-Reply-To: <20250314205035.386919-1-peter.marko@siemens.com>
References: <20250314205035.386919-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 20:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115994

From: Peter Marko <peter.marko@siemens.com>

Compilation fails with several errors in flb_aws_error_reporter.c

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
index 406a5b7b9e..59e23567b1 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
@@ -129,6 +129,7 @@ EXTRA_OECMAKE:append:powerpc = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
 EXTRA_OECMAKE:append:riscv32 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
 EXTRA_OECMAKE:append:riscv64 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
 EXTRA_OECMAKE:append:x86 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
+SECURITY_STRINGFORMAT:remove = "${@bb.utils.contains('PACKAGECONFIG', 'aws-error-reporter', '-Werror=format-security', '', d)}"
 
 do_configure:prepend() {
     sed -i \

