Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EC3C43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 01:40:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.3185.1658454052105088914
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 18:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QKDZeAFd;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658454050; i=@fujitsu.com;
	bh=Wgrf9UEPvm26gNaKBQbqNGu1ZGT5pG5mF4I0zlRyFq0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QKDZeAFd0S65Ir25rupCMehR+hgKmBdnwa5BSgd3ct2w9A2+0saFbOCO/MB+VaDx1
	 uiyvICsAYz1TEnVTJuNytMtX3ncTKDImHZSD0pzdPexQ93zEE6ONgRpfanIpIYQn0H
	 kxrV/iIaTDXvQYmdaV6mlS/OINEA6jX2Lk07/xMQqqckPdP59EWb0kBcsRd7c7Y4Gr
	 98PI7QV+YEIfxgGdC8iHEcXLjtNgd4pTmIXH2/KChGD9UyqucD/jU/4AT6m9TjlETz
	 +pJYwZQ9K3aidQAemZlat4EW+cTXBL329vepE4gxfvn8MkY3fVLMKkAKYci/o755ee
	 hq1RJiUo1kiaQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxSVeR4Va
  SQcdWSYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePE8p/sBa85Kt5Pr2lgnM7RxcjFISTwhFGi
  c+YHRgjnOpPE5GttLBDOAUaJj5NPs3UxcnKwCehKvPixmAXEFhHQl1g6ew8ziC0s4CmxZ/ELd
  hCbRUBV4vrtdWD1vAIeEs/Oz2QCsSUEFCSmPHzPDBEXlDg58wnYHGYBCYmDL14AxTmAahQlZk
  +XhyivkHh9+BIzhK0mcfXcJuYJjHyzkHTPQtK9gJFpFaNtUlFmekZJbmJmjq6hgYGuoaEpkDb
  SNTQ11kus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMwJTitJk7GLfs+6V3
  iFGSg0lJlHffpJtJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4C/4C5QSLUtNTK9Iyc4DRAJOW4
  OBREuG1+AKU5i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+XqqUOO+Sr0BFAiBFGaV5cCNgkXmJUV
  ZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCv/G+gKTyZeSVwm14BHcEEdIS5+Q2QI0oSEVJSDUx
  nLMO+T7bXLC43W2nkv8j+yuaNk8+mlkY5CjVI73+tmbV03e0rH9enH9Y5lXFu6zONPxrBvq2p
  M78cPqabLNRp5PyX27XM8IKTqfg016Sp62b0XU7MmxouprzLbKLKYpH5akdPZ5tdi6st1xEPF
  VKu9Dhn3vhZ1yxNYHWD5bx5Pww/fFxcFFet13R4f0LT6dknjyzi3nmJqWqta3bI7FPd9mfDih
  v6I9w0q31m8d9o05Q9M2Ht9k/N9w9eFu90L/OK3L+t4KfCTfazx/L3hqlIBvXUyNdKH/61es2
  GTOctjNPLk84pX9TTb0w88+zYjl/CTgz5LEvLp1RP4ypi9DEQOFP6XpDDQS5jkedjNyWW4oxE
  Qy3mouJEABFD+OxHAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-745.messagelabs.com!1658454049!382649!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21002 invoked from network); 22 Jul 2022 01:40:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 01:40:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D03821000DC
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:40:48 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C3E5D100077
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:40:48 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 02:40:47 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-evdev: upgrade 1.5.0 -> 1.6.0
Date: Fri, 22 Jul 2022 09:40:41 +0800
Message-ID: <1658454041-24154-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 01:40:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97932

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-evdev_1.5.0.bb => python3-evdev_1.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-evdev_1.5.0.bb => python3-evdev_1.6.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.5.0.bb b/meta-python/recipes-devtools/python/python3-evdev_1.6.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-evdev_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-evdev_1.6.0.bb
index 141411da0c..659a86dae3 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
 
-SRC_URI[sha256sum] = "5b33b174f7c84576e7dd6071e438bf5ad227da95efd4356a39fe4c8355412fe6"
+SRC_URI[sha256sum] = "ecfa01b5c84f7e8c6ced3367ac95288f43cd84efbfd7dd7d0cdbfc0d18c87a6a"
 
 inherit pypi setuptools3
 
-- 
2.25.1


