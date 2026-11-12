Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7988.1794465761140315261
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sREEuDuk;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1893742a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465760; x=1795070560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+U43SfIJ7yIi81bVIY6nvoaIT5gKXlZM7y4YQJkXkfo=;
        b=sREEuDukKcGMTkbphvjPdrLSiKDpTmiCVAhWJpRxMA6cCxuR2VbY9/6NgzwIilHRDu
         iKzncYDdgKxMtNC4obQbxiFBMPmcL2HXSvtlWmWYEaxYHoo3xm7fhvKnxU4+b5H3OWff
         b3jAPTTzJQ3DtrXjJMHwwhs9FQUjYHYlTeGxQ3SdzoitKgJGRHHiEENwGb1/vJU5Y6oA
         sxhTBjUGgK/Jjd/ShNAaQ4CAWZktZVyT9Gldsj2gFV11EAD/KJ8phuYJqRWsDCRkxtMF
         Ne/NsBVYFkZms/kQ+8ComN22H5OUApLPVIVVdOOQebJOwovEJcfmdmj3eoiL/ezCDWhF
         dFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465760; x=1795070560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+U43SfIJ7yIi81bVIY6nvoaIT5gKXlZM7y4YQJkXkfo=;
        b=Qszo//IpW/B8/AD14e5RxOjSIvQmuaXuUJRdVufH0l3KEgHfsjlFqKq79gzKvYECUb
         YnN/D39vQdfsn5a6AJh1OiMSqnMFXa9Xj7AU8mdwt2zl7WhIIZZC8BEsFBchN6UTsoMh
         vQ1Hlphzn1LV4VtBLHyc6Kns4/YeewaLTc3GdQdaxozNgRcC1igoUkdhSJZYqtzFg1Rs
         WSlCTwlim9XExNeRN6yfw2lKFcoY9FwPEHLTfRPY7TPcjGKI8ZHZ0Hl3MAldQv+p/v8v
         SAvyaLsUs4nlw5XyrkFcfdDej+c3cac5gnWSOzau7XLyKxP1vVuoMLGRctUwgs/fdsQa
         OCcg==
X-Gm-Message-State: APuU4Z/GTu7jHeZd0lDdzvLJu3HvjaNgR8R5afmD2TRmgdFeyZ4jhdgS
	/WkbDJp7i0cdX8hpbga067ln1kHaC7lYpaf9pcJGHrbV6vdhf2XNF8+ETcVlrzbU1IE=
X-Gm-Gg: AYBFou0+ty8npdcpGWi1E3zX3IionB/yqLMdG8KlM0Mi+FEk11ikxWoZVF+mxlAQIZO
	ZWJ/W3VLAMIYmiz5s7aDJYdZhwnikPGxqRgOdsAviMWOHgmGmnvwggJ/hWSmSdQmkKZKKqpE/yB
	M12Xt0QDSzUx9RVLZNN4uTJTZEWJsd7nT8rEEd7OaiZ9KRIb2KqIEbtEZavYoF+uWR8F+3PU9DW
	YDgSR22Pso6j+vYyRWBa6SOlMEM4AB8pRxfl2XiBTNriljfS0uvPGR/eJ0HqvzEAiiQPP4+solq
	n206Xyz1uTCkkXMcqicTqSR/uIP3Uhw029Nd/RqarzZ2Cg5zCea9xU/7ZlgJb/58A1vZ2uC8+DP
	DH9jwt+U4gqt1iPvS3p1f3g358Q8KdzpEeSUPYxkAsCPpHiBFGd/OqvaH2seJ0opm2uNyXteRrG
	hF9Hf62pYeMw1iSgSTZpNIo/6NSRHkJz0ySDbeZiQTAMvyskl9hGcNBC4DItFTiRtn2erx9Dh/h
	vIWcEC6lZcc6/wvt4QtrSLcByTWR4myQsghMlRc/IMXPOwLzCB2310JdF8Lo86Rgwgw7JJTxnFM
	+vGRjTzbJyE63G3NkiMY7UDCas8WY3UldTzA72h6eLpAkHzElmnFwdzHO+d2rrce9DBbD3AfKvf
	gaAo/WAaFpKHB2DvMWnHxl/y7d3oBYdrZfqy1OTzIgxuO7O7hQUREfgKf1znMEBdg8tiJOyjH63
	rDPqgnopDX6YMPm1s+a5kf/zjyL2iLytGd0VdCf8xSRdJMAcWIlhdvxT0G5ZacIWsVjmYJKjua+
	07wuXmPu68WYQC+D28Hkc781vWR7iT2L37zR+/L3JaZX47e8MFzmmP/SNUkJ3VEzK5hXIGANVCX
	43TN
X-Received: by 2002:a17:90b:3e8e:b0:3ac:9176:e837 with SMTP id 98e67ed59e1d1-3b182f371dfmr4544926a91.50.1794465760108;
        Wed, 11 Nov 2026 22:42:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 10/24] ndisc6: upgrade 1.0.8 -> 1.0.9
Date: Wed, 11 Nov 2026 22:42:10 -0800
Message-ID: <20261112064225.2410019-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132179
Content-Type: text/plain; charset="utf-8"

Refresh 0001-Remove-use-of-variables-indicating-buildtime-informa.patch,
upstream already dropped the build date and host name; only the configure
invocation remains.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...riables-indicating-buildtime-informa.patch | 38 ++++++++-----------
 .../{ndisc6_1.0.8.bb => ndisc6_1.0.9.bb}      |  2 +-
 2 files changed, 17 insertions(+), 23 deletions(-)
 rename meta-networking/recipes-support/ndisc6/{ndisc6_1.0.8.bb => ndisc6_1.0.9.bb} (98%)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch b/meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch
