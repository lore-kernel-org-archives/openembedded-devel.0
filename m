Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB21ACCF9F1
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:16:12 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.24197.1761696965168458171
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lt8b8lCt;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696966; x=1793232966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M4uwSmog6WxDLCUzo75+rxJlBIFWkL/m8o9aSTfNEBI=;
  b=lt8b8lCta6VSIxRX+rpwm0DbdXo5tATBdUM5iACNxpTHi5p0bOZVK4IQ
   JBwP99kT1rD2O7q770nuA4Ag5TBua2C7fhp7bUtSYQdJUBmT2uk1TmpDl
   sW5HMyPWPte+H8sLRCrikm03IDlVNcAQyC20HcbGLe6fttvo/DJhqaSMt
   GJGYi/236oBdhOsIfaoyBBZ5oLGLNf7Wgkhr3TFa/DvxHUsLM22kAtpzQ
   bwthgwFR3WGi7XVY7xWIkgBvoPs8ZUUdPq04szyKW6eWQi/p9j9rbC/4O
   PODYgua12B6wgThHHrT5rVTLK+prveedczIKKciitCkDBfRhvvlQk6FxB
   w==;
X-CSE-ConnectionGUID: Z8G4nbtjQPKyStUHfuGhDg==
X-CSE-MsgGUID: uuG1+As3T/aCK3FXh7rHnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217443325"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="217443325"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:16:04 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 4CDCA8203C9
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:03 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 073EA8D65CA
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4754682C0F2;
	Wed, 29 Oct 2025 00:15:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/32] python3-psycopg: upgrade 3.2.11 -> 3.2.12
Date: Wed, 29 Oct 2025 08:14:57 +0800
Message-ID: <20251029001505.528-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121130

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Allow copy to pass different types per column, as long as the database can convert them.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-psycopg_3.2.11.bb => python3-psycopg_3.2.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.11.bb => python3-psycopg_3.2.12.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.11.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.12.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.2.11.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.2.12.bb
index b10c3caab9..4133a4b5b0 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.11.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.12.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "398bb484ed44361e041c8f804ed7af3d2fcefbffdace1d905b7446c319321706"
+SRC_URI[sha256sum] = "85c08d6f6e2a897b16280e0ff6406bef29b1327c045db06d21f364d7cd5da90b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


