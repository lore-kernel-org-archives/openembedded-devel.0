Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D00BCD12A5
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:44 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.39471.1711983092271528304
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aLUBYm+C;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983096; x=1743519096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mQyBkkrGfs35In4rDy0rUEjO8d+TsWLbgIKJehIta4o=;
  b=aLUBYm+CGWiEZmmrFVtqUKifNACrMwuOcQxa/5alZD76vvN2XOOflI7Q
   8jQtP5CvlLGMt+soq9A2SUjzMvqd+BsUpcSutqY1e+ZP1eP+HFx+qynDu
   7F9/StZ9t2O0vZgUoD7TNcCRRnd3t+6nawV9gJ/VpCDfutBoVjqo91qJk
   bej+k7p7KDuASGLWFlPIplouiG1eRh3e197yqJidQaQ3opAq6OTxx0e+B
   jV+IXeaGZ6ZQyxM/fHB6PfxZ9PCv2gGof45IkAxCtWIKM19kbvkoDjve2
   vdZ14Mdw5oESYNzznP9J8G4F5wOeV2JUUvlScbb7VbzsmZ1rq/9kclF6Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133053925"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133053925"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B3DB0C36E1
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A9653D620F
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 47AE22C63E2
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F224E1A000A;
	Mon,  1 Apr 2024 22:51:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/47 v2] python3-eventlet: upgrade 0.35.2 -> 0.36.1
Date: Mon,  1 Apr 2024 22:50:48 +0800
Message-Id: <1711983079-16849-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--4.222800-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrXHlQSIX8DvU443gh8B9X3qy2
	hC8KApGLzIO4dXAjcKrwTDq7PGFLj+xHzg5Fmt6yPKN38CLPK0FNLPQl0QAltKvWBS71/UX/hpw
	FMvfY+W0KQKpCezL7rRZhJKxtpOTtEnwQg0CZxZsCg1rav4R3DVQQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaJ+fOZykHM6u7nHu4BcYSmtAUDqlLFoMeaBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrRKp0Ptw2O8nahOSJwTSlPytF6striuAGdH4p7crFH83JNTb
	Pk1oObMPxRP0z46d6z7MW/0xWN+8hIwC3+MdOAX3tdw0iFsegR0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109733

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
*eventlet.websocket is not always used from eventlet.wsgi, so do not assume
 eventlet.set_idle exists
*Make sure asyncio hub doesn't use greendns for asyncio DNS APIs
*Make asyncio.to_thread work with the same semantics as normal asyncio
*Refactor congruence checks based on assert at runtime
*Run tests on macOS in CI, and some fixes to get it in reasonable state
*Fix wsgi.server shutdown for in-flight requests
*Add debug convenience helpers - asyncio, threads
*Handle errors better.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eventlet_0.35.2.bb => python3-eventlet_0.36.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.35.2.bb => python3-eventlet_0.36.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.35.2.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.35.2.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
index 4db2e6fa4..f70099ab9 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.35.2.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI[sha256sum] = "8d1263e20b7f816a046ac60e1d272f9e5bc503f7a34d9adc789f8a85b14fa57d"
+SRC_URI[sha256sum] = "d227fe76a63d9e6a6cef53beb8ad0b2dc40a5e7737c801f4b474cfae1db07bc5"
 
 inherit pypi setuptools3
 
-- 
2.34.1


