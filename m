Received: from mail-qy0-f178.google.com ([209.85.221.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nh1dc-0002lJ-Jg
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 15:09:27 +0100
Received: by qyk8 with SMTP id 8so68023qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 06:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=FzWhu8dM11e9U59PjEGE7jftMUjVqbc+rRfBv/37xyQ=;
	b=jBNFYKw02zNoYRZ3FO4r/wdeqS5IuIRUFwYRybUd0PNw4P+kuDKQJsBFKLaZ4BHTcd
	qJNag27Dcf7z4hQO41cwVW4alhuDcP/i5sg0k/Una+c+VWJBvVKnkiOC0EH14Dmprpj2
	ueUNc494BnsB6rOysd0SkyVa4hCeZweXUT1Fs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=tNI3g/Hbx35l9v8dfeFAz7Ov/t4CZWhd06VmqDZsjl94Wc4m9MaNa99mIU4kG5N/Mu
	2C64tRmOaXOuVogxuonbrbweN3LS+/bjUjBXR5Dy+CoQZIqel2bdalb3wfdewdgm1DUk
	TVf+R66EGvA97Q7zf/CCfte+ANgdgVJBJsLMs=
Received: by 10.224.35.3 with SMTP id n3mr2542639qad.169.1266242805782;
	Mon, 15 Feb 2010 06:06:45 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 22sm2367087ywh.45.2010.02.15.06.06.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 15 Feb 2010 06:06:43 -0800 (PST)
Date: Mon, 15 Feb 2010 15:06:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100215140636.GB3196@jama>
References: <hlb6ov$s5c$1@ger.gmane.org>
 <hlbjej$5i7$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hlbjej$5i7$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] set PYTHONPATH inside distutils-base.bbclass instead of distutils.bbclass
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
X-List-Received-Date: Mon, 15 Feb 2010 14:09:27 -0000
X-Groupsio-MsgNum: 16797
Content-Type: multipart/mixed; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 15, 2010 at 02:50:12PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> After some discussion with Richard I committed this:
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=fd4a161b6095f5b6f83d50d4d979000399944260
> 
> That seems to solve the sympoms I'm seeing, but the underlying problem
> is still present.

Thanks for working on this! 

I had similar problem with python-gst, where it failed while
do_configure in python-lib check
http://tinderbox.openembedded.net/packages/473005/
resolved in
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=f9f6c12d70b42ce6ec3461ea993ff52d10bfbc00
but clearly there is more python-related issues now.

I've seen similar issues all over tree when
switched from bitbake 1.8 to master. But haven't found the real issue,
so didn't pushed my small hacks (probably wrong - seems like I got it
built OK, because I pointed PYTHONPATH to wrong dir) used to compile whole 
image with bitbake master. (In attachement - but not for commit).

When I talked with Richard back then, he addmited that he has seen it
too and then it got resolved automagically and that it's scary.

BTW: I had those before my last python/cython bump, so it shouldn't be
related.

Regards,

