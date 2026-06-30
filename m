Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB2DC43638
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:29 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17238.1782811345446181279
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B7vHbNp2;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811345; x=1814347345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zzHrOjXSJRVSQ8Bfu3KDB477+2fpQfLCy2QTkTTYSHU=;
  b=B7vHbNp2K/Mad6JEiCfri0v3AvyKAehAoWHmCfIrS8BCi77K0x5Tpjfj
   Ocvnx3DI/21udTB0UcjQqwOyPopdBl7PLAKuwalJq747BUohirx+dA0Bz
   W1kmBYlWWkx+ZZ9hk3KgxpbGY5+NUxSomrlMzk8lg/hkrhZ5ILPAQtMKO
   +Qb87nC+suQNyAsRDowKHmJp+PBQVZ10/yZYrhyRUX3jCFvDxzW0X5Bqp
   3yb6E59uPGe95MK38tpdxYdzelrO0SkeOD/JCRfYsYpk5CZfYrZo3Yo1X
   /sW98inei+z7Lvcxclrzha+A70frlWGJuZPEV0wAKuG7/VWweHhDFWhEp
   Q==;
X-CSE-ConnectionGUID: JOGJrUx/SWS4ppAW1RC82w==
X-CSE-MsgGUID: IKM7u0UDQmyy9SHIjtVUBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="231987016"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="231987016"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:24 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D39371C1C738
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:23 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 897968320E9
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id A340F826FEE;
	Tue, 30 Jun 2026 09:22:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 09/37] libio-socket-ssl-perl: upgrade 2.098 -> 2.099
Date: Tue, 30 Jun 2026 17:21:37 +0800
Message-ID: <20260630092206.322-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127951

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Close socket by default on failed SSL handshake when created with new, but
  keep open when upgrading from existing socket with start_SSL. This restores
  old behavior which was accidentally broken.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-socket-ssl-perl_2.098.bb => libio-socket-ssl-perl_2.099.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.098.bb => libio-socket-ssl-perl_2.099.bb} (94%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.098.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.099.bb
similarity index 94%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.098.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.099.bb
index 0561244634..cb63eacbcb 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.098.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.099.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b38473be20256b1a06447dd6769ad162bfad6a258234ed2c7e2e1819c16c4df7"
+SRC_URI[sha256sum] = "a0be800ff4852b1567ee5500e772417ad7a360abff80c01b5b875c15d44be832"
 
 S = "${UNPACKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.43.0


