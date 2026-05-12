Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5628CD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 06:26:42 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69464.1778567198710802825
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 23:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=dPjjkc9R;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2026051206263568cd30151d000207e3-tkrw3w@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026051206263568cd30151d000207e3
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 12 May 2026 08:26:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=v1vuTiumM1c2gt/Rsn+kNgDC16VsOl/P/ogMM+1XV6c=;
 b=dPjjkc9Rxm6LcOhrMJewf+wu7qSr9dwSsgAKx7slLnTQbLjvCpnbdrgQ+A+CIl6kBGajCY
 WdMd3f+tkPugUcwprPTPIMCAIhMEkLWt8BQauVemeo+C28ul+J2J4qUrRMErmjATbSeIIt1o
 57NcjEymKrbqnEpjqh9Vv3hb54dveJOWURrfChQpkH7O5r1TrIwq5P37wJLdYzg9mL5IlWTU
 /lcpVMzppulMHPHADkytXA13T0eK5DSC4OqjBCXlDMP8+2gaSWfaRxVGe13XUwAJYcyklI6r
 PKHRkCanJGuN5pP0x8UIPp4LJ0fR1geH7BfIBUN9Qb8aEuOjs0QMrj1g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] yaml-cpp: remove +git from version and add tag to SRC_URI
Date: Tue, 12 May 2026 08:26:08 +0200
Message-ID: <20260512062608.22940-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 06:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126857

From: Peter Marko <peter.marko@siemens.com>

Last version bump did not do all necessary changes and kept the version
saying it's not on tag.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.9.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.9.0.bb b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.9.0.bb
index 5233c569d2..dafe6e5da9 100644
--- a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.9.0.bb
+++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.9.0.bb
@@ -7,9 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"
 
 # yaml-cpp releases are stored as archive files in github.
 # download the exact revision of release
-SRC_URI = "git://github.com/jbeder/yaml-cpp.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/jbeder/yaml-cpp.git;branch=master;protocol=https;tag=yaml-cpp-${PV}"
 SRCREV = "56e3bb550c91fd7005566f19c079cb7a503223cf"
-PV .= "+git"
 
 
 inherit cmake

