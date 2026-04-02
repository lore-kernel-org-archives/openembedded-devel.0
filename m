Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951CF1112276
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:23:23 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7244.1775096596905550388
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IpIJ9CTy;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096597; x=1806632597;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n/bpkkrqSYzG3EcneZ3vGWx6aoo6kXNZgOrpKhj2pb4=;
  b=IpIJ9CTyZEESAQXZiyleTMKkVq19HY1y0O/zMXVOmJ44B8HGpNWNAs67
   F4iAbDEXkl5BEQBAaVzmk6lBwT6yPrJVuowdCTk2wIJC+mvmddHO0Yk9a
   U7DFtJlnIE2cUQnO5nLoiATa1VQH2FVlsOSe55sktAs3MQBZoROL2dR79
   HeInYrcFdan/8RtvlRbqootaEYvB8r0jsOjbGa/9DmCcQPoz1dp5nic6b
   Ou3qaKLLCGRqXhXy3yEO1paDEV3RvZNbwe47NOBanjGBHj8gbKQwSY2g/
   RiQY4ON4J5qp+WpFVc2aNOzQtpqeVubjifpxr656uJLzidT+b0z6yw6fK
   A==;
X-CSE-ConnectionGUID: 4xnNyn2pScetn40Zm/xKxQ==
X-CSE-MsgGUID: vKxu8lpSSD+lq3MRb0qZwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="214300505"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="214300505"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:23:15 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5F498157E
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:23:15 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 13EE9C00D59
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:23:15 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C9EA9101730B
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:23:12 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] vsftpd: Fix multilib install conflicts
Date: Thu,  2 Apr 2026 10:23:09 +0800
Message-ID: <20260402022309.14472-1-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125955

Fix following error when multilib is used:
  Running transaction test
  Error: Transaction test error:
    file /etc/pam.d/vsftpd conflicts between attempted installs of vsftpd-3.0.5-r0.x86_64_v3 and lib32-vsftpd-3.0.5-r0.core2_32

Signed-off-by:  Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
index f2c27606e1..69d97d326d 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
@@ -35,8 +35,9 @@ RDEPENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-li
 PAMLIB = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '-L${STAGING_BASELIBDIR} -lpam', '', d)}"
 NOPAM_SRC = "file://nopam.patch"
 
-inherit update-rc.d useradd systemd
+inherit update-rc.d useradd systemd multilib_script
 
+MULTILIB_SCRIPTS = "${PN}:${sysconfdir}/pam.d/vsftpd"
 CONFFILES:${PN} = "${sysconfdir}/vsftpd.conf"
 LDFLAGS:append = " -lcrypt -lcap"
 CFLAGS:append:libc-musl = " -D_GNU_SOURCE -D_LARGEFILE64_SOURCE -include fcntl.h"
-- 
2.43.0


