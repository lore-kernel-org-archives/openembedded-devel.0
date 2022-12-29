Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5778C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 03:29:08 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.56071.1672716546871525737
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 19:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Iv+Qi5Co;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672716544; i=@fujitsu.com;
	bh=1hdZdhRYkPCERb8ARiUvJQlUL4RGQO9IZRyxP8Gw110=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Iv+Qi5Coxyh/iOSUpdfJYdk/55hEuGj9KIkRkqyh1NvmQS/xTQoRkwk7xGbEuWynN
	 h0WkUY4EeFpLSHYtPofAC/oH67+PjUm/1OYnO3P7da9nu5KzXgPn1aDmShAkrEOMAy
	 3IIXcXn4oTk2mW/rcCsIr8/TErNNu2rRdJUdjMqhVeufewFSnjVRJdLR/Sd4O+5Gkp
	 bGPl4nZgFaEn1JR0iti2h0qntncJeMtvvHr6fYekdwNndl1VhQj0YEOLkNvzSyuvY0
	 O7p5WTBKw877vzuRA0FnxPtjGQ0SOuG1B4NGdSzc+XKTBNs5JjvvCSK681o5VVhci1
	 5PTZU0un6Lyiw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8MxSff/gs3
  JBse+a1pcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBlXT+5iKvjPVfH/6Ry2Bsb3nF2MXBxCAk8Y
  JeY+62KBcK4zSdzev4oVwtnNKLHq6Hkgh5ODTUBK4sb9/2wgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQFniWN7LoLZLAKqEmeanoDZvAJOErt7rrGA2BICChJTHr4H6+UEqt/e+wFsphBQzbkLf5
  gh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzdDzamQmDWrjQnCVpO4em4T8wRGwVlI2mchaV/AyLS
  K0bQ4tagstUjXVC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdFLy+1
  ZBMjMHhTipX6djB2Lfujd4hRkoNJSZS3fO+mZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvDzzN
  ycLCRalpqdWpGXmACMJJi3BwaMkwntoHlCat7ggMbc4Mx0idYrRmOPuwr17mTk2Hb6yl1mIJS
  8/L1VKnFdkLlCpAEhpRmke3CBYhF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMw7H+Qensy
  8Erh9r4BOYQI6JWnNRpBTShIRUlINTIxHr4f3RjO8i55w7gZTSom7mqEjTwdXcYffMY352fpH
  gt646Uz9wBmluP6Fw724/Z9S7Va8uC1aqbTkx2aGmIgUV16Hm31Be1UDDkfvOPPr8crYprvdp
  zNqBSsZeSTTPwu9Cv1ec0yIf6vfnHrOsB8tyqp735rNn1EY1jilqEvl9qpXVyY9yDeo6T4q8s
  np3p7Y1E+57/lvL2dVkzt0J/FMppp5+fTVFwxlmQ56LG9PX916prF6us0FiUm9N9OO8FblHb+
  2LavJOevYgh+RF6vWbTJ+mVWnIz7JWUji8Meb09MfPd0p4Ny74LRcrejE3jlHes7utRew39TP
  f+/j992HikQf1T1v3/SnbvEVWyWW4oxEQy3mouJEAGrBE21rAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1672716543!294708!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31598 invoked from network); 3 Jan 2023 03:29:03 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jan 2023 03:29:03 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 675A41000DB
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:29:03 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5ACD91000D7
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:29:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 3 Jan 2023 03:29:01 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] byacc: upgrade 20221106 -> 20221229
Date: Thu, 29 Dec 2022 12:45:29 +0800
Message-ID: <1672289132-16078-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672289132-16078-1-git-send-email-wangmy@fujitsu.com>
References: <1672289132-16078-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 03:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100346

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * configure: regen
 * configure.in:
 correct help-message for --disable-btyacc option, and fix the reporting of
 the selected option value in the configure script's output (report by Daniel
 Weaver)
 * VERSION, package/byacc.spec, package/debian/changelog,
   package/mingw-byacc.spec, package/pkgsrc/Makefile: bump
 * aclocal.m4: resync with my-autconf

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../byacc/{byacc_20221106.bb => byacc_20221229.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20221106.bb => byacc_20221229.bb} (82%)

diff --git a/meta-oe/recipes-extended/byacc/byacc_20221106.bb b/meta-oe/recipes-extended/byacc/byacc_20221229.bb
similarity index 82%
rename from meta-oe/recipes-extended/byacc/byacc_20221106.bb
rename to meta-oe/recipes-extended/byacc/byacc_20221229.bb
index 3a8b5f841..f7f75b02c 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20221106.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20221229.bb
@@ -7,4 +7,4 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=62c37a10a2faf90235ee64280ad72737"
 require byacc.inc
 
-SRC_URI[sha256sum] = "a899be227bbcac9cf7700f7dbb5a8494688f1f9f0617b510762daeace47b9d12"
+SRC_URI[sha256sum] = "1316c6f790fafa6688427f1ff91267b61d8b7873b443c620eef69a6eff0503bc"
-- 
2.25.1


