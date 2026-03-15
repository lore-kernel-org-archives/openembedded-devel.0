Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25CFD58B2C
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:01 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28885.1773581757740886233
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=D/JlyztE;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1082; q=dns/txt;
  s=iport01; t=1773581759; x=1774791359;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pbUpOUgouUtH6V42PeNyT1wUMhjDmmlvwNc2rt8G8OY=;
  b=D/JlyztEHl1JVPPB3XgZV4DrveKbvLe9YisqJdLEI2FBNF8q1xcL6THn
   7OI+FJUjaLOOugAl6MghPxIptRR9fytsQaJO8Qz64Odv9DvcmUVmsu8KW
   iE+1sEwOyflaPXri/DhXA/yUUxKhMhBwB+W30MMxPscog8SLtgyrh87wD
   N07CfvB6jMocyvJHtuEgYemp4LMARLjVhCCdT8m9P4vFx2foTUb/b9zuf
   m/TiVbNviADM6ahPtT/+HtF786Ifr0RzuaB14lzok7sVTpaGwmCXBI9gQ
   B6zU1Wa6WJ6eNofB5qDhbgAyt2AxETs9pIUtYH4XkP/eatuEclVdXc5tM
   g==;
X-CSE-ConnectionGUID: W9Xcm5mCTOyonwZAZJcDOQ==
X-CSE-MsgGUID: 1/kmvSxdQXONt+zr2mEbIQ==
X-IPAS-Result: =?us-ascii?q?A0DaBQAatbZp/5L/Ja1aglmCSA9xX0JJlCqCJJ4agX8PA?=
 =?us-ascii?q?QEBDzcaBAEBhQcCjSICJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThlyGWwIBAzIBGAE9ICYLKysZgwIBgnMCARGxbIIsgQGDKAHce?=
 =?us-ascii?q?QELFAGBOIU8iBl0hHonGxuBcoQHdoUQhXcEgiKBDoF/kS1IgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XgQsbBwWFGg+IcnRtgRODLQMLGA1IESw3FBsEP?=
 =?us-ascii?q?m4HjXo9gjMBPVGBR2gBphyhDgoog3SMHpU6GjOqa5kGpFmEaIFoPIFZcBWDI?=
 =?us-ascii?q?glJGQ+OX8x9IzUCOwEBBwIHDQMLgWiRfQEB?=
IronPort-Data: A9a23:FqUmJauO60CMhFkyniW7D+iGJufnVAZfMUV32f8akzHdYApBsoF/q
 tZmKWuCPfqDYDbyLtglOtzl9xkPupXdx4RqHFZp/io1FCsSgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYzdJ5xYuajhKs/na9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwxbdHCmQT8
 NckDyEKaA+xrtCUy56cc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/SM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtJYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoLaFZ8KzhrG+
 goq+UygRRIfKuePxQO11VSwxf3VxybWUqMrQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZOZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvpUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:adQeV62cjdwvQnRNZHIelAqjBLMkLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddm2wUMqyXMbC85vyKhzWFLw==
X-Talos-CUID: =?us-ascii?q?9a23=3Apc9gx2myx8sUkIlc16LQtNSPpazXOUKM/HzVfkq?=
 =?us-ascii?q?TNUF4T7uKe3ai2qhItPM7zg=3D=3D?=
X-Talos-MUID: 9a23:T92aRAiyaI7tUCWKAXsm0sMpbYBr5rqVGEw0obIgp4qWL3Z1Fj28tWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="688278464"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id DF3721800023F
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 4C956CC8D5C; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 14/24] python3-fastnumbers: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:31 -0700
Message-Id: <20260315133441.3034831-15-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125241

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-fastnumbers to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb
index 3a92fe0ab4..6c6a46a5b3 100644
--- a/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb
@@ -17,3 +17,4 @@ RDEPENDS:${PN}-ptest += "\
 						 python3-numpy \
 						 python3-typing-extensions \
 						 "
+BBCLASSEXTEND += "native nativesdk"
-- 
2.35.6


