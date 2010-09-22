Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OyIaN-0000Nj-6Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 08:13:45 +0200
Received: by pxi11 with SMTP id 11so45664pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 23:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=SrRTb6iWtsoPZOZW0EgZA29Hw4J1dzLPagYSmDxDY14=;
	b=r6JrGAZMeGxJ7zhWYURrqF1aANfLSOQ12s0tT1lfWB9S+B9kQS0mMcChKjhj8ht6aZ
	G0do10rPYVk/oQfQguJM7aPBei40A10qs1O9F8rdEAgR9V70m3m0BHDQXqwpyyUhOjMp
	uPUF3vhqeqbvkco5FKCiheYp0tCMGCFFPlJys=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Wm4XJ8eAoiwXMlk3k6Uj0E1NS9wTlHBZK2r+ajji/9t5TiROHaAH/Ro+IEXjLfw0YV
	y/yNV2h9dEXUxDev/XtiBfMcjpWhzPAgSqsARMdHYATlruKiJOkIIbMl4wKHr7KyV+IE
	o2iunc6rjHnJgNZ8V1eVIG/MlNmOWuSdiBOGQ=
Received: by 10.114.130.5 with SMTP id c5mr13057072wad.125.1285136013263;
	Tue, 21 Sep 2010 23:13:33 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d39sm16939119wam.16.2010.09.21.23.13.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Sep 2010 23:13:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 23:13:29 -0700
Message-Id: <1285136009-15979-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] binutils_2.20.1.bb: Add patch to fix ld sysroot
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
X-List-Received-Date: Wed, 22 Sep 2010 06:13:45 -0000

Fixes the issue seen on builds where libc.so is not being found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils-2.19.1-ld-sysroot.patch               |   36 ++++++++++++++++++++
 recipes/binutils/binutils_2.20.1.bb                |    3 +-
 2 files changed, 38 insertions(+), 1 deletions(-)
 create mode 100644 recipes/binutils/binutils-2.20.1/binutils-2.19.1-ld-sysroot.patch

diff --git a/recipes/binutils/binutils-2.20.1/binutils-2.19.1-ld-sysroot.patch b/recipes/binutils/binutils-2.20.1/binutils-2.19.1-ld-sysroot.patch
new file mode 100644
index 0000000..b252196
--- /dev/null
+++ b/recipes/binutils/binutils-2.20.1/binutils-2.19.1-ld-sysroot.patch
@@ -0,0 +1,36 @@
+http://sourceware.org/bugzilla/show_bug.cgi?id=10340
+
+Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
+
+Always try to prepend the sysroot prefix to absolute filenames first.
+
+--- a/ld/ldfile.c	2009-06-14 12:46:19.000000000 +0200
++++ b/ld/ldfile.c.new	2009-06-14 12:46:04.000000000 +0200
+@@ -308,18 +308,24 @@
+      directory first.  */
+   if (! entry->is_archive)
+     {
+-      if (entry->sysrooted && IS_ABSOLUTE_PATH (entry->filename))
++      /* For absolute pathnames, try to always open the file in the
++	 sysroot first. If this fails, try to open the file at the
++	 given location. */
++      entry->sysrooted = is_sysrooted_pathname(entry->filename, FALSE);
++      if (IS_ABSOLUTE_PATH (entry->filename) && ld_sysroot && ! entry->sysrooted)
+ 	{
+ 	  char *name = concat (ld_sysroot, entry->filename,
+ 			       (const char *) NULL);
+ 	  if (ldfile_try_open_bfd (name, entry))
+ 	    {
+ 	      entry->filename = name;
++	      entry->sysrooted = TRUE;
+ 	      return TRUE;
+ 	    }
+ 	  free (name);
+ 	}
+-      else if (ldfile_try_open_bfd (entry->filename, entry))
++
++      if (ldfile_try_open_bfd (entry->filename, entry))
+ 	{
+ 	  entry->sysrooted = IS_ABSOLUTE_PATH (entry->filename)
+ 	    && is_sysrooted_pathname (entry->filename, TRUE);
+
diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binutils_2.20.1.bb
index d75dbb2..c2a5dab 100644
--- a/recipes/binutils/binutils_2.20.1.bb
+++ b/recipes/binutils/binutils_2.20.1.bb
@@ -1,7 +1,7 @@
 require binutils.inc
 LICENSE = "GPLv3"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 #COMPATIBLE_TARGET_SYS = "."
 
@@ -15,6 +15,7 @@ SRC_URI = "\
      file://binutils-uclibc-gas-needs-libm.patch \
      file://binutils-x86_64_i386_biarch.patch \
      file://libtool-update.patch \
+     file://binutils-2.19.1-ld-sysroot.patch \
      "
 
 SRC_URI_append_nios2 =" \
-- 
1.7.1



