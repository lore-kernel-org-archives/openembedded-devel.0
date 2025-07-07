Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8CCC83F18
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.55567.1751879233188693965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o3/7r2jD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879241; x=1783415241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S6PCfsumr1qkbb5LB4OwjDxIHr5GscDWmjcxk63M2d0=;
  b=o3/7r2jDFxc55hx7kSTdRXVGP4JGYm5QxWG71YUDMDCvuuu++AFbJoBi
   3P2RnR0IuqQlWCE9WvlaQnpVWdBDZNOnKkUa5CUMgy4dodtC5AXEINKCx
   X5XKwM28OlxpcPBpXF2nVqCkV8HVcWp0ikA2O7XxeHM3g+qmGSNv/dWpG
   p4EHVfBENZ8qWmMYDJuirpqwu265eevZNRlt6B1X1MR4lET8TZNCeQKjq
   38o001SEqdk9a2TD+LD8JOXhOfzpGGMaue7AOGDsIFSxWbuTkrfpg1GQq
   AMTkvX+RR7jEUKP+MaOzRKA5AB/3ZpBXC1nSstCvNFC5V+qUSWhIRxru7
   g==;
X-CSE-ConnectionGUID: 13drClKrRPGj5fimPI/pXw==
X-CSE-MsgGUID: GEot8KdnTmS8rbWyE/7qjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="204763774"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="204763774"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:20 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 7DFB11C0018C
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:19 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id F143A1800BCE
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:18 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 50724D4F46
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:18 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E4C5C1A000B;
	Mon,  7 Jul 2025 17:07:17 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/35] python3-pystemd: upgrade 0.13.2 -> 0.13.4
Date: Mon,  7 Jul 2025 17:06:49 +0800
Message-ID: <20250707090656.1216-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118272

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fix deprecation warning: LICENSE is autodetected
- fixing DbusRemote
- enable user_mode in futures
- add apt-get update to release

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pystemd_0.13.2.bb => python3-pystemd_0.13.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pystemd_0.13.2.bb => python3-pystemd_0.13.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.13.2.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.13.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pystemd_0.13.2.bb
rename to meta-python/recipes-devtools/python/python3-pystemd_0.13.4.bb
index e7f35f1f08..4868bc51e6 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.13.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for interacting with systemd over DBus"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "4dcfa4b13a55685c49d3d17c10631eca18c33770f66316f8ef2337b8951cc144"
+SRC_URI[sha256sum] = "f06d4e5b21881a7c9100492e60ccc2f4b64e50b4d6b7773c94013d2c6f1a00db"
 
 DEPENDS = "systemd"
 RDEPENDS:${PN} += "\
-- 
2.43.0


