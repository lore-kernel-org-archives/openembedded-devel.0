Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TJMEv-0004MW-8o for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 12:31:41 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TJM2C-00017o-5N for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 12:18:32 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 12:18:32 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 12:18:32 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Oct 2012 12:17:42 +0200
Message-ID: <k4h3c4$n4q$1@ger.gmane.org>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<bc45dc7aa0affaab30b86764930897ac81d81bc2.1349107616.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <bc45dc7aa0affaab30b86764930897ac81d81bc2.1349107616.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-webserver][PATCH 2/6] apache2: add from OE-Classic
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
X-List-Received-Date: Wed, 03 Oct 2012 10:31:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-10-12 18:14, Paul Eggleton schreef:
> No modifications in this commit (apart from not copying some unneeded 
> files).
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> --- 
> .../apache2/apache2-2.2.17/server-makefile-patch   |   11 ++ 
> .../recipes-httpd/apache2/apache2-native_2.2.17.bb |   44 ++++++++ 
> .../recipes-httpd/apache2/apache2_2.2.17.bb        |  119
> ++++++++++++++++++++ meta-webserver/recipes-httpd/apache2/files/init    |
> 70 ++++++++++++ 4 files changed, 244 insertions(+) create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2-2.2.17/server-makefile-patch
>
> 
create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-native_2.2.17.bb
> create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2_2.2.17.bb create mode 100755
> meta-webserver/recipes-httpd/apache2/files/init
> 
> diff --git
> a/meta-webserver/recipes-httpd/apache2/apache2-2.2.17/server-makefile-patch
> b/meta-webserver/recipes-httpd/apache2/apache2-2.2.17/server-makefile-patch
>
> 
new file mode 100644
> index 0000000..f1349cb --- /dev/null +++
> b/meta-webserver/recipes-httpd/apache2/apache2-2.2.17/server-makefile-patch
>
> 
@@ -0,0 +1,11 @@
> +--- http-2.0.54/server/Makefile.in-old	2005-12-20 13:26:56.000000000
> -0500 ++++ http-2.0.54/server/Makefile.in	2005-12-20 13:27:22.000000000
> -0500 +@@ -27,7 +27,7 @@ + 	$(LINK) $(EXTRA_LDFLAGS)
> $(gen_test_char_OBJECTS) $(EXTRA_LIBS) + + test_char.h: gen_test_char +-
> ./gen_test_char > test_char.h ++	gen_test_char > test_char.h + + util.lo:
> test_char.h + diff --git
> a/meta-webserver/recipes-httpd/apache2/apache2-native_2.2.17.bb
> b/meta-webserver/recipes-httpd/apache2/apache2-native_2.2.17.bb new file
> mode 100644 index 0000000..66b326d --- /dev/null +++
> b/meta-webserver/recipes-httpd/apache2/apache2-native_2.2.17.bb @@ -0,0
> +1,44 @@ +SECTION = "net" +DEPENDS = "expat pcre" + +inherit native + +PR
> = "r0" +SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2" 
> + +S = "${WORKDIR}/httpd-${PV}" + +do_configure () { +	./configure
> --with-included-apr --prefix=${prefix} +} + +do_install () { +	install -d
> ${D}${bindir} ${D}${libdir} +	cp server/gen_test_char ${D}${bindir} +	cp
> srclib/apr/apr-1-config ${D}${bindir} +	cp srclib/apr-util/apu-1-config
> ${D}${bindir} +	cp support/apxs ${D}${bindir} +	chmod 755
> ${D}${bindir}/apxs +	install -d ${D}/usr/build +	cp build/*.mk
> ${D}/usr/build +	cp build/instdso.sh ${D}/usr/build +	cp .libs/httpd
> ${D}${bindir} + +	(cd srclib/apr/.libs; tar -cf - libapr-*.so* ) | +
> (cd ${D}${libdir}; tar -xf - ) +	(cd srclib/apr-util/.libs; tar -cf -
> libaprutil-*.so* ) | +	  (cd ${D}${libdir}; tar -xf - ) + +	install -d
> ${D}${includedir}/apache2 +	cp include/* ${D}${includedir}/apache2 +	cp
> os/unix/os.h ${D}${includedir}/apache2 +	cp os/unix/unixd.h
> ${D}${includedir}/apache2 + +  	cp support/envvars-std
> ${D}${bindir}/envvars +    	chmod 755 ${D}${bindir}/envvars +} + 
> +NATIVE_INSTALL_WORKS = "1"

Drop that

> + +SRC_URI[md5sum] = "16eadc59ea6b38af33874d300973202e" 
> +SRC_URI[sha256sum] =
> "868af11e3ed8fa9aade15241ea4f51971b3ef71104292ca2625ef2065e61fb04" diff
> --git a/meta-webserver/recipes-httpd/apache2/apache2_2.2.17.bb
> b/meta-webserver/recipes-httpd/apache2/apache2_2.2.17.bb new file mode
> 100644 index 0000000..13012a7 --- /dev/null +++
> b/meta-webserver/recipes-httpd/apache2/apache2_2.2.17.bb @@ -0,0 +1,119
> @@ +SECTION = "net" +DESCRIPTION = "The apache v2 web server" +DEPENDS =
> "libtool-native apache2-native openssl expat pcre apr apr-util"

> +RDEPENDS_${PN} += "openssl"

That should go below do_install

> + +PR = "r0"

that's the default, drop that

> +SRC_URI = "http://apache.mirrors.tds.net/httpd/httpd-${PV}.tar.bz2 \ +
> file://apr-sockets-patch;apply=yes \ +
> file://configure-patch;apply=yes \ +
> file://server-makefile-patch;apply=yes \ +	   file://configure.in.patch
> \ +	   file://apr.h.in.patch \ +           file://init"

whitespace errors

> + +# +# over-ride needed since apache unpacks into httpd +# +S =
> "${WORKDIR}/httpd-${PV}" + +# +# implications - autotools defines
> suitable do_configure, do_install, etc. +# update-rc.d adds hooks for
> rc-update. +# +# +inherit autotools update-rc.d + +# +# implications -
> used by update-rc.d scripts +# +INITSCRIPT_NAME = "apache2" 
> +INITSCRIPT_PARAMS = "defaults 91 20" +LEAD_SONAME = "libapr-1.so.0" + 
> +CONFFILES_${PN} = "${sysconfdir}/${PN}/httpd.conf \ +
> ${sysconfdir}/${PN}/magic \ +		   ${sysconfdir}/${PN}/mime.types \ +
> ${sysconfdir}/init.d/${PN} " + +PACKAGES = "${PN}-doc ${PN}-dev ${PN}-dbg
> ${PN}" + +# we override here rather than append so that .so links are +#
> included in the runtime package rather than here (-dev) +# and to get
> build, icons, error into the -dev package +FILES_${PN}-dev =
> "${datadir}/${PN}/build \ +		${datadir}/${PN}/icons \ +
> ${datadir}/${PN}/error \ +		${bindir}/apr-config ${bindir}/apu-config \ +
> ${libdir}/apr*.exp \ +		${includedir}/${PN} \ +		${libdir}/*.la \ +
> ${libdir}/*.a" + +# manual to manual +FILES_${PN}-doc += "
> ${datadir}/${PN}/manual" + +# +# override this too - here is the default,
> less datadir +# +FILES_${PN} =  "${bindir} ${sbindir} ${libexecdir}
> ${libdir}/lib*.so.* ${sysconfdir} \ +		${sharedstatedir} ${localstatedir}
> /bin /sbin /lib/*.so* \ +		${libdir}/${PN}" + +# we want htdocs and
> cgi-bin to go with the binary +FILES_${PN} += "${datadir}/${PN}/htdocs
> ${datadir}/${PN}/cgi-bin" + +#make sure the lone .so links also get
> wrapped in the base package +FILES_${PN} += " ${libdir}/lib*.so
> ${libdir}/pkgconfig/*"

All that package related stuff goes below do_install

> +CFLAGS_append = " -DPATH_MAX=4096" +CFLAGS_prepend =
> "-I${STAGING_INCDIR}/openssl " +EXTRA_OECONF = "--enable-ssl \ +
> --with-ssl=${STAGING_LIBDIR}/.. \ +		--with-expat=${STAGING_LIBDIR}/.. \ 
> +		--with-pcre=${STAGING_LIBDIR}/.. \ +
> --with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ +
> --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \ +		--enable-info
> \ +		--enable-rewrite \ +		--with-dbm=sdbm \ +		--with-berkeley-db=no \ +
> --localstatedir=/var/${PN} \ +		--with-gdbm=no \ +		--with-ndbm=no \ +
> --includedir=${includedir}/${PN} \ +		--datadir=${datadir}/${PN} \ +
> --sysconfdir=${sysconfdir}/${PN} \ +		ap_cv_void_ptr_lt_long=no \ +		" + 
> +# +# here we over-ride the autotools provided do_configure. +# + 
> +do_configure_prepend() { +	sed -e 's,libtool
> libtool15,${HOST_SYS}-libtool libtool115,' -i
> ${S}/srclib/apr/build/buildcheck.sh +}

is that 15 -> 115 intended?


This one is missing the needed LSB headers:

> +++ b/meta-webserver/recipes-httpd/apache2/files/init
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQbBDGMkyGM64RGpERAtMQAJ9Y3aXxVBQGFRhwiMj80yzB6o9BKgCgudTi
V+Fbc8CKmudBL7hssYBOkV8=
=HkLy
-----END PGP SIGNATURE-----



