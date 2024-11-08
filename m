Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5E4D6408B
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 21:09:11 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.3850.1731100141979409274
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Nov 2024 13:09:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=a34Nv9zt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20241108210900f13d4a7444cf5c7539-qrgzd_@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20241108210900f13d4a7444cf5c7539
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 08 Nov 2024 22:09:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=D2ipPNCGIqLHnz61/67FyXzVjYe6ONYpzosUTls6J6g=;
 b=a34Nv9zt2A9Qo6W+idz1LsmjIv23p64rFKx3XtIweifRlkqwRdR5RQzUw3t+6JIAl8NhIH
 gKMqwfxqKCxlhxDaD2M8qzyJLpXRX0kXmBzgMAP7UYmw+0OPQhmYmoE+2EhGn6lcqDdkm09G
 WRMtOjOj/1GgqVVU31imHTJAzfsjDZSZJ1QC3xoZS4b+cig+TVMSjEN0QlA0DtFdHqY7f45+
 ZAkJtpVuZm8QBYfZsJMXlrffITmYCG8H7i2UtMxD1z1TaThrz/6OdQVOYIAiXg+Qjlet1wMY
 3G46XhGAN8JJ7/xDcStE0GiPyDzUdDX+zFPPYFakqgjxHdDeWpvVcG8g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH] squid: conditionally set status of CVE-2024-45802
Date: Fri,  8 Nov 2024 22:08:13 +0100
Message-Id: <20241108210813.2333343-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 21:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113769

From: Peter Marko <peter.marko@siemens.com>

According to [1] the ESI feature implementation in squid is vulnerable
without any fix available.
NVD says it's fixed in 6.10, however the change in this release only
disables ESI by default (which we always did via PACKAGECONFIG).

Commit in master branch related to this CVE is [2].
Title is "Remove Edge Side Include (ESI) protocol" and it's also what it
does. So there will never be a fix for these ESI vulnerabilities.

We should not break features in LTS branch and cannot fix this problem.
So ignrore this CVE based on set PACKAGECONFIG which should remove it
from reports for most users. Thos who need ESI need to assess the risk
themselves.

[1] https://github.com/squid-cache/squid/security/advisories/GHSA-f975-v7qw-q7hj
[2] https://github.com/squid-cache/squid/commit/5eb89ef3d828caa5fc43cd8064f958010dbc8158

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-daemons/squid/squid_6.9.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-daemons/squid/squid_6.9.bb b/meta-networking/recipes-daemons/squid/squid_6.9.bb
index 61fc6027b3..f6312521d9 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.9.bb
@@ -147,3 +147,9 @@ FILES:${PN}-networkmanager = "${libdir}/NetworkManager/dispatcher.d"
 
 RDEPENDS:${PN} += "perl ${PN}-conf"
 RDEPENDS:${PN}-ptest += "perl make bash"
+
+python() {
+    # Only ESI feature is vulnerable
+    if not bb.utils.filter('PACKAGECONFIG', 'esi', d):
+        d.setVarFlag("CVE_STATUS", "CVE-2024-45802", "not-applicable-config: esi is disabled")
+}
-- 
2.30.2