> On 15-02-10 11:13, Koen Kooi wrote:
> > Hi,
> > 
> > I had a problem with building python-pygobject-native last week which
> > was due to this bit in m4/python.m4
> > 
> > if test -x "$PYTHON-config"; then
> > PYTHON_INCLUDES=`$PYTHON-config --includes 2>/dev/null`
> > else
> > PYTHON_INCLUDES="-I${py_prefix}/include/python${PYTHON_VERSION}"
> > if test "$py_prefix" != "$py_exec_prefix"; then
> >   PYTHON_INCLUDES="$PYTHON_INCLUDES
> > -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
> >> fi
> > fi
> > 
> > $PYTHON-config exists in staging and needs HOST_SYS, BUILDSYS,
> > STAGING_LIBDIR and STAGING_INCDIR exported to work.
> > 
> > But after instrumenting python.m4 a bit I get this when running
> > python-config:
> > 
> > Traceback (most recent call last):
> >   File "/OE/angstrom-dev/staging/x86_64-linux/usr/bin/python-config",
> > line 26, in <module>
> >     pyver = sysconfig.get_config_var('VERSION')
> >   File "/usr/lib/python2.5/distutils/sysconfig.py", line 541, in
> > get_config_var
> >     return get_config_vars().get(name)
> >   File "/usr/lib/python2.5/distutils/sysconfig.py", line 499, in
> > get_config_vars
> >     func()
> >   File "/usr/lib/python2.5/distutils/sysconfig.py", line 351, in _init_posix
> >     filename = get_makefile_filename()
> >   File "/usr/lib/python2.5/distutils/sysconfig.py", line 210, in
> > get_makefile_filename
> >     return os.path.join(lib_dir, "config" + (sys.pydebug and "_d" or
> > ""), "Makefile")AttributeError: 'module' object has no attribute 'pydebug'
> > 
> > Which means it's using the distutils on my buildhost instead of the
> > proper one in staging.
> > 
> > OE is doing this:
> > 
> > export
> > PYTHONPATH=/OE/bitbake:/OE/bitbake/lib:/OE/bitbake-git/bin:/usr/lib/python2.5:/usr/lib/python2.5/plat-linux2:/usr/lib/python2.5/lib-tk:/usr/lib/python2.5/lib-dynload:/usr/local/lib/python2.5/site-packages:/usr/lib/python2.5/site-packages:/usr/lib/python2.5/site-packages/Numeric:/usr/lib/python2.5/site-packages/PIL:/usr/lib/pymodules/python2.5:/usr/lib/pymodules/python2.5/gtk-2.0
> > 
> > So I added this to the recipe:
> > 
> > do_configure_prepend() {
> >        unset PYTHONPATH
> > }
> > 
> > And everything started working again.
> > 
> > So my question is:
> > 
> > Can we set PYTHONPATH inside distutils-base.bbclass instead of
> > distutils.bbclass or just plain unset it?
> > 
> > regards,
> > 
> > Koen
> > 
> > 
> > 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFLeVEUMkyGM64RGpERAkhlAJ9OiETWdhQeDNIjCmlxDiF2nwW4UQCfWLL6
> 02mZF8nFVpFFDJe7xvxHyHY=
> =rfuo
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0006-distutils-python-cython-native-set-PYTHONPATH-before.patch"

From 885c0da2dec4b56b4b02e8535e37271b4bcc42d6 Mon Sep 17 00:00:00 2001
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Jan 2010 13:04:37 +0100
Subject: [PATCH 06/16] distutils, python-cython-native: set PYTHONPATH before running python

---
 classes/distutils.bbclass                     |    4 +++-
 classes/package_ipk.bbclass                   |    1 +
 recipes/gpsd/gpsd.inc                         |    1 +
 recipes/gtk-webcore/midori.inc                |    2 ++
 recipes/python/python-cython-native_0.10.3.bb |    2 +-
 recipes/python/python-dbus_0.83.0.bb          |    1 +
 recipes/python/python-pygobject_2.20.0.bb     |    2 +-
 recipes/python/python-pyrex-native_0.9.8.5.bb |    1 +
 8 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/classes/distutils.bbclass b/classes/distutils.bbclass
index 4d1fc8c..be35c1f 100644
--- a/classes/distutils.bbclass
+++ b/classes/distutils.bbclass
@@ -11,6 +11,7 @@ distutils_do_compile() {
          STAGING_INCDIR=${STAGING_INCDIR} \
          STAGING_LIBDIR=${STAGING_LIBDIR} \
          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+         PYTHONPATH=${D}/${libdir}/${PYTHON_DIR}/site-packages \
          ${STAGING_BINDIR_NATIVE}/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
          oefatal "python setup.py build_ext execution failed."
 }
@@ -18,6 +19,7 @@ distutils_do_compile() {
 distutils_stage_headers() {
         install -d ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR}/site-packages
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        PYTHONPATH=${D}/${libdir}/${PYTHON_DIR}/site-packages \
         ${STAGING_BINDIR_NATIVE}/python setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
         oefatal "python setup.py install_headers execution failed."
 }
@@ -26,7 +28,7 @@ distutils_stage_all() {
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         install -d ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR}/site-packages
-        PYTHONPATH=${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR}/site-packages \
+        PYTHONPATH=${D}/${libdir}/${PYTHON_DIR}/site-packages \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
         oefatal "python setup.py install (stage) execution failed."
diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index 420c892..9677b25 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -78,6 +78,7 @@ do_package_update_index_ipk[depends] += "ipkg-utils-native:do_populate_staging"
 #
 do_package_update_index_ipk () {
 	set -x
+	PYTHONPATH=${STAGING_BINDIR} BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS}
 
 	ipkgarchs="${PACKAGE_ARCHS}"
 
