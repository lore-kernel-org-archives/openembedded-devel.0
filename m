Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD14C52CD9
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.33823.1721034173910166008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IViTOix1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034180; x=1752570180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PPfBUFqbnQXJtPfFsWWN7BKsfK0/4PxSu3xzBW3ijMU=;
  b=IViTOix1AltoZrJ6qZGmwIZDCUiTGOiT3SSdXLekxfZntUnh6+S25DeF
   gtifS2rnrjT3ukr4hJd7JAqPm5cKwUsLhlAsYu7vspu/GzrOkn8tllagD
   uRiYaLAVqx8+ymzAuw2A/BrDkg+qCXJBhJMgKWGMMHT6s4wPTfGoaj5fe
   Z8G+X/SEhZik53S+bjU8a9Qg7yQeK+ah0n14TbqfK7+VBCQsPnQYtu9Y5
   EKNxWxWVP4tZWz3AFjjeCVq29kfCSp8OOOlztg+h+Hdmuajdij4vx4QDB
   FoJ2EzJQgm9CuVjlFI3Ve9rPaqhgv6/HdMxryIeSMuJ8EIhFY4zpLO1WE
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="146374028"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="146374028"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:59 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C6F7FCD6DE
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 10E95D5083
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B32F6BE53
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 38A301A000C;
	Mon, 15 Jul 2024 17:02:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/38] python3-astroid: upgrade 3.2.2 -> 3.2.3
Date: Mon, 15 Jul 2024 17:02:10 +0800
Message-Id: <1721034151-540-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10-2.484400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv+Aw16GgqpO9EA
	nAuyokV24CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzlJp+C1BEC8TQUf
	8IQ6LzLmg8bDRDYZmlgITRgd31/oPL/EJYMKvYJjlr3Y44GDyFb+NJHOAqxUpWNBv5m5J2d4NLc
	3iKDrVViB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111336

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix AssertionError when inferring a property consisting of a partial function.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_3.2.2.bb => python3-astroid_3.2.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.2.2.bb => python3-astroid_3.2.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.2.2.bb b/meta-python/recipes-devtools/python/python3-astroid_3.2.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.2.3.bb
index d7e7f5698..92c64e042 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.2.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "8ead48e31b92b2e217b6c9733a21afafe479d52d6e164dd25fb1a770c7c3cf94"
+SRC_URI[sha256sum] = "7099b5a60985529d8d46858befa103b82d0d05a5a5e8b816b5303ed96075e1d9"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


