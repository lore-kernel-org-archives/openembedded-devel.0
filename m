Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D20C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:17 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.6729.1747818013761683612
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aLMHcH/2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818014; x=1779354014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FHZwaRzpVgFEwqlE3rdJ4h85cFbxhEj71FuUEbNhrR4=;
  b=aLMHcH/2V8BIYTgNi4HkekO7S/Hywfkm0GVHrC7S9xChwHTZD9ALpJ0M
   imjDznPT1En7C/fBpiMq+ArnEWLuRx1f1ifwC4aoYYxD6qIo/0zhf/v1B
   lfLkwPCve6VaVC1W4SCWXre3uppcsBDRLzV3uPkasG52fGfV3FdRmYEsN
   NJrgHQF16JAa/1BiGrSmY3tNMSs4uvAvlCkNeZuNT6t8EcpzBM9IaX2LU
   JpCGvKnr9b1OAXOiaCjxRW7HGZ3QaUBfY5TEOxmJrdgnHazSyB+BYWlVL
   EWBjhpiofd7XH8fh6a4f1GSlQecKlJ/biN5aP9UA8hO4p4dSCYtO7cUeC
   w==;
X-CSE-ConnectionGUID: jb/EL2w+Q5+vzM+Kcz7cxw==
X-CSE-MsgGUID: sF7IGUxjR7m27lp24HtVYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200152542"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200152542"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:03 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A5C2D8E65
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BBA19BDCBB
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 514771A009A;
	Wed, 21 May 2025 17:00:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/43] python3-tornado: upgrade 6.4.2 -> 6.5
Date: Wed, 21 May 2025 16:59:26 +0800
Message-Id: <1747817972-28874-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117568

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/tornadoweb/tornado/releases/tag/v6.5.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tornado_6.4.2.bb => python3-tornado_6.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.4.2.bb => python3-tornado_6.5.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.bb
index b223a11381..65a1778457 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "92bad5b4746e9879fd7bf1eb21dce4e3fc5128d71601f80005afa39237ad620b"
+SRC_URI[sha256sum] = "c70c0a26d5b2d85440e4debd14a8d0b463a0cf35d92d3af05f5f1ffa8675c826"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


