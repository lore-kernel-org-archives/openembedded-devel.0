Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Ou86J-0003kn-RV
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 20:13:29 +0200
Received: by yxg6 with SMTP id 6so812529yxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 11:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=xtukqEZYccLp4y5nUcAJpKBL+IqfnP9qI9vp1toTrwU=;
	b=NUU9/pChsYEf1iNNe3nGGUZEgwwvml8x0JJ6NxWSq+nkJL1Momp/GTLoDWDYz+fVrb
	AdK84cmozZKo4Yl5PVxznxceIEz9G7Ci1KA/kArJd0GcPxKM7joS4+n+tlcRkxyp7WaJ
	T2T3pu9fSfJXXWZJxavNZdHKV5sMRMR5xAPxU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=tZyYK7QJrpGNGHDuEoNq+31DwAMndd7AePtvAWJRA/hNtGBZR+vcxe/r8Bo97SJljs
	P178IDOFlbpKwBtcOts6ghO2R7o85wsRPgPTN3NN6oAXd5EYS/IIur+hBwNI1Mia8sbi
	0mN0JkVW3MOD5l2G1CTyrkuY5vaa4haP5QVqA=
Received: by 10.150.202.1 with SMTP id z1mr396015ybf.407.1284142359306;
	Fri, 10 Sep 2010 11:12:39 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id q21sm2915100ybk.11.2010.09.10.11.12.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 10 Sep 2010 11:12:38 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Sep 2010 13:02:20 -0500
Message-Id: <1284141740-24059-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCHv2] jpeg_8b: Allow using older versions of automake
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
X-List-Received-Date: Fri, 10 Sep 2010 18:13:29 -0000

From: Chase <chase@chase-laptop.(none)>

* Added patch to allow using older versions of automake such
  as 1.10.3 when building jpeg version 8b.
* Only use the AM_SILENT_RULES if it is available.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 ...igure-make-jpeg-work-with-older-autotools.patch |   30 ++++++++++++++++++++
 recipes/jpeg/jpeg_8b.bb                            |    7 +++-
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-older-autotools.patch

diff --git a/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-older-autotools.patch b/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-older-autotools.patch
new file mode 100644
index 0000000..dd6fd52
--- /dev/null
+++ b/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-older-autotools.patch
@@ -0,0 +1,30 @@
+From e9e77ee999553f9b94de0288688a0bdc60b92e0f Mon Sep 17 00:00:00 2001
+From: Chase Maupin <chase.maupin@ti.com>
+Date: Tue, 17 Aug 2010 08:30:56 -0500
+Subject: [PATCH] configure: make jpeg work with older autotools
+
+* Only use the AM_SILENT_RULES variable if it is defined.  Older
+  versions of automake don't support this option.
+
+Signed-off-by: Chase Maupin <chase.maupin@ti.com>
+---
+ configure.ac |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 96da13b..9a58c51 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -26,7 +26,8 @@ AM_INIT_AUTOMAKE([-Wall -Werror ansi2knr no-dist foreign])
+ # Make --enable-silent-rules the default.
+ # To get verbose build output you may configure
+ # with --disable-silent-rules or use "make V=1".
+-AM_SILENT_RULES([yes])
++# only use if available
++m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
+ # This is required when using the de-ANSI-fication feature.
+ AM_C_PROTOTYPES
+-- 
+1.7.0.4
+
diff --git a/recipes/jpeg/jpeg_8b.bb b/recipes/jpeg/jpeg_8b.bb
index 4251ca6..688dcd8 100644
--- a/recipes/jpeg/jpeg_8b.bb
+++ b/recipes/jpeg/jpeg_8b.bb
@@ -2,12 +2,15 @@ DESCRIPTION = "libjpeg is a library for handling the JPEG (JFIF) image format."
 LICENSE = "jpeg"
 SECTION = "libs"
 PRIORITY = "required"
-PR = "r0"
+PR = "r1"
 
 # TODO: really needed?
 RPROVIDES_${PN} = "jpeg"
 
-SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz"
+SRC_URI = "\
+    http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
+    file://0001-configure-make-jpeg-work-with-older-autotools.patch \
+    "
 S = "${WORKDIR}/jpeg-${PV}"
 
 inherit autotools
-- 
1.7.0.4



