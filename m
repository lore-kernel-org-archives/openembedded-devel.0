Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2F4C00144
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 04:16:52 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.1109.1659586604103312208
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 21:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Rs2JmPQb;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659586602; i=@fujitsu.com;
	bh=WBsAl6T2gHfiTkbViUgUQH3rrr6JDjrd6L+YLo/+qxk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Rs2JmPQbULoM8ICKlOJ1K1T7sHRS1o2/YpR9plQ6++VV1NJeYtBSo1FmJnZTqDcFa
	 +5BrravGDz/67OG9vIQLke1gfvs8iCrK+hT/9wpJwvdfgQe41g75rDcTwBwlsUyLI3
	 JgTS0I2XeMyw7qf2eve6C7ZTk+ZHG9foyvy9oxhtj4DmHPMWi6fKp7CiZmBw6w139P
	 p4BaCinEjq2MFxlfMIqvVoMTgVmDjVLmFCfTDtoOtKKHDDyeoFHfVgLVLATUDP24m/
	 jy084ECyNUWFsDJBDi0RQmuot/Jz7vJKPejsXcWR+k8/JNIPc+TxkIbvYj8Em1CSNc
	 GLIbe2exdOaTw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8ORpKvh8Tr
  JoK9JyuLi4aXMDowe5zauYAxgjGLNzEvKr0hgzfg/7QFLwQveildXTzI3MJ7m6WLk4hASeMgo
  0bOsmR3CucIkcfbBAVYIZz+jxKMTO9m6GDk52AR0JV78WMwCYosI6Essnb2HGcQWFvCXOHOlC
  yzOIqAqsff/LSYQm1fAQ+Ll1ImsILaEgILElIfvmSHighInZz4Bq2cWkJA4+OIFUJwDqEZRYv
  Z0eYjyConXhy8xQ9hqElfPbWKewMg3C0n3LCTdCxiZVjFaJRVlpmeU5CZm5ugaGhjoGhqa6hr
  rGlpa6iVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBAZfSjHz8R2MU/p+6h1i
  lORgUhLllXV7nSTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgveWKVBOsCg1PbUiLTMHGAkwaQkOH
  iURXlGQVt7igsTc4sx0iNQpRmOOuwv37mXmmPm17QCzEEtefl6qlDivmztQqQBIaUZpHtwgWI
  ReYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM+8wVaApPZl4J3L5XQKcwAZ2iw/UC5JSSRIS
  UVANTx67Dl3fvTiyucbFeVXhXxmhfffOl0pjthsfanD6+nq7wf/vkJkW23483iTKfPLTlvAu7
  QGl4YBJvlfVhtl2XVm1sX+d74rvnpzNTBbLZ82f7/pDKUuePYj7/+NH1kA37CrXlZ+sUGZ/89
  PTrXKfLXvPKZpgs+r/wwxGTEr6dRkzL3i9pt2GxX98jWXVQyfpe2qZnH988OmAe3lmx4+LhQ2
  I7n7/kMT93z4tDdAu7zOl/ekIXLfcemDHl7+4tNmK3e9U33/giU2zNm5WxyHJDTm2DSDjj7xd
  3tt9fwhfDa/E991V4f5Plh6PGbc90FDY88lZWZr33+cWbf2825CZ4L5n2JXyerPZLhb2plllG
  b5VYijMSDbWYi4oTAXNW01pLAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-587.messagelabs.com!1659586600!271693!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10170 invoked from network); 4 Aug 2022 04:16:40 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Aug 2022 04:16:40 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 103651B0
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 05:16:40 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0500E1B1
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 05:16:40 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 4 Aug 2022 05:16:38 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-flask-login: upgrade 0.6.1 ->
 0.6.2
Date: Sat, 30 Jul 2022 06:03:08 +0800
Message-ID: <1659132188-15960-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 04:16:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98121

Changelog:
==========
-Fix compatibility with Werkzeug 2.2 and Flask 2.2. #691
-Revert change to expand_login_view that attempted to preserve a dynamic
 subdomain value. Such values should be handled using app.url_value_preprocessor
 and app.url_defaults. #691
-Ensure deprecation warnings are present for deprecated features that will be
 removed in the next feature release.
-Use request_loader instead of header_loader.
-Use user_loaded_from_request instead of user_loaded_from_header.
-Use app.config["LOGIN_DISABLED"] instead of _login_disabled.
-Use init_app instead of setup_app.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-flask-login_0.6.1.bb => python3-flask-login_0.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-login_0.6.1.bb => python3-flask-login_0.6.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.6.1.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.6.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-flask-login_0.6.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-login_0.6.2.bb
index d19acd9b64..97d7bce359 100644
--- a/meta-python/recipes-devtools/python/python3-flask-login_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.6.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = " https://github.com/maxcountryman/flask-login"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
 
-SRC_URI[sha256sum] = "1306d474a270a036d6fd14f45640c4d77355e4f1c67ca4331b372d3448997b8c"
+SRC_URI[sha256sum] = "c0a7baa9fdc448cdd3dd6f0939df72eec5177b2f7abe6cb82fc934d29caac9c3"
 
 PYPI_PACKAGE = "Flask-Login"
 
-- 
2.25.1


