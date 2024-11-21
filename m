Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612A1D75BB6
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:30:40 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.3760.1732163434002886194
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 20:30:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RWMd2usI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732163434; x=1763699434;
  h=from:to:cc:subject:date:message-id;
  bh=yh5G4iIUrcY5JjJ6JrLni4AqHIZRueB21AU/qMNhiHg=;
  b=RWMd2usIIn/3ld34mm0Z3InKWTesiqiwqY/9x/Mh/bl8moDzyZcJllMp
   jk/1UcqMJRmsz+KDiETw13af+oqOYK0xzhYEC1mPr2YxXW2gsSGmv/K6i
   crNLvI6gl1WfANub21cnbDZsMYCPVnyQ1O8EHvJPhR38G0tG2CeEBcVVw
   1FAtDQ/R+J1A9ry16vWyYbjD0TewSAi0i0vRKwOaRVYmidXaczeAtmTYN
   exGrnJoIGZ9tM3p3ujHtwMdCV1zrad33WF/jITVCOzUhzo01q4kB0nAwn
   d6pwJ3EIjTgFkpuY9+NFnfwg64cb5ed1SN88UCkqD9dxo7onJW3bF6zWv
   g==;
X-CSE-ConnectionGUID: qPz+GvSNRyaPjmf00VS+Rw==
X-CSE-MsgGUID: 9ZbH8tWxS5ywNlRkXXGp2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="180328294"
X-IronPort-AV: E=Sophos;i="6.12,171,1728918000"; 
   d="scan'208";a="180328294"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 13:30:32 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B449D4C6E
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 13:30:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B173D5E2E
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 13:30:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A530B401AE
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 13:30:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2C2BA1A006C;
	Thu, 21 Nov 2024 12:30:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] cmpi-bindings: allow creation of an empty package
Date: Thu, 21 Nov 2024 12:30:21 +0800
Message-Id: <1732163421-28704-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28810.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28810.003
X-TMASE-Result: 10--2.799500-10.000000
X-TMASE-MatchedRID: j2oaPHTkaONMQJnusYux1JTp3iXK6AMUNZEftOVQtYZy1m52x4c9LWPO
	zcFgcUr4ohg0wXRQu+2y30IXTXvfRgToMTKLDUFc8t4fUUGeErTBOVz0Jwcxl6vCrG0TnfVUdyG
	0kjowQuOGy3RToYQak3DbV1bIWhh2HxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5tQy
	xTQo3KZ6PAUGUKtopGNNhqv2ipKIKssw9kWFMaoqynM9KW0W4xwykfqo9cu6aLrHxs50w7xFTIF
	5V2e+uZwG89/9jSBK+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 04:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113950

From: Wang Mingyu <wangmy@fujitsu.com>

In the case where cmpi-bindings included into an image, and if no
layers is providing the machine configuration, the build fails with
the following error:
  Problem: conflicting requests
  - nothing provides lib32-cmpi-bindings

This error is because no package was created for cmpi-bindings
since the recipe does not install any files.

This commit allows the creation of an empty package in order to avoid
the do_rootfs failure when this package is included into an image.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
index 5bfa31112..21e6a6ab5 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
@@ -18,6 +18,8 @@ S = "${WORKDIR}/git"
 
 inherit cmake python3targetconfig
 
+ALLOW_EMPTY:${PN} = "1"
+
 EXTRA_OECMAKE = "-DLIB='${baselib}' \
                  -DPYTHON_INCLUDE_PATH=${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
                  -DPYTHON_ABI=${PYTHON_ABI} \
-- 
2.34.1


