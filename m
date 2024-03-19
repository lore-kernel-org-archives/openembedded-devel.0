Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C613CC54E71
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:36 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8216.1710827194081913863
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gtF8ER09;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827194; x=1742363194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=by8Ub+9liznfm6SuLoKWvAafRVwYoBWhOXfeydeeRNY=;
  b=gtF8ER096R8uLXSnE8E+ubHgL5QiKKysKyR7UN2v0yIbANdRM0RPWcUO
   7OUh/3aQ/fmTwknw1Vrd7PIGNXVt/9J63FMwnf8aZRzkYrqCAElCQ1WOL
   jLMggzs/akj1E3nP7mmB/zFGuMlvqM0+lSaBv7u/uYSsXokxHSjTcHxgd
   VSVcKB5J2tnuGRnVGLoeBCNpxsgz4uvFaJKA15+Wo5OkvpjZAeHThDU9Y
   L5ogySY3+0RwFcI1W3I8v9FZYEAEdkQUvZ4GPCAhGwnI1nMy0fyIDT5/7
   ivMrCviPJIDdW8j68UaSYst4SABc78aFa3ekB/BuK9L/s5KN62Bo6wTHA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152964690"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152964690"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:31 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C55A2D4807
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id AEC26D4F5E
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C3AD21BD6E
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AA4341A006B;
	Tue, 19 Mar 2024 13:46:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/50] python3-bandit: upgrade 1.7.7 -> 1.7.8
Date: Tue, 19 Mar 2024 13:45:09 +0800
Message-Id: <1710827139-30056-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--9.155900-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrP9kI+hf1Euo7FaDt0Ph3eCUc
	tKY3q+DsX9t4w91/vrZyThzv+sjESaDxbPwrC/6fXvce4NdNhsJUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiCLoPmVUZHqkPQ+340hZDTG5MoGKfGX+6YA3qL69rXq4Gp0
	VGMd0huFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpI/NGWt0UYPAa4e2kvPw0ECy3l
	c/iynlIHALTR2ji31MJxwZvpO5KNyblKAjfk9pO
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109436

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Incorrect tag naming in readme
-Utilize PyPI's trusted publishing
-Bump sigstore/cosign-installer from 3.3.0 to 3.4.0
-Add 1.7.7 to versions of bug template
-Use datetime to avoid updating copyright year
-filter data is safe for tarfile extractall
-Bump docker/setup-buildx-action from 3.0.0 to 3.1.0
-[B605] Add functions that are vulnerable to shell injection
-Add a SARIF output formatter

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-bandit_1.7.7.bb => python3-bandit_1.7.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.7.7.bb => python3-bandit_1.7.8.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.7.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.8.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-bandit_1.7.7.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.8.bb
index 2de7fc7ae..8b0968857 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.7.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.8.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "527906bec6088cb499aae31bc962864b4e77569e9d529ee51df3a93b4b8ab28a"
+SRC_URI[sha256sum] = "36de50f720856ab24a24dbaa5fee2c66050ed97c1477e0a1159deab1775eab6b"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.34.1


