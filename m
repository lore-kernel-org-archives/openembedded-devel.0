Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6B7C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 13:25:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.10763.1645449948789022450
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 05:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TqNoegZk;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645449947; i=@fujitsu.com;
	bh=DMVr+YabcNh/r/iRw7sD6wo0t1abCPeQgLAOSAOWnBI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TqNoegZkkqvYu/YUh32Vm1TVoNjlQfuZAtY64kQPjsT3B3AWk1tStq1AMo79ya5ZU
	 5nYny974bW/sj5qCSCyika1EXKXxsTaYj4slBkT3vsMLRIEviU2gFfIOaHxQG+6so8
	 gQ2TGhnocsjZwEUx5HDjPSDPqzNQK9i3rTyXKWJkWVmQ9Q32MmXETeyhreA+aLWNmx
	 5/2pdbFzF95b1Uu00ZW7sJ88TyFSlvKZnuXlh9M2o3HLBdgEAPxS8yndYAeU34fAwe
	 UhamphFpAuOw3c1LTmv/ilFmq5PCocKmxNS9w0E6rk9E7MGFLOlZzObLD+c51mnmJW
	 rxKUsVD07PgZw==
Received: from [100.115.32.10] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id A1/6B-29321-BD293126;
 Mon, 21 Feb 2022 13:25:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqHtrknC
  Swem/mhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8akZZuZCu5wVWya9p+9gfE8ZxcjF4eQwBNG
  ibXTDzBCOBeYJOY96GCGcE4wStzZNJGpi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBf4l9tzawgNgsAqoSjZ+3gdm8Ak4SJ3d0M4LYEgIKElMevmeGiAtKnJz5hAVijoTEwR
  cvmCFqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrRKKspMzyjJTczM0TU
  0MNA1NDTVNbbUtTDSS6zSTdRLLdUtTy0u0QVyy4v1UouL9Yorc5NzUvTyUks2MQLDMqVYPWgH
  47cVP/UOMUpyMCmJ8ta2CycJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuAV7gfKCRalpqdWpGXmA
  GMEJi3BwaMkwlveDJTmLS5IzC3OTIdInWJUlBLnFZwIlBAASWSU5sG1weLyEqOslDAvIwMDgx
  BPQWpRbmYJqvwrRnEORiVh3mCQKTyZeSVw018BLWYCWjwlSwhkcUkiQkqqgenW8p1pNiu5J1T
  nGTAUcl28NbXDZGJQVHTrRR0dv8Onur4sLpEU3HBR2i69fH2nzt7HxaUnogObug/6WNzs4lMt
  XjMha9FG9SdTWKQLH4o8XH2d67+S//Jq9y87ny38u/GUuDznneVih77W1Hft+CjgyH2kcN0aK
  dXKZ/8T9d5wLfVK8umT2li2Q7fu98zbH/UNPso0GS+6LTZni4R8wvkbS+4+iU7Q/B9++LXKTJ
  5uplVZOsqBzxdpZly2Pv/bV/FD/eY/fnNfyd+/duLdqlMT1N91drdxtVm3rM90EPc7uFH7fsP
  X9Jj/Z24b7A2dvqU49P4FTdNJC4Plz65YcvLc5Vpb/fiHsW8evlH7/XqLEktxRqKhFnNRcSIA
  vp1t80YDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1645449946!27277!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19853 invoked from network); 21 Feb 2022 13:25:46 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Feb 2022 13:25:46 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4EC6310019E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:25:46 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 425CE100185
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:25:46 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 21 Feb 2022 13:25:26 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libio-socket-ssl-perl: upgrade 2.073 ->
 2.074
Date: Mon, 21 Feb 2022 21:25:18 +0800
Message-ID: <1645449918-23366-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 13:25:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95419

Changelog:
=========
- add SSL_ciphersuites option for TLS 1.3 ciphers
- no longer use own default for ciphers, instead use system default but disable
  some weak ciphers which might still be enabled on older systems

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-socket-ssl-perl_2.073.bb => libio-socket-ssl-perl_2.074.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.073.bb => libio-socket-ssl-perl_2.074.bb} (94%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.073.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
similarity index 94%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.073.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
index ef7fd08bfe..0be1497d9a 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.073.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "\
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "b2c0b34df97cb1aa816221cee2454a1efd89b86ccbda810389a30e0d08cf57c8"
+SRC_URI[sha256sum] = "36486b6be49da4d029819cf7069a7b41ed48af0c87e23be0f8e6aba23d08a832"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.25.1


