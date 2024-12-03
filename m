Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745F9E6C5E7
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8205.1733185017914802578
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j8k/lkQq;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185022; x=1764721022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cdfb6eAteCDlQ22tVZmgB3Epz4IWDdtyGgOLfivDX28=;
  b=j8k/lkQqKqkV4833kbOeNoKrCy9PeP19i+x2/yugwvnZVH61dwBX4+vz
   Nrrb53smtncqXMVHJ3ChB7QbQYbikt/bktb6Q5k1wiaMNt0MfMO/NsRD0
   RUHTSZWB8rD3jI4hb6d3s7c69Btx5SyWnJI8EHpVEXbp/m/kJ/AaiJX1z
   TfENURL+m59RxU32USWtTjB2OyGdZfcOP09VTkFPt4Cbls2SawmvCCIbU
   bQ+rqEIPZPX5NxFKMshEVweAO8sQqD6U802UHwupVVn/TEuebPSblV3UX
   DMtHstwd/5IXgFJ1Ck3w7HA2GLl1w3P+tDG1I6+q8B8srnh18z1Hud5lK
   w==;
X-CSE-ConnectionGUID: eS9CakXuTMWcr+ZEaeCnFg==
X-CSE-MsgGUID: vQCyEtpsSc2O8SWGoQzSyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="170725147"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="170725147"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:01 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 75B63D480A
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:59 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F36CD4BC2
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DD3296CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7DA7F1A0003;
	Tue,  3 Dec 2024 08:16:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/34] python3-pdm-build-locked: upgrade 0.3.3 -> 0.3.4
Date: Tue,  3 Dec 2024 08:16:27 +0800
Message-Id: <1733184999-27041-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--3.253600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrGeIujupKDm+agHpYoVHW+b6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BS5VVMJCvramAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFC8bXif9++1H5e5hljHau5S4TY
	PZmfHvfQN71s0oThK2zaN2Vm8wwl7FDdE6drr4SQy4SKi6ljLDBhSWpjovSJpRmij01e5ikux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114163

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- compatibility with dependency-groups in pdm 2.20
- dropped support for Python 3.8

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-build-locked_0.3.3.bb => python3-pdm-build-locked_0.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm-build-locked_0.3.3.bb => python3-pdm-build-locked_0.3.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb b/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb
rename to meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.4.bb
index f20f11ff44..72ffe61256 100644
--- a/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "pdm plugin to publish locked dependencies as optional-dependencies"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19382cdf9c143df4f00b9caa0b60c75a"
 
-SRC_URI[sha256sum] = "b784135abf62b93ce0a11332ee24723a2699b7f266fddb7950a5b70c93df6214"
+SRC_URI[sha256sum] = "46dd94f6134e351a8885754ffef95a395e774f1f338348b763f9a208fd19efd7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


