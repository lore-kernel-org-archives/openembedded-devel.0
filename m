Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C27FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 09:36:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9023.1777368980333074207
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 02:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LlaL6zRs;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777368980; x=1808904980;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lHk7oLsCvV4GkngUO6A+JmO28q9QdK34hci7f0+wAvg=;
  b=LlaL6zRsevlyJFL6ACjZ51rHo1KlF6VdcI9OFG50CNCyBhgWmbWpMY26
   Tu1OIY17QhkMx4A7FdK1HxZFuO/rTfJunIogPEDAs6NN56FlljYz27Hn+
   R/puNS1OJ5edDYKCg+rbdaaPlHVR8V+pyKpiODtX04gFqijuqhtxmf1Te
   x17THDZIJuMIuhBpLkdHl8MHX1p3uR2bLbPUdoVh7OqqNUvJd/C9F6l7d
   /YRYsthdAM4ik4Xy0QCMAQl4lJVe95DtVFqvAGtc86IO1M0LscG8793dQ
   EtU8AhDdaJLBSqccKwVJ59ZOJuTwt/hKITe+zJYfBvPS2XJ9XM4unDdLI
   Q==;
X-CSE-ConnectionGUID: Op4lPp1DT5+ImlZf+3lcHw==
X-CSE-MsgGUID: i/vfWRvKSSOaX7XUNXPSLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="226365112"
X-IronPort-AV: E=Sophos;i="6.23,203,1770562800"; 
   d="scan'208";a="226365112"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 18:36:18 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8731942A31E
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:18 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 30EABC01294
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:18 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id E8D6D18002FF
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:15 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH] eog: Add HOMEPAGE
Date: Tue, 28 Apr 2026 17:36:10 +0800
Message-ID: <20260428093614.672-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126652

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-gnome/recipes-gnome/eog/eog_49.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/eog/eog_49.3.bb b/meta-gnome/recipes-gnome/eog/eog_49.3.bb
index d67c3733af..eee6c14459 100644
--- a/meta-gnome/recipes-gnome/eog/eog_49.3.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_49.3.bb
@@ -1,4 +1,6 @@
 SUMMARY = "This is the Eye of GNOME, an image viewer program."
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/eog"
+
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-- 
2.43.0


