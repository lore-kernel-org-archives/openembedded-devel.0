Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 02C427833A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 22:29:22 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id p87so12939840pfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 15:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=h3oLqRDAhvGfj7+CkPEArKgW01ZIIsmnoybf/mjZ1xw=;
	b=Z1+wWfWZDgI5HOTTff/dq6GVcpKPO11su90L/sg25PzD38EMcVq07Lj27Ex5YTPHL/
	ATVhV0W3DToYFvM58TQeyb+i/ytQvyOl8D+SeNaBqc1HS7a/hd1uu1p5QFvNg2hkABAf
	X1ImjUegiUHEWvHX2a+1xP+Hwg3i/8UaxEx73HNb6ot/QR/YvFp7XXA0MC6T7BoGP0Py
	GKB5VSLmBuiEgS/7aX0cdCbrFL6VlZLlBA8fdwWsBRH4c8T8QT3Li+KNWg26C08qScho
	CTQbLW5Nx46cxo3p/2yyDZ2IwBetcJqe2xSt9ylu6wIoNnKGxDRSNrYJAhC1EDqlE2DF
	mBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h3oLqRDAhvGfj7+CkPEArKgW01ZIIsmnoybf/mjZ1xw=;
	b=OmgEPKU5kqBMMKJhzUqZK0QQkPmsI4ApeYF190crdQbskz/9gyMTSNEBHEMoWCf5E5
	7abVvvoO/HwPrbiJd9xhX2B8kckVBe++IbWehREwWOtPFZdooXmuBaxOqGZnuFiY+LEU
	J75wESKShaDn14Xuenwf6VbqLGfsMihrt2OaPfR6EVORTDfLY/CoJxqRV35wxYPpq2At
	Ho+uOc/eB9z2fBrSHi0PbV73UjubA918cgV04OYr678qbfLc6ajLI5h88q4RY6pfan3k
	KXapms/+6Rq0Cz85jFje0daarHimThYzrPRxRrxoKpn/IHrh8iclJMl/vboHZ3O1MyAF
	p4LA==
X-Gm-Message-State: AMCzsaWlOHt+FlqG/EbYOYBxhQhDuqiynULqHi1KXOvWClb++7t5mUn8
	qpYL5rI39e+HwCeuH7akvdxMew==
X-Google-Smtp-Source: ABhQp+SulnIQaj9S8oheJBx8dKVBa46oaop7WyQnvJYI52qAggyIon1z+AGHcqcyn+uHe/hSoVQjsg==
X-Received: by 10.84.236.12 with SMTP id q12mr5184243plk.314.1508538563518;
	Fri, 20 Oct 2017 15:29:23 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	d89sm3233210pfb.121.2017.10.20.15.29.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Oct 2017 15:29:22 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Oct 2017 15:29:15 -0700
Message-Id: <1508538555-12051-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] ssmtp: misc recipe updates + add Debian "partial loss of message body" fix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2017 22:29:23 -0000

 - Backport Debian fix for "partial loss of message body, sending
   message to wrong recipicients" issue:

     https://sources.debian.net/patches/ssmtp/2.64-8/ssmtp-bug584162-fix.patch/

 - Control ipv6 support based on ipv6 DISTRO feature.
 - Enable ssl support by default (and add PACKAGECONFIG option to
   control it).
 - Drop inetutils dependency (inetutils provides only applications,
   not libraries or header files, so a build dependency on it doesn't
   make sense).
 - Drop pkgconfig class (the ssmtp configure script etc doesn't make
   any use of pkg-config).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../ssmtp/ssmtp/ssmtp-bug584162-fix.patch          | 126 +++++++++++++++++++++
 .../recipes-support/ssmtp/ssmtp_2.64.bb            |  24 ++--
 2 files changed, 140 insertions(+), 10 deletions(-)
 create mode 100644 meta-networking/recipes-support/ssmtp/ssmtp/ssmtp-bug584162-fix.patch

