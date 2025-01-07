Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B70BC02187
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.16411.1736240516631520974
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BSRJkV+k;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240516; x=1767776516;
  h=from:to:cc:subject:date:message-id;
  bh=zE5a4cvlHAAydb8/zcY1ro2zF3oapA06uGzIPcrW4+k=;
  b=BSRJkV+kBrFPh4ncKm4DSeiVdAgJk7gpyji/D/fNdI4/ZhYYKDAnUi0S
   41nOX01gmFqcjOhg05X6IliK2s8uxMemG6lLXXqk/AATFcHsOu0OkvZZW
   q7gHZXVe00tT6IcF3hpSrsYNgLCVNhzrAkRox116z0ZCRSXsO4/wXYcOp
   KNjtDa9dmsUsMtS/gQ3wVHjWYghM98ZqVsiU8QFETvqVNeaCmcHOYHFdR
   6dfRG5WbRcoObPDybV8vBgufGxSap5CkLRY6+AUygAxvIY20wl2BNNWb6
   XT2s8DvgSj0/eC2yvXEU9zExUt8yHZbiHRowztHifZzoVtYfTj/2DhIfj
   g==;
X-CSE-ConnectionGUID: i7HIbC9IQFOafGb9Q1X7Ew==
X-CSE-MsgGUID: wqxIkpeMQAaOrt2SxVG2AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="174177524"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="174177524"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:54 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DF8527543
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 164FA170C7
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A754A41185
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:51 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 612971A0003;
	Tue,  7 Jan 2025 17:01:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/18] ctags: upgrade 6.1.20241229.0 -> 6.1.20250105.0
Date: Tue,  7 Jan 2025 17:01:27 +0800
Message-Id: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrZFBAb4CyKPieM8KgZMynf4j6OrCq1tjNPMY3TTv7fNeY3igqmhPz3MSK3
	RaT//uLRcI+LMpz8izsqFZGb9sTBJKAp4VyF0y+R0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114677

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20241229.0.bb => ctags_6.1.20250105.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20241229.0.bb => ctags_6.1.20250105.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20241229.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250105.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20241229.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20250105.0.bb
index c0696bd1eb..15b374e52b 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20241229.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250105.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "a484466e610f66a3e6f4bb3b96919c629520d37d"
+SRCREV = "e31feb0d9ccc9e2643465d43a785c1f53f43b305"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


