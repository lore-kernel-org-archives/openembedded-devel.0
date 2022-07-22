Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B0DC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 10:17:59 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.18161.1658917073003270133
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 03:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qZQUskj9;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658917071; i=@fujitsu.com;
	bh=GlPn9XcXeYdyrmrxOyInLGWmQe3QU9NJRX6VVqstGZs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qZQUskj9DAxbTJr/JYxeBK3mgzky34eiIlKoKI6LMtygxSbJIwluV30n83HgCy+ri
	 vV0nOpwFYqPd1GuM70tuA3YP0xR2/cAo20iXzy7ZHTbEJKFw+fEtMmZGN2mhVJS3g+
	 TxFMKv9CMMQbyfzI3dyBTUC2KiokbP427GLpnoIvRk3BpTr5qEh/t2yLQ3Cw63A+5P
	 SJHMQNl2Vt9UrLzUyanTxx5B99EjgKmehJywkzoBQPG4FWktjTOW32pG43H7slJRJ+
	 dL6APGe/E6k7OFRRM+lUlm4DezBmN9TwTZo9MDFUL3YOFKdUSlBCP6BmVkTv4yTxj+
	 JVreZm1aDzymA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpHte4GG
  SQdM1JouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePVs0+MBX85Ky6f+sjYwDiNs4uRi0NI4CGj
  ROeRhWxdjJxAzhUmib1tRhCJA4wSF5ZPYAVJsAnoSrz4sZgFxBYR0JdYOnsPM4gtLOAjcen7N
  rAaFgFViY2nG8FsXgEPiYf9z8HqJQQUJKY8fM8MEReUODnzCVicWUBC4uCLF0BxDqAaRYnZ0+
  UhyiskXh++xAxhq0lcPbeJeQIj3ywk3bOQdC9gZFrFaJ1UlJmeUZKbmJmja2hgoGtoaKprbKF
  rZGikl1ilm6iXWqpbnlpcogvklhfrpRYX6xVX5ibnpOjlpZZsYgQGX0qx2pUdjHtW/dQ7xCjJ
  waQkyuv+9kGSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnevRwPk4QEi1LTUyvSMnOAkQCTluDgU
  RLhTeYFSvMWFyTmFmemQ6ROMdpz3F24dy8zx9TZ//YzcywHkzO/th1gFmLJy89LlRLnjeEDah
  MAacsozYMbCovcS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeWfzA03hycwrgdv9CugsJqC
  ztig8ADmrJBEhJdXAlDVvR5yiHeNEB2Peoz833fvIsqVO4yTL0wmWlV675c2OX/x/Rqbq/Yvo
  Qm2jD7Me+Sy57b50JouC7Xp/gQ3nKxtOJxt+NHx15uCFGdMjjRYdnsgk3JSb9mHBvMraHMM7l
  m++mn9YvbVFKdJt+tMni/XmHUv3W8OX5dnZVrL1ikIqa1J5W/Hzskv3OO8nWpx/+2hm6u7N1+
  WUOyZ7JeUysTt+a23wf1q+9NKc/7E1kpttCpP2Vlu93lp9QvyFLnPeIdmZ3KnfI0xkc5evvvq
  try5u4vZdDXfrbJffnxteGdbO3LeqL0Fc5tLsXVf/fv7YtKe8qTX/R+eBCEUh8bu3mU75ODL8
  X7HO9STXTpawIiWW4oxEQy3mouJEAMrxvdtXAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-571.messagelabs.com!1658917070!235731!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13602 invoked from network); 27 Jul 2022 10:17:51 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jul 2022 10:17:51 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B3E761B5
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:17:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A86181B3
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:17:50 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 27 Jul 2022 11:17:49 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-graphviz: upgrade 0.20 -> 0.20.1
Date: Fri, 22 Jul 2022 12:04:18 +0800
Message-ID: <1658462658-26249-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 10:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98013

Changelog:
==========
Fix documentation building: upgrade to Sphinx 5.0.
Fix broken user guide links in API documentation.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-graphviz_0.20.bb => python3-graphviz_0.20.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-graphviz_0.20.bb => python3-graphviz_0.20.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.20.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.20.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-graphviz_0.20.bb
rename to meta-python/recipes-devtools/python/python3-graphviz_0.20.1.bb
index 81b591247f..506c738133 100644
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.20.bb
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.20.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=951dd0868a9606c867ffda0ea3ea6da2"
 
-SRC_URI[sha256sum] = "76bdfb73f42e72564ffe9c7299482f9d72f8e6cb8d54bce7b48ab323755e9ba5"
+SRC_URI[sha256sum] = "8c58f14adaa3b947daf26c19bc1e98c4e0702cdc31cf99153e6f06904d492bf8"
 
 inherit pypi setuptools3
 
-- 
2.25.1