index 7bfb17bf08..b569aa8503 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch
+++ b/meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch
@@ -10,75 +10,69 @@ Sourced From: https://salsa.debian.org/debian/ndisc6/-/blob/master/debian/patche
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- rdnss/rdnssd.c   | 2 --
- src/addrinfo.c   | 2 --
- src/ndisc.c      | 2 --
- src/tcpspray.c   | 2 --
- src/traceroute.c | 2 --
- 5 files changed, 10 deletions(-)
+ rdnss/rdnssd.c   | 1 -
+ src/addrinfo.c   | 1 -
+ src/ndisc.c      | 1 -
+ src/tcpspray.c   | 1 -
+ src/traceroute.c | 1 -
+ 5 files changed, 5 deletions(-)
 
 diff --git a/rdnss/rdnssd.c b/rdnss/rdnssd.c
-index b87edb2..7201525 100644
+index f03bc1f..7201525 100644
 --- a/rdnss/rdnssd.c
 +++ b/rdnss/rdnssd.c
-@@ -741,8 +741,6 @@ version (void)
+@@ -741,7 +741,6 @@ version (void)
  {
  	printf (_("rdnssd: IPv6 Recursive DNS Server discovery Daemon %s (%s)\n"),
  	        VERSION, "$Rev$");
--	printf (_(" built %s on %s\n"), __DATE__, PACKAGE_BUILD_HOSTNAME);
 -	printf (_("Configured with: %s\n"), PACKAGE_CONFIGURE_INVOCATION);
  	puts (_("Written by Pierre Ynard and Remi Denis-Courmont\n"));
  
  	printf (_("Copyright (C) %u-%u Pierre Ynard, Remi Denis-Courmont\n"),
 diff --git a/src/addrinfo.c b/src/addrinfo.c
-index cd73722..6316abd 100644
+index 23b3c7c..6316abd 100644
 --- a/src/addrinfo.c
 +++ b/src/addrinfo.c
-@@ -148,8 +148,6 @@ static int quick_usage (const char *path)
+@@ -148,7 +148,6 @@ static int quick_usage (const char *path)
  static int version (void)
  {
          printf (_("addrinfo %s (%s)\n"), VERSION, "$Rev$");
--	printf (_(" built %s on %s\n"), __DATE__, PACKAGE_BUILD_HOSTNAME);
 -        printf (_("Configured with: %s\n"), PACKAGE_CONFIGURE_INVOCATION);
          puts (_("Written by Remi Denis-Courmont\n"));
  
          printf (_("Copyright (C) %u-%u Remi Denis-Courmont\n"), 2002, 2007);
 diff --git a/src/ndisc.c b/src/ndisc.c
-index b190b18..6e222a0 100644
+index d6e80da..4a8c70d 100644
 --- a/src/ndisc.c
 +++ b/src/ndisc.c
-@@ -920,9 +920,7 @@ version (void)
+@@ -920,7 +920,6 @@ version (void)
  {
  	printf (_(
  "ndisc6: IPv6 Neighbor/Router Discovery userland tool %s (%s)\n"), VERSION, "$Rev$");
--	printf (_(" built %s on %s\n"), __DATE__, PACKAGE_BUILD_HOSTNAME);
- 
 -	printf (_("Configured with: %s\n"), PACKAGE_CONFIGURE_INVOCATION);
  	puts (_("Written by Remi Denis-Courmont\n"));
  
  	printf (_("Copyright (C) %u-%u Remi Denis-Courmont\n"), 2004, 2007);
 diff --git a/src/tcpspray.c b/src/tcpspray.c
-index 39d8939..6347795 100644
+index 7dac373..6347795 100644
 --- a/src/tcpspray.c
 +++ b/src/tcpspray.c
-@@ -302,8 +302,6 @@ version (void)
+@@ -302,7 +302,6 @@ version (void)
  {
  	printf (_(
  "tcpspray6: TCP/IP bandwidth tester %s (%s)\n"), VERSION, "$Rev$");
--	printf (_(" built %s on %s\n"), __DATE__, PACKAGE_BUILD_HOSTNAME);
 -	printf (_("Configured with: %s\n"), PACKAGE_CONFIGURE_INVOCATION);
  	puts (_("Written by Remi Denis-Courmont\n"));
  
  	printf (_("Copyright (C) %u-%u Remi Denis-Courmont\n"), 2005, 2007);
 diff --git a/src/traceroute.c b/src/traceroute.c
-index 489bc55..604b6af 100644
+index babfaa4..604b6af 100644
 --- a/src/traceroute.c
 +++ b/src/traceroute.c
-@@ -1251,8 +1251,6 @@ version (void)
+@@ -1251,7 +1251,6 @@ version (void)
  {
  	printf (_(
  "traceroute6: TCP & UDP IPv6 traceroute tool %s (%s)\n"), VERSION, "$Rev$");
--	printf (_(" built %s on %s\n"), __DATE__, PACKAGE_BUILD_HOSTNAME);
 -	printf (_("Configured with: %s\n"), PACKAGE_CONFIGURE_INVOCATION);
  	puts (_("Written by Remi Denis-Courmont\n"));
  
diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.9.bb
similarity index 98%
rename from meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
rename to meta-networking/recipes-support/ndisc6/ndisc6_1.0.9.bb
index 6931c64d4a..3d83b242e9 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.9.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.remlab.net/ndisc6/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "92e5d1cf6547fe40316b2a6ca2f7b8195ae0cbe5"
+SRCREV = "329ed9780676ad47903bcfdf1c32b2a53574ebeb"
 SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http;branch=master \
            file://0001-autogen-Do-not-symlink-gettext.h-from-build-host.patch \
            file://0001-Remove-use-of-variables-indicating-buildtime-informa.patch \
