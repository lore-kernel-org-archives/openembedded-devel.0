Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94D7C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 09:36:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.20973.1641980212342579629
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 01:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J5coOPSP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641980210; i=@fujitsu.com;
	bh=TuT4m2dL4VMHpvfW/DKLlWlgq+cmbQT8XLJAKXMo+N4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=J5coOPSPOp01fxNbj8ydff0+jRqKteb/RfpdQDkiy4EtQp//XseNJl6gdOpICZ5Gz
	 goRQFgUhc9w0UADiiimwCqwRLYPs8pE6RPQfePyFzdIf0Kn5Hq2pdEpScWFsr4E1vy
	 kxW5fK63RdF6KvwyFaV6zWDaUhwUXI/tNO5dRzBV42BserxnoZAs8oYFkk5Tzf7yw0
	 y8RY0yvcc65IEjgxpCFXJaESPn5+mNhD+px9GD6qwDsvtFWvpJ/VRD8T+IBJ0dZmti
	 ZWfO7JDcNqro1ZxupXMSK5aaPphgYV7P9QEYndEaV3pGDQVte9xH5OhfuT9MzqRWoJ
	 NhXyuNeniDNQA==
Received: from [100.115.37.212] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 35/19-09428-231AED16;
 Wed, 12 Jan 2022 09:36:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqGu08F6
  iwfQGfouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP71rOMBacFKi71PmNtYNzM38XIxSEk8IRR
  YmvzXBYI5wKTxNGPP6Cck4wSt1ZcYOpi5ORgE1CXeHzzNSOILSKgL7F09h5mEJtZQFWi++Iad
  hBbWMBTYsHR10A2BwcLUPzWJzGQMK+Au8TGdyfByiUEFCSmPHwPZnMKeEhcvzGTDcQWAqp517
  qABaJeUOLkzCcsEOMlJA6+eAHVqyRxYsVHJgi7QuL14UtQcTWJq+c2MU9gFJyFpH0WkvYFjEy
  rGK2TijLTM0pyEzNzdA0NDHQNDU11jY10DS0s9RKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitz
  k3NS9PJSSzYxAsM4pVhh7w7Gyyt/6h1ilORgUhLlzem9lyjEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgjdqPlBOsCg1PbUiLTMHGFMwaQkOHiUR3ry5QGne4oLE3OLMdIjUKUZFKXHeIyB9AiCJjN
  I8uDZYHF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMwbvQBoCk9mXgnc9FdAi5mAFidz3AZ
  ZXJKIkJJqYOKR32I3Lz0trllijc+9E3fPlNX4TQps9px7ylPyN8+jkxeOBgqruIqcXsBl6M8Q
  rVNoM9382E5RxbTZ3f0lLzU6oqQC1qUePSdQN1VR3PrlJY4Fd3zSW9kCnkisn7ylerWNxuf94
  nbRulOaTs4x4V8ora1570aF28GMi63Nzj1BbwtYVs9rrPz7r/ycb9mG4H4/sf9f06bMk1RKXn
  qxp/jxGmdx/9s7p2dsuNzFcfWlzW0e63nrZLMd+lNPzGOQ4puz7cderqrMmOeOd94GfJOra9Y
  R36GkXf4nZeKRfrtH+ZZ/b52O0GbZuGDC6pXf7ONUD1jXz7jL8qrP+eSTJ4VJe4J3tF/OrwhZ
  O/vZHyWW4oxEQy3mouJEAPOSpVdeAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1641980210!9128!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23895 invoked from network); 12 Jan 2022 09:36:50 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jan 2022 09:36:50 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CE775100197
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:36:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C1274100186
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:36:49 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 09:36:34 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymongo: upgrade 4.0 -> 4.0.1
Date: Wed, 12 Jan 2022 17:36:21 +0800
Message-ID: <1641980182-11598-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641980182-11598-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1641980182-11598-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 09:36:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94783

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
===============================================================================
:meth:`pymongo.collection.Collection.update_one`,
:meth:`pymongo.collection.Collection.update_many`,
:meth:`pymongo.collection.Collection.delete_one`,
:meth:`pymongo.collection.Collection.delete_many`,
:meth:`pymongo.collection.Collection.aggregate`,
:meth:`pymongo.collection.Collection.find_one_and_delete`,
:meth:`pymongo.collection.Collection.find_one_and_replace`,
:meth:`pymongo.collection.Collection.find_one_and_update`,
and :meth:`pymongo.collection.Collection.find` all support a new keyword argument
let which is a map of parameter names and values. Parameters can then be
accessed as variables in an aggregate expression context.

:meth:`~pymongo.collection.Collection.aggregate` now supports $merge and $out
executing on secondaries on MongoDB >=5.0. aggregate() now always obeys the
collection's :attr:`read_preference` on MongoDB >= 5.0.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-pymongo_4.0.bb => python3-pymongo_4.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.0.bb => python3-pymongo_4.0.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.0.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.0.1.bb
index ea057c1804..8eb0833fd0 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.0.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "6d158eadba3aaab276a3b188b7f467ab0384b68c1d31cfa87335e52addd9dcb6"
+SRC_URI[sha256sum] = "13d0624c13a91da71fa0d960205d93b3d98344481be865ee7cc238c972d41d73"
 
 inherit pypi setuptools3
 
-- 
2.25.1


