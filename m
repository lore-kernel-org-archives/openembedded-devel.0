Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2D7CCF9E0
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:23:09 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.4831.1761099786449009207
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qNQ5suw7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099786; x=1792635786;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9TQJYEXAzpsQloI9P6etPUU2eHQ5L/hHsJqE02D+W8Q=;
  b=qNQ5suw7P5fZ5XywgNNT71JNfzY/MvQ8Y/fgm54dgfx9keq7Zh99CB8G
   +cGI1rRrJkIj7KvbcllEMncr3angGaGD1YQCV1dBAvr14JJD4AiFTZnf8
   +6tnq+xp+X63c0TtWHWXsknaRBBa5VGUM/qCzMJTwmQMDT9o+n85T/vyx
   88ez9zzwjbaW+0kzp/JwMZrWPJgQ/J0wwUjJtdqvPyBNZrZW2OggINkGI
   1kyUy/WZE8ILJbwezDlNgC2w8H/evldkQBQsaRV/S8CIm8c2XlneOLGq3
   6zHvMWwYmXd8JtOEhLfrQ0lxdMTfOMXEVZYBLHWsCbhfre4RVsve1xuwJ
   A==;
X-CSE-ConnectionGUID: 2+q3l6m4T0aQKTS7amaNaQ==
X-CSE-MsgGUID: lnqmTcb0Q6eLeaemxn2Z+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216736308"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="216736308"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:23:05 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id DC4001002BBE
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:04 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 92DEC8D204C
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DA57682C0E0;
	Wed, 22 Oct 2025 02:23:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/29] python3-cytoolz: upgrade 1.0.1 -> 1.1.0
Date: Wed, 22 Oct 2025 10:22:12 +0800
Message-ID: <20251022022227.226-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120863

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add support for Python 3.14, PyPy 3.11
- Drop support for Python 3.8, PyPy 3.8
- Add experimental (untested!) support for free-threading, including building wheels
- Update to match toolz 1.1.0
- Faster concat
- Improve performance by avoiding global lookups
- Modernization

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cytoolz_1.0.1.bb => python3-cytoolz_1.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cytoolz_1.0.1.bb => python3-cytoolz_1.1.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-cytoolz_1.0.1.bb b/meta-python/recipes-devtools/python/python3-cytoolz_1.1.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-cytoolz_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-cytoolz_1.1.0.bb
index 4aa110107a..9840fbfbd6 100644
--- a/meta-python/recipes-devtools/python/python3-cytoolz_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cytoolz_1.1.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d422ebce3e9c6447563bd410e9b22f2e"
 
-SRC_URI[sha256sum] = "89cc3161b89e1bb3ed7636f74ed2e55984fd35516904fc878cae216e42b2c7d6"
+SRC_URI[sha256sum] = "13a7bf254c3c0d28b12e2290b82aed0f0977a4c2a2bf84854fcdc7796a29f3b0"
 
 inherit pypi setuptools3 cython
 
-- 
2.43.0


