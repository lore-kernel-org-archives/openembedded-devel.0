Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7933C3ABA5
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.35429.1745311775803059543
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bhEz7bxx;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311778; x=1776847778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nsYyVNyZX3wpHk/4t2R71cLcYM5dYJeN/f588wZkFOM=;
  b=bhEz7bxxsyIqmmXq/THIK1G3zY7/A6k4CTBPfZfn3QhCVsPkfjJdrcxf
   6BMET8UM01zxB9fAfHYcZdPjVdTw2bu8ex/wBSDhaju4bWLBHmbZYCYe7
   3NsISkHNIGle7dE9rrE5UIMcNjiJ5YRPdiatpRCdqvpR9WK6ImdMUVruf
   uyE+BfQ7P5UAM1MgvU/UbldJnU1/Z5B3XwUgFQ2vzeDmeX3v91PwfH0Ma
   cBey19/ySp5C+YEkDGCxHFOgTweTMpYLBFEYXRynKYp5LrO6EATJdIXLa
   DSOVKxV2AtcFTUodrGnTEmb3F/IkWr6zmxp7GeRY1o3MC36hVXAOC5E1r
   Q==;
X-CSE-ConnectionGUID: ZSQrk+VjRg6Y0h0h9GazzQ==
X-CSE-MsgGUID: EPwGTDcUT5aRD2aGByNB7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="197342739"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="197342739"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:36 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B0CEBD4F55
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 71D41D3F31
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:32 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2CE391A009A;
	Tue, 22 Apr 2025 16:49:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/30] python3-m2crypto: upgrade 0.44.0 -> 0.45.0
Date: Tue, 22 Apr 2025 16:49:10 +0800
Message-Id: <1745311761-1912-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117035

From: Wang Mingyu <wangmy@fujitsu.com>

python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch
refreshed for 0.45.0

Changelog:
===========
- chore: build Windows builds with Python 3.13 as well
- fix: remove support for Engine
- chore: mark actual license of the project BSD-2-Clause instead of wrong MIT
- ci(Debian): make M2Crypto buildable on Debian
- swig: Workaround for reading sys/select.h ending with wrong types.
- ci: bump required setuptools version because of change in naming strategy
- fix: add fix for build with older GCC
- fix: remove AnyStr and Any types
- chore: add .git-blame-ignore-revs
- chore: blacken everything

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-setup.py-Make-the-cmd-available.patch           | 9 +++------
 ...on3-m2crypto_0.44.0.bb => python3-m2crypto_0.45.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-m2crypto_0.44.0.bb => python3-m2crypto_0.45.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch
index 819ecabf6c..c4262985ba 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch
@@ -1,4 +1,4 @@
-From b14664fdab286485c5cbc0fbe5b0ff13f062edd8 Mon Sep 17 00:00:00 2001
+From eaeb95ec64762a58dde7cf368fc17188382e7df6 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 28 Mar 2025 12:13:26 +0800
 Subject: [PATCH] setup.py: Make the cmd available
@@ -23,10 +23,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 7e295f3..cc414c9 100644
+index 9938e67..21e2346 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -221,7 +221,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+@@ -230,7 +230,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
              with open(
                  "src/SWIG/x509_v_flag.h", "w", encoding="utf-8"
              ) as x509_v_h:
@@ -35,6 +35,3 @@ index 7e295f3..cc414c9 100644
                  cflags = os.environ.get("CFLAGS")
                  if cflags is not None:
                      cmd += cflags.split()
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.44.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.45.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-m2crypto_0.44.0.bb
rename to meta-python/recipes-devtools/python/python3-m2crypto_0.45.0.bb
index 5201e704ea..77f1f7df89 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.44.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.45.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
-SRC_URI[sha256sum] = "384bb4cbd178ee0e74015311b7b1f9f2c377e3686e03fa070b3ec2f494671c0f"
+SRC_URI[sha256sum] = "ffc10d4d09901514f408dc74f60a4d7df21c44ebc9bf776c947bfdc7359421cf"
 
 SRC_URI += " \
            file://0001-setup.py-Make-the-cmd-available.patch \
-- 
2.43.0


