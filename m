Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A820C25B7B
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:52 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.10791.1715677840073324735
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Fcre8eTr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677845; x=1747213845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=W5Ul97IJieXo8kV9fpZMw8MN0SXVAWEvqAEh4LqECGM=;
  b=Fcre8eTrHKMt9klYOA0sDutmOvb+/naeM7Z2SYA7SLM0zYu01yB/2HK2
   Zm8mpcPA3RVd6VUjf4ZysoHRPLxb6wpjseSSfJq5NOc+hrq9QJpbq01LB
   DTQNu3Yg7De5WXGtoOEPBEyZaG6xlzGstRdkOot9QNGKKLcV0rLrEJefw
   mA4Y1zxu80lAibgRE2wWa6H5c74i9b3XAkW5HS7noZUvKEcrJQvP3h+e9
   1jBRk50ninTv5BRh+EjwMOVKvCTGJJqo1tjOIBExTtoO0OHmaZLFhDGQa
   jWm7DT3TxFzckmD0rkKemD8ekqaJNbXvf1ov6DLWKcLYeYkZQNlnXB87w
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="158143154"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="158143154"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:44 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DD34BDB60D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 25B0BD949A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A067C70BFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4E1781A000C;
	Tue, 14 May 2024 17:10:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 43/44] tracker: upgrade 3.7.2 -> 3.7.3
Date: Tue, 14 May 2024 17:10:16 +0800
Message-Id: <1715677817-2223-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--5.932000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeWAI7Mvq/sL53w6
	H06bMgivsrZggCM+PgfKU0L6+24KzbRZ6+uPHAuYA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYlxD8VfJsTjmP06ke90qDvOxlpnlQFCyh4Iw3bnTjwR6MAGHatVU16Mp2u
	h14hWI7rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG7bkV4e2xSge6/POJ7B3CaGgmSZ
	gLp/ySZyIogbJdKod7/ttj4yxibaRyFdNnda6Rv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110387

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Bump database version to fix SQLite 3.45.3 issues in existing
  installs
* Fixed possible infinite loop on incomplete/unterminated Turtle/Trig
  data.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{tracker_3.7.2.bb => tracker_3.7.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.7.2.bb => tracker_3.7.3.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.7.2.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.7.3.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.7.2.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.7.3.bb
index f3c482b27..885f3515d 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.7.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.7.3.bb
@@ -22,7 +22,7 @@ DEPENDS = " \
 inherit gettext gnomebase gobject-introspection vala gtk-doc bash-completion python3native
 
 SRC_URI += "file://0001-fix-reproducibility.patch"
-SRC_URI[archive.sha256sum] = "debcaa291e46afadc1cf6a251f17efb02440aa48bff643d78c61123807dce00f"
+SRC_URI[archive.sha256sum] = "ab3d4a50937e04c5ed7846f6dbb999e2909819402f389ca592ee6b77dd28d1f9"
 
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
-- 
2.34.1


