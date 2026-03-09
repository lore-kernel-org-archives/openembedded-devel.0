Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A87EFCD90
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:06:44 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10756.1773050799737600479
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=UUVddc7w;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1334352-2026030910063957b45e95a300020788-7iypp_@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026030910063957b45e95a300020788
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 09 Mar 2026 11:06:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=rH2mEDjrBPex0azuA0uHwFoaFKYjCEnynby7cg5ZstA=;
 b=UUVddc7wGbBJMpza6f/SllrZmZyUUr6djyq20iFMa2cF2a6A+HIPVBxlqLginLj8sjgNIl
 aic0JP8Q0K83aZ0cT733GWsek6yaffIvnRkWnp3MD9tv6XEWQkaWVflaKScxRYtqLEE+eNT9
 x3AxPCpY7Vny5QfBYVGu4F8uHtlwKL/fN96O0kdvsVKfv2BxeDWirB89VrvujYmq5BW5aNMj
 VRYWlju+cVPRG1zejy7ekwYcCUNESsYldmMHGarCr5jD5oF7RaGSwaRj1Czzii3U1gfji54b
 W9gaA1hcUwLANHddvpW/ZBuk9d/OuuhptEWV+M7ya2swgf2SOliCI6YA==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 14/14] zchunk: upgrade 1.5.2 -> 1.5.3
Date: Mon,  9 Mar 2026 11:06:30 +0100
Message-ID: <20260309100630.404637-14-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124975

The tag is not on any branch.

tag cannot be added to SRC_URI as it does not seem to work with nobanch

Changelog:
  https://github.com/zchunk/zchunk/compare/1.5.2...1.5.3

Changes:
  - update to 1.5.3
  - rename internal close() functions to close_zck_component to avoid POSIX conflict on AIX

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../zchunk/{zchunk_1.5.2.bb => zchunk_1.5.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.5.2.bb => zchunk_1.5.3.bb} (82%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.5.2.bb b/meta-oe/recipes-support/zchunk/zchunk_1.5.3.bb
similarity index 82%
rename from meta-oe/recipes-support/zchunk/zchunk_1.5.2.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.5.3.bb
index bbdd06dfda..56aa0baf2e 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.5.2.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.5.3.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "A file format designed for highly efficient deltas while maintain
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
-SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;nobranch=1"
 
-SRCREV = "222d1a4da3661dd95c2445b96f7e1e208f55d219"
+SRCREV = "366cf22e725fc273abe0e082c707753cce76c453"
 
 DEPENDS = "zstd"
 DEPENDS:append:libc-musl = " argp-standalone"
-- 
2.47.3


