Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2E4EEA876
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 02:32:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62324.1770949954433472712
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 18:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jTrg6bat;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770949955; x=1802485955;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m8JlhcRIuSThpYH+RaTrQbwtOe20a2314QC69eddqeo=;
  b=jTrg6batEgSXGQWTcDVbUW7K0z8qOpn9jU05YfDh6yic9BshEXDXJozP
   Ht8zCkkSjxrBUQgu/WGhYvvQy9G5ZWoeX2JRelD4yDqh5+bytxcAXtN20
   c29oy8LwoS0twfWfMTaC5gRAcz4OAImyuOYGeNM8EIZ7axtSD9LK1HvDu
   kFKrZztTOcr7zplhKpVJvqVHDnOadB1LjqjOdA4nviiD7GMm9lmab7Ldk
   JYVYW0WmYLqRj52bM3KTVUTL3UcnWtwARfpBROITqnMjaqw5k4p6dqRu1
   JRfRc1W4EYJ9PWBoQfiXjRTlGOfrEzV7svg5PPSSnm2x2eDym/6WWl/lP
   g==;
X-CSE-ConnectionGUID: qyD98gOZSfC+cdm78vjX7g==
X-CSE-MsgGUID: nfOfP/1FT3eaZKBd/BJbrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="229402247"
X-IronPort-AV: E=Sophos;i="6.21,287,1763391600"; 
   d="scan'208";a="229402247"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 9A42A4071C8
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:32:32 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4AB8F1C00F9C
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:32:32 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 0046620000F6
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:32:29 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/5] Investigate hotdoc and add a recipe to build it
Date: Fri, 13 Feb 2026 10:32:12 +0800
Message-ID: <20260213023217.19706-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124365

In order to solve the issue of orc
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16144

Add new recipe hotdoc and its runtime dependence to make gstreamer/orc to use it.

Liu Yiding (5):

  [oe][meta-oe][PATCH] hotdoc : Add new recipe

  Add following 4 recipes for runtime dependence of hotdoc.
  [oe][meta-python][PATCH] python3-schema: Add new recipe
  [oe][meta-python][PATCH] python3-toposort: Add new recipe
  [oe][meta-python][PATCH] python3-wheezy-template: Add new recipe
  [oe][meta-python][PATCH] python3-dbus-deviation: Add new recipe

 ...ment_scanner-fix-function-prototypes.patch | 32 +++++++++
 ...y-backports-dependency-on-sufficient.patch | 72 +++++++++++++++++++
 .../hotdoc/0003-CMake-4-compatibility.patch   | 44 ++++++++++++
 ...ke-path-to-relative-in-FlexExtension.patch | 34 +++++++++
 .../recipes-devtools/hotdoc/hotdoc_0.17.4.bb  | 28 ++++++++
 ...o-donwload-requierment-which-will-ca.patch | 27 +++++++
 .../python/python3-dbus-deviation_0.6.1.bb    | 20 ++++++
 .../python/python3-schema_0.7.8.bb            | 10 +++
 .../python/python3-toposort_1.10.bb           | 10 +++
 .../python/python3-wheezy-template_3.2.4.bb   | 13 ++++
 10 files changed, 290 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
 create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
 create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
 create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
 create mode 100644 meta-oe/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-schema_0.7.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-toposort_1.10.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-wheezy-template_3.2.4.bb

-- 
2.43.0


