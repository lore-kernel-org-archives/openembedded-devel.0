Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RH1TN-0003Me-Hv
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 00:52:25 +0200
Received: by iafi7 with SMTP id i7so3838320iaf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2011 15:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=bfYKP54WIDItdiXwG5M2cXSOHETNc7JRVwoX4Eh1cX4=;
	b=fqzt0H18G+BF9H37zkoilImRhwDIPn2PfzVr9/jXosp5VS3Y66H9kKjlgwOPCXk5ni
	Cqora8djLjTg6V+n0H0Lh40dX1oSQ/slrdauQKGHRfWU+/9F4PC6chj0fn4FxmWJrmim
	91lZUSmgZ99o6qoKzLH+jf9/iiTm7ETJESFyw=
Received: by 10.42.197.197 with SMTP id el5mr20959251icb.23.1319150790826;
	Thu, 20 Oct 2011 15:46:30 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id eh34sm27282534ibb.5.2011.10.20.15.46.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 15:46:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Oct 2011 15:46:24 -0700
Message-Id: <1319150784-25557-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] fuse: Fix linking issues with gold linker
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
X-List-Received-Date: Thu, 20 Oct 2011 22:52:25 -0000

fuse has problems when linking with gold since it uses version
scripts in a way thats so perticular to bfd ld

/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.6.2/ld:
error: symbol __fuse_exited has undefined version
| collect2: ld returned 1 exit status
| make[1]: *** [libfuse.la] Error 1
| make[1]: *** Waiting for unfinished jobs....

For more details

http://blog.flameeyes.eu/2011/06/01/gold-readiness-obstacle-2-base-versioning
http://sources.redhat.com/bugzilla/show_bug.cgi?id=10861
http://comments.gmane.org/gmane.comp.file-systems.fuse.devel/9524
http://www.airs.com/blog/archives/300

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fuse/fuse-2.8.6/gold-unversioned-symbol.patch  |   60 ++++++++++++++++++++
 meta-oe/recipes-support/fuse/fuse_2.8.6.bb         |    3 +-
 2 files changed, 62 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-support/fuse/fuse-2.8.6/gold-unversioned-symbol.patch

diff --git a/meta-oe/recipes-support/fuse/fuse-2.8.6/gold-unversioned-symbol.patch b/meta-oe/recipes-support/fuse/fuse-2.8.6/gold-unversioned-symbol.patch
new file mode 100644
index 0000000..8ee97df
--- /dev/null
+++ b/meta-oe/recipes-support/fuse/fuse-2.8.6/gold-unversioned-symbol.patch
@@ -0,0 +1,60 @@
+Index: fuse-2.8.6/lib/fuse.c
+===================================================================
+--- fuse-2.8.6.orig/lib/fuse.c	2011-09-13 00:23:14.000000000 -0700
++++ fuse-2.8.6/lib/fuse.c	2011-10-19 09:20:27.537099939 -0700
+@@ -3947,11 +3947,11 @@
+ 				      11);
+ }
+ 
+-FUSE_SYMVER(".symver fuse_exited,__fuse_exited@");
+-FUSE_SYMVER(".symver fuse_process_cmd,__fuse_process_cmd@");
+-FUSE_SYMVER(".symver fuse_read_cmd,__fuse_read_cmd@");
+-FUSE_SYMVER(".symver fuse_set_getcontext_func,__fuse_set_getcontext_func@");
+-FUSE_SYMVER(".symver fuse_new_compat2,fuse_new@");
++FUSE_SYMVER(".symver fuse_exited,__fuse_exited@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_process_cmd,__fuse_process_cmd@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_read_cmd,__fuse_read_cmd@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_set_getcontext_func,__fuse_set_getcontext_func@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_new_compat2,fuse_new@FUSE_UNVERSIONED");
+ FUSE_SYMVER(".symver fuse_new_compat22,fuse_new@FUSE_2.2");
+ 
+ #endif /* __FreeBSD__ */
+Index: fuse-2.8.6/lib/fuse_mt.c
+===================================================================
+--- fuse-2.8.6.orig/lib/fuse_mt.c	2011-09-13 00:23:14.000000000 -0700
++++ fuse-2.8.6/lib/fuse_mt.c	2011-10-19 09:20:27.537099939 -0700
+@@ -113,4 +113,4 @@
+ 	return fuse_session_loop_mt(fuse_get_session(f));
+ }
+ 
+-FUSE_SYMVER(".symver fuse_loop_mt_proc,__fuse_loop_mt@");
++FUSE_SYMVER(".symver fuse_loop_mt_proc,__fuse_loop_mt@FUSE_UNVERSIONED");
+Index: fuse-2.8.6/lib/fuse_versionscript
+===================================================================
+--- fuse-2.8.6.orig/lib/fuse_versionscript	2011-09-13 00:23:14.000000000 -0700
++++ fuse-2.8.6/lib/fuse_versionscript	2011-10-19 09:20:27.541099939 -0700
+@@ -1,3 +1,6 @@
++FUSE_UNVERSIONED {
++};
++
+ FUSE_2.2 {
+ 	global:
+ 		fuse_destroy;
+Index: fuse-2.8.6/lib/helper.c
+===================================================================
+--- fuse-2.8.6.orig/lib/helper.c	2011-09-13 00:23:14.000000000 -0700
++++ fuse-2.8.6/lib/helper.c	2011-10-19 09:20:27.541099939 -0700
+@@ -409,10 +409,10 @@
+ 	return fuse_mount_compat22(mountpoint, NULL);
+ }
+ 
+-FUSE_SYMVER(".symver fuse_setup_compat2,__fuse_setup@");
++FUSE_SYMVER(".symver fuse_setup_compat2,__fuse_setup@FUSE_UNVERSIONED");
+ FUSE_SYMVER(".symver fuse_setup_compat22,fuse_setup@FUSE_2.2");
+-FUSE_SYMVER(".symver fuse_teardown,__fuse_teardown@");
+-FUSE_SYMVER(".symver fuse_main_compat2,fuse_main@");
++FUSE_SYMVER(".symver fuse_teardown,__fuse_teardown@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_main_compat2,fuse_main@FUSE_UNVERSIONED");
+ FUSE_SYMVER(".symver fuse_main_real_compat22,fuse_main_real@FUSE_2.2");
+ 
+ #endif /* __FreeBSD__ */
diff --git a/meta-oe/recipes-support/fuse/fuse_2.8.6.bb b/meta-oe/recipes-support/fuse/fuse_2.8.6.bb
index ec81a98..15e9206 100644
--- a/meta-oe/recipes-support/fuse/fuse_2.8.6.bb
+++ b/meta-oe/recipes-support/fuse/fuse_2.8.6.bb
@@ -5,10 +5,11 @@ LICENSE = "GPLv2&LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
            file://define_GNU_SOURCE.patch \
+           file://gold-unversioned-symbol.patch \
           "
 
 SRC_URI[md5sum] = "eaa32c8cef56a981656a786f258a002a"
-- 
1.7.5.4



