Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB64D4400B
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.37263.1731922210075530382
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Vt756PA4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922216; x=1763458216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eRSCr8jyaZI4LPV0N/4W0Ffi2/fTxkhJWQruyXtL1KE=;
  b=Vt756PA4/Pk9cwC6anhqGuL6U29Ml6Hy+mR1h8StWj+cv9cSFZMeMjYq
   kfkNeb141z6gwcSiQ7DOgzwk+WXfmla0GpqxSEz2qz3ZleXNcQXzPRKzL
   awrZH/k08qGTGB+GQxUXtJABtu1ZzaVIXuGN+OBLXGlmYyoF+Uy+p9GeX
   D9G9+Sz2WSkCOetjLRSF/NaXf5rFFRpliRIYE+A/0pZ4/SJlGjrhvmUYG
   FVItUsaEMfCWxS5IBXiE5m5UIt7oSfS9bMXvbLBInZo/+E2A9QHzawFDt
   QNdGEUuLVmNdzn+e6BKjUKMvK1cMHxCnsy6xBmUoHnhVL5m2lYFSdQS8f
   Q==;
X-CSE-ConnectionGUID: Exq2ykaqQoC+BLVQQbX6Aw==
X-CSE-MsgGUID: btN93KBYQoyQw/kNs1+ERg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="183056078"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="183056078"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:14 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 13D0DC2264
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A7B72E1437
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 47C8821FD4B
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:11 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EC9741A000B;
	Mon, 18 Nov 2024 17:30:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/32] python3-flask: upgrade 3.0.3 -> 3.1.0
Date: Mon, 18 Nov 2024 17:29:39 +0800
Message-Id: <1731922195-5266-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--8.517600-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrGeIujupKDm97c1y+5T8A/zS+
	qyWWTWMNQ/tGE+4brAxcASOyk4nfAF8Yz3qXeZyCHWRJEfGP5nk/xRB6OGnb2mfIvzHS0qU7WQh
	PPzYpzgD68qduCW2JnBItqQ/criE6XDuQQezAgFWqFx2c/3V5cZmYsOd3akjfOhR0VsdhRrBj1N
	Rb0c1HbavWMqbRJSuXUY4KBBzkMM4S5iXdhf8hbj9B1SHosSXQN5dqZcIK7Vgg9R3V8qg5xL8FH
	rw7frlurwUHN2woBLC5zZ5o3swkHrT5k413CvlTngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIfiAq
	rjYtFiSOv+vQvh8CIAJ1VS46QZRhDnG7vz1zE22vYGX2b9K80H7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113881

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- Drop support for Python 3.8.
- Update minimum dependency versions to latest feature releases.
  Werkzeug >= 3.1, ItsDangerous >= 2.2, Blinker >= 1.9.
- Provide a configuration option to control automatic option responses.
- Flask.open_resource/open_instance_resource and Blueprint.open_resource take an
  encoding parameter to use when opening in text mode. It defaults to utf-8.
- Request.max_content_length can be customized per-request instead of only
  through the MAX_CONTENT_LENGTH config. Added MAX_FORM_MEMORY_SIZE and
  MAX_FORM_PARTS config. Added documentation about resource limits to the security page.
- Add support for the Partitioned cookie attribute (CHIPS), with the
  SESSION_COOKIE_PARTITIONED config.
- -e path takes precedence over default .env and .flaskenv files. load_dotenv
  loads default files in addition to a path unless load_defaults=False is passed.
- Support key rotation with the SECRET_KEY_FALLBACKS config, a list of old secret
  keys that can still be used for unsigning. Extensions will need to add support.
- Fix how setting host_matching=True or subdomain_matching=False interacts with
  SERVER_NAME. Setting SERVER_NAME no longer restricts requests to only that domain.
- Request.trusted_hosts is checked during routing, and can be set through the TRUSTED_HOSTS config.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-flask_3.0.3.bb => python3-flask_3.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_3.0.3.bb => python3-flask_3.1.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.0.3.bb b/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-flask_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
index de755dc29..f1b18b075 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.1.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "ceb27b0af3823ea2737928a4d99d125a06175b8512c445cbd9a9ce200ef76842"
+SRC_URI[sha256sum] = "5f873c5184c897c8d9d1b05df1e3d01b14910ce69607a117bd3277098a5836ac"
 
 SRC_URI += " \
         file://run-ptest \
-- 
2.34.1


