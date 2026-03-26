Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E063C10A1E96
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:12 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46410.1774526226736510048
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=imB2YVfO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526227; x=1806062227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AbNG6ughfjYAhdg5AkuhJ1opyzFzJVEt3AcpamrG8Fs=;
  b=imB2YVfO2UcoMhB5SNKUYWajPykcpgdRPjlYMFTTPNyvRCPXd+hDkO53
   w+/W+8AY7fe/OfXcYoTAhiYzrhPH7x5ttNkC9XaE4cMC542H24X7ZeIR1
   9SHi/Vm9NOCMa93vKzn8+rNd87qszzfVgnIZ4KwSUYchd4JQJFlEJx3ah
   c8aU6IqQI9Vg8+nPZIJ71hPSuWjFlP9+3j7bGVFZP7yqDyTUfpkbH2BeI
   iWRrNCY9iNHIuwIW+488aGnRrH6j3pBkd2DcwRzhx9D9cVAMNpJfoFglO
   Pm9srGXtLgUh9ut2pm9C1ldQCTkCqrZtttqlKyAeObP/k2SgQyLks9yff
   g==;
X-CSE-ConnectionGUID: DMD7o46kTGKnWuKoiAnigA==
X-CSE-MsgGUID: nOltCj0nRCaY7m2K5bYe/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234718840"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234718840"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:05 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 40E351C001BF
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:05 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E74B1C00D48
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 70CE31807167;
	Thu, 26 Mar 2026 11:57:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 15/63] gparted: upgrade 1.8.0 -> 1.8.1
Date: Thu, 26 Mar 2026 19:55:45 +0800
Message-ID: <20260326115634.1199-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125670

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Implement blkid false detection of whole disk ZFS workaround
* Replace use of new[]ed char buffer with vector
* Implement blkid false detection of whole disk ZFS workaround

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gparted/{gparted_1.8.0.bb => gparted_1.8.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_1.8.0.bb => gparted_1.8.1.bb} (93%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.8.0.bb b/meta-gnome/recipes-extended/gparted/gparted_1.8.1.bb
similarity index 93%
rename from meta-gnome/recipes-extended/gparted/gparted_1.8.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_1.8.1.bb
index dec9ea01ae..b8c5587651 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_1.8.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_1.8.1.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'file://0001-Install-polkit-action-unconditionally-executable-pke.patch', '', d)} \
 "
-SRC_URI[sha256sum] = "f584ed4be7fd09c2cf6a784778a8540970d985f0ac8e5a7bd0628528a3ab5609"
+SRC_URI[sha256sum] = "67388ac405f9fe92a40636cb03b0e1e0bb6403ad89ccc174b2ff190ef6f32349"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gparted/files/gparted/"
 UPSTREAM_CHECK_REGEX = "gparted-(?P<pver>\d+\.(\d+)+(\.\d+)+)"
-- 
2.43.0


