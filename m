Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64EBC19F32
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 02:34:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.3224.1741228479247827051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 18:34:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HI+nCKJ6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741228479; x=1772764479;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cfIDdNP5V8Xy8VCc7+1g/Q1QnQyNGkIKuDWf/etRNGM=;
  b=HI+nCKJ6bJQZ1BY1BG4fY23xUmn2qzLHJetpLVsbrb6tAvdff6fGOSni
   HBUuPh+WUXY6wh1QfnJOFB0qaLY6ZLk5qCHYdUtuC0qCvRhJ94xW0rSaf
   HDQhCpcu9KqyNXbicx2X4eKVHlEAPdC1krGf6Zp3y6GsKJQdPIRrceF+h
   k/tZ1WsC6mTx7e2DjycvOYq+CeI4J6SN5O0ezPVrGRL1YPJFWOiTIHOWS
   dzvdZulI4pTKmx2RqMIcqh749r8t+jXei0iIIZpl3rs26SC7VyYItGqhV
   HZD9Z6+jJhgUwVvvhtcssU3p07ZL9Dwi21qLxvA1KbO0YjpBA7OqWHbG+
   w==;
X-CSE-ConnectionGUID: KDFxlAMXRaWkpTwscVORYw==
X-CSE-MsgGUID: pAKEk3J/Q0m0fcYH9l/AfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="192173699"
X-IronPort-AV: E=Sophos;i="6.14,224,1736780400"; 
   d="scan'208";a="192173699"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 11:34:37 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C87EAD480B
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Mar 2025 11:34:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8AFEDD8C1F
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Mar 2025 11:34:34 +0900 (JST)
Received: from ubuntu24.local (unknown [10.193.128.98])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E53041A0078;
	Thu,  6 Mar 2025 10:34:33 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dialogp: By default, dialog_1.3-20250116 renames /usr/bin/dialog to /usr/bin/${HOST_SYS}-dialog.
Date: Thu,  6 Mar 2025 10:34:34 +0800
Message-ID: <20250306023435.68408-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 02:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115764

From: Lei Maohui <leimaohui@fujitsu.com>

mkdir -p /build-dir/202503/build-poky/tmp/work/core2-64-poky-linux/dialog/1.3-20250116/image/usr/share/man/man1
/build-dir/202503/build-poky/tmp/hosttools/install -c dialog /build-dir/202503/build-poky/tmp/work/core2-64-poky-linux/dialog/1.3-20250116/image/usr/bin/`echo dialog |sed s,^,x86_64-poky-linux-,`

This change goes against established user habits. So, create a symbolic link named /usr/bin/dialog.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
index bc6621de1d..65ccaeb254 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
@@ -29,3 +29,6 @@ do_configure() {
     sed -i 's,cf_have_ncuconfig=unknown,cf_have_ncuconfig=yes,g' -i configure
     oe_runconf
 }
+do_install:append () {
+        ln -sf ${bindir}/${HOST_SYS}-dialog ${D}${bindir}/${PN}
+}
-- 
2.43.0


