Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C879CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:41 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16783.1779875320302951136
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TwAQ824o;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875320; x=1811411320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=47+rXepxPXqce39hb0k72rgP/UwKO5zYEuVdJeUVA/w=;
  b=TwAQ824oUaNsQXFlv5tB7LL0kyk5S9x14D1wtu4yGa56Y88NBnPMRbKR
   i62r4QCXnw0OKUQK1baRZii4BWo4F6IsQ2LpXID2kMbwqRjmxHT1onMPo
   AScTgQEy5S7zcQR4sOWOYyJVg21ORFlNvTq+NqItbExPFVM6NSvTjLi7B
   2VCVlTY6sz90sJw3UhOiLhpx4crvC8lAcbJYwp0wtzYVMGmLQdEVZvWov
   oGg+oQ/vTTdlqBYlUAkJiMZUYRKMVPNw+Wd95wPuKr/KkUlAqqrOCzofW
   /LYmVBjbsp6C0v7YZMbmu+uUxefKNDT6uvPQWA9l3n9nly92OdG2bHQKd
   w==;
X-CSE-ConnectionGUID: iZ7/tGJfSAm1NOnvmU6Xag==
X-CSE-MsgGUID: HTcrPF+UShOuDhPOfRmnCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="219714698"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="219714698"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:38 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D0B8A1000147
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:38 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 85F181C2FBAF
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id A2E1B82A2C9;
	Wed, 27 May 2026 09:48:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 12/56] librole-tiny-perl: upgrade 2.002004 -> 2.002005
Date: Wed, 27 May 2026 17:47:21 +0800
Message-ID: <20260527094805.2039-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127219

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- split role initialization from setting pragmas to allow more flexibility
  for subclasses
- ensure consistent internal handling of Class::C3 vs mro
- reduced Exporter dependency to 0 (any version)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...role-tiny-perl_2.002004.bb => librole-tiny-perl_2.002005.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/librole/{librole-tiny-perl_2.002004.bb => librole-tiny-perl_2.002005.bb} (89%)

diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002005.bb
similarity index 89%
rename from meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
rename to meta-perl/recipes-perl/librole/librole-tiny-perl_2.002005.bb
index 69d84a6edf..10b063bf46 100644
--- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
+++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002005.bb
@@ -9,7 +9,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=197;endline=234;md5=26df7e7c20551fb1906e2286624f0b71"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d7bdee9e138a4f83aa52d0a981625644bda87ff16642dfa845dcb44d9a242b45"
+SRC_URI[sha256sum] = "4618ec524618c104dc28a8cc86af129a00cad282aea7f4c75060ba05d4c8f4d7"
 
 S = "${UNPACKDIR}/Role-Tiny-${PV}"
 
-- 
2.43.0


