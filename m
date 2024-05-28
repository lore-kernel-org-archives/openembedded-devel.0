Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44D0C25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:48:58 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.12839.1716860928144359796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K6MMhbTA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860928; x=1748396928;
  h=from:to:cc:subject:date:message-id;
  bh=IGTvyCLhZyFnZbTbqHgZJ6FwzJR0EwmBPDdyytqbDXA=;
  b=K6MMhbTAo4GV5eMGcrGlXs7t0OQGA569mZb9pvjl1fKH6C7TTDqAE6e0
   DHN7592iPhfgyGpw0s3ZLLN6nzPhSuWVZd/NLasKL7qVjTWyFNUiGJUHC
   qDCxbUDTv5oRqtcbXsWhs5Up9rzEiQly/RvnAs13PWYQjOyjFiXdlgNY6
   2wFjZAJOO3wJfkxNkKd+ubLEPXmMAjsARZ1hzvsalc0/2B/xQXoj9/H6o
   aLW4TDZFRd9d1k+BIiRJhvg2xXsQ00GM9irG/jIt5Rzi/YiB6GmFYysMs
   pWGyh3N31MSUHxJquNFUSdPdGdXZXdbeuEVse+qBdjx84JxeINLaC0Ec3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="162370433"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="162370433"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:48:45 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B686C68E9
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:48:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BAB4ED7B6D
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:48:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 271F241063
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:48:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C2F071A000A;
	Tue, 28 May 2024 09:48:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 01/40] arno-iptables-firewall: upgrade 2.1.1 -> 2.1.2
Date: Tue, 28 May 2024 09:47:42 +0800
Message-Id: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--4.547800-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrKcDLnhS00Sv+Aw16GgqpOxej
	jpE4hp171ZJ1UkQkpjoa5XBBN5aBAW94Ipa1otxoUu+cAEmvA8fVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYFS1+qCxplos5ZRbFNAl0j4hIo00fWURJxKLCLOyCW5DW9n
	uzdghUMjeWrdgSBjomYWn2p9yKOL2R9GF2J2xqMxRFJJyf5BJeAaUQk5EZOUn6C0ePs7A07Z5Vb
	9l0vnaPvsctELGQ9V3d7Tdkk1NJF8xMogikx729pQMwi+0RaKUoHz+iyMI8zYBvCWr4vRLipZRQ
	G8OLzPustT/ZLfXNUuiICF7Vusfq8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110536

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Enable IPv6 name record lookups for dig-wrapper. This indirectly enables
  IPv6/AAAA-record support for dyndns-host-open (& traffic-accounting) plugin
! Prevent systemd from terminating the job manager when some rules fail
* Renamed xxx_OUTPUT to INET_OUTPUT_xxx for clarity/consistency
+ Additional INET_OUTPUT_xxx settings to have better control
  of internet access on this machine
* Reorder some code/settings for clarity/consistency

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tables-firewall_2.1.1.bb => arno-iptables-firewall_2.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/arno-iptables-firewall/{arno-iptables-firewall_2.1.1.bb => arno-iptables-firewall_2.1.2.bb} (97%)

diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb
similarity index 97%
rename from meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb
rename to meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb
index e124fd290..940454c3a 100644
--- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://rocky.eld.leidenuniv.nl/joomla/index.php?option=com_content&v
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
 
-SRCREV = "a96b81da4a9b619e4045805f5f13a1e982c95663"
+SRCREV = "c8dfd85b9e8e453e279525f30c1e3184c092f036"
 SRC_URI = "git://github.com/arno-iptables-firewall/aif;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


