Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76C3D68BFE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:12 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37697.1766048642708235140
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jgoaFbSu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048643; x=1797584643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TAgSZinTYEI3m/fI7ELRIuThagnqncDff50/qRt8NuM=;
  b=jgoaFbSuAOrXYD4YtPhDpkJ9deOKACZenLI4R53hC2tgMsJP3ghKEc1w
   ZnUIL9bHokHI3PvvcRgWN/fCsjYmqWNyKkv70UBQ3Pzu8uFmbrS73IM5k
   moUCxi1OSEZ2vKFQG/R5cCS8KBY2IcoKKpduksFrHP1vVieolYVRDQe3o
   rHY3vtoEMknO0tKwuja8DfaE0dbw0FjyeuPu6mVJQ6zc4Qmoxa7VrGLrX
   kgsaXJG3hUdRpTumaXi4QTaj2jDKercnQWfOgx7S5BTt5Mlsr4s4ogT4w
   JoTfE/HTj6Ee++BQh3r/wknTuNJjqrK9nsCgR8YmojoXKDou0vRVvJF3E
   w==;
X-CSE-ConnectionGUID: gFVTiGR1TR2RyQKjdNwp8A==
X-CSE-MsgGUID: eHHioaInTY+16NqptkEaCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="223081479"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="223081479"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:01 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id ECCDC4071C0
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:00 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id A28211004174
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 43C3E101E531;
	Thu, 18 Dec 2025 09:03:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 04/20] libmime-types-perl: upgrade 2.29 -> 2.30
Date: Thu, 18 Dec 2025 17:03:30 +0800
Message-ID: <20251218090346.735-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122738

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Fixes:
- no undef when simplifying illegal type

Improvements:
- add bugtracker to meta
- better OO use of attributes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libmime-types-perl_2.29.bb => libmime-types-perl_2.30.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmime/{libmime-types-perl_2.29.bb => libmime-types-perl_2.30.bb} (93%)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.29.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
similarity index 93%
rename from meta-perl/recipes-perl/libmime/libmime-types-perl_2.29.bb
rename to meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
index f5cc4ce84f..aa951a4c5a 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.29.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://META.yml;beginline=13;endline=13;md5=963ce28228347875
 SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "4a6d4ec9b3aa0df2f935d4d74f7dc809fd523d508cd0e9966b5b257c02c03414"
+SRC_URI[sha256sum] = "f31b1666bdf420b4b65c373ce0129ee349dd24bab4cd16c7f01b698fe450be6f"
 
 S = "${UNPACKDIR}/MIME-Types-${PV}"
 
-- 
2.43.0


