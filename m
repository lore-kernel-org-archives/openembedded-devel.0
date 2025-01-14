Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AECE77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:02 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.40058.1736843339803171724
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rX7A4j47;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843339; x=1768379339;
  h=from:to:cc:subject:date:message-id;
  bh=u+LPELBasr7i1v3XIQXWhjwgvsGNgR7ABQB4GJBAX+o=;
  b=rX7A4j47QhKYp/jNIgnkhLA4xuZCYv/nYp7fr+oByB+jeWSN8bG9Ck2a
   +aCUnFnyOdWt5NMVbQrgEGroiA8heYGBFJ0dpcPV6AOr8FmQErTbP+WlT
   1i5ep6RQi7PJzl7z6UfOt0W/1PnoPKgiogrb80ZPZ12HaBWBth3BGZtgo
   W6lQriZuQGWxJ9TVgnA3w1SHwv/etVf3LL4EclzWZmjJrNYRnqvddQWKI
   rx9ZgxtNd0KcWRA/DrpqYCHBSad2s+SiskyxSD8Td/n+24HlSY9/5eIiu
   RRLdw4fp6IMFeyzGxuPkBxJAXmdn93+sUeyNAnPYAWBg0JrhbwxggoiDj
   A==;
X-CSE-ConnectionGUID: gRZp9FUGRTGsqWEJd8JxWQ==
X-CSE-MsgGUID: bmkxXSUgRA+WPawimq18Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="173815660"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="173815660"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:28:56 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 37671C2267
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 10CE8D73B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F15A6B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3C9F01A000B;
	Tue, 14 Jan 2025 16:28:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 01/30] chrony: upgrade 4.5 -> 4.6.1
Date: Tue, 14 Jan 2025 16:28:20 +0800
Message-Id: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--1.696700-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxezg+6N0+qc8ax
	sdyCJSUeOihDThjzXJUrbVWjKPRUzQtgJ854eHwOkYD8wAZKsSDeGeDcpMd5NqoDeu6wu7bqK7m
	JD0QzrgSuJzsbC3TGvp9WDiQHsm7IfZTmx6Dri46OFfLQqF6P0htuGFXrmRpjeGHkpR2WBaKZo9
	fAMb44dA+ImtMXrep3srDFzfHIdiYBOHW58ozCWvx0ykrbAxjCwTlc9CcHMZcFfXzPlfY7e+cDD
	zKnTzUs4gLt3XIdkdgau2OjmVBi8ZcFdomgH0lnFEUknJ/kEl7dB/CxWTRRu+rAZ8KTspSzynUc
	m5Kp4sKyXIjC+tRrNb54FbU/HmYwcKxcUqTgWgA6f37GiLdGvy3s7bwrD5scstUkj77mvCdQ6UR
	TkzeOCSMwhupnSwsKiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114847

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Enhancements
------------
* Add ntsaeads directive to enable only selected AEAD algorithms for NTS
* Add activate option to local directive to set activation threshold
* Add ipv4 and ipv6 options to server/pool/peer directive
* Add kod option to ratelimit directive for server KoD RATE support
* Add leapseclist directive to read NIST/IERS leap-seconds.list file
* Add ptpdomain directive to set PTP domain for NTP over PTP
* Allow disabling pidfile
* Improve copy server option to accept unsynchronised status instantly
* Log one selection failure on start
* Add offset command to modify source offset correction
* Add timestamp sources to ntpdata report

Workarounds
-----------
* Negotiate use of compliant NTS keys with AES-128-GCM-SIV AEAD algorithm
  (by default the keys are generated differently than in RFC 8915 for
  compatibility with chrony server and client versions 4.4, 4.5, and 4.6)
* Switch to compliant NTS keys if first response from server is NTS NAK

Bug fixes
---------
* Fix crash on sources reload during initstepslew or RTC initialisation
* Fix source refreshment to not repeat failed name resolving attempts

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/chrony/{chrony_4.5.bb => chrony_4.6.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/chrony/{chrony_4.5.bb => chrony_4.6.1.bb} (98%)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.5.bb b/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
similarity index 98%
rename from meta-networking/recipes-support/chrony/chrony_4.5.bb
rename to meta-networking/recipes-support/chrony/chrony_4.6.1.bb
index 84f0230737..e45d5c6ba0 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.5.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://chrony-project.org/releases/chrony-${PV}.tar.gz \
 SRC_URI:append:libc-musl = " \
     file://0001-Fix-compilation-with-musl.patch \
 "
-SRC_URI[sha256sum] = "19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422"
+SRC_URI[sha256sum] = "571ff73fbf0ae3097f0604eca2e00b1d8bb2e91affe1a3494785ff21d6199c5c"
 
 DEPENDS = "pps-tools"
 
-- 
2.43.0


