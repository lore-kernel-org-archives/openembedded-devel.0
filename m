Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A2810706D7
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 13:01:25 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9135.1773493276024676919
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 06:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XWOqYvcp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260314130112e8076944f500020781-mwnl1i@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260314130112e8076944f500020781
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 14 Mar 2026 14:01:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=7u1XQXyIYd98ZkgamPqcZZ6W7sD2sOPcCVay1SM3hN8=;
 b=XWOqYvcpvVSPZ36ByMG1IFTCeeqUxFNIjNBecw3jW/jxGW0gct4EHATmqdJHnL9EQqw/6f
 lIfXazdt3iqj32TlVP8DbMSuqOWvZ5Q2QZHKCtL+x4HEY13lPxVzuY/VNciV/3Rv32HA9Dle
 rrN34oID7fhaGnjE6ZL8l+NBkqAmMO6GBxcHOnt4LbsZQuH6UU1+ABybKUKdLbLszP06WH6W
 5eWeaMN8Sk0i5kOWXcxyw29yxdpPa10v/d1PcHAUwdZ8rGNmF9a1peeBGw/kytAZz9Bdd09O
 Y++AciscIELKwTrANaNV7uY92EFWo7lUs8+iQnaxCE4gOZ4y0qPELO/A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 1/2] ntp: fix build with glibc 2.43
Date: Sat, 14 Mar 2026 14:01:01 +0100
Message-Id: <20260314130102.282943-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 13:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125206

From: Peter Marko <peter.marko@siemens.com>

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...d-failure-with-glibc-2.43-_Generic-m.patch | 41 +++++++++++++++++++
 .../recipes-support/ntp/ntp_4.2.8p18.bb       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/0001-include-fix-build-failure-with-glibc-2.43-_Generic-m.patch

diff --git a/meta-networking/recipes-support/ntp/ntp/0001-include-fix-build-failure-with-glibc-2.43-_Generic-m.patch b/meta-networking/recipes-support/ntp/ntp/0001-include-fix-build-failure-with-glibc-2.43-_Generic-m.patch
new file mode 100644
index 0000000000..89797b3aa8
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/0001-include-fix-build-failure-with-glibc-2.43-_Generic-m.patch
@@ -0,0 +1,41 @@
+From c7d76559dada2a6c0c9c18e8343a69b1eabc031e Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Fri, 13 Mar 2026 13:20:20 +0100
+Subject: [PATCH] include: fix build failure with glibc 2.38+ _Generic memchr
+ macro
+
+Newer glibc defines memchr as a _Generic macro in <string.h>.
+When sntp's config.h lacks a HAVE_MEMCHR definition, the #ifndef guard
+in l_stdlib.h passes and the extern declaration of memchr is emitted.
+The preprocessor expands the memchr token into _Generic(...), producing:
+
+  l_stdlib.h:225:14: error: expected identifier or '(' before '_Generic'
+
+Guard the fallback declarations of memchr and strnlen with an additional
+!defined(memchr) / !defined(strnlen) check so they are skipped when the
+symbols are already provided as macros by the C library headers.
+
+Upstream-Status: Pending
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ include/l_stdlib.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/l_stdlib.h b/include/l_stdlib.h
+index fbf57c5..195dc41 100644
+--- a/include/l_stdlib.h
++++ b/include/l_stdlib.h
+@@ -221,11 +221,11 @@ extern	int	errno;
+ extern	int	h_errno;
+ #endif
+ 
+-#ifndef HAVE_MEMCHR
++#if !defined(HAVE_MEMCHR) && !defined(memchr)
+ extern void *memchr(const void *s, int c, size_t n);
+ #endif
+ 
+-#ifndef HAVE_STRNLEN
++#if !defined(HAVE_STRNLEN) && !defined(strnlen)
+ extern size_t strnlen(const char *s, size_t n);
+ #endif
+ 
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
index a5a6048f8a..e59725e3e9 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch \
            file://0001-test-Fix-build-with-new-compiler-defaults-to-fno-com.patch \
            file://0001-sntp-Fix-types-in-check-for-pthread_detach.patch \
+           file://0001-include-fix-build-failure-with-glibc-2.43-_Generic-m.patch \
            file://ntpd \
            file://ntp.conf \
            file://ntpd.service \

