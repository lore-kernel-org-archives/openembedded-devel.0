Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A83DCEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 07:51:11 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4643.1763365863576257325
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Nov 2025 23:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dwhbbr7E;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763365864; x=1794901864;
  h=from:to:subject:date:message-id;
  bh=dnNVCeH/qA6GSPxLdfHEXF+FZW+mtoGvJwRsvApibe0=;
  b=dwhbbr7EuSYNAwNc0wKaN4r5NR++2MIV3BmRaxj/vsxUpPQ4EGIm5Ofd
   r3fq9b4by/9fXXI0XuSgHNtEXDA1yL/SkT9Uqx1lDYImVPTpxEcfVsrsf
   ykpNBmITqNHDNGV3mKjBGuEr4R4NrvBg5kwjWSszNE4rUjg+BcczkD1vM
   law9Ttfu+pJeS5j9Dn55QaQ+KyX0Y2cV7eR5H+8oDbRLSDTdAP2ttIuO9
   ANPgCA36kJxQMPk/2WyXdsWETMkYt9zvkUlyaiIf5LKV9YGxzj7jipq0J
   yK1QgPmRmytmND37OnQ29dzpfcRCsWV8RtulTjYQvN0at5AGdpDjjTZil
   A==;
X-CSE-ConnectionGUID: SGR8MARGRAi1OMsCijBYXw==
X-CSE-MsgGUID: wcxMEbShRCm+BNgc/Er8Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="218861064"
X-IronPort-AV: E=Sophos;i="6.19,311,1754924400"; 
   d="scan'208";a="218861064"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 16:51:02 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id B2887820707
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:51:01 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 71DD11800244
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:51:01 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8A65A2000207
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:50:59 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] flatpak: upgrade 1.16.1 -> 1.17.0
Date: Mon, 17 Nov 2025 15:50:37 +0800
Message-Id: <20251117075037.2602-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121757

Changelog:
  https://github.com/flatpak/flatpak/releases/tag/1.17.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../flatpak/{flatpak_1.16.1.bb => flatpak_1.17.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.16.1.bb => flatpak_1.17.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.16.1.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.16.1.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb
index 0d688adf3e..a51937ea72 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.16.1.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
 
-SRCREV = "b676905d91aa3c4e524ca663784d4cf085c465d7"
+SRCREV = "0835c0272f3a0389f97b02cad4b208f80fec99ed"
 
 
 inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection python3native mime features_check useradd
-- 
2.43.0


