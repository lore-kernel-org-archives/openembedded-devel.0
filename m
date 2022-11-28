Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710C6C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 07:22:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.112155.1669620166911924308
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 23:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=b5j93FGa;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669620167; i=@fujitsu.com;
	bh=DVJQQCRxK9VirH0NXGQZ0P2s2SvOoTZDL47a0IZ73tY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=b5j93FGamcQC6JGMT9Rlw9Jvjyno5J/byDWVSdbY1YFpGp1KZj6fKSun3eNbVncrO
	 K8RL2Li2w6k+hIYGrq7Ln/lg2BmoWNwHNcNRmIEyvs4LG2Mbcg24W2A64Z+G2toPSQ
	 DnroSmfIIHP/icSqdsQFRXgHiVBJxLKNTE7VMJbA7/YnC7rw+aIagZrTOEAZKLOUEa
	 agBinGRRGbcniRI99u67pCk+IvA2DjLqw/o4UZ7521/5LC+PglQpfh2qmWVDPUW/4y
	 xy7GAT+uTq1iaT11TTsrSSkJpWId09UQdBuGUGXcNWM4ZnKyChaiaF1rDVilZdkNfK
	 lXmEi61yOdQeA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqHsssSX
  Z4MAeE4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNP61SWgkfCFQ0r97E3ME4X7GLk4hASeMIo
  seLhQzYI5zqTxJQzc1kgnD2MEq3/bzJ2MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSwQINFz/xwLiM0ioCoxe/ttMJtXwEni8KzvTCC2hICCxJSH78F6OQWcJXr3PAOrEQKqeT
  LvPRtEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtCYtasNqiZahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhWnFpWlFuka6iUVZaZnlOQmZuboJVbpJuqllurm5ReVZAClEsuL9VKLi/WKK3OTc1L0
  8lJLNjECwzelOJl9B+ObJX/0DjFKcjApifK+iWxJFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBK
  xgPlBMsSk1PrUjLzAHGEkxagoNHSYT3HUgrb3FBYm5xZjpE6hSjLsfVK1f2Mgux5OXnpUqJ83
  6LBSoSACnKKM2DGwGL60uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmVEoCm8GTmlcBtegV
  0BBPQEZsUm0COKElESEk1MAXmTIrj7k8RSIpcc0BK+auS4p6pEQLMKfvNTZXC5p1dmV40Qdpk
  eo3+k71vzus+j9tXGZl229BU6ZHA953vfdSi1nNF7361MeWTplW6eNWLPzIbVk4K7+K2PCzxw
  /OI7nLXmenTttpqHvls+ETNI/jSmdWu0S9Zi9tUapzect1Znhq6/fLyecK6LmnCqlYrJyY/qb
  zWHbZ0QQq3TnRM2gFnLf5Fj4y68ljeFuzVOuHQoD27qqHhe0ZmleFho1bJGxarLhh8/SHdt/L
  IVoeNObWn/cU/Pdjf2XLH9/Ipqx87P+90d3Ke1Zm2IXfPjvXMsgvSo+5VdtscSFq3weZo4Z3j
  niduzXZIkXrZsl5xghJLcUaioRZzUXEiAIOYqzBmAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-728.messagelabs.com!1669620166!14224!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5762 invoked from network); 28 Nov 2022 07:22:46 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 07:22:46 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 394E510019C
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 07:22:46 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2D828100195
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 07:22:46 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 07:22:44 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.157 -> 2.4.165.1
Date: Mon, 28 Nov 2022 15:22:19 +0800
Message-ID: <1669620139-13762-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669620139-13762-1-git-send-email-wangmy@fujitsu.com>
References: <1669620139-13762-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 07:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99822

From: Wang Mingyu <wangmy@fujitsu.com>

Changes
========
Change
------
- Add links to doc.
- [misp-objects] updated to the latest version
- [tests] fix the list name test following latest warning-list updates.
- Add dependabot
- Add in sort/desc for sorting results and limit/page for pagination.
- Improve documentation for add_attribute
  Fix LIEF vuln.
- Improve warning on invalid template, bump deps
- Make mypy happy
- Add in test case
- Add ability to filter by sharing group for RestSearch for MISP >=
  v2.4.158.
- Massive bump deps for python 3.7.

New
-----
- Add in ability to set a taxonomies required status. 
- Pass arbitrary headers to a PyMISP request
- Allow to force the timestamps in to_dict/to_json, even if a change was
  made.
- Enable TCP keepalive
- [example:copyTagsFromAttributesToEvent] Added script to copy tags from
  attributes to the event level.

Fix
----
- Properly bump version
- Issue with EMailObject.
- Change DNS warning list test
- Missing place to update version
- Make keepalive configuration linux only
- Delete sharing group after deleting the event
- Give more time to MISP to publish the events before searching.
- Improper json check on non-json responses
- Mark all attributes in a soft deleted object as soft deleted too.
- Make flake8 happy
- Properly convert MSG to EML
- Update lock file
- [feed] fixes bug when template_uuid does not exist. [Christophe

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.157.bb => python3-pymisp_2.4.165.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.157.bb => python3-pymisp_2.4.165.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.157.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.165.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.157.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.165.1.bb
index a900e7027..b5efdd969 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.157.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.165.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "b1892efb6a078d1370cee51c9103f3a591c628d2"
+SRCREV = "661bf6ad14bea56fbf59d1289ccaf061c2205ffb"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.25.1


