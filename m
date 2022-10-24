Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3C6C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:37:25 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.16266.1666593437275434109
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s7e0gjww;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666593435; i=@fujitsu.com;
	bh=Ytnh61k2WHQoJr8MFeHpXDs8DaSLrRlj+B4QMuuIC9U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=s7e0gjww80z//CtzuzbF/461KZq+Zzos5rucEcan5zUQEtot6iXCjaqyp2rbwLoty
	 3U2ISfChu+Fz29UqiPArv3wxZEAV44kqoLfhLxTQTqaKJGra/p7ClrlP7Y6NBlH4bo
	 6Zzp0G+HJahUe9uZk+T/bD1JCjJL4agRRo58PUrkAgqeCMZVml9x/rODcHy0b4SS+K
	 r4Tz862iiUj4G4yLwFXGhXurEF5/JXal034LQK60o/8Ypsy+t2GE2oJ7UJKZvhRHPi
	 DxLqd2OYnv/1xrDT23pJ5Yv8+Qm00U74eCmZev9Qr5JeWgspqBbhzJ2TCjIATr857P
	 Bg2KqLCBz6ylw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8OxWXeWUVi
  ywfwzKhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b+VQcZC2ZxVmw9coa9gfE4RxcjF4eQwANG
  iRUrT7BBOJeZJKau/87cxcgJ5BxglNjSDWazCShILNx6hhXEFhHQl1g6ew9YXFjAV+L35zfsI
  DaLgKrEsktfGEFsXgF3iX0zGplAbAmg3ikP3zNDxAUlTs58wgJiMwtISBx88QIozgFUoygxe7
  o8RHmFxKxZbVCtahJXz21insDINwtJ9ywk3QsYmVYxmhanFpWlFuma6yUVZaZnlOQmZuboJVb
  pJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBlxKMWPuDsady/7oHWKU5GBSEuVl
  EA9LFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBW6MFlBMsSk1PrUjLzAEGP0xagoNHSYT3mSFQm
  re4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4rxRIEUCIEUZpXlwI2CReIlRVkqYl5GBgUGIpy
  C1KDezBFX+FaM4B6OSMO9sA6ApPJl5JXCbXgEdwQR0xKUVQSBHlCQipKQamKxcOQ77nJOedy3
  W7izT1/OrdRYJ/lhbtmNzUv3suXurV1nZbdr8R7lLpVHGOJIvftatrNJbCw4a9rrLFzjMVEmb
  0K2WdcOR0b/PeNp3pf70j8tCHtx8ZqhSc1PNyjU0+ueWNXMrpoX+qii85nHBZckllYXpSz48Y
  xRo2sL8j/Ga6jTPIz7ljdyN/meNjgecevZZ7u2dhczf5vG90s1Nb+XZ4nJ/jdjMq5vLj9zKcy
  jJuZhVFBSrM8Prwuc9wQdsjG+Irng1z39H3QHhso0d05p/M5a/WXZXQMLk5IWW1o26r0VjWAU
  EHTb+WTjRLJpHsi6jdLX1UqaZM14mfttqWuiQv+61nN+FrBUuc6//UFNiKc5INNRiLipOBACr
  86biPwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-587.messagelabs.com!1666593434!197777!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1010 invoked from network); 24 Oct 2022 06:37:14 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:37:14 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 41E237B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:37:14 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 34A1673
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:37:14 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:37:12 +0100
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-stevedore: upgrade 4.0.1 -> 4.1.0
Date: Mon, 24 Oct 2022 14:36:58 +0800
Message-ID: <1666593418-2548-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99270

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-stevedore_4.0.1.bb => python3-stevedore_4.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_4.0.1.bb => python3-stevedore_4.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_4.0.1.bb b/meta-python/recipes-devtools/python/python3-stevedore_4.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-stevedore_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_4.1.0.bb
index 70c43f3ace..2749f481d9 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_4.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "9a23111a6e612270c591fd31ff3321c6b5f3d5f3dabb1427317a5ab608fc261a"
+SRC_URI[sha256sum] = "02518a8f0d6d29be8a445b7f2ac63753ff29e8f2a2faa01777568d5500d777a6"
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-- 
2.25.1


