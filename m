Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A663C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 03:44:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.6479.1648784638962876389
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 20:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lUi1KO6t;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648784637; i=@fujitsu.com;
	bh=eHtY4d1clIGNaOm+HbkUHpyvyTMshlWOP/JjsM/EpwM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lUi1KO6tptBxe5B7D5+ZY+7igHOLLasF4dHwc/Ibv/MZFKYrTMOKzZHyqup27+6VO
	 jtl/Lbfs+L/dC4QUaPkVKy1YMua3UCpdy+fyJ2fgq9bVHwq/WrPKLkLH99OucsBalY
	 /3EIWNcYXEPTjU9jolqHDpyPAZhd6kr5/TjiRYILAhA8aSfe0dWTOVDOzGYQMLeGSD
	 /7v43Vvowh+6e61jr5nqsi4hM5lRnoGKQLbbY61i2JeapZddZyNxs1qa+RVsM8f3kD
	 D7S2yatcx/Mxe7dVgLLYdPj4cC6uUqmqWnMNUzkHWqiKlArEdHe0XcWqbtu4/lMxou
	 zmNvcUxNg9jbg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRWlGSWpSXmKPExsViZ8ORqPunxC3
  JoG+GvMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjHjzw/2giNcFR3XprE3MD7i7GLk4hASeMIo
  0bb7ITuEc4FJYsXxe1DOfkaJ678usXUxcnKwCehKvPixmAXEFhHQl1g6ew8ziC0s4Cdx+vZpM
  JtFQEXi2oNtjCA2r4CHxK+7O8DqJQQUJKY8fM8MEReUODnzCVicWUBC4uCLF0BxDqAaRYnZ0+
  UhyiskXh++xAxhq0lcPbeJeQIj3ywk3bOQdC9gZFrFaJ1UlJmeUZKbmJmja2hgoGtoaKprbAG
  kDPUSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2MQLDL6VYLX8H49+VP/UOMUpy
  MCmJ8jocck0S4kvKT6nMSCzOiC8qzUktPsQow8GhJMHbkeOWJCRYlJqeWpGWmQOMBZi0BAePk
  ghvcDFQmre4IDG3ODMdInWKUVFKnPcYSEIAJJFRmgfXBou/S4yyUsK8jAwMDEI8BalFuZklqP
  KvGMU5GJWEeUtBpvBk5pXATX8FtJgJaLH+DVeQxSWJCCmpBiau4HPnbswKXvizP0aXrVRkGnv
  44/vHzrOpTjt2IzhO7c+tdVy3PpsoZnZE2ofoXmz9oJq2o+u96fOL3t4KJnGin5MuM7xS1mG9
  saEvpD6lL0abKY0t5oB+aL5St9z3GCmxdt7UKFNP/s8XOTaYZ8976HDkTs//26v5cpaWye8Iz
  hN90crsY+wecfRVytRTAqdZ1fb2d6y69HxVeo/kiqf+/QdElbZxuZ/6sJl9a5v/zBfmrc5Sy4
  Ol+Pzd10+yOD1/+zxfr4O7UlkV/dab7E85sv/Z8ZWZ4k8fFlzOW1K7/r3iRTk7069Ji1fYJnE
  X3OK0Mujv2rG1Vie1axn7BO570YmmfDOqGxicjlxlV2Ipzkg01GIuKk4EAMbQrhM6AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-571.messagelabs.com!1648784636!83770!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7253 invoked from network); 1 Apr 2022 03:43:56 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Apr 2022 03:43:56 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1AFA01001A0
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Apr 2022 04:43:56 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id F2F4A100189
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Apr 2022 04:43:55 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Apr 2022 04:43:39 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-nocasedict: upgrade 1.0.2 -> 1.0.3
Date: Fri, 1 Apr 2022 11:43:32 +0800
Message-ID: <1648784612-10348-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Apr 2022 03:44:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96317

License-Update: version updated to 1.0.3

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-nocasedict_1.0.2.bb => python3-nocasedict_1.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_1.0.2.bb => python3-nocasedict_1.0.3.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.3.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_1.0.3.bb
index 591b9c6b8d..a47c4a455f 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.3.bb
@@ -1,8 +1,8 @@
 SUMMARY = "A case-insensitive ordered dictionary for Python"
 HOMEPAGE = "https://github.com/pywbem/nocasedict"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a87a7059d580c45495c1218f53e3610d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-SRC_URI[sha256sum] = "86e2dae49e34de7c31b65b486c8f9aa58b66dc2e8ee9b34c390c6c58885c85a0"
+SRC_URI[sha256sum] = "8220b97ba06b08eb2deded774c406c77e0ca0d5352ae71249f6f9d1f2a17bd7b"
 
 inherit pypi setuptools3
-- 
2.25.1


