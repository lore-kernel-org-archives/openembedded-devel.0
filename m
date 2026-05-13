Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A32ECD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:09:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.107.1778645374726419002
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IxItZ/Zg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645375; x=1810181375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W8nK+nPEzQD58qcG/rDsmSHI4aEilixBAXhQxJIDnMM=;
  b=IxItZ/ZgzMSS1g14PrkCXQKjlsR4wjuJAz++dLhQgw4HH72QsScAdGnJ
   3K24tys2nJUY3rt5LhIGV7gEXJiM5rKu99uQ0279KDKBouujWzaNNbRGw
   fk/avz07mSdufOD7DuCesMAzDkUEdMadNXO49MM74TWUAtVb60HAd1Rvk
   4xkKxUOcG6FBSn43ut1SI0Vgg/Ei2UpfPi5WPmwtfSlfqOGRcRP7KuyLS
   xfaou73tuSvMs1Go3trswNfUxrOBFatiFpu7mWFde9kqHuboCG9vlDv0S
   CP7bqHYm7HegUi/lVVvIuibadn/edcKrA6kuDex5L+ljcCEl2WuGHabkp
   w==;
X-CSE-ConnectionGUID: 28Y3kHqNSmC1kuYEB7tqpw==
X-CSE-MsgGUID: 2iF/ih3RR6islS4blHLwqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240206321"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240206321"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:09:33 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id F221B1C1C71F
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:08:02 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id AC7A3C041D6
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:08:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5782E140008D;
	Wed, 13 May 2026 04:08:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 14/56] libio-socket-ssl-perl: upgrade 2.096 -> 2.098
Date: Wed, 13 May 2026 12:05:13 +0800
Message-ID: <20260513040555.377-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126902

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Another fix to issue #175 to make sure that an unblessed sockets gets
  blessed in place instead of using new_from_fd. Document that it will
  not retain original class with unblessed sockets on error, since this
  never worked anyway (there is no native unbless)
2.097 2026/01/06
- fix issue #175 with upgrading from plain socket (no object) by using
  correct fdopen mode +< instead of <+

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-socket-ssl-perl_2.096.bb => libio-socket-ssl-perl_2.098.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.096.bb => libio-socket-ssl-perl_2.098.bb} (94%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.096.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.098.bb
similarity index 94%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.096.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.098.bb
index 85e9c274f7..0561244634 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.098.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "576a37b6850a5972f320488c1b5408ff7c13699facfbe59089d5b41b4a71b9ac"
+SRC_URI[sha256sum] = "b38473be20256b1a06447dd6769ad162bfad6a258234ed2c7e2e1819c16c4df7"
 
 S = "${UNPACKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.43.0


