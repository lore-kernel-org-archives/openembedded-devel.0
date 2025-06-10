Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07389C7115E
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.77956.1749526432094742799
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ja50xR8B;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526432; x=1781062432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qKCEd+etKIgLUyHOC37jtzcRWWMAwqDTzKtKhxq+qo0=;
  b=Ja50xR8B/7pMMikpDQ8vz3RqE+N6OmFSz47EuW93sC4DCIILA1aXfJio
   KxqK5rY1FqtjZIL4OykN8fOH+5bFuaNJxllcax1nEI0H6YlEkV7qRb/JM
   1lOKM2v0cfIsBycYcfcwEfNdB39QLXRPrJT8ZWl0AcAjbozmx2l+F2IcR
   hU1NT2AdnOHQ/+pPW9+F6YkJHG4Vy40wO3gc8XDEKez/3+z5UE+6cnBAd
   HiCVlYL+If+P4fEyZ4222QpDHWwJj78ltl1Pfm2b61KkQndy0JEZ55axv
   a1Qm3pJj2igWgeKvnWLnO7nYudgjXhoAmxSyI0uSwihmju9vYtWU09PtM
   A==;
X-CSE-ConnectionGUID: xtm4DwxxTH6LFLR/1nPNPg==
X-CSE-MsgGUID: ZMQ9VHW1Tem61oyvXHkwSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="190662475"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="190662475"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:49 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CCC5FC68FB
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 78E58D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:47 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F329C1A009B;
	Tue, 10 Jun 2025 11:33:46 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/64] python3-grpcio-reflection: upgrade 1.72.0 -> 1.72.1
Date: Tue, 10 Jun 2025 11:33:02 +0800
Message-ID: <20250610033330.924-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117829

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reflection_1.72.0.bb => python3-grpcio-reflection_1.72.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.72.0.bb => python3-grpcio-reflection_1.72.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.72.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.72.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.72.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.72.1.bb
index 77c0ec4bbe..a922dcd873 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.72.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.72.1.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_reflection"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "75c4bc9accf8458c635ebfd408317bfb61368424e1219642a20332adf5570dff"
+SRC_URI[sha256sum] = "f04f0c8c21937162c3a7d2b9532a42e568fd4096327bec8eb1cff8e7d8146150"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


