Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65438CA9EA0
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:53 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.3824.1686620448970708532
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="120349089"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="120349089"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:47 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C79A2CD7E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:44 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EFC16D4BEA
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 80C7C20074732;
	Tue, 13 Jun 2023 10:40:43 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] ntp: upgrade 4.2.8p16 ->  4.2.8p17
Date: Tue, 13 Jun 2023 09:40:00 +0800
Message-Id: <1686620422-29962-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--3.665700-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mr8bHRUazq99TUlVJM/QT13kZH
	IUXb9utzcFWmbFiilMfCiNST6XFImRJ8EINAmcWbPKN38CLPK0GDN5JI3cDj3/5rVOs2bw4RypL
	hisOog5SN/ziTW5bneOpe9co8GDkGbRev5+PfDD9O5y1KmK5bJRSLgSFq3Tnj/rvCkqsgk0F7i3
	TJWkYpeSrpNVamuz9wuuCEeh+KVtblRxm3A2wKuhRFJJyf5BJeAaUQk5EZOUn6C0ePs7A07Q2y0
	JeZ/zscNXnVw2IavPSF5Q8zOwufaao9uU5A336kaDJXWLS7JwJAfGnBwLV585rPw92dgOiBTUBg
	9dUIfpPZlm1Dl02dYccOtu0hWXOz8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103229

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* [Bug 3824] Spurious "ntpd: daemon failed to notify parent!" logged at
             event_sync.
* [Bug 3822] ntpd significantly delays first poll of servers specified by name.
* [Bug 3821] 4.2.8p16 misreads hex authentication keys, won't interop with
             4.2.8p15 or earlier.
* Add tests/libntp/digests.c to catch regressions reading keys file or with
  symmetric authentication digest output.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p16.bb => ntp_4.2.8p17.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p16.bb => ntp_4.2.8p17.bb} (98%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p16.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
similarity index 98%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p16.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
index 8899f1254..fba4611b9 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p16.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[sha256sum] = "5225858bfd843b080fb9daa5b7370519130e5e49ac3eb0371e334bdc06c52dd7"
+SRC_URI[sha256sum] = "103dd272e6a66c5b8df07dce5e9a02555fcd6f1397bdfb782237328e89d3a866"
 
 # CVE-2016-9312 is only for windows.
 # CVE-2019-11331 is inherent to RFC 5905 and cannot be fixed without breaking compatibility
-- 
2.34.1


