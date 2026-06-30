Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8A2C44501
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:30 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17239.1782811347229143714
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TVxh7MPu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811349; x=1814347349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UPWcb1X7uzS039iOMD6QCO5VevhgqGZ2Uo3yak7MkZ8=;
  b=TVxh7MPuRuyE73g3lFY8Po4WpZD6Sg7qw/k30YOfw/JA3Bf24mi5RVmZ
   U9kkP7VSRIEuR1YMfSey6dZI7sz/4Fl+9Oyf4tt6YANqKAef83zokKCeY
   cV+ph3p32rkCOWQ6Z3oYZnALGIij77+625TbFJz7GhInnniWvcVLZRaYn
   tEU95S4YBDXxYpMti0c7fVQqLXmzFtnMTEqqJHoR05i2ybHfgPTP3Zzcz
   QkcPmm0B5KT+Lu8Nn0P8tNddtggBlAnwZwT6b/aiCh1eHBX6RQC4ogXRc
   CAe7yiMCg3CBasLFd2L118gUD5WdEAt4p3IBznNDZR/FzOWlw+bzgr88+
   A==;
X-CSE-ConnectionGUID: knWl4ihyRm6uE1V1wHY+dw==
X-CSE-MsgGUID: GHfIHVcIRD+7lhvmRNPWCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="245821231"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="245821231"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:27 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7A67D1C1C732
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:25 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 32B4E83287C
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3162D826FFA;
	Tue, 30 Jun 2026 09:22:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/37] nano: upgrade 9.0 -> 9.1
Date: Tue, 30 Jun 2026 17:21:38 +0800
Message-ID: <20260630092206.322-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127952

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- When searching, the viewport is placed snug left where possible.
- The ability to read and write files in old Mac format was removed
  (that is: files that use a lone carriage return as line ending).
- The ^T toggle between WhereIs and GotoLine has been dropped.
- When --backup is active, in some situations no backup was made,
  or it had a wrong timestamp.  Both issues are fixed now.
- When nano crashes or is killed, any .save file is not chmodded
  to the permissions of the base file, nor chowned to its owner.
- M-Ins and M-Del have become rebindable.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_9.0.bb => nano_9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_9.0.bb => nano_9.1.bb} (87%)

diff --git a/meta-oe/recipes-support/nano/nano_9.0.bb b/meta-oe/recipes-support/nano/nano_9.1.bb
similarity index 87%
rename from meta-oe/recipes-support/nano/nano_9.0.bb
rename to meta-oe/recipes-support/nano/nano_9.1.bb
index 06bb7a63ce..774bd0021a 100644
--- a/meta-oe/recipes-support/nano/nano_9.0.bb
+++ b/meta-oe/recipes-support/nano/nano_9.1.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9f384374b496110a25b73ad5a5febb384783c6e3188b37063f677ac908013fde"
+SRC_URI[sha256sum] = "5f47764274cb7532349ce0aa20ec10f1e8e851a6e9fa3eb66812c43d196db042"
 
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/nano"
 
-- 
2.43.0


