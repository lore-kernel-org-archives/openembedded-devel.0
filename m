Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P13V3-0001kb-TT
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:43:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id C58D83148E28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 22:37:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id wOXtF0QUisma; Wed, 29 Sep 2010 22:37:00 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id A4ED23148E1C;
	Wed, 29 Sep 2010 22:36:59 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 29 Sep 2010 20:36:59 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 20:36:20 +0000
Message-Id: <1285792594-10032-5-git-send-email-obi@opendreambox.org>
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
Subject: [PATCH 04/18] libsigc++-1.2: fix installation
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

* install complains about method_slot.h, which is mentioned twice
  inside Makefile.am.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libsigc++-1.2/files/fix-install.patch |   11 +++++++++++
 recipes/libsigc++-1.2/libsigc++-1.2_1.2.5.bb  |    3 ++-
 recipes/libsigc++-1.2/libsigc++-1.2_1.2.7.bb  |    3 ++-
 3 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 recipes/libsigc++-1.2/files/fix-install.patch

diff --git a/recipes/libsigc++-1.2/files/fix-install.patch b/recipes/libsigc++-1.2/files/fix-install.patch
new file mode 100644
index 0000000..e795d3f
--- /dev/null
+++ b/recipes/libsigc++-1.2/files/fix-install.patch
@@ -0,0 +1,11 @@
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



