Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7E6E7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:28:45 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.138137.1734640116067421932
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=dTiP1fj2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202412192028341f273103bdda3e29fa-wu_ux3@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202412192028341f273103bdda3e29fa
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:28:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qJxvY7AjijVm77gr5baJcPyRsffAx9huVKAH8kj8aK8=;
 b=dTiP1fj2i13rgyyyTza3zpKdbWtdeMPymHh8NKp6z/m7JIgr6v6ME5Qs5lhqBoMRQSEmqq
 gbDsueIE3v4FyA7ykofa0wSVGf000qA9p1TGEGXi5DYzZ+dzecRLQ1eWuieuhvfdjuVqfsa/
 goaSsnZ41rJMsRBYBaTPpkH+F3JQHw2zcIPSGMYQ91ZE6AW1ppwnFnt0ecZIrw9T0U52/M8t
 qMdsnwwJLhJCYvHQczRsDTCz7cbzuFDtYj96iBvA2o3+p+N0vwwleJ7AgxJ0OWrBjZGuDpsi
 ioNQhcD4JJlJwGGRHYgkarlZ51jCNEVIIoq6shqBZ+zkOeA8UIKkWDEw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 01/12] ace: ignore CVE-2009-1147
Date: Thu, 19 Dec 2024 21:27:27 +0100
Message-Id: <20241219202738.346121-2-peter.marko@siemens.com>
In-Reply-To: <20241219202738.346121-1-peter.marko@siemens.com>
References: <20241219202738.346121-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 20:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114402

From: Peter Marko <peter.marko@siemens.com>

This CVE is for vmware ace.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-connectivity/ace/ace_8.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb
index c79fba323c..88df9ae5df 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "8d379f37d56db33f3ae447725b632d48b1c13e887593547ac3568e3b42
 UPSTREAM_CHECK_URI = "https://github.com/DOCGroup/ACE_TAO/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
+CVE_STATUS[CVE-2009-1147] = "cpe-incorrect: this CVE is for vmware ace"
+
 COMPATIBLE_HOST:libc-musl = "null"
 
 S = "${WORKDIR}/ACE_wrappers"
-- 
2.30.2


