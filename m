Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3555E9380D
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 02:48:17 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.263664.1776048492676618695
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2026 19:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qGijvNU6;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776048492; x=1807584492;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1MVT9hN4EuOYQJyvcZmZoftZQyw3Zhwv10Ncx0scguA=;
  b=qGijvNU6hlH2j1CNi+AW8zZEUzEL+w/Tr1EAzgh474l71D7+lIi1SB39
   GQFHbNY3Djb6Sh/mdYZCA6Z+q+SIFpI+CjHAoYWfUmei2+Fnzk18FBY0l
   hJxyUiBlQDM/W7bLMGfVFp6/Avfu4SU6laArVQH8ecISNKegBgLUtjU3G
   T+Sgk9JPvxPAoXYVxH0OI7wN1jRzfY+6NIcJytPWbv43VskH01Wu2EwWF
   F/8Gy9zciI4c6SICoQSrwfsCqeCwf+P8TZr7mHqS/W8A9i60FE8vrRKuR
   BM2GipQzv7d1X5Zv3f6byazL5itGDfsqPirzRjMlx+oy+AWuoFXE4R//w
   A==;
X-CSE-ConnectionGUID: h/A924DERcy11G1i3Qbhkg==
X-CSE-MsgGUID: KIkU/m4fRduz8VBj5OcLEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="224192625"
X-IronPort-AV: E=Sophos;i="6.23,176,1770562800"; 
   d="scan'208";a="224192625"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 11:48:10 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C5A9DC0158C
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 02:48:10 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 7E35414003B7
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 02:48:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 05D6418001D7;
	Mon, 13 Apr 2026 02:48:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] dovecot: rename downloaded file name
Date: Mon, 13 Apr 2026 10:48:03 +0800
Message-ID: <20260413024804.1678-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 02:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126264

From: Wang Mingyu <wangmy@fujitsu.com>

Add downloadfilename to SRC_URI to ensure the downloaded file has
a consistent local name, avoiding potential future filename conflicts.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
index a6b78ea781..9b3666863c 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
@@ -9,7 +9,7 @@ SECTION = "mail"
 LICENSE = "LGPL-2.1-only & MIT & Unicode-3.0 & BSD-3-Clause & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cb805cc6bdb95ba8fc2398a55fd50877"
 
-SRC_URI = "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
+SRC_URI = "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
            file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch \
            file://dovecot.service \
            file://dovecot.socket \
-- 
2.43.0


