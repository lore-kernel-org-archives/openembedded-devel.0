Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C189C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 18:13:15 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.28909.1736964785775492839
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jan 2025 10:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=L+ZJi8Ye;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2025011518130334e923d9451a2f2dab-uuhun9@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025011518130334e923d9451a2f2dab
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 15 Jan 2025 19:13:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Kc6wLb+mCCJWUaKULsxauK+lyfxn4G65n013s5GO6po=;
 b=L+ZJi8YeqXAnyJ9k1KBhI+Ho0KBV/2DIIqpb2fa6J1UpoJwA9HXIwD4nei7YFfy2XILJR0
 UkTMcJMB8jbiaBUM5gchQ+TmHWzO9K97q+3Xr6n94ezN6IJ2MVERKMoI/nKoMCMiTPO803GQ
 PM9XkZtCQRVgKE+vdWBqnqpIqiM8wdZzXHUgFj/RcHIHhc/QjIc8Xiruw1yjB9Y9Ldhdjz+s
 UGWHjFUAz0DU53Ih+jsfVkXs60CnSuYo7/T/S3cdpPqye1KI3+An7c4uOYMGos7nzEM3k98r
 3F777zwqd7GybSO2aZbGlKNU6dh8TLCICWt0FvIWPlyKKBvrYNsEUO4w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 1/3] proftpd: define UPSTREAM_CHECK_GITTAGREGEX
Date: Wed, 15 Jan 2025 19:11:59 +0100
Message-Id: <20250115181201.438102-2-peter.marko@siemens.com>
In-Reply-To: <20250115181201.438102-1-peter.marko@siemens.com>
References: <20250115181201.438102-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114900

From: Peter Marko <peter.marko@siemens.com>

Patch releases have character after version
devtool upgrade would currently downgrade 1.3.8b -> 1.3.8
This will make it upgrade 1.3.8b -> 1.3.8c

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb
index ce31c8a475..0e8942e977 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb
@@ -21,6 +21,9 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 
+# patch releases have character after version
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+\w?))"
+
 CVE_STATUS[CVE-2001-0027] = "fixed-version: version 1.2.0rc3 removed affected module"
 
 EXTRA_OECONF += "--enable-largefile INSTALL=install"
-- 
2.30.2


