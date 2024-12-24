Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA8FC0218B
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.30362.1735032443247103847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B01h8jB9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032443; x=1766568443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=q2wGvXeupqFWdQ77neZq+vYcLRKJdbeDLoAosgg1EcE=;
  b=B01h8jB9LnZ0ZN3I3IDaOoCZrVF34AxS/n2WNkJfC4ou8YYYE8ld6PJg
   8bO5LYfEVgEAY6z6fFsxuICT96cTjNJokVftZCR4Abf6mWyZeN+mS3j/Z
   k4r66s+w/wV9V3Mvj51Bb9PLUiGSUlt4Q2jVDIjya9hEUGd5Ale1YUBj0
   ojacQrd9IYz56Dzf5QVyBPOaGXp2z6HxplQ8AwsNO0Z/2OgoUFGQTU1Kj
   Jwvi9RjFqnYUbZXFSfA9hYAepsCvbHakWmLyw87QWiLGzGl+kmMeZACSL
   t+o2tUJthMLO5/oIYzYyXHOKXHSOyj83hyvTgFGX/E06tt2znlOu88CIm
   Q==;
X-CSE-ConnectionGUID: 0N76cgh8Rf6R3wYLFGQ82A==
X-CSE-MsgGUID: 76pkrFF1Q36NR6jq4z2vFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="187212817"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="187212817"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:21 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E3CC6D6EA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B6691D5096
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 453876BB6B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E05B61A0071;
	Tue, 24 Dec 2024 17:27:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/67] python3-elementpath: upgrade 4.6.0 -> 4.7.0
Date: Tue, 24 Dec 2024 17:26:14 +0800
Message-Id: <1735032421-13513-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-1.132600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNTfc2Xd6VJ+ynlf
	v8gL3Qie4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz8C02E14aIwYkcg
	Hhxyyi7k8+ZlWRXwEAf+p83CtH/M8iXitU3JYcovEt75W61wVPk6Jc8JeF9KAJDd2d7VCLD3jJh
	8Bs1PpYiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114495

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix fragment argument usage
- Fix constructors nud() to skip argument check with XP31+ arrow operator

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_4.6.0.bb => python3-elementpath_4.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.6.0.bb => python3-elementpath_4.7.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.6.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.7.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-elementpath_4.6.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_4.7.0.bb
index e4bb375a6f..2a9eb43b5e 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "ba46bf07f66774927727ade55022b6c435fac06b2523cb3cd7689a1884d33468"
+SRC_URI[sha256sum] = "a2029dc8752fcfec49663d1ed1b412c6daf278c0c91938f50f63c4fe9ed1848e"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.43.0


