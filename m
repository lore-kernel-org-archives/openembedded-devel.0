Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44586C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 21:34:52 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.380.1716327283867218037
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 14:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lACOovhF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20240521213440d23dedd15c33de5cb4-nr_6vn@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20240521213440d23dedd15c33de5cb4
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 21 May 2024 23:34:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=alDHy0N9Bu86hJTn7TLyf9ImBAoEWzWYQl+jZ9sZflU=;
 b=lACOovhF+HdMTCMkV462On5JcjoEgPy7JCiu0eBJ3UVFnRvhgJDDNOSRgLS+PQ6YGDnDIX
 YBGnDas97965gjP0T0ZKn7qJO/AcQW0HSZ3srvIkKLO+pTCdDrOV4hyZ82bchkXRJzTFKtxD
 54sncoGi/41JqO/wu7rHq/A6nSxgo=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][kirkstone][PATCH] uriparser: upgrade 0.9.6 -> 0.9.8
Date: Tue, 21 May 2024 23:33:52 +0200
Message-Id: <20240521213352.586645-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 21:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110478

From: Peter Marko <peter.marko@siemens.com>

Handle CVEs:
* https://nvd.nist.gov/vuln/detail/CVE-2024-34402
* https://nvd.nist.gov/vuln/detail/CVE-2024-34403

Cherry-pick from master was not possible due to usage of
github-releases class which is not in kirkstone yet.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../uriparser/{uriparser_0.9.6.bb => uriparser_0.9.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_0.9.6.bb => uriparser_0.9.8.bb} (84%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.9.6.bb b/meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb
similarity index 84%
rename from meta-oe/recipes-support/uriparser/uriparser_0.9.6.bb
rename to meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb
index 0d45a15595..bfe191a6c4 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_0.9.6.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_0.9.8.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "10e6f90d359c1087c45f907f95e527a8aca84422251081d1533231e031a084ff"
+SRC_URI[sha256sum] = "4cd0e4f93b477272fabceeb0202f269169fe6ec3044e10fac6acbcdf354bb080"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.30.2


