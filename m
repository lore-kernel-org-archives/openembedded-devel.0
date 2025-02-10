Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8903FC021A2
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.46619.1739178109628401903
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sKMajzAU;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178109; x=1770714109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eGScnMUnm/MfO6TUBqft1zMmSOQm0MH/cwy0cLqAqzk=;
  b=sKMajzAUtXu9s+lb9NMJa39o+PiyjXk+r2AEtclwEgVclp7dsC3BnkSg
   OTYYNpfMl94xcZLdc49d07FXoma1efE9ua6Vayw13vEJlgVmlrp1pOdJ5
   nPsk9bcAGtMcZbVmomBmAjcP2TPSfPAOovKR5nCIlrcJgObYV4jRqFpsJ
   cDucMVJCFqcvFDxZhyGKCQrcys1bxCKs1vvnK3IIc4wwy4gemSYsrYpeg
   G0GN/De2FeQa8HZsmlIVk3UZk8v0tD44uPytNhBRZqnL8dkwMi0iQfj0j
   nFynZ5h+Z1jnQnXDYWiFnsdDpWbSfgaaAEzuWmMxbj3yc8oLGYxpFhgqM
   A==;
X-CSE-ConnectionGUID: uPjna2aORfCG4YNG/+fnWw==
X-CSE-MsgGUID: sE1bZoazRo6tQy2JgfxpGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="176813913"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="176813913"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:47 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 31572F573
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E6E73CFA5B
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:44 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8888F1A000B;
	Mon, 10 Feb 2025 17:01:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/66] botan: upgrade 3.6.1 -> 3.7.1
Date: Mon, 10 Feb 2025 17:00:31 +0800
Message-Id: <1739178095-26432-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115330

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025.

Changelog:
 https://botan.randombit.net/news.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-crypto/botan/{botan_3.6.1.bb => botan_3.7.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/botan/{botan_3.6.1.bb => botan_3.7.1.bb} (91%)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.6.1.bb b/meta-oe/recipes-crypto/botan/botan_3.7.1.bb
similarity index 91%
rename from meta-oe/recipes-crypto/botan/botan_3.6.1.bb
rename to meta-oe/recipes-crypto/botan/botan_3.7.1.bb
index c9f977bb4c..a9d080c9a5 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.6.1.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.7.1.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Crypto and TLS for C++11"
 HOMEPAGE = "https://botan.randombit.net"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://license.txt;md5=573e74513ae3057b04757df65b537de0"
+LIC_FILES_CHKSUM = "file://license.txt;md5=3f911cecfc74a2d9f1ead9a07bd92a6e"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7cb8575d88d232c77174769d7f9e24bb44444160585986eebd66e749cb9a9089"
+SRC_URI[sha256sum] = "fc0620463461caaea8e60f06711d7e437a3ad1eebd6de4ac29c14bbd901ccd1b"
 
 S = "${WORKDIR}/Botan-${PV}"
 
-- 
2.43.0


