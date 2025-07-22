Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1A6C83F26
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:20 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.4255.1753153990390718791
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sQMmBQM8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153991; x=1784689991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aYzFXcS0Ch/qxNIf391HKhWTsL9fiKDc8/CkAtUWnAQ=;
  b=sQMmBQM898wmvHZGKN4RHQeKsfag3ONOQcFaSnR5JBm7wtv/4/GmSapr
   7aFXk2Xd5rn1pEIAK65zvmHh69UIgM/UgW6tkytm0+mCouU/bVn/SVNfh
   Syq6rm4xS06mlzW0VfXHpl3IBiEe482b8RRn3hmDtL/8P5dB9BzE64fIM
   IANfNNVKfiOCo9rWb0wUYbm3wT4GvCJMVbf6JAd9PCyjdeODfACFMe8Ji
   6ZkT2hnceWiAfWC3fwzpQ6B8qNJE6O+H4xEZmbtxKNHG5+Tt6IOEHaVsR
   sZE1P4PcS52LgXY+t4NIn51bSybfLZc4RvMll28wb1h2R9fN6Opxv6+Ej
   Q==;
X-CSE-ConnectionGUID: meOkMiIlRrSU+BmbWt/MGA==
X-CSE-MsgGUID: ZwZ6qGwCQLuziYqminIfAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="206935415"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="206935415"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:02 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id CC68D8203C8
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:01 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4A12114003F3
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:01 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7194D1A0073;
	Tue, 22 Jul 2025 11:12:58 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-perl] [PATCH 02/21] libio-socket-ssl-perl: upgrade 2.090 -> 2.095
Date: Tue, 22 Jul 2025 11:12:10 +0800
Message-ID: <20250722031245.884-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118680

Changelog:
===========
- regression: make sysread set buffer to empty string again when returning
  EOf. Fixes #171
- fixed memory leak introduced in 2.092
- Another rework for one-sided SSL shutdown, to a) implement a useful and secure
  behavior and b) without affecting existing applications. 2.092 had still
  unwanted side effects
- rework implementation and behavior for one-sided SSL shutdown. Implementation
  in 2.091 lead to some problems with Net::FTP and others.
- fix behavior on one-sided SSL shutdown. If the application continued
  to read after half-closing the SSL connection this could result in reading
  encrypted data (i.e. close notify, SSL session tickets ...).
  See documentation of stop_SSL for detailed description of handling
  half-closed SSL connections.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...-socket-ssl-perl_2.090.bb => libio-socket-ssl-perl_2.095.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.090.bb => libio-socket-ssl-perl_2.095.bb} (94%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.095.bb
similarity index 94%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.095.bb
index 58d099043d..114eeee313 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.095.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "fdda17888df9f88251b62856f17fcac8f144858c72d7e01d1c4b437d23383d97"
+SRC_URI[sha256sum] = "7e764392b1b8bd44e654183c082b75be47800e98d7cd325f0e1b76c7d9a6b768"
 
 S = "${UNPACKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.43.0


