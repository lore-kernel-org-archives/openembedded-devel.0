Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C473CCF11FD
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 15:10:30 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.46007.1728573027966499572
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 08:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GB4lfmkB;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20c805a0753so8672065ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 08:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728573027; x=1729177827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PrIyiZqhdGOMZ0/nyv6LsJVsAtvWL3Ash+Li3b5pV+M=;
        b=GB4lfmkBYU7HUGY9aDsyZEw5B7ZkGTLFUsjRgvna304arjzlijfXzWrTETlrctCD0X
         fRYJOKCbapz/xb3uF3FcmN6IFvk3WBSHYJq00qIbfhA8MXIfaqxMk556W5VEayRlyQtj
         Pvsc0lQbYIzUwe6Aw1W7V5c+3JXxsiKa6WUFpmUZaYAymqR7q/mGjRspF3fplKj5rcWm
         ptEN+u+3Gzc03BWgcx3hkUdhAxAm1glt6xvdyYE3sV7Lb+nIKihbHjKDAT0OhWIDVqCR
         KUp2em6N8yYtcpZYXAh4yGiK6CjNiDWTdA8NkcIHu89us/jTeHQYsqgXlWcqHNvA5Zsh
         la0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728573027; x=1729177827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrIyiZqhdGOMZ0/nyv6LsJVsAtvWL3Ash+Li3b5pV+M=;
        b=j72SNiwKfPIVCviN+pMFpS/jvd64tq5d0xk5ln/lsOtsj6onRP856QQTgu12MmTDHQ
         3woPpM5rdutTaC14iEgtFPkZMUQQXbGoaLOno0tNCauUD9yVGTI3F2kDxjOD43SDvDvI
         vhcmBB/g+SqJtvmR/yajCwH9WuzwtZx2EnP86/sFoXXa0I8N6Lf0srYG4vfzTBil8ZQF
         GF6lcBevbEMAC3bA3v5VHgeUVtO7xc071hqtb6RbVElN1eevmimz1waYI9Lu0nXEUgig
         tIxXLhGIsjvxob0Wjl2obEr4fhmu2W6pMV3eaEdCs1KC21TBjPnu26eEasJ1sRUhWxFo
         ZBPQ==
X-Gm-Message-State: AOJu0YypkcrueC1J5n4AwljbYl2T7h1SGR5DNBP+6NRCgq7sWFi5iLKT
	7c3uBHo8aZzUmmqAxTZa9PpeLodVcbGUSB6qRlMYyQez/lpgmDxvkysVlv+v
X-Google-Smtp-Source: AGHT+IGhdqMAvkjje5iS4WtiIg7zdcR36ZPN1p8hdZ+FAiUQIlRCM3DqcbVy6U45uknTTERalrtkYg==
X-Received: by 2002:a17:902:fc86:b0:20b:fd73:32c5 with SMTP id d9443c01a7336-20c6375b2a1mr99298665ad.1.1728573026889;
        Thu, 10 Oct 2024 08:10:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::b24b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c212bcbsm10469315ad.196.2024.10.10.08.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 08:10:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] ndisc6: Fix reproducible build
Date: Thu, 10 Oct 2024 08:10:24 -0700
Message-ID: <20241010151024.3394912-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 15:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112776

includes the CFLAGS used to build the package in
the binary via PACKAGE_CONFIGURE_INVOCATION which then includes the
absolute build path via (eg.) the -ffile-prefix-map flag.

Here we remove using variables like PACKAGE_CONFIGURE_INVOCATION in code

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...riables-indicating-buildtime-informa.patch | 85 +++++++++++++++++++
 .../recipes-support/ndisc6/ndisc6_1.0.8.bb    |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch b/meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch
new file mode 100644
index 0000000000..7bfb17bf08
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
index fb00b83516..21579d64c1 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRCREV = "92e5d1cf6547fe40316b2a6ca2f7b8195ae0cbe5"
 SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http;branch=master \
            file://0001-autogen-Do-not-symlink-gettext.h-from-build-host.patch \
+           file://0001-Remove-use-of-variables-indicating-buildtime-informa.patch \
            "
 
 S = "${WORKDIR}/git"

