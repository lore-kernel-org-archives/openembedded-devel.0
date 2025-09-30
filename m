Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A24CAC5B9
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 08:23:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.20385.1759220609571493954
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 01:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ElbcVOny;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759220609; x=1790756609;
  h=from:to:subject:date:message-id;
  bh=JhwP7nzwwoQn/lUXVOLA2Zva1d58Nt+3WuM83IXZK8c=;
  b=ElbcVOnyTyff/cz8TnVB0tcPKu4iJHJNERaM8u76bnrU54Cb0VAEywAA
   p/DEU5QPujNBBc4EoBAUQUT5OOrlw8vY+DT2/vd+EZ36Ama0CXJWKIoll
   Qo8uD8ncp60///CDVMrv50/VyNsIa10Tz55RHmYI/tgfbf9fLe7IX+HVj
   3HIlIb1UeHIDiJqVCCinUeepDiLKEnRMgkwLig4LN2J5It5Y6m0KN3QSW
   lRba4A81GstjMV/s/hXNgB8R1d7vZQXCUT3pA4pXDkq6TBPv4cRIxTvcl
   eM24lYc3gJradYzAWWYV4BFictnJ+5SPI/S+ubJrfNADZ2hn88moJDp2m
   Q==;
X-CSE-ConnectionGUID: IIvNDlqpSZCLoQklaAEFTQ==
X-CSE-MsgGUID: eXLNGkigRdSdptwtwIXX3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="214341880"
X-IronPort-AV: E=Sophos;i="6.18,303,1751209200"; 
   d="scan'208";a="214341880"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 17:23:28 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id D6C92C0023A
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 08:23:27 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 919508DB0C5
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 08:23:27 +0000 (UTC)
Received: from zhengrq-VirtualBox.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id B282B82ADB6
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 08:23:25 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] dracut: Fix the multi-lib config
Date: Tue, 30 Sep 2025 16:23:17 +0800
Message-Id: <20250930082317.2314-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 08:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120051

When enabling multi-lib,following error occured:

| install: cannot create regular file 'build-dir/build-yocto/tmp/work/aarch64-ubinux-linux/dracut/108/image/usr/lib64/dracut/dracut.conf.d/': No such file or directory

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-initramfs/recipes-devtools/dracut/dracut_108.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_108.bb b/meta-initramfs/recipes-devtools/dracut/dracut_108.bb
index 5c95abbf29..276f301daf 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_108.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_108.bb
@@ -76,7 +76,7 @@ systemdsystemconfdir=${sysconfdir}/systemd/system
 systemduser=${systemd_user_unitdir}
 systemduserconfdir=${sysconfdir}/systemd/user
 EOF
-        install -m 0644 ${B}/${DISTRO}.conf ${D}${libdir}/dracut/dracut.conf.d/
+        install -m 0644 ${B}/${DISTRO}.conf ${D}${nonarch_libdir}/dracut/dracut.conf.d/
     fi
 }
 
-- 
2.43.0


