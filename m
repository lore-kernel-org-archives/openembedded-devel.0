Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36839FD5338
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:13:40 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92722.1772187216399386652
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bOB+FuSf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187216; x=1803723216;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=opAiCQD9dkW751y/283nMhc/STvB81X8CTbjNoCFmlY=;
  b=bOB+FuSfk6vyu8nfyfTwki+9doOPvMQCGjMu8dB1twKQw9+SyLa8z1IR
   TrNfG8F4L2ECDRSCURel6rvv99ckUcrItxhCyjsyqlCwcHjY4unAiTOG4
   J6QkHV7B0bmQKTa9mjEr1E06uJpd4g/zHZi5Gjvvvyk0pUys7/RYIqTog
   oH+5PBCaUEKIh1dTAu/5U7nan/iUSPIYrb5hjo7riQYJoj0E3qlK/qvbV
   +o8CiaqEVDQtZWoBlI09lzToXTIbT9fy/0SV/EPo4HVv6HjFU2J4Nx9A+
   WtoQoQbaM3pymWOpsWKPYpR6DtEfysh7yowgT83z/wrNLSUUys9QjYUHK
   g==;
X-CSE-ConnectionGUID: 10d1jDGWTBi4FULp/HzQlw==
X-CSE-MsgGUID: 1y5835R5R7a5Y7G+XXpSdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="218740466"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="218740466"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.fujitsu.com (Postfix) with ESMTPS id 974E8C00354
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:34 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 43EAE8D65CC
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5AA53180059F;
	Fri, 27 Feb 2026 10:13:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 01/52] frr: upgrade 10.5.1 -> 10.5.2
Date: Fri, 27 Feb 2026 18:12:36 +0800
Message-ID: <20260227101327.1432-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124701

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-protocols/frr/{frr_10.5.1.bb => frr_10.5.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/frr/{frr_10.5.1.bb => frr_10.5.2.bb} (99%)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.5.1.bb b/meta-networking/recipes-protocols/frr/frr_10.5.2.bb
similarity index 99%
rename from meta-networking/recipes-protocols/frr/frr_10.5.1.bb
rename to meta-networking/recipes-protocols/frr/frr_10.5.2.bb
index c125709bf4..710bdf4a5d 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.5.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.5.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.5;
            file://CVE-2025-61099-61107-2.patch \
            file://CVE-2025-61099-61107-3.patch \
            "
-SRCREV = "d17791ee7ee76a0407d3fdbebf81bd242840741b"
+SRCREV = "fa68c0ca04f95125cb993b5cacb64fc1495348eb"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
-- 
2.43.0


