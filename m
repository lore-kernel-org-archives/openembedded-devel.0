Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE01EC6FD1F
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 19:50:26 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.4909.1678823419687184862
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Mar 2023 12:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=k+4IFttp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20230314195016163e66cc76604bf43c-rqkjeq@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20230314195016163e66cc76604bf43c
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 14 Mar 2023 20:50:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BwVLU3OEU93fxaZ+I98wGsIS/RLDBi+3ChWoRESK+tM=;
 b=k+4IFttpMBXJXRI+7Oj7xe9XNsfB3cJhvxAfZiBL9h91RJhAQ2GsKCxxTvBTZrEt4Shx9H
 ANtKQyI+2/Fs5kRZfJuRqPkWNUtaR7DRgJiFYbEv9FR2rE46UilHpz9BHisy9eqsSFe8jZYM
 CiPapC/F4jnQXK2fjt4XxEpg9oykM=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][master][langdale][kirkstone][PATCH] ntp: whitelist CVE-2019-11331
Date: Tue, 14 Mar 2023 20:49:28 +0100
Message-Id: <20230314194928.7787-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 19:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101524

Links from https://nvd.nist.gov/vuln/detail/CVE-2019-11331 lead to
conclusion that this is how icurrent ntp protocol is designed.
New RFC is propsed for future but it will not be compatible with current
one.

See https://support.f5.com/csp/article/K09940637

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
index 2ae53dc64..c4589c20f 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
 SRC_URI[sha256sum] = "f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19"
 
 # CVE-2016-9312 is only for windows.
+# CVE-2019-11331 is inherent to RFC 5905 and cannot be fixed without breaking compatibility
 # The other CVEs are not correctly identified because cve-check
 # is not able to check the version correctly (it only checks for 4.2.8 omitting p15 that makes the difference)
 CVE_CHECK_IGNORE += "\
@@ -53,6 +54,7 @@ CVE_CHECK_IGNORE += "\
     CVE-2016-7433 \
     CVE-2016-9310 \
     CVE-2016-9311 \
+    CVE-2019-11331 \
 "
 
 
-- 
2.30.2