diff --git a/recipes/gpsd/gpsd.inc b/recipes/gpsd/gpsd.inc
index a917fbe..a3aacc9 100644
--- a/recipes/gpsd/gpsd.inc
+++ b/recipes/gpsd/gpsd.inc
@@ -31,6 +31,7 @@ export STAGING_LIBDIR
 do_compile_prepend() {
     export BUILD_SYS="${BUILD_SYS}"
     export HOST_SYS="${HOST_SYS}"
+    export PYTHONPATH=${D}/${libdir}/${PYTHON_DIR}/site-packages
 	find ${S} -name "*.so" -exec rm -f {} \;
 }
 
diff --git a/recipes/gtk-webcore/midori.inc b/recipes/gtk-webcore/midori.inc
index fc2df36..b0fc452 100644
--- a/recipes/gtk-webcore/midori.inc
+++ b/recipes/gtk-webcore/midori.inc
@@ -7,6 +7,8 @@ PE = "1"
 
 inherit autotools gtk-icon-cache pkgconfig
 
+export PYTHONPATH=${D}/${libdir}/${PYTHON_DIR}/site-packages
+
 SRC_URI = "http://software.twotoasts.de/media/midori/midori-${PV}.tar.gz"
 
 EXTRA_OECONF = "  --disable-hildon "
diff --git a/recipes/python/python-cython-native_0.10.3.bb b/recipes/python/python-cython-native_0.10.3.bb
index a5c78ce..95886ae 100644
--- a/recipes/python/python-cython-native_0.10.3.bb
+++ b/recipes/python/python-cython-native_0.10.3.bb
@@ -4,7 +4,7 @@ DEPENDS = "python-native"
 RDEPENDS = ""
 
 do_stage() {
-    BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+    PYTHONPATH=${STAGING_BINDIR} BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
     STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
         ${STAGING_BINDIR}/python setup.py install --prefix=${STAGING_BINDIR}/.. --install-data=${STAGING_DATADIR}
 }
diff --git a/recipes/python/python-dbus_0.83.0.bb b/recipes/python/python-dbus_0.83.0.bb
index 5d6f249..6c764e9 100644
--- a/recipes/python/python-dbus_0.83.0.bb
+++ b/recipes/python/python-dbus_0.83.0.bb
@@ -12,6 +12,7 @@ inherit distutils-base autotools_stage pkgconfig
 
 export BUILD_SYS
 export HOST_SYS
+export PYTHONPATH=${D}/${libdir}/${PYTHON_DIR}/site-packages
 
 RDEPENDS_${PN} = "\
   python-io \
diff --git a/recipes/python/python-pygobject_2.20.0.bb b/recipes/python/python-pygobject_2.20.0.bb
index 10c94dc..11829fa 100644
--- a/recipes/python/python-pygobject_2.20.0.bb
+++ b/recipes/python/python-pygobject_2.20.0.bb
@@ -19,7 +19,7 @@ inherit autotools distutils-base pkgconfig
 # necessary to let the call for python-config succeed
 export BUILD_SYS
 export HOST_SYS
-
+export PYTHONPATH=${D}/${libdir}/${PYTHON_DIR}/site-packages
 export GOBJECT_INTROSPECTION_CFLAGS="-pthread -I${STAGING_INCDIR}/gobject-introspection-1.0 -I${STAGING_INCDIR}/glib-2.0 -I${STAGING_LIBDIR}/glib-2.0/include"
 
 do_stage() {
diff --git a/recipes/python/python-pyrex-native_0.9.8.5.bb b/recipes/python/python-pyrex-native_0.9.8.5.bb
index 4405212..02b0685 100644
--- a/recipes/python/python-pyrex-native_0.9.8.5.bb
+++ b/recipes/python/python-pyrex-native_0.9.8.5.bb
@@ -6,5 +6,6 @@ RDEPENDS = ""
 do_stage() {
 	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
 	STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
+	PYTHONPATH=${D}/${libdir}/${PYTHON_DIR}/site-packages \
         ${STAGING_BINDIR}/python setup.py install --prefix=${STAGING_BINDIR}/.. --install-data=${STAGING_DATADIR}
 }
-- 
1.6.6.1


--C7zPtVaVf+AK4Oqc--
