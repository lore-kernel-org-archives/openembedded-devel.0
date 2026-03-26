Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBD810A1E84
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:56:52 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46399.1774526202134125715
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K4d2uTtp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526203; x=1806062203;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oZhcS1BScxrdWrQGTT4fz7V0cKg9nBqOyuJ32REIxCI=;
  b=K4d2uTtpLNX7wQntIEkNT1YL1lRvSiagCZAH7ODEho0ZhVrVHll+uhQ3
   wlpQMg1i5+tpEJP0k+1i3cATZ0XTC7xIS9xo2DdVGsyskd1DZNOmxXjfW
   vvb5LjW4ElC83IlbWbq2EMYzQxJCch3m2hovqadSBldlMl8gVKCfvfwpc
   lhvVDLjgWDxDqZ4EtvVNSGHUCcSLSAADCDzI6JDUUFpVi0LJEml3YRpsG
   dTV0NUjOIVhVI+qFpHu+gIV8L3ybeXAAaHPELn7zSp2dFyMt+L6MZjt+F
   8dkVGQ+pGZuu2vnp2Y3QvtKQjLvkOkFFjx87ye9HOB2MD5flndRp6B2We
   w==;
X-CSE-ConnectionGUID: 6RwLVWcrTIeVB3ccTg4ydg==
X-CSE-MsgGUID: oTI3dzSTTs6ES68jd/i4DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234669315"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234669315"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:56:41 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5C7E242A313
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:40 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 06EA71C00292
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 7B8A71807148;
	Thu, 26 Mar 2026 11:56:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/63] b4: upgrade 0.14.3 -> 0.15.0
Date: Thu, 26 Mar 2026 19:55:31 +0800
Message-ID: <20260326115634.1199-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125656

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/b4/{b4_0.14.3.bb => b4_0.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/b4/{b4_0.14.3.bb => b4_0.15.0.bb} (79%)

diff --git a/meta-oe/recipes-devtools/b4/b4_0.14.3.bb b/meta-oe/recipes-devtools/b4/b4_0.15.0.bb
similarity index 79%
rename from meta-oe/recipes-devtools/b4/b4_0.14.3.bb
rename to meta-oe/recipes-devtools/b4/b4_0.15.0.bb
index a922f999e2..4da95e12eb 100644
--- a/meta-oe/recipes-devtools/b4/b4_0.14.3.bb
+++ b/meta-oe/recipes-devtools/b4/b4_0.15.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit pypi python_pep517 python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "31a4927b8dfbb5c97edfc9569cda3b6737bbfd8430881e8cc48a0b088ced6147"
+SRC_URI[sha256sum] = "4cfd99a27af9cabe319fe21ba20af695f68c65904c63731c4fc5a30ea38da7c8"
 
 RDEPENDS:${PN} += " \
     python3-mailbox \
-- 
2.43.0


