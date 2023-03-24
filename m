Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C016C7619A
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:36:33 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.90634.1679618187011123745
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mcxuige0;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679618192; i=@fujitsu.com;
	bh=oiqGu9+E4CGggR+mORSoEecw649kPaeZZ3jsI1OJKjQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mcxuige0PTG0WYtpmD+QG7XWipPyRG6cQPCiDWv7yTOXK1DfGcSHkWcjAmK2njeuY
	 IhT+EFTQ9arBQgMFD1cg5K4B5nW7E8LhbN4d3M/F982oXcqj6SAKmOfProK0RhAtPt
	 JLnySGVrTr10Idfs4dyWjDIu/d+bmZsFLJO/8ufYml2iLzp0BTYz5C7W6LAWZWsBO7
	 NiHaxp8TlZtyhtN9NRJRh6XZG1ytQUnaDM6ywHMy0v7GaDZXLnMK8itRPyEDdkygUR
	 6H5YQM9u0St0SgWjCEI66f8vuq/ZgYZGyFkRwORl22tuP46yJBJkRwwW5HCMTQLyus
	 DeSvp7GFQ7kNQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqNv/QSb
  F4Nt/KYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP/z2uMBbu4Km7NXsbWwLiLs4uRi0NI4Amj
  RNvUDWwQznUmiQe3jjFBOHsYJQ5OfsjYxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAu8TL7b/A4iwCqhIrHv9jAbF5BZwkTl24BjZHQkBBYsrD92A1nALOEgs3TgOrEQKqud
  88jw2iXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0h0Tj9EBOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo2lxalFZapGuuV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6K
  Xl5qySZGYPCmFCvP3MG4rO+v3iFGSQ4mJVFeiVDpFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  J/fyKQICRalpqdWpGXmACMJJi3BwaMkwnvoLFCat7ggMbc4Mx0idYpRUUqc1+8dUEIAJJFRmg
  fXBoveS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEIabwZOaVwE1/BbSYCWixcw3Y4pJEhJR
  UA5OeptzHHZPTnpe0mp5YKmaySHKNwVWBBUfzt8RmvpRS1VUwE+9z6azuFRRz8b125MGsmxeW
  LHu8ckHFkic7+Jfk86jM+tPsEzXh1yXjY7Gxygs6V8t2yHxXO2j8uTPtfm/Yr+7EPdZTe/jVj
  XdmcL7UXFLjdn3/VhHdztTvqq2u0o8LpE+Gr9yc2HJcOeqrvqNJ8WLe3S+CbQ7kO4ZOr1/sqN
  K2avXiC02rhe9/fbhTeULBrwkx66VONlrIvEk9bLFxzm/n/oxawbdrp3CaLTj+LFTrvrP2f+U
  D8q3PUuZdX2a3rvfK3e1fmjQEJnSx37a7O/E+N98CgYenlYu9dqyPUkudrvvZrFzaOPv3r1Ql
  luKMREMt5qLiRAAaKUw4WQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1679618191!140984!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13874 invoked from network); 24 Mar 2023 00:36:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:36:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2330410019F
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:31 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1650810019A
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:36:29 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libnet-dns-perl: upgrade 1.36 -> 1.37
Date: Fri, 24 Mar 2023 08:36:06 +0800
Message-ID: <1679618167-27390-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679618167-27390-1-git-send-email-wangmy@fujitsu.com>
References: <1679618167-27390-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101696

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Add links to relevant RFCs in package documentation.
Fix rt.cpan.org #147038
        resolver->axfr( undef ) fails silently
Fix rt.cpan.org #145944
        Case sensitivity issue with AXFR

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.36.bb => libnet-dns-perl_1.37.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.36.bb => libnet-dns-perl_1.37.bb} (95%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.36.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.37.bb
similarity index 95%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.36.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.37.bb
index 2c9b47a4c..e20e84d2a 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.36.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.37.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "143ba0e530f8b727be61ec052974cbf52df5b0afc0582d75b04809e0b2a95ebe"
+SRC_URI[sha256sum] = "e672031158942a7016c0480ab3c1fd0d7f81ea5dd650d1ecca7116d5fd348565"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.34.1


