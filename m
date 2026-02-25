Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6C8F5544F
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 03:36:18 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38140.1771990578042939807
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 19:36:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fyKvQcFN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1771990577; x=1803526577;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0BhQg0U4wVqZSbPcU4u34KodXxuQE9T2w9wsTFoFL1Q=;
  b=fyKvQcFNaqxBBLU0sjypCnoBEy3DmXfKq2oRvOKOlAyYAOKlxCA7+/7l
   tveit/ca2FKo6DR0m+koptepTlvG0nyBLKEjmIYARBTfZvaRFlx6wa9bh
   3DjY7vlJ1Tj/gSHDMZpIl+EhbSIOOus27we1mJN6dNTLSgRjj/SXCm19E
   V9tAc5jE6WzkT86sxExGZySWk7uuG5NVrjgcOhfbWPp0DEOyIZmqKs5r0
   UunrMvrSdPzJU+Z9TosL+iJKUaisPidfb1haxuPk041yq3KkGflv4Zvdw
   6etIrulr01ZLyYTfvWfBC09qpf0f4G8n6Z4AKaMh78rqSwe8ydVrcwteI
   Q==;
X-CSE-ConnectionGUID: 4ckxgSMxStOLK9aAC6+VMw==
X-CSE-MsgGUID: OtdbxeX8R/inqdvd7KJa6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="231614142"
X-IronPort-AV: E=Sophos;i="6.21,309,1763391600"; 
   d="scan'208";a="231614142"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 46EBA155E
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 03:36:16 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E4AE28D204B
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 03:36:15 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.167.241])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5C63A180050F
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 03:36:13 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] tigervnc: Fix do_rootfs Error
Date: Wed, 25 Feb 2026 11:36:09 +0800
Message-ID: <20260225033610.670-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 03:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124604

Fix the following error:
ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlets of ['tigervnc'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
index a5413a9108..6e8e80f283 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
@@ -94,7 +94,9 @@ FILES:${PN} += " \
     ${datadir}/metainfo \
 "
 
-SYSTEMD_SERVICE:${PN} = "vncserver@.service"
+#If user want to enable service of vncserver, vncserver@:<display>.service is needed and further steps are listed in unit file itself.
+SYSTEMD_SERVICE:${PN} ?= "vncserver@.service"
+SYSTEMD_AUTO_ENABLE:${PN} = "disable"
 
 CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"
 CVE_STATUS[CVE-2023-6377] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
-- 
2.43.0


