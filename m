Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8CBC54722
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2878.1722934011958228024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F+ngzKMl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934025; x=1754470025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jVqL6FbOqbqAsVAp6iDcdt0aFhkocmtY7VgNnOyHecw=;
  b=F+ngzKMlCXF5PpCferNp4BwV4o22gqFD7kuLuwM7FNrh5z8MH3x+zCDk
   DYsrW2/z81zatL4dJJzWwoe6oXhWZiR+xnwGSU3+0X29pTQK+ZhHkou6q
   UUkBT1PNAdpR4k7QRvl2xnvEWkshhc/CHolKxtZqC3CZg9tVsichKZwmh
   Aqry0ZMbyrAvTksJ8flHiviDiFEJuq3fkLnODWhMUMldq4UNGdvxLjvRo
   C8nhDyQ2mZ6n7Ze8J/Sr+ABniO86hemK6MrvQNf+Bw0NjshRQA8F+NWn8
   WuJIAOtwR4sMucGTHlcd5DF2goN2OHDZXOlLrdCClYjuVSMYIBGqW2WfK
   w==;
X-CSE-ConnectionGUID: 6q6aZDuuTvWatxZghdrMMw==
X-CSE-MsgGUID: 5jXenjTiS7mI08qd4EN2DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169971750"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169971750"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:04 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 27CD4D424F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7607CD8B01
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 13DF6E5A19
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B70001A0002;
	Tue,  6 Aug 2024 16:46:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 47/60] python3-redis: upgrade 5.0.7 -> 5.0.8
Date: Tue,  6 Aug 2024 16:46:21 +0800
Message-Id: <1722933994-32549-47-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--0.890200-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZsZaZ5UBQsof1q+x7zkhJWvNT8t3CAjYUo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJm57sYhc1l+7g/WVn3QhmTKoAcsrJt7DitvU
	1Ql2ukYsgX685Ge/wOYhBbVAic1/LP4U7g72K8/RQVq/hBKXGFIkTiCasV41H+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111560

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_5.0.7.bb => python3-redis_5.0.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_5.0.7.bb => python3-redis_5.0.8.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_5.0.7.bb b/meta-python/recipes-devtools/python/python3-redis_5.0.8.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-redis_5.0.7.bb
rename to meta-python/recipes-devtools/python/python3-redis_5.0.8.bb
index 950200ec5..1dddd04bc 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_5.0.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 # Prefix archive to avoid clashing with the main redis archives
 PYPI_ARCHIVE_NAME_PREFIX="pypi-"
 
-SRC_URI[sha256sum] = "8f611490b93c8109b50adc317b31bfd84fff31def3475b92e7e80bf39f48175b"
+SRC_URI[sha256sum] = "0c5b10d387568dfe0698c6fad6615750c24170e548ca2deac10c649d463e9870"
 
 inherit pypi setuptools3
 
-- 
2.34.1


