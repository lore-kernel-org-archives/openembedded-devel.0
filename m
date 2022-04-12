Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE88C4167D
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:38 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.11957.1649775960853847504
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 08:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=RgvrNsCq;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.171, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f171.google.com with SMTP id c15so24416443ljr.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 08:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oOQ8u19+zOIl/LMNAvv2rNtosZU+lqX2zhjxmgUwrJo=;
        b=RgvrNsCqg1z6J0whNSNjI8e3aBgpzmW2tb8y/oPoW3BateAMLXNPv5iB+9o82v+00K
         Jqp6Mm3wVOzpfastDbCalHknNtZQLGzF7Hp0PqFRyfuuSeTB0QwxwdgXOmVEPCkW5vTt
         8oPZmqJE3Ef2LrCWAdO/1xvOi2iBAsMFXGdRV44yySSO6/6Vf2wjfEsrTKyuNDAQzBlk
         Xwy+77JTzjEgfEUQ0Lw/Ct7a723Jlv7Xy9h0kibN9EXbWdaPSEVQOgEpqLIeKHpI3o82
         vpQ8M7AlyF9fqiomYx+6832U7/Q6h3ocor6+j2T5t+G94zZzcLHszYvKpOrDeU0bNXdh
         4AZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oOQ8u19+zOIl/LMNAvv2rNtosZU+lqX2zhjxmgUwrJo=;
        b=OOWfa1mWEuB4LtgZO+k0UcsqQ3RSGtvp5X+NJIgr3+wq7SKpKH37g3qj+Tl9pxgG3V
         yciQ3LJLG6Bofy3L/lj08bDaCfh9/1wi+ShgjK1cL4Qb/sOZ93v0vPf2rUsf7nIE9uWX
         TEWkc/PEMosCGEsPdpnx9/LPAWE90KH1I3YJISepDZWNAxx1PVGpxB7pqkCJT0cpFjId
         92wz3AMV/JSekES2hQTQo2o0ZRFNpXhyrnwEofMaIrO1qxFQgxmRIyvqLixl2WlGyEAa
         gdp+WXzIA+BI/91XkrgmJ6oOnDO4OE+dQnXQlG6cfwFxmMczRi+dHJ58nBxp1FIw7OTY
         CgOg==
X-Gm-Message-State: AOAM530uerWAdpYiUp8xbAGhJhdVYsPGbLL2SZYZhwoNH7kUH5PSp/el
	UT0oKEU9fdi9vXu6/zyIjD17Deq8Zs+B4QHbjrs=
X-Google-Smtp-Source: 
 ABdhPJz9Sj2ED1sxStIP2sZfbB298/gmvB8i9M9dFDfF8xns7f2SuDISU9p0pktn/0DjiJryMKXFMg==
X-Received: by 2002:a2e:bf12:0:b0:249:3a3b:e91a with SMTP id
 c18-20020a2ebf12000000b002493a3be91amr24175451ljr.343.1649775958182;
        Tue, 12 Apr 2022 08:05:58 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 t16-20020a192d50000000b0046b96f8abbdsm1035056lft.215.2022.04.12.08.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 08:05:57 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] htpdate: update to 1.3.3
Date: Tue, 12 Apr 2022 17:05:54 +0200
Message-Id: <20220412150554.25979-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96588

License-Update: formatting change - tabs replaced with spaces.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ent-variables-assignments-to-be-weak.patch | 31 --------------
 ...01-Replace-ntp_adjtime-with-adjtimex.patch | 40 -------------------
 .../{htpdate_1.2.2.bb => htpdate_1.3.3.bb}    | 22 ++++------
 3 files changed, 7 insertions(+), 86 deletions(-)
 delete mode 100644 meta-networking/recipes-support/htpdate/htpdate/0001-Make-environment-variables-assignments-to-be-weak.patch
 delete mode 100644 meta-networking/recipes-support/htpdate/htpdate/0001-Replace-ntp_adjtime-with-adjtimex.patch
 rename meta-networking/recipes-support/htpdate/{htpdate_1.2.2.bb => htpdate_1.3.3.bb} (64%)

