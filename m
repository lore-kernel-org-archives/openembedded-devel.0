Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F61C54750
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8718.1724833541560464490
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l/l3hj89;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833541; x=1756369541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tx/rIN/Zh4wN6GqivifsFd7YYFXQ20sMkoAA0vHQ3E4=;
  b=l/l3hj89Zo0AOmHSU9opef7gLGBf0Mi4tYyfh7go6rOUJPgm49s+y3W0
   1E0865nX5s747hKhrUVLYfhOlJyH4qCi9NzbggXM5b1iIyFkAmLWHmKrn
   iPjul0wyzhwBcaD/jLI10XInuJr5ounDODIIMJjZgfYOeePwSnaUnVrnn
   M4TsfR55RT8VT7/5W/UtiqkhJSV+8FMCGrD+z/xphB7/xKPVG8kvCRg6E
   85dLbxPf2f6urzWyRKbFEPtN5KEaA14Vf1oIexnh3GszeePNpWzoMuggr
   822u6p97vSxpDrpZ8KliuHOyFtgljamILsop5ekt7cfq+iHF6Oev/08HC
   g==;
X-CSE-ConnectionGUID: b9aGP1AeQW2a+v/D6s0ELQ==
X-CSE-MsgGUID: iMiKQV6+S1GK0BZiOiNnYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171913174"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171913174"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:40 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BE46D29E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A2934BF4AA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3625A20079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C58831A0002;
	Wed, 28 Aug 2024 16:25:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 12/46] mdns: upgrade 2200.120.24 -> 2200.140.11
Date: Wed, 28 Aug 2024 16:24:50 +0800
Message-Id: <1724833525-2162-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--1.161200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmL+fVTRHzYVnHZYdmOIEAZdaDCzqDR7DPbVBDonH99+VmzUivg1nMWaRK7
	LDEHcSORt2aYTtx9LfHATsg8MODVIHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7tXK
	w4g6DHS/mzzO2IIZioxH/cShypv0Z5doG4uH9Pb40Cf8m6j+udibWP4lxx6eKOnRpvZh5FDgIhR
	Odhnhok+jZr8DWImUmCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111988

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mdns/{mdns_2200.120.24.bb => mdns_2200.140.11.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_2200.120.24.bb => mdns_2200.140.11.bb} (99%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2200.120.24.bb b/meta-networking/recipes-protocols/mdns/mdns_2200.140.11.bb
similarity index 99%
rename from meta-networking/recipes-protocols/mdns/mdns_2200.120.24.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2200.140.11.bb
index 9aeda92a4..e6ea70719 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2200.120.24.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2200.140.11.bb
@@ -25,7 +25,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0001-Handle-interface-without-ifa_addr.patch \
            file://0001-Fix-SIGSEGV-during-DumpStateLog.patch \
            "
-SRCREV = "51a7148a21362285f8013648c4bfa91247ff598a"
+SRCREV = "12e84b9089e577e0c0a9f48c4b922d7349fcc5a4"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-- 
2.34.1


