Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80077CD1292
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:43 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.39483.1711983102108014469
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BPIeNG2k;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983102; x=1743519102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RuHd6od1PfDRbRF1i5qLswTX5Ens0W1bSNCjKqwegok=;
  b=BPIeNG2kxJe3iKMjwkOe5Zh99paPLaLxRa0+xheWYCEjK9xaONJms8TV
   y6VhQP/blAZahZ+SJcMP6AnPGHZy0OmT/eVhebGdchUz0WglcqfGrcwNX
   4HvRe7a07kL0xhba45O67OPDW1ngRqpq2mNaY4mTlPYbJSaQjLplG9NO9
   2C2W768vrIv0jlTCNTQFMhNXAyTvm1jW3sFOQO6od2RR1zU5X3Wazwe/y
   RvngVtUyI2W7Tn7aOSkhsI9fOiV0+I05iBfLB7x0K6+qOYdIMSBLNWYek
   ejejJqZ1Ns6LNCIvspOFMfeHds+SFAVaf3YEPf9S6calTI/4Fv1NGTXVv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="141867301"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="141867301"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:39 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C232B23946
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 08479C520A
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EB2220093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 451CF1A000A;
	Mon,  1 Apr 2024 22:51:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/47] python3-jdatetime: upgrade 4.1.1 -> 5.0.0
Date: Mon,  1 Apr 2024 22:50:57 +0800
Message-Id: <1711983079-16849-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-3.015500-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvMC10TsipyQqw9l
	TAN4WxnxT6l0J3vVcGW8jvwrlsw0tHbJfXjk/UEDqTb2sWzCG35UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw65x7uAXGEprQFA6pSxaDHmgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq03HTyROdRA7GCgSx+JEaNeqbW1PpxLydhcxw1pX7+og2IbM
	VZw2/Fo49qKTtGOtiZUQrqRproFeI0I4Y94LN1z8CyUQLYdUDIdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109744

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-tests(test_zoneinfo_as_timezone): skip if tzinfo is not available on windows
-fix(strftime): treat %% as an escape sequence
-chore(jalai.py): cleanup the code
-fix(strftime): also escape %% before c, x, and X
-fix(date, datetime): return NotImplemented for unknown type operations
-docs(README.rst): use jdatetime.FA_LOCALE instead if fa_IR
-Update python versions
-update jalali license
-update licences
-Use jalali core

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-jdatetime_4.1.1.bb => python3-jdatetime_5.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_4.1.1.bb => python3-jdatetime_5.0.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_4.1.1.bb b/meta-python/recipes-devtools/python/python3-jdatetime_5.0.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-jdatetime_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-jdatetime_5.0.0.bb
index 22a798529..f1dd368ea 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_5.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/slashmili/python-jalali"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c80be45b33471b4a23cf53d06a8172be"
 
-SRC_URI[sha256sum] = "1dd0ee210160c7bd30002803c443e6260ac602ea65b065652a1d567d3bfdca7a"
+SRC_URI[sha256sum] = "2cc603d913c0d8e328928454d3d295261cb037e9950227f67c9629ab4710fdf9"
 
 PYPI_PACKAGE = "jdatetime"
 
-- 
2.34.1


