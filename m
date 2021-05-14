Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web10.3444.1620958501600867026
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 19:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=P2MQC1Mq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620958499; i=@fujitsu.com;
	bh=jY3wxMROujxKj4Tt59dIq+n+w8apYzLh/RzZTzqmoRo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=P2MQC1MqjWFBYrr8W7LGFTPYIaDOOT8N+FPYsmwsTptMVSW6ovBVZs6r5G0QpN2Vk
	 PLz6n4/2FGHUNYOEbBqlrDKepROw82Sc8RYpy+ZjuOF2YKVkCIF5mxQLd716XnroyN
	 w/1B5CYFXxqhbaa3895rfFr3tK7Iq3Py9PaYuyP6ugC8VdesM7I6fFVyqQUlGp1rEX
	 UKOxfoAyulVYzZD0509DonPQ6z1QwzP5yCuGNo+1UZ0PhtXS4+vhLgHYDKt28n4n5S
	 mBVE5LegOnwPPEef1fAUV64wqzBsrCaYlstvXyZsI0wkXvDz3gyDViQhw70zPo2Lag
	 RGgrWpYelFmcQ==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 7F/0D-38619-22DDD906; Fri, 14 May 2021 02:14:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MRqqt0d26
  CwbVb3BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aN2R0sBQ8kKy71czUwXhPrYuTkEBKYzSQx
  7WNEFyMXkH2cUeLAweXMIAk2AR2JjhfdLCC2iIC+xNLZe8DiwgKWEhvPvWcHsVkEVCV+Nb1mB
  LF5BdwkFqy+DFYjIaAgMeXhe2aIuKDEyZlPwOYwC0hIHHzxAqpGUWL7zjMsEHaFxIwZ29gmMP
  LMQtIyC0nLAkamVYwWSUWZ6RkluYmZObqGBga6hobGumZAll5ilW6SXmqpbnJqXklRIlBSL7G
  8WK+4Mjc5J0UvL7VkEyMwiFIK2bh2MD59/UHvEKMkB5OSKO9Jz9kJQnxJ+SmVGYnFGfFFpTmp
  xYcYZTg4lCR4v9+amyAkWJSanlqRlpkDDGiYtAQHj5II7x+QNG9xQWJucWY6ROoUoyvHu5+LF
  zFzvFm7BEi23bsLJGcuOLiameN++6HVzEIsefl5qVLivMK3gZoFQJozSvPgRsOi8RKjrJQwLy
  MDA4MQT0FqUW5mCar8K0ZxDkYlYd6rICfwZOaVwF3wCug4JqDjbkyfBXJcSSJCSqqB6Qq3hkr
  /R4fzEyf7OSoEntox73O+gP2XRmcdnet/9qSZRM6YP+tOWPjJK3PuzL3+72bNjKjCUBtBrUkX
  Dh9u669cahAXyjC/4XRw2405e/dsiYpsOWnGoKYuoa1XxFjEpBDDz/zpaMRcv2U1/R+WXX3Ao
  HBWl5lfdONZiQnMXRkHndUiai4GetYtmdY1t3NTu69KeszZlc+t7/ttOS6nrKzGelyk6lVi4e
  kFm4/vNnt6/HbNsT3GNSKRNlI8iukOzGwl+fZ74s8wv3KWCZPNmTa5xXmVgoyy4/yZLufObs6
  ZplBQoBwRsVfu8t5KtsW7V/wt+3RDJNIzgW2u955yHfv7f5/tERS8rSHhwTZFiaU4I9FQi7mo
  OBEAEl5+wkEDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-238.messagelabs.com!1620958497!45439!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21982 invoked from network); 14 May 2021 02:14:58 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-20.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 02:14:58 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E2EvxV003778
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 03:14:57 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 03:14:56 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 1.13 -> 1.14
Date: Fri, 14 May 2021 10:14:50 +0800
Message-ID: <1620958490-8216-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Refresh the following patch:
0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...p_srcdir-instead-of-abs_srcdir-for-e.patch | 20 ++++++++++---------
 .../iwd/{iwd_1.13.bb => iwd_1.14.bb}          |  2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.13.bb => iwd_1.14.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
index 63d617f3e1..373bca2d78 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
+++ b/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
@@ -1,6 +1,6 @@
-From 0532cddcec9c3abff1f3bc22d2fa50df03d55d17 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 5 Apr 2021 14:11:40 -0700
+From b0b51d762f45ff9d320b96bd0acb89313148a446 Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangrc.fnst@fujitsu.com>
+Date: Wed, 12 May 2021 14:28:24 +0900
 Subject: [PATCH] build: Use abs_top_srcdir instead of abs_srcdir for ell sources
 
 this makes it build when build dir is outside of sources dir
@@ -10,13 +10,12 @@ Upstream-Status: Submitted [https://lists.01.org/hyperkitty/list/iwd@lists.01.or
  Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/Makefile.am b/Makefile.am
+index 68035e4..e3f7990 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -625,9 +625,10 @@ unit/tls-settings.8021x: unit/cert-ca.pe
- BUILT_SOURCES = $(ell_built_sources) src/builtin.h
- 
- ell/shared: Makefile
-+	$(AM_V_at)$(MKDIR_P) ell
+@@ -628,7 +628,7 @@ ell/shared: Makefile
+ 	$(AM_V_at)$(MKDIR_P) ell
  	$(AM_V_GEN)for f in $(ell_shared) ; do \
  		if [ ! -f $$f ] ; then \
 -			$(LN_S) -t ell -f $(abs_srcdir)/../ell/$$f ; \
@@ -24,7 +23,7 @@ Upstream-Status: Submitted [https://lists.01.org/hyperkitty/list/iwd@lists.01.or
  		fi \
  	done > $@
  
-@@ -635,7 +636,7 @@ ell/internal: Makefile
+@@ -636,7 +636,7 @@ ell/internal: Makefile
  	$(AM_V_at)$(MKDIR_P) ell
  	$(AM_V_GEN)for f in $(ell_headers) $(ell_sources) ; do \
  		if [ ! -f $$f ] ; then \
@@ -33,3 +32,6 @@ Upstream-Status: Submitted [https://lists.01.org/hyperkitty/list/iwd@lists.01.or
  		fi \
  	done > $@
  
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.13.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.14.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.13.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.14.bb
index 19d3a509ca..dbcc319dcc 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.13.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.14.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
           "
-SRC_URI[sha256sum] = "b005f7ed0f0a96a2c6181c44560fc868533a18e7034bd4cb43ea0d40c21b4e7a"
+SRC_URI[sha256sum] = "21be6ad59ba666ba1e50e01889d647472b9b2f96f4941123db036fd33c257f0b"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1

