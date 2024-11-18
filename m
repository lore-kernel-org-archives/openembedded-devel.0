Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D8BD4401B
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:27 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.37268.1731922216162759929
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iTLN6zPJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922220; x=1763458220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RkBVyEvO+DkinQXVje/XI4u2B+cFdQemHYV0aOirJIo=;
  b=iTLN6zPJ8ZXiYcBvkN7q90+3jbpyyyJ1TQUdaGoeTarXibx6PsrDyNUW
   PiVbQGTHnUg74vXPZXjXfeQxn1R2PZY2kd2M/ODrO7hh2NkFghphb3VW1
   t+bKarRdWhTeRX00KYqV+khjxoQnONPyCU3VV6ET94HNIWn0psTk4K5O1
   5CfllDHF8Ewds+S0T4O6JHij3f3eOtfARLokNIE/2S4bFI/7Kal2kaDrs
   ooYd/O27m/CJo4w3eygXL9vvPONTJ7bcaS3JGjXujoNUB7EMzTnPwIGh0
   WNxPBM6NbPkdTRKVoEN2pd6yYYG4+8Ut42421eZIPT4+1pfCzxue0cgz4
   Q==;
X-CSE-ConnectionGUID: yinidW+AQlqBSrkWEry2PQ==
X-CSE-MsgGUID: l6sY2PUbQ2qYj4+n+F1jrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="180782272"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="180782272"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:19 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D5B76E8521
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 71234C4A14
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BF7320071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B06861A01E9;
	Mon, 18 Nov 2024 17:30:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/32] python3-setproctitle: upgrade 1.3.3 -> 1.3.4
Date: Mon, 18 Nov 2024 17:29:48 +0800
Message-Id: <1731922195-5266-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--0.654600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa3zndiJkHFMhFtRKarSV80bo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIRS3DZuMLAo2uD0hZ3srAUDl56I9qeuj9Dko
	WEiKFeuATLzfQkPdcdbxiNYCpq/RhFPv7Yhld+sj+C0CVP1hJs1WTCEOilaYX+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113891

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add support for Python 3.13
- Drop support for Python 3.7.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-setproctitle_1.3.3.bb => python3-setproctitle_1.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-setproctitle_1.3.3.bb => python3-setproctitle_1.3.4.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.4.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
rename to meta-python/recipes-devtools/python/python3-setproctitle_1.3.4.bb
index d0373b46d..24200533f 100644
--- a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=86d2d41b5f4f023f43466f8cb7adebaa"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "c913e151e7ea01567837ff037a23ca8740192880198b7fbb90b16d181607caae"
+SRC_URI[sha256sum] = "3b40d32a3e1f04e94231ed6dfee0da9e43b4f9c6b5450d53e6dd7754c34e0c50"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.34.1


