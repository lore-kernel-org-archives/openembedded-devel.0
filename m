Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34B3CD129C
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:54 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.39488.1711983109308055610
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gj2jeNjr;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983110; x=1743519110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5NNnWX+zdzMka7R3ZKIzq3Kjf/GA1Jm96yB6l+rb+40=;
  b=gj2jeNjrMqg+Whdmbl380yCd+4fHPFWWJXv80S2aGTS6TPXujCNXl9GQ
   hlkE6apUDQ3jEm2nRB1QT+DVpCw6C2guWEbqce3+31tqZqlrku21ILoWS
   M5skthvXJ85xoWBa7OjwefBooXW4EhbFfBzPVeKuqYq/ht8+RjNhflrAC
   o6m7biyqXXeZ4dhbO/E2Mdtacqs7g4t4UYYxd4ezPYVd//C6Gmwq498D9
   5lpdL8w1SqupQpXWBPtm4lURPyVKuGI1nqYGiI6s2/3oW6vVsKKOoM+47
   dkeifI+fKM0tIafy1j0Rc3ly2koVcQdCHGIWfdFNagAAI6ZxvGu2GwvWp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="141867305"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="141867305"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:47 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 89006D4800
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BA998BF3C3
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DE3BC40FF7
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 956731A000A;
	Mon,  1 Apr 2024 22:51:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/47] python3-pytest-cov: upgrade 4.1.0 -> 5.0.0
Date: Mon,  1 Apr 2024 22:51:02 +0800
Message-Id: <1711983079-16849-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-0.882600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrMVx/3ZYby7+/UKSk38cGDIyG
	8V1UOe4O5/gG8CUYdisNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w59Go
	VYq/J7qCHNJPCXCc2e3TUqQ8zgE/u4z6U7LZtTKl/uQFt7e3vYd2QoiRzWAseOJEinHms8a0yXS
	Mts6daBxH4Hi8e2HLKCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109761

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Removed support for xdist rsync (now deprecated)
-Switched docs theme to Furo.
-Various legacy Python cleanup and CI improvements.
-Added a pyproject.toml example in the docs.
-Modernized project's pre-commit hooks to use ruff.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pytest-cov_4.1.0.bb => python3-pytest-cov_5.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-cov_4.1.0.bb => python3-pytest-cov_5.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_5.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-cov_5.0.0.bb
index 0be97e5c4..e3e4affb9 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_5.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=cbc4e25353c748c817db2daffe605e43 \
 "
 
-SRC_URI[sha256sum] = "3904b13dfbfec47f003b8e77fd5b589cd11904a21ddf1ab38a64f204d6a10ef6"
+SRC_URI[sha256sum] = "5837b58e9f6ebd335b0f8060eecce69b662415b16dc503883a02f45dfeb14857"
 
 inherit pypi setuptools3
 
-- 
2.34.1


