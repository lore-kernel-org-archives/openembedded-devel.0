Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E34CCF9E0
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:22:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.4762.1761099764265877608
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hwBH0Ty6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099764; x=1792635764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Yj0I2MzwNsiZeOIsmLcP68Tm99j5Psgs9qO9xzKeK0=;
  b=hwBH0Ty6HM12QfATjVSzVjJZ5t9k9NTUSK72Oetzm1ggc2ei/MG4u9xH
   FA5Xwp+zA81Uubpn2Qm5jvsnk4h01h0KDDlCcRcG59QPjrTqd7W9VLLSY
   06mMNMFL17S2+G2VzqAXhcP9k+ehkv07+5McakHdy2RXfLhYo784hCOb4
   lS7gCbbEc2Mdd1E6sEKlmEu18HMkmNmRWut7AuIIka4LxvO5p8DQccv1h
   V4aDDDM+4rHzAZiCJec384QyCb/g0Jicth/N6RwdUv/k8HbOaOH5cZ3ly
   233r36U7j69qoEp9Jd785788Dx4xksp2newTpk9izUnEXa+cfhe87Dp8P
   g==;
X-CSE-ConnectionGUID: aNvKwjuIRuazQr8Tk5Z1pA==
X-CSE-MsgGUID: XmUhUxVpTt6t6+HxkdQiDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216736236"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="216736236"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:22:42 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 8F6DA1C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:42 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4C41410003AE
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id BBB3782C0E2;
	Wed, 22 Oct 2025 02:22:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 05/29] libhtml-parser-perl: upgrade 3.76 -> 3.83
Date: Wed, 22 Oct 2025 10:22:01 +0800
Message-ID: <20251022022227.226-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120852

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:  shifted from line 992 to line 996.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...html-parser-perl_3.76.bb => libhtml-parser-perl_3.83.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libhtml/{libhtml-parser-perl_3.76.bb => libhtml-parser-perl_3.83.bb} (78%)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.76.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.83.bb
similarity index 78%
rename from meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.76.bb
rename to meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.83.bb
index 6205f7db0d..2fb16a5672 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.76.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.83.bb
@@ -1,15 +1,15 @@
 DESCRIPTION = "This package contains the Parser.pm module with friends."
-HOMEPAGE = "https://metacpan.org/release/OALDERS/HTML-Parser-3.76"
+HOMEPAGE = "https://metacpan.org/release/OALDERS/HTML-Parser-3.83"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=992;endline=996;md5=cab05784294bb47dc319aeced156e96a"
+LIC_FILES_CHKSUM = "file://README;beginline=996;endline=1000;md5=cab05784294bb47dc319aeced156e96a"
 
 DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/HTML-Parser-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "64d9e2eb2b420f1492da01ec0e6976363245b4be9290f03f10b7d2cb63fa2f61"
+SRC_URI[sha256sum] = "7278ce9791256132b26a71a5719451844704bb9674b58302c3486df43584f8c0"
 
 S = "${UNPACKDIR}/HTML-Parser-${PV}"
 
-- 
2.43.0


