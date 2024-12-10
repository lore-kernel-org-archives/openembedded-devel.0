Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F2CE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 17:43:40 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.16947.1733852612730838972
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Dec 2024 09:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=gluXVGvM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20241210174329e8e5c6937f0bcfd521-gujkuz@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20241210174329e8e5c6937f0bcfd521
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 10 Dec 2024 18:43:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JaWjSuyo689tk4USVSwL342Ohxuklq1xAef/zPtls/s=;
 b=gluXVGvMT75ckgNbq+01lHiiVBld4xlLFDlgPEUD6X9Otxn3dceWCMQnKFgD9xfQxcSP+K
 gI7gDxoV21dC1qAFC+SKONo1a+ywGE3BefekADPZ8PuYNivgq2ZjEhbNCtIWUTJbN6LViIz/
 IMn2ZDVAZug709JN2jE7pLja6LcGr1cp+ITIPFb5z60V5m2M9Ue0OUdNqEm7KoCKFudVYFE7
 x4vniyvQoJfeg8GeewbqrbYFgyXqq4sju5dUYXXVjYcnQkqKiihtTq2SwhkKVQkeeHkW0bTS
 ncJwBJpM1SBWR60uu7jxMgA7RzjVfZ8w+MtYxZr3/i2Z9pZwOLTGzfGg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] dash: set CVE_PRODUCT
Date: Tue, 10 Dec 2024 18:42:16 +0100
Message-Id: <20241210174216.988194-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 17:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114263

From: Peter Marko <peter.marko@siemens.com>

This removes false positive CVE-2024-21485 from cve reports.

$ sqlite3 nvdcve_2-2.db
sqlite> select * from products where product = 'dash';
CVE-2009-0854|dash|dash|0.5.4|=||
CVE-2024-21485|plotly|dash|||2.13.0|<
CVE-2024-21485|plotly|dash|2.14.0|>=|2.15.0|<

Our dash:dash did not reach major version 1 yet.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-shells/dash/dash_0.5.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.12.bb b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
index 947ef702d7..1bf3625760 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.12.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
@@ -10,6 +10,8 @@ inherit autotools update-alternatives
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
 SRC_URI[sha256sum] = "6a474ac46e8b0b32916c4c60df694c82058d3297d8b385b74508030ca4a8f28a"
 
+CVE_PRODUCT = "dash:dash"
+
 EXTRA_OECONF += "--bindir=${base_bindir}"
 
 ALTERNATIVE:${PN} = "sh"
-- 
2.30.2


