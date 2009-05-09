Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2arh-0000U1-AX
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:33 +0200
Received: by an-out-0708.google.com with SMTP id b6so1008350ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=vTmQZzHyxfS7XZlO6DO92vV+pV96kbBc1WmP5e2kw2Q=;
	b=YJDPIW6WMPg0NC4oWpvJCt4SsUqB8finYzECnd4I8+wUkBDiY8j4pxfxU9J0P7d9rv
	J2N9be6VIPb0QqDU8Yt0H5PcH371ZOyewOBTFlMSzPo0gqoSCCGlIA+kmgcplv8FAH0i
	Pjq8632/pwhD2I+Hgci4NKZXX/ws6ROJ6Smf4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=F4ModabTmnqfBJEqqZjpMfes62tOc2lLReHUN9p3aqaseqCZGCeD1x35uesaMheJ3v
	mLZLPw5Nm91h6po60XS4a+vv4hEqL8Nf7BefWRGrG7+LpBNuyip0J7BighRClRpOMWXF
	xWrEOaSFWft+3E8mNsyBznhUBVqS2RHBBSW70=
Received: by 10.101.71.3 with SMTP id y3mr10144219ank.62.1241830218061;
	Fri, 08 May 2009 17:50:18 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm3665612ywp.24.2009.05.08.17.50.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:16 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id D46F261019A; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:27 -0300
Message-Id: <1241830239-5594-12-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-11-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-11-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 11/23] cups: split backends and models
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 May 2009 00:56:33 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/cups/cups.inc       |   13 ++++++++++++-
 recipes/cups/cups_1.2.12.bb |    2 +-
 recipes/cups/cups_1.2.7.bb  |    8 ++------
 recipes/cups/cups_1.3.8.bb  |    2 +-
 4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/recipes/cups/cups.inc b/recipes/cups/cups.inc
index 8e2a7a8..074bf83 100644
--- a/recipes/cups/cups.inc
+++ b/recipes/cups/cups.inc
@@ -62,7 +62,18 @@ python do_package_append() {
 	os.system('chmod 0511 %s/install/cups/var/run/cups/certs' % workdir)
 }
 
-PACKAGES =+ "${PN}-lib ${PN}-libimage"
+PACKAGES_DYNAMIC += "${PN}-backend-*"
+
+python populate_packages_prepend() {
+	backend_dir = bb.data.expand('${libdir}/cups/backend/', d)
+	do_split_packages(d, backend_dir, '^(.*)$', 'cups-backend-%s',
+	                  '${PN} backend for %s', prepend=True, allow_links=True)
+}
+
+FILES_${PN}-filters += "${libdir}/cups/filter/*"
+FILES_${PN}-models += "${datadir}/cups/model/*"
+
+PACKAGES =+ "${PN}-lib ${PN}-libimage ${PN}-filters ${PN}-models"
 
 FILES_${PN}-lib = "${libdir}/libcups.so.*"
 
diff --git a/recipes/cups/cups_1.2.12.bb b/recipes/cups/cups_1.2.12.bb
index 4f7d0d4..eb156d5 100644
--- a/recipes/cups/cups_1.2.12.bb
+++ b/recipes/cups/cups_1.2.12.bb
@@ -1,2 +1,2 @@
 require cups.inc
-PR = "r2"
+PR = "r3"
diff --git a/recipes/cups/cups_1.2.7.bb b/recipes/cups/cups_1.2.7.bb
index 8559bfc..b00db42 100644
--- a/recipes/cups/cups_1.2.7.bb
+++ b/recipes/cups/cups_1.2.7.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "An Internet printing system for Unix."
 SECTION = "console/utils"
 LICENSE = "GPL LGPL"
-DEPENDS = "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
-PR = "r1"
+DEPENDS = "gnutls jpeg dbus dbus-glib libpng zlib install-native fakeroot-native"
+PR = "r2"
 
 SRC_URI = "ftp://ftp3.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2 \
 	  "
@@ -70,7 +70,3 @@ FILES_${PN} += "${datadir}/doc/cups/images \
 		${datadir}/doc/cups/*.css \
                 ${datadir}/icons/ \
 	       "
-
-
-
-
diff --git a/recipes/cups/cups_1.3.8.bb b/recipes/cups/cups_1.3.8.bb
index 79cbc32..68a36dd 100644
--- a/recipes/cups/cups_1.3.8.bb
+++ b/recipes/cups/cups_1.3.8.bb
@@ -1,7 +1,7 @@
 require cups.inc
 
 SRC_URI += "file://use_echo_only_in_init.patch;patch=1"
-PR = "r2"
+PR = "r3"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.6.3.rc1.51.gea0b7



