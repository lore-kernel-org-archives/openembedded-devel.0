Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E516C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 06:52:43 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.14343.1669186352532534869
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Nov 2022 22:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vUer8hkV;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669186350; i=@fujitsu.com;
	bh=09YNRK/FmQZ3QAMoRgzM95+hifkLzeJiRVg8o4kaG34=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vUer8hkV0fKnPo68r+r9m92dIl0i5PcY6TGvVhCqPKthPrIQLubfyBUdYasnQiywj
	 x2vBjbMWSwp6khKhfKSqt7tKjOwznZe2nxGbHYLi736hxFv9/E8JWMR+NedlAfIJQO
	 Kj0Y34ZOSZNdPV5BCPxP0ow8q5FPKnKizHtESyFRrI0086Ga83CVo1eL0ZOBGVXK/b
	 x6l7A8fKMXK5uhcF7FOLeGIpy3hzGPivQJxjsRwS8xMyHWhgSkNZyJhXFnm36PDHuS
	 ZOSQf90RWtRpggkEhvvKqGerSZTTrNgUpzbV8cdRBX/g2XW9HziTyTkNRzigkdGIT+
	 GLbz3C0RlxDQA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORqKt3uDb
  ZYP1VJouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP5LoOCFZwV18/9YGlgvMHRxcjFISTwhFFi
  5+KT7BDOdSaJjk2nWSGcA4wSH361MncxcnKwCShILNx6hhXEFhHQl1g6ew9YXFggTGJjVw8Li
  M0ioCpxr2M1O4jNK+AucXz+bUYQWwKod8rD98wQcUGJkzOfgNUzC0hIHHzxAijOAVSjKDF7uj
  xEeYXErFltTBC2msTVc5uYJzDyzULSPQtJ9wJGplWMZsWpRWWpRbpGBnpJRZnpGSW5iZk5eol
  Vuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgSGXUsw4ZQdjz7I/eocYJTmYlER5
  tTbXJgvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4NXZAJQTLEpNT61Iy8wBhj9MWoKDR0mE1+UAU
  Jq3uCAxtzgzHSJ1ilGXY+bXtgPMQix5+XmpUuK8dSBFAiBFGaV5cCNgsXiJUVZKmJeRgYFBiK
  cgtSg3swRV/hWjOAejkjDv/31AU3gy80rgNr0COoIJ6Ag1iyqQI0oSEVJSDUxlW5nsrxkusIq
  bKu+ulHv9kM26ezmpBzt8lZb8DFghXPbmT1n+K971VpZ/t3tatz5eeinha+H3tEVXPuW0vmZj
  cXu6kOvmuRd9jinmjL63meReeP8+lizyjfNnRsyWp5s3hUZ8ZnQSW532UC8m6Oqumqj211sn7
  vYT2WPNfSdg0eeJLrnhhbZR3AkZf2Ztil1XwHCmd6GIS6+/YvTMW+q9Zc9czGas9c5VPrh6Uf
  eapuDWsOzjZXN62wUPWVm3BHzb+lpfq4fdL+FxqOSnZdXr5zhtmbwq+GrGroVuZ1kCb1Q8m/T
  7l215Z1p+3q2j27xPrPDKtPUzMF+3dVmL1JR+jv4vDGl3V08KTol87q7EUpyRaKjFXFScCADc
  kL7/QAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-585.messagelabs.com!1669186349!96374!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20074 invoked from network); 23 Nov 2022 06:52:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Nov 2022 06:52:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AB7DC100182
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:52:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9F817100043
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:52:29 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 23 Nov 2022 06:52:28 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-python-vlc: upgrade 3.0.16120 -> 3.0.18121
Date: Wed, 23 Nov 2022 14:52:08 +0800
Message-ID: <1669186328-2895-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99693

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...-python-vlc_3.0.16120.bb => python3-python-vlc_3.0.18121.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.16120.bb => python3-python-vlc_3.0.18121.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.16120.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.18121.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.16120.bb
rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.18121.bb
index a4d21a50e..518dbb205 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.16120.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.18121.bb
@@ -3,6 +3,6 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "92f98fee088f72bd6d063b3b3312d0bd29b37e7ad65ddeb3a7303320300c2807"
+SRC_URI[sha256sum] = "24550314a3e6ed55fd347b009491c98b865f9dfa05a92e889d7b0a2210e7485b"
 
 inherit pypi setuptools3
-- 
2.25.1


