Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF99C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:36:37 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.22804.1647419796246341285
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HB+vk0+R;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647419794; i=@fujitsu.com;
	bh=cU8fZuwLrZKtPqzWP8MsUUTW4iFO36dWPomZkHdlPxA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=HB+vk0+R8THWmxAcWdivd281/vTKbopy49zqX9LtmZJp9W8692EqBYaXA1h5sSiXd
	 v+Lur/pcbhM/byqqpn0Loufk1DgzTuNzFjqmT80Csk97O1j6pgUeDRecvK0eem85LW
	 DBdqZKRdon5PSulRW99HttxJfO2WkXCZnzle+Uh1xIKkz4+qVERiblShTCyr/gf0gU
	 qgSY5ffnFAB/fHZtMSechs2y4A6IPRIaUwR8dyD03cgsBqPRrmb+FbEg12mH4VJ+OU
	 RcVeqPrxemxOHJ9x6k0R3FmxLpsuEV+8eF1Qp/5gABpRAHwQcvLMjbTUD6f4O+MOC+
	 IzIXJqdl0cjbg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRWlGSWpSXmKPExsViZ8MRojtxoWG
  SweKlNhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ac3Q9YClYLVvy/dYKlgXE7fxcjF4eQwEwm
  iR9dT1khnBOMEruunWfuYuTkYBNQk5h+6wYriC0ioC+xdPYesDizgIrEi9897CC2sICvRM/2q
  SwgNouAqsT5jf+YQGxeASeJ9R+egtVLCChITHn4nhkiLihxcuYTFog5EhIHX7yAqlGUmH25mQ
  XCrpCYNauNaQIj7ywkLbOQtCxgZFrFaJ1UlJmeUZKbmJmja2hgoGtoaKprbK5raGakl1ilm6i
  XWqpbnlpcogvklhfrpRYX6xVX5ibnpOjlpZZsYgSGWUqx6qIdjPtX/dQ7xCjJwaQkynt+pmGS
  EF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne2wuAcoJFqempFWmZOcCQh0lLcPAoifDeBEnzFhck5
  hZnpkOkTjEqSonzMswBSgiAJDJK8+DaYHF2iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwr8
  0MoCk8mXklcNNfAS1mAlo8T1oPZHFJIkJKqoFJ4aTyob9b//9ri4sT23mtY+WvpXt+bV7McHL
  avLn/wzJdgkQTlnw2nt61K3Wd4sumc25cf3LKPwf+eG9d88dqkUPFPtFFSu+bZLcWOa747iso
  yHDKVnbXkcc5zN4Py+W1clR0bzkUvPt8vj4j9E7B4Usi23W7Op0Xb//qLZvdEeT2/fzW5AKpK
  sPXa7n3S3Xsq+e7sfbGg+jKBxPCD5jdT92gcMza/cxh54mTGr+tv/pv6fozFXFVshfeT9+lE9
  smMnNeWJzQ51DdGUITmtc8rl/2O3NXj+6P6zPSIlef+al8esHbNFnl2yLd6/dlbFsWuW/G0Qc
  b2PnPbJ/60c5/2qRN3T/j3nAaCl6e1nz30BUlluKMREMt5qLiRABDHKZFLgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-548.messagelabs.com!1647419793!31368!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7571 invoked from network); 16 Mar 2022 08:36:33 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-13.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Mar 2022 08:36:33 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22G8aXTH003498
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:36:33 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Mar 2022 08:36:32 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.10.0 -> 2.11.0
Date: Wed, 16 Mar 2022 16:36:16 +0800
Message-ID: <1647419779-81651-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 08:36:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96015

Changelog:
=========
Add new (optional) doc_node attribute to nodes.Module, nodes.ClassDef,
and nodes.FunctionDef.

Accessing the doc attribute of nodes.Module, nodes.ClassDef, and
nodes.FunctionDef has been deprecated in favour of the doc_node attribute.
Note: doc_node is an (optional) nodes.Const whereas doc was an (optional) str.

Passing the doc argument to the __init__ of nodes.Module, nodes.ClassDef,
and nodes.FunctionDef has been deprecated in favour of the postinit doc_node attribute.
Note: doc_node is an (optional) nodes.Const whereas doc was an (optional) str.

Replace custom cachedproperty with functools.cached_property and deprecate it
for Python 3.8+.

Closes #1410

Set end_lineno and end_col_offset attributes to None for all nodes
with PyPy 3.8. PyPy 3.8 assigns these attributes inconsistently which could lead
to unexpected errors. Overwriting them with None will cause a fallback
to the already supported way of PyPy 3.7.

Add missing shape parameter to numpy zeros_like, ones_like,
and full_like methods.

Closes PyCQA/pylint#5871

Only pin wrapt on the major version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_2.10.0.bb => python3-astroid_2.11.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.10.0.bb => python3-astroid_2.11.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.10.0.bb b/meta-python/recipes-devtools/python/python3-astroid_2.11.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.11.0.bb
index fc23f17c6b..1a69be2f98 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.11.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "f616b9687a5f4afa673dfd2d684d2b6f38365c8ad7c6f27229dda1ede750c445"
+SRC_URI[sha256sum] = "d56f6a5239981567ceaa3413d4971936c7b4b0c796fcff90c24254dcf8b05b62"
 
 inherit pypi setuptools3
 
-- 
2.25.1


