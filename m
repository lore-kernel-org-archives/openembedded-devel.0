Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B758AC28B28
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2309.1740525906084199151
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eVSdV9uw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525906; x=1772061906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PhzktrlY+B/eE7kgpsC6H8khB29R5NaPRglZKDm7SH0=;
  b=eVSdV9uw7EaThqo+QyVChzpjCgmeRFEOaCpMJspIjo/tueo88Di9VarM
   H055tyU5sQEHl4aZcieAEfGCuYE4cJBc9p1PW2mf8iekAlhtJmKiQcDMQ
   ogVA2Cm9xGEQJbMNuyVX1p7ZLr0Zn6Eu3InK9fYC4ziHY+/rsw0645VoT
   1dFyCVjj3hq12YOxV0oFkTQ40ET14NpJn8UPToj9BX4D8+KZh2nwN4+3j
   JheBD5mShuWBEU6rGz4vjmR8KlTN6TX0uND2X2IsF/ta390hh/rA9wNka
   PlaJ3WZm7MRxhSG3JtqI5XKrYPMlv7xJEsqIofOiELWJicJurmvXvNi+q
   A==;
X-CSE-ConnectionGUID: Tn1HhNIRTNqWKSgPRQKMmg==
X-CSE-MsgGUID: PA0FB+TmTx2T2kJaJP6OSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191180234"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191180234"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:04 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E824CD4807
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B144DD8B3C
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:01 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 555BC1A0073;
	Wed, 26 Feb 2025 07:25:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 45/51] python3-tzlocal: upgrade 5.2 -> 5.3
Date: Wed, 26 Feb 2025 07:24:35 +0800
Message-Id: <1740525881-21103-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115646

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Now supports Python 3.9 to 3.13, and no longer requires backports.zoneinfo.
- Debian is for some reason removing support for /etc/timezone, which is bad,
  because that's the only place where the timezone is stated in plain text,
  and what's worse, they don't delete it. So we can't trust it now,
  so when we have multiple configs, we are forced to just ignore it.
- Attempts to return a ZoneInfo object also for UTC.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tzlocal_5.2.bb => python3-tzlocal_5.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_5.2.bb => python3-tzlocal_5.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_5.2.bb b/meta-python/recipes-devtools/python/python3-tzlocal_5.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-tzlocal_5.2.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_5.3.bb
index da58964f2c..eaa80e83f7 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_5.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[sha256sum] = "8d399205578f1a9342816409cc1e46a93ebd5755e39ea2d85334bea911bf0e6e"
+SRC_URI[sha256sum] = "2fafbfc07e9d8b49ade18f898d6bcd37ae88ce3ad6486842a2e4f03af68323d2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


