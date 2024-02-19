Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BDDC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:03:00 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.37572.1708333377386295267
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oIJpU2Gh;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333377; x=1739869377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+UxX5ifTSzqUMtiPrbW1sJpgPwRMi4wwdVhzdlh+07s=;
  b=oIJpU2GhiT1eZ8alqMQbVw23xjXugqyizW5peYU9p/wPvc+RkciTW/1h
   VFWchXT0SogW1geB6O3FlHSx988ijdsiyIeeH2cnEH2TDEE9CKMQkDxaE
   5MQyyYe3Fjz80W/mSzCD9P4rdVdC1U8y7oiO21+p2ciJ+jr/2ziMhua0G
   zpjNfUVIHuyyQPZ33SZQ0+z3aI48y94T3NXcGo6dq22m39nQSE7ODeXhX
   vESNqc5rv7H0/XxYVKaLSSUxDgpujAZvPhzVvBW8vZ6ugFZVkv1cALIjA
   euhGkRCdbzxUp332cx+ETAeFHl8vCrPHeZUFcfpZ8rJ0BdvIDOSmWWew7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="129068904"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="129068904"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:54 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EDAEC4DA771
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A6DDD4BDA
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 74C861E9CA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2285E1A006B;
	Mon, 19 Feb 2024 17:02:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/23] python3-gevent: upgrade 23.9.1 -> 24.2.1
Date: Mon, 19 Feb 2024 17:02:26 +0800
Message-Id: <1708333346-17704-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10--13.785300-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/yaoXHZz/dXlxfb+ZO7kHlEgyKRnX9xPs4D4t
	lu4+KTBzFodYY9cGajIqkgJd8Sn1dSMzz0nH2X4f8Jb881FGn9mYasbATu5ay9RGf5c57+FFFlo
	O+iJRP8zUpSDSJiIi5wnfSLcEpQvmY/lH93Af2Gyqh5pv1eDPzxniLo7qSg5ve3NcvuU/AP+kOH
	FhluHFYu2xSRAx0NK/S05r5h69z2KIKyp7CdRkYD9B1SHosSXQN5dqZcIK7Vgg9R3V8qg5xL8FH
	rw7frlu6wgz8PTKAFj0rpDHO8rvDwTlYXzg2e0paeYJAsn8efDWN3XQ/7wsT5V+pxGjZ2KA5wMP
	MqdPNSzeD4gJtRXuAe8EXzJfARL1TvHzGcGqiIKeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8h+ICq
	uNi0WJN6L9DjmrT4BlRec99U1pLse1fqXgm+mj/dxsVK90JYnftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108868

From: Wang Mingyu <wangmy@fujitsu.com>

0001-_setuputils.py-Do-not-add-sys_inc_dir.patch
refreshed for 24.2.1

Changelog:
===========
-Add support for Python patch releases 3.11.8 and 3.12.2, which changed internal
 details of threading.
-Errors raised from subprocess.Popen may not have a filename set.
-SSLSocket.recv_into and SSLSocket.read no longer require the buffer to
 implement len and now work with buffers whose size is not 1.
-gh-108310: Fix CVE-2023-40217: Check for & avoid the ssl pre-close flaw.
-Drop setuptools to a soft test dependency.
-Drop support for very old versions of CFFI.
-Update bundled c-ares from 1.19.1 to 1.26.0.
-Locks created by gevent, but acquired from multiple different threads (not
 recommended), no longer spin to implement timeouts and interruptible blocking.
 Instead, they use the native functionality of the Python 3 lock.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-_setuputils.py-Do-not-add-sys_inc_dir.patch | 12 +++++-------
 ...on3-gevent_23.9.1.bb => python3-gevent_24.2.1.bb} |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_23.9.1.bb => python3-gevent_24.2.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch b/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch
index ac8b031cf..49903d6ce 100644
--- a/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch
+++ b/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch
@@ -1,4 +1,4 @@
-From f3267ad7994a4b66e6bcf72cb0e418105f77bd52 Mon Sep 17 00:00:00 2001
+From 9eb453283a7ac8a9b1dd3eac86d936c7a430476b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 11 Oct 2022 17:37:01 -0700
 Subject: [PATCH] _setuputils.py: Do not add sys_inc_dir
@@ -10,15 +10,16 @@ we really do not need setuptools to deduce it for us.
 
 Upstream-Status: Inappropriate [ Cross-compile specific ]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  _setuputils.py | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/_setuputils.py b/_setuputils.py
-index d98f716..31134a4 100644
+index 4c25e00..23fdfe1 100644
 --- a/_setuputils.py
 +++ b/_setuputils.py
-@@ -161,7 +161,6 @@ def get_include_dirs(*extra_paths):
+@@ -164,7 +164,6 @@ def get_include_dirs(*extra_paths):
      # Neither sysconfig dir is not enough if we're in a virtualenv; the greenlet.h
      # header goes into a site/ subdir. See https://github.com/pypa/pip/issues/4610
      dist_inc_dir = os.path.abspath(dist_sysconfig.get_python_inc()) # 1
@@ -26,7 +27,7 @@ index d98f716..31134a4 100644
      venv_include_dir = os.path.join(
          sys.prefix, 'include', 'site',
          'python' + sysconfig.get_python_version()
-@@ -175,7 +174,7 @@ def get_include_dirs(*extra_paths):
+@@ -178,7 +177,7 @@ def get_include_dirs(*extra_paths):
  
      return [
          p
@@ -35,6 +36,3 @@ index d98f716..31134a4 100644
          if os.path.exists(p)
      ]
  
--- 
-2.38.0
-
diff --git a/meta-python/recipes-devtools/python/python3-gevent_23.9.1.bb b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gevent_23.9.1.bb
rename to meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
index 0caebce28..ebde34d56 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_23.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "72c002235390d46f94938a96920d8856d4ffd9ddf62a303a0d7c118894097e34"
+SRC_URI[sha256sum] = "432fc76f680acf7cf188c2ee0f5d3ab73b63c1f03114c7cd8a34cebbe5aa2056"
 
 inherit pypi setuptools3
 
-- 
2.34.1


