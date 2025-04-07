Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE43CC3600C
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 02:26:55 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.38077.1743992806965303104
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 19:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jd3UR0kp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743992807; x=1775528807;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JVo7B2yOi0RBrEYzBioS0vpEn8OAkrWcoTAtlCTfnN8=;
  b=jd3UR0kp/IFYnmJP2zRS52DFGwTZBtawU2E/cX9rAy8/Lh1/sm4Wc4EU
   v0dE5hegBBw+De9qOCmeWFpKu2mjgixeTF2vgVeNyf8HDG0STDwWim8j6
   knFBg+0tZFEwhx3ZodD/KZGqWzpYjWe9Xzdcw30LnqrNE9dXOEZGtPeIk
   yc+7UxV5mr4zzaKmd3vgKdlB1N/27KE+zrUSqihtGufYTJeqdXJnNCDJ3
   heZ2JUsY0jyp/a2B0/JZ9QqSx73KG4Cux3MjfyY9oIa10HFWI7vF+9m5z
   9lkPwqyF8DGllhH/15Kq0m941cHNtflsDMEfGxaPhwhLCI+1yTtTWUwTD
   A==;
X-CSE-ConnectionGUID: e4i/jnbvQEubEEC8m9Q4/g==
X-CSE-MsgGUID: TFJvk2OiTbGK9Bab6mM9bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195937367"
X-IronPort-AV: E=Sophos;i="6.15,193,1739804400"; 
   d="scan'208";a="195937367"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 11:26:44 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6875F7E488
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 11:26:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B86AD88A1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 11:26:42 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 958171A0071;
	Mon,  7 Apr 2025 10:26:40 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v3 1/2] python3-webcolors: upgrade 24.8.0 -> 24.11.1
Date: Mon,  7 Apr 2025 10:26:01 +0800
Message-Id: <20250407022602.2226-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 02:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116614

Fix the issue that:
 | Traceback (most recent call last):
 |   File "/mnt/test/build_auh/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/recipe-sysroot-native/usr/lib/pyth on3.13/site-packages/pyproject_hooks/_impl.py", line 402, in _call_hook
 |     raise BackendUnavailable(
 |     ...<4 lines>...
 |     )
 | pyproject_hooks._impl.BackendUnavailable: Cannot import 'pdm.backend'

python3-webcolors has migrated to pdm-backend
 | diff --git a/pyproject.toml b/pyproject.toml
 | index 6fcec77..9f2dfa9 100644
 | --- a/pyproject.toml
 | +++ b/pyproject.toml
 | @@ -1,65 +1,110 @@
 |  [build-system]
 | -requires = ["setuptools>=61.0"]
 | -build-backend = "setuptools.build_meta"
 | +requires = [
 | +    "pdm-backend",
 | +]
 | +build-backend = "pdm.backend"

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...n3-webcolors_24.8.0.bb => python3-webcolors_24.11.1.bb} | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-webcolors_24.8.0.bb => python3-webcolors_24.11.1.bb} (70%)

diff --git a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
similarity index 70%
rename from meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
rename to meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
index c5ed4bd7d3..cda63d2a35 100644
--- a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
@@ -3,10 +3,15 @@ HOMEPAGE = "https://pypi.org/project/webcolors/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cbaebec43b7d199c7fd8f5411b3b0448"
 
-SRC_URI[sha256sum] = "08b07af286a01bcd30d583a7acadf629583d1f79bfef27dd2c2c5c263817277d"
+SRC_URI[sha256sum] = "ecb3d768f32202af770477b8b65f318fa4f566c22948673a977b00d589dd80f6"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += " \
+    python3-pdm-native \
+    python3-pdm-backend-native \
+"
+
 RDEPENDS:${PN}:class-target = "\
     python3-stringold \
 "
-- 
2.43.0


