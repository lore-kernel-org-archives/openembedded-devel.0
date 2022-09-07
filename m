Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5347DC6FA83
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 11:23:44 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.6487.1662549820704117788
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 04:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UL0IHpaK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662549818; i=@fujitsu.com;
	bh=oY92uTsqfptv5FQzeHktskhQI8BceUO8wGmKDG5gczA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UL0IHpaKToy221dq6bbpchFVpjZaGQTcq6nl6OFRn9f7t9rCNIlL9HNgnyg6ea1S8
	 9bV3guzO0PUjkey04pqEzSb9yMMhqwUFjIuMtZcTqVgvdS4Emfhl5TGIyUIxpbbSxW
	 rTK0M6AZV+TY7ijXyV7HMkj1lUmwthX+UeMdVoysby83DpY1tyJ7dis7PEI9HmJMYw
	 0SuNZyeFjMdnv/18QWNsQ6Dw4Y1n0p0yLIw4satG63kiEngg+ODN91RUh5m5ISofIa
	 FjEzya8XqyjpioEElalkHCQgmet8pQkFFS8A2fh28htN80c1ahPuIRkCQs//OwoGE/
	 N8K5Kh8w9kmJA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8OxWdeqXiL
  Z4MBPNouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPdmeVMBTu4KpZs3M/awHiSs4uRi0NI4CGj
  xI3Xd1ghnMtMEi0XelggnN2MEgf2bQHKcHKwCahJTL91A8wWEdCXWDp7DzOIzSygIvHidw97F
  yMHh7CAr8TnuRkgJgtQeMG0RJAKXgEniesXt4J1SggoSEx5+J4ZIi4ocXLmExaIKRISB1+8YI
  aoUZSYfbmZBcKukGicfogJwlaTuHpuE/MERv5ZSNpnIWlfwMi0itE6qSgzPaMkNzEzR9fQwED
  X0NBU19JS18JEL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAoU4qTQ3Yw
  ntz3S+8QoyQHk5Iob5yXRLIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV6pGqCcYFFqempFWmYOM
  EJg0hIcPEoivM9qgdK8xQWJucWZ6RCpU4y6HJ37uw4wC7Hk5eelSonzngUpEgApyijNgxsBi9
  ZLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5GeqApvBk5pXAbXoFdAQT0BFbA8VBjihJREh
  JNTCpbnV4+iN0oXjuzBLla5d3bqxfvrdGQcCMV3rC6XcbLd32B/wQ/xz5sHGm5X/Rebcc+uNz
  hd5cM/0uzdd85taH3nr97UefGrSskuC52q1Zuj32pd5McyuRq2e99ja/eJQdpVUWcte2yHzRP
  3Wm+3OyH67cM+2+k+jvt8vSMyWiQ+VdHwpcXFok7cKYs9LDsX2f1YMvdzhTcxluMyxwi++b0+
  z/mZNPt3p+dUWt6KoMvurFvlIc1jYJE+8o9M192vv/rF3IAUbDJKGWo0H5b9UDa/sUJA6tWmL
  1JG3p/iwfHfvTvJnC7ksqe4Kl//V8/sjw9a9X6PGJTL8vcd8QMb2461JsJe/CrDlmGz3Ctiix
  FGckGmoxFxUnAgB27LnrUQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-745.messagelabs.com!1662549817!83756!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7948 invoked from network); 7 Sep 2022 11:23:38 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Sep 2022 11:23:38 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 871C6150
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:23:37 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7A70473
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:23:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 7 Sep 2022 12:23:36 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.12.4 -> 2.12.5
Date: Wed, 7 Sep 2022 19:23:15 +0800
Message-ID: <1662549799-17908-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 11:23:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98681

Changelog:
==========
* Prevent first-party imports from being resolved to 'site-packages'.
* Fix "astroid.interpreter._import.util.is_namespace()" incorrectly
  returning "True" for frozen stdlib modules on PyPy.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_2.12.4.bb => python3-astroid_2.12.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.12.4.bb => python3-astroid_2.12.5.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.12.4.bb b/meta-python/recipes-devtools/python/python3-astroid_2.12.5.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.12.4.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.12.5.bb
index 784818c027..af2f51858c 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.12.4.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.12.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "39fa822c82dc112f5072a208ddf01c58184043aa90e3e469786fa0520c71aaa7"
+SRC_URI[sha256sum] = "396c88d0a58d7f8daadf730b2ce90838bf338c6752558db719ec6f99c18ec20e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


