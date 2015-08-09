Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 945E67685A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Aug 2015 08:54:13 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so113853216wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Aug 2015 01:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HjFj1WyeoDfqJnNwa//Xu8XE0QR2FazwZc0Du+uazzk=;
	b=NgNge7gaxdH04dRzM5W0Ofrl2HG/WL2Qz/ay5iXtXacssj1pxV9qB+hxvTkdpVXW2+
	trVLMRp1+cOn2BeWWMGQvKi5p+A3QrQeITOyx7ILszPMofJ0E+6va1arcO3nFydxaVm5
	qQnQzAdvPs3XROCq0Gxc+hIRNeA/AmYOiZnUIxYGyFc7KJQEYoMUGY+S6/SH+Ox/Qt9+
	m2ZecfhKNLRTc89WztuI+JppkJeKsv4IlE8zAmvwBfUbCMznoAlFJQZQ8aIUJrZ0nRGv
	HXAwOy7YsCwPiY3aW/uDSd1ajP+HVVgIRwoITU9R2L8+OmgctzGOAlLRR6SWMSf/CXmT
	lROA==
X-Gm-Message-State: ALoCoQn3snbtEd3gKJ4W0hmj9GcYLSNoPkCfGMm9tA55ThYitHdCvZdZSoUYcA7oYm59wF0Nnbn8
X-Received: by 10.194.120.198 with SMTP id le6mr32928121wjb.133.1439110453594; 
	Sun, 09 Aug 2015 01:54:13 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by smtp.gmail.com with ESMTPSA id
	d17sm23373406wjs.32.2015.08.09.01.54.11
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 09 Aug 2015 01:54:12 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Aug 2015 10:54:04 +0200
Message-Id: <1439110446-22189-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.0.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][RFC][PATCH 1/3] heimdal 1.6rc2: add buildtool for samba4
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
X-List-Received-Date: Sun, 09 Aug 2015 08:54:18 -0000

Samba4 uses ans1_compile and compile_et to build itself, so we need a
-native version of it. Heimdal is the external upstream  variant of the tools
samba bundles.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...dm5-fix-race-in-Makefile-with-kadm5_err.h.patch | 34 ++++++++++++++++
 .../recipes-connectivity/samba/heimdal_1.6rc2.bb   | 45 ++++++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/samba/heimdal/0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/heimdal_1.6rc2.bb

diff --git a/meta-oe/recipes-connectivity/samba/heimdal/0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch b/meta-oe/recipes-connectivity/samba/heimdal/0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch
new file mode 100644
index 0000000..bab933c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/heimdal/0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch
@@ -0,0 +1,34 @@
+From 18fe7d300f133c2b9eb93bb4bd81e4644979a74b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jakub=20=C4=8Cajka?= <jcajka@redhat.com>
+Date: Tue, 1 Jul 2014 13:13:43 -0600
+Subject: [PATCH] kadm5: fix race in Makefile with kadm5_err.h
+
+When running make with -j4, occasionally kadm5 fails due to a missing
+header file kadm5_err.h. Fix the race condition.
+
+Reported at https://bugzilla.redhat.com/1115164
+
+Reviewed-by: Ken Dreyer <ktdreyer@ktdreyer.com>
+
+Upstream-status: Backport [upstream commit 6affa4cceceaa1369dd895f8acdd7a883ee65674]
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ lib/kadm5/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/kadm5/Makefile.am b/lib/kadm5/Makefile.am
+index f8be3b1..1b399b1 100644
+--- a/lib/kadm5/Makefile.am
++++ b/lib/kadm5/Makefile.am
+@@ -155,6 +155,7 @@ iprop-commands.c iprop-commands.h: iprop-commands.in
+ 	$(SLC) $(srcdir)/iprop-commands.in
+ 
+ $(libkadm5srv_la_OBJECTS): kadm5_err.h
++$(libkadm5clnt_la_OBJECTS): kadm5_err.h
+ $(iprop_log_OBJECTS): iprop-commands.h
+ 
+ client_glue.lo server_glue.lo: $(srcdir)/common_glue.c
+-- 
+2.4.5
+
diff --git a/meta-oe/recipes-connectivity/samba/heimdal_1.6rc2.bb b/meta-oe/recipes-connectivity/samba/heimdal_1.6rc2.bb
new file mode 100644
index 0000000..7245d14
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/heimdal_1.6rc2.bb
@@ -0,0 +1,45 @@
+SUMMARY = "The Heimdal Kerberos 5, PKIX, CMS, GSS-API, SPNEGO, NTLM, Digest-MD5 and, SASL implementation."
+
+DEPENDS = "e2fsprogs ncurses"
+
+LICENSE = "BSD-3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2c6f8cfe82d4fdd74355866f0c14d3f"
+
+PV = "1.5+1.6rc2"
+
+SRC_URI = "http://www.h5l.org/dist/src/heimdal-1.6rc2.tar.gz \
+           file://0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch \
+          "
+S = "${WORKDIR}/heimdal-1.6rc2"
+SRC_URI[md5sum] = "152ca82660864acf7f712ae1a57e6795"
+SRC_URI[sha256sum] = "8fe19e0f12ff0d0c2f20a6cf56727deaabd89db9c197288022fb489e103b730d"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = " \
+	--disable-shared \
+	--enable-static \
+	--without-openldap \
+	--without-capng \
+	--without-sqlite3 \
+	--without-libintl \
+	--without-openssl \
+	--without-berkeley-db \
+	--without-readline \
+	--without-libedit \
+	--without-hesiod \
+	--without-x \
+	--disable-heimdal-documentation \
+       "
+
+# Even with the makefile patch parallel make fails 8 out of 10 times with -j8 
+PARALLEL_MAKE = ""
+
+# Put both compile tools together in $PATH and libexecdir in order to build samba4
+do_install_append() {
+    ln -sf ${libexecdir}/heimdal/asn1_compile ${D}${bindir}/
+    ln -sf ${bindir}/compile_et ${D}${libexecdir}/heimdal/
+}
+
+BBCLASSEXTEND = "native"
+
-- 
2.0.1


