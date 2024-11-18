Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB3ED44006
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.37265.1731922212291396906
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ExFqNWUb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922213; x=1763458213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RHdQgflZQYycV6pKkdnViWnEPIbtJsfzeoFxcJRdlX4=;
  b=ExFqNWUba3mREP2nJ8B9idhdhV+Mjxk12DN4P8rOCai3uYwYBEgR4c/P
   NKMiRKFpcKL8+dckaDH6e66Z1tuL6ki3Avgiq2L7LPD5KfEgVyAeyWryw
   FSieord5bmdCydfG8QmEAmpA1Km50cqlWHnoQfhdy0rE0yqAHPOQ22Erp
   FnMOCxd9tTD0ssDCNO7/kA1pPFyko9jzOkZkimQdTZv38+s1PNGvssyYZ
   60klwrKYMLPqpANCBJcwltgYVrmOGo4r30geZ2wnghSDyhJfEEjLhlZXm
   +A+fPkhJ25Co+J2daJWdkVVXTP/bIczOdvSKLIxw3e45Q8WvZyMRYvZ5w
   A==;
X-CSE-ConnectionGUID: NJJKTY7yQVmfkh6Y6Anbig==
X-CSE-MsgGUID: h/CTyCGrQEirsAZZeqlEVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="180785033"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="180785033"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:10 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 66D741D402
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DC196C4A14
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A44FE368F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:06 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1998E1A000B;
	Mon, 18 Nov 2024 17:30:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/32] mcelog: upgrade 200 -> 201
Date: Mon, 18 Nov 2024 17:29:31 +0800
Message-Id: <1731922195-5266-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--1.979800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2v8LO5wKi8YUnDICbPFvtnTHEDUAqZUZM4ZiTLIQu4YpMSiwizsgluQ1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzt97SyE5Nj8eCLY
	xNlB1+EMG07JsVPRdNs9+i8myoAZ6hf9kQdqxS+UxFbEkqxXqMOmUwmKEDDUSC56JprJlcwtRD9
	rFM8FDyiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113876

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_200.bb => mcelog_201.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_200.bb => mcelog_201.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_200.bb b/meta-oe/recipes-support/mcelog/mcelog_201.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_200.bb
rename to meta-oe/recipes-support/mcelog/mcelog_201.bb
index 9d72e7859..799347fe4 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_200.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_201.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;
            file://run-ptest \
            "
 
-SRCREV = "955fd0917ab1b9f159443e5cbba1d0fa73486fac"
+SRCREV = "d70a0a7a794b35225295f77225941462c1d57254"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.34.1


