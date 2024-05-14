Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E0BC27C6D
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.10755.1715677840109396209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SRwoaxbM;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677840; x=1747213840;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QWQtsPwhIHx6UfxBZU8n41TvuKgmkmrJG9+kUM9Ov0M=;
  b=SRwoaxbMriUxd26M0aRCQZpFaODYAC/kMn/K6MUubQwUxq1UhOGZrZbR
   +QxLC3KUcwez4tdCd+9k+LrTAglMhQc45j1CJKFBYM5FUxhHmraEMylvp
   hQO1o9XAJTCRAQdpLcyhFlVJoagfYCHIRdoMo37cK0ps0SRlFoJR/yjZ/
   Uoq6U9WUfQ1oGQQTwq1lyMIbULlZg1w/7aOjjB+PCrn79qk/M9LWsGtlT
   Di2lGaKnK5oDy5nT7F/yjZOLpK0xchWicxiAGiywi0zj0j7W4kbgDjVJi
   7RWsL8kmhcvQIw3V9itqLXdy85uZu6YqbaoY66XqQE2TE8gS9Y0OsQ4KW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="146707025"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="146707025"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:37 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8CC62CD6DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CD293D3F28
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 544C16BB7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 013571A000C;
	Tue, 14 May 2024 17:10:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/44] python3-langtable: upgrade 0.0.65 -> 0.0.66
Date: Tue, 14 May 2024 17:10:00 +0800
Message-Id: <1715677817-2223-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-4.560500-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrTfK5j0EZbysn3IThl21UNwjJ
	lierVE/n4aYaoqZxF9wLPwM+AYjF3Q9r3GpPQIHckTvpZcLdcV9r2qJoNIuCjf4DDXoaCqk7oHy
	0bASrKBqo2SXfAkKAeVThlo9aeik+7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5APn4
	RjXbQDehab+AC2MJ3sBhQWw3lZ+IU7BOj1lchJLN0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtqrM46JQnL8gRWIAyi5BI7Hc25RnMkk/6/7DPRWG0AqTv/NvRBvbhvcdJD9FYIFql62x8
	3j/RY+GzZwyQdW51Rgv3ySDJZTBrCVoPSiKOZs7yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110373

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix syntax error in a keyboard layout name for t
- Add mdf
- Use "in(eng)" keyboard layout instead of "us" for BD to get AltGr enabled
- Get translation changes from CLDR
- Add option to include changed translations as well to the script getting translations from CLDR
- Add reference to the the PyPI package to the README.md. And add a README.html and README generated from the README.md.
- Make test outputs somewhat more verbose, even when all tests pass
- Fix Makefile twine-upload target for new authentification

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-langtable_0.0.65.bb => python3-langtable_0.0.66.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.65.bb => python3-langtable_0.0.66.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.65.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.66.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.65.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.66.bb
index fa9edc67d..26a4f1921 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.65.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.66.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "791ec5403859704e1dee4d2a056a30ec21d1e7bc040658ce62c40e0427ba4333"
+SRC_URI[sha256sum] = "0679e9014aa25916a8184c7bb5082fe983a661ab958d37f5fb75461abf5fb342"
 
 inherit pypi setuptools3 python3native
 
-- 
2.34.1


