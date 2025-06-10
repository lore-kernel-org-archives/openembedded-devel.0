Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42E6C71132
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.77951.1749526426054611411
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dhww75l2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526429; x=1781062429;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gnOLkRQjhacJCZXhmbUDqHjSeYV//UWQfs2PMmDen6E=;
  b=Dhww75l2oYqtjDeV589GfPdu3C7qAx47VUlVh8BLhiQjyUVTzTNlH+q0
   g8UPizEjvAB0KNeN2+nOm2RdhmxN7xdv+7s1QSIcqfU/jU9c0fg50uz1Y
   i+lgRvL6l3akPUy6qpAKYUi+XJf9uSj4cAz81QvTy8+DuCpIQN2ese2oJ
   klxV1m4ZJ0E8/ApoVBPLDBax2u8oF7KTEbNv/LgTNiXGbPAkEuF0nZshM
   uDcey34GVksyUg9UyRdz2IsGZquSF7yfhofMgkIKLAWgIEt3nXgGGrDNm
   iTdF4/aKNwQCn6zGTDcWfEGZIs3f/3M8ZWj4cBwQqdC9ApFaHSA06no3E
   g==;
X-CSE-ConnectionGUID: 51VHyxh8RhaY7hphe/mZqw==
X-CSE-MsgGUID: asiqQYYMRVOW0urzrI1sEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202261476"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202261476"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:43 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 302A93B71D
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C5ECBD7624
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:39 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B88F1A009A;
	Tue, 10 Jun 2025 11:33:39 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 15/64] libio-socket-ssl-perl: upgrade 2.089 -> 2.090
Date: Tue, 10 Jun 2025 11:32:41 +0800
Message-ID: <20250610033330.924-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117820

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix OCSP live test after Let's Encrypt has disabled OCSP support
- public_suffix now preserves trailing dot

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-socket-ssl-perl_2.089.bb => libio-socket-ssl-perl_2.090.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.089.bb => libio-socket-ssl-perl_2.090.bb} (94%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.089.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb
similarity index 94%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.089.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb
index 689c46b900..ce3097cb63 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.089.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f683112c1642967e9149f51ad553eccd017833b2f22eb23a9055609d2e3a14d1"
+SRC_URI[sha256sum] = "fdda17888df9f88251b62856f17fcac8f144858c72d7e01d1c4b437d23383d97"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.43.0


