Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195DDC6FD1C
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:46:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.9512.1678355169993227327
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pDW235a4;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678355168; i=@fujitsu.com;
	bh=AU0TpN1wfc2Mr7C9J04GhZJjicXs8x4opX36o6+zUdw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pDW235a4uucc3BwW1gnoWqGxHYmeo8W9rsep3h3A1bNIo0t2pJoi5dYSaWQcxHVjt
	 J1RvDHLQ4YspqQnT2r4hXsNizQ6Y6gtExW2NZHOd43FAK99RQ+Bfp+uXF0Od2dtTCB
	 EBlAhhu8sfmcJYAHWN1ENDH+qz57O4iBlu60FCO+dyfaPqndliUkZSmFEPh5RCk0RV
	 A6ztkptAF5y5rf7uEHhK8zCSlPzEM3LgwwBOGOa0wX8ngkOxU0+x8sausK1yVD+pg3
	 GXF3jjNXsfgzYb04dH/nmvJP+HL1jwE0Go16JWorB+KD19Fhr2hMgFFNjTuibIFkCY
	 7cBlHiM2Jiw5A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxSff+Ks4
  Ug0/z9CwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oy3r++zFhzkqjj0pZ+lgfEeZxcjF4eQwBNG
  iT3nN7JCODeYJL4uX84G4exhlDjXtRIow8nBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  F2MHBzCAlESH/dZgYRZgMLtt3rAWnkFnCROfdrJAmJLCChITHn4nhkiLihxcuYTFogxEhIHX7
  xghqhRlJh9uRmqvlKi9cMvKFtN4uq5TcwTGPlnIWmfhaR9ASPTKkbT4tSistQiXVO9pKLM9Iy
  S3MTMHL3EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK3OScFL281JJNjMBQTClW27WDcULfX71D
  jJIcTEqivN1snClCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjNlwHlBItS01Mr0jJzgHEBk5bg4
  FES4e2fDZTmLS5IzC3OTIdInWLU5bh65cpeZiGWvPy8VClx3sSVQEUCIEUZpXlwI2AxeolRVk
  qYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8KkCk8mXklcJteAR3BBHTEri0cIEeUJCKkpBqY7HO
  336xS+iwn9F3vyd4/1Qmrf1XvnvpC9vlnrt3GYkezvE17zgUJzElNPvVqtenkEHadt7+P6W1T
  PbiheI/Od8f6h6oiKxnED7EwWoU+PSP+mH/jv9Ylp3dNrblzaz138F3tkNj482IaG54LigWL2
  97K1YjueLdnUu48zqtrlCfOZzL9f0yp/4N0mmBkV+Vl14N+QXOWJdb/myoxJ/n1tO21lUpCM3
  +8E5CWedL00a5JVLBD6ttN+/p/DRzHGC1copb/VGyo6dw2TWC51cSShZ05l38XJUwoX6lSmp2
  xb6nUxCVTLdcvrb5xwIPp3O2kXUu2uZldfd/PffrnUobzyv9rBB6zneU79s7Klf+tqBJLcUai
  oRZzUXEiAOLtKLBMAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-548.messagelabs.com!1678355167!143599!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25195 invoked from network); 9 Mar 2023 09:46:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2023 09:46:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 747371000DC
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:46:07 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 67EB01000DB
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:46:07 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 9 Mar 2023 09:46:05 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 05/11] python3-fastjsonschema: upgrade 2.16.2 -> 2.16.3
Date: Thu, 9 Mar 2023 17:45:51 +0800
Message-ID: <1678355155-32741-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101451

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix variable name resolving with references

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...astjsonschema_2.16.2.bb => python3-fastjsonschema_2.16.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastjsonschema_2.16.2.bb => python3-fastjsonschema_2.16.3.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.2.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.3.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.2.bb
rename to meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.3.bb
index a1d3392e1..689fe51a3 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/seznam/python-fastjsonschema"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"
 
-SRCREV = "1aad747bab39d4b1201ab99917463f4079955ecd"
+SRCREV = "4f11540d2e8f7c0aeae1230cdbc65a99f1b277c4"
 PYPI_SRC_URI = "git://github.com/horejsek/python-fastjsonschema;protocol=https;branch=master"
 
 SRC_URI += "file://run-ptest"
-- 
2.34.1


