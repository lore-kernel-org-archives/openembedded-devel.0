Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB57EFCBB5
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:05 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28711.1773581757548694864
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=E6LCRDA0;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1056; q=dns/txt;
  s=iport01; t=1773581758; x=1774791358;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=uzcSrP1cu2SZPxYZ0nwgvOGHxRb8p19jzMuSd6N/vAM=;
  b=E6LCRDA0aWAp69kE7tbIrfhQUL1HCxFnxka32xlVZUDCU7dxRoLqAuD1
   ai8GbKDsDqlyFNgXZb9P4/YIFeWl4MsvV3/mQFrkEOVG+R5vXusWG58S3
   6Fc+PaxWGGkfvjvfRmlZe4RMNuMMFMhuNt+ZGz6WZbXs4J1WqrdyWy202
   oJL/TkHbHkyZ+hZkp0UnqMSzRNqBrID26N1hBgDR7rlQk6dVjE066Vjtd
   d2FbErRqOw0VAZLFVmMFRaPnd6lGc3m2FSEnMSnIJHNZuvpJu2qd2CFNJ
   ji9kFDd2V+uJPJITo4Iwfwk6ArO1oC1gtauj//npuSej5cBzPX7FyfqVZ
   w==;
X-CSE-ConnectionGUID: Csd74pnPTQSxuPV40XjRKg==
X-CSE-MsgGUID: UrPwYC3lQSeLh2RUEr4luw==
X-IPAS-Result: =?us-ascii?q?A0CkBwAatbZp/47/Ja1aglmCSA9xX0JJlCqCJJ4agX8PA?=
 =?us-ascii?q?QEBDzcaBAEBhQcCjSICJjYHDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThlyGWwIBAzIBViAmCysrGYMCAYJzAgGxfYIsgQHgIgELFAGBO?=
 =?us-ascii?q?IU8iBl0hHonGxuBcoQHdoUQhXcEgiKBDoF/kS1IgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQsbBwWFGg+IcnRtgRODLQMLGA1IESw3FBsEPm4HjXo9g?=
 =?us-ascii?q?jMBPVGBR2gBphyhDgoog3SMHpU6GjOqa5kGpFmEaIFvDCmBWXAVgyIJSRkPj?=
 =?us-ascii?q?l/MfSM1PQEBBwIHDQMLgWiRfQEB?=
IronPort-Data: A9a23:DYNH1qsO7qGvcxnjBtB/he/j9ufnVAZfMUV32f8akzHdYApBsoF/q
 tZmKWyFOP6MNzejfYx/aoXko0sFvMCByoQwQAo/qi9hESwWgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYzdJ5xYuajhKs/na9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw0f17Xj1W8
 8QkEQsdcyi927qGwoiYRbw57igjBJGD0II3oHpsy3TdSP0hW52GG/iM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtNYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoLbHZUIwx7J/
 Aoq+UzEGCkFBffEzQO+/1as3NXysDmnXJ8NQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:sLBw7qsQZ949XXm0v9IR3EKS7skDd9V00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5SXzLbLfD5HZQGQ2njeL+od
X-Talos-CUID: 9a23:CpaCzWFyQhLwsBk1qmJM70JLRtgjSkHk92fNG3HkUVZrcp6aHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3Aj2wYBA75FtE84sLdjBKTf/YUxoxV+ZyxOWtWlaw?=
 =?us-ascii?q?9tu2EbxZNFi3BiCmoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="690855092"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 3CA4718000372
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:57 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 5CCAACC8D6B; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 18/24] python3-jsonpatch: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:35 -0700
Message-Id: <20260315133441.3034831-19-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125235

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-jsonpatch to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
index 6a1715c6df..5f0b3ab60b 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
@@ -13,3 +13,4 @@ RDEPENDS:${PN} += " \
     python3-netclient \
     python3-stringold \
 "
+BBCLASSEXTEND += "native nativesdk"
-- 
2.35.6


