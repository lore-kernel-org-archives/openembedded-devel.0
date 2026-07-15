Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21389C44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:39:40 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3413.1784111975501937191
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SXrrhekC;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784111978; x=1815647978;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MkunTxn6tnapZMH2+YFRpZikiOCPkPbsy3sn5nC5ocU=;
  b=SXrrhekCSzPGIyP1syD+ulCBrREsbLv990vOcpbnRd9Y1Kl9Kl4erjoX
   eWajxwmL3g3FoH/tvmYxebzjq8CSiemDDLyrHmt2JGMuixXvwGHTq81UC
   T40GU9JNvMruRVHVeEVP4F7fi2pgd2zCE21smyLBZL/Gwv9S+nAHPTcfi
   Y0D2BuN9cISVkV07YKW9/Y+pOVflZjce0oJLNW1KeiIikXqBv4g6SFxhc
   MvSqvAKqBt6Gp4q+UmHJudV5ZKM4PuQycL+Lu7+PzvqjqIM8MJSjvB/le
   AFye0lMfUoQgUmNKzht48XGyxK/O6XuF24v7kImxkY+g3e6AVHh6kjVp6
   Q==;
X-CSE-ConnectionGUID: D4LCggz2SKqJ8YfFQtlqEA==
X-CSE-MsgGUID: eZ7XIgkATiOPDgh6SdeW0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247440344"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247440344"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:36 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7146B1002819
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:33 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 26F1F18000D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3CBB91800B81;
	Wed, 15 Jul 2026 10:39:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 01/44] cpan-requirements-dynamic: upgrade 0.002 -> 0.003
Date: Wed, 15 Jul 2026 18:38:31 +0800
Message-ID: <20260715103914.2120-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128174

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
  Updated contact address to website URL
  Updated distribution notice to <https://www.gnu.org/licenses/>
  Changed example signature: Updated the example signatory from Ty Coon to Moe Ghoul

Changelog:
 - Avoid undefinedness warning in config_defined

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ts-dynamic_0.002.bb => cpan-requirements-dynamic_0.003.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-extended/requirements-dynamic/{cpan-requirements-dynamic_0.002.bb => cpan-requirements-dynamic_0.003.bb} (74%)

diff --git a/meta-perl/recipes-extended/requirements-dynamic/cpan-requirements-dynamic_0.002.bb b/meta-perl/recipes-extended/requirements-dynamic/cpan-requirements-dynamic_0.003.bb
similarity index 74%
rename from meta-perl/recipes-extended/requirements-dynamic/cpan-requirements-dynamic_0.002.bb
rename to meta-perl/recipes-extended/requirements-dynamic/cpan-requirements-dynamic_0.003.bb
index 4ee221a8a0..89b62d7434 100644
--- a/meta-perl/recipes-extended/requirements-dynamic/cpan-requirements-dynamic_0.002.bb
+++ b/meta-perl/recipes-extended/requirements-dynamic/cpan-requirements-dynamic_0.003.bb
@@ -3,10 +3,10 @@ DESCRIPTION = "This module implements a format for describing dynamic prerequisi
 of a distribution.cts and (by default) mails MIME messages."
 HOMEPAGE = "https://metacpan.org/pod/CPAN::Requirements::Dynamic"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=818dfe6ef2e2204af6c824ca00e2b485"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1bae8e4882b2dc386a0b72b7265c4a22"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/CPAN-Requirements-Dynamic-${PV}.tar.gz"
-SRC_URI[sha256sum] = "9e290179fd1ab8574f7a2297baf015ea4fef3703a99d48798f61ec9347b4905b"
+SRC_URI[sha256sum] = "0731694542ec57aead9f20259ba678f74e5602e655b1833eef3e9336f47298e8"
 
 S = "${UNPACKDIR}/CPAN-Requirements-Dynamic-${PV}"
 
-- 
2.43.0


