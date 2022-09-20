Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD178C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:30:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.7398.1663641010113021630
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uUEMO2q+;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663641008; i=@fujitsu.com;
	bh=n9WCpD+COsMTS19XTLRnY0t+xxy0mlZxwhoQ1jxj9Yk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uUEMO2q+3FnYxui3S8whz8OTImqAiJ8q1gcI9yMoMvAwOyNjPwc5h+zOjErxwpvW7
	 n4ebNjz5H8V6PkFRly6sZo6GOE9oPTWhv/Rh8ElnJtErEAVjocsY9MjSOSBbpY+1kZ
	 rfzcxd1KphJt0XgpKC06g3pWmVZdRP5ARqDQ3OM9M/m0QbPI0HOwjyq/xlyIF9u9K+
	 GtQU9TzhlWFjDyJtAdwyEThZIl3AHL4cSiFz/pVrJRSmR9kmSadvNVoOMQ/2XaEMTD
	 CxXwrdblplRwCbN/mADd7MetO55XYCO1DTOL8sFQvR1tslLMsQqiOHgaVr4C5p/Qr9
	 fv/dFkZ15t53g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8ORqLteVTP
  ZYPclHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPj9W62gvucFV3/1jM2MHZydjFycQgJPGGU
  2P37MjuEc51J4vL/6cxdjJxAzgFGidaNMiA2m4CuxIsfi1lAbBEBfYmls/eA1QgL+Ets+b2RF
  cRmEVCVmN3bzQhi8wq4S/ze/RasRkJAQWLKw/fMEHFBiZMzn4DNYRaQkDj44gVQnAOoRlFi9n
  R5iPIKicbph5ggbDWJq+c2MU9g5JuFpHsWku4FjEyrGK2SijLTM0pyEzNzdA0NDHQNDU11TXS
  NjC31Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L08lJLNjECQy+lmOX9Dsamvp96hxgl
  OZiURHm56jSShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnw2gtqJgsJFqWmp1akZeYA4wAmLcHBo
  yTCK6cClOYtLkjMLc5Mh0idYlSUEue1BEkIgCQySvPg2mCxd4lRVkqYl5GBgUGIpyC1KDezBF
  X+FaM4B6OSMC+nMtAUnsy8Erjpr4AWMwEtvqGiDrK4JBEhJdXAFPn8l/+Xg5uUvsXd15D5/2e
  e7Gk/hobZgvE3dMXP/9ggl9s6TX+tZMcPvxcbEr7J777mtX9j+aNtTzYe9UyrejHlZHRjkafT
  CgfOzTvPfPJsss3+Ki/966dn8Mp4rbZAhp3WnhV1vf0Mn9aVs732Dc97yPtrw5xZPbcPejRkr
  7gXeqj80I99ZTULTExiau/sUzGWnGnySLHdg9lPoLjkHsMyzbSU3w+zL631XODLV3FoyQaNtP
  qKy1s4XhW0b77tFRQXci4ob9Ljq4c4BA9adwaHxB16YezdofN4ZeflsE2fTwss5D6+Vsog+an
  90fsiLiskDJe+cZ/l9Py0DN+c5O7/+W7fe9eLfd62vEbXU4mlOCPRUIu5qDgRAJdqhao4AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-591.messagelabs.com!1663641007!307132!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6205 invoked from network); 20 Sep 2022 02:30:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:30:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5C30A10019C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:30:07 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5068710019A
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:30:07 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:30:06 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pycocotools: upgrade 2.0.4 ->
 2.0.5
Date: Tue, 20 Sep 2022 10:29:56 +0800
Message-ID: <1663640996-2406-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:30:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98893

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-pycocotools_2.0.4.bb => python3-pycocotools_2.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycocotools_2.0.4.bb => python3-pycocotools_2.0.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.4.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pycocotools_2.0.4.bb
rename to meta-python/recipes-devtools/python/python3-pycocotools_2.0.5.bb
index ec8585e619..234942bfe0 100644
--- a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://pycocotools/coco.py;beginline=45;endline=45;md5=12cb5
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "2ab586aa389b9657b6d73c2b9a827a3681f8d00f36490c2e8ab05902e3fd9e93"
+SRC_URI[sha256sum] = "41d1fb062df5bab5ebc3e92971455aa089479e7cd10553278ca54628b9dc9bf5"
 
 DEPENDS = "python3-cython-native python3-numpy-native virtual/crypt"
 RDEPENDS:${PN} = "python3-matplotlib python3-pillow python3-profile"
-- 
2.25.1


