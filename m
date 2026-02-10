Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B556EA3F20
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 08:12:33 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15435.1770711148708102224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Feb 2026 00:12:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aPeXPK5g;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770711149; x=1802247149;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=npPAuCndAXRoNc3MGBAN53klBq5qKEj4qQZPs8U3s/A=;
  b=aPeXPK5gTNpIh4FTc2T9kcVNBscUEkoLQY1NlZSxpsPxbwbpds+I6zfk
   9BXjSQ2Xpq4C9zU9rDjXZzozm8dCGSanzlnEmUSOK5uDP5pdY7+PCcQER
   B30awaLr/LnXJ+UGDjgMVeJImYbBhMLG9sa0WSZAGlwJWmybFMKbwrcLX
   9aODR57SjCqyKRNAwFVmt/7/GUqx4twMTfsFlGCfxyfjgQpWgapXF26Ud
   85DPtPq2G4/4FCpbkn2Ar4gS+Mr8V3pQNLj0Lz0pZZbpzz+452tHgIz/E
   8quFWWPGnbmGRMmE9PDFu3dZ2330qRne7j6ViAjz7tqHw7N4vagAQBpy9
   A==;
X-CSE-ConnectionGUID: wKxiMoCHT1Cf8nzlL6oGfw==
X-CSE-MsgGUID: I7DGBWbaTD6AJUGtEAD4Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="233287060"
X-IronPort-AV: E=Sophos;i="6.21,283,1763391600"; 
   d="scan'208";a="233287060"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 0E580407546
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 08:12:27 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id A2CAB1400374
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 08:12:26 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 7AFD01003141
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 08:12:19 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] open-vm-tools: upgrade 13.0.5 -> 13.0.10
Date: Tue, 10 Feb 2026 16:12:17 +0800
Message-ID: <20260210081217.12734-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 08:12:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124319

ChangeLog:
https://github.com/vmware/open-vm-tools/blob/stable-13.0.10/ReleaseNotes.md

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{open-vm-tools_13.0.5.bb => open-vm-tools_13.0.10.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/open-vm-tools/{open-vm-tools_13.0.5.bb => open-vm-tools_13.0.10.bb} (98%)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
similarity index 98%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.5.bb
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
index ac641e0327..80dc3529c0 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
@@ -25,7 +25,7 @@ LICENSE:modules/freebsd/vmxnet = "GPL-2.0-only"
 LICENSE:modules/linux = "GPL-2.0-only"
 LICENSE:modules/solaris = "CDDL-1.0"
 
-SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stable-13.0.x \
+SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=master;tag=stable-${PV} \
            file://tools.conf \
            file://vmtoolsd.service \
            file://vmtoolsd.init \
@@ -51,7 +51,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
 SRC_URI:append:libc-musl = " file://0001-Add-resolv_compat.h-for-musl-builds.patch;patchdir=.. \
 "
 
-SRCREV = "fbc80ffbd226b4a61bb8ea1c9a682b5c7614e3fd"
+SRCREV = "f8fbcd0bf3b5869e2822542c398a51ddf7bd5f7a"
 
 S = "${UNPACKDIR}/${BP}/open-vm-tools"
 
-- 
2.43.0


