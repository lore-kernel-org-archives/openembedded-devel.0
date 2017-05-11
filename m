Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6E36860079
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 12:28:26 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id w50so3345750wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 05:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Zcnq6M8tboUy/XIzSqhLFBYA1Xo+/Dd/xx1qyVeLaIQ=;
	b=p1VspomFxJmHzFqi3zyc/WVM4ll7giS3l6p2ZGyvXMpT0wkJecbXlpYD8hB5k6Bore
	XTFRaeK0U72447rsjFqBb9jMj16X7XLLm6AFaBjMBIyJWb86PBPEdSXovssGFKMPvMph
	q2MmCKf3nHcw7KH28pEIY3eJHTtrPmICDlnVAm/gD9IVN8MiA3Ut4XCGElqNXDII/akQ
	r9I5o1se/SGD9bqaV6HV3ttLR+/qN+H05bsmn9/XNx/wqyulxOZsDf2Z/NqziIeaoKoq
	VUHSk7aQuP4Q/FO1DcpLPefP17wB1E7oSt1v09t91/XZ3N7ShXrQiZiRS8D+gYsWqF8q
	IUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Zcnq6M8tboUy/XIzSqhLFBYA1Xo+/Dd/xx1qyVeLaIQ=;
	b=ZfUkNVdNZaDJD97bihnpNTHpdLMXjBqTnxgRXAVhBMeZqfQ12mH9jyuYBhHgj9DpRj
	QVIK8AOmI42z9Fu8qBMf2lfhFdcqt1f6VJn6GFTQXUHKUyyERahfAkrJb20TLj2O4Phg
	cDfURRcaI3uHyv+js4IhvSDaV/r8lKVRsuoam8Khoz9lVatFdzQQlY8u9SzFWdBnu4+B
	+R9e3VhOlXahTy+rg3CK8IA8Qtr/mDeAiTFGvgwoLlutpYe4clg6/cWFDapsNJ+3C2Un
	pCeU7JouwTWePNJ3Il4rNJXqB8WjCrPDJm7whU/TyZdjd8OlKosgdlY95YPGPw9Z9JXk
	DAhg==
X-Gm-Message-State: AODbwcDJi24X/Z5QOAWYmgxvfD7Pz3LpgzY6T4UT+JsM62MVmCrFUt8i
	jkr+Ft7jQJ83BQ==
X-Received: by 10.223.163.80 with SMTP id d16mr53911wrb.164.1494505707800;
	Thu, 11 May 2017 05:28:27 -0700 (PDT)
Received: from localhost.localdomain ([151.68.54.167])
	by smtp.gmail.com with ESMTPSA id t26sm28347wra.43.2017.05.11.05.28.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 May 2017 05:28:26 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 May 2017 14:28:11 +0200
Message-Id: <1494505694-28118-1-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: [PATCH 1/3] wxstreams: fix build with gcc-6 (patch from Debian). Remove blacklists for wvstreams and wvdial
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
X-List-Received-Date: Thu, 11 May 2017 12:28:27 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
---
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb |  2 --
 .../wvdial/wvstreams/gcc-6.patch                   | 42 ++++++++++++++++++++++
 .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |  4 +--
 3 files changed, 43 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/gcc-6.patch

diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index 80e72bd..f7adf4c 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -28,5 +28,3 @@ do_configure() {
 do_install() {
     oe_runmake prefix=${D}/usr PPPDIR=${D}/etc/ppp/peers install
 }
-
-PNBLACKLIST[wvdial] ?= "Depends on broken wvstreams - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc-6.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc-6.patch
new file mode 100644
index 0000000..b084887
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc-6.patch
@@ -0,0 +1,42 @@
+Description: Fix compilation with gcc-6
+Author: Gert Wollny <gw.fossdev@gmail.com>
+Last-Updated: 2016-07-26
+Forwarded: No
+Bug-Debian: https://bugs.debian.org/811659
+Bug-Debian: https://bugs.debian.org/831146
+
+--- a/streams/wvstream.cc
++++ b/streams/wvstream.cc
+@@ -907,9 +907,9 @@
+     
+     if (forceable)
+     {
+-	si.wants.readable = readcb;
+-	si.wants.writable = writecb;
+-	si.wants.isexception = exceptcb;
++	si.wants.readable = static_cast<bool>(readcb);
++	si.wants.writable = static_cast<bool>(writecb);
++	si.wants.isexception = static_cast<bool>(exceptcb);
+     }
+     else
+     {
+@@ -1019,7 +1019,8 @@
+ 
+ IWvStream::SelectRequest WvStream::get_select_request()
+ {
+-    return IWvStream::SelectRequest(readcb, writecb, exceptcb);
++    return IWvStream::SelectRequest(static_cast<bool>(readcb), static_cast<bool>(writecb),
++				    static_cast<bool>(exceptcb));
+ }
+ 
+ 
+@@ -1107,7 +1108,8 @@
+     // inefficient, because if the alarm was expired then pre_select()
+     // returned true anyway and short-circuited the previous select().
+     TRACE("hello-%p\n", this);
+-    return !alarm_was_ticking || select(0, readcb, writecb, exceptcb);
++    return !alarm_was_ticking || select(0, static_cast<bool>(readcb),
++					static_cast<bool>(writecb), static_cast<bool>(exceptcb));
+ }
+ 
+ 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index fe79dc1..607a617 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
            file://05_gcc.diff \
            file://06_gcc-4.7.diff \
            file://07_buildflags.diff \
+           file://gcc-6.patch \
           "
 
 SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
@@ -46,6 +47,3 @@ FILES_libwvstreams-extras-dbg = "${libdir}/.debug/libwvbase.so.* ${libdir}/.debu
 
 FILES_${PN}-valgrind = "${libdir}/valgrind/wvstreams.supp"
 RDEPENDS_${PN} += "perl"
-
-# http://errors.yoctoproject.org/Errors/Details/68614/
-PNBLACKLIST[wvstreams] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.7.4


