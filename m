Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3C1D58B39
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:03 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28883.1773581757440479503
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Er5qNUKk;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1140; q=dns/txt;
  s=iport01; t=1773581758; x=1774791358;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=e7Au37Mq9CJWgTrMtyGWylfgYVKWBEqSd41rT81kz5Q=;
  b=Er5qNUKkl6J4JDPiUk90ldK3QItLaku0G+uAPQJWlPeb0JbLtYbqBefh
   JQ4bMLbVy62LdnwNUGk6fG3oJlw+z6isOqo7lw64SOR3B7V8xAWVepRrv
   oZOucToRnWmPi1RCQVPSl0v5DnPMo1mFlq8aDI4GXqJzivvDg5pmtE/ep
   0GcLzUx8JE0WBVrFPLcnnUT9l9EJyG4y2yzMBywFR1sVNezc7/7Ca27sq
   MOU2QtbbGmUmcG/dw8NY9vnaFHUyHy9GxtZ9VsTKKhDWIKKdugMYstWhM
   EYslqymPHjzTR4k0IMOR9gLOhdAEklMePLI1mk+Oikg8a/3xX5xF+g7jT
   w==;
X-CSE-ConnectionGUID: hRCLNVkvRj6lf3lcZ55Klw==
X-CSE-MsgGUID: nZLV5UPyQAK/6AE6ZVXcPg==
X-IPAS-Result: =?us-ascii?q?A0DcBQCAtLZp/4v/Ja1agjQQGoJED3FfQkmUKoIknhqBf?=
 =?us-ascii?q?w8BAQEPNxoEAQGFBwKNIgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4ThlyGWwIBAzIBGAE9IDErKxmDAgGCcwIBtUaCLIEBgygBt?=
 =?us-ascii?q?lsBCxQBgTiFPIgZdIR6JxsbgXKEB3aFEIV3BIIigQ6Bf5EtSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB416PYIzAT1RgUdoAaYcoQ4KKIN0jB6VOhozqmuZBqRZhGiBaDyBWXAVg?=
 =?us-ascii?q?yIJSRkPjl/KAiM1AjsBAQcCBw0DC4FokX0BAQ?=
IronPort-Data: A9a23:gMV61q8KPqjYiaJHAUNODrUDx3+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DdLXDiBa/6NNmPxLYx3YIi390ICu5fVz4BiGwRuqn1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/raea7xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsaTtJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dgJtb
 7+epF0R1jqxEyYFUrtJoJ6iGqE5auK60Ty1t5Zjc/PKbi6uCcAF+v1T2PI0MS+7gtgS9jx74
 I0lWZeYEW/FMkBQ8QgQe0EwLs1wAUFJ0L/9ClyZj8+N9U+Yd3W3x/5cURwVOZJNr46bAUkWn
 RAZACoGYhbGg6e9x6i2D7E2wM8iN8LseogYvxmMzxmAUq1gGs+FGfiXo4YDjV/chegWdRraT
 8YUZCBmcBTHSxZOIVwQTpk5mY9Eg1GgK2II+ALK9PJfD277yj5V7uXQCMvsU//NG+x4wHSml
 mn+8DGsav0dHJnFodafyVqrnuLJkCbxVY4eGbH9+vN0jVm7wm0IFAZQUkO2p/S8gEOyV99Tb
 UsO9UITQbMa7kenSJz5Gha/unPB5kRaUNtLGOp84waIokbJ3zuk6qE/ZmYpQLQbWAUeHFTGC
 nfhcwvVOAFS
IronPort-HdrOrdr: A9a23:zjQMhKuZ156HKqACi3IjJn957skDd9V00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5SXzLbLfD5HZQGQ2njeL+od
X-Talos-CUID: 9a23:Q1S4+mEUZEGSlSdcqmJnzmUwPP4mbEffknPeeEuzOzs0a7mKHAo=
X-Talos-MUID: 9a23:+fiBmQWtM+YKYD3q/DneoA8/Cf952o2NTx4kvMs0hfmPDSMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="707888790"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 3BE2E18000222
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:57 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 614A1CC8D6C; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 19/24] python3-natsort: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:36 -0700
Message-Id: <20260315133441.3034831-20-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125231

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-natsort to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb b/meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb
index 206e322fbd..74da4f6160 100644
--- a/meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb
@@ -9,3 +9,4 @@ SRC_URI[sha256sum] = "45312c4a0e5507593da193dedd04abb1469253b601ecaf63445ad80f0a
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = "python3-fastnumbers python3-icu"
+BBCLASSEXTEND += "native nativesdk"
-- 
2.35.6


