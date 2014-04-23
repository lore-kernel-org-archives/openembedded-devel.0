Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A085609B1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 08:07:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3N87hc0017068
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 01:07:44 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 23 Apr 2014 01:07:43 -0700
Message-ID: <535774CB.6060401@windriver.com>
Date: Wed, 23 Apr 2014 16:07:39 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>,
	<openembedded-devel@lists.openembedded.org>
References: <1398240000-22960-1-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1398240000-22960-1-git-send-email-Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH] rrdtool: enable perl and python bindings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Apr 2014 08:07:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

This is a V3.

Change since V2:
Merge ${PN}-perl-dbg and ${PN}-python-dbg into ${PN}-dbg

Best Regards
Chong

On 04/23/2014 04:00 PM, Chong Lu wrote:
> 1. default enable perl and python bindings
> 2. rrdtool uses perl.real, perl.real doesn't know where the PERL5LIB should be
> when prebuilts are used. Use the wrapper perl instead, perl sets PERL5LIB and
> invokes perl.real
> 3. While using dash as /bin/sh, subsequent commands in functions will not use
> the environment variables passed to the function call line unless explicitly
> run "export ENV_VAR".
> 4. delete unrecognized options: "--enable-local-libpng" and "--enable-local-zlib"
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb |  125 ++++++++++++++++++++-
>   1 file changed, 119 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
> index 533451f..1fe0302 100644
> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
> @@ -5,6 +5,7 @@ LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
>   
>   DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2"
> +RDEPENDS_${PN}-perl = "perl perl-module-lib perl-module-getopt-long perl-module-time-hires perl-module-io-file"
>   
>   PR = "r2"
>   
> @@ -15,25 +16,137 @@ SRC_URI = "http://oss.oetiker.ch/rrdtool/pub/rrdtool-${PV}.tar.gz \
>   SRC_URI[md5sum] = "ffe369d8921b4dfdeaaf43812100c38f"
>   SRC_URI[sha256sum] = "956aaf431c955ba88dd7d98920ade3a8c4bad04adb1f9431377950a813a7af11"
>   
> -inherit autotools gettext
> +inherit autotools gettext pythonnative perlnative python-dir
>   
>   EXTRA_AUTORECONF = "-I m4"
>   
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "python perl"
> +
> +PACKAGECONFIG[python] = "--enable-python=yes \
> +am_cv_python_pythondir=${STAGING_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages \
> +am_cv_python_pyexecdir=${STAGING_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages,\
> +--disable-python,python,"
> +
> +PACKAGECONFIG[perl] = \
> +"--enable-perl=yes --with-perl-options='INSTALLDIRS="vendor"' \
> +ac_cv_path_PERL_CC='${CC}',  \
> +--disable-perl,perl,"
> +
>   PACKAGECONFIG[dbi] = "--enable-libdbi,--disable-libdbi,libdbi"
>   
>   EXTRA_OECONF = " \
>       --enable-shared \
> -    --enable-local-libpng \
> -    --enable-local-zlib \
>       --disable-libwrap \
>       --program-prefix='' \
>       rd_cv_ieee_works=yes \
> -    --disable-perl \
> -    --disable-python \
>       --disable-ruby \
>       --disable-lua \
>       --disable-rpath \
>   "
>   
> +# don't use perl.real, this results in break issues with prebuilts since perl.real doesn't
> +# know where the PERL5LIB is...
> +# use wrapper perl instead
> +EXTRA_OEMAKE = "PERL=${STAGING_BINDIR_NATIVE}/perl-native/perl FULLPERL=${STAGING_BINDIR_NATIVE}/perl-native/perl"
> +
> +export BUILD_SYS
> +export HOST_SYS
> +export STAGING_LIBDIR
> +export STAGING_INCDIR
> +
> +do_configure() {
> +	#fix the pkglib problem with newer automake
> +	#perl
> +	sed -i -e "s|-Wl,--rpath -Wl,\$rp||g" \
> +	    ${S}/bindings/perl-shared/Makefile.PL
> +
> +	#python
> +	sed -i -e '/PYTHON_INCLUDES="-I${/c \
> +	PYTHON_INCLUDES="-I=/usr/include/python${PYTHON_BASEVERSION}"' \
> +	    ${S}/m4/acinclude.m4
> +	#remove the hardcoded $(libdir) rpath
> +	sed -i -e 's|--rpath=$(libdir)||g' ${S}/bindings/Makefile.am
> +
> +	autotools_do_configure
> +
> +	perl_version=`perl -v 2>/dev/null | \
> +	    sed -n 's/This is perl.*v[a-z ]*\([0-9]\.[0-9][0-9.]*\).*$/\1/p'`
> +
> +	#modify python sitepkg
> +	#remove the dependency of perl-shared:Makefile
> +	#or perl-shared/Makefile will be regenerated
> +	#if any code touch bindings/Makefile after below perl bindings code
> +	sed -i -e "s:\$(PYTHON) setup.py install:\$(PYTHON) setup.py install \
> +	    --install-lib=${D}${PYTHON_SITEPACKAGES_DIR}:" \
> +	    -e "s:perl-shared/Makefile.PL Makefile:perl-shared/Makefile.PL:" \
> +	    ${S}/bindings/Makefile
> +
> +	#redo the perl bindings
> +	(
> +	cd bindings/perl-shared;
> +	perl -I${STAGING_LIBDIR}/perl/$perl_version Makefile.PL INSTALLDIRS="vendor"
> +	    INSTALLPRIVLIB="abc";
> +	sed -i -e "s| ${libdir}/perl/| ${STAGING_LIBDIR}/perl/|g" Makefile;
> +
> +	cd ../../bindings/perl-piped;
> +	perl -I${STAGING_LIBDIR}/perl/$perl_version Makefile.PL INSTALLDIRS="vendor";
> +	sed -i -e "s| ${libdir}/perl/| ${STAGING_LIBDIR}/perl/|g" Makefile;
> +	)
> +
> +	#change the interpreter in file
> +	sed -i -e "s|^PERL = ${STAGING_BINDIR_NATIVE}/.*|PERL = /usr/bin/perl|g" \
> +	    ${S}/examples/Makefile
> +	sed -i -e "s|${STAGING_BINDIR_NATIVE}/perl-native/perl|/usr/bin/perl|g" \
> +	    ${S}/examples/*.pl
> +}
> +
> +python populate_packages_prepend() {
> +    def fill_more(name, rdep=None):
> +        if name is None or name.strip() == "":
> +            return
> +
> +        fpack=d.getVar('PACKAGES') or ""
> +        fpack="${PN}-" + name + " " + fpack
> +        d.setVar('PACKAGES', fpack)
> +        if rdep is not None:
> +            prdep=d.getVar('RDEPENDS_${PN}-' + name) or ""
> +            prdep=rdep + " " + prdep
> +            d.setVar('RDEPENDS_${PN}-' + name, prdep)
> +
> +            prdep=d.getVar('RDEPENDS_${PN}-' + name) or ""
> +            bb.debug(1, "RDEPENDS_${PN}-" + name + "=" + prdep)
> +
> +    conf=(d.getVar('PACKAGECONFIG', True) or "").split()
> +    pack=d.getVar('PACKAGES') or ""
> +    bb.debug(1, "PACKAGECONFIG=%s" % conf)
> +    bb.debug(1, "PACKAGES1=%s" % pack )
> +
> +    if "perl" in conf :
> +        fill_more("perl")
> +
> +    if "python" in conf:
> +        fill_more("python")
> +
> +    pack=d.getVar('PACKAGES', True) or ""
> +    bb.debug(1, "PACKAGES after=%s" % pack)
> +
> +    #debug code
> +    #prdep=d.getVar('RDEPENDS_${PN}') or ""
> +    #bb.debug(1, "RDEPENDS_${PN}" + "=" + prdep)
> +    #prdep=d.getVar('RDEPENDS') or ""
> +    #bb.debug(1, "RDEPENDS" + "=" + prdep)
> +}
> +
> +FILES_${PN}-doc += "${datadir}/examples"
> +
> +DESCRIPTION_${PN}-perl = \
> +"The ${PN}-perl package includes RRDtool bindings for perl."
> +FILES_${PN}-perl = "${libdir}/perl/vendor_perl/*/*.pm ${datadir}/${PN}/examples \
> +    ${libdir}/perl/vendor_perl/*/auto/RRDs/RRDs.*"
> +
> +DESCRIPTION_${PN}-python = \
> +"The ${PN}-python package includes RRDtool bindings for python."
> +FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
>   
> +FILES_${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/RRDs/.debug \
> +    ${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug"


