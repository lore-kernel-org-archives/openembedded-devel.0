Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D19C3065E
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:15 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.166859.1719305835097827565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qoYvRveY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305835; x=1750841835;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2DA1T078qSE+LHrThKKfiH2ZD0xYRVwnJA3+vxCGlNo=;
  b=qoYvRveYjuTXTwesyAEpVNSR0Uqmf07LuDOcE8CbrFblag77GHO51Z8t
   rpdRMdJd/MfaGydFKFTYZhD/qLPDejfev9vZU6CSDvFzkjclo91BsbwZG
   dO/rNUpTw3MSUhyr+PzdsOjk5bkgh9AY5CfKN8Ty/Lu8QTZYY7rxbJM79
   vBNRZhaQX+5FPtCmGIv7Zxjt0nfXvq8ptJeeazn1BdbaR4yx4d7QsESFD
   iLEwOQOpuRIig85/cV7smPAI4WpwG7G6PGEIvPpwzK5FicODW+Oa+tSXf
   beWMOzPMofiumNCB7A0Ltm5VfmDKaklIXINBkyWwVmnLWnhoq/e54gbcV
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164869282"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164869282"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:13 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 16BDAD4F54
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 58FF8D50E8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C9B642007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 77C5A1A0002;
	Tue, 25 Jun 2024 16:57:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/57] python3-coverage: upgrade 7.5.3 -> 7.5.4
Date: Tue, 25 Jun 2024 16:55:58 +0800
Message-Id: <1719305790-11484-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--2.184400-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrSuH+GfgmQGc1Y73PdzvXZCJ1
	YT6M2y/pYH0mpZBdYeiRloiW1KgftY0BNOD/HJdhBe3KRVyu+k2Dd2tqN5JYyZ92gVMVQbFcHxT
	j6p8/MuzgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJRSLgSFq3TnjEd+K6O5Nt52U1x
	ZnvXfsKIGQRIwjTl3i64sVlliWKx8fE8yM4pjsD7q9UFRTJ0kKxEHRux+uk8hxKpvEGAbTDj2BB
	hzOjk1hmfMxXJVlFRFheCvgPPb2RkkM8fGCL6VE8rF8wAHq1tTw49aHRb/usT/FzpaP8oJN4b8+
	Ghs/qXijBZm6AFjvWoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111038

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- If you attempt to combine statement coverage data with branch coverage data,
  coverage.py used to fail with the message "Can't combine arc data with line
  data" or its reverse, "Can't combine line data with arc data." These messages
  used internal terminology, making it hard for people to understand the problem.
  They are now changed to mention "branch coverage data" and "statement coverage data."
- Fixed a minor branch coverage problem with wildcard match/case cases using names or guard clauses.
- Started testing on 3.13 free-threading (nogil) builds of Python. I'm not claiming full support yet.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.5.3.bb => python3-coverage_7.5.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.5.3.bb => python3-coverage_7.5.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.5.3.bb b/meta-python/recipes-devtools/python/python3-coverage_7.5.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.5.3.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.5.4.bb
index 0df341c54..559639564 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.5.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "04aefca5190d1dc7a53a4c1a5a7f8568811306d7a8ee231c42fb69215571944f"
+SRC_URI[sha256sum] = "a44963520b069e12789d0faea4e9fdb1e410cdc4aab89d94f7f55cbb7fef0353"
 
 inherit pypi setuptools3
 
-- 
2.34.1


