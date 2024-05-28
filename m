Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F0AC25B7E
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:50:59 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.12886.1716861050507058014
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F+xbKfJF;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861050; x=1748397050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Ljstv04bS3wAdG7LyU+aTdPNV74lFrwUzpIVpFwmVYE=;
  b=F+xbKfJFZo0qNMj+FWIIXAMM4k5RNbavNSeLu5EexBA0WM50YoNEghrh
   vS5YCwSkZH5xwFhNOnUusXxsTItPzPetzlI6tMMNN6fvyU3BDq7jAB9PN
   U1UDMY7/S8DWvC/jdGjP3FAJgeT+4pFwid5II7yPB6Z7NBbSgNF4Qnday
   Bjd318BgFO+717H8r44Rau3/09n1++C6JmJ1iGD2LDF7e1jwYVCH4WJkj
   dca6FdjmwcK0uMIOr82e7li4qu4hzmJyl+TPGat0wphc4EDXUHWQL2p3A
   VV020ryiRNCqsNkmNb+tK40RGrTqNDwDW47qgWNiZSA0IChWxlJpQe5ze
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="148492770"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="148492770"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:48 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AA82CA1E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id ACBFFD4F4F
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A3EF2007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EB4B51A000A;
	Tue, 28 May 2024 09:50:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/40] python3-validators: upgrade 0.28.1 -> 0.28.3
Date: Tue, 28 May 2024 09:48:13 +0800
Message-Id: <1716860901-863-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--2.258600-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytqTj+cW75OIAU7
	D3RRMlohMEiQlkRQZB3cyfM7nxF3TdGETJv1/WyOP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsFdF5UWZ5EPniCsqewnUZGA7Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq2EARKX5BSO11Zea10DAwieFwa0minW1NR/DYHVsw25AJy95
	0waK53hhaktGKVIl0u2U6/1OrMbybqEBBkIS7yqmrUlcueXT2cdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110567

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- hotfix: ensure _tld.txt is in sdist and bdist
- fix: corrects a few typo
- build(deps): bump jinja2 from 3.1.3 to 3.1.4 in /package
- fix(ip_address): properly handle private is false
- chore(url): allow symbols and pictographs in url
- build(deps): bump requests from 2.31.0 to 2.32.0 in /package
- chore: fix typo; update dev deps; bump version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-validators_0.28.1.bb => python3-validators_0.28.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-validators_0.28.1.bb => python3-validators_0.28.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-validators_0.28.1.bb b/meta-python/recipes-devtools/python/python3-validators_0.28.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-validators_0.28.1.bb
rename to meta-python/recipes-devtools/python/python3-validators_0.28.3.bb
index 7666ae7d4..a132d74eb 100644
--- a/meta-python/recipes-devtools/python/python3-validators_0.28.1.bb
+++ b/meta-python/recipes-devtools/python/python3-validators_0.28.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-validators.github.io/validators"
 LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3fb4b9e6db86c69a33d5e3ee013ab59"
-SRC_URI[sha256sum] = "5ac88e7916c3405f0ce38ac2ac82a477fcf4d90dbbeddd04c8193171fc17f7dc"
+SRC_URI[sha256sum] = "c6c79840bcde9ba77b19f6218f7738188115e27830cbaff43264bc4ed24c429d"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


