Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EAFFD461F
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:00 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92728.1772187237793369370
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DepIAko6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187238; x=1803723238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SWUA6d9sm6sB0UZmdIrTEr4jfo24SNeMZGXVH+/2FHU=;
  b=DepIAko6Eu1VyDzybOne45YQPCbpICx9QrfDYDlEJsXVlde7mNpGGU3l
   He+4m3br+NSjjkLVJ65YSCuwaoeP6jq6BBst6PDSpGgAMEZjiUFl/k0Nr
   QQTRI2yzyHpU7r6trdKDdwkaFWxno/uTsZXQRmxkRn/Cc7uijv6XVX7ka
   b9im+UTp0fz1YjENyxpFSCOJuvc4FYmSBfvuI8IbW1KQOkkml2KYkNFLz
   Sl2KMAZlpcmGseaWEf2HKqoOvmPZiod8XcDlAD9aGhISt0b4DXZIrI85R
   XpIJLYlNPT9M0cR4zHem8+bHJn2sIqBIBLRcbeDdiNAwFTktoBSomqxVm
   g==;
X-CSE-ConnectionGUID: y+XjdQtfTyacWoq7cCNy+A==
X-CSE-MsgGUID: ffkW56mWRLO6dkQiPVltYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231299919"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231299919"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id D5F381C1C706
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:58 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 8F556C06BF5
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id AA9BD180059F;
	Fri, 27 Feb 2026 10:13:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/52] python3-flask: upgrade 3.1.2 -> 3.1.3
Date: Fri, 27 Feb 2026 18:12:45 +0800
Message-ID: <20260227101327.1432-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124710

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- The session is marked as accessed for operations that only access the keys
  but not the values, such as in and len.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-flask_3.1.2.bb => python3-flask_3.1.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_3.1.2.bb => python3-flask_3.1.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.1.2.bb b/meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-flask_3.1.2.bb
rename to meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
index 1b289c7227..1a85ee63c4 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pallets/flask"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "bf656c15c80190ed628ad08cdfd3aaa35beb087855e2f494910aa3774cc4fd87"
+SRC_URI[sha256sum] = "0ef0e52b8a9cd932855379197dd8f94047b359ca0a78695144304cb45f87c9eb"
 
 CVE_PRODUCT = "flask"
 
-- 
2.43.0


