Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C25C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:36:45 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.15707.1668843395806810302
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=u7Q4tSZE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668843394; i=@fujitsu.com;
	bh=aoUg/mi/EqOTH33vj1WRKDBkqj2/Yx5oFRTQqWRj1Ug=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=u7Q4tSZEK9Tz5rDdCDkwO/J9KIcA51hpIAPaZM9X1eZHQMIhIGgFyJ85/U0UxPrDJ
	 +47bCWkiG4oxAFDeBRxG2iGSqu5RJWuL4S8ZVwJftS76ApKA2IIFHut1KpMWZvaeVh
	 jWb+AsJ+nifvrWvpF0GPHNgtqcqu5Qc982UMDgBwCtiVJ9CLdZTUC6K4fL0rzOk0Ih
	 t/jtbRMTnKeYVzIb6LDaDVKXUszWpfqWLGsq4whw+D5JXy0oZT5E+2mFFkML2YQxxq
	 TQtJm6GM0ai4+JBLdYMOew0KD1g5ThWXdgfoymiIESsWtutgXis3nc3ZwxMOaZVJMs
	 NqTjdN9Is7vSA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8OxWbexvSL
  Z4PBvHouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP4y3ksBYs4K3ZN3svWwLiXo4uRi0NI4BGj
  xL+/1xkhnKtMEvenN7FAOHsYJfqf7mTrYuTkYBOQkrhx/z+YLSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBf4uTW76wgNouAqsTUoz1Ag9g5eAUcJebHgkQlBBQkpjx8D9bJKeAkcfDBGyYQWwioYn
  PLErApvAKCEidnPmGBmC4hcfDFC2aIXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxjNilOLylKLdA0t9JKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OT
  c1L08lJLNjECQzelmOXBDsYdy/7oHWKU5GBSEuXd216eLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mCN66tIllIsCg1PbUiLTMHGEcwaQkOHiURXhEfoDRvcUFibnFmOkTqFKMux9UrV/YyC7Hk5e
  elSonzJoHMEAApyijNgxsBi+lLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5p4NM4cnMK4H
  b9AroCCagI3Kcy0COKElESEk1MIX9q67ME/+2bY/O9ZXBv89sPJNbkMZ/cfOkudU64o7//X2a
  o1TPnL/Zt3XmlMVbTW9NvJPAJ/GknNPQQTn1Xu891rqJHFMzRFveln3K77do9tjkkx3y7ZidG
  buRw/9/jTI9oRvLFfYpu+83Fyv47WUr4hEW81rU6VNy3Pr1pxhObhWYV8IpMefZrqWy5/f/ey
  VX+f8Sr+1U7uBtn1+JLM24fq30s8ZHqSMXxDdmL/eZs4rph8sD0eVN78PYjvIlSJ0+PrNxSbN
  yLMMCuQfy+SxXp9pZJHedaXYP1q7+fiaeZ/4CoxCZimlzt1f2i+eXFaduETsbZ3Vy49MCCSuW
  y5MVeYXrJHi6YiTvRW2KUGIpzkg01GIuKk4EAN8MbONkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-591.messagelabs.com!1668843393!229801!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21761 invoked from network); 19 Nov 2022 07:36:33 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:36:33 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D0F554B11
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:36:32 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C499F4AEC
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:36:32 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:36:31 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20221106.0 -> 5.9.20221113.0
Date: Sat, 19 Nov 2022 15:35:59 +0800
Message-ID: <1668843361-2892-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668843361-2892-1-git-send-email-wangmy@fujitsu.com>
References: <1668843361-2892-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99623

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fortran: reset "newline" state when processing a new input file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20221106.0.bb => ctags_5.9.20221113.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20221106.0.bb => ctags_5.9.20221113.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221106.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221113.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20221106.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20221113.0.bb
index 6ef767710..8642f56ce 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221106.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221113.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "bf0d53505856d4b3e662be22bbe5fcb740451ca1"
+SRCREV = "83c1a093b3cd980fd3f08b3927c0cac34a1c4740"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


