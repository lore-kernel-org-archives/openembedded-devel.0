Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJNKN-0006JA-06
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 13:41:23 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Oct 2012 04:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,527,1344236400"; d="scan'208";a="151894352"
Received: from unknown (HELO helios.localnet) ([10.252.122.52])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Oct 2012 04:28:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 03 Oct 2012 12:28:20 +0100
Message-ID: <4258940.BqvSfKhsZ3@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <k4h3c4$n4q$1@ger.gmane.org>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<bc45dc7aa0affaab30b86764930897ac81d81bc2.1349107616.git.paul.eggleton@linux.intel.com>
	<k4h3c4$n4q$1@ger.gmane.org>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Wed, 03 Oct 2012 11:41:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 03 October 2012 12:17:42 Koen Kooi wrote:
> Op 01-10-12 18:14, Paul Eggleton schreef:
> > No modifications in this commit (apart from not copying some unneeded
> > files).

As above this patch is intended to add the files as they existed in OE-Classic 
so that the differences can be seen. Updates and tidying are in the commit 
following.
 
> > +NATIVE_INSTALL_WORKS = "1"
> 
> Drop that

Already dropped in the patch following.
 
> > + +SRC_URI[md5sum] = "16eadc59ea6b38af33874d300973202e"
> > +SRC_URI[sha256sum] =
> > "868af11e3ed8fa9aade15241ea4f51971b3ef71104292ca2625ef2065e61fb04" diff
> > --git a/meta-webserver/recipes-httpd/apache2/apache2_2.2.17.bb
> > b/meta-webserver/recipes-httpd/apache2/apache2_2.2.17.bb new file mode
> > 100644 index 0000000..13012a7 --- /dev/null +++
> > b/meta-webserver/recipes-httpd/apache2/apache2_2.2.17.bb @@ -0,0 +1,119
> > @@ +SECTION = "net" +DESCRIPTION = "The apache v2 web server" +DEPENDS =
> > "libtool-native apache2-native openssl expat pcre apr apr-util"
> > 
> > +RDEPENDS_${PN} += "openssl"
> 
> That should go below do_install
> 
> > + +PR = "r0"
> 
> that's the default, drop that

I'm sorry, but for reasons I've already stated on several occasions, I won't 
leave this out in any recipe in meta-webserver, nor anywhere else where I'm 
the maintainer.

Given that you often complain about people forgetting to bump PR, why do you 
insist that people should remove PR = "r0" when having it there would be at 
least slightly helpful in that regard?
 
> > +SRC_URI = "http://apache.mirrors.tds.net/httpd/httpd-${PV}.tar.bz2 \ +
> > file://apr-sockets-patch;apply=yes \ +
> > file://configure-patch;apply=yes \ +
> > file://server-makefile-patch;apply=yes \ +	   file://configure.in.patch
> > \ +	   file://apr.h.in.patch \ +           file://init"
> 
> whitespace errors

Already fixed in the patch following.
 
> > + +# +# over-ride needed since apache unpacks into httpd +# +S =
> > "${WORKDIR}/httpd-${PV}" + +# +# implications - autotools defines
> > suitable do_configure, do_install, etc. +# update-rc.d adds hooks for
> > rc-update. +# +# +inherit autotools update-rc.d + +# +# implications -
> > used by update-rc.d scripts +# +INITSCRIPT_NAME = "apache2"
> > +INITSCRIPT_PARAMS = "defaults 91 20" +LEAD_SONAME = "libapr-1.so.0" +
> > +CONFFILES_${PN} = "${sysconfdir}/${PN}/httpd.conf \ +
> > ${sysconfdir}/${PN}/magic \ +		   ${sysconfdir}/${PN}/mime.types \ +
> > ${sysconfdir}/init.d/${PN} " + +PACKAGES = "${PN}-doc ${PN}-dev ${PN}-dbg
> > ${PN}" + +# we override here rather than append so that .so links are +#
> > included in the runtime package rather than here (-dev) +# and to get
> > build, icons, error into the -dev package +FILES_${PN}-dev =
> > "${datadir}/${PN}/build \ +		${datadir}/${PN}/icons \ +
> > ${datadir}/${PN}/error \ +		${bindir}/apr-config ${bindir}/apu-config \ +
> > ${libdir}/apr*.exp \ +		${includedir}/${PN} \ +		${libdir}/*.la \ +
> > ${libdir}/*.a" + +# manual to manual +FILES_${PN}-doc += "
> > ${datadir}/${PN}/manual" + +# +# override this too - here is the default,
> > less datadir +# +FILES_${PN} =  "${bindir} ${sbindir} ${libexecdir}
> > ${libdir}/lib*.so.* ${sysconfdir} \ +		${sharedstatedir} 
${localstatedir}
> > /bin /sbin /lib/*.so* \ +		${libdir}/${PN}" + +# we want htdocs and
> > cgi-bin to go with the binary +FILES_${PN} += "${datadir}/${PN}/htdocs
> > ${datadir}/${PN}/cgi-bin" + +#make sure the lone .so links also get
> > wrapped in the base package +FILES_${PN} += " ${libdir}/lib*.so
> > ${libdir}/pkgconfig/*"
> 
> All that package related stuff goes below do_install

OK, now fixed in the branch.

> > +CFLAGS_append = " -DPATH_MAX=4096" +CFLAGS_prepend =
> > "-I${STAGING_INCDIR}/openssl " +EXTRA_OECONF = "--enable-ssl \ +
> > --with-ssl=${STAGING_LIBDIR}/.. \ +		--with-expat=${STAGING_LIBDIR}/.. 
\
> > +		--with-pcre=${STAGING_LIBDIR}/.. \ +
> > --with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ +
> > --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \ +		--enable-info
> > \ +		--enable-rewrite \ +		--with-dbm=sdbm \ +		--with-berkeley-
db=no \ +
> > --localstatedir=/var/${PN} \ +		--with-gdbm=no \ +		--with-ndbm=no \ +
> > --includedir=${includedir}/${PN} \ +		--datadir=${datadir}/${PN} \ +
> > --sysconfdir=${sysconfdir}/${PN} \ +		ap_cv_void_ptr_lt_long=no \ +		
" +
> > +# +# here we over-ride the autotools provided do_configure. +# +
> > +do_configure_prepend() { +	sed -e 's,libtool
> > libtool15,${HOST_SYS}-libtool libtool115,' -i
> > ${S}/srclib/apr/build/buildcheck.sh +}
> 
> is that 15 -> 115 intended?

This was dropped in the following patch; the file being modified is no longer 
there in 2.4.

> This one is missing the needed LSB headers:
> > +++ b/meta-webserver/recipes-httpd/apache2/files/init

Fixed in the branch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


