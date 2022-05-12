Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFCBC433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 09:18:12 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.2052.1652347085876154897
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 02:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZgE8qsgU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652347083; i=@fujitsu.com;
	bh=MIykKsqEGTyknXJuCRkBquin/AhulIb3nemr8kmIBYc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZgE8qsgUIYdE94wrgBmoOg9CJOJqDG6Cpf5lPK2ljWOHUQtSIG3yHUvUu6dYT/4/u
	 D77nrGGtfa9z1qA36hzaKF0n5JSN+AsOKh9kHUwleJPijCFEKeqxG+/JeInBds5qqh
	 fza/4XlGwjS7cisDfHvbOQIXqVzH7iA1wCXbtGQEzib6+3X+OMwrtOD2kTMOwwoc/F
	 TcQDK49V2Dbe/+kgtwwMlfRl69RwnNhRAXdaSMK8hdVrmridwqwhlarzDpfXkyxzth
	 DdYvlI84He1yeS2w0NiowrbmnbpeN9uexb5fTv4u73elLNpYqo9ureaRdmqgFh8uDR
	 nQCW/d7AU6i2w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsViZ8MxSff0hZo
  kg71rJS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ow7z9+zFCzhqjgx8TBjA+Mxzi5GLg4hgSeM
  Eh+vtzFDOBeYJH5vPszWxcgJ5BxglFjxwxLEZhPQlXjxYzELiC0ioC+xdPYeZhBbWCBQ4tLB4
  2D1LAKqEsd6NzKC2LwCHhKNZ08zgdgSAgoSUx6+Z4aIC0qcnPkEbA6zgITEwRcvgOIcQDWKEr
  Ony0OUV0i8PnyJGcJWk7h6bhPzBEa+WUi6ZyHpXsDItIrRLqkoMz2jJDcxM0fX0MBA19DQVNf
  MTNfQ0lAvsUo3US+1VDc5Na+kKBEorZdYXqyXWlysV1yZm5yTopeXWrKJERiCKcVO+3cwPu37
  qXeIUZKDSUmU99z5miQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErw7zwHlBItS01Mr0jJzgPEAk
  5bg4FES4S0GSfMWFyTmFmemQ6ROMSpKifN+2AeUEABJZJTmwbXBYvASo6yUMC8jAwODEE9Bal
  FuZgmq/CtGcQ5GJWHe0yCX8WTmlcBNfwW0mAlo8X7XSpDFJYkIKakGpi2Tbt3VeOOolbT7JFv
  Ry8DAtdb7TGz+q8mWBukdy/ioVZRXXLKlucP/3GcRfbMvZrOa7G7NifL1bLukOefnt797nmgw
  XDrvcMG+Y31OZvDnzcfKVH787FFQFgwNKP6SHJywtfjwfzmxFZd/5xo+rQg6x2h9UFj87/cbh
  5TaK3czCk7uWL3PrMhhBaOVxMTEy+tuZkToHXBjSV3Zmv26XKm/RLlDXKy7PUdqt/vUzQrd/r
  NXtoTK/1QWuZ4u89zq/NVI7mXXaxmSvSfILj4Z+P3DrY9vrQUafn+v21qVsaVJ8c2zqq9fmKc
  Uaf29XbDiE+uGRU3dx9Rlt/x/duT98avyNacjRI8btzuUMUQ/VWIpzkg01GIuKk4EAHblznY8
  AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-528.messagelabs.com!1652347083!63340!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10523 invoked from network); 12 May 2022 09:18:03 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 May 2022 09:18:03 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id EB99E10033B
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:18:02 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DE897100458
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:18:02 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 12 May 2022 10:17:50 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-antlr4-runtime: upgrade 4.9.2 ->
 4.10
Date: Thu, 12 May 2022 17:17:36 +0800
Message-ID: <1652347056-16537-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 09:18:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97066

License-Update: Version updated to 4.10

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...antlr4-runtime_4.9.2.bb => python3-antlr4-runtime_4.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-antlr4-runtime_4.9.2.bb => python3-antlr4-runtime_4.10.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.9.2.bb b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.10.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-antlr4-runtime_4.9.2.bb
rename to meta-python/recipes-devtools/python/python3-antlr4-runtime_4.10.bb
index 8a19b6c64..01f17207c 100644
--- a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.10.bb
@@ -1,8 +1,8 @@
 SUMMARY = "ANTLR runtime for Python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c96f0ee5f5d08fd4387e5f00507bb13e"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=6e514123aedb5d9fb133d1bc6c598d46"
 
-SRC_URI[sha256sum] = "31f5abdc7faf16a1a6e9bf2eb31565d004359b821b09944436a34361929ae85a"
+SRC_URI[sha256sum] = "061a49bc72ae05a35d9b61c0ba0ac36c0397708819f02fbfb20a80e47d287a1b"
 
 PYPI_PACKAGE = "antlr4-python3-runtime"
 
-- 
2.25.1


