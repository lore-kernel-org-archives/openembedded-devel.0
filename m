Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P13V1-0001jl-Mf
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:43:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 85F723148E43
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 22:37:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id S9hmoEDZsne3; Wed, 29 Sep 2010 22:37:13 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id B05053148E2B;
	Wed, 29 Sep 2010 22:37:07 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 29 Sep 2010 20:37:07 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 20:36:27 +0000
Message-Id: <1285792594-10032-12-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 11/18] tremor-20041119: Add pkgconfig file, provide libvorbisidec
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
X-List-Received-Date: Wed, 29 Sep 2010 20:43:47 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/tremor/tremor/pkgconfig.patch |   22 ++++++++++++++++++++++
 recipes/tremor/tremor_20041119.bb     |    9 ++++++---
 2 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 recipes/tremor/tremor/pkgconfig.patch

diff --git a/recipes/tremor/tremor/pkgconfig.patch b/recipes/tremor/tremor/pkgconfig.patch
new file mode 100644
index 0000000..f864cb8
--- /dev/null
+++ b/recipes/tremor/tremor/pkgconfig.patch
@@ -0,0 +1,22 @@
+--- Tremor/configure.in	2006-09-03 01:19:30.000000000 +0200
++++ Tremor-fixed/configure.in	2006-09-03 12:13:33.339593728 +0200
+@@ -106,4 +106,4 @@
+ AC_SUBST(DEBUG)
+ AC_SUBST(PROFILE)
+ 
+-AC_OUTPUT(Makefile)
++AC_OUTPUT([Makefile vorbisidec.pc])
+--- Tremor/vorbisidec.pc.in	1970-01-01 01:00:00.000000000 +0100
++++ Tremor-fixed/vorbisidec.pc.in	2006-09-03 12:16:38.313473424 +0200
+@@ -0,0 +1,11 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++Name: vorbisidec
++Description: Vorbis audio decoder
++Requires:
++Version: 20041119
++Libs: -L${libdir} -lvorbisidec
++Cflags: -I${includedir}
diff --git a/recipes/tremor/tremor_20041119.bb b/recipes/tremor/tremor_20041119.bb
index 889b981..42155ab 100644
--- a/recipes/tremor/tremor_20041119.bb
+++ b/recipes/tremor/tremor_20041119.bb
@@ -4,16 +4,19 @@ DEPENDS = "libogg"
 DESCRIPTION = "tremor is a fixed point implementation of the vorbis codec."
 LICENSE = "BSD"
 SRCDATE = "${PV}"
-PR = "r1"
+PR = "r2"
 
 # tremor makes heavy use of non-thumb-compatible inline asm.
 ARM_INSTRUCTION_SET = "arm"
 
-SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=4573;proto=http"
+PROVIDES += "libvorbisidec"
+
+SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=4573;proto=http \
+	file://pkgconfig.patch"
 
 S = "${WORKDIR}/Tremor"
 
-inherit autotools
+inherit autotools pkgconfig
 
 EXTRA_OECONF=" --enable-shared --disable-rpath  "
 
-- 
1.7.1



