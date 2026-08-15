Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C5DC5DF74
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 02:51:02 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2462.1786762251246889445
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 19:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dn7x5nI0;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2257551a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 19:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786762251; x=1787367051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PDGrOVuYgD9swHWDUjVdQ6YnBydrQZKUPSmhRGwGOeQ=;
        b=dn7x5nI0MfWMS32QOdf5p5BpeumUwe/mSvL6efYhpZHzo7vUfrIf9MwkodvGhOHO51
         KFLvCQjUWH0hO4PDUvu3dLZn9KJKMf6qvicdS/8JnnPe3i7bTnxTYy0VpsmfKDNkvAGs
         QOQcVuOe0xyLnGzJjJCr2bdxXfSVdaHbBTdpwjTpzpPLsarKRE9LEV6DYY+FQr6P/Z+4
         5xDQK7xsHhZP9xMaJXJnaBCztsG8JQDX9EP/EltOCYAopxuzTQyHZxs1dynsDYQsHH/6
         NP5GTiUzJcUMzuv0DKeWTQZ0ocS6UJ1msAKggl7ok93dRh9celcON71UwzlMVd+HUpXl
         uU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786762251; x=1787367051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PDGrOVuYgD9swHWDUjVdQ6YnBydrQZKUPSmhRGwGOeQ=;
        b=KysTzDm30Dlidar9UbEMp/ng1TBRrQ3PJbQzEdEhbwtVT1B3Gxd/5myIhV2qcLbalZ
         n1mepfKVyxttyZ8aVZNClFFUNKu+IO78z1RNL5rrXKFsc8YZwmB/cic+WP2eZbxn1DrA
         CCXnV5BGESk1c4/dxMru6LuVVLrPZn5Srsk521EO6NrEckZSt+2FGLVMM3QYCOQtcxkN
         bsMgVj/i1zGTfRtlUHBFbslrjDrivX1urjLxkGMYb+cayWDan0dKksGQv0RcXo5TY3y6
         kAqgSxHAPRCcMq6BDyrxsOhFgREOC9YjmzOhdK3yZad6SCDgu7xxuXTqJTEAG2dFEFCa
         zq9Q==
X-Gm-Message-State: AOJu0YzOEZ+a2EzwM12MaBnFVSUcVcGFZZMwMjDuSclh03G6ZNkqqmZ9
	ZCDKZXhf+0JkuXmQVMJcwFPt8WeQa9Pfooc8LSDXWH93JmjNSz6CN90hhYvRm/aP
X-Gm-Gg: AR+sD10sirac26e9EuUrI+KmR5PkWo80ZNIVmbZfwzOwJzmf7qScsdMurzArHRetqz2
	4yyGiS+S8EoU9QIL3yxWQXSiuKx8faY9zGfBITomBuTtkilLWfKYxAjxaXbMmmzOtgtIk1hHXKj
	nkBoAekpMX5rC35rnvJC8MY1gmQVmJ1woO1OOqjEsryJhuHm3UptBaG43J4Vj8d6CyeTj8+xYsg
	2kwtHZEGM7R1AZcl9CUL8c23ak2HOKHOShx/y0HB+NbrBj9KTibZSUAgLB294VmYB8bU/Kh1fRL
	65I4zNa1TV5rfiOn9f3/z4ZyIDkRWsHeJWcJTg6I8CmYLMtsqPjGLqo+7GgtDUpUpSlBHyUo29K
	UEu6xCRwVepYiFaENDxO9aH6gmhaOP4Ov/6yHXbb83heydbu/yRPRaPk9IlCqWA9pOYHGpsLonr
	jEcjTCT08yrLIVGHho04izKwVSoNEQXodamjgcy8svr9GwFXwtkog/qE0DXEVK9sHjti+fFbMF/
	QuNRqnwxzLwxmqmNo9tTWwnCRXdq9DMvDiGRG7jgEWv9fFKdSGWLEwb8aoIO4FKBUD0hBEEN1kI
	hSDxsoFsiOu3o5o0En+oee+1BQlni0+MLxFzts2+CRxBN1IRKRhhlIPVT4y/7jMuHz95K44PkQm
	wLdwEnMthVmub2H45szeMLnHcusYVG0FJ4dTZDyDPsLX/tNdqKjswO97j
X-Received: by 2002:a17:90b:586d:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-3933ba75904mr11670527a91.16.1786762250405;
        Fri, 14 Aug 2026 19:50:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-323050db573sm5153181eec.9.2026.08.14.19.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 19:50:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 101/109] ssmtp: upgrade 2.64 -> 2.66
Date: Fri, 14 Aug 2026 19:50:35 -0700
Message-ID: <20260815025044.437694-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
References: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Aug 2026 02:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129166

