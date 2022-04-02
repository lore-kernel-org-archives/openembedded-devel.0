Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1996BC49EA5
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.2687.1649137213896346537
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=snDFQs/7;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137212; i=@fujitsu.com;
	bh=rp8zjvlBsAaEYKyJtBRdjgV8/DwUQAFWN54tonTeG+c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=snDFQs/7aC9BqOZKr7zzfW/k46k8bEVa4wnbERB9q/0r0TLZRg8dCPxVSh+bRjY3L
	 w/33X+XE6iuN+ew6RcylBtrP3wOTAbZFEAj31DCPVT0hAJw4paJvn6bm3jZUrOMsq7
	 iX3rUmadi0rLjwmS5NmFRCKfe1aBK4Vs9zpxjzJrqQYKPKraDOP6omJpfrw6zh8+0F
	 /fPoXe8qskmdMQT9M07W4Mn9gxGiaXwVULCbJd1WkfFEiVfPnusiu8eMH9V2dkGHRY
	 vtcw5s0fMBpxpEaSEmdHWjeoJE2bTxS0HkCSzUtlGRDRq29AiryBwsB5D1oOUCURQ9
	 MgEq7VSMl8oEw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRomt9zTv
  J4MNSeYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP6432sBfc4Ki41LGZuYOzh6GLk4hASmMUk
  0dc0iRXC2c0oMf/Zb5YuRk4ONgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuYe9i5OAQFvCSW
  LErESTMAhT+dOw2I4jNK+AkcfzeJ7ByCQEFiSkP3zNDxAUlTs58wgIxRkLi4IsXUDWKErMvN7
  NA2BUSs2a1MU1g5J2FpGUWkpYFjEyrGC2TijLTM0pyEzNzdA0NDHQNDU11jXUNLfQSq3QT9VJ
  LdctTi0t0DfUSy4v1UouL9Yorc5NzUvTyUks2MQIDLKWYWWgH4/q+n3qHGCU5mJREec+4eicJ
  8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuA9eRYoJ1iUmp5akZaZAwx2mLQEB4+SCO+Ri0Bp3uKCx
  NzizHSI1ClGRSlx3ptXgBICIImM0jy4NliEXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzM
  sDMoUnM68EbvoroMVMQIvfnfEEWVySiJCSamDqecu/YrPd/jO3J1Zcb1+gUXd4juH9jqjmQ5F
  rdjjvlPS/Vdcc2Nt7u15ewvbY+zJ/1Y+tL/JU/uYmLVpcdqo5Ne1tNpdeYNumBYeeVBZreSzI
  YF4azHTkrtbyH1Mles9E5629lKzJ8Ni8P7/QclKX+/EnD0v+5p8/EhvM+drAc/Umm+7DCavCP
  /h+Pq7+vM7n/NE5YjFp7QJ296q3X/lx8eS65GRzhjq+f812uXf+iGT57eN0+Td104ZL0yzPsW
  xQY9eaMPv0AjkrD7sp8b5Rnz0dwif+SHHZeKYyozMr987HfyeZ5p542O5wzOeA/Pnk+cvDdks
  ZzNu539fEaMffHCcLqUvOFq7/9HJUjUuVWIozEg21mIuKEwEfaGerKwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1649137211!429864!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11016 invoked from network); 5 Apr 2022 05:40:11 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:40:11 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2355eBMc005943
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 5 Apr 2022 06:40:11 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:40:09 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pandas: upgrade 1.4.1 -> 1.4.2
Date: Sat, 2 Apr 2022 20:36:45 +0800
Message-ID: <1648903009-19854-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96407

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pandas_1.4.1.bb => python3-pandas_1.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.4.1.bb => python3-pandas_1.4.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.4.1.bb b/meta-python/recipes-devtools/python/python3-pandas_1.4.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pandas_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.4.2.bb
index 4877194a5c..6d0f669d53 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.4.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f23c5c092b74d245d48eeef72bc3fd2"
 
-SRC_URI[sha256sum] = "8db93ec98ac7cb5f8ac1420c10f5e3c43533153f253fe7fb6d891cf5aa2b80d2"
+SRC_URI[sha256sum] = "92bc1fc585f1463ca827b45535957815b7deb218c549b7c18402c322c7549a12"
 
 inherit pypi setuptools3
 
-- 
2.25.1


