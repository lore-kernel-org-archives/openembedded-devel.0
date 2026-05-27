Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B846CCD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:41 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16927.1779875312736448436
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Bp7fJuyw;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875314; x=1811411314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jFGboQVRuM1fE3w9hu1NshnlU+3aFfIglJyh9jPrmGk=;
  b=Bp7fJuywkg9ADPnllwoDIuas7C3pqukGRWaPNwHnAyQVkl6yeKmEyWYD
   8I9k0ZK82LQNRsD1baN8ixMomZV74YhUryY8ei+SMXH33VKxsmV9aiGg8
   pqnstI/cBuZZ1NX+XCN+KiyxLnEM6DNi1PhboRBWh0Xyf/y9BFE6wWPET
   yXC/Wdo+hd3ci+mLJdzcn22dBHJRL314+knND5y1WfxOS1LlG4CU/YMtM
   zaiZyySM5MC8b12dn6uNuYwE7mE4e2rJEWZiFtMk0EgkO3cX6o5yXQ2K8
   Sd2vygXEB9BVJ6S3n8UVprWp+HgtUHrlyF9XDemyXuf9FfrPu6TOEeQP6
   g==;
X-CSE-ConnectionGUID: Rpek+8rjRXGTu3PT+spzXQ==
X-CSE-MsgGUID: KrW+OfGNSrq2BqQrtiqMUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="245264182"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="245264182"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:34 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 13C6E1000143
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:34 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B6B561C135FF
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id D410182A2C9;
	Wed, 27 May 2026 09:48:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 09/56] libhtml-parser-perl: upgrade 3.83 -> 3.85
Date: Wed, 27 May 2026 17:47:18 +0800
Message-ID: <20260527094805.2039-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127216

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2000

Changelog:
============
- Replace deprecated uvuni_to_utf8() with uvchr_to_utf8()
- Fix heap-use-after-free in _decode_entities (CVE-2026-8829)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ibhtml-parser-perl_3.83.bb => libhtml-parser-perl_3.85.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libhtml/{libhtml-parser-perl_3.83.bb => libhtml-parser-perl_3.85.bb} (89%)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.83.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb
similarity index 89%
rename from meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.83.bb
rename to meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb
index 2fb16a5672..88f95c2e4f 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.83.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb
@@ -3,13 +3,13 @@ HOMEPAGE = "https://metacpan.org/release/OALDERS/HTML-Parser-3.83"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=996;endline=1000;md5=cab05784294bb47dc319aeced156e96a"
+LIC_FILES_CHKSUM = "file://README;beginline=996;endline=1000;md5=68b329da9893e34099c7d8ad5cb9c940"
 
 DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/HTML-Parser-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "7278ce9791256132b26a71a5719451844704bb9674b58302c3486df43584f8c0"
+SRC_URI[sha256sum] = "fd42ba6abe07241cf0ad57be246c3980065f683e4465e59b46af9efebc8e0c71"
 
 S = "${UNPACKDIR}/HTML-Parser-${PV}"
 
-- 
2.43.0


