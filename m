Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 73C3271AC4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:32 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id p66so4159228pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vFMSGXhTp4jmuFlZeLlv+IMvMAPrMppOK3E3iQjLid4=;
	b=v+9vh9fKzIEl1UqYiCb76FFIAohQxGfsbtX6iDFwMkBq6z7H4e3YGZvBvzxWkzqNFc
	wkS+I1Y8Ncuz2LE23s9NylbcLmVu6ImrBr7oyPrO8gQmDM3JhIqjlSlDsAbI6U88IJHh
	F8fW8MmC/Vj2dkKHV4HwFe7Aax5iH9YDBApLxCWeyFPCV8vvxtChhqvTQ4g7F7XDBTg+
	fWHFxxE0xZ8ZVlbgynRnNr96YcBF++yA+/ZcE/bii+LAstSLR421XeXX3/MU1c30nnbq
	NMtWv+Z4yMRMzmrvpMSP18lmG1vG9WIFzUqcrBSr+4A89gKjCaJjmUv//S3vHG8HcFME
	QfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vFMSGXhTp4jmuFlZeLlv+IMvMAPrMppOK3E3iQjLid4=;
	b=ZuFu+EJ5hQw0UgyU3vGa89A2PjCtzT5/ffM19weGJOJCsWthO3Mu4CTYcjbn0z0czV
	Qh6PCqSPEgtNoP4KSHLB3zQ364dkMSSokRd/P+34D2cn9yNUawlsT8tcI0O2nQWWL/uV
	oPsTWIaIozKrjyOC13Lefbu09INAybIW0eupk7ve6DI+bhgau4hcsIYzjqevB1jkpMrz
	Wy4wOTEeGWJBkDwjjCi8B7St7V5G9ivnU7ICJH4az1gvg+MajLZ7uHNW41gHj/nRjiOT
	1kFmqqccuwHYsxKY0xXhi76TTk0sLfxAn8IPqfueOTOyHv20VI1NXTlEFeQD1FCapYtz
	+cVQ==
X-Gm-Message-State: AKaTC03a6G1X5KUoLCRsTWSR1xHyWamMkTruVbiQI59kilipirICrBn8tCScgTKARLbj7A==
X-Received: by 10.99.178.89 with SMTP id t25mr3457106pgo.131.1479892953784;
	Wed, 23 Nov 2016 01:22:33 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:42 -0800
Message-Id: <20161123092209.23699-22-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 22/49] ez-ipupdate: Add recipe
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:32 -0000

A client for automaticly updating your dynamic hostname parameters

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ez-ipupdate/ez-ipupdate_3.0.11b7.bb            | 15 ++++++++++
 .../ez-ipupdate/files/Makefile.am.patch            | 14 ++++++++++
 .../ez-ipupdate/files/cache_file.c.patch           | 32 ++++++++++++++++++++++
 .../ez-ipupdate/files/conf_file.c.patch            | 18 ++++++++++++
 4 files changed, 79 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
 create mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/files/Makefile.am.patch
 create mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/files/cache_file.c.patch
 create mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/files/conf_file.c.patch

diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb b/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
new file mode 100644
index 0000000..cb5375c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
@@ -0,0 +1,15 @@
+SUMMARY = "daemon that sends updates when your IP changes"
+HOMEPAGE = "http://sourceforge.net/projects/ez-ipupdate/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7783169b4be06b54e86730eb01bc3a31"
+
+SRC_URI = "http://sourceforge.net/projects/ez-ipupdate/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+    file://Makefile.am.patch \
+    file://cache_file.c.patch \
+    file://conf_file.c.patch \
+    "
+SRC_URI[md5sum] = "525be4550b4461fdf105aed8e753b020"
+SRC_URI[sha256sum] = "a15ec0dc0b78ec7578360987c68e43a67bc8d3591cbf528a323588830ae22c20"
+
+inherit autotools pkgconfig
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/Makefile.am.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/Makefile.am.patch
new file mode 100644
index 0000000..d80ed3e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/files/Makefile.am.patch
@@ -0,0 +1,14 @@
+Remove EXTRASRC and EXTRAOBJ from obj list
+
+--- ez-ipupdate-3.0.11b7/Makefile.am.orig	2014-07-02 13:47:50.758034983 -0600
++++ ez-ipupdate-3.0.11b7/Makefile.am	2014-07-02 13:48:38.406034650 -0600
+@@ -1,7 +1,7 @@
+ 
+ bin_PROGRAMS = ez-ipupdate
+-ez_ipupdate_SOURCES = ez-ipupdate.c conf_file.c conf_file.h md5.c md5.h cache_file.c cache_file.h error.h pid_file.c pid_file.h dprintf.h @EXTRASRC@
+-ez_ipupdate_LDADD = @EXTRAOBJ@
++ez_ipupdate_SOURCES = ez-ipupdate.c conf_file.c conf_file.h md5.c md5.h cache_file.c cache_file.h error.h pid_file.c pid_file.h dprintf.h
++ez_ipupdate_LDADD =
+ 
+ EXTRA_DIST = getpass.c ez-ipupdate.lsm example.conf example-pgpow.conf example-dhs.conf example-dyndns.conf example-ods.conf example-tzo.conf example-gnudip.conf example-easydns.conf example-justlinux.conf example-dyns.conf CHANGELOG mkbinary example-heipv6tb.conf
+ 
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/cache_file.c.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/cache_file.c.patch
new file mode 100644
index 0000000..de5eb3a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/files/cache_file.c.patch
@@ -0,0 +1,32 @@
+Dont assume errno type
+
+--- ez-ipupdate-3.0.11b7/cache_file.c.orig	2014-07-02 14:01:07.126029412 -0600
++++ ez-ipupdate-3.0.11b7/cache_file.c	2014-07-02 14:08:27.422026332 -0600
+@@ -43,11 +43,11 @@
+ #include <cache_file.h>
+ 
+ #if HAVE_STRERROR
+-extern int errno;
++#  include <errno.h>
+ #  define error_string strerror(errno)
+ #elif HAVE_SYS_ERRLIST
+ extern const char *const sys_errlist[];
+-extern int errno;
++#  include <errno.h>
+ #  define error_string (sys_errlist[errno])
+ #else
+ #  define error_string "error message not found"
+@@ -63,11 +63,11 @@
+ #  define dprintf(x)
+ #endif
+ #if HAVE_STRERROR
+-extern int errno;
++#  include <errno.h>
+ #  define error_string strerror(errno)
+ #elif HAVE_SYS_ERRLIST
+ extern const char *const sys_errlist[];
+-extern int errno;
++#  include <errno.h>
+ #  define error_string (sys_errlist[errno])
+ #else
+ #  define error_string "error message not found"
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/conf_file.c.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/conf_file.c.patch
new file mode 100644
index 0000000..02218a3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/files/conf_file.c.patch
@@ -0,0 +1,18 @@
+Dont assume errno type
+
+--- ez-ipupdate-3.0.11b7/conf_file.c.orig	2014-07-02 14:01:19.174029328 -0600
++++ ez-ipupdate-3.0.11b7/conf_file.c	2014-07-02 14:08:42.982026223 -0600
+@@ -38,11 +38,11 @@
+ #include <conf_file.h>
+ 
+ #if HAVE_STRERROR
+-extern int errno;
++#  include <errno.h>
+ #  define error_string strerror(errno)
+ #elif HAVE_SYS_ERRLIST
+ extern const char *const sys_errlist[];
+-extern int errno;
++#  include <errno.h>
+ #  define error_string (sys_errlist[errno])
+ #else
+ #  define error_string "error message not found"
-- 
2.10.2


