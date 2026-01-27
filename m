Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B772D2D8C5
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:43:58 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7122.1769507033379415289
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jXrCvruC;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507037; x=1801043037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h8sUkedgk8/J4asKl6MC3VqLAohhCnAD16TR4GFZ+R0=;
  b=jXrCvruC21tIw++eVZjWCtzSSB+xtQLMvxcJtrHhBm7sKuDyn9ZOpx/3
   xG8rpSEeuGrPPGsSuVIxpZ2igXIHFs9NMS8WCm2FSuXUt/3sOmeZY4QO0
   zNZT31rDn4VAeTL01sqT3eQItWzX69kEhlf93xR6VrNRTIjxwB+6qpArW
   CXpGZnBKlA9STjnQzV4XNSPRVVgDHWQkM++3jWEWlshHnemYHkfizoCLy
   tAf+tONuTYCEQEY9LB1BPir/Vz7WnYvylHXKoCo5rRrwiE2dCgx3soJ15
   qV6FXRIaxdRjrrCuwah8d8wTom97Jt2eBasOxhwW0qZ4O5oQtodqHqUFs
   A==;
X-CSE-ConnectionGUID: GrwCC8nETp2NU+a2bIfrMw==
X-CSE-MsgGUID: TBVsT7GaTAO8JvSZ+LW9cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="206239792"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="206239792"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:43:56 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 571AF4DD0
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:56 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0631A1C0011D
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 82DE420000EC;
	Tue, 27 Jan 2026 09:43:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/25] gperftools: upgrade 2.16 -> 2.18
Date: Tue, 27 Jan 2026 17:43:19 +0800
Message-ID: <20260127094339.1081-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123916

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gperftools/{gperftools_2.16.bb => gperftools_2.18.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/gperftools/{gperftools_2.16.bb => gperftools_2.18.bb} (96%)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.16.bb b/meta-oe/recipes-support/gperftools/gperftools_2.18.bb
similarity index 96%
rename from meta-oe/recipes-support/gperftools/gperftools_2.16.bb
rename to meta-oe/recipes-support/gperftools/gperftools_2.18.bb
index c0fe586f6d..bc84ba54c6 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.16.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.18.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRCREV = "e1014dead2029b341d06027b4f2b5562d799d5b1"
-SRC_URI = "git://github.com/gperftools/gperftools;branch=master;protocol=https"
+SRCREV = "6ed73507dd3970a123e267a50b3ee73392e3b053"
+SRC_URI = "git://github.com/gperftools/gperftools;branch=master;protocol=https;tag=gperftools-${PV}"
 
 SRC_URI:append:libc-musl = " \
         file://ppc-musl.patch \
-- 
2.43.0


