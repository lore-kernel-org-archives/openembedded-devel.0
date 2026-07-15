Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CACC4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:32 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3447.1784112020077028792
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iNy63njU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112022; x=1815648022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M3WEdAUOmcoLBl0MZAL01ylHxQh2GjzY/W+GR4HOJm0=;
  b=iNy63njUZqJw0Vfu4C6gecVMEjdRuneQzTJ6fjeuwqCpbkon60U/AvSK
   U787auymossD4/L2cXF6iLkAJoojw7FsmiJTdZ7E9dT2Oa5YbKxL48a0I
   j5pZDvNJuLnYf7GZ6ftK9KpBvq0I7H/0ze68FcC0jFrXDEkjngkYBilZN
   qqxGXuaDLB2OE2qwVoBFK6POhrPcmRnDDEBcAw0lfNYvwQ3MZghZlbDZM
   7DMwmlSAE0c6Qy+ZmX9Y2VoecIeDT8XfayhTatQmso++n9e5deZUKFGX9
   3gKhPIAxhqMThDzQSD6h4mEyw8gyHB+7O7nXQnhxfRWjF6+Yo6k3bdqEK
   w==;
X-CSE-ConnectionGUID: lkgT8kX6R4+8tH/Xo2wqMA==
X-CSE-MsgGUID: ixRLzrFJT5eU3PP9JLshSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247513125"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247513125"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:22 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B47C72B88
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:21 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5CDF7C0343E
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 60E3C1801122;
	Wed, 15 Jul 2026 10:40:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/44] python3-tox: upgrade 4.56.1 -> 4.56.4
Date: Wed, 15 Jul 2026 18:38:59 +0800
Message-ID: <20260715103914.2120-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128202

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.56.1.bb => python3-tox_4.56.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.56.1.bb => python3-tox_4.56.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.56.1.bb b/meta-python/recipes-devtools/python/python3-tox_4.56.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.56.1.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.56.4.bb
index e3f3d605fa..f310db3d28 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.56.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.56.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "db1c2610802553189cf40de251661d066a635ee0ed9bf2a60093b5f1a7f36ef8"
+SRC_URI[sha256sum] = "d49e371119ebfafb15054ad7ccff3d03027ccb65195fae3ac656b431b5524055"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


