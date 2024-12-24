Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBB3C0219B
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:32 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.30515.1735032450558161639
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ULHSJK+r;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032450; x=1766568450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=woxtaVzueJUZ7jd4XjPnoFIvTccSdz7WcmQlKGKDruQ=;
  b=ULHSJK+r74tymz2tpdkIo6oXEcS2XWMK5FzSj+IeOJGV6Z0aa/+WLByk
   KvHGoRRUwhB83OMPxHu5sFX4Hjq6x+YSWNpQafPE+axxOsq0mE3l4JzTE
   +TaLZWd9bE9RhKwkKhz0AGymrW3NIu2aXzEd+iNq+L23ZEem6hlVAGZpU
   okZaiklXrFEddMjnIVo0IkvYmS1dZwmAkoSS6I6CT7NWDViRCOqu3pwdK
   MzqOdT2skKXhIweK4ProTJVkAy8clLKv62fHS+biXlQTb2pvV/ihyRuSZ
   wBnUXQyNixnCd5rmlGKleDFDz7FTpkzCW1gOf8ngEgO2KBycNiFjtKTzR
   Q==;
X-CSE-ConnectionGUID: FRM58OFJRNy6ILFQfnwftg==
X-CSE-MsgGUID: 49FnolJrTPiKdAYGCOvnsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="173157111"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="173157111"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:28 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CD36D4C2B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AFCBD4C17
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BA1EC20071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:25 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5D5131A0071;
	Tue, 24 Dec 2024 17:27:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 51/67] python3-pytest-cov: upgrade 5.0.0 -> 6.0.0
Date: Tue, 24 Dec 2024 17:26:45 +0800
Message-Id: <1735032421-13513-51-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--0.527300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrK2GKtdiFmTkwAYdq1VTXo9gm
	nebOtuawz+B9FumCXDcNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62G2i4y8P2xXndB/CxWTRRu+rAZ8KTspSz326kmrN4obZSOD
	Q+rmFjbNTVCrIpvFvEEFFDCODwjkUgG/qubJ2rjMCRrdSkp8mnFH4vEgiSExpkIXkU3/MDlEpj0
	fuzlZF8iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114526

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Updated various documentation inaccuracies, especially on subprocess handling.
- Changed fail under checks to use the precision set in the coverage configuration.
- Added a --cov-precision cli option that can override the value set in your coverage configuration.
- Dropped support for now EOL Python 3.8.Updated various documentation inaccuracies, especially on subprocess handling.
- Changed fail under checks to use the precision set in the coverage configuration.
- Added a --cov-precision cli option that can override the value set in your coverage configuration.
- Dropped support for now EOL Python 3.8.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pytest-cov_5.0.0.bb => python3-pytest-cov_6.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-cov_5.0.0.bb => python3-pytest-cov_6.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_5.0.0.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_6.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pytest-cov_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-cov_6.0.0.bb
index e3e4affb9d..75742f3e8f 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-cov_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_6.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=cbc4e25353c748c817db2daffe605e43 \
 "
 
-SRC_URI[sha256sum] = "5837b58e9f6ebd335b0f8060eecce69b662415b16dc503883a02f45dfeb14857"
+SRC_URI[sha256sum] = "fde0b595ca248bb8e2d76f020b465f3b107c9632e6a1d1705f17834c89dcadc0"
 
 inherit pypi setuptools3
 
-- 
2.43.0


