Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DA7C47258
	for <webhook@archiver.kernel.org>; Sat, 20 Jan 2024 19:42:28 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.31705.1705779743628239525
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Jan 2024 11:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GkFA3nQR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202401201942204f513f4a989fc6a1ba-dylaxy@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202401201942204f513f4a989fc6a1ba
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 20 Jan 2024 20:42:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=htD/cUkRCX3Dh/PdC3tduZ/hNGfwvTdch6jexv8cMb0=;
 b=GkFA3nQRWjAA7e6ADZLDaPrNLUBEaNJbSz0WuSbpCPjrETCdUgF4fDOarA1moHUyKRyW8w
 83h2NlXB03BhkPQzreCTk+RyZam0ZoXiJLZTu8rFVh3XGm7BerrTTUln8QHdMyxKSbYMJ5BS
 tiijVYIcxiu60QZNH3qTFg5pkaEgc=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] srecord: fix malformed patch upstream status
Date: Sat, 20 Jan 2024 20:41:02 +0100
Message-Id: <20240120194102.1365911-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Jan 2024 19:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108364

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


