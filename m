Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376F0CD5833
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:24 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3058.1767781757134390523
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WBLV7GTB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781758; x=1799317758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PBJgDq+bHSOTfeQAAEZvk0H9nkgAJEdmX1MQajt736U=;
  b=WBLV7GTB2KEKt5/0JD0hvZJ1/5KrEO4Yvv9JDVDZ7dsVNm7TwutijtF+
   tCQ9/B16sejira/tkuMdQsr7nLgO0Z0X5V2mpDj6dbYqk7CzujOagW5n1
   0n7ljOnBVSs9TutaOoX5mhG8TDZ7E1M40hwAvPr0jpFOIkPLgZBlFsWF8
   SBrVl6Mq+covSzEdOkwfEsqk/u8AG9JdLXREhcdkIk5vmTOf99FkOB2Oh
   6Sltj+kv4TMqKfBtDakYj5b+VQN9PfUZPa2IUcwtffGXha3onDpeCTGZa
   8zZ5/JXUN64lt4A5J7VI616d56Xas1T7W70B9/AxWgqqA+Wt8uL5AarAJ
   A==;
X-CSE-ConnectionGUID: 8aac8Z3tRqyiswfGNPHUOg==
X-CSE-MsgGUID: 8Nz18aSNQK6kqikn96208g==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="224467710"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="224467710"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:16 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 8ED061002B85
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:15 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 43B30896E27
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 625EF829F3C;
	Wed,  7 Jan 2026 10:29:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 07/24] libio-socket-ssl-perl: upgrade 2.095 -> 2.096
Date: Wed,  7 Jan 2026 18:28:38 +0800
Message-ID: <20260107102855.228-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123205

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Allow stacking TLS layers with SSL_usebio
  This also allows LWP (after patches) to access https site through TLS
  enabled proxy

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-socket-ssl-perl_2.095.bb => libio-socket-ssl-perl_2.096.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.095.bb => libio-socket-ssl-perl_2.096.bb} (94%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.095.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.096.bb
similarity index 94%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.095.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.096.bb
index 114eeee313..85e9c274f7 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.095.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.096.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "7e764392b1b8bd44e654183c082b75be47800e98d7cd325f0e1b76c7d9a6b768"
+SRC_URI[sha256sum] = "576a37b6850a5972f320488c1b5408ff7c13699facfbe59089d5b41b4a71b9ac"
 
 S = "${UNPACKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.43.0


