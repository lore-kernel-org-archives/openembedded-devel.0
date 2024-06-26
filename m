Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E3DC41513
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 08:09:08 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.20677.1719389345349609694
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 01:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g+RRoEyB;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719389345; x=1750925345;
  h=from:to:cc:subject:date:message-id;
  bh=T89uG/JfuzTkjTFsllVs4z5nrtpdYU0+87KTrVzf2jU=;
  b=g+RRoEyBK+oJywxikDesAmdj5JsdvAJl3//BEB8/MHBs1YNkkAfdDF8C
   LTurfqU3Dc2wbHniMqUkyGqZewGWPLiRTZkDjpqt5YrZqU52O2etaQilx
   Jt2h6j3D0qbKiaA/De3xApsADhqgVLz5MkWWWL2sCAACtXwIdH4J07699
   aWnlsqJH821yw8xCUMxPkp4vGMQqquERMFWHAwfVZGkHGcNeU0Uh32iyC
   fgPY6gdWE/3CqKWWsrhEknQ0SOwUXJFgBy250/xNIU0PFkFotP9jsCQS+
   kfe8y7UYXSRkboyJZG89SA8q8qKNfeXDmkZxyGJBjGZKekaRViGJvjGd4
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="144040700"
X-IronPort-AV: E=Sophos;i="6.08,266,1712588400"; 
   d="scan'208";a="144040700"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 17:09:02 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6914EC9321
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 17:09:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 98C14D3F26
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 17:08:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 24E762007CA99
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 17:08:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A28FC1A0002;
	Wed, 26 Jun 2024 16:08:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 1/2] openldap: upgrade 2.6.7 -> 2.6.8
Date: Wed, 26 Jun 2024 16:08:54 +0800
Message-Id: <1719389335-2644-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28482.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28482.006
X-TMASE-Result: 10--2.942300-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhULhp+W/a9mcHV
	oopeqd5EvQEW+BqnrVouXIORNsT1z9+l20ems7HjHWRJEfGP5nlZ+CK+BxQ9k4Q38vn6CU9X7/J
	GRZ8PgCf1tlvHcmH+UwhBeNJICtc+AC+lW5g8vPd4NstI+b12RknOIkO1Q+DNlPH7Ysio2a2XD7
	f2dO0QbE0NCZDxtvO/5p98cjyQCaIMCLEGW7c2cCsIuzCLc2mNutt2Dch6FcpgDeovr2tertArX
	FJyn/T4KRH7Yf0n42dczvc1495AvrTE9cvT/VWyXYWcmn4D4quR1LeQ+VpnJZsoi2XrUn/JQYMO
	RuDWAmTfaY87m2dqxydET58jp62S8WlT+XqrNJU/qWRkvf1ISLLLQvTQzGSHRSw/XYsifKL3Ssx
	SZzjq3z/NmXwo/WNWw8xx02v2ydo33yKOdMVpsh3PJoBLs4khS7+RMq/2CK6rA4c7UV2fQpvi2P
	QO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 08:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111083

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed libldap exit handling with OpenSSL3 again (ITS#9952)
- Fixed libldap OpenSSL channel binding digest (ITS#10216)
- Fixed slapd handling of large uid/gids peercred auth (ITS#10211)
- Fixed slapd-asyncmeta/meta target structure allocations (ITS#10197)
- Fixed slapd-meta with dynlist (ITS#10164)
- Fixed slapd-meta binds when proxying internal op (ITS#10165)
- Added slapo-nestgroup overlay (ITS#10161)
- Added slapo-memberof 'addcheck' option (ITS#10167)
- Fixed slapo-accesslog startup initialization (ITS#10170)
- Fixed slapo-constraint double free on invalid attr (ITS#10204)
- Fixed slapo-dynlist with abandoned operations (ITS#10044)
- Fixed build with gcc14.x (ITS#10166)
- Fixed back-perl with clang15 (ITS#10177)
- Fixed to reduce systemd dependencies (ITS#10214)
- Added slapo-alias contrib module (ITS#10104, ITS#10182)
- Fixed slapo-autogroup to work with slapo-dynlist (ITS#10185)
- Fixed smbk5pwd implicit function declaration (ITS#10206)
- Fixed slapo-memberof exattr requirements (ITS#7400)
- Fixed slapo-memberof is no longer deprecated (ITS#7400)

License-Update: Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openldap/{openldap_2.6.7.bb => openldap_2.6.8.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.6.7.bb => openldap_2.6.8.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.7.bb b/meta-oe/recipes-support/openldap/openldap_2.6.8.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.6.7.bb
rename to meta-oe/recipes-support/openldap/openldap_2.6.8.bb
index c229667d6..38ee76ba2 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.7.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.8.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=beceb5ac7100b6430640c61655b25c1f \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a41b4ed95ab4a20f366a8d82536afe4 \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
@@ -21,7 +21,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
 "
 
-SRC_URI[sha256sum] = "cd775f625c944ed78a3da18a03b03b08eea73c8aabc97b41bb336e9a10954930"
+SRC_URI[sha256sum] = "48969323e94e3be3b03c6a132942dcba7ef8d545f2ad35401709019f696c3c4e"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.34.1


