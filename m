Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AB9C05023
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2760.1713318101038138639
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nMPe72dP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318104; x=1744854104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7y9CYFi7h0SANeITb6m0tHeRvimZ8mhElXAhCpnwkiQ=;
  b=nMPe72dPaa5g7bViGnwYhZnYDhsfwwICksW51iTQJzBjvw2M5rsBY8+o
   JaYm1UbxaSQG2YVMEjR4agQws9A1KbXmmL+mMq8pb4vG8frsikn9E8DrN
   AQ/TiQul2bR7dm8Be7tMm3JZGZxmiVx453s5SLpJ9GsGzbpYOAnQlzWv3
   ejSIkC5W6OUuZ5piaMAzhdjJ1x2dngFdCexnjhrUIMoTXvqa4dDgKZHOm
   nUsEQEQTHewtKzLOJGYk+GRnGURVQSgx8eADAoHQ5UjFhfPbzYD43aDPk
   BNY/8wyPqiJbAHYw6fhXwOR7tCwCdkBsBDYlN2ro+d1/WqLk6JKk8ESFQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155233220"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="155233220"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:43 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 07AE9E4EB2
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 435B0D419A
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A34802007473D
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 50D581A0002;
	Wed, 17 Apr 2024 09:41:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/49] python3-validators: upgrade 0.24.0 -> 0.28.0
Date: Wed, 17 Apr 2024 09:40:50 +0800
Message-Id: <1713318061-17128-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-2.450700-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mr1QQ6Jx/fflYryRXhUb8KbM2f
	h/Vuh6xFuLAgY17YzsR9I9P6UWwW+QDXcMDVC+xZKsurITpSv+OhmhSedX3bwpm3OIVSf4P5dqr
	zSDDO/UQkDQtLLEVgEWYEPX6QO+tzNazZgZY9vGsD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiAH/xyJs7whjQODanTO2mNLnHu4BcYSmtAUDqlLFoMeYCGfvnVpx+256ba
	/D5x6cp4vM1YF6AJbbCCfuIMF6xLSdET58jp62Sg753+DMoSafGHHEjxzdYo8ECp/hPY4/fslsU
	ElUmRtrIvrVg0gX+l8NQsmqe/gSWuOcPFmTLnh3Pb6Fg8BCbJ+vqxfpywEgMS7+RMq/2CK6rA4c
	7UV2fQpvi2PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110025

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-patch: moves country_code module to country module
        moves base58 and base64 into encoding
        adds encoding tests and docs
        supported extended latin in username
-feat:  adds indian aadhar and pan validator
        adds finance validator
        adds consider_tld parameter to domain, hostname and url modules
        lays foundation for URI validation
        adds private parameter to ip_address, hostname & url
        adds base58 and base64 validators
        adds basic cron validator
-fix:   regex ignore-case uses only a-z
        domain validation is now more consistent across rfcs
-maint: adds quick start docs
        updated dev dependencies, doc links; bump version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-validators_0.24.0.bb => python3-validators_0.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-validators_0.24.0.bb => python3-validators_0.28.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-validators_0.24.0.bb b/meta-python/recipes-devtools/python/python3-validators_0.28.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-validators_0.24.0.bb
rename to meta-python/recipes-devtools/python/python3-validators_0.28.0.bb
index 78261dd67..36444c0bf 100644
--- a/meta-python/recipes-devtools/python/python3-validators_0.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-validators_0.28.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-validators.github.io/validators"
 LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3fb4b9e6db86c69a33d5e3ee013ab59"
-SRC_URI[sha256sum] = "cd23defb36de42d14e7559cf0757f761bb46b10d9de2998e6ef805f769d859e3"
+SRC_URI[sha256sum] = "85bc82511f6ccd0800f4c15d8c0dc546c15e369640c5ea1f24349ba0b3b17815"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


