Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B33DC47258
	for <webhook@archiver.kernel.org>; Sat, 20 Jan 2024 19:28:18 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.31232.1705778888249326041
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Jan 2024 11:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PaQysbb/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202401201928048360b38370fc02dbc3-n16wa5@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202401201928048360b38370fc02dbc3
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 20 Jan 2024 20:28:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=htD/cUkRCX3Dh/PdC3tduZ/hNGfwvTdch6jexv8cMb0=;
 b=PaQysbb/LH+4Yrt88H7dYFmRgGY9/9dx94E+96zrZn2X62k89ZGWa8xUDaZt6xitsRzVJF
 L36lzsfZW7oNnQjTjEWqgnzakzEcU5ISDvcivyUm5acptl/WzVPYyggbkxeuKoHsTNPx862r
 FOgUCUBSwAqwxBrsa6kLTkuTaCjTY=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] strace: fix malformed petch upstream status
Date: Sat, 20 Jan 2024 20:27:08 +0100
Message-Id: <20240120192708.918425-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Jan 2024 19:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108362

From: Peter Marko <peter.marko@siemens.com>

WARNING: srecord-native-1.65.0-r0 do_patch: QA Issue: Malformed Upstream-Status in patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../files/0001-cmake-respect-explicit-install-prefix.patch      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/srecord/files/0001-cmake-respect-explicit-install-prefix.patch b/meta-oe/recipes-support/srecord/files/0001-cmake-respect-explicit-install-prefix.patch
index 5a74323bc..64584656f 100644
--- a/meta-oe/recipes-support/srecord/files/0001-cmake-respect-explicit-install-prefix.patch
+++ b/meta-oe/recipes-support/srecord/files/0001-cmake-respect-explicit-install-prefix.patch
@@ -7,7 +7,7 @@ If CMAKE_INSTALL_PREFIX was supplied externally, use it.  This follows
 the pattern suggested by cmake documentation in:
 https://cmake.org/cmake/help/latest/variable/CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT.html
 
-Upstream-status: Submitted [https://github.com/sierrafoxtrot/srecord/pull/68]
+Upstream-Status: Submitted [https://github.com/sierrafoxtrot/srecord/pull/68]
 ---
  CMakeLists.txt | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
-- 
2.30.2


