Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D68EC25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:30:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.24169.1660703435634817872
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Zjl4XRL/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660703433; i=@fujitsu.com;
	bh=EL3AqAoTCt5lQHHPXzU+hsbUmItYozLy/3lQroMe8pM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Zjl4XRL/95QbEvfr0zdk4PEhoIXVTRuomT5mvpblhvayKPgXEYJUKM8+EbXwFPnNd
	 O50CIEkUN7fA0Ez/gWToKx+jj+OPSwATdeeDeN95k5Ea8gJLFDUYd9rs5oUmPI/kDb
	 yWja7mhVzLKoSA/6wcFQGw+GUJRorpy/8ny/CkTNv6h2AxKjaL0WbosLMUgRADSQAE
	 nrYGzC+UHWiD1OrEFTMgecmjdrlibTVre/+tbnk/bWl1vhfumXKFdvQUNNMDwAOeVX
	 s1lMRvjK9Sv6i/iOIBGCwlM5/Ym+48g10yXL7Uvg9YPr6ZkYLd47I7YPyciLhZR0QO
	 XLsbETYYWI/BA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8ORqHsy6E+
  SwfT3QhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8brk2+YCl5yVlxZ49/A2MDZxcjFISTwhFHi
  wez77BDOdSaJ19+aWSGcA4wSd4/+Zu5i5ORgE9CVePFjMQuILSKgL7F09h6wuLBAqMSDhh9sI
  DaLgKrEo18PWUFsXgEPiadLJrCD2BICChJTHr5nhogLSpyc+QRsDrOAhMTBFy+A4hxANYoSs6
  fLQ5RXSLw+fIkZwlaTuHpuE/MERr5ZSLpnIelewMi0itE6qSgzPaMkNzEzR9fQwEDX0NBU19h
  Y19DcUi+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzD4UooVN+9gnLjyp94h
  RkkOJiVR3n6mP0lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjv+QPlBItS01Mr0jJzgJEAk5bg4
  FES4ZUNAErzFhck5hZnpkOkTjEac9xduHcvM8fMr20HmIVY8vLzUqXEed/6AJUKgJRmlObBDY
  JF6CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrz7vIGm8GTmlcDtewV0ChPQKccu/gY5pSQ
  RISXVwKSUsU/uwo9lmQd2nPw0t15T6VDVvWSJ28IPH8/8O3XW+53HrP+Gq7J+Y2vvOyX/xOXj
  890vfuQJHp1+YVOXmf+hBdziYlfO8N96GucqHhkmqzpXJElBom57Zte//5PmLFVblLJhbcfn5
  477n6s9mpX290RigKCPsmvaF1bOw/Xndf23BNY0hSnnannYskV5CDumGd5nXpQbx3uNO5DdgT
  3ZerbyNPnenE2VF05NMlDXqKx2PFmc+PPir4lbqjuY2sKL+MMDH2yMC2xnFizNjptyRTyDJSr
  lwUv3vC6Bs5OsE/999f4ZP221w8c8JvHOrl3Gx3amRS9UPf+pUn1P2+LFfKla+/hWnt++dpZy
  vRJLcUaioRZzUXEiABW9RmtLAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-548.messagelabs.com!1660703433!23954!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8400 invoked from network); 17 Aug 2022 02:30:33 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:30:33 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 069EA100192
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:30:33 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id EE98F100043
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:30:32 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:30:31 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-asttokens: upgrade 2.0.5
 -> 2.0.7
Date: Fri, 12 Aug 2022 04:16:59 +0800
Message-ID: <1660249019-20179-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:30:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98272

Add dependence python3-six

Changelog:
Fix astroid type checking import errors

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-asttokens_2.0.5.bb => python3-asttokens_2.0.7.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asttokens_2.0.5.bb => python3-asttokens_2.0.7.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb b/meta-python/recipes-devtools/python/python3-asttokens_2.0.7.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
rename to meta-python/recipes-devtools/python/python3-asttokens_2.0.7.bb
index da49040d76..5e3ca9e30f 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_2.0.7.bb
@@ -7,8 +7,12 @@ PYPI_PACKAGE = "asttokens"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9a54c114f02c7a9480d56550932546a3f1fe71d8a02f1bc7ccd0ee3ee35cf4d5"
+SRC_URI[sha256sum] = "8444353e4e2a99661c8dfb85ec9c02eedded08f0006234bff7db44a06840acc2"
 
 DEPENDS += "python3-setuptools-scm-native"
 
+RDEPENDS:${PN} += " \
+	${PYTHON_PN}-six \
+"
+
 BBCLASSEXTEND = "native"
-- 
2.25.1


