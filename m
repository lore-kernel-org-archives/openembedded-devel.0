Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F28C43219
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 06:51:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.3352.1667371910324237726
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Nov 2022 23:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VnjewouQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667371908; i=@fujitsu.com;
	bh=kvA/k7WWlySvNN40IJx8xSFUTNpRopMEaaXzuOcdvcA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VnjewouQgnWhxi0a8dA0ubxN29WvPsSWk6PnmrX5Vm3yfjZSeC1892Raq1MzfKutK
	 Edg13d1EjCak7gIg30tzr0bD22fVng8KZSzW17l2X7rG6dzbFxuVHSjwIZ0LNIMHkp
	 BGYXu1wkjuGveYv93fvTYeX1wLg5CP73OrXyVnq2/1EEgVcVpNZ9Qn/Pbkl0tEpeie
	 yqYIGtlJgljBl42kKJcjp9ajbXWXr2Ia3CTOgTQ0UbbmJ0Nha4BfF9h/cx3tuDVRWF
	 wGmQTGnawrAI7v1TdbvsambqlIHdmRDpyHmyqMLLSdrWPkS1TrEprhsk9rwuO6v38B
	 4s9oznAmSQ/Pg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8OxWbdFOCn
  ZYM4tfouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPHonb2godaFUseXGZqYLyj2sXIxSEk8JBR
  4suPnWwQzmUmiQlTb0E5uxklds16z9rFyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  F2MHBzCAo4SS55GgIRZgMIHp/0BK+cVcJKY9/sUWLmEgILElIfvwWxOAWeJ45uawGwhoJpNb9
  ug6gUlTs58wgIxXkLi4IsXUL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7QsYmVY
  xmhanFpWlFuka6yUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWW
  bGIEhm5KsaryDsYvS//oHWKU5GBSEuVNZk9KFuJLyk+pzEgszogvKs1JLT7EKMPBoSTB+4kPK
  CdYlJqeWpGWmQOMI5i0BAePkgivJgtQmre4IDG3ODMdInWK0Z5jbcOBvcwcU2f/28/MsRxMzv
  zadoBZiCUvPy9VSpx3mhBQmwBIW0ZpHtxQWNxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCT
  M68UPNIUnM68EbvcroLOYgM5ia48DOaskESEl1cBkW2Z+2cXUar9lgL/ApHPHo56fVur5fiTn
  inGbsXiToZjhFF7XTTuvv2ZMD+Z4fTO3Q8l3oui3gHnvVPzbJK6uuz/rysvZZ3Ptipf+N/K+Y
  fWiVP/dObtjH8xu7V6T//tdlNMqie2cwRz/IqQ/f8rMLf7w+fiyhV0ON1cdOlYe1399k5vgxa
  7U1xsie/uXuDkESxzSP6n/7a9y2qunn4IYfnYrzppzaWmx2FnBPY2ubgYTlt3aJtfMPvPB/Zc
  3gsq7XAJubzzWzlS118hsW/nt+XfuHbXj6JgivuUcr0d5fP/fXM96kUv6fqe270m0mX06bUuZ
  YUfgmvnaoS9my0lcn3m+U/VSgM/KT9KCOWv/KbEUZyQaajEXFScCAF/i1qF2AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1667371908!46330!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8678 invoked from network); 2 Nov 2022 06:51:48 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Nov 2022 06:51:48 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id F2143150
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Nov 2022 06:51:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E536873
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Nov 2022 06:51:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 2 Nov 2022 06:51:45 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xmlsec1: upgrade 1.2.34 -> 1.2.36
Date: Wed, 2 Nov 2022 14:51:25 +0800
Message-ID: <1667371885-20154-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667371885-20154-1-git-send-email-wangmy@fujitsu.com>
References: <1667371885-20154-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 06:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99409

From: Wang Mingyu <wangmy@fujitsu.com>

makefile-ptest.patch
xmlsec1-examples-allow-build-in-separate-dir.patch
refreshed for new version.

