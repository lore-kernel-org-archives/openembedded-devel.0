Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyCd5-0004hw-Nw
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 01:24:24 +0100
Received: by pxi1 with SMTP id 1so799867pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 16:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=uwHpkOAF3YfKnOk2to8GShhcwKI5A+72UX2Jmq+W/tk=;
	b=eJ5PGWiyALQs8TFKuHkLAUitqpomVeY+VJn97sZCO/Uu1CtWi0eCorE5YueAmL9rGZ
	ot5FbrTmzoKnJDeyrX7cysxl1S/SAE6yv1nwuCg2ZgnzuJVaoxuj5McbHD0XYLc1VrLA
	s9Wm39p9Tte493pb+PkS4IpGSw7B676ZAB3jc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=Y3lUXRKVdMfZ5oBDlKcSFQ7qWYiyeXYXp81Ugi2cfYvIdIOd1yKab7xgwuo/rw5KjB
	ZxVAl/sWTreOf71ezI8/LyAddB5rIRJQvMFWn+rDWw8fk5fDZ0GkYcNUbStwPnXvGp42
	PkAGYCSa/SpzvxAAa1pNw3Xdeb+2+KvGncFU0=
Received: by 10.142.209.9 with SMTP id h9mr7971916wfg.63.1299889360779;
	Fri, 11 Mar 2011 16:22:40 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w11sm6038455wfh.18.2011.03.11.16.22.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 16:22:39 -0800 (PST)
Date: Fri, 11 Mar 2011 16:23:04 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110312002304.GL5603@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1299882862-4839-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1299882862-4839-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] libpcre: add latest 8.10 version
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
X-List-Received-Date: Sat, 12 Mar 2011 00:24:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (11/03/11 23:34), Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/libpcre/libpcre-native_8.10.bb |   19 +++++++++++
>  recipes/libpcre/libpcre_8.10.bb        |   52 ++++++++++++++++++++++++++++++++
>  2 files changed, 71 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/libpcre/libpcre-native_8.10.bb
>  create mode 100644 recipes/libpcre/libpcre_8.10.bb
> 
> diff --git a/recipes/libpcre/libpcre-native_8.10.bb b/recipes/libpcre/libpcre-native_8.10.bb
> new file mode 100644
> index 0000000..9e5c62b
> --- /dev/null
> +++ b/recipes/libpcre/libpcre-native_8.10.bb
> @@ -0,0 +1,19 @@
> +SECTION = "unknown"
> +require libpcre_${PV}.bb
> +inherit native
> +FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libpcre-${PV}"
> +
> +# NOTE: multiple providers are available (libpcre, libpcre-native);
> +# NOTE: consider defining PREFERRED_PROVIDER_pcre
> +PROVIDES = ""
> +
> +do_compile () {
> +	# The generation of dftables can lead to timestamp problems with ccache
> +	# because the generated config.h seems newer.  It is sufficient to ensure that the
> +	# attempt to build dftables inside make will actually work (foo_FOR_BUILD is
> +	# only used for this).
> +	oe_runmake CC_FOR_BUILD="${BUILD_CC}" CFLAGS_FOR_BUILD="-DLINK_SIZE=2 -I${S}/include" LINK_FOR_BUILD="${BUILD_CC}"
> +}
> +
> +SRC_URI[md5sum] = "780867a700e9d4e4b9cb47aa5453e4b2"
> +SRC_URI[sha256sum] = "7ac4e016f6bad8c7d990e6de9bce58c04ff5dd8838be0c5ada0afad1d6a07480"
> diff --git a/recipes/libpcre/libpcre_8.10.bb b/recipes/libpcre/libpcre_8.10.bb
> new file mode 100644
> index 0000000..92a9d32
> --- /dev/null
> +++ b/recipes/libpcre/libpcre_8.10.bb
> @@ -0,0 +1,52 @@
> +DESCRIPTION = "Perl-compatible regular expression library. PCRE has its own native \
> +API, but a set of 'wrapper' functions that are based on the POSIX API \
> +are also supplied in the library libpcreposix. Note that this just \
> +provides a POSIX calling interface to PCRE; the regular expressions \
> +themselves still follow Perl syntax and semantics. The header file for \
> +the POSIX-style functions is called pcreposix.h."
> +SECTION = "devel"
> +PR = "r0"
> +LICENSE = "BSD"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
> +           file://pcre-cross.patch"
> +S = "${WORKDIR}/pcre-${PV}"
> +
> +PROVIDES = "pcre"
> +
> +inherit autotools binconfig
> +
> +PARALLEL_MAKE = ""
> +
> +CFLAGS_append = " -D_REENTRANT"
> +CXXFLAGS_powerpc += "-lstdc++"
> +EXTRA_OECONF = " --with-link-size=2 --enable-newline-is-lf --with-match-limit=10000000 --enable-rebuild-chartables --enable-utf8"
> +
> +do_compile () {
> +	# stop libtool from trying to link with host libraries - fix from #33
> +	# this resolve build problem on amd64 - #1015
> +	if [ -e ${S}/${TARGET_SYS}-libtool ] ; then
> +		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${TARGET_SYS}-libtool
> +	else
> +		ln -sf ${S}/libtool ${S}/${TARGET_SYS}-libtool
> +		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${TARGET_SYS}-libtool	
> +	fi
> +
> +	# The generation of dftables can lead to timestamp problems with ccache
> +	# because the generated config.h seems newer.  It is sufficient to ensure that the
> +	# attempt to build dftables inside make will actually work (foo_FOR_BUILD is
> +	# only used for this).
> +	oe_runmake CC_FOR_BUILD="${BUILD_CC}" CFLAGS_FOR_BUILD="-DLINK_SIZE=2 -I${S}/include" LINK_FOR_BUILD="${BUILD_CC} -L${S}/lib"
> +}
> +
> +do_install_append () {
> +    install -d ${STAGING_BINDIR}
> +    install -m 0755 ${D}${bindir}/pcre-config ${STAGING_BINDIR}/
> +}
> +
> +FILES_${PN} = "${libdir}/lib*${SOLIBS}"
> +FILES_${PN}-dev += "${bindir}/*"
> +
> +LEAD_SONAME = "libpcre.so.*"
> +
> +SRC_URI[md5sum] = "780867a700e9d4e4b9cb47aa5453e4b2"
> +SRC_URI[sha256sum] = "7ac4e016f6bad8c7d990e6de9bce58c04ff5dd8838be0c5ada0afad1d6a07480"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


