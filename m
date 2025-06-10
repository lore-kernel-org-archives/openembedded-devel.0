Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EE6C71147
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.77957.1749526433086061047
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=slfSna3r;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526434; x=1781062434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B86IytjrggHqtshprjNR/aTOwLxtbQHQAoiN02YJzSk=;
  b=slfSna3rQ/JPMvUh3zBIFjwHzJbDiWwvcV32bY06JPkEyTz3/aIyuxjD
   AczgyC6csVxzDWqibmKz2YQHHoVFbrOzQ92VHY5c0zyXfFc1JKdbyDP+l
   iNCXfqOenaeSCrptbSxztPXXSGBkH+puFTjH6yWuKc9IAig+gykg//ZGi
   EECo8xvOVFhFEr1J9iWTcZ+E6/3js+g67ptswYIkWwl64CQPH6XVFnsbL
   sYOfc6ipN9Xr4QiuxEsVYiMGgAhzV0dGvMmtBp5ya/CkimGeQpqVACFS9
   mzq+Q9bZucHm8zMf/x6Fbp3286ltGA84vHcJqMYKVkHU4gaQMla0wR9A6
   g==;
X-CSE-ConnectionGUID: UHR3OyFQSW2l3YeEgvIgiw==
X-CSE-MsgGUID: 2be3uhvbSy236nFlogE+cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="181135328"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="181135328"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:52 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E719D5051
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B0019D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:49 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 350971A009A;
	Tue, 10 Jun 2025 11:33:49 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/64] python3-ipython: upgrade 9.2.0 -> 9.3.0
Date: Tue, 10 Jun 2025 11:33:08 +0800
Message-ID: <20250610033330.924-42-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117833

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.2.0.bb => python3-ipython_9.3.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.2.0.bb => python3-ipython_9.3.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.2.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.3.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.2.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.3.0.bb
index 08a6ba307d..3fabbb1606 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "62a9373dbc12f28f9feaf4700d052195bf89806279fc8ca11f3f54017d04751b"
+SRC_URI[sha256sum] = "79eb896f9f23f50ad16c3bc205f686f6e030ad246cc309c6279a242b14afe9d8"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


