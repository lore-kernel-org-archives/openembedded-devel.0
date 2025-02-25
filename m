Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EE2C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2300.1740525899545131700
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Yd3Ay/ua;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525901; x=1772061901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QlzbPgjESa7ngEqWc2VXBmmyl84xnYb4bVQn3Mgztsk=;
  b=Yd3Ay/uaqeWtzU5QUVtXP17Op5ksDyrmWdcToSWB9vWjlGHPrhx9lPRQ
   KXxvCiuvPzcgf+l0sLMhPKkoY78NrYnOLdLIzSPGohjuzv0kwfy3C/naD
   ++8WtF9sKEVL4olAvhZzAogVUUlyJYg4HwHRiz2wM/q9xPJJP45Pd2qiU
   hVxlz/qsgs/SRjP7itBNI4FVKMZm8PmZj2OSNHysu5zLRlLgjb03Klb/Z
   KLxDERD/4LdCQ+B1rJpysP90Vutt9dehZmfw74mn9D/G3rYfnwL2mesoz
   Hryv0eJ8PL9tb8NESa7O4HpP81UEo4/YeEkfprm2JmUdMrVIM8K9FqXUx
   A==;
X-CSE-ConnectionGUID: MZIGZH2KQ42HikBv45+bpA==
X-CSE-MsgGUID: 3jHK+JGES1uQTQWPxnQ8zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191193465"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191193465"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:59 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A42CDC2262
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6931CD8B3C
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0D1561A0074;
	Wed, 26 Feb 2025 07:24:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/51] python3-bitarray: upgrade 3.0.0 -> 3.1.0
Date: Wed, 26 Feb 2025 07:24:16 +0800
Message-Id: <1740525881-21103-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115622

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* allow mask assignment to bitarrays
* add missing masked operations to pyi-file
* refactor 'resize()' and avoid overallocation when downsizing buffer
* update 'build_wheels.yml'
* fix some typos
* minor simplifications
* rename 'growth/' example to 'resize/' and add tests for 'resize()'
* update gene example
* add comments

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.0.0.bb => python3-bitarray_3.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.0.0.bb => python3-bitarray_3.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.0.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.1.0.bb
index c2a7e770d6..4e82364827 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "a2083dc20f0d828a7cdf7a16b20dae56aab0f43dc4f347a3b3039f6577992b03"
+SRC_URI[sha256sum] = "71757171a45eac58782861c49137ba3bed0da489155311857f69f4e9baf81fa4"
 
 inherit setuptools3 pypi
 
-- 
2.43.0


