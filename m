Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2809BC2BA12
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2438.1718161129563991551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=avUgWK9d;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161134; x=1749697134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=G7P4yFemSgNABLymHutfVNxf9XRGgGHwVqlGby2WIxo=;
  b=avUgWK9dx3kMj97qhPiqGp6Wjkny14TXNBczceRD4mUaJ9FWycSeurd0
   3qbsfzKgQtnK5vFZ+R8W5D3V9aLLLfstr6wNcaeaNI7BUyb0koBm39Fu3
   AhjXyK0pNjG98G+s/yXojCTxFwvfqCiL/obgB3PRdpy0xIM5pKFxjx/qR
   rnIw8ZjC+znjPL8BmTS37iTUZ5tPfI4D2vd75k0zpmfNruNnPcPNn1Tr9
   iO+iR8RP+pzX+pTKtQ2dmYcQINCCH4bMvPf+PZudCVZBw1NHPuR3G5etp
   oT9MAe1zQqHIgGJU9aZ6dIsG69mMqIhIlEGYQjRvwKJ3v7ZV90ZTH8Zip
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="151034599"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="151034599"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:53 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 79629DAE0A
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BB11AD0931
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 43C70401E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DB72E1A0002;
	Wed, 12 Jun 2024 10:58:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/43] python3-xlsxwriter: upgrade 3.1.9 -> 3.2.0
Date: Wed, 12 Jun 2024 10:58:09 +0800
Message-Id: <1718161096-29710-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--2.727800-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yXg2y0j5vXZGlEDhvi2wR84H4DTIEE89jGdv
	IBM8UuLStq8FY7KCLFt6mL4lViyFyivuNdZBgrYPxvp0tuDMx3lUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw7cgUVP3Cp+vRCE2NlBjIjcB1VGYAjOG0CjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq2LgBqDuEv9TaaMuFNlg10q1FM/UWmXj8OCThxOZM8BnyQwu
	tKxYNYrsGgZiLpSxviJxohDkz+TTgr2m3gDYMApHE5PHd6Gzi8dJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110872

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
============
- Add :func:'embed_image()' worksheet method to embed images in cells.
- Fix issue where a horizontal alignment format was ignored if indentation was
  also set.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-xlsxwriter_3.1.9.bb => python3-xlsxwriter_3.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.1.9.bb => python3-xlsxwriter_3.2.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.bb
index ee7dab35c..93ca5525b 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python 2 and 3 compatibility library"
 HOMEPAGE = "https://xlsxwriter.readthedocs.io"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=12d9fac1f0049be71ab5aa4a78da02b0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a4bab8df34a9a138b4e0ca56b8559a05"
 
 inherit pypi setuptools3
 
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "de810bf328c6a4550f4ffd6b0b34972aeb7ffcf40f3d285a0413734f9b63a929"
+SRC_URI[sha256sum] = "9977d0c661a72866a61f9f7a809e25ebbb0fb7036baa3b9fe74afcfca6b3cb8c"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


