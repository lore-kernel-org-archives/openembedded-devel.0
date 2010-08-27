Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Op1L7-0007dI-6g
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 17:59:41 +0200
Received: by gwb1 with SMTP id 1so1116251gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 08:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=C3a8WJ3jWdd/RwtYOApi+ufRK2LRuhBT2gSA0QWLDpM=;
	b=KJg/Da4uox8cd1+KsvPO0iuz4iHVnd8U/ojzSXWD2r3X3KSmkNYvC3/0lautOrA4CG
	i+fV/A+GKQ/JVy79PH2K108dTdTJF+vyByOQHRJ3nxbCVcm6p8sKYy3TgjUvaJRmRHEn
	XNYhcmitlTmNs1Rcrf2aniwIMC9f6D2bSssKY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=UzN7/VU+/vCcbCYoHtfCczY+dxXqSIO1UmzpkbD2o2shJUJHjJCQsiWQ87xHuPJ8SM
	klqvDLeKd8mVs3r3T0f7efx3uInxGsKHR0rFxxdwOzBl4xzylmH7B4weypE4XMV1CidJ
	sbcgB3tYwaHOjh6UJht8X+9CQ6+iMSfJV98Kc=
Received: by 10.101.84.18 with SMTP id m18mr1112292anl.60.1282924740454;
	Fri, 27 Aug 2010 08:59:00 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c19sm6497346ana.2.2010.08.27.08.58.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 27 Aug 2010 08:58:59 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Aug 2010 10:50:52 -0500
Message-Id: <1282924252-22046-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] jpeg_8b: Allow using older versions of automake
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
X-List-Received-Date: Fri, 27 Aug 2010 15:59:41 -0000

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
index 4251ca6..4e6f25b 100644
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
+    file://0001-configure-make-jpeg-work-with-older-autotools.patch;apply=yes \
+    "
 S = "${WORKDIR}/jpeg-${PV}"
 
 inherit autotools
-- 
1.7.0.4



