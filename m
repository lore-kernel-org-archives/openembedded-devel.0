Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97464ECE58D
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.18329.1725959003028888389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J4duH2gd;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959010; x=1757495010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8WzaamlBG94pnV5qYYD8ft9J0hzmbHjdK+JFmPFznsk=;
  b=J4duH2gdJs4VIELKZXdBKkz8wACQcpK8R9OsRUN4ZnULzfgfuyn9jpUK
   vJMCrjS8TdgY68o+tmI1iCFXmh2zPPCqrj5L33AhylmR9mfIR2PcHcv7p
   7ZqUtHKO7RUExOgvZUKHyPQOeZ+dd9YqPXRaAKxojkyzv1+HHTjWIxSER
   7vK5xrlAUQ21byxzm1QRu1QYd4322adEpjaWUMfur+F0oFlGkNa8ibNhb
   5SlOSaxJ0fxvX7HMGcDg81eE+8dnFbwX6ovJMLpZX7KvVj/8Bvul387Xy
   1LCe0+Nr3ce5VESf3JWIOA0u70Z7w6YGldO6rGuVnFQhTW4ZQoxkDrUWR
   A==;
X-CSE-ConnectionGUID: UV885EgvT0GoZWnJMrFE8A==
X-CSE-MsgGUID: ptzOlHkUQMqQWCdZH5iewQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="172474629"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="172474629"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C7C8D424D
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6AE37BF49E
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E2FC1200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 94C9A1A000B;
	Tue, 10 Sep 2024 17:03:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/42] python3-filelock: upgrade 3.15.4 -> 3.16.0
Date: Tue, 10 Sep 2024 17:02:47 +0800
Message-Id: <1725958990-5719-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--1.254300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mra9qiaDSLgo3uebKrFNJkRb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AGAD6h6FZmEV42zm1Zi+MJ1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz9DK4+IecqmsY0E
	bd70nj7jLlYFrKDUKODRln9Vu1RTxsDnmmSfqWsaDjjqj2dL67Gq2j9EAVhCxJmtR9Uqee/6xc+
	L/AR5RziB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112204

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Test Python 3.13
- Add 3.13 to CI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.15.4.bb => python3-filelock_3.16.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.15.4.bb => python3-filelock_3.16.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.15.4.bb b/meta-python/recipes-devtools/python/python3-filelock_3.16.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-filelock_3.15.4.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.16.0.bb
index 0f5cd4d9d..0aac54a15 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.15.4.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.16.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "2207938cbc1844345cb01a5a95524dae30f0ce089eba5b00378295a17e3e90cb"
+SRC_URI[sha256sum] = "81de9eb8453c769b63369f87f11131a7ab04e367f8d97ad39dc230daa07e3bec"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


