Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2EEC43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:45:35 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.15806.1668843932876262753
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EnR39xwj;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668843930; i=@fujitsu.com;
	bh=GRKTQm567exY+jnhPXJl5FZZw5A/F77RALljPp1M9Vo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EnR39xwjkqv0FEAg8obwOldWr/wCiLKnLH+SR00mew4yxTdvvEGW4x/eIlRiVfD4Z
	 QNvlt5ayAlR09EVVpI5j7tJgke0Aim/NfuqjpqSSR60IixScB37MjkJUmDYagtpqiA
	 mq80+Ptr6V112M9U0jVOtzpW7nkGp2IpMd+v4343mEKoMiL/tcTDEoV4ic7IY816FS
	 R0qSJMj+g1DxboFIF4WuTIN5kIlfQPPsMzHX2/nsBjkmdAsqf25EyZ0QkokVgk2kWE
	 WHomJcSO+GAkXx30g1EjDsqC3quy1doZYWRYqTHCxWt70/Cb8DY5rIeGJcQOPqr7k7
	 SjQDf1Ji3PLkg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqDuzsyL
  ZYNtEC4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPV38OsBWd5K37+Pc7SwDiHp4uRi0NI4Amj
  xLKb55m7GDmBnOtMEps+eELYexgl1u4LA7HZBKQkbtz/zwZiiwjoSyydvQesnllAReLF7x52E
  FtYIFCic9t2FhCbRUBV4lr3ejCbV8BR4sW2lYwgtoSAgsSUh+/BejkFnCTOL7vGCLHLUWLP0Q
  9sEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdA31kooy0zNKchMzc/QSq3QT9VJLdfPyi0oygFKJ5cV6qcXFesWVuck5KXp5
  qSWbGIGhm1KczL6D8c2SP3qHGCU5mJREefe2lycL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCNa
  6tIFhIsSk1PrUjLzAHGEUxagoNHSYRXxAcozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vFQpcd
  6HHUBFAiBFGaV5cCNgMX2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvJcgUnsy8ErhNr4C
  OYAI6Ise5DOSIkkSElFQDk3jrxbg072I19yuqNl+Em48+XXXDLz3596ePrx86br59RJen1nfZ
  xG+/39s2HfZ/5PzIKnX+fnspr9XqB/8t2KN48WJm043lh17/+MX+YGHtebFXf76+rMzbs/fAQ
  j15br6LRfPE67/cyHSLPcd4n6v8dv2fLcw/pQ7ZX992NevAbBPnzh/s4fOyfRtCv2b2B4ZcPz
  v1aN2M7LUiZgq10/fubRUzT9Q4NXkh09q+/YuM9z39PCX0OUvezAMRRywvm6/Y6zCt74z+rgO
  zM9NMDvbE9szeXdrzbgvXsiSts3mH0iV2NBo80bCqzEv4/06qdG64mJWx+/HtipdapfOmPV+l
  wcD952ilUF7IyZ0/jAOVWIozEg21mIuKEwGO6miBZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-745.messagelabs.com!1668843929!59198!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1926 invoked from network); 19 Nov 2022 07:45:29 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:45:29 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 66360106EF4
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5A9B21035EB
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:29 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:45:27 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-migrate: upgrade 3.1.0 -> 4.0.0
Date: Sat, 19 Nov 2022 15:44:57 +0800
Message-ID: <1668843897-3019-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668843897-3019-1-git-send-email-wangmy@fujitsu.com>
References: <1668843897-3019-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99635

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Updates for Flask-SQLAlchemy 3.x compatiblity
 Enable type comparison and batch mode by default
 Option to rename "db" command group to a custom name
 Better handling of MetaData instances in templates
 Set options correctly when revision --autogenerate is used #463
 Documentation section on configuring Alembic
 Upgrade build to pypy-3.9
 Add Python 3.10 to build
 Add Python 3.11 to build
 Specify license in project metadata #489
 Remove tests from pypi package

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-flask-migrate_3.1.0.bb => python3-flask-migrate_4.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_3.1.0.bb => python3-flask-migrate_4.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_3.1.0.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_4.0.0.bb
index 815315645..3656a6ebd 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 
-SRC_URI[sha256sum] = "57d6060839e3a7f150eaab6fe4e726d9e3e7cffe2150fb223d73f92421c6d1d9"
+SRC_URI[sha256sum] = "2a301c3040af6844f29d9149abe428a0f08ebc8fa149e72113bbb36fa341920a"
 
 PYPI_PACKAGE = "Flask-Migrate"
 
-- 
2.25.1


