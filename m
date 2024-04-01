Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6BACD1299
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:43 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.39473.1711983094575666180
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TtA5Vw0w;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983101; x=1743519101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MDZMDf9TUqRYzvRVbmzzT7hFxRzd6vNTeSyY4XpasMI=;
  b=TtA5Vw0wFl0cD824eGWaZzMhiBbGqd+2eFDxTN+9MzWfHa30O2kUwDW5
   qxKLdlbICmXbESWOOKSen9Ev1zoK2mTmDnb1uwM+YEAhelQ54jIqzUlBU
   qM/jHTBP8QExTbquIlb9xGGaZdLbYOaO9zToX6s5C94nqlOeKXvuAmwG4
   vy3Gcm6j1+CzwWFD1CUzVmYEwHN8bhDXPi77j/0jxAdX5JW99wmCTDAOx
   EQ3IQL/ep8OUsEsgnjmvgpcfleaYmJgR7pO02YPZDmj27B26urKmO7pix
   YlmxIraKNqHogKWxPR4fIsB8eVMXaD2UKmoFvpWssosouifiqA/CGnA35
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="153710763"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="153710763"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:40 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 44ED7C680B
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 85F3F1B860
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 18D6921EEEF
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C2F681A000A;
	Mon,  1 Apr 2024 22:51:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/47] python3-gspread: upgrade 6.0.2 -> 6.1.0
Date: Mon,  1 Apr 2024 22:50:56 +0800
Message-Id: <1711983079-16849-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--6.614800-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxYC5LPd7BvbV0Q
	TojKLQVyl2GUABdhPsx0RzBbvk+cCLWtJ+5PTkamzmwpmAFt7kWOQOsE4nDCdP4DDXoaCqk72Ca
	d5s625rC2fDhjtmVLem91nWHwQpRhKVflPXpxuI4D2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiAH/xyJs7whhFjW2X28b8BjsKXyzHgcEb0dYsA1vFouoCGfvnVpx+256ba
	/D5x6cp4vM1YF6AJbb2xnRRfQRo4gtuKBGekqUpI/NGWt0UYPDtTsoG0/pFCufhRXMTDXY1T2Wk
	XXm7I5TiIUHbWy7GSRLF53hJcvsn
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109741

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add py.typed marker
-Improve back-off client
-Add new auth method API key
-Bugfix/add set timeout
-Fix wrapper cast_to_a1_notation
-Bump bandit from 1.7.5 to 1.7.8
-Bump mypy from 1.6.1 to 1.9.0
-Bump typing-extensions from 4.8.0 to 4.10.0
-Bump flake8 from 5.0.4 to 7.0.0
-fix error message readability
-Add missing method import_csv()
-update readme examples
-Add user friendly message when we can't override a test cassette
-Allow "warning" type protected ranges
-Improce README and documentation with value render options

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gspread_6.0.2.bb => python3-gspread_6.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-gspread/{python3-gspread_6.0.2.bb => python3-gspread_6.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.2.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.2.bb
rename to meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.0.bb
index 18338df93..482155856 100644
--- a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.2.bb
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/burnash/gspread"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
 
-SRC_URI[sha256sum] = "0982beeb07fa3ec4482a3aaa96ca13a1e6b427a0aca4058beab4cdc33c0cbb64"
+SRC_URI[sha256sum] = "576b72b628b251d2ee41e02b982d3c714d511d2a5aa3a88e587ed9efc4d6e752"
 
 RDEPENDS:${PN} = " \
 	python3-google-auth \
-- 
2.34.1


