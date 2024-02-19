Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD092C54793
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.37570.1708333369144538081
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iTt0mPXJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333370; x=1739869370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GabnUEuKVS/Lg3tEilhgULzBJmfDu2lnuTaDg++386o=;
  b=iTt0mPXJnilzJdF2mMv4MV/kvsgywukyT85fohOuWzsOc5JFlvzNwoan
   MsOvOJYxSaH+m2fJmV4yiuArirTldiTgFrtaML7EvUnB4EEarnze6YLaL
   t8AJF5M/zsHYsZNVfjERs7oayGGVCGSp+69Fd5Db3O0BhLDMiNP9hEHhv
   PwJAxbDf46ysqch2vQEW/M9XyC4zJbok3Vo5L+JAtb1Gb3VNcK8y0kbnx
   oYGYXxuexsbHGQdj9weMXtbIpsxxYTPnaXE/rZ20IgwbohftPHhEf9p6O
   Y0KtnwWJmZUGly+odgdi17YdbT1QhOOQxJzWOlbiVkOuLLAC+NfuoItWA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="149230108"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="149230108"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:47 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 952AFD4803
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:44 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C05AED3DF6
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 35AC4202DFF43
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D950E1A006B;
	Mon, 19 Feb 2024 17:02:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/23] python3-bidict: upgrade 0.22.1 -> 0.23.0
Date: Mon, 19 Feb 2024 17:02:19 +0800
Message-Id: <1708333346-17704-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10--3.711600-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yXg2y0j5vXZGlEDhvi2wR85fv9SYkzU9kVzc
	N74oAfwJFpv4ALYwnezZ+KWHmPMJhWrs+r6+nS7O2Sa33ZGXWdZxXefgn/TNQ0z5vzLEGq8DybH
	Yg2T9d7Kn66IuTgfJkQ3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXkZQXc2Em7eLgmD
	ggHbhQ6FjkSH9LOiJWdWB/qIY8AgB4HMSQIKmdGW9OepgphdNGVeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDWowPTCbnblA3xxx3Hunm1/JViPIczsBC4C+Oi0kxzyczGbJwukI+xddDcG
	qxhOjhBKtTCifdB5eeRGK0oZAdFTHsVBXxV04EbXLUmqx52PxFPJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108861

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024

Changelog:
============
-Drop support for Python 3.7, which reached end of life on 2023-06-27, and take
 advantage of features available in Python 3.8+.
-Remove FrozenOrderedBidict now that Python 3.7 is no longer supported.
-Remove namedbidict due to low usage.
-Remove the kv field of OnDup which specified the OnDupAction to take in the
 case of Key and Value Duplication.
-Improve type hints for the inv shortcut alias for inverse.
-Fix a bug where calls like bidict(None), bi.update(False)
-All __init__(), update(), and related methods now handle SupportsKeysAndGetItem
 objects that are not Mappings the same way that MutableMapping.update() does,
 before falling back to handling the provided object as an iterable of pairs.
-The repr() of ordered bidicts now matches that of regular bidicts
-This tracks with the change to collections.OrderedDict's repr() in Python 3.12.
-Test with Python 3.12 in CI.
-Drop use of Trove classifiers that declare support for specific Python versions
 in package metadata.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bidict_0.22.1.bb => python3-bidict_0.23.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bidict_0.22.1.bb => python3-bidict_0.23.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-bidict_0.22.1.bb b/meta-python/recipes-devtools/python/python3-bidict_0.23.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-bidict_0.22.1.bb
rename to meta-python/recipes-devtools/python/python3-bidict_0.23.0.bb
index 1ed0af81a..5667e4927 100644
--- a/meta-python/recipes-devtools/python/python3-bidict_0.22.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bidict_0.23.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "The bidirectional mapping library for Python."
 DESCRIPTION = "The bidirectional mapping library for Python."
 HOMEPAGE = "https://bidict.readthedocs.io/"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=858e74278ef3830d46481172ae03c819"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e907308cc9356afa99ac0eec6b20211b"
 
-SRC_URI[sha256sum] = "1e0f7f74e4860e6d0943a05d4134c63a2fad86f3d4732fb265bd79e4e856d81d"
+SRC_URI[sha256sum] = "3959ca59d4d6997702d642bf1e5fd93cba299863723fc289545198f70c468578"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


