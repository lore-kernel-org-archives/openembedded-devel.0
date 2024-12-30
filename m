Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45474E7719D
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:30:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.58736.1735543843866390841
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pX67EcwW;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543844; x=1767079844;
  h=from:to:cc:subject:date:message-id;
  bh=sE9fluozI0ajB+KD/j6tY/qKsbDmFOFNit7LNofYqYs=;
  b=pX67EcwW4pqorvZnQi8cm/+jvJfewEi53TnX6mUieIXOB9TqmVWhtWMD
   K5wn1kpEOGwJYQtgrs+pWclHqnybNw2svSIJuT6iQqIvlX0R+U/rAAUy+
   e98KvJP0WyW5YuuJb0RZiWHV0okF5CuJWuPe+BzwkdP9FwdFi5jVNMCMl
   Rqe8Ayw1BHhlHiYVlvsaYOGBYiDhmOUXV7eYaNYacMPPeFYvOQTKOb3ey
   T0BcZLjDxuXD1mjrw1lP+I/q3+Uu0e91+NjymOFA3Lozb8PXBG7y+jHKY
   8+ajgZXGRWqLUh0MHz6NtVWF7LLmC87D2J3GhGw1qaHFLXQl3NOcbI8ii
   w==;
X-CSE-ConnectionGUID: 6/LQxvCOSCSc4agfN1E6MA==
X-CSE-MsgGUID: skE3ONzDSKuTpVqEzq7DQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="172619671"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="172619671"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:41 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B696A80F4
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 40850D5006
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BCDD370BE2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:38 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 67C091A0003;
	Mon, 30 Dec 2024 15:30:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/18] ctags: upgrade 6.1.20241222.0 -> 6.1.20241229.0
Date: Mon, 30 Dec 2024 15:30:19 +0800
Message-Id: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrZFBAb4CyKPieM8KgZMynf4j6OrCq1tjNPMY3TTv7fNeY3igqmhPz3Meq9
	1/lKUeY3k5cVsfXnz0mu3OPtOOgTqLwZNPak/k2x0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114580

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20241222.0.bb => ctags_6.1.20241229.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20241222.0.bb => ctags_6.1.20241229.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20241222.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20241229.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20241222.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20241229.0.bb
index a4bb412be3..c0696bd1eb 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20241222.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20241229.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "43ca055488cff7db0a5680cd9f07a76b3faa85f4"
+SRCREV = "a484466e610f66a3e6f4bb3b96919c629520d37d"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


