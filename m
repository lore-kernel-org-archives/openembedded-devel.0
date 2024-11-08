Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBE2D6408A
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 21:07:01 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.3772.1731100012873195420
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Nov 2024 13:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=RrGJvdfH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202411082106493ab8a91fd3f148f494-wf7ziw@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202411082106493ab8a91fd3f148f494
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 08 Nov 2024 22:06:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2Rx6yyKH5yzZFAFZa73zVlI5M7dKVjs1++b11qc148A=;
 b=RrGJvdfHUvWcuBRbW2T+RexNRj2f/7rNufv1o2jF0TdtikPnTtHjyyK+hvUodjVMJcAnTP
 mVAkCzl5lVsXF+dARRUCyIcIukgxc63yZLMc231MlCxqpl58TjltNrzxh3s70rP/MfDSctev
 zK0odLIiYq8X40UgJlbiqdSo+CwWqkAXL3LhV/ZsoPtku3sp8gAdzP4QGZ82dvCtEqA5lPj7
 1/dJ2lhBwOyV2ubOogfuw5UGu90ZmMC6RXMgYgfNlfq4SeohCRcrSWDo0vKwAAIfq1e0YIE2
 qnHpf7hOTpM00a5y60nPwBoply6qrdeD1pphKN12xD+pGTv/Zn9iLG0w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][kirkstone][PATCH] squid: conditionally set status of CVE-2024-45802
Date: Fri,  8 Nov 2024 22:06:00 +0100
Message-Id: <20241108210600.2332815-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 21:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113768

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
 meta-networking/recipes-daemons/squid/squid_4.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-daemons/squid/squid_4.15.bb b/meta-networking/recipes-daemons/squid/squid_4.15.bb
index a042f57166..6a4ef0a2b6 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.15.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.15.bb
@@ -123,3 +123,6 @@ FILES:${PN}-doc += "${datadir}/*.txt"
 
 RDEPENDS:${PN} += "perl"
 RDEPENDS:${PN}-ptest += "make"
+
+# Only ESI feature is vulnerable
+CVE_CHECK_IGNORE += "${@'' if bb.utils.filter('PACKAGECONFIG', 'esi', d) else 'CVE-2024-45802'}"
-- 
2.30.2


