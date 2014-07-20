Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id D79E870332
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 10:43:29 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id gf5so3865739lab.23
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=JFHt+G3AGB6I20gjIL3AF9KzN4qVI74MeWisvXDt3bU=;
	b=Eh1ZPRINRUHl2ZBkdyuble7bV8QRCFpYMXgwCOqUOoIeIAjmvdHdjeTLlRf+pbVRWy
	eckH2qVYQp7z0qRfvsLD/zBxk7swBQWOp0feo6E6t9vbSq+DRGhUUrc8qjntHQ/z8TdN
	VtywiHgmXCC1z46OLQDjyzEvgjq5riy1iSMvahvKzVsy1IyXIc2ix74yPin+cNFs/icI
	cNs5BJwC4Isb36yMCS9ciSCi5N2usn508aem+AUg0lUgKlzPxSHq1HxJuTRNq3MoyeOW
	JiezDIyfCcTO6GLoz9lc/4EhoVQn+05J0sTFehCJ/YpBF4SIB/aLOdrkL1nJ/kOQQzkJ
	wjWQ==
X-Received: by 10.152.5.167 with SMTP id t7mr9256309lat.54.1405853010344;
	Sun, 20 Jul 2014 03:43:30 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id t3sm3448934lby.22.2014.07.20.03.43.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 03:43:29 -0700 (PDT)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 12:41:53 +0200
Message-Id: <1405852914-4175-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][PATCH 1/2] ccid: Fix floating runtime dependency on flex
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jul 2014 10:43:34 -0000

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 .../recipes-support/ccid/ccid/no-dep-on-libfl.patch    | 18 ++++++++++++++++++
 meta-oe/recipes-support/ccid/ccid_1.4.8.bb             |  4 +++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/ccid/ccid/no-dep-on-libfl.patch

diff --git a/meta-oe/recipes-support/ccid/ccid/no-dep-on-libfl.patch b/meta-oe/recipes-support/ccid/ccid/no-dep-on-libfl.patch
new file mode 100644
index 0000000..477cc31
--- /dev/null
+++ b/meta-oe/recipes-support/ccid/ccid/no-dep-on-libfl.patch
@@ -0,0 +1,18 @@
+No need to link with libfl.
+
+Upstream-Status: Pending
+Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
+
+Index: ccid-1.4.8/src/Makefile.am
+===================================================================
+--- ccid-1.4.8.orig/src/Makefile.am
++++ ccid-1.4.8/src/Makefile.am
+@@ -53,7 +53,7 @@ PROVIDED_BY_PCSC = debug.c
+ endif
+ 
+ libccid_la_SOURCES = $(COMMON) $(USB) $(TOKEN_PARSER) $(PROVIDED_BY_PCSC) $(T1)
+-libccid_la_LIBADD = $(LEXLIB) $(LIBUSB_LIBS) $(PTHREAD_LIBS)
++libccid_la_LIBADD = $(LIBUSB_LIBS) $(PTHREAD_LIBS)
+ libccid_la_CFLAGS = $(PCSC_CFLAGS) $(LIBUSB_CFLAGS) $(PTHREAD_CFLAGS) \
+ 	$(SYMBOL_VISIBILITY) -D$(CCID_VERSION) -DSIMCLIST_NO_DUMPRESTORE
+ libccid_la_LDFLAGS = -avoid-version
diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.8.bb b/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
index 14f8875..078f785 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "virtual/libusb0 pcsc-lite"
 RDEPENDS_${PN} = "pcsc-lite"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/file/3768/ccid-${PV}.tar.bz2"
+SRC_URI = "https://alioth.debian.org/frs/download.php/file/3768/ccid-${PV}.tar.bz2 \
+           file://no-dep-on-libfl.patch"
+
 SRC_URI[md5sum] = "b6c37110f50b059a8ba94f118cfd679a"
 SRC_URI[sha256sum] = "7aca09fa4b9099e423402fd5df424adbafa502888710d1fda6015b6c1ff637ef"
 
-- 
1.9.3


