Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web12.2603.1621474759171602860
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 May 2021 18:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UP+ym3Ls;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621474757; i=@fujitsu.com;
	bh=/M/lp2Llf67udJKISfqushVprOxlWQ1UBbnPxupt/Y8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UP+ym3Lsus8Xc9XHstm8bXqiEWVZu118VobWOMv3a3gVPO7l8NsDR0HiyidmvKqao
	 DMBUNxA0VO9AI7dW8JsundkdBePuCJt5gpu22QdCo//iXVvB/DjenC0Fh6wb/+3Pgq
	 tqYZ3lGFGe/tofYONE5u0K3dcErgbww+DJoFjpTPjR8KVCUNbaHrqymbROXefb7SI1
	 XL/wdn+ijeSbb5etiReOk3AApfNqkCifaruUuTB175yXl+7WUwEWK+SE3v1xS0atoR
	 jk1PiWXYpzgYqjZn+UhxxpHTamd4kbA9bbWu5/DIn+09yYNxgZ/5ajMxt+LHHQQEAM
	 +DfMYnUotwphQ==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id B7/92-25406-4CDB5A06; Thu, 20 May 2021 01:39:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYqntk79I
  EgxW7NS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ow7FzrZC76JVyz+PoWpgfGESBcjF4eQwGwm
  iUPvX7B2MXICOXsYJY68iAGx2QR0Jc49XssOYosI6Essnb2HGcQWFnCSeL/xCpjNIqAqcXTZV
  BYQm1fAU+LnmmtgtoSAgsSUh++ZIeKCEidnPgGLMwtISBx88QIozgFUoygxe7o8RHmFxIwZ29
  gmMPLMQtIxC0nHAkamVYzmSUWZ6RkluYmZObqGBga6hoZGuoaWZrpmJnqJVbpJeqmluuWpxSW
  6hnqJ5cV6xZW5yTkpenmpJZsYgSGUUnDEYQfj/dcf9A4xSnIwKYnymt1flCDEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgld899IEIcGi1PTUirTMHGA4w6QlOHiURHj/bwNK8xYXJOYWZ6ZDpE4xK
  kqJ83LtAUoIgCQySvPg2mAxdIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG89yHaezLwSuO
  mvgBYzgSxuXASyuCQRISXVwNQcd+zskwMbvCrfmC9tmiTOzB1YuvimY0fER/3skortK7bsX8c
  TFOrk52xmzPCiatVPhsjgIqv4eR9vT7z+7anzvab4bUvu37A+ff9AtEWWemlW/fo37pFz0u0e
  5XtHPdnv7NsX+bclU08rf/nlg0sdv7myTqpTq89rbqhiSkjbfipU83zX1y1bvR1P+2dVKp3mm
  BGZyMUiezV8zlTDoDUqU7UyYz9NanwlEDZVetKPl1LBpxp2TXjpPdlgsYzfJR/NttfPHzLPlV
  0wW9tVpbxzcs8aqZozmdfPZOS+C+VuNJzQdV5/axJTnMT2C5vtE+4aPmNwehNvwP2/P29OdGR
  S8p1Txsfeze+cOmeNjhJLcUaioRZzUXEiAPAYgP4cAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-285.messagelabs.com!1621474756!180091!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9810 invoked from network); 20 May 2021 01:39:16 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-6.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 01:39:16 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14K1dGax022046
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 02:39:16 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 02:39:14 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] chrony: upgrade 4.0 -> 4.1
Date: Thu, 20 May 2021 09:39:08 +0800
Message-ID: <1621474748-127695-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Refresh the following patch:
arm_eabi.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-support/chrony/chrony/arm_eabi.patch     | 12 ++++++------
 .../chrony/{chrony_4.0.bb => chrony_4.1.bb}          |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/chrony/{chrony_4.0.bb => chrony_4.1.bb} (98%)

diff --git a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
index 97b44dc7aa..837cb6d72c 100644
--- a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
+++ b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
@@ -41,9 +41,9 @@ Subject: [PATCH] chrony: fix build failure for arma9
      SCMP_SYS(getpid),
 -    SCMP_SYS(getrlimit),
      SCMP_SYS(getuid),
+     SCMP_SYS(getuid32),
      SCMP_SYS(rt_sigaction),
-     SCMP_SYS(rt_sigreturn),
-@@ -519,7 +517,6 @@ SYS_Linux_EnableSystemCallFilter(int lev
+@@ -520,7 +518,6 @@ SYS_Linux_EnableSystemCallFilter(int lev
      /* Memory */
      SCMP_SYS(brk),
      SCMP_SYS(madvise),
@@ -51,7 +51,7 @@ Subject: [PATCH] chrony: fix build failure for arma9
      SCMP_SYS(mmap2),
      SCMP_SYS(mprotect),
      SCMP_SYS(mremap),
-@@ -573,8 +570,6 @@ SYS_Linux_EnableSystemCallFilter(int lev
+@@ -580,8 +577,6 @@ SYS_Linux_EnableSystemCallFilter(int lev
      SCMP_SYS(sendmsg),
      SCMP_SYS(sendto),
      SCMP_SYS(shutdown),
@@ -60,7 +60,7 @@ Subject: [PATCH] chrony: fix build failure for arma9
 
      /* General I/O */
      SCMP_SYS(_newselect),
-@@ -597,7 +592,6 @@ SYS_Linux_EnableSystemCallFilter(int lev
+@@ -604,7 +599,6 @@ SYS_Linux_EnableSystemCallFilter(int lev
  #ifdef __NR_futex_time64
      SCMP_SYS(futex_time64),
  #endif
@@ -68,7 +68,7 @@ Subject: [PATCH] chrony: fix build failure for arma9
      SCMP_SYS(set_robust_list),
      SCMP_SYS(write),
 
-@@ -605,6 +599,15 @@ SYS_Linux_EnableSystemCallFilter(int lev
+@@ -612,6 +606,15 @@ SYS_Linux_EnableSystemCallFilter(int lev
      SCMP_SYS(getrandom),
      SCMP_SYS(sysinfo),
      SCMP_SYS(uname),
@@ -83,4 +83,4 @@ Subject: [PATCH] chrony: fix build failure for arma9
 +#endif
    };
 
-   const int socket_domains[] = {
+   const int denied_any[] = {
diff --git a/meta-networking/recipes-support/chrony/chrony_4.0.bb b/meta-networking/recipes-support/chrony/chrony_4.1.bb
similarity index 98%
rename from meta-networking/recipes-support/chrony/chrony_4.0.bb
rename to meta-networking/recipes-support/chrony/chrony_4.1.bb
index c8987013bc..0262a6e8d9 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.0.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.1.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
 SRC_URI_append_libc-musl = " \
     file://0001-Fix-compilation-with-musl.patch \
 "
-SRC_URI[sha256sum] = "be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625"
+SRC_URI[sha256sum] = "ed76f2d3f9347ac6221a91ad4bd553dd0565ac188cd7490d0801d08f7171164c"
 
 DEPENDS = "pps-tools"
 
-- 
2.25.1

