Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C904C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:03:26 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.2557.1700121798514484887
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="139896390"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="139896390"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:03:16 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D2437C137D
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:03:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 098DFD53F3
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:03:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D40420079110;
	Thu, 16 Nov 2023 17:03:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-hexbytes: upgrade 0.3.1 -> 1.0.0
Date: Thu, 16 Nov 2023 16:01:23 +0800
Message-Id: <1700121683-21697-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10--3.139800-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yXg2y0j5vXZGlEDhvi2wR84H4DTIEE89jJlA
	4IpB7gNOMM7ggQulqpWoRfmzONNsP3uK0oT3XHU2Ur3GVI65GhbkwFzTzcgzhLBm7KRKfr78rXQ
	H/9nG/EwkS9E5bfAeGz99VB5jVzZoEuYl3YX/IW4/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bq8FBzdsKASwHyjPkE/KyqTc+HB+YVvemDsKXyzHgcEbrixttRG+E/OBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrfJNJS9T9PCn7UyFsOZDh8Zr9oOioi11gAjxc6RmoGEKE4xc
	sWw/YzYDT0UHTrmHqwfFZwCwubwP3uJtC7Se2pWvL56godSzth0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106781

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
=============
-Move HexBytes prepend of 0x from hex method to __repr__ to not break hex of
 parent bytes class
-Drop python 3.7 support
-Added missing build dependency.
-Add build.os config for readthedocs
-Change to using pre-commit to manage linting tools
-Merge project template updates and bump mypy to v1.5.1
-Merge template - .gitignore updates and other fixes
-Merge template updates, including additional linting, move most lint config to
 pyproject.toml

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-hexbytes_0.3.1.bb => python3-hexbytes_1.0.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-hexbytes_0.3.1.bb => python3-hexbytes_1.0.0.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-hexbytes_0.3.1.bb b/meta-python/recipes-devtools/python/python3-hexbytes_1.0.0.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-hexbytes_0.3.1.bb
rename to meta-python/recipes-devtools/python/python3-hexbytes_1.0.0.bb
index 19b5813ad..951998b5a 100644
--- a/meta-python/recipes-devtools/python/python3-hexbytes_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-hexbytes_1.0.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "Python bytes subclass that decodes hex, with a readable console outpu
 HOMEPAGE = "https://github.com/ethereum/hexbytes"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=16ffc86adf4293d4cfb204e77d62cfe6"
 
-SRC_URI[sha256sum] = "a3fe35c6831ee8fafd048c4c086b986075fc14fd46258fa24ecb8d65745f9a9d"
+SRC_URI[sha256sum] = "18e6e3279a13878b93fb85da77822dc506b7048065a588e74141c2468a65ad8c"
 
 inherit pypi setuptools3
-- 
2.34.1


