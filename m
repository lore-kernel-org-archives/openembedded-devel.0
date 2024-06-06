Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADC1C2BA12
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:11 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.9835.1717664827128735766
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i6lxE6Lf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664830; x=1749200830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OtZ6vgHrDid8GO/2L2dg+0thWGhMRifnfa5sfuIP7O0=;
  b=i6lxE6LfCYnH8rdj4FvlvsHk8phFT8B5+v4qkz190qgeAufjl6gzWzZF
   m3wdckByyg09BWkib72/C7Ab13/Shys+mHq1UMaLCWTC7DfykkT8JLTg3
   rwpSlZYGBl2PHde3rF2tI8mF+cZBfK0YniAx9fZFgb4rnC+Z3Vpvb6oGV
   CnInNjBfCrAf0HMdrtPfIpKF3LXZkAIokoqX08xnZREPA6Wh3olqDR5NA
   /Fgvx2JajJJ5fmM9l8WSmyfnSqsEq21R6CvyCoc59FQOleeoDqs83BpfX
   l7JQP60W6nurDf6y0sazTlNxNrV/b+Vh/AjjJ9J1sj4FkxuUh6KKylH2e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="162286283"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="162286283"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:08 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 76BDED8008
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B27E3D4BFA
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 31BA3401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D293D1A000A;
	Thu,  6 Jun 2024 17:07:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 31/36] ntp: upgrade 4.2.8p17 -> 4.2.8p18
Date: Thu,  6 Jun 2024 17:06:30 +0800
Message-Id: <1717664795-13902-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--1.375600-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yXg2y0j5vXZGlEDhvi2wR87QarzCEH4/6mKF
	LqZhp2Q7niFEtWp1a7uk9fLQU+0mLx2P280ZiGmR8t4fUUGeErTVy4hHC3/gyLKw8Hx0EGitvwU
	evDt+uW74Xkcr5uQiO42ds8fRsS3uo05cjFUN5oQrT6V6InEuVxCE2NlBjIjcfO0mA5QsX2tv2Z
	iuCbVzY7AqvUM9fR7QCmpOJyVooQA9kTLswKFYs54CIKY/Hg3Am4n49vyf9XEvM/mydp5vVCq2r
	l3dzGQ11/9Iir5BhGlDBS86Amh0fhzf6UNsy1A4Z9D89uIc9xPnOokYXyA6XKf0bJIGPtVVYTZf
	WbDo5/qkFNkp1C7b+3Ty3gmkQlNdgHIx+/YES1tTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110739

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
===========
- changes crypto (OpenSSL or compatible) detection and default build behavior.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p17.bb => ntp_4.2.8p18.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p17.bb => ntp_4.2.8p18.bb} (97%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
similarity index 97%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
index 5fa8db9ee..302cf9915 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
@@ -6,7 +6,7 @@ or satellite receiver or modem."
 HOMEPAGE = "http://support.ntp.org"
 SECTION = "net"
 LICENSE = "NTP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a8ffebbcad335abf2c39fec38671eec"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=2311915f6d5142b06395231b0ffeaf29"
 
 DEPENDS = "libevent"
 
@@ -24,7 +24,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[sha256sum] = "103dd272e6a66c5b8df07dce5e9a02555fcd6f1397bdfb782237328e89d3a866"
+SRC_URI[sha256sum] = "cf84c5f3fb1a295284942624d823fffa634144e096cfc4f9969ac98ef5f468e5"
 
 CVE_STATUS[CVE-2016-9312] = "not-applicable-platform: Issue only applies on Windows"
 CVE_STATUS[CVE-2019-11331] = "upstream-wontfix: inherent to RFC 5905 and cannot be fixed without breaking compatibility"
-- 
2.34.1


