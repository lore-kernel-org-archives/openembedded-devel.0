Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17CCCD13DF
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:18 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17226.1777546213155135083
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PG0Pvrpg;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546212; x=1809082212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JlcBN419EOoEDLOTZWc3r4DNd5r/J/Wkgtwu+q0OZSM=;
  b=PG0Pvrpgw5gXmTr9F7wa1ea0rk2MRMZyYgTJJ7VgslieCFKm1HrTsfhn
   bKfHNfiNcb/JN6+33UiCKFEDZ2+PS3uWRazWo65ePY7Hpv6YhkhyqeTgy
   EAawdiFvvlI1iqyvfEiMYZvUyw7p2vbeqkcYoQ6qg01y0m67/v+rWJsMI
   oyY2sdokaiVnKH05coUNik3N1HLR1E4qNIBIEP3h2lNcN521L3udvJZW4
   xyZgMxTGHu+C2b4vsV7myK42ssqpFq6cInlxWxiMfH7e/t0go7VjCSAj8
   IpConBa7jLoohnwoY9o/Whurg28OIbBhooXMMG+mb1M9yF16X6xSZMymr
   g==;
X-CSE-ConnectionGUID: y2pEfhxjT+WiIuvKoLyGyg==
X-CSE-MsgGUID: 9ZsEUDp7QeezH8GOeNPlRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="217636942"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="217636942"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:11 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id AFDCC1C1C706
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:11 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 66D50C00227
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 105991801542;
	Thu, 30 Apr 2026 10:50:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 27/64] parallel: upgrade 20260322 -> 20260422
Date: Thu, 30 Apr 2026 18:48:46 +0800
Message-ID: <20260430104924.1106-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126696

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Remote jobs are spawned via pipe to perl, so environment can be bigger.
* --pipe-part -a supports -L/-N if zextract is installed.
* --pipe-part -a supports .gz, .bz2, .zst-files if zextract is installed.
* Comments in code is redone.
* Bug fixes and man page updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20260322.bb => parallel_20260422.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20260322.bb => parallel_20260422.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20260322.bb b/meta-oe/recipes-extended/parallel/parallel_20260422.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20260322.bb
rename to meta-oe/recipes-extended/parallel/parallel_20260422.bb
index 5a9980e66f..74cf8c75e2 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20260322.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20260422.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "764680e932f4d0d21cf0329bd9f9eed659895de16836001f6491533b822befe0"
+SRC_URI[sha256sum] = "664cf165d66ea217b2f49cd96a7865ecf90c9d0616599cc2aba8cad481d907bb"
 
 inherit autotools bash-completion
 
-- 
2.43.0


