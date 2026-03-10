Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D23FCC9D0
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 06:49:34 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34367.1773125367832627373
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 23:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=EKCqHSnK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1334352-2026031006492588d5d67f88000207f9-asoxdr@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026031006492588d5d67f88000207f9
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 10 Mar 2026 07:49:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ZR+dEHroX1Xusk+4wQ2dwLL/r31q4Q5I7+3+2IQUeXs=;
 b=EKCqHSnK5kwunOmgz3P2kmUA5bzcs/fM0L3cAv/4MGRADjM/pXFErMV/I3GS9m/du9VVXs
 3sJtYAe3KG7LMutgMrAaHzNDvFtNL85MAXOe9vxP2orqoE8OrdLIsY23Bpg+/tARtCZgt1I/
 856aar4nX2F9F7ezWa5ukVQxQPLQG+hJwy0FZ8MyoVXrxaUZ4Oha3pTAnMo59NzWOopOel0H
 r9+FG61YUXjt9j+B6YBhuBF9OWxNbX8heHP54wXQy7iC0oK8mfkX9HP+VZW2ED3tBN/llXSl
 YbKy8FwJwDmGG/A8iLYNT1LJdAaG+p7xvw6eRMPMEBxgA7BQvZZny63w==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH v2 14/14] zchunk: upgrade 1.5.2 -> 1.5.3
Date: Tue, 10 Mar 2026 07:49:08 +0100
Message-ID: <20260310064908.1093-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 06:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125015

The tag is not on any branch.

Add tag to SRC_URI.

Changelog:
  https://github.com/zchunk/zchunk/compare/1.5.2...1.5.3

Changes:
  - update to 1.5.3
  - rename internal close() functions to close_zck_component to avoid POSIX conflict on AIX

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../zchunk/{zchunk_1.5.2.bb => zchunk_1.5.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.5.2.bb => zchunk_1.5.3.bb} (81%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.5.2.bb b/meta-oe/recipes-support/zchunk/zchunk_1.5.3.bb
similarity index 81%
rename from meta-oe/recipes-support/zchunk/zchunk_1.5.2.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.5.3.bb
index bbdd06dfda..fc5a55d192 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.5.2.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.5.3.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "A file format designed for highly efficient deltas while maintain
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
-SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;nobranch=1;tag=${PV}"
 
-SRCREV = "222d1a4da3661dd95c2445b96f7e1e208f55d219"
+SRCREV = "366cf22e725fc273abe0e082c707753cce76c453"
 
 DEPENDS = "zstd"
 DEPENDS:append:libc-musl = " argp-standalone"
-- 
2.47.3


