Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEC7C3A59E
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.6653.1649900771796726879
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 18:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bdVu0PxH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649900770; i=@fujitsu.com;
	bh=2RMooCAr+o6d5lBQ0zeO7XBPUgXPcH+6eQBmSlW2LgE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bdVu0PxHeoMyMuBGf22ZXiuPLdqdYYxZJqQtHnsNLEH5fz+kbjwfo2tyC2mHGPqrx
	 WhQDx0KyGH7d1RS5qnX9jZ0TudVZSqu+zMZlBTgTqG1mcxEFWYkfi2S6KmEOB+kdlL
	 mXlwKmn0569wvA/0QLjewo582z5/4ZhGXsGY+2ewQphONCeAubSNV+jH19t07LZ+gd
	 2JAwBi94m3U1LXH4w0zl+PWltj5UhhPG4wh5Gxs+iTRlHjnmE3NWrzq8UnsHHDYG+T
	 K75NqcAV96wxjeeYtaFBdQsg57xVOP4Cn/ukasFcYRL9gw48p+yKkPkJuya59ph0L8
	 SzDoASngvbvCQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqPuwJjz
  J4MkJaYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPxpcNsBXe4Kz4f8mhgPMjVxcjJISTwhFHi
  x3OJLkYuIPsCk8Sbpp+sEM5JRom/Jz6xg1SxCahLPL75mhHEFhHQl1g6ew8ziM0soCrRfXENW
  I2wgK7ElNP3mLoYOThYgOLvP1eBhHkF3CSmdj4FK5cQUJCY8vA9M0gJp4C7RHNzPMQNbhJXn9
  1kgSgXlDg58wkLxHQJiYMvXkC1KkmcWPGRCcKukHh9+BJUXE3i6rlNzBMYBWchaZ+FpH0BI9M
  qRrukosz0jJLcxMwcXUMDA11DQ1NdMxNdIxNTvcQq3US91FLd5NS8kqJEoLReYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgGKcUO3zdwXi876feIUZJDiYlUd4sw/AkIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8p6qAcoJFqempFWmZOcCYgklLcPAoifDOyQdK8xYXJOYWZ6ZDpE4xKkqJ8yYAI1FIAC
  SRUZoH1waL40uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkPVgNN4cnMK4Gb/gpoMRPQ4m+
  rQkEWlyQipKQamGoKr+T5KojefVh7fvYj7VnfQj4/dtm69GvuI1n2ST2ehTva4w9oXNLs539U
  v/Lt83flBQvK4/lM3s+3qlp3T1JAR7bXVv3/ro3HfheELqg4Vv4wPXK/6+HpE38LtB/9ebfS5
  +2uK9tWLj1/+VZPVny8kG3yoh/KVyI+zZp5I8f3k4HUDJMMd+k3h4KZxZ74tHnb398V2avzPa
  C9NPPZvzKvsG2P5rgmnuc5vzW4r/zH3L/ah96x83PqvXO8HtZl/mXlzmb3afNiw09/2ahh7fR
  QcNrOL4er7T5eFCq9HPZ3p2RLgJmcIGvAc/F0SbeD+5RVVl3VL7j086/GhvmcBS4XzvPEfo2I
  Ll529/X38rdKLMUZiYZazEXFiQBQ/ib6XgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-545.messagelabs.com!1649900769!73236!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6417 invoked from network); 14 Apr 2022 01:46:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 01:46:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E915E1001A3
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:46:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D137F100195
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:46:08 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 02:45:52 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: python3-kivy: upgrade 2.0.0 -> 2.1.0
Date: Thu, 14 Apr 2022 09:46:17 +0800
Message-ID: <1649900780-5925-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649900780-5925-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1649900780-5925-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96623

From: Xu Huan <xuhuan.fnst@fujitsu.com>

License-Updated:
years update to 2022

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-kivy_2.0.0.bb => python3-kivy_2.1.0..bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kivy_2.0.0.bb => python3-kivy_2.1.0..bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
index 38f5216f56..684bca03e1 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
@@ -2,7 +2,7 @@ SUMMARY = "Open source Python library for rapid development of applications \
     that make use of innovative user interfaces, such as multi-touch apps."
 HOMEPAGE = "https://kivy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f0c851d60495c7e27225a819e179208a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=22e7b4dd8140eec57fd7edfd9fa23dfc"
 
 inherit setuptools3 pkgconfig features_check
 PIP_INSTALL_PACKAGE = "Kivy"
@@ -18,7 +18,7 @@ SRC_URI = "\
 SRC_URI += " \
     file://0001-add-support-for-glesv2.patch \
 "
-SRCREV = "dedcb6bcabe3d8d6758dcee607e8c33b174d782b"
+SRCREV = "960b95dc666753f59eff1b449124490fbec10184"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


