Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAD8E7719E
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.16414.1736240519172125224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XYepavUC;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240519; x=1767776519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=W0yQShwQttqdrpvsUr2YAF+oJNC7G7VT08WTI1iJ+ow=;
  b=XYepavUCX034P9Jhy4QIkY2IT2VlR6Gx4SmkWJhB9VBADYZZ88qvTub/
   OV9xafMfadVYxuu3Q06WzLj8dIM8nL3a6o3FtFmEvC+cxmReMQxAIGwrb
   V4S52eoY9mUJHxmv4ZJg9OsLlRHWUh8e03eK0/YMTkprxkgI1qpB2DtQu
   bFYyPaP35iVSjIZ5+YgOIfwrOSyp/Oablx6/yefxlm6p480rhkR6tmz03
   J2SdkfID36NkJHOJxLvrpr6TT5RTGP5uN3IKFoezJOoptk7UU91nGH47t
   PcRdJ1mzkF6/o8MJlyptRYJSs1n2prDnNmwNmGGTcpihMNtRNxTlcG78V
   A==;
X-CSE-ConnectionGUID: 3HeRIapxQtCKlmqjipJwlw==
X-CSE-MsgGUID: ITK8PaCEQYy4mxhbDKKnzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="173804740"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="173804740"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DB711DBB80
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B3E9FD4BD2
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4596240FF6
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F14E21A0071;
	Tue,  7 Jan 2025 17:01:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/18] python3-pillow: upgrade 11.0.0 -> 11.1.0
Date: Tue,  7 Jan 2025 17:01:39 +0800
Message-Id: <1736240504-5315-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10--0.407900-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yQk3qL3jdFBNnJdsOLB4zv7QarzCEH4/6tnO
	deq786q7J6Ys2UJwT9QSuJRtSU84o39JXYBaBfzu/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQFH0
	IKehhaoYDCvV3UwP6eG950PcJhKMdz8Cm+FIVcqPX3j/lf1V8LPOd2ImQcUyE+cbDHfpxITVH5f
	h+PjKkyXBRLfMXZsh4gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlydrc+WlclL3Q8p+uTvkn5wcXJV
	rizcYpVaAENy7Wd2uRmE5MxB7B9JrBHF6F0Kcbw0Tl5sMnuGxJ1KBPwof8riJIpva7hZxZ+/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114687

From: Wang Mingyu <wangmy@fujitsu.com>

0001-support-cross-compiling.patch
refreshed for 11.1.0

License-Update: Update license to MIT-CMU

Changelog:
 https://pillow.readthedocs.io/en/stable/releasenotes/11.1.0.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python3-pillow/0001-support-cross-compiling.patch       | 6 +++---
 .../{python3-pillow_11.0.0.bb => python3-pillow_11.1.0.bb}  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_11.0.0.bb => python3-pillow_11.1.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
index dbca66cee8..f96da323ff 100644
--- a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
@@ -1,4 +1,4 @@
-From de7cb754410dfff23746a74fb788d99462ab6ae6 Mon Sep 17 00:00:00 2001
+From 2e59ade9de405e4cdea07bfc7432c76f1e8cb64b Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Mon, 11 Jan 2021 13:25:12 +0000
 Subject: [PATCH] support cross compiling
@@ -12,7 +12,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 60707083f..2f614d826 100644
+index a85731db9..d55eb5324 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -131,7 +131,7 @@ _LIB_IMAGING = (
@@ -24,7 +24,7 @@ index 60707083f..2f614d826 100644
  
  
  class DependencyException(Exception):
-@@ -534,12 +534,12 @@ class pil_build_ext(build_ext):
+@@ -537,12 +537,12 @@ class pil_build_ext(build_ext):
                      _add_directory(library_dirs, match.group(1))
  
          # include, rpath, if set as environment variables:
diff --git a/meta-python/recipes-devtools/python/python3-pillow_11.0.0.bb b/meta-python/recipes-devtools/python/python3-pillow_11.1.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pillow_11.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_11.1.0.bb
index 86e8dc6f6b..7be15f3f91 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_11.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_11.1.0.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "Python Imaging Library (Fork). Pillow is the friendly PIL fork by
 Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors."
 HOMEPAGE = "https://pillow.readthedocs.io"
-LICENSE = "HPND"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c349a4b4b9ec2377a8fd6a7df87dbffe"
+LICENSE = "MIT-CMU"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a1b708da743e3fc0e5c35e92daac0bf8"
 
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://run-ptest \
            "
-SRCREV = "204aae6682fc936f5350b3fe70335776f81480a7"
+SRCREV = "4c1aed801e43c6b307e7135279ca1dbc02bbf052"
 
 inherit python_setuptools_build_meta ptest
 
-- 
2.43.0


