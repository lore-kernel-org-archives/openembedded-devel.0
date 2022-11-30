Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425B8C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 04:31:30 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.2930.1669782689694862373
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 20:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iugLtJkJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669782688; i=@fujitsu.com;
	bh=GWoOwNCEYTm3PjoVeoxYge/RN0kXxMSA2Wmex73/B3g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iugLtJkJ0+boVh96+ed6jJfK0luoK46UDD76qw5gly7yLTb6u7tO0oLz2+o/P9ofl
	 ecf8zFirVekG9WVr9117q+ZNzKks3XNWTa3TEw4pmkAKshA5BmitGtI5TgZonTzFyh
	 Bg/L8UisKon73qgeiNTyanXD/33C3IpK0qWyGPYUVS7zajFINEic5HzoCRTWxAgtdT
	 WhwKeAuPsTdCtPS0XAFnwAytuKAVQ+VDr34jv+gAN/kVQARM5UTWiCZ2ZA3S6GRMVZ
	 drJXZdibNfEzb2rHanpPkZOLy4d/DijXT4aOURD90nv3YCm1jNTUFdMAAYRZRLAiZy
	 wqlZWd1dDB6aQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8OxWXf+nbZ
  kg42XZCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ox/K/+zFWznqrh47DRjA+N5zi5GLg4hgYeM
  Eo97D7BCOJeZJJbvuQnkcAI5BxglLt0TBrHZBBQkFm49AxYXEdCXWDp7DzOILSwQIDF3/jHGL
  kYODhYBVYkZyyVBwrwCHhIn/u4FK5cAap3y8D0zRFxQ4uTMJywgNrOAhMTBFy+YQVolBBQlZk
  +XhyivkJg1q40JwlaTuHpuE/MERr5ZSLpnIelewMi0itGsOLWoLLVI19BAL6koMz2jJDcxM0c
  vsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyMw4FKKVfp2ML5d9kfvEKMkB5OS
  KO/Vo23JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4xW8A5QSLUtNTK9Iyc4DBD5OW4OBREuHdC
  tLKW1yQmFucmQ6ROsVoyTF19r/9zBzLweTMr20HmIVY8vLzUqXEeTNuATUIgDRklObBjYNF6C
  VGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzTQK7iycwrgdv6CuggJqCDIsXADipJREhJNTB
  tOvIowvTNA7+Htzxuiv+Jbk0PSvadb2oo/VhyS9LRcCuzNtMtFxNPVGluZFtv0X/DKf5Bvsv2
  ZSZzVGpUTpmc892hKHBd7tbphtVfy/dorWrMX2G7Kb9i75yQ2I0x2vp3/x69lLKEm5u/TvYNe
  8idHevsL3RrV/zMCl74I0Q2akvT8w0J7Du/z771UOQd1xMhRft5Pxkun/jjEuPxIC6Nb/HJSt
  u/CT79pi2hMxlDOZ3dKneois8uum/7xOXz6puzV7x5cqrtmcriBY4L3lwWeilno/Lp3ptjE5q
  XJ8lEyu7YwjFhwWcu554X0+6sSfD6+zk3Sin/Wui+NWdn/Xrsmez//plD3b9Mnj19XmdUlFiK
  MxINtZiLihMB32eHK0sDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-571.messagelabs.com!1669782687!413820!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9764 invoked from network); 30 Nov 2022 04:31:27 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 Nov 2022 04:31:27 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3033A150
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:31:27 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2309F73
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:31:27 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 30 Nov 2022 04:31:25 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.9.10 -> 1.11.1
Date: Wed, 30 Nov 2022 12:31:22 +0800
Message-ID: <1669782682-11974-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99854

Changelog:
==============
Move set_transaction_name out of event processor in fastapi/starlette (#1751)
Expose proxy_headers as top level config and use in ProxyManager: https://docs.sentry.io/platforms/python/configuration/options/#proxy-headers (#1746)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-sentry-sdk_1.9.10.bb => python3-sentry-sdk_1.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.9.10.bb => python3-sentry-sdk_1.11.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.9.10.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.11.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.9.10.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.11.1.bb
index c09a01b2a..5b2cc4851 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.9.10.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.11.1.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "4fbace9a763285b608c06f01a807b51acb35f6059da6a01236654e08b0ee81ff"
+SRC_URI[sha256sum] = "675f6279b6bb1fea09fd61751061f9a90dca3b5929ef631dd50dc8b3aeb245e9"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1