diff --git a/meta-networking/recipes-support/ssmtp/ssmtp/ssmtp-bug584162-fix.patch b/meta-networking/recipes-support/ssmtp/ssmtp/ssmtp-bug584162-fix.patch
new file mode 100644
index 0000000..e087bc7
--- /dev/null
+++ b/meta-networking/recipes-support/ssmtp/ssmtp/ssmtp-bug584162-fix.patch
@@ -0,0 +1,126 @@
+Bug-Debian: http://bugs.debian.org/584162
+Reported-By: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
+Forwarded: not-needed
+Reviewed-By: Anibal Monsalve Salazar <anibal@debian.org>
+Last-Update: 2014-08-15
+
+From: "Daniel Richard G." <skunk@iSKUNK.ORG>
+Subject: Re: ssmtp: Partial loss of message body, sending message to wrong recipicients
+Date: Thu, 19 Jun 2014 14:44:30 -0400
+
+Attached is a patch against the original 2.64 source that should address
+this bug, and hopefully not break anything. An overview of my changes:
+
+* Added code to standarise() to drop the trailing '\r' if the line
+  originally ended with "\r\n".
+
+* Added a check to header_parse() that effectively converts an "\r\n" in
+  the input into '\n'.
+
+* Added a conditional so that header_parse() doesn't pass the empty
+  string to header_save()---a behavior I observed in testing, at the end
+  of a header block with "\r\n" line endings.
+
+* Simplified the last if(in_header) conditional in header_parse(),
+  because it erroneously assumes that if in_header == True, then c could
+  have some value other than EOF. (See the condition on the previous
+  "while" loop, and the lack of any other way to exit said loop.)
+
+  header_parse() will now properly grab a header if fed a message
+  without a body (i.e. no "\n\n" ending the header block), although this
+  code will still drop a header if there is no newline at the end.
+
+Christoph, thank you for your excellent analysis, and the test cases. I
+made use of them, and with my changes sSMTP appears to do the right
+thing.
+
+Debian patch from: https://sources.debian.net/patches/ssmtp/2.64-8/
+
+Upstream-Status: Backport [debian]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+Index: ssmtp-2.64/ssmtp.c
+===================================================================
+--- ssmtp-2.64.orig/ssmtp.c
++++ ssmtp-2.64/ssmtp.c
+@@ -375,6 +375,12 @@ bool_t standardise(char *str, bool_t *li
+ 	if((p = strchr(str, '\n'))) {
+ 		*p = (char)NULL;
+ 		*linestart = True;
++
++		/* If the line ended in "\r\n", then drop the '\r' too */
++		sl = strlen(str);
++		if(sl >= 1 && str[sl - 1] == '\r') {
++			str[sl - 1] = (char)NULL;
++		}
+ 	}
+ 	return(leadingdot);
+ }
+@@ -768,6 +774,14 @@ void header_parse(FILE *stream)
+ 		}
+ 		len++;
+ 
++		if(l == '\r' && c == '\n') {
++			/* Properly handle input that already has "\r\n"
++			   line endings; see https://bugs.debian.org/584162 */
++			l = (len >= 2 ? *(q - 2) : '\n');
++			q--;
++			len--;
++		}
++
+ 		if(l == '\n') {
+ 			switch(c) {
+ 				case ' ':
+@@ -790,7 +804,9 @@ void header_parse(FILE *stream)
+ 						if((q = strrchr(p, '\n'))) {
+ 							*q = (char)NULL;
+ 						}
+-						header_save(p);
++						if(len > 0) {
++							header_save(p);
++						}
+ 
+ 						q = p;
+ 						len = 0;
+@@ -800,35 +816,12 @@ void header_parse(FILE *stream)
+ 
+ 		l = c;
+ 	}
+-	if(in_header) {
+-		if(l == '\n') {
+-			switch(c) {
+-				case ' ':
+-				case '\t':
+-						/* Must insert '\r' before '\n's embedded in header
+-						   fields otherwise qmail won't accept our mail
+-						   because a bare '\n' violates some RFC */
+-						
+-						*(q - 1) = '\r';	/* Replace previous \n with \r */
+-						*q++ = '\n';		/* Insert \n */
+-						len++;
+-						
+-						break;
+-
+-				case '\n':
+-						in_header = False;
+-
+-				default:
+-						*q = (char)NULL;
+-						if((q = strrchr(p, '\n'))) {
+-							*q = (char)NULL;
+-						}
+-						header_save(p);
+-
+-						q = p;
+-						len = 0;
+-			}
++	if(in_header && l == '\n') {
++		/* Got EOF while reading the header */
++		if((q = strrchr(p, '\n'))) {
++			*q = (char)NULL;
+ 		}
++		header_save(p);
+ 	}
+ 	(void)free(p);
+ }
diff --git a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
index 9d4864d..07e3ffe 100644
--- a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
+++ b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
@@ -1,25 +1,29 @@
 SUMMARY = "extremely simple MTA to get mail off the system to a mail hub"
 HOMEPAGE = "http://packages.qa.debian.org/s/ssmtp.html"
-
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
 
-SRC_URI = "\
-           ${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
+SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
+           file://ssmtp-bug584162-fix.patch \
            file://build-ouside_srcdir.patch \
            file://use-DESTDIR.patch \
-          "
-
-EXTRA_OECONF += "--mandir=${mandir}"
-
-EXTRA_OEMAKE = "GEN_CONFIG='/bin/true'"
+"
 
 SRC_URI[md5sum] = "65b4e0df4934a6cd08c506cabcbe584f"
 SRC_URI[sha256sum] = "22c37dc90c871e8e052b2cab0ad219d010fa938608cd66b21c8f3c759046fa36"
 
-inherit autotools pkgconfig
+inherit autotools
+
+PACKAGECONFIG ?= "ssl ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+
+PACKAGECONFIG[ssl] = "--enable-ssl,--disable-ssl,openssl"
+PACKAGECONFIG[ipv6] = "--enable-inet6,--disable-inet6"
+
+EXTRA_OECONF += "--mandir=${mandir}"
+
+EXTRA_OEMAKE = "GEN_CONFIG='/bin/true'"
 
-DEPENDS += "openssl inetutils"
+LDFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'ssl', '-lssl -lcrypto', '', d)}"
 
 do_install_append () {
     install -d ${D}${mandir}/
-- 
1.9.1


