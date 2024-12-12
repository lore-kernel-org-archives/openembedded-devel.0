Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A01E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 18:52:00 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.591.1734029512263376966
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 10:51:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=bNuAptxG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202412121851491cad5bef71aeebaefd-qjxth8@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202412121851491cad5bef71aeebaefd
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 12 Dec 2024 19:51:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vGwJGb4kXApAnEc6c8rb3nboAJMnhbM8U3MdAQ+5QLQ=;
 b=bNuAptxG0+d4qwCKi3mPuApbMVHAZePHxa1/uxRHR9cuGzm/AlswotKYpe65U4BI13Fu4P
 N/Gp4M+sK7ruosGb2fHPdwsSEjpwplp9VWaE1X7IjtUpU1PAnRgTkdFd/wJuCf2Xyr8stWzJ
 7RhrKE9sSAewCS7MdBKPI6l+15bXWYqpS3UB8mLc6ySjyVRPJpyVWEhRLdThOR2b4+4vszSQ
 dHNUxLWxo0pOhMUf8nSJx7c1gqD+/ec8wmUWxA51dsQfWc1BBoW/Gs8hkeurEtb91Gl0BpL/
 3T5wHN8VyzJq9ZsFqGFY5R2ENQ6I741E6JppRbfu06DxyS6GaLN6L5hg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH 2/2] ndisc6: Fix reproducible build
Date: Thu, 12 Dec 2024 19:50:40 +0100
Message-Id: <20241212185040.2244548-3-peter.marko@siemens.com>
In-Reply-To: <20241212185040.2244548-1-peter.marko@siemens.com>
References: <20241212185040.2244548-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 18:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114294

From: Khem Raj <raj.khem@gmail.com>

includes the CFLAGS used to build the package in
the binary via PACKAGE_CONFIGURE_INVOCATION which then includes the
absolute build path via (eg.) the -ffile-prefix-map flag.

Here we remove using variables like PACKAGE_CONFIGURE_INVOCATION in code

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...riables-indicating-buildtime-informa.patch | 85 +++++++++++++++++++
 .../recipes-support/ndisc6/ndisc6_1.0.8.bb    |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch b/meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch
new file mode 100644
index 000000000..7bfb17bf0
--- /dev/null
+++ b/meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch
@@ -0,0 +1,85 @@
+From 7b3e78cf0348ea737609a2ace07c7c55aae36bcb Mon Sep 17 00:00:00 2001
+From: Santiago Vila <sanvila@debian.org>
+Date: Wed, 9 Oct 2024 22:05:09 -0700
+Subject: [PATCH] Remove use of variables indicating buildtime information
+
+We should not really care about the build date or the build host
+
+Sourced From: https://salsa.debian.org/debian/ndisc6/-/blob/master/debian/patches/reproducible-build.patch?ref_type=heads
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ rdnss/rdnssd.c   | 2 --
+ src/addrinfo.c   | 2 --
+ src/ndisc.c      | 2 --
+ src/tcpspray.c   | 2 --
+ src/traceroute.c | 2 --
+ 5 files changed, 10 deletions(-)
+
+diff --git a/rdnss/rdnssd.c b/rdnss/rdnssd.c
+index b87edb2..7201525 100644
+--- a/rdnss/rdnssd.c
++++ b/rdnss/rdnssd.c
+@@ -741,8 +741,6 @@ version (void)
+ {
+ 	printf (_("rdnssd: IPv6 Recursive DNS Server discovery Daemon %s (%s)\n"),
+ 	        VERSION, "$Rev$");
+-	printf (_(" built %s on %s\n"), __DATE__, PACKAGE_BUILD_HOSTNAME);
+-	printf (_("Configured with: %s\n"), PACKAGE_CONFIGURE_INVOCATION);
+ 	puts (_("Written by Pierre Ynard and Remi Denis-Courmont\n"));
+ 
+ 	printf (_("Copyright (C) %u-%u Pierre Ynard, Remi Denis-Courmont\n"),
+diff --git a/src/addrinfo.c b/src/addrinfo.c
+index cd73722..6316abd 100644
+--- a/src/addrinfo.c
++++ b/src/addrinfo.c
+@@ -148,8 +148,6 @@ static int quick_usage (const char *path)
+ static int version (void)
+ {
+         printf (_("addrinfo %s (%s)\n"), VERSION, "$Rev$");
+-	printf (_(" built %s on %s\n"), __DATE__, PACKAGE_BUILD_HOSTNAME);
+-        printf (_("Configured with: %s\n"), PACKAGE_CONFIGURE_INVOCATION);
+         puts (_("Written by Remi Denis-Courmont\n"));
+ 
+         printf (_("Copyright (C) %u-%u Remi Denis-Courmont\n"), 2002, 2007);
+diff --git a/src/ndisc.c b/src/ndisc.c
+index b190b18..6e222a0 100644
+--- a/src/ndisc.c
++++ b/src/ndisc.c
+@@ -920,9 +920,7 @@ version (void)
+ {
+ 	printf (_(
+ "ndisc6: IPv6 Neighbor/Router Discovery userland tool %s (%s)\n"), VERSION, "$Rev$");
+-	printf (_(" built %s on %s\n"), __DATE__, PACKAGE_BUILD_HOSTNAME);
+ 
+-	printf (_("Configured with: %s\n"), PACKAGE_CONFIGURE_INVOCATION);
+ 	puts (_("Written by Remi Denis-Courmont\n"));
+ 
+ 	printf (_("Copyright (C) %u-%u Remi Denis-Courmont\n"), 2004, 2007);
+diff --git a/src/tcpspray.c b/src/tcpspray.c
+index 39d8939..6347795 100644
+--- a/src/tcpspray.c
++++ b/src/tcpspray.c
+@@ -302,8 +302,6 @@ version (void)
+ {
+ 	printf (_(
+ "tcpspray6: TCP/IP bandwidth tester %s (%s)\n"), VERSION, "$Rev$");
+-	printf (_(" built %s on %s\n"), __DATE__, PACKAGE_BUILD_HOSTNAME);
+-	printf (_("Configured with: %s\n"), PACKAGE_CONFIGURE_INVOCATION);
+ 	puts (_("Written by Remi Denis-Courmont\n"));
+ 
+ 	printf (_("Copyright (C) %u-%u Remi Denis-Courmont\n"), 2005, 2007);
+diff --git a/src/traceroute.c b/src/traceroute.c
+index 489bc55..604b6af 100644
+--- a/src/traceroute.c
++++ b/src/traceroute.c
+@@ -1251,8 +1251,6 @@ version (void)
+ {
+ 	printf (_(
+ "traceroute6: TCP & UDP IPv6 traceroute tool %s (%s)\n"), VERSION, "$Rev$");
+-	printf (_(" built %s on %s\n"), __DATE__, PACKAGE_BUILD_HOSTNAME);
+-	printf (_("Configured with: %s\n"), PACKAGE_CONFIGURE_INVOCATION);
+ 	puts (_("Written by Remi Denis-Courmont\n"));
+ 
+ 	printf (_("Copyright (C) %u-%u Remi Denis-Courmont\n"), 2005, 2007);
diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
index fb00b8351..21579d64c 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRCREV = "92e5d1cf6547fe40316b2a6ca2f7b8195ae0cbe5"
 SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http;branch=master \
            file://0001-autogen-Do-not-symlink-gettext.h-from-build-host.patch \
+           file://0001-Remove-use-of-variables-indicating-buildtime-informa.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.30.2


