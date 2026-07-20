Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F83C4452D
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 19:28:02 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5614.1784575669768151152
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 12:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=EdiXdmuY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026072019275285aa7cc40c000207c8-zhdahn@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026072019275285aa7cc40c000207c8
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 20 Jul 2026 21:27:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FNIOLk9ZzY5rVCgS1Ir2p00+PLGWyXxydFiZB5ELSbA=;
 b=EdiXdmuYJjIXk/iqsPxyBK7dMejFE/U+11PUkOXs2CFA0qfVW1U+xsJDo6tsNblTFWyrEW
 B6h+vpnucPejEpU1cqllq66G84F8QZqP95qByms3BuR+AZ34we31dtqd4Nr8GxudunE67Xe4
 30iaSu0tH8BS+Y2BHIgkjBe8RZO7FVLmN62gR4hKe9dcRtJcR+H4QVojBiX5GbYMcjH/wAxn
 VQur9Eds1I3Bbz9hn78tRD8ugyksai2MykCHHiqlPq23+5XmV4586QdsdGOg1Nlu1tvG+Dau
 HnOG9sfnHyuzLCZIVDmedDYq7+JdwyTPGu96xJCmE8XIOmfSaIAckYvw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 4/6] python3-protobuf: set status for CVE-2024-7254
Date: Mon, 20 Jul 2026 21:27:30 +0200
Message-ID: <20260720192732.28245-4-peter.marko@siemens.com>
In-Reply-To: <20260720192732.28245-1-peter.marko@siemens.com>
References: <20260720192732.28245-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 19:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128291

From: Peter Marko <peter.marko@siemens.com>

Version 4.28.2 is correctly set in [1].
Unfortunately also protoc version 28.2 with the same CPE is mentioned
which creates a false positive which needs to be handled.

[1] https://github.com/CVEProject/cvelistV5/blob/main/cves/2024/7xxx/CVE-2024-7254.json

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
index 0595ec2a47..e9af4c3cc6 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
@@ -50,3 +50,5 @@ do_install:append () {
     # https://github.com/python/cpython/issues/122220
     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/protobuf-*-nspkg.pth
 }
+
+CVE_STATUS[CVE-2024-7254] = "fixed-version: Fixed since 4.28.2"