Changelog:
===========
Retired the XMLSec mailing list "xmlsec@aleksey.com" and the XMLSec Online Signature Verifier.
Migration to OpenSSL 3.0 API (based on PR by @snargit). Note that OpenSSL engines are disabled by default when XMLSec library is compiled against OpenSSL 3.0. To re-enable OpenSSL engines, use "--enable-openssl3-engines" configure flag (there will be a lot of deprecation warnings).
The OpenSSL before 1.1.0 and LibreSSL before 2.7.0 are now deprecated and will be removed in the future versions of XMLSec Library.
Refactored all the integer casts to ensure cast-safety. Fixed all warnings and enabled "-Werror" and "-pedantic" flags on CI builds.
Added configure flag to use size_t for xmlSecSize (currently disabled by default for backward compatibility).
Moved all CI builds to GitHub actions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xmlsec1/xmlsec1/makefile-ptest.patch             | 12 +++++++-----
 ...mlsec1-examples-allow-build-in-separate-dir.patch | 12 +++++++-----
 .../xmlsec1/{xmlsec1_1.2.34.bb => xmlsec1_1.2.36.bb} |  2 +-
 3 files changed, 15 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.2.34.bb => xmlsec1_1.2.36.bb} (96%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch
index d45356924b..26ebce343d 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch
@@ -9,13 +9,12 @@ and it's installed as ptest.
 Upstream-Status: Inappropriate [ OE ptest specific ]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
 ---
  examples/Makefile | 12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/examples/Makefile b/examples/Makefile
-index 89b1d61..c1cbcca 100644
+index 02480c2..cbc2661 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
 @@ -8,9 +8,17 @@ PROGRAMS = \
@@ -24,12 +23,12 @@ index 89b1d61..c1cbcca 100644
  
 +ifndef CC
  CC	= gcc
--CFLAGS	+= -g $(shell xmlsec1-config --cflags) -DUNIX_SOCKETS
+-CFLAGS	+= -g $(shell xmlsec1-config --cflags) -DUNIX_SOCKETS -Wall -Wextra
 -LDLIBS	+= -g $(shell xmlsec1-config --libs)
 +endif
 +
-+CFLAGS  += -I../include -g $(shell PKG_CONFIG_PATH=.. pkg-config --cflags xmlsec1 ) -DUNIX_SOCKETS
-+LDLIBS += -L../src/.libs -g $(shell PKG_CONFIG_PATH=.. pkg-config --libs xmlsec1 )
++CFLAGS  += -I../include -g $(shell PKG_CONFIG_PATH=.. pkg-config --cflags xmlsec1 ) -DUNIX_SOCKETS -Wall -Wextra
++LDLIBS  += -L../src/.libs -g $(shell PKG_CONFIG_PATH=.. pkg-config --libs xmlsec1 )
 +
 +DESTDIR = /usr/share/xmlsec1
 +install-ptest:
@@ -38,3 +37,6 @@ index 89b1d61..c1cbcca 100644
  
  all: $(PROGRAMS)
  
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/xmlsec1-examples-allow-build-in-separate-dir.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/xmlsec1-examples-allow-build-in-separate-dir.patch
index 8b2533ed9e..9e6a6a840f 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/xmlsec1-examples-allow-build-in-separate-dir.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/xmlsec1-examples-allow-build-in-separate-dir.patch
@@ -6,25 +6,27 @@ Subject: [PATCH] examples: allow build in separate dir
 Upstream-Status: Inappropriate [ OE specific ]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
 ---
  examples/Makefile | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/examples/Makefile b/examples/Makefile
-index c1cbcca..3f1bd14 100644
+index cbc2661..e882b61 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
 @@ -12,8 +12,10 @@ ifndef CC
  CC	= gcc
  endif
  
--CFLAGS  += -I../include -g $(shell PKG_CONFIG_PATH=.. pkg-config --cflags xmlsec1 ) -DUNIX_SOCKETS
--LDLIBS += -L../src/.libs -g $(shell PKG_CONFIG_PATH=.. pkg-config --libs xmlsec1 )
+-CFLAGS  += -I../include -g $(shell PKG_CONFIG_PATH=.. pkg-config --cflags xmlsec1 ) -DUNIX_SOCKETS -Wall -Wextra
+-LDLIBS  += -L../src/.libs -g $(shell PKG_CONFIG_PATH=.. pkg-config --libs xmlsec1 )
 +top_srcdir = ..
 +top_builddir = ..
-+CFLAGS  += -I$(top_srcdir)/include -g $(shell PKG_CONFIG_PATH=$(top_srcdir) pkg-config --cflags xmlsec1 ) -DUNIX_SOCKETS
++CFLAGS  += -I$(top_srcdir)/include -g $(shell PKG_CONFIG_PATH=$(top_srcdir) pkg-config --cflags xmlsec1 ) -DUNIX_SOCKETS -Wall -Wextra
 +LDLIBS += -L$(top_builddir)/src/.libs -g $(shell PKG_CONFIG_PATH=$(top_srcdir) pkg-config --libs xmlsec1 )
  
  DESTDIR = /usr/share/xmlsec1
  install-ptest:
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.34.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.36.bb
similarity index 96%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.34.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.36.bb
index 3e8772ed69..370551b159 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.34.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.36.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
     file://ensure-search-path-non-host.patch \
     "
 
-SRC_URI[sha256sum] = "52ced4943f35bd7d0818a38298c1528ca4ac8a54440fd71134a07d2d1370a262"
+SRC_URI[sha256sum] = "f0d97e008b211d85808f038326d42e7f5cf46648e176f07406a323e7e8d41c80"
 
 inherit autotools-brokensep ptest pkgconfig
 
-- 
2.25.1


