Received: from [209.85.222.193] (helo=mail-pz0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MbMKQ-0002S7-6H
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 00:29:54 +0200
Received: by pzk31 with SMTP id 31so234106pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 15:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=y9fry0dC3wBs5Qy8/XeeyC6HXRqig4+Xoj37TMk8ZL4=;
	b=mbbXfVM0PIkCLJDvMMKkH/jjRVNpIqLMkRE61ND+DJLjfdeCEB1asCvyT8fwqfMBy6
	6bYgI11tHzs/PovaCblif5FKbnAR5c/4YTIkVHTbMWdU86xpXwjayp34klXDe8xZN4/x
	xrlfhx1kH2Er2AcP9Wlly9aL2yfvfLJOM/pAg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=O6xEiFGrcq+7n+sF54mqAW20Xmxa8bZd1857TMDymahFu4SIZ7P95l4jbV59xL/YyT
	Ad6uwLkXj3JLmlxkYS12LnvZrVft60ggLcJAZRxz6cJoSuhv9wEfxuWlrmJBVM1hLm1F
	AvImtigGqfChDzEFtugUrWAyJcExbbhQfoNc8=
Received: by 10.115.117.7 with SMTP id u7mr422272wam.152.1250115203493;
	Wed, 12 Aug 2009 15:13:23 -0700 (PDT)
Received: from gmail.com (adsl-71-146-8-242.dsl.pltn13.sbcglobal.net
	[71.146.8.242])
	by mx.google.com with ESMTPS id f20sm13347731waf.52.2009.08.12.15.13.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Aug 2009 15:13:22 -0700 (PDT)
Date: Wed, 12 Aug 2009 15:13:17 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090812221317.GA13386@gmail.com>
References: <19c1b8a90908101812v662e21b4h54683ac6fe4380b1@mail.gmail.com>
	<1250083051-31424-1-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <1250083051-31424-1-git-send-email-msmith@cbnco.com>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: [PATCH v2] pciutils: fix generation of pci.ids.gz
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
X-List-Received-Date: Wed, 12 Aug 2009 22:29:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (12/08/09 09:17), Michael Smith wrote:
> Set ZLIB=yes to prevent auto-detection by the lib/configure script,
> which only looks in /usr/include.
> 
> Ship pci.ids in pci-ids-uncompressed for users of old hal versions.
> 
> Pass PREFIX to Make and use the install-lib target to save work.
> 
> Signed-off-by: Michael Smith <msmith@cbnco.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/pciutils/pciutils_3.1.2.bb |   46 ++++++++++++++----------------------
>  1 files changed, 18 insertions(+), 28 deletions(-)
> 
> diff --git a/recipes/pciutils/pciutils_3.1.2.bb b/recipes/pciutils/pciutils_3.1.2.bb
> index f23e6dd..ae7b3a7 100644
> --- a/recipes/pciutils/pciutils_3.1.2.bb
> +++ b/recipes/pciutils/pciutils_3.1.2.bb
> @@ -12,15 +12,10 @@ SRC_URI_append_nylon = "file://gcc-3-compatibility.patch;patch=1 "
>  
>  PARALLEL_MAKE = ""
>  
> -PR ="r4"
> +PR = "r5"
>  
> -EXTRA_OEMAKE += "'STRIP = '"
> +EXTRA_OEMAKE += "'STRIP = ' PREFIX=${prefix} LIBDIR=${libdir}"
>  export SHARED=yes
> -
> -do_configure () {
> -	(cd lib && ./configure ${datadir} ${PV} ${TARGET_OS} 2.4.21 ${TARGET_ARCH})
> -}
> -
>  export DESTDIR = "${D}"
>  export PREFIX = "${prefix}"
>  export SBINDIR = "${sbindir}"
> @@ -28,35 +23,30 @@ export SHAREDIR = "${datadir}"
>  export MANDIR = "${mandir}"
>  export IDSDIR = "${datadir}"
>  
> -do_install () {
> -	oe_runmake install
> +do_configure () {
> +	export ZLIB=yes
> +	(cd lib && ./configure ${datadir} ${PV} ${TARGET_OS} 2.4.21 ${TARGET_ARCH})
>  }
>  
> -do_install_append () {
> -	install -d ${D}/${datadir}
> -	install -m 6440 ${WORKDIR}/${PN}-${PV}/pci.ids ${D}/${datadir}
> -
> -	# The makefile does not install the development files:
> -	# libpci.so pci.h header.h config.h types.h
> -	install -d ${D}/${libdir}
> -	install -d ${D}/${includedir}/pci
> +do_install () {
> +	oe_runmake install install-lib
>  
> +	# "make install" misses the debug file for the library
>  	oe_libinstall -so -C lib libpci ${D}/${libdir}
> -	install -m 0644 ${S}/lib/pci.h ${D}/${includedir}/pci/
> -	install -m 0644 ${S}/lib/header.h ${D}/${includedir}/pci/
> -	install -m 0644 ${S}/lib/config.h ${D}/${includedir}/pci/
> -	install -m 0644 ${S}/lib/types.h ${D}/${includedir}/pci/
> +
> +	# Some older versions of hal may need the uncompressed version.
> +	# We install it in a separate package, pciutils-ids-uncompressed.
> +	install -m 0644 ${S}/pci.ids ${D}/${datadir}
>  }
>  
>  do_stage () {
> +	oe_runmake install-lib DESTDIR=${STAGING_DIR_HOST}
> +
> +	# "make install-lib" misses the symlink libpci.so.3
>  	oe_libinstall -so -C lib libpci ${STAGING_LIBDIR}
> -	install -m 0755 -d ${STAGING_INCDIR}/pci
> -	install -m 0644 ${S}/lib/pci.h ${STAGING_INCDIR}/pci/
> -	install -m 0644 ${S}/lib/header.h ${STAGING_INCDIR}/pci/
> -	install -m 0644 ${S}/lib/config.h ${STAGING_INCDIR}/pci/
> -	install -m 0644 ${S}/lib/types.h ${STAGING_INCDIR}/pci/
>  }
>  
>  
> -PACKAGES =+ "pciutils-ids"
> -FILES_pciutils-ids="${datadir}/pci.ids"
> +PACKAGES =+ "${PN}-ids ${PN}-ids-uncompressed"
> +FILES_${PN}-ids = "${datadir}/pci.ids.gz"
> +FILES_${PN}-ids-uncompressed = "${datadir}/pci.ids"
> -- 
> 1.6.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


