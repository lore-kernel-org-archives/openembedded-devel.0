Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12929C54747
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:09 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2882.1722934016964852790
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IfoXmWOd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934028; x=1754470028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RoCQprvXFgcgnGLEGjTSYb11ta0WEOdB8BoOOkEL05s=;
  b=IfoXmWOdcZY4U4cLzrTFeQmOIdRqiqZoZ4kBe/M9ZgRnSXdPYwUjXNfK
   Osi7uaRZxaAmy1cEhnpUttlETQUfNMgMeipNYfjnmnuOXu/76jBiq8QeT
   L9BfBvpDbKl537503NibLnvMdZVFkE5rcFfwsxUa2Dtvw5pzWCSdIQxtm
   ItXkTdTwN6TCJjSFC6AtD3TS43VcK865J+wQeKhADl4hFbvjR9m/xBSto
   tfimbgfmXrgpe46KByZ5K9VSP2zEjU6qARo7CQavrriiSr15vDcx6piE9
   mgkhwzS47TKoVD+QRP+zt/KetXjkhVRBfOl6YbnI5Qtq4EijmanwUl+b8
   Q==;
X-CSE-ConnectionGUID: KedEeIfgQu+MtwEejzihlg==
X-CSE-MsgGUID: F18xfwxlSDeypxyG8L989A==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="149361416"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="149361416"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:07 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 029BFC9440
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 498F1D50B6
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CF9412007955E
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 985801A000D;
	Tue,  6 Aug 2024 16:47:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 60/60] xmlsec1: upgrade 1.3.4 -> 1.3.5
Date: Tue,  6 Aug 2024 16:46:34 +0800
Message-Id: <1722933994-32549-60-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--5.561100-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yQPZZctd3P4BTfK5j0EZbysPdZmyx8xAawTg
	sjIJUJZI8sBsXd+eJQ+K8WnR386CVm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl76S7Hfu9IUxZng
	ixNorteCKbJjRgBP8qZg+xMERr0NZo64b9UI0JJbvVbHa5Rs8t8TGavmGo0vWvGsAbY6bunafwF
	whCRs+G67mlp7M9GhYgDLqnrRlXraHJ68AG1ZTYgGlEJORGTlJ+gtHj7OwNO2FR9Hau8GO7n0om
	Q5MlmLIdPBPsutHMriZfZ3zTR+UPS1+aMdYMvadDNrD4O+aXKw=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111577

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch   | 7 +++----
 .../xmlsec1/xmlsec1/change-finding-path-of-nss.patch       | 7 +++----
 .../xmlsec1/{xmlsec1_1.3.4.bb => xmlsec1_1.3.5.bb}         | 2 +-
 3 files changed, 7 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.3.4.bb => xmlsec1_1.3.5.bb} (96%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
index f107f42da..697a8ee35 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
@@ -1,4 +1,4 @@
-From 4d73b85fb1b794c649359bc8a774b0111d36994a Mon Sep 17 00:00:00 2001
+From 1d7c01467e6f510b5636c73757f302a4bd277a3c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 4 Feb 2020 23:39:49 -0800
 Subject: [PATCH] nss/nspr: fix for multilib
@@ -6,16 +6,15 @@ Subject: [PATCH] nss/nspr: fix for multilib
 Upstream-Status: Pending
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
 ---
  configure.ac | 16 ++++++++--------
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 51621d6..3d23683 100644
+index 7f137c0..e15f5bc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -960,24 +960,24 @@ fi
+@@ -958,24 +958,24 @@ fi
  dnl Priority 1: User specifies the path to installation
  if test "z$NSPR_FOUND" = "zno" -a "z$with_nspr" != "z" -a "z$with_nspr" != "zyes" ; then
      AC_MSG_CHECKING(for nspr library installation in "$with_nspr" folder)
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch
index 3a1531deb..61c56ffc8 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch
@@ -1,4 +1,4 @@
-From 9c861646e034b1c80fafd389279b0a7da90a8ba7 Mon Sep 17 00:00:00 2001
+From b43fa6bf612ee59db57573b39e357b6ca96d48b6 Mon Sep 17 00:00:00 2001
 From: Yulong Pei <Yulong.pei@windriver.com>
 Date: Wed, 21 Jul 2010 22:33:43 +0800
 Subject: [PATCH] change finding path of nss and nspr
@@ -8,16 +8,15 @@ Upstream-Status: Pending
 Signed-off-by: Yulong Pei <Yulong.pei@windriver.com>
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index ce8a278..51621d6 100644
+index 8add879..7f137c0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -935,7 +935,7 @@ NSS_PACKAGE=mozilla-nss
+@@ -933,7 +933,7 @@ NSS_PACKAGE=mozilla-nss
  NSPR_INCLUDE_MARKER="nspr/nspr.h"
  NSPR_LIB_MARKER="libnspr4$shrext"
  NSPR_LIBS_LIST="-lnspr4 -lplds4 -lplc4"
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb
similarity index 96%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb
index 7639209e1..994adef3a 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
            file://ensure-search-path-non-host.patch \
            "
 
-SRC_URI[sha256sum] = "45ad9078d41ae76844ad2f8651600ffeec0fdd128ead988a8d69e907c57aee75"
+SRC_URI[sha256sum] = "2ffd4ad1f860ec93e47a680310ab2bc94968bd07566e71976bd96133d9504917"
 
 inherit autotools-brokensep ptest pkgconfig
 
-- 
2.34.1


