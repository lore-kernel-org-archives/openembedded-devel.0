Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46620E77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 18:53:16 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.1369.1733856794122527542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Dec 2024 10:53:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=jIuIEfP2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2024121018531080a5498768df287108-oqjzyr@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2024121018531080a5498768df287108
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 10 Dec 2024 19:53:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VrmjYde7ymP/B0mMByVR8EDEYRTixN63ckQie0wPwhE=;
 b=jIuIEfP2gnAun8av4nSViwZnZW3pp0Y6b1fl8VQfSO/4TKOZsfG/5EdMUWDV+SDNhn93PH
 W/SMkbB/52/njNT9yNag8C/MZdav7ARkFGU1+lV265CroIopiiusMLjb/XXgXaA0F0GgWIXx
 1uqUA1oN9bHOtSMDRHgu+MQrumX8abmoNUi8wohdW14VkBPSTCZSGRTNOcbj9bntIKytPHkt
 q8gxRdsM26xVsJ0ks9jnTgfaNHkZ+58XXMjCk1DNCtwNdSFiwtay93+V8sBcvO9fYrDt6XtE
 bdp1Jt+AYL5SLmUJw5uLbGy4syAyfo8Lbfw1/IVvAOxL5KTqawyOtsbw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH] proftpd: set status of CVE-2001-0027
Date: Tue, 10 Dec 2024 19:52:23 +0100
Message-Id: <20241210185223.990625-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 18:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114264

From: Peter Marko <peter.marko@siemens.com>

This ancient CVE [1] is unversioned ("*") in NVD DB.
"mod_sqlpw module in ProFTPD does not reset a cached password..."

Looking at history and changelog, the module was removed [2] around
the time when this CVE was published, likely as reaction to this CVE.
"mod_sqlpw.c, mod_mysql.c and mod_pgsql.c have been REMOVED from the
distribution. They are currently unmaintained and have numerous bugs."

Note: It was later re-introduced as mod_sql when it got fixed under
new maintainer.

[1] https://nvd.nist.gov/vuln/detail/CVE-2001-0027
[2] https://github.com/proftpd/proftpd/blob/v1.3.8b/NEWS#L3362

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb
index 33480bff2c..ce31c8a475 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb
@@ -21,6 +21,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 
+CVE_STATUS[CVE-2001-0027] = "fixed-version: version 1.2.0rc3 removed affected module"
+
 EXTRA_OECONF += "--enable-largefile INSTALL=install"
 
 PACKAGECONFIG ??= "shadow \
-- 
2.30.2


