Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFABCC47077
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 01:21:54 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2028.1704849706643958622
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 17:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="145484338"
X-IronPort-AV: E=Sophos;i="6.04,184,1695654000"; 
   d="scan'208";a="145484338"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 10:21:44 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C948ACD6C5
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 10:21:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 03E8F140AB
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 10:21:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 92FC440B73
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 10:21:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0DDA31A0070;
	Wed, 10 Jan 2024 09:21:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networkinge] [PATCH] daq: Fix install conflict when enable multilib.
Date: Wed, 10 Jan 2024 09:21:30 +0800
Message-Id: <1704849690-11386-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28110.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28110.003
X-TMASE-Result: 10--1.842700-10.000000
X-TMASE-MatchedRID: 9CLtS+2vXX+MPz8Goa6fXdl0i+WyI+919CFB7klVg4eysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLy9zcRSkKatcwitucT3dE7fzgVmnL/olV9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrZO4CGSsZ7L+K3ZPXq6T/fdkVBEzHoZAuVN44bRnEjc7A7V0wQuGbs2NVN
	yflqVdP76gC90GqIfMt7iuHjUwFNGxGLl3T2a9PB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 01:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108205

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/bin/daq-modules-config conflicts between attempted installs of lib32-daq-2.0.7-r0.armv7ahf_neon and daq-2.0.7-r0.cortexa57

The differences of daq-modules-config are as follows:
@@ -7,7 +7,7 @@

 prefix=/usr
 exec_prefix=/usr
-LIBDIR=/usr/lib64
+LIBDIR=/usr/lib
 STATIC_LIBS=" -lsfbpf -lpcap -lsfbpf -lnfnetlink -lnetfilter_queue -lsfbpf -lpcap  -ldnet"

 static=0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-connectivity/daq/daq_2.0.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
index c5499ffee..66ad83f71 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
@@ -25,7 +25,8 @@ EXTRA_OECONF = "--enable-nfq-module --disable-ipq-module --includedir=${included
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
-inherit autotools
+inherit autotools multilib_script
+MULTILIB_SCRIPTS += "${PN}:${bindir}/daq-modules-config "
 
 DISABLE_STATIC = ""
 
-- 
2.34.1


