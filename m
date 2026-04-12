Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BD0E937EB
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 15:38:27 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.247614.1776008282023094708
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2026 08:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=jUKvnVKi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202604121537591a20df201a000207d9-eb4b69@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202604121537591a20df201a000207d9
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 12 Apr 2026 17:37:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JkEjriksrxWiuJiH7jYaQ1/VZwRXTweRQkaez/1T59w=;
 b=jUKvnVKip6/IRy6dn+KuIQnIvTNgtwh2QVBWehiCSeKyNT05XOryHWw2fP6uW7eRCEHlvS
 G1ud1/SooFExnycrpzbzIsyvg8MK0Zx/CBcV378XYdlU00YjNDxwQnrqsFMHrNIOxHzKQxpa
 61+es0tzUrFC/tCIngFOMp5pFagfBfePswJMcjzFymcywLZnI5HipwFI03OTt0Nhou6nVC9F
 8z68czfbkUojHwks5Uf9Fi2qR0ewBfUqnjbvs/CK2GA+h86vVicZkZKlaZmBSMISG7TjD9++
 hNb8/2yOhWn1j7GwfSw4gWmodq9oqxded0Q3RiOuvIdfYGGToyfHCr1Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH] grpc: set status for CVE-2026-33186
Date: Sun, 12 Apr 2026 17:37:04 +0200
Message-ID: <20260412153704.2513682-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Apr 2026 15:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126262

From: Peter Marko <peter.marko@siemens.com>

CPE per NVD report is for "go", while this is C++ component:
* cpe:2.3:a:grpc:grpc:*:*:*:*:*:go:*:*
Also the link to adisory within NVD report says "grpc-go":
* https://github.com/grpc/grpc-go/security/advisories/GHSA-p77j-4mvh-x3m3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb
index 1594353ef5..c6bffe4f95 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb
@@ -67,3 +67,5 @@ FILES:${PN}-compiler += " \
     ${bindir} \
     ${libdir}/libgrpc_plugin_support${SOLIBS} \
     "
+
+CVE_STATUS[CVE-2026-33186] = "cpe-incorrect: this CVE is for golang version of grpc"

