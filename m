Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19FFC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:52:25 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.16330.1666594338486506280
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=j311/is4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666594336; i=@fujitsu.com;
	bh=N+BocOQCONtu/juDPnLEXJIOLzrgUfOHu2MEadEQABQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=j311/is4qUwovzRvUzEyW6G1dAhKhIRSm8A/JFCeBzO8uuswCZZ2HiPrkOnXkoIvp
	 KUvUVrxDEaljLoM3fvGcq73ZPbVufEuFeViIsD1tT0kNh3H7U0EYHXszwrWClPI07A
	 t0BWkw8OtMGHT6csDkqupCFYnbbQyhEMu+9zTjuLHulFytsBKTQuIuCMxPVFs9FVeN
	 GbmGUwOsxgUOGIJVOa3v7TpqbLVpJYYeLd9DhDaIwO6hr5hk4rGkYeLglzzGEegvtH
	 xBBz86qEjN9E/8UqzqzEr6+FICnQwmWXeZaofbQ+k9RDlcETTGiZ1rNZiJRZ6C4zvz
	 nZsO+40VBx4tw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8OxWVfeLCz
  ZYMlqK4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP1ctWCCZwVZ85uZm5g3MvRxcjFISTwkFFi
  8p/9jBDOFSaJJX1ngRxOIOcAo8T0GbUgNpuAgsTCrWdYQWwRAX2JpbP3MIPYwgJ+EpMnf2MCs
  VkEVCWOT9oOVsMr4C5x4cJ2sLgEUO+Uh++ZIeKCEidnPmEBsZkFJCQOvngBFOcAqlGUmD1dHq
  K8QmLWrDaoVjWJq+c2MU9g5JuFpHsWku4FjEyrGM2KU4vKUot0DfWSijLTM0pyEzNz9BKrdBP
  1Ukt18/KLSjKAUonlxXqpxcV6xZW5yTkpenmpJZsYgQGXUpzMvoPxzZI/eocYJTmYlER5GcTD
  koX4kvJTKjMSizPii0pzUosPMcpwcChJ8NZoAeUEi1LTUyvSMnOAwQ+TluDgURLhnWUElOYtL
  kjMLc5Mh0idYrTkmDr7335mjuVgcubXtgPMQix5+XmpUuK8aiZADQIgDRmleXDjYBF6iVFWSp
  iXkYGBQYinILUoN7MEVf4VozgHo5Iwr58p0BSezLwSuK2vgA5iAjro0oogkINKEhFSUg1Mc2V
  WhTF/71joEhe255Brz4WSlWIbKlfONva5PGP3vnO6XTs/vpZa89X/ho/vnIn699eILw7ZPvFx
  hfgfuYpa/v4JUwKvVMwJeb9t3XSOR8X7DvlonEh8ULL+1O6VW55JPqo9Pe3e18na8yIKA4Sir
  y5S+qs4f7HUkk6Wk5XnQxw/T8yRNQyOvXHz0dICNanJlxcf22Sx/safpdtTz5aFK+RVL2fvV/
  nbPemulIzNWXeW/auvhG5MXL5Dlr/Kj9nAJ/KS+Z2t5UtnCHpd+bpp2a70u7G375Wpz/Z9GGe
  2SPr/45YbZn1LF3zn1Mw2nXDl75ONjEWz+VserJErvTNz+gTP342BymU5shKVh+Yf1b6vxFKc
  kWioxVxUnAgAYDtts0sDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-745.messagelabs.com!1666594335!196580!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9493 invoked from network); 24 Oct 2022 06:52:15 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:52:15 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 7080D151
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:52:15 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 637A9142
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:52:15 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:52:13 +0100
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.39.1 -> 0.39.2
Date: Mon, 24 Oct 2022 14:52:06 +0800
Message-ID: <1666594326-3042-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99279

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-zeroconf_0.39.1.bb => python3-zeroconf_0.39.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.39.1.bb => python3-zeroconf_0.39.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.39.1.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.39.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.39.1.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.39.2.bb
index 6f442481f0..53642c6308 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.39.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.39.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "b83cff68a0c8dcd2705b5e792796239accba2bfddb09bc8d05badc642f64e7f6"
+SRC_URI[sha256sum] = "629d2a0dd7a2b9af5bc5eb0c8402755e87a2d00f7015c72834fc0958ccda2835"
 
 inherit pypi setuptools3
 
-- 
2.25.1


