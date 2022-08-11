Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B83C25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:31:12 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.24427.1660703467549601062
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aLPgDQO0;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660703465; i=@fujitsu.com;
	bh=qoa+CWmBJMJ0lC1jCGKNBDkGcFZ0AgMkU5vMYrQS8dc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aLPgDQO08orZVA7Q3pW/JOmVfYmIBsPQy+otseGg/pg+nSBEMk/LeduKx8qXmkw4M
	 mJtfx52yxx5pOaAAKqAfTPc0w4Y8fcNOHlyG5hPoQNuWv89Oswq0YY/HWwOk0DJ7/S
	 xFkfPReNZnqnIurTCly7AWSt465fyJ68ChiuRA5PLJcFxWwPYQKiZaAa1CoXBOpJGu
	 aBoM88K4wuMb6c9/xNh/0qGjtX0qiFQrBcOP5rVpYQ7NFCtPap26SckKY6Cv0HzJpj
	 42k6S85coOCIOeHarrjI3AOFzCCutevZodm+xrG4gRCtUTj57k68eumCIRAEkIawG8
	 jjVhE9NQosUFg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqPsi6E+
  Swc2fFhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bVGTeZCrZxVZye8YStgXE/ZxcjJ4eQwBNG
  iS0PQrsYuYDs60wSjy9/YoVIHGCUmLVFD8RmE9CVePFjMQuILSKgL7F09h5mEFtYwFViTdMrd
  hCbRUBVYvLTaWC9vAIeEud2bWIEsSUEFCSmPHzPDBEXlDg58wnYHGYBCYmDL14AxTmAahQlZk
  +XhyivkHh9+BIzhK0mcfXcJuYJjHyzkHTPQtK9gJFpFaN1UlFmekZJbmJmjq6hgYGuoaGprqW
  ZrqGZXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFlbnJOil5easkmRmDopRQnCOxg3Lvvl94h
  RkkOJiVR3n6mP0lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjv+QPlBItS01Mr0jJzgHEAk5bg4
  FES4ZUNAErzFhck5hZnpkOkTjFactxduHcvM8fVK1eA5MyvbQeYhVjy8vNSpcR53/oANQiANG
  SU5sGNg8XqJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvPu8gabwZOaVwG19BXQQE9BBxy7
  +BjmoJBEhJdXAtOihj5vT3z3PLh2K37io503kvR/3NN0WZMvGsezhFHT2dArLU7vwnfl4FOvM
  p46/mD7/Nr59OEUz69HlDQbusYtebtqvET9bxf/2jXuz27dJb0iLFy7u9u+2Cdpy9FGmUK6rd
  neEduRbuxky+TLq35pjnuztK6zLfa8nnu3j3eE5d8XCO39YxTev4gmt4DWeMO1dxkHF92xKs5
  NYjTgVxC+qLC1/17uGO6h4/nHlDtlJVp/e7pnp4y4m0Nrpa7Vi71az9SILXXbYbZH9LzQp4en
  psNX3Oc02cDpmn7KYuSrq87vUi/tnnRVIYVt19uqzKflBRqve8MiapOuXrHsZcMb/malZ7uJe
  pTV830/3K7EUZyQaajEXFScCANzl15FQAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-745.messagelabs.com!1660703464!462673!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30642 invoked from network); 17 Aug 2022 02:31:04 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:31:04 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 55649100192
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:31:04 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 49AFC100043
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:31:04 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:31:03 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-gcovr: upgrade 5.1 -> 5.2
Date: Fri, 12 Aug 2022 04:17:32 +0800
Message-ID: <1660249052-20256-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:31:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98274

License-Update:
  Copyright year updated to 2022.
  Modify fomat of LICENSE.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-gcovr_5.1.bb => python3-gcovr_5.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gcovr_5.1.bb => python3-gcovr_5.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_5.1.bb b/meta-python/recipes-devtools/python/python3-gcovr_5.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-gcovr_5.1.bb
rename to meta-python/recipes-devtools/python/python3-gcovr_5.2.bb
index 995f3b779b..03231f926a 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_5.2.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "generate GCC code coverage reports"
 HOMEPAGE = "https://gcovr.com"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=08208c66520e8d69d5367483186d94ed"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e59af597b3484fa3b52c0fbfd5d17611"
 
 SRC_URI = "git://github.com/gcovr/gcovr.git;branch=master;protocol=https"
-SRCREV = "e71e883521b78122c49016eb4e510e6da06c6916"
+SRCREV = "1040a85ecfb3ef0d01635df9d50a3cae5059d566"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


