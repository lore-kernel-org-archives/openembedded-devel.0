Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AD7C5320F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2887.1722934020815067197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MLG4y8RN;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934020; x=1754470020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=B8prpOgFPAMEpmC3PRgTyYcjh0ej1VIjRxBgyzSx0fA=;
  b=MLG4y8RN9XW5Hm0ZyfmFrh0qb12f7hZNthg+fl+lYgRQkeczAmQkpozE
   phkuVeW78Jm6OWl7GUNcFZTDGa9/wZgS92wqxB2uLFaLqMAfgz0G3Derb
   Q8CTXhlROLfOq2V6fv5cDNc6lcwGQqKoo9ZeGjZyrVWR866g005gvuGVW
   tWvgNFht9bg423EcPIYgZRp2xCaQx6YRqq8zCejfiMMqo16mGGRzD8wa5
   1LT/H2upvCGB6iqyALogv5FGsAwm26/nuZX/5uiMvpY0I5hY3eVribyDE
   Zar4XtiS+9niE7lzetK384OWPSee7PTKCrNNWncXU9ovkLbW1EU/1FRP9
   Q==;
X-CSE-ConnectionGUID: zflBA9bAQ/OD/jixYAFvKg==
X-CSE-MsgGUID: fBaZX6J0RIiyRdCWYhmNvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="158213948"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="158213948"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:59 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AF54BD800D
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F040FBF496
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 82224E5A19
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 312271A000D;
	Tue,  6 Aug 2024 16:46:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 31/60] picocom: upgrade 2023-04 -> 2024
Date: Tue,  6 Aug 2024 16:46:05 +0800
Message-Id: <1722933994-32549-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.632500-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLP85tlrdTfE+wAaNLqXHEquce7gFxhKa2YkAyCbA7KVws5GlXF672zo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXIpVb3aV63bj5xMONC6FQPWQQmt4PLdqaktpg
	VTu0XnWosk7Z7IG7KjXEoB7Rg2IqZxUIR7JUt+sW75yW5kG1JNqsc4fYWxAR3+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111547

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../picocom/{picocom_git.bb => picocom_2024.bb}              | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/picocom/{picocom_git.bb => picocom_2024.bb} (86%)

diff --git a/meta-oe/recipes-support/picocom/picocom_git.bb b/meta-oe/recipes-support/picocom/picocom_2024.bb
similarity index 86%
rename from meta-oe/recipes-support/picocom/picocom_git.bb
rename to meta-oe/recipes-support/picocom/picocom_2024.bb
index cc0d88fac..e05f2a7bb 100644
--- a/meta-oe/recipes-support/picocom/picocom_git.bb
+++ b/meta-oe/recipes-support/picocom/picocom_2024.bb
@@ -4,10 +4,9 @@ LICENSE = "GPL-2.0-or-later"
 HOMEPAGE = "https://gitlab.com/wsakernel/picocom"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000e4830620e310fe65c0eb69df9e8a"
 
-BASEPV = "2023-04"
-PV = "${BASEPV}+git"
+BASEPV = "2024"
 
-SRCREV = "12537df0314767d5af35bddddbbca3694e6a0342"
+SRCREV = "7b6acbd421a2d4ca99376b7b427828dc1bcba4d8"
 
 SRC_URI = "git://gitlab.com/wsakernel/picocom;branch=master;protocol=https \
            "
-- 
2.34.1