Bump to the upstream 2.66 orig tarball (now .orig.tar.gz instead of
.orig.tar.bz2) from Debian.

- ssmtp-bug584162-fix.patch dropped: the fix (dropping trailing '\r'
  in standardise() and the header_parse() EOF/empty-header handling)
  is already present verbatim in the 2.66 source.
- 0001-ssmtp-Correct-the-null-pointer-assignment-to-char-po.patch
  dropped: upstream already initializes all the char pointers with
  NULL instead of (char)NULL.
- 0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch
  rebased: the call site already casts to (sighandler_t)handler in
  2.66, so only the handler() signature hunk is still needed; the
  call-site hunk was dropped as it no longer applies and is
  unnecessary once the signature takes an int.
- use-DESTDIR.patch rebased: upstream 2.66 already appends $(LDFLAGS)
  in the ssmtp link rule, so that hunk was dropped; the DESTDIR
  hunks for install/uninstall are still needed and were regenerated
  against the new Makefile.in.
- build-ouside_srcdir.patch and 0001-include-libgen.h-for-basename.patch
  kept unchanged, still needed, apply cleanly.

Build-verified: ssmtp builds and packages successfully.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ible-pointer-types-error-with-gcc-15.patch |  23 ++--
 ...e-null-pointer-assignment-to-char-po.patch |  51 -------
 .../ssmtp/ssmtp/ssmtp-bug584162-fix.patch     | 126 ------------------
 .../ssmtp/ssmtp/use-DESTDIR.patch             |  22 ++-
 .../ssmtp/{ssmtp_2.64.bb => ssmtp_2.66.bb}    |   8 +-
 5 files changed, 24 insertions(+), 206 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ssmtp/ssmtp/0001-ssmtp-Correct-the-null-pointer-assignment-to-char-po.patch
 delete mode 100644 meta-networking/recipes-support/ssmtp/ssmtp/ssmtp-bug584162-fix.patch
 rename meta-networking/recipes-support/ssmtp/{ssmtp_2.64.bb => ssmtp_2.66.bb} (83%)

diff --git a/meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch b/meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch
index 920c1cd2c5..4a1d97ef94 100644
--- a/meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch
+++ b/meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch
@@ -17,11 +17,19 @@ TOPDIR/tmp/work/core2-64-oe-linux/ssmtp/2.64/recipe-sysroot/usr/include/signal.h
  1393 | void handler(void)
       |      ^~~~~~~
 
