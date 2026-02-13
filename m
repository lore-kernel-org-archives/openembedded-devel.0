Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1861CEDF149
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 10:10:22 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68563.1770977415100600918
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 02:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=srOLBieZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770977415; x=1802513415;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PfFpJxZ+I4wf/UD+9imEoA6qQqnznFjcucEioXInj3Y=;
  b=srOLBieZACxUiwuAtPz5uVq/LEQTmL7GC1pKydVDsTI3e2e8YFMMiuqe
   6ApjTUiTK6FoOxgAqak0XS9iYRjaievhR1CgNUSMeBexD/Ox4A3H8ELOk
   g8/w+v3lbLm/qkqtEM78eou6y4g8pdcy4ebAWhfK8MEewgLkEAZyvNedp
   ze6BydvSxidD5hNw8qs7V0BTy5ILSwY6VUxLTTDz5IMpvDu9FsHZZFk56
   LxtKi3qkVQUP5Zxu+cSMOOvW61YEScABlxMSspMOLQC7xDMzZn8PudgZt
   LetyRRIN75/JlJ3Bjv1wgoChwKnwUL/HzmEfqt9Q6r/P6WR8mb3RAuLlE
   w==;
X-CSE-ConnectionGUID: S7Rt31OkRRiPRQuhlsP8YQ==
X-CSE-MsgGUID: kMYd8ZO6RDyjAZgnue6iOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="230172723"
X-IronPort-AV: E=Sophos;i="6.21,288,1763391600"; 
   d="scan'208";a="230172723"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id EF50F100014D
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:12 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 93033180A333
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:12 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 40049200020B
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:09 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 0/5] Investigate hotdoc and add a recipe to build it
Date: Fri, 13 Feb 2026 18:10:00 +0800
Message-ID: <20260213101006.21517-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 10:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124381

In order to solve the issue of orc
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16144

Add new recipe hotdoc and its runtime dependence to make gstreamer/orc to use it.

Liu Yiding (5):

  [oe][meta-python][PATCH v2] hotdoc : Add new recipe

  Add following 4 recipes for runtime dependence of hotdoc.
  [oe][meta-python][PATCH] python3-schema: Add new recipe
  [oe][meta-python][PATCH] python3-toposort: Add new recipe
  [oe][meta-python][PATCH] python3-wheezy-template: Add new recipe
  [oe][meta-python][PATCH] python3-dbus-deviation: Add new recipe

 ...ment_scanner-fix-function-prototypes.patch | 32 +++++++++
 ...y-backports-dependency-on-sufficient.patch | 72 +++++++++++++++++++
 .../hotdoc/0003-CMake-4-compatibility.patch   | 44 ++++++++++++
 ...e-flex-with-noline-option-to-prevent.patch | 29 ++++++++
 .../recipes-devtools/hotdoc/hotdoc_0.17.4.bb  | 28 ++++++++
 ...o-donwload-requierment-which-will-ca.patch | 27 +++++++
 .../python/python3-dbus-deviation_0.6.1.bb    | 20 ++++++
 .../python/python3-schema_0.7.8.bb            | 10 +++
 .../python/python3-toposort_1.10.bb           | 10 +++
 .../python/python3-wheezy-template_3.2.4.bb   | 13 ++++
 10 files changed, 285 insertions(+)
 create mode 100644 meta-python/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
 create mode 100644 meta-python/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
 create mode 100644 meta-python/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
 create mode 100644 meta-python/recipes-devtools/hotdoc/hotdoc/0004-Use-flex-with-noline-option-to-prevent.patch
 create mode 100644 meta-python/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-schema_0.7.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-toposort_1.10.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-wheezy-template_3.2.4.bb

-- 
2.43.0


