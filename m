Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB84CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:10 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.4720.1755766809350795166
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=deuQ/UT/;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766809; x=1787302809;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XhkMlIGu+kzEoQBjLVMMDiM+Eqz9qbAMwdSVnlauSAY=;
  b=deuQ/UT/b6VE+3T2uX463quxBYcxz3VpxRmVfnPIRpHS6qylSH92IwZf
   xmrN+f+2c/P/beMyqZUr70zAPJEWwEPehLg2sHWekEcrx4aRrt4LXcZ9I
   +VM7CTbOCMcp1M1N/TK7VGF5cOtf8tkUxdzrgPoDl01FNV40osv0WgfUm
   7BM2Bi0XmjTE6a6VvhXKwZdwS2bDuR3j3SUy4yOqhXpAgEJzpv7t1eorR
   HGLCCI1x+LgnUeL1x1puZfe83yZhYvEzs3RCqNwiqvD/XtEmGHI+F+eFU
   lUlvtyKQczeTU6Ce9824YEW+EY9v+cCqXAzQXdQyzBJ7ITzJBtI7u/qb6
   A==;
X-CSE-ConnectionGUID: 0CbufU3TQdqKYYnOGQCmtQ==
X-CSE-MsgGUID: rwhmQPnPQd6yNsJuNCZQxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="189091937"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="189091937"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:07 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 8C3051002BAA
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:07 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 3D769C0089E
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:07 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id ECAC72004FAB
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 514CA1A0069;
	Thu, 21 Aug 2025 17:00:01 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 01/21] python3-freezegun: upgrade 1.5.4 -> 1.5.5
Date: Thu, 21 Aug 2025 16:59:34 +0800
Message-ID: <20250821085954.2056-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119051

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Allow parametrized arguments called 'func'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-freezegun_1.5.4.bb => python3-freezegun_1.5.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-freezegun_1.5.4.bb => python3-freezegun_1.5.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-freezegun_1.5.4.bb b/meta-python/recipes-devtools/python/python3-freezegun_1.5.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-freezegun_1.5.4.bb
rename to meta-python/recipes-devtools/python/python3-freezegun_1.5.5.bb
index a6e31228c3..878d438070 100644
--- a/meta-python/recipes-devtools/python/python3-freezegun_1.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-freezegun_1.5.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/spulec/freezegun"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=acf1d209bb6eddae4cbe6ffd6a0144fe"
 
-SRC_URI[sha256sum] = "798b9372fdd4d907f33e8b6a58bc64e682d9ffa8d494ce60f780197ee81faed1"
+SRC_URI[sha256sum] = "ac7742a6cc6c25a2c35e9292dfd554b897b517d2dec26891a2e8debf205cb94a"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


