Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LcUtz-00071i-H2
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 02:19:07 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LcUqn-0003Xx-Gi
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 01:15:46 +0000
Received: from p54839b11.dip0.t-ipconnect.de ([84.131.155.17])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 26 Feb 2009 01:15:45 +0000
Received: from vjensen by p54839b11.dip0.t-ipconnect.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Feb 2009 01:15:45 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Vitus Jensen <vjensen@gmx.de>
Date: Thu, 26 Feb 2009 01:15:32 +0000 (UTC)
Message-ID: <go4qfk$oe2$1@ger.gmane.org>
References: <200901120019.45621.mickey@vanille-media.de>
	<200901141547.26513.mickey@vanille-media.de>
	<gme8cj$ejn$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p54839b11.dip0.t-ipconnect.de
User-Agent: Pan/0.133 (House of Butterflies)
Sender: news <news@ger.gmane.org>
Subject: Re: python roadmap
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
X-List-Received-Date: Thu, 26 Feb 2009 01:19:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am Thu, 05 Feb 2009 08:35:31 +0000 schrieb Vitus Jensen:

> Am Wed, 14 Jan 2009 15:47:26 +0100 schrieb Michael 'Mickey' Lauer:
> 
>> Thanks to some extrashifts this work has proceeded faster than
>> scheduled. I plan to merge mickey/python26 into master on friday. If
>> you see something dangerous, yell.
> 
> Yell ;-)
> 
> See http://bugs.openembedded.net/show_bug.cgi?id=5013
> 
> python26 fails to build for the big-endian machines I tried, namely
> nslu2be.  And as python25 was removed it is a real blocker for packages
> which DEPEND on pathon, which inturn is the case for php.  And php I'm
> trying to get a version working again.
> 
> do_compile tries to load a .so on the host which was build for armeb and
> complains about wrong byteorder.  But there is no complain when
> MACHINE=nslu2le in which case the .so shouldn't be loadable, too (it's
> for arm after all, not x86).  AND python25 used exactly the same
> do_compile method, and does not fail!

Yes yes, I know: python builds fine on all hosts ;-)

But here is a patch set which forces do_compile() to load shared
objects from STAGING_LIBDIR_NATIVE instead of work/python-2.6.1/
(which contains target code).  Additionally I removed Makefile
patching which created senseless paths
(like /oestuff/.../arm/python/oestuff/...arm/python).  Tested
on ixp4xxbe, nslu2be and nslu2le.


diff --git a/packages/python/python-2.6.1/07-ld_library_path.patch b/packages/python/python-2.6.1/07-ld_library_path.patch
new file mode 100644
index 0000000..bdc47d7
--- /dev/null
+++ b/packages/python/python-2.6.1/07-ld_library_path.patch
@@ -0,0 +1,16 @@
+# RUNSHARED uses cwd as LD_LIBRARY_PATH which contains target executable
+# code.  LDLIBRARYDIR can be passed from the receipe to point to native
+# (host executable) code.
+
+diff -Naur Python-2.6.1.orig/configure.in Python-2.6.1/configure.in
+--- Python-2.6.1.orig/configure.in	2009-02-26 00:24:41.000000000 +0100
++++ Python-2.6.1/configure.in	2009-02-26 00:34:32.000000000 +0100
+@@ -707,7 +707,7 @@
+     Linux*|GNU*|NetBSD*|FreeBSD*|DragonFly*)
+ 	  LDLIBRARY='libpython$(VERSION).so'
+ 	  BLDLIBRARY='-L. -lpython$(VERSION)'
+-	  RUNSHARED=LD_LIBRARY_PATH=`pwd`:${LD_LIBRARY_PATH}
++	  RUNSHARED=LD_LIBRARY_PATH='${LDLIBRARYDIR}':${LD_LIBRARY_PATH}
+ 	  case $ac_sys_system in
+ 	      FreeBSD*)
+ 		SOVERSION=`echo $SOVERSION|cut -d "." -f 1`
diff --git a/packages/python/python_2.6.1.bb b/packages/python/python_2.6.1.bb
index 57c64df..4ec9eae 100644
--- a/packages/python/python_2.6.1.bb
+++ b/packages/python/python_2.6.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "\
   file://04-default-is-optimized.patch;patch=1 \
   file://05-enable-ctypes-cross-build.patch;patch=1 \
   file://06-libffi-enable-default-mips.patch;patch=1 \
+  file://07-ld_library_path.patch;patch=1 \
   file://99-ignore-optimization-flag.patch;patch=1 \
   \
 # not yet pushed forward
@@ -41,17 +42,13 @@ do_compile_prepend() {
 	install -d ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
 	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
 	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
-	install -m 0644 Makefile Makefile.orig
-	install -m 0644 Makefile Makefile.backup
-	sed -e 's,${includedir},${STAGING_INCDIR},' < Makefile.backup > Makefile
-	install -m 0644 Makefile Makefile.backup
-	sed -e 's,${libdir},${STAGING_LIBDIR},' < Makefile.backup > Makefile
 	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
 }
 
 do_compile() {
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		LDLIBRARYDIR=${STAGING_LIBDIR_NATIVE} \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
@@ -61,6 +58,7 @@ do_compile() {
 
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		LDLIBRARYDIR=${STAGING_LIBDIR_NATIVE} \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
@@ -73,10 +71,9 @@ do_stage() {
 }
 
 do_install() {
-	install -m 0644 Makefile.orig Makefile
-	
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		LDLIBRARYDIR=${STAGING_LIBDIR_NATIVE} \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \


-- 
Vitus Jensen, Hannover, Germany, Earth, Milky Way, Universe (current)



