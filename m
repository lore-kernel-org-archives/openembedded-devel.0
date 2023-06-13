Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D466C7EE43
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:13 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.3860.1686620464802366055
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="99076310"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="99076310"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:41:02 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B198DC53CA
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id AF875D88A6
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 32BAE20079123;
	Tue, 13 Jun 2023 10:40:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pykickstart: upgrade 3.47 -> 3.48
Date: Tue, 13 Jun 2023 09:40:15 +0800
Message-Id: <1686620422-29962-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--2.245500-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrF430d3dMHkbrwoNVYOVcQIiL
	DMCX3SQ84CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0547KeTtOdjMy6GSY
	blrVFQLjzCD/uuhoCGX9d2vIGADJJXjASuXbGkhkgaafg6U60I+EpCHUsKYYGULHdr+lZw9rX7Q
	qxdrFbPuLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUEdsSzIZlMV1L+dD6V73K8V7u+
	nXUK61SEBeIb6s+7+J9ccZHDKKyyGYZ6Z7PlJDOss1m+roS9DcM4FNa+XWxAlSFD2aoaqVx7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103251

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
    displaymode: Update description to describe behavior
    network: Move new options to Fedora 39

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pykickstart_3.47.bb => python3-pykickstart_3.48.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.47.bb => python3-pykickstart_3.48.bb} (94%)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.47.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
similarity index 94%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.47.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
index 64a11ec8b..3c6c47832 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.47.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
            "
-SRCREV = "fa2f233f735a082dccaf03c234238f7d8ce93fa1"
+SRCREV = "fa6c80c0e5c6bee29d089899a10d26e6f7f8afd8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
-- 
2.34.1


