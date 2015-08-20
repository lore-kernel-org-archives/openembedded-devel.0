Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5655376A4B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:59:38 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so10431113wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=APZ8WcEXqVWmos2lFrz52M7PMEV91H5L5FhjxylCu4w=;
	b=H4HGfFYRnMqhB6JhMCVWaOIS9Tz8zhDIxAI6u24YUTIlEozPwVqADGQGo0RDWeFBaP
	ds1MiV2xuprZxxXLOCAg7VgwOgXhfwtIeSwVbpHvE7jxKLxyjLxqS+au81tLNomYynXP
	jY1Q7QxAcwloclaZvZBQtsFHFXUs2BHie/mHC5HLy5m1KzweUaY1czyNb8/LtZ6RjIyk
	gSFQlwPylwP2PBGMh8TMWD7s1UBxXCoBipUA/zhi9oAjHJmk+51JNj67h0SblHAqMAPs
	wRWXD+LV/r03kWqBOsU1TDnSGvmzdjpYiX+pDq1z59Wx6aP2hslAMIFxwKQE2WhrVUS/
	rK5g==
X-Gm-Message-State: ALoCoQko/Nyum7aJYTcnjdEctfiOy5bCVrXjK6R5DGCtxOiRkwJxdeYd8XWS9USRXyCP3mY6wPY/
X-Received: by 10.180.96.72 with SMTP id dq8mr15380266wib.17.1440086379005;
	Thu, 20 Aug 2015 08:59:39 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by smtp.gmail.com with ESMTPSA id
	fb3sm31100288wib.21.2015.08.20.08.59.37
	(version=TLS1_2 cipher=AES128-SHA256 bits=128/128);
	Thu, 20 Aug 2015 08:59:37 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2015 17:59:26 +0200
Message-Id: <1440086369-3321-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
References: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 2/5] heimdal 1.6rc2: add buildtool for samba4
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
X-List-Received-Date: Thu, 20 Aug 2015 15:59:39 -0000

Samba4 uses ans1_compile and compile_et to build itself, so we need a
-native version of it. Heimdal is the external upstream  variant of the tools
samba bundles.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...dm5-fix-race-in-Makefile-with-kadm5_err.h.patch | 34 +++++++++++++++
 .../recipes-connectivity/samba/heimdal_1.6rc2.bb   | 49 ++++++++++++++++++++++
 2 files changed, 83 insertions(+)
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
index 0000000..d6a057b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/heimdal_1.6rc2.bb
@@ -0,0 +1,49 @@
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
+do_configure_append() {
+    cp ${B}/*libtool ${B}/lib/libedit/libtool
+}
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


