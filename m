Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P1dTU-0004iD-OV
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 13:08:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 8BAAC3148EF3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Oct 2010 13:08:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id RiHlviPOTH7r; Fri,  1 Oct 2010 13:08:04 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 0AD383148238;
	Fri,  1 Oct 2010 13:08:03 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 01 Oct 2010 11:08:02 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Oct 2010 11:07:58 +0000
Message-Id: <1285931278-15999-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-5-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-5-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] libsigc++-1.2: fix installation
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
X-List-Received-Date: Fri, 01 Oct 2010 11:08:26 -0000

* install complains about method_slot.h, which is mentioned twice
  inside Makefile.am.
* v2: Added header to patch.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libsigc++-1.2/files/fix-install.patch |   15 +++++++++++++++
 recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb  |    3 ++-
 recipes/libsigc++-1.2/libsigc++-1.2_1.2.7.bb  |    3 ++-
 3 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 recipes/libsigc++-1.2/files/fix-install.patch

diff --git a/recipes/libsigc++-1.2/files/fix-install.patch b/recipes/libsigc++-1.2/files/fix-install.patch
new file mode 100644
index 0000000..1cdfedb
--- /dev/null
+++ b/recipes/libsigc++-1.2/files/fix-install.patch
@@ -0,0 +1,15 @@
+upstream: unmaintained
+
+| ...build/tmp/sysroots/i686-linux/usr/bin/install: will not overwrite just-created `...build/tmp/work/mipsel-oe-linux/libsigc++-1.2-1.2.5-r2/image/usr/include/sigc++-1.2/sigc++/method_slot.h' with `method_slot.h'
+
+--- libsigc++-1.2.7/sigc++/Makefile.am.orig	2010-09-24 12:03:24.000000000 +0000
++++ libsigc++-1.2.7/sigc++/Makefile.am	2010-09-24 12:03:30.000000000 +0000
+@@ -12,7 +12,7 @@
+ sigc_built_h	= bind_return.h	\
+ 		  object_slot.h retype_return.h slot.h bind.h		\
+ 		  class_slot.h hide.h retype.h signal.h       \
+-                  method_slot.h method_slot.h
++                  method_slot.h
+ 
+ built_sources	= $(sigc_built_cc) $(sigc_built_h)
+ dist_sources	= $(sigc_fixed_cc) $(sigc_fixed_h)
diff --git a/recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb b/recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb
index 2c32f14..6b347e5 100644
--- a/recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb
+++ b/recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb
@@ -1,10 +1,11 @@
 DESCRIPTION = "A library for loose coupling of C++ method calls"
 SECTION = "libs"
 PRIORITY = "optional"
-PR = "r1"
+PR = "r2"
 LICENSE = "GPL LGPL"
 SRC_URI = "${SOURCEFORGE_MIRROR}/libsigc/libsigc++-${PV}.tar.gz \
 	   file://autofoo.patch \
+	   file://fix-install.patch \
 	   file://pkgconfig.patch"
 S = "${WORKDIR}/libsigc++-${PV}"
 
diff --git a/recipes/libsigc++-1.2/libsigc++-1.2_1.2.7.bb b/recipes/libsigc++-1.2/libsigc++-1.2_1.2.7.bb
index c68105b..179d5a6 100644
--- a/recipes/libsigc++-1.2/libsigc++-1.2_1.2.7.bb
+++ b/recipes/libsigc++-1.2/libsigc++-1.2_1.2.7.bb
@@ -2,10 +2,11 @@ DESCRIPTION = "A library for loose coupling of C++ method calls"
 SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "GPL LGPL"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/1.2/libsigc++-${PV}.tar.bz2 \
 	   file://autofoo.patch \
+	   file://fix-install.patch \
            file://disable-tests.patch"
 S = "${WORKDIR}/libsigc++-${PV}"
 
-- 
1.7.1



