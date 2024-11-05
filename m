Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C440D2C12F
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.19647.1730817436716435084
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T8NrZRRS;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e330b7752cso43328217b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817436; x=1731422236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1u2dWAOu2G/3+LSvWfF57oTm3vcgg+4Dkf1Uq5usIr0=;
        b=T8NrZRRSGNic+aHbGEE/Dd9yaCEYZwkuq8ITYIrHN3xs9Hg2XAeq8blI9d8OVJ2miP
         XNZz8Gqs+zpa0XViu7wjjownAWraogYrn/VDll961lUvAXmN6BTZQ8sZJRHWDFmZ2GKd
         tn0/HX4Jf/6N612OZJaFwHgEVcuFW1bnOI8mowZ+ViA9BCTmH3Tij0riLApXgBmeWadq
         1tE3M5wNUa1QFucTvRUrBE6IV1fZwoRM6Mgj5D66Q/nPyPVe2PjSLWKkN9JCDzGmer1Y
         n1SpOs3z7SR3iiJ78Ag+PfdAktTq21GW2ZOv58mF5X1AvTISk0hrRxdOHq4gC866RtpO
         1m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817436; x=1731422236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1u2dWAOu2G/3+LSvWfF57oTm3vcgg+4Dkf1Uq5usIr0=;
        b=qfXtgcTRQ9xeRQw8u7YMvMEnlFDby8wGeJ59HRbjsV/TYxsQv4OJW09Nk1KrmmemB5
         eOpNpMZnNA7pp8y7hkkdo0Z3sBY/DxSLaGIf0Ejk5lIzICb4nD0xl+jSHCJ5OSq4aPAh
         kJarXQ8SWk6aQIHtOD/9X0oIVLMQt6ZaqvoeqyoNS1L9j8osrSTl2BqxNP+UQmpYJRHI
         c8GWApzDfvLUgg2yX+MxRtw9NEr+2gJ9pT1hBbo6dLEZ5wCBO4cO19zMCH72pVciSZhY
         CGq1JqVFkTkDoLXVvNypJ38hW06P4xb2LNAm1fPIW5hc4lCZSdMJbZQaBpBzwKGy3tgg
         /5OA==
X-Gm-Message-State: AOJu0Yxr/TRnQHprIU3rjUScwniLoEb+oUkZ0Wh+A7iI9xsDQ/FVsmIW
	Yq27z91XPpaNuiX1Zudf3h2rP+hZGRkYn7hY14iVhW7tIpfE1KC2Dtw+OQ==
X-Google-Smtp-Source: AGHT+IFobaGkVGSzv2BZ10jlBJrG+mlt8lYCjtgPeV2B7hjy07hOHVUQcFdcWiLmJSuis2GD7Dp9hg==
X-Received: by 2002:a05:690c:6c11:b0:6e9:c117:760b with SMTP id 00721157ae682-6ea557df6d0mr158941047b3.5.1730817435584;
        Tue, 05 Nov 2024 06:37:15 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 78/90] ndisc6: Fix reproducible build
Date: Tue,  5 Nov 2024 09:35:43 -0500
Message-ID: <20241105143638.2301245-79-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113496

From: Khem Raj <raj.khem@gmail.com>

includes the CFLAGS used to build the package in
the binary via PACKAGE_CONFIGURE_INVOCATION which then includes the
absolute build path via (eg.) the -ffile-prefix-map flag.

Here we remove using variables like PACKAGE_CONFIGURE_INVOCATION in code

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 70c663b7ae90283d25ca3704852ca96aa808e31a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
-- 
2.43.0


