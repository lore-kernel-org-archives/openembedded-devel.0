Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LeZ7l-0004fE-5v
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 19:13:49 +0100
Received: by nf-out-0910.google.com with SMTP id k4so614858nfd.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 10:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=WXB3x4weNFrryDHJ/PS6BaIlHkk2rXRlMIna9KawIzg=;
	b=qxQaPNrCfJIx6SDAj1N0XQJ3cKb6ah885VXtLec+hNJXSu/tb1jFdoglJI+GEjTyNt
	GGLRcT+Ykwb++IuqMP3regvU39V7muN2TqGD1Uw6ueFQXh2iJ8MuYLOBGdP5buHh2Ozq
	kCVgHX8qKW6DU6Ln6aFETBlE+FnoyXDpBe4Do=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=cXsjb77xyZ89DW8yYSzq3BHC7bcFTiqs66cNHWMD2fhKR5sVMkVbUJqb8Y8aJpRUf7
	gkoIojH4wl0256kwZRKdqHvmv4IEkdimkQHejNOEJhEfqpVaNXcacGr318PEnNCFXo2v
	OjLHO1bn3EbxUd7Fxeni+YpS0CkUxWm3s6aI0=
Received: by 10.216.74.71 with SMTP id w49mr358077wed.135.1236103784780;
	Tue, 03 Mar 2009 10:09:44 -0800 (PST)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id f4sm1789672nfh.6.2009.03.03.10.09.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Mar 2009 10:09:44 -0800 (PST)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Mar 2009 20:09:27 +0200
Message-Id: <1236103767-18596-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.2.rc2.22.g1d035
Subject: [PATCH] [nfs-utils]: fixed cross-compilation for tools
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
X-List-Received-Date: Tue, 03 Mar 2009 18:13:49 -0000

Fixed a mess with CFLAGS, CC_FOR_BUILD and other stuff: this patch
forces compilation of tools/ stuff with compiler defined by ./configure

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 packages/nfs-utils/files/cross-compile.patch |   56 ++++++++++++++++++++++++++
 packages/nfs-utils/nfs-utils_1.1.2.bb        |    3 +-
 2 files changed, 58 insertions(+), 1 deletions(-)
 create mode 100644 packages/nfs-utils/files/cross-compile.patch

diff --git a/packages/nfs-utils/files/cross-compile.patch b/packages/nfs-utils/files/cross-compile.patch
new file mode 100644
index 0000000..e297b29
--- /dev/null
+++ b/packages/nfs-utils/files/cross-compile.patch
@@ -0,0 +1,56 @@
+diff -urN nfs-utils-1.1.2.orig/tools/locktest/Makefile.am nfs-utils-1.1.2/tools/locktest/Makefile.am
+--- nfs-utils-1.1.2.orig/tools/locktest/Makefile.am	2009-03-03 17:33:48.000000000 +0200
++++ nfs-utils-1.1.2/tools/locktest/Makefile.am	2009-03-03 18:12:59.000000000 +0200
+@@ -1,12 +1,8 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+-CC=$(CC_FOR_BUILD)
+ LIBTOOL = @LIBTOOL@ --tag=CC
+ 
+ noinst_PROGRAMS = testlk
+ testlk_SOURCES = testlk.c
+-testlk_CFLAGS=$(CFLAGS_FOR_BUILD)
+-testlk_CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
+-testlk_LDFLAGS=$(LDFLAGS_FOR_BUILD)
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+diff -urN nfs-utils-1.1.2.orig/tools/rpcdebug/Makefile.am nfs-utils-1.1.2/tools/rpcdebug/Makefile.am
+--- nfs-utils-1.1.2.orig/tools/rpcdebug/Makefile.am	2009-03-03 17:33:48.000000000 +0200
++++ nfs-utils-1.1.2/tools/rpcdebug/Makefile.am	2009-03-03 18:30:27.000000000 +0200
+@@ -1,6 +1,5 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+-CC=$(CC_FOR_BUILD)
+ LIBTOOL = @LIBTOOL@ --tag=CC
+ 
+ man8_MANS = rpcdebug.man
+@@ -8,8 +7,5 @@
+ 
+ sbin_PROGRAMS = rpcdebug
+ rpcdebug_SOURCES = rpcdebug.c
+-rpcdebug_CFLAGS=$(CFLAGS_FOR_BUILD)
+-rpcdebug_CPPFLAGS=$(CPPFLAGS_FOR_BUILD) -I$(top_srcdir)/support/include
+-rpcdebug_LDFLAGS=$(LDFLAGS_FOR_BUILD)
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+diff -urN nfs-utils-1.1.2.orig/tools/rpcgen/Makefile.am nfs-utils-1.1.2/tools/rpcgen/Makefile.am
+--- nfs-utils-1.1.2.orig/tools/rpcgen/Makefile.am	2009-03-03 17:33:48.000000000 +0200
++++ nfs-utils-1.1.2/tools/rpcgen/Makefile.am	2009-03-03 18:13:10.000000000 +0200
+@@ -1,6 +1,5 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+-CC=$(CC_FOR_BUILD)
+ LIBTOOL = @LIBTOOL@ --tag=CC
+ 
+ noinst_PROGRAMS = rpcgen
+@@ -9,10 +8,6 @@
+ 		 rpc_util.c rpc_sample.c rpc_output.h rpc_parse.h \
+ 		 rpc_scan.h rpc_util.h
+ 
+-rpcgen_CFLAGS=$(CFLAGS_FOR_BUILD)
+-rpcgen_CPPLAGS=$(CPPFLAGS_FOR_BUILD)
+-rpcgen_LDFLAGS=$(LDFLAGS_FOR_BUILD)
+-
+ MAINTAINERCLEANFILES = Makefile.in
+ 
+ EXTRA_DIST = rpcgen.new.1
diff --git a/packages/nfs-utils/nfs-utils_1.1.2.bb b/packages/nfs-utils/nfs-utils_1.1.2.bb
index 353eb57..7bff4f6 100644
--- a/packages/nfs-utils/nfs-utils_1.1.2.bb
+++ b/packages/nfs-utils/nfs-utils_1.1.2.bb
@@ -3,11 +3,12 @@ PRIORITY = "optional"
 SECTION = "console/network"
 LICENSE = "GPL"
 
-PR = "3"
+PR = "4"
 
 DEPENDS = "e2fsprogs-libs tcp-wrappers libevent"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.gz \
+	file://cross-compile.patch;patch=1 \
 	file://nfsserver \
    "
 
-- 
1.6.2.rc2.22.g1d035



