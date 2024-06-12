Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53EBC2BD05
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.2433.1718161120283734111
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I+q9X2KR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161120; x=1749697120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=k5xMOu/SHyZar9RGZD0PU/LRVmvn1vmhSsa4Qfxd8yM=;
  b=I+q9X2KRIpE+d95sCh4hl5PDfZW0OH33gD9VgJycOZbfooieA+mK30Bh
   hlD/hREERfFNV/7K6MYxGRxqVST7uiC1NbbmrXEEEXr2gGrcRue+fMJBu
   Ddqcf+K6UO0THVz2ebsye85vGiaaS7jdepbsObEv86PaqjUzhJG5TBucx
   ikwAAqTd4kJnW21CK0S7KLdd+Qidqh/5cpiV7WLPlnx9MVr/u3kJ9lXgd
   m1MghedaAA3YI6Goi6dach4lIAASTbByXQ0BYnK1McT4fiZR4bQWSxQTl
   u/CPNaEkF2szBgQ7wJCJrFIy77b7fuHm7tSG8wGrLC1rxoQTyeI2Ax9+h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162766201"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162766201"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:38 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CDFC5D6EEF
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2715CD50E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A5BCA20071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 530411A0002;
	Wed, 12 Jun 2024 10:58:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 06/43] python3-email-validator: upgrade 2.1.0 -> 2.1.1
Date: Wed, 12 Jun 2024 10:57:39 +0800
Message-Id: <1718161096-29710-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-2.703100-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhKb99LaADG+i4X
	epmu1hPL4ZFaJEETItUyNCoZMgfGSz13WcdbGR6Q9x3r/GuhvycxVUWGXs3C8y99T+uJIleRThV
	BZmdE2ZNgS5OQQFvxzwnSzRYua45Af0ldgFoF/O78dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5APn4
	RjXbQDehab+AC2MJ3sBhQWw3lZ+IWXBXaJoB9JZxRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs/Vfq
	qPH5AF6lgw48tnIJt+BIn5QUJOhg6im5AsNxzwAIiBlz6mzLOdVD/ejcKOFyCa2zpZcYRYlRhZy
	dtFdQIPh6WeeVju5fIgeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110844

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed typo 'marking' instead of 'marketing' in case-insensitive mailbox name list.
- When DNS-based deliverability checks fail, in some cases exceptions are now
  thrown with raise ... from for better nested exception tracking.
- Fixed tests to work when no local resolver can be configured.
- This project is now licensed under the Unlicense (instead of CC0).
- Minor improvements to tests.
- Minor improvements to code style.

License-Update: Relicense under the Unlicense (instead of CC0)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...il-validator_2.1.0.bb => python3-email-validator_2.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-email-validator_2.1.0.bb => python3-email-validator_2.1.1.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-email-validator_2.1.0.bb b/meta-python/recipes-devtools/python/python3-email-validator_2.1.1.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-email-validator_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-email-validator_2.1.1.bb
index 7daf548cb..90a22e5a0 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-email-validator_2.1.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A robust email address syntax and deliverability validation library."
 SECTION = "devel/python"
 LICENSE = "CC0-1.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2890aee62bd2a4c3197e2059016a397e"
 
-SRC_URI[sha256sum] = "5f511cca8856bb03251d6292ba59e7f98978aae13fa5823ddd8bf885c56a6260"
+SRC_URI[sha256sum] = "200a70680ba08904be6d1eef729205cc0d687634399a5924d842533efb824b84"
 
 PYPI_PACKAGE = "email_validator"
 
-- 
2.34.1


