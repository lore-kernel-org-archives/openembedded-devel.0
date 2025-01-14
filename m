Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B452CE77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:12 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.40586.1736843351518583402
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HG7VLJmO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843351; x=1768379351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+qe+bQ2L0+hvnC1TOZYqocp+mEzWSJ2/wORNGCoaB/o=;
  b=HG7VLJmOOKxyBh/iPyUFtmpGxC0ToNrp/S9qor31fUXeJgwk0tcLrAu+
   NUvlPwd2URutlmDi6ySRhM2vOGOLh7TGxzMgofoNV/aji0WHKiA/gqI7b
   aiGp1SPB2bNArefYmY03LgciVyCszb4OIlKthbMxcgkvJjcoZ7X3gEhA9
   1rE46Shnh0TYtULG7/J4Q1+FPWmTo9+NJs3IIJrj+kL8CAoi4UWHUodsC
   1UUxHiq5yYJ4dtqaWccRi36FTnVp35hgSIMJ1Ee4L/1JgDW8H7mBEDLPg
   3BPya0/5kZaW570gcyKUGL2wWhCRtCiJiPXI27gdxVsLpGTA7TQbzAxcP
   g==;
X-CSE-ConnectionGUID: ZiIzA4RqQdyEhs67+m0PVg==
X-CSE-MsgGUID: JkLnRYlpSTSiYBI4OHGUkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="165354743"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="165354743"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:09 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 50D71E6148
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 252F7BF4BA
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BBE9B20071A35
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:06 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6A6071A000B;
	Tue, 14 Jan 2025 16:29:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/30] python3-aniso8601: upgrade 9.0.1 -> 10.0.0
Date: Tue, 14 Jan 2025 16:28:34 +0800
Message-Id: <1736843329-4131-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--9.370900-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrJ4cwIYL6Kud9MesWtSDfste9
	fqJZK1N350347xbYc8SnRlHozcuperPg2s6yW87O4v0ZcDzkTys0000sN/tt6d9RlPzeVuQQB5z
	clOaSfy4ppiuzBwGFPtnl43V4kx2lo6JgdT0O5H1O5y1KmK5bJSkDYTG6KmZaR/IzlV+CMbbT0P
	pHDbMis6NR7ZEgRD06RKNj26XmfriXBXaJoB9JZxRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7hbTw
	x3oTx48kR3FXLKXMbt0zNon8jgSwyYn8m4n3/PaS4W/MRhJ1X4=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114858

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Reduced accuracy representations of years when parsing a calendar date are now
  only allowed to be [YY]
- No longer specify a Python interpreter version to Black
- Cleanup unsupported Pylint configuration options
- Fix used-before-assignment errors
- Fix coverage issue caused by unreachable conditional in _parse_interval_end

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/python3-aniso8601_10.0.0.bb   | 8 ++++++++
 .../recipes-devtools/python/python3-aniso8601_9.0.1.bb    | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-aniso8601_10.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-aniso8601_9.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-aniso8601_10.0.0.bb b/meta-python/recipes-devtools/python/python3-aniso8601_10.0.0.bb
new file mode 100644
index 0000000000..4fe18d18eb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aniso8601_10.0.0.bb
@@ -0,0 +1,8 @@
+DESCRIPTION = "A library for parsing ISO 8601 strings."
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ba35a7f4192a3ea09a01f4e8169a56bc"
+
+SRC_URI[sha256sum] = "ff1d0fc2346688c62c0151547136ac30e322896ed8af316ef7602c47da9426cf"
+
+inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-aniso8601_9.0.1.bb b/meta-python/recipes-devtools/python/python3-aniso8601_9.0.1.bb
deleted file mode 100644
index 3d99e48c26..0000000000
--- a/meta-python/recipes-devtools/python/python3-aniso8601_9.0.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-DESCRIPTION = "A library for parsing ISO 8601 strings."
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6d91d56f51a54389d95526eefe039b1c"
-
-SRC_URI[sha256sum] = "72e3117667eedf66951bb2d93f4296a56b94b078a8a95905a052611fb3f1b973"
-
-inherit pypi setuptools3
-- 
2.43.0