+Note: as of ssmtp 2.66, the call site already reads
+"(void)signal(SIGALRM, (sighandler_t)handler);", so once handler()'s
+signature below is changed to take an int argument it matches
+sighandler_t (void (*)(int)) exactly and the incompatible-pointer-types
+warning/error is gone. Only the handler() signature hunk from the
+original patch is still needed; the call-site hunk has been dropped
+since it no longer applies and is unnecessary.
+
 Upstream-Status: Inactive-Upstream [This package has been orphaned https://bugs.debian.org/925056]
 Signed-off-by: mark.yang <mark.yang@lge.com>
 ---
- ssmtp.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ ssmtp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ssmtp.c b/ssmtp.c
 index 4dedaf8..a938d14 100644
@@ -35,13 +43,4 @@ index 4dedaf8..a938d14 100644
 +void handler(__attribute__((unused)) int sig)
  {
  	extern jmp_buf TimeoutJmpBuf;
- 
-@@ -1451,7 +1451,7 @@ int ssmtp(char *argv[])
- 	from = from_format(uad, override_from);
- 
- 	/* Now to the delivery of the message */
--	(void)signal(SIGALRM, (void(*)())handler);	/* Catch SIGALRM */
-+	(void)signal(SIGALRM, handler);	/* Catch SIGALRM */
- 	(void)alarm((unsigned) MAXWAIT);			/* Set initial timer */
- 	if(setjmp(TimeoutJmpBuf) != 0) {
- 		/* Then the timer has gone off and we bail out */
+
diff --git a/meta-networking/recipes-support/ssmtp/ssmtp/0001-ssmtp-Correct-the-null-pointer-assignment-to-char-po.patch b/meta-networking/recipes-support/ssmtp/ssmtp/0001-ssmtp-Correct-the-null-pointer-assignment-to-char-po.patch
deleted file mode 100644
index c7468fe17f..0000000000
--- a/meta-networking/recipes-support/ssmtp/ssmtp/0001-ssmtp-Correct-the-null-pointer-assignment-to-char-po.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 58cfb4f86b7fbf19eb643dfba87fdd890b3d4a4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 24 Aug 2022 19:27:31 -0700
-Subject: [PATCH] ssmtp: Correct the null pointer assignment to char pointers
-
-Fixes
-error: incompatible integer to pointer conversion initializing 'char *' with an expression of type 'char' [-Wint-conversion]
-| char *from = (char)NULL;                /* Use this as the From: address */
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ssmtp.c | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/ssmtp.c b/ssmtp.c
-index a74ba4e..0a719ac 100644
---- a/ssmtp.c
-+++ b/ssmtp.c
-@@ -55,21 +55,21 @@ bool_t use_oldauth = False;		/* use old AUTH LOGIN username style */
- 
- #define ARPADATE_LENGTH 32		/* Current date in RFC format */
- char arpadate[ARPADATE_LENGTH];
--char *auth_user = (char)NULL;
--char *auth_pass = (char)NULL;
--char *auth_method = (char)NULL;		/* Mechanism for SMTP authentication */
--char *mail_domain = (char)NULL;
--char *from = (char)NULL;		/* Use this as the From: address */
-+char *auth_user = NULL;
-+char *auth_pass = NULL;
-+char *auth_method = NULL;		/* Mechanism for SMTP authentication */
-+char *mail_domain = NULL;
-+char *from = NULL;		/* Use this as the From: address */
- char *hostname;
- char *mailhost = "mailhub";
--char *minus_f = (char)NULL;
--char *minus_F = (char)NULL;
-+char *minus_f = NULL;
-+char *minus_F = NULL;
- char *gecos;
--char *prog = (char)NULL;
-+char *prog = NULL;
- char *root = NULL;
- char *tls_cert = "/etc/ssl/certs/ssmtp.pem";	/* Default Certificate */
--char *uad = (char)NULL;
--char *config_file = (char)NULL;		/* alternate configuration file */
-+char *uad = NULL;
-+char *config_file = NULL;		/* alternate configuration file */
- 
- headers_t headers, *ht;
- 
diff --git a/meta-networking/recipes-support/ssmtp/ssmtp/ssmtp-bug584162-fix.patch b/meta-networking/recipes-support/ssmtp/ssmtp/ssmtp-bug584162-fix.patch
deleted file mode 100644
index e087bc7523..0000000000
--- a/meta-networking/recipes-support/ssmtp/ssmtp/ssmtp-bug584162-fix.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-Bug-Debian: http://bugs.debian.org/584162
-Reported-By: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
-Forwarded: not-needed
-Reviewed-By: Anibal Monsalve Salazar <anibal@debian.org>
-Last-Update: 2014-08-15
-
-From: "Daniel Richard G." <skunk@iSKUNK.ORG>
-Subject: Re: ssmtp: Partial loss of message body, sending message to wrong recipicients
-Date: Thu, 19 Jun 2014 14:44:30 -0400
-
-Attached is a patch against the original 2.64 source that should address
-this bug, and hopefully not break anything. An overview of my changes:
-
-* Added code to standarise() to drop the trailing '\r' if the line
-  originally ended with "\r\n".
-
-* Added a check to header_parse() that effectively converts an "\r\n" in
-  the input into '\n'.
-
-* Added a conditional so that header_parse() doesn't pass the empty
-  string to header_save()---a behavior I observed in testing, at the end
-  of a header block with "\r\n" line endings.
-
-* Simplified the last if(in_header) conditional in header_parse(),
-  because it erroneously assumes that if in_header == True, then c could
-  have some value other than EOF. (See the condition on the previous
-  "while" loop, and the lack of any other way to exit said loop.)
-
-  header_parse() will now properly grab a header if fed a message
-  without a body (i.e. no "\n\n" ending the header block), although this
-  code will still drop a header if there is no newline at the end.
-
-Christoph, thank you for your excellent analysis, and the test cases. I
-made use of them, and with my changes sSMTP appears to do the right
-thing.
-
-Debian patch from: https://sources.debian.net/patches/ssmtp/2.64-8/
-
-Upstream-Status: Backport [debian]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-Index: ssmtp-2.64/ssmtp.c
-===================================================================
---- ssmtp-2.64.orig/ssmtp.c
-+++ ssmtp-2.64/ssmtp.c
-@@ -375,6 +375,12 @@ bool_t standardise(char *str, bool_t *li
- 	if((p = strchr(str, '\n'))) {
- 		*p = (char)NULL;
- 		*linestart = True;
-+
-+		/* If the line ended in "\r\n", then drop the '\r' too */
-+		sl = strlen(str);
-+		if(sl >= 1 && str[sl - 1] == '\r') {
-+			str[sl - 1] = (char)NULL;
-+		}
- 	}
- 	return(leadingdot);
- }
-@@ -768,6 +774,14 @@ void header_parse(FILE *stream)
- 		}
- 		len++;
- 
-+		if(l == '\r' && c == '\n') {
-+			/* Properly handle input that already has "\r\n"
-+			   line endings; see https://bugs.debian.org/584162 */
-+			l = (len >= 2 ? *(q - 2) : '\n');
-+			q--;
-+			len--;
-+		}
-+
- 		if(l == '\n') {
- 			switch(c) {
- 				case ' ':
-@@ -790,7 +804,9 @@ void header_parse(FILE *stream)
- 						if((q = strrchr(p, '\n'))) {
- 							*q = (char)NULL;
- 						}
--						header_save(p);
-+						if(len > 0) {
-+							header_save(p);
-+						}
- 
- 						q = p;
- 						len = 0;
-@@ -800,35 +816,12 @@ void header_parse(FILE *stream)
- 
- 		l = c;
- 	}
--	if(in_header) {
--		if(l == '\n') {
--			switch(c) {
--				case ' ':
--				case '\t':
--						/* Must insert '\r' before '\n's embedded in header
--						   fields otherwise qmail won't accept our mail
--						   because a bare '\n' violates some RFC */
--						
--						*(q - 1) = '\r';	/* Replace previous \n with \r */
--						*q++ = '\n';		/* Insert \n */
--						len++;
--						
--						break;
--
--				case '\n':
--						in_header = False;
--
--				default:
--						*q = (char)NULL;
--						if((q = strrchr(p, '\n'))) {
--							*q = (char)NULL;
--						}
--						header_save(p);
--
--						q = p;
--						len = 0;
--			}
-+	if(in_header && l == '\n') {
-+		/* Got EOF while reading the header */
-+		if((q = strrchr(p, '\n'))) {
-+			*q = (char)NULL;
- 		}
-+		header_save(p);
- 	}
- 	(void)free(p);
- }
diff --git a/meta-networking/recipes-support/ssmtp/ssmtp/use-DESTDIR.patch b/meta-networking/recipes-support/ssmtp/ssmtp/use-DESTDIR.patch
index 26d8527610..a9c945e6fa 100644
--- a/meta-networking/recipes-support/ssmtp/ssmtp/use-DESTDIR.patch
+++ b/meta-networking/recipes-support/ssmtp/ssmtp/use-DESTDIR.patch
@@ -1,16 +1,19 @@
-Use DESTDIR during  install/uninstall, this helps
-with cross or staged builds. Additionally pass LDFLAGS
-during linking.
+Use DESTDIR during install/uninstall, this helps
+with cross or staged builds.
+
+Note: as of ssmtp 2.66, upstream already appends $(LDFLAGS) to the
+link command for the ssmtp binary, so that part of the original patch
+is no longer needed and has been dropped.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
 
-Index: ssmtp-2.64/Makefile.in
+Index: ssmtp-2.66/Makefile.in
 ===================================================================
---- ssmtp-2.64.orig/Makefile.in
-+++ ssmtp-2.64/Makefile.in
-@@ -46,40 +46,40 @@ all: ssmtp
+--- ssmtp-2.66.orig/Makefile.in
++++ ssmtp-2.66/Makefile.in
+@@ -46,36 +46,36 @@
  
  .PHONY: install
  install: ssmtp $(GEN_CONFIG)
@@ -67,8 +70,3 @@ Index: ssmtp-2.64/Makefile.in
  
  # Binaries:
  ssmtp: $(OBJS)
--	$(CC) -o ssmtp $(OBJS) @LIBS@ $(CFLAGS)
-+	$(CC) -o ssmtp $(OBJS) @LIBS@ $(CFLAGS) $(LDFLAGS)
- 
- .PHONY: clean
- clean:
diff --git a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb b/meta-networking/recipes-support/ssmtp/ssmtp_2.66.bb
similarity index 83%
rename from meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
rename to meta-networking/recipes-support/ssmtp/ssmtp_2.66.bb
index 8dc2d76477..67c335b7a0 100644
--- a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
+++ b/meta-networking/recipes-support/ssmtp/ssmtp_2.66.bb
@@ -3,17 +3,15 @@ HOMEPAGE = "http://packages.qa.debian.org/s/ssmtp.html"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
-           file://ssmtp-bug584162-fix.patch \
+SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://build-ouside_srcdir.patch \
            file://use-DESTDIR.patch \
-           file://0001-ssmtp-Correct-the-null-pointer-assignment-to-char-po.patch \
            file://0001-include-libgen.h-for-basename.patch \
            file://0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch \
            "
 
-SRC_URI[md5sum] = "65b4e0df4934a6cd08c506cabcbe584f"
-SRC_URI[sha256sum] = "22c37dc90c871e8e052b2cab0ad219d010fa938608cd66b21c8f3c759046fa36"
+SRC_URI[md5sum] = "f9894703fcc559f63cffacfea08f9b75"
+SRC_URI[sha256sum] = "6e639eafce4c8a3b7782c2a8a2d467be097c5896eae86fcde0f608666ea88249"
 
 inherit autotools update-alternatives
 

