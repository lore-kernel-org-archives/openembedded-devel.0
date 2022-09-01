Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0263ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 10:18:02 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.10391.1662027479067990692
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 03:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pyLhqC+C;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662027477; i=@fujitsu.com;
	bh=1CNkTkz/vR+mlZT6Uz65Pe33CodjbdAexT9+eCk/Dbg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pyLhqC+CyEmvhEh6AjkP5YB/zf0LvphGWMZzBBwWYvlLCEqSIkTx+uYm+Q0tM88/a
	 tmDMMKgz5sa2k+Sl0ALR5qkaCdhf3adVYJT8MxIKhjPr6eTPAe8wGgJ+Q/1OjqE7b8
	 uGFqh/J4Y2vjNlF1XgcbkqPLTlZMeoHpclAmMW7S3+zwO7gVIdgD+6VoVuvJA8o5Lp
	 seqKgBV9gOZwk4ayt7YzVomGVGpa88/xZKj8XJqub6uVWZkqnk/vK735r2YRDBkAEf
	 /bGlxsDm6yaWbCeWcs+jTKWkCQ+HTl2ytglGNiqbalXyjh6JoicBruYxtuhWuHkAhj
	 UCkz2HanQYaFg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MxSfdKm0C
  yweIdNhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bJtq2MBb85Kr5+msDawLiMo4uRi0NI4Amj
  xJ53lxkhnBtMEp2t+9kgnAOMEp9+djF3MXJysAnoSrz4sZgFxBYR0JdYOnsPUJyDQ1ggSKLlX
  w1ImEVAReLnnOOMIDavgIfE2/PtYK0SAgoSUx6+Z4aIC0qcnPkEbAyzgITEwRcvwMZICChKzJ
  4uD1FeKdH64RcLhK0mcfXcJuYJjHyzkHTPQtK9gJFpFaNVUlFmekZJbmJmjq6hgYGuoaGprpm
  ukaGBXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYOilFLNd2sE4t++n3iFG
  SQ4mJVHefh2BZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvHpNQDnBotT01Iq0zBxgHMCkJTh4l
  ER497YApXmLCxJzizPTIVKnGBWlxHnXgiQEQBIZpXlwbbDYu8QoKyXMy8jAwCDEU5BalJtZgi
  r/ilGcg1FJmLcCZApPZl4J3PRXQIuZgBZPn8kPsrgkESEl1cDE6SMYu7D2bEGmcVUSh8WJ07Y
  aZzp6Io9kbPeZfC5eRu97Ms+1jaEzt5/8P60yR+DCyuMP5/6u/sBazp5sZiC1KWX7iwxWoSmN
  X/gVUw2O66vZXbt9XWZ15cSWGTcyjsb+XlO9S9rq9v1H2nbbHU4LBuYZK72qsK3Q459eZKRQY
  /Li3s2YeEmpt88rZ/yqvuR3p2hvs+3LeZGT127y/7Pry/nUpYmXT3dtCbDyY1RcZXiTfVajAu
  ut9b/+L+b+XtJuZ3DJ/JyAKWMhW6fbJsvEX70RhVpXuT9InLNjLF+r8PrN0r7G/1u9IlJqxfU
  F+6Xzu4s37F4q0rV92xtZhZiZ1vus91f0zpjS5FN0IVOJpTgj0VCLuag4EQCAZBIrOAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-591.messagelabs.com!1662027476!128242!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25038 invoked from network); 1 Sep 2022 10:17:56 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Sep 2022 10:17:56 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 942E01000CC
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  1 Sep 2022 11:17:56 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7B5AE100078
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  1 Sep 2022 11:17:56 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 1 Sep 2022 11:17:55 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-flask-socketio: upgrade 5.2.0 ->
 5.3.0
Date: Thu, 1 Sep 2022 18:17:47 +0800
Message-ID: <1662027467-13197-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Sep 2022 10:18:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98583

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...-flask-socketio_5.2.0.bb => python3-flask-socketio_5.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.2.0.bb => python3-flask-socketio_5.3.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.2.0.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.2.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.3.0.bb
index 9deae8b41d..1078b09eb6 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.0.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[sha256sum] = "19c3d0cea49c53505fa457fedc133b32cb6eeaaa30d28cdab9d6ca8f16045427"
+SRC_URI[sha256sum] = "fa547d0c39ccc6223aad191f3f6ef906383eab67d25ffc343b15bfe33d6478fe"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
-- 
2.25.1


