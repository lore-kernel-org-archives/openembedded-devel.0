Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF999E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:29:25 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.138184.1734640158367521957
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Vp4TtrQd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20241219202916875f3f728104897ef1-x_q2nt@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20241219202916875f3f728104897ef1
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:29:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+CqQucpsP7m2LFK/bL1AYFG69D94dVZCTjbxt4kkx7w=;
 b=Vp4TtrQd/EplnjjOqV5sadXNE7c/dog2C6rCs0txy9CH3US/yuyzDpMfoBG33FBo6bi91b
 7XwwcUDEi31s+cIcN0/tlSBDpNhRHYMDUxkjTRfnSH3YJELdMDmGUwNaawW8YBcPDOP7OP3A
 R4rNeyTPFlKlapmAPF2fUeIFHRvsumsMpJ/w+2YbYeLt8jNuwJf1I8soaZGlDFC9cQ1ghx7a
 bXo9alW0L1xjl3Xu9W0wqW717EnnE0H4W5zaosuaiYlwjWKk5HZS4625h4qRgHjUU/GpRMpX
 CUqdpeT827DVtRuEPpanktCxWbaDOGWESrWFJ59FQ0DZ1V6vLlKfI4Jg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 11/12] memcached: ignore disputed CVE-2022-26635
Date: Thu, 19 Dec 2024 21:27:37 +0100
Message-Id: <20241219202738.346121-12-peter.marko@siemens.com>
In-Reply-To: <20241219202738.346121-1-peter.marko@siemens.com>
References: <20241219202738.346121-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 20:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114412

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is a problem of applications using memcached inproperly.

This should not be a CVE against php-memcached, but for whatever
software the issue was actually found in. php-memcached and
libmemcached provide a VERIFY_KEY flag if they're too lazy to
filter untrusted user input.

[1] https://github.com/php-memcached-dev/php-memcached/issues/519

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-support/memcached/memcached_1.6.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
index 270ad5486d..7234f02a13 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
@@ -25,6 +25,8 @@ SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            "
 SRC_URI[sha256sum] = "2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2bd1224"
 
+CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
+
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
-- 
2.30.2


