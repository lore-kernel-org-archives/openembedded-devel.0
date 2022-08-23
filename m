Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B980C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 08:52:00 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.29525.1661244713257622236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 01:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=d90vf/Ka;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661244711; i=@fujitsu.com;
	bh=7/rskvFkEUQPIvDL46Ti8glfjf4G7Cxsf2maveMBzJM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=d90vf/KakKGlI4lzr0ags3DDjN0t836kgGGutxHImowfZhzM8OP3qMKVzBl/DVrsh
	 UZ1yu6vP8zbrCsBThs6yYRbcw6IlqQGV5YollUGIXFwU6pymvRbAL7GAq+nF0jm41U
	 PT3n/4zv5ePWaKTIACUPrd7usjTEbHiHAwkZiPKHV8E51lnTKqNefWJP5VUsk+WSY/
	 RLQAZFhHfyRucYHNdqfEDKfi9zfgYmHl1ubAh1KZiMjSy8FJpT4DFn0qN1+FviEMif
	 rLMp6dFrk9OeGri7mRzIRcPf+BdMvuefyjEZ1GgZYEaqA7zAviEpLxn1meR2Iz+1Ck
	 EJQox3MVjp5RQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8ORpKs2lSX
  ZYOoeU4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPms+1MBb84Kg7MWcnSwDido4uRi0NI4CGj
  RMuSr6wQzlUmie2Nl5kgnL2MEkeebAfKcHKwCahJTL91A8wWEdCXWDp7DzOIzSygIvHidw97F
  yMHh7CAh0TfhFgQk0VAVeJFpwlIBa+Ao8TPM0vAqiUEFCSmPHwPZnMKOElcaV/HBmILAdXMmX
  SNDaJeUOLkzCcsENMlJA6+eAHVqygx+3IzC4RdKbFnVj8ThK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaN1UlFmekZJbmJmjq6hgYGuoaGprqWlroWJXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFl
  bnJOil5easkmRmAQpxQnh+xgPLnvl94hRkkOJiVRXod6lmQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKErzCk4BygkWp6akVaZk5wIiCSUtw8CiJ8B4FSfMWFyTmFmemQ6ROMVpyTJ39bz8zx3IwOf
  Nr2wFmIZa8/LxUKXFelslADQIgDRmleXDjYFF/iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5I
  w7yGQKTyZeSVwW18BHcQEdFDQbmaQg0oSEVJSDUxKj5bv32FfcGb51lMC6hq8rNyNeS3pngU6
  cyv0jTbxeN3PXDM545Pmh3cWky9b3lKrtnjKXlPWf72h4E2zXVbOpcVh1UdWymQUJTbdLA2eb
  eaSs+RDmWPN8f7/G/qW/xLL6BWd4WW89LnDxaQk+c5KltqEZxNz1sX03p16eNq2ijWhgqLqTc
  8jPjG1Ct1jObLe/vVLbxb/VI1Nt9f+KZXZNHNl+jfTudc3z9B4d1ip8/cBxWVRys+u7XsRqNb
  w9MzWC09vTAvYlPzMW2Oxcv2ebbsnTpLLfTK76U+4YMej4KLyAyFHTgsLiTlLdeXPFaxd8rhT
  rvCo1wYx36CpMz1tmDRdYtZkbCgoPXLXhUuJpTgj0VCLuag4EQDGmafLdQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-728.messagelabs.com!1661244710!45337!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31544 invoked from network); 23 Aug 2022 08:51:50 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Aug 2022 08:51:50 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4C8C21AE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:51:50 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 40D371AB
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:51:50 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 23 Aug 2022 09:51:48 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] netdata: upgrade 1.36.0 -> 1.36.1
Date: Tue, 23 Aug 2022 16:51:28 +0800
Message-ID: <1661244689-4766-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661244689-4766-1-git-send-email-wangmy@fujitsu.com>
References: <1661244689-4766-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 08:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98386

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../netdata/{netdata_1.36.0.bb => netdata_1.36.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.36.0.bb => netdata_1.36.1.bb} (97%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.36.0.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.36.1.bb
similarity index 97%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.36.0.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.36.1.bb
index 0064702aa9..52d99e7704 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.36.0.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.36.1.bb
@@ -9,7 +9,7 @@ DEPENDS += "libuv util-linux zlib"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "051fce594901b4b77607c97676e91e1645cf37940bccda45ba4bf15e30edc4af"
+SRC_URI[sha256sum] = "f4a1233112b55e07e2862ffda0416255f0aa4c8e2b16929b76fa7ad6b69fd931"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
-- 
2.25.1


