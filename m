Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2A7C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 08:25:20 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.4197.1641543918909283408
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 00:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tPWCSLGu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641543916; i=@fujitsu.com;
	bh=lH0I3o+iOJoyBaT0LwYndsfrvNw5zAXElh9SYGa7Py4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tPWCSLGuckhUm/MtMKfpU5wqIeC45phOZRHEg8gB2KAExpHI80ij+H6tUMpyOWh+N
	 L6L0/L5DL0zy/sdA2DhxXRP9zbQeZbY9gU8YBR3ISOyB6tTzuNEbPkgVtan0EMCY2+
	 +tidfBImG2rIq7VWVTQfXOlsMZWKwf/BqMgMJFjnmujFTj7uezDODmERJXYHZSfadD
	 SjwYZAps2ANH+zsggYII2mC0YgDQgIOD60OgTKo/oUlnFCOS3j7jL6li9s54Bv23i6
	 vOffnQwG3p1zU85tNOaa1OusOwjeHbgvs5xXOFR9Qno2pYhKknmplrshNuvgIbbUyP
	 lyjyxKKBoaXKw==
Received: from [100.115.64.141] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 A0/90-24146-CE8F7D16; Fri, 07 Jan 2022 08:25:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MRovvmx/V
  Eg1leFhcPL2V2YPQ4t3EFYwBjFGtmXlJ+RQJrxpubk5kLrotVHJj1j72BsUOki5GLQ0hgBpNE
  Q08fK4Szh1Hi2Z35zF2MnBxsAhoSu6deBrNFBPQlls7eA2YzC6hJHH35E8jm4BAW8Je4/kUHJ
  MwioCLx6nsfWAmvgItE17MZ7CC2hICCxJSH78HinAKuErNv3mQCsYWAaib9hbB5BQQlTs58wg
  IxXkLi4IsXzBC9ShJvL+1hhLArJGbNamOawMg/C0nLLCQtCxiZVjHaJRVlpmeU5CZm5ugaGhj
  oGhqa6pob6hoaG+slVukm6qWW6ian5pUUJQKl9RLLi/VSi4v1iitzk3NS9PJSSzYxAgMzpdi9
  dQfj5b6feocYJTmYlER5xd9dTxTiS8pPqcxILM6ILyrNSS0+xCjDwaEkwbvkFlBOsCg1PbUiL
  TMHGCUwaQkOHiURXpaPQGne4oLE3OLMdIjUKUZFKXHeou9ACQGQREZpHlwbLDIvMcpKCfMyMj
  AwCPEUpBblZpagyr9iFOdgVBLmzQKZwpOZVwI3/RXQYiagxSuEwRaXJCKkpBqYzvYkLHBa+NT
  ulFzJZNm3Juvkw64+jLW4+YWv0HAmn6Lxs/qTvkuMmjQe/N83KTfr+B7TeQdrbbP+2/4UnMBq
  suTJ0ti3uYfadFwuTM2eFtTvcP+NcFeC0EqVTae99hTW79t7yEx2adHaBRXcapu1udmCTNL/O
  BWtVgvqDPp7pHzhDX4N1blGwmFvMt15LPaJfGffu1Xp597kNZ+O3sq5syTm6z4tSYdd9aIcxV
  OWPVlzzjyhep/offHjxW0zd709zbz0ZZbtv+rY0POfbh2xC59cc2S1WOb3jzv1vB9vktqz/e4
  +btZPf2pnXn1u7eb4hV2pPtc3ea6eXnl3R3q2nMfW/iVTlnvusTnAUHCgUYmlOCPRUIu5qDgR
  AOQmLuNHAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-20.tower-528.messagelabs.com!1641543915!59318!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31427 invoked from network); 7 Jan 2022 08:25:15 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-20.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jan 2022 08:25:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2078P7vl004314
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Jan 2022 08:25:15 GMT
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 7 Jan 2022 08:25:09 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [PATCH 2/3] dool: Added a new OSS that forked from dstat
 project.
Date: Sat, 8 Jan 2022 01:24:56 +0800
Message-ID: <1641576297-3341-3-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641576297-3341-1-git-send-email-leimaohui@fujitsu.com>
References: <1641576297-3341-1-git-send-email-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 08:25:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94681

Please referece to https://github.com/dstat-real/dstat.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../0001-Fix-build-error-as-following.patch   | 39 +++++++++++++++++++
 meta-oe/recipes-support/dool/dool_1.0.0.bb    | 24 ++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-support/dool/dool/0001-Fix-build-error-as-following.patch
 create mode 100644 meta-oe/recipes-support/dool/dool_1.0.0.bb

diff --git a/meta-oe/recipes-support/dool/dool/0001-Fix-build-error-as-following.patch b/meta-oe/recipes-support/dool/dool/0001-Fix-build-error-as-following.patch
new file mode 100644
index 0000000000..2324af4997
--- /dev/null
+++ b/meta-oe/recipes-support/dool/dool/0001-Fix-build-error-as-following.patch
@@ -0,0 +1,39 @@
+From e81feec1ebbc676220cd8759d83f46335602d079 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Fri, 7 Jan 2022 14:37:36 +0900
+Subject: [PATCH] Fix build error as following:
+
+*** No rule to make target 'dstat.1', needed by 'docs'.  Stop.
+
+Upstream-Status: Pending
+
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ docs/Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/docs/Makefile b/docs/Makefile
+index c031e82..1a85e61 100644
+--- a/docs/Makefile
++++ b/docs/Makefile
+@@ -11,13 +11,13 @@ all:
+ 
+ dist: docs
+ 
+-docs: dstat.1 $(htmltargets)
++docs: dool.1 $(htmltargets)
+ 
+-install: dstat.1
+-	install -Dp -m0644 dstat.1 $(DESTDIR)$(mandir)/man1/dstat.1
++install: dool.1
++	install -Dp -m0644 dool.1 $(DESTDIR)$(mandir)/man1/dool.1
+ 
+ clean:
+-	rm -f dstat.1 *.html *.xml
++	rm -f dool.1 *.html *.xml
+ 
+ %.1.html: %.1.adoc
+ 	asciidoc -d manpage $<
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/dool/dool_1.0.0.bb b/meta-oe/recipes-support/dool/dool_1.0.0.bb
new file mode 100644
index 0000000000..0cbc32ff3c
--- /dev/null
+++ b/meta-oe/recipes-support/dool/dool_1.0.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "versatile resource statics tool"
+DESCRIPTION = "Dstat is a versatile replacement for vmstat, iostat, netstat and ifstat. \
+Dstat overcomes some of their limitations and adds some extra features, more counters \
+and flexibility. Dstat is handy for monitoring systems during performance tuning tests, \
+benchmarks or troubleshooting."
+HOMEPAGE = "http://dag.wiee.rs/home-made/dstat"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS += "asciidoc-native xmlto-native"
+
+SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=master;protocol=https \
+	   file://0001-Fix-build-error-as-following.patch \
+          "
+
+SRCREV = "34a3244b46aa70a31f871a7ca8ffa8d3a7b950d2"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    oe_runmake 'DESTDIR=${D}' install
+}
+
+RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell python3-six python3-unixadmin"
-- 
2.25.1


