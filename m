Received: from [128.131.95.14] (helo=belief.htu.tuwien.ac.at)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <jin@mediatomb.cc>) id 1JSch1-00050y-GA
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Feb 2008 19:32:22 +0100
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id 58B9A83902; Fri, 22 Feb 2008 19:32:06 +0100 (CET)
Date: Fri, 22 Feb 2008 19:32:06 +0100
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080222183206.GA14832@deadlock.dhs.org>
References: <20080214155508.GA4163@deadlock.dhs.org>
	<47B4708B.6050008@student.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <47B4708B.6050008@student.utwente.nl>
User-Agent: Mutt/1.5.15 (2007-04-06)
X-SA-Exim-Connect-IP: 128.131.95.14
X-SA-Exim-Mail-From: jin@mediatomb.cc
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: building uClinux using OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Feb 2008 18:32:22 -0000
X-Groupsio-MsgNum: 4286
Content-Type: multipart/mixed; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Koen,
   
On Thu, Feb 14, 2008 at 05:47:07PM +0100, Koen Kooi wrote:
> That should happen automagically, we just need to stage some more
> binutils-cross headers for elf2flt to build

OK... I am not sure if I got the idea, so please correct me if I am wrong:
elf2flt needs to be told what target arch it will be used for, but it
should be compiled using native libiberty.a and libbfd.a?

At least running ./elf2flt without any options prints me
"Compiled for arm architecture" at the end of the usage summary.

I am not yet sure if it produces any meaningful output or how I could test it
to be sure (it asks for some relocation info files), so any hints would be
greatly appreciated.

And also... how would this "automagically" part work, what do I do next?

> I had a go at this a while ago, but I had to halt working on it since
> the uboot on the blackfin site refuses to load the uImage on the
> blackfin site, leaving me without a good testing target.
> I think forcing static linking would be the fastest way to get an image
> built, we can work on details (flat, shared-flat, fdpic, etc) after that.

I found your elf2flt_svn.bb recipe and used it as a starting point.

I had to apply the patch from here in order to compile binutils with uclibc:
http://bugs.openembedded.org/show_bug.cgi?id=3178

I attached my diffs.

Kind regards,
Jin

> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFHtHCLMkyGM64RGpERAl7KAJ4sD85YqG+OrTVUx+eLuCb9js4TvQCffI35
> 7wUmhJZu6YpoBfu6e4kbEg0=
> =Ez6i
> -----END PGP SIGNATURE-----
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="elf2flt_svn.patch"

--- ../../../../org.openembedded.dev/packages/uclibc/elf2flt_svn.bb	2008-02-20 16:11:45.000000000 +0100
+++ elf2flt_svn.bb	2008-02-22 18:51:13.000000000 +0100
@@ -9,7 +9,8 @@
 
 S = "${WORKDIR}/${PN}"
 
-EXTRA_OECONF = " --with-libbfd=${STAGING_DIR}/${TARGET_SYS}/lib/libbfd.a \
-                 --with-libiberty=${STAGING_DIR}/${TARGET_SYS}/lib/libiberty.a \
+EXTRA_OECONF = " --with-libbfd=${STAGING_LIBDIR_NATIVE}/libbfd.a \
+                 --with-libiberty=${STAGING_LIBDIR_NATIVE}/libiberty.a \
                  --with-bfd-include-dir=${STAGING_DIR}/${TARGET_SYS}/include \
                "
+

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="binutils_stage_and_libm.patch"

diff -Naur ../../../../org.openembedded.dev/packages/binutils/binutils-2.18/binutils-uclibc-configure-add-libm.patch ./binutils-2.18/binutils-uclibc-configure-add-libm.patch
--- ../../../../org.openembedded.dev/packages/binutils/binutils-2.18/binutils-uclibc-configure-add-libm.patch	1970-01-01 01:00:00.000000000 +0100
+++ ./binutils-2.18/binutils-uclibc-configure-add-libm.patch	2008-02-22 15:07:54.000000000 +0100
@@ -0,0 +1,12 @@
+*** binutils-2.18/gas/configure.orig	2007-11-08 10:44:45.000000000 +0100
+--- binutils-2.18/gas/configure	2007-11-08 10:43:50.000000000 +0100
+*************** _ACEOF
+*** 12855,12860 ****
+--- 12855,12861 ----
+  fi
+  done
+  
++ need_libm=yes
+  # do we need the math library?
+  case "${need_libm}" in
+  yes)
--- ../../../../org.openembedded.dev/packages/binutils/binutils.inc	2008-02-20 16:11:36.000000000 +0100
+++ ./binutils.inc	2008-02-22 19:07:04.000000000 +0100
@@ -84,9 +84,14 @@
 	install -m 0644 ${S}/include/dis-asm.h ${STAGING_INCDIR}/
 	install -m 0644 ${S}/include/symcat.h ${STAGING_INCDIR}/
 	install -m 0644 ${S}/include/libiberty.h ${STAGING_INCDIR}/
+	install -m 0644 ${S}/include/filenames.h ${STAGING_INCDIR}/
 	install -m 0644 ${S}/include/ansidecl.h ${STAGING_INCDIR}/
 	install -m 0644 ${S}/include/bfdlink.h ${STAGING_INCDIR}/
 	install -m 0644 bfd/bfd.h ${STAGING_INCDIR}/
+    
+    mkdir -p ${STAGING_INCDIR}/elf
+	install -m 0644 ${S}/include/elf/arm.h ${STAGING_INCDIR}/elf
+	install -m 0644 ${S}/include/elf/reloc-macros.h ${STAGING_INCDIR}/elf
 }
 
 do_install () {
--- ../../../../org.openembedded.dev/packages/binutils/binutils-cross.inc	2008-02-20 16:11:36.000000000 +0100
+++ ./binutils-cross.inc	2008-02-22 18:20:14.000000000 +0100
@@ -10,6 +10,9 @@
 
 do_stage () {
 	oe_runmake install
+   
+    oe_libinstall -a -C ${B}/libiberty libiberty ${STAGING_LIBDIR_NATIVE}/
+    oe_libinstall -a -C ${B}/bfd libbfd ${STAGING_LIBDIR_NATIVE}/
 
 	# We don't really need these, so we'll remove them...
 	rm -rf ${CROSS_DIR}/lib/ldscripts
--- ../../../../org.openembedded.dev/packages/binutils/binutils_2.18.bb	2008-02-20 16:11:36.000000000 +0100
+++ ./binutils_2.18.bb	2008-02-22 15:11:38.000000000 +0100
@@ -11,6 +11,7 @@
      file://binutils-uclibc-300-001_ld_makefile_patch.patch;patch=1 \
      file://binutils-uclibc-300-006_better_file_error.patch;patch=1 \
      file://binutils-uclibc-300-012_check_ldrunpath_length.patch;patch=1 \
+     file://binutils-uclibc-configure-add-libm.patch;patch=1 \
      "
 
 # powerpc patches

--TB36FDmn/VVEgNH/--
