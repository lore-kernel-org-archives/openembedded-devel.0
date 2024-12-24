Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01330C02197
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:32 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.30358.1735032439837642540
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Iy/OOZBZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032447; x=1766568447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=12+585MvSNTM0S3okTIT/8nRI6gOCOOOOPrfRimuqjc=;
  b=Iy/OOZBZpUWqBvZayM0aIDMOk8JtuRHavJlL6likZs5EHY6FnFP2zcJp
   oJxgUQmU0XE5lQx6T9/+lgkCbEnzDp4NxXWNGjS5+9uog1eyxEpFCHJWb
   lfdmrZMNjvMCoqp5qLtzKL03zKUVABIwZdDO4IbfVRp/TWwhGrdEHskqr
   sAUqyt42mJR6E2YUl99shPBhLAXlOMnxLu0wRQ46sGD1s97h5SRi+my70
   CUYdZENL814+p5oeCtrAcvcVK7fPcivZOa7HXjveyz+O/zkDvGUQZryLk
   fBjKTGCo/UhzLFxh9EyvLlYpRaZ4FrPIL35gKofL9CNx6v3PktpQIqIVf
   g==;
X-CSE-ConnectionGUID: hDBc+RPSSw6SQwpxTVTvvQ==
X-CSE-MsgGUID: lKTbMM26RB+6XajLPrh1oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="172776100"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="172776100"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:25 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C250D501B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CB856CF7EB
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 602CB6B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:22 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0988E1A0071;
	Tue, 24 Dec 2024 17:27:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/67] python3-ipython: upgrade 8.30.0 -> 8.31.0
Date: Tue, 24 Dec 2024 17:26:31 +0800
Message-Id: <1735032421-13513-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrfAfDAGiA7MwsW9p4Xz/o6Rgp+K7Be8kj3YzceI/tB0yoxq6v/QeQI0k2F
	s7IftsihFdTsrHF0IXXfUZjQPOFwM3DGBtLuxC5B0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114512

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.30.0.bb => python3-ipython_8.31.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.30.0.bb => python3-ipython_8.31.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.30.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.31.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_8.30.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.31.0.bb
index 41aa0dadf7..d8b57a5c9a 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.30.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.31.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "cb0a405a306d2995a5cbb9901894d240784a9f341394c6ba3f4fe8c6eb89ff6e"
+SRC_URI[sha256sum] = "b6a2274606bec6166405ff05e54932ed6e5cfecaca1fc05f2cacde7bb074d70b"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


