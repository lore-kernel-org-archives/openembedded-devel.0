Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278ADD1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 05:57:19 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.874.1765259834599880603
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 21:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K0KpmeSm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765259834; x=1796795834;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7StBgYOZexgg1JnsIrz+nzmIG8bO/bcuZMOnDEybRbg=;
  b=K0KpmeSmYcYBa6wLyFMGDu7nPCTyFkATassoceFHFd2LR9HfVLVoNWYd
   vbzjC4A7SauNC8pw1zxNd1hDfewd6hAYjHKfITFu1tULZGJ8STa6RMY6P
   NvpQhOxQnUXK8RXmrgC3anRA+qULtrTIHA8YhPdczj2O4idMH9uUmAwvL
   EZ9aaUkChMPtL/Aallp6z20Ymdnpg7c1Q012fuR9ki4N1saPg+UtzMBK2
   lRQjU83W4ayH1HE44a47FYd5BeM4lM2d6JSVwJ/u6jE03D+30r4oPNyer
   ksQKPujSyEYfV+kcyx4pVQpjRbQtVCNkdGTFmHekGU/oOQyPHSanrnCEX
   g==;
X-CSE-ConnectionGUID: NL9uiXREQGSDhrqJ2tyOMA==
X-CSE-MsgGUID: lYPUvaa+Q8WFJaoLiticyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="221346616"
X-IronPort-AV: E=Sophos;i="6.20,260,1758553200"; 
   d="scan'208";a="221346616"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 14:57:13 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 13CE21002B9B
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:57:13 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C26018D204D
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:57:12 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id AB5651000605
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:57:10 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 5/5] ufw: upgrade 0.36.1 -> 0.36.2
Date: Tue,  9 Dec 2025 13:56:49 +0800
Message-ID: <20251209055649.22367-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 05:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122398

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-connectivity/ufw/{ufw_0.36.1.bb => ufw_0.36.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/ufw/{ufw_0.36.1.bb => ufw_0.36.2.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
rename to meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb
index c479eefba0..171d0f6285 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb
@@ -8,13 +8,13 @@ SECTION = "net"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
-SRC_URI = "https://launchpad.net/ufw/0.36/0.36.1/+download/ufw-0.36.1.tar.gz \
+SRC_URI = "https://launchpad.net/ufw/0.36/0.36.2/+download/ufw-0.36.2.tar.gz \
            file://0001-optimize-boot.patch \
            file://0002-add-an-option-to-specify-iptables-location.patch \
            file://0003-only-make-one-reference-to-env.patch \
            file://setuptools.patch \
            "
-SRC_URI[sha256sum] = "1c57e78fbf2970f0cc9c56ea87a231e6d83d825e55b9e31e2c88b91b0ea03c8c"
+SRC_URI[sha256sum] = "2a57a99eecef6b44db3537ed2520b30bae3759f8465456e22e404cd643838bf5"
 
 UPSTREAM_CHECK_URI = "https://launchpad.net/ufw"
 
-- 
2.43.0


