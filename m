Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2EAC54EE3
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:05 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.6737.1747817995751750177
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Zh6SUqCQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818002; x=1779354002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9ApbryNM+0xA5ZJnmIjxxNBM08SVd32DI65rXGvib/o=;
  b=Zh6SUqCQBzQyxgDorOuKPPAsDaGI/qH6ipk/x0z6XX+NlkRT7g2XwWd1
   9fhPDPvvbcg46empN/c+E8xmACf5Mv/s4ysHmwDMbuvuKJyrcx4NO6k+e
   FlIGDwqmhtwRzljIOALobanygF21a1GZvYZv07AZHaYOT0u51PKMW3XQy
   Kc9L0dQTxs3JUTmt9OiQiiy2hi7aoARInmocNb7gGSGJwMhduibCu0jso
   4swPINnaLiMUJ1aKQnie8KnYmGwNBpoh2+N4z+8IKCtRLDXc6xvbarAO2
   Dj0xhlWWqbi57roCHJtRE8DHQmNQqxmRgr9nY+1FITO28NdRblp1rXpvI
   A==;
X-CSE-ConnectionGUID: 7VFtnpvNSJuCMTLoFJXwQQ==
X-CSE-MsgGUID: E55cYxz8Rgi4HSu/7fsgBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="179076139"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="179076139"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:01 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A378ED5056
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 65979103C7
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EA9B11A0078;
	Wed, 21 May 2025 16:59:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/43] python3-scikit-build-core: upgrade 0.11.1 -> 0.11.3
Date: Wed, 21 May 2025 16:59:21 +0800
Message-Id: <1747817972-28874-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117557

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...build-core_0.11.1.bb => python3-scikit-build-core_0.11.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-scikit-build-core_0.11.1.bb => python3-scikit-build-core_0.11.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.1.bb b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.1.bb
rename to meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.3.bb
index 0632503ac9..134bb3aeac 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.3.bb
@@ -10,6 +10,6 @@ DEPENDS = "python3-hatch-vcs-native"
 inherit pypi python_hatchling
 
 SRC_URI += "file://0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch"
-SRC_URI[sha256sum] = "4e5988df5cd33f0bdb9967b72663ca99f50383c9bc21d8b24fa40c0661ae72b7"
+SRC_URI[sha256sum] = "74baf7cbc089f8621cc0646d9c5679034d5be1b014c10912dc32a4bcd1092506"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


