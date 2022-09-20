Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8289C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:26:44 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.7410.1663640803297978759
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=j6QZ1YER;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640801; i=@fujitsu.com;
	bh=Oj8owtMPFyHneTYRrBTKMP9+h20Or770SKJAcC1XLYc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=j6QZ1YERH0dYVahcX9rxZMoQ7/Y8NOsIS30h9PZeKL7GVdtMTVZwjrIAMTXGJk12L
	 vW4PVe66D/Q8AvIx+2PHPjYBL43yPKkjiFQM5dPkJGVaOvfPbYqn5mNYzE2qaFrTKP
	 Gd2Kw+4ZwMgTrCqsypYjwd3kPgNLep9/wdSbPlnh5UcXWjyyqCG6RCHIiHTStvY+eO
	 3bD3jfnd0DpdrfpBkvwUVK3ioK6E/ujAd7au6HF27kJPAJpuZ1zrRZK7HDbgm255Ih
	 eoUQQgqUwiMY8yc6DMGJG0qj/M//wxZelbfWnNxxJga5nm0Nzg9wm5jnw6ST5Kk4o3
	 SJmETpcAvxPEA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MxSfeBima
  ywceZchYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bNG+2MBUc5K75NXc/ewPiMo4uRi0NI4Amj
  RN+Vv6wQznUmiaeXLkE5exglVs38ztjFyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sECQxPrf08FqWARUJe40TGUCsXkFnCSu3prLBmJLCChITHn4nhkiLihxcuYTFog5EhIHX7
  xghqhRlJh9uZkFwq6QaJx+iAnCVpO4em4T8wRG/llI2mchaV/AyLSK0TapKDM9oyQ3MTNH19D
  AQNfQ0BRIG+kamhrrJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWllmxiBAZnSnHa
  zB2MW/b90jvEKMnBpCTKy1WnkSzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtdeUDNZSLAoNT21I
  i0zBxgpMGkJDh4lEV45YLQI8RYXJOYWZ6ZDpE4xKkqJ8+5TBkoIgCQySvPg2mDReYlRVkqYl5
  GBgUGIpyC1KDezBFX+FaM4B6OSMC8nyBSezLwSuOmvgBYzAS2+oaIOsrgkESEl1cDEPrvj66X
  Hj5ZX75l2lW/u6qKg14tiX/TOrP56pE224jtXwsxrGtwernYW+zfpPd60kXPxrp9nVUN+r74k
  +m0i7+sJFuf756bE64pduW1ks+pr6LzquA3/Cxj0/+uKdR09svrGPxUhPx1Jt8QPm5O0p2+7n
  xxx791lxf5/BgV6vwvMrm1Q7Vt1NEjw9+tLfokbF0S6vHkzK9zQSc+p7ojh1L7J7jb/bXcfbd
  +SW/61f0bM0VtLsw7V+etc+t6z9+qtPcWVRV5vNmY5rfjrYhFxVfLoloD2+sO3HLYtPmNqe6l
  GLeaZQ4WFQv+aVpnohHzWT4YrvE3fX4o8fIz37tbVHZ/n2P5VV/K8J3va5AdLiBJLcUaioRZz
  UXEiAFSfTAhJAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-728.messagelabs.com!1663640800!34525!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4013 invoked from network); 20 Sep 2022 02:26:40 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:26:40 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E6FA71000CD
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:26:39 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D9F6D1000CC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:26:39 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:26:38 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-socketio: upgrade 5.3.0 ->
 5.3.1
Date: Tue, 20 Sep 2022 10:26:25 +0800
Message-ID: <1663640785-27745-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:26:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98889

Changelog:
==========
Always pop allow_unsafe_werkzeug option from kwargs #1877

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-flask-socketio_5.3.0.bb => python3-flask-socketio_5.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.3.0.bb => python3-flask-socketio_5.3.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.0.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.3.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.3.1.bb
index 1078b09eb6..50e820ba37 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.1.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[sha256sum] = "fa547d0c39ccc6223aad191f3f6ef906383eab67d25ffc343b15bfe33d6478fe"
+SRC_URI[sha256sum] = "fd0ed0fc1341671d92d5f5b2f5503916deb7aa7e2940e6636cfa2c087c828bf9"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
-- 
2.25.1


