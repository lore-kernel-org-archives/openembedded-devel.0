Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCECCF64A7
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:59 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.49302.1727682229491166126
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CthBQYLx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682229; x=1759218229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XLoNSYJ7Ws7VhzyUTEhntRIDNq+bJ8ofApCVbmqTs4g=;
  b=CthBQYLxJHrDZni8svyi9ZfFDoVfDBiTGsWuJDObFUJ3dNUA0z9Bh2NL
   0DW6FKSQmzpm9DcY69HZBh0n0bnt48D72sDlQRCM0Cq4fEYfOGerpIkwy
   EuNHKeIFtT6zPQdOuB/OivyTZ/kjPuFndqTeHBks5P7P5d6vmFBGRxmpi
   fAmnjT5+IPqSjblMG/OTy3Js0pj5h631CBnxvGCZevZfyWLGggluVreq9
   c2uKDg73NjPV6geB8rdaIwFdAElUKBvi8KI8mWj0a07+X1vwKkIHWJ32v
   1xQ62wxe9itb0D1g49RhHWZRVigFnlrIl0ZzUVD/t0Z5D6CVCi5KKnxwf
   A==;
X-CSE-ConnectionGUID: 8MsgQxwNRD2kDKDWZyqtAw==
X-CSE-MsgGUID: DXCMtHa1Rg6l79Fa6FFalg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="162602052"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="162602052"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:38 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 86547D9223
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C7884D4C22
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BC3F20076D01
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0E9161A000A;
	Mon, 30 Sep 2024 15:43:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/40] python3-bandit: upgrade 1.7.9 -> 1.7.10
Date: Mon, 30 Sep 2024 15:42:41 +0800
Message-Id: <1727682185-12664-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--12.995200-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeXdtCoZAk3E1HMW
	fmr8UEU8tYdwot7bS61A5iDnkKnrwTbcsMCH+ZLF6nHbeBu5LnkL//VMxXlyE67k1ZZu42Uxs0N
	FiGcEQFTgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZbAhyNooL6qJDnD
	ViONoWPuyz2v/93Du3BhQWw3lZ+IWXBXaJoB9JZxRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7lMOF
	5bmqSFUy55qtvzBjxGmJPaLcdj+F8qzMkfNE/+jSwwcGKLTYEc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112580

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Bump docker/build-push-action from 5.4.0 to 6.0.0
- Suggested small refactors in assignments
- Performance improvement in blacklist function
- Add test for usage of FTP_TLS
- New check: B113: TrojanSource - Bidirectional control characters
- Bump docker/build-push-action from 6.0.0 to 6.1.0
- feat(plugins): add support for httpx in B113
- Nit: remove unused variable
- Add recent releases to version choice in bug report
- Bump docker/build-push-action from 6.1.0 to 6.2.0
- Bump docker/build-push-action from 6.2.0 to 6.3.0
- Bump docker/setup-buildx-action from 3.3.0 to 3.4.0
- Bump docker/setup-buildx-action from 3.4.0 to 3.5.0
- Bump docker/login-action from 3.2.0 to 3.3.0
- Bump docker/build-push-action from 6.3.0 to 6.5.0
- Bump docker/setup-buildx-action from 3.5.0 to 3.6.1
- Bump docker/build-push-action from 6.5.0 to 6.6.1
- Bump sigstore/cosign-installer from 3.5.0 to 3.6.0
- Bump docker/build-push-action from 6.6.1 to 6.7.0
- Use consistent file naming of docs
- Pytorch Load / Save Plugin

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bandit_1.7.9.bb => python3-bandit_1.7.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.7.9.bb => python3-bandit_1.7.10.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.9.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.10.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-bandit_1.7.9.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.10.bb
index 730bf116a..8e88d8c7c 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.9.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.10.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "7c395a436743018f7be0a4cbb0a4ea9b902b6d87264ddecf8cfdc73b4f78ff61"
+SRC_URI[sha256sum] = "59ed5caf5d92b6ada4bf65bc6437feea4a9da1093384445fed4d472acc6cff7b"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.34.1