diff --git a/meta-networking/recipes-support/htpdate/htpdate/0001-Make-environment-variables-assignments-to-be-weak.patch b/meta-networking/recipes-support/htpdate/htpdate/0001-Make-environment-variables-assignments-to-be-weak.patch
deleted file mode 100644
index 0ee44c162..000000000
--- a/meta-networking/recipes-support/htpdate/htpdate/0001-Make-environment-variables-assignments-to-be-weak.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 04603f52d793f964653e6a985944400fe4fa87ee Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 13 Jun 2018 17:50:20 -0700
-Subject: [PATCH] Make environment variables assignments to be weak
-
-So that OE can override them for cross builds
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 1c80c09..884126c 100644
---- a/Makefile
-+++ b/Makefile
-@@ -2,11 +2,11 @@ prefix = $(DESTDIR)/usr
- bindir = ${prefix}/bin
- mandir = ${prefix}/share/man
- 
--CC = gcc
-+CC ?= gcc
- CFLAGS += -Wall -std=c99 -pedantic -O2
- 
--INSTALL = /usr/bin/install -c
--STRIP = /usr/bin/strip -s
-+INSTALL ?= /usr/bin/install -c
-+STRIP ?= /usr/bin/strip -s
- 
- all: htpdate
- 
diff --git a/meta-networking/recipes-support/htpdate/htpdate/0001-Replace-ntp_adjtime-with-adjtimex.patch b/meta-networking/recipes-support/htpdate/htpdate/0001-Replace-ntp_adjtime-with-adjtimex.patch
deleted file mode 100644
index cca8c6c36..000000000
--- a/meta-networking/recipes-support/htpdate/htpdate/0001-Replace-ntp_adjtime-with-adjtimex.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 75646a2d2df14fdbc4a01e222a779afac94861d1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 14 Jun 2018 20:11:08 -0700
-Subject: [PATCH] Replace ntp_adjtime with adjtimex.
-
-ntp_adjtime in glibc is an alias to adjtimex and
-musl does not provide ntp_adjtime at all
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- htpdate.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/htpdate.c b/htpdate.c
-index 4171efe..ff0bf8d 100644
---- a/htpdate.c
-+++ b/htpdate.c
-@@ -391,7 +391,7 @@ static int htpdate_adjtimex( double drift ) {
- 
- 	/* Read current kernel frequency */
- 	tmx.modes = 0;
--	ntp_adjtime(&tmx);
-+	adjtimex(&tmx);
- 
- 	/* Calculate new frequency */
- 	freq = (long)(65536e6 * drift);
-@@ -406,7 +406,7 @@ static int htpdate_adjtimex( double drift ) {
- 
- 	/* Become root */
- 	swuid(0);
--	return( ntp_adjtime(&tmx) );
-+	return( adjtimex(&tmx) );
- 
- }
- 
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.2.2.bb b/meta-networking/recipes-support/htpdate/htpdate_1.3.3.bb
similarity index 64%
rename from meta-networking/recipes-support/htpdate/htpdate_1.2.2.bb
rename to meta-networking/recipes-support/htpdate/htpdate_1.3.3.bb
index 156ea3c59..d0cc414a6 100644
--- a/meta-networking/recipes-support/htpdate/htpdate_1.2.2.bb
+++ b/meta-networking/recipes-support/htpdate/htpdate_1.3.3.bb
@@ -1,8 +1,4 @@
-# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
 SUMMARY = "HTTP based time synchronization tool"
-
 DESCRIPTION = "The  HTTP Time Protocol (HTP) is used to synchronize a computer's time with\
  web servers as reference time source. This program can be used instead\
  ntpdate or similar, in networks that has a firewall blocking the NTP port.\
@@ -12,18 +8,15 @@ DESCRIPTION = "The  HTTP Time Protocol (HTP) is used to synchronize a computer's
  Htpdate works through proxy servers. Accuracy of htpdate will be usually\
  within 0.5 seconds (better with multiple servers).\
 "
-
-HOMEPAGE = "http://www.vervest.org/htp/"
-
+HOMEPAGE = "https://github.com/twekkel/htpdate"
+BUGTRACKER = "https://github.com/twekkel/htpdate/issues"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://htpdate.c;beginline=26;endline=30;md5=d7018a4d2c5a6eab392709a05e5e168a"
+LIC_FILES_CHKSUM = "file://htpdate.c;beginline=26;endline=30;md5=2b6cdb94bd5349646d7e33f9f501eef7"
+
+SRC_URI = "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.gz"
+SRC_URI[sha256sum] = "74f34b013eba6f99369819fa4b3d48e9ab5e531ad04f6af59cc04e8777c76ed7"
 
-SRC_URI = "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.xz \
-           file://0001-Make-environment-variables-assignments-to-be-weak.patch \
-           file://0001-Replace-ntp_adjtime-with-adjtimex.patch \
-           "
-SRC_URI[md5sum] = "aad8c33933648532ac8716c809b15be1"
-SRC_URI[sha256sum] = "5f1f959877852abb3153fa407e8532161a7abe916aa635796ef93f8e4119f955"
+TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_configure () {
 	:
@@ -36,4 +29,3 @@ do_compile () {
 do_install () {
 	oe_runmake install 'INSTALL=install' 'STRIP=echo' 'DESTDIR=${D}'
 }
-
-- 
2.25.1


