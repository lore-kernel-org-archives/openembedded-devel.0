Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MutDq-0004Ey-Dz
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Oct 2009 21:27:53 +0200
Received: from [85.210.191.75] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MutD5-0006WT-0C
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Oct 2009 20:27:03 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1254768733.10712.3.camel@leeloo.somedomain>
References: <1254768733.10712.3.camel@leeloo.somedomain>
Date: Mon, 05 Oct 2009 20:27:01 +0100
Message-Id: <1254770821.9214.105.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.191.75
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: lighttpd 1.4.18 runtime issue
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
X-List-Received-Date: Mon, 05 Oct 2009 19:27:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks for the patch.

For future reference, please don't combine mechanical operations like
reformatting with other edits in a single patch.  It makes it much
harder to see what the patch is actually doing if there is a lot of
other extraneous noise going on.

Can you clarify what the effect is of failing to install
lighttpd-module-indexfile; does the daemon just refuse to start at all,
or does it just ignore the config file directive if the module is
missing?  If the latter, and/or if folks are likely to edit the config
file to remove the reference to that module, it might be better to set
the module package as RRECOMMENDS rather than RDEPENDS.

p.

On Mon, 2009-10-05 at 20:52 +0200, Michael Lippautz wrote:
> hej,
> 
> lighttpd_1.4.18 is installed with a config that should actually load its
> module mod-indexfile.so.
> 
> Since the config is pretty default, I added the module to the runtime
> depends. (also re-formated recipe, uses tabs now).
> 
> Regards,
> Michael
> 
> 
> diff --git a/recipes/lighttpd/lighttpd_1.4.18.bb
> b/recipes/lighttpd/lighttpd_1.4.18.bb
> index d5870ba..80d22bc 100644
> --- a/recipes/lighttpd/lighttpd_1.4.18.bb
> +++ b/recipes/lighttpd/lighttpd_1.4.18.bb
> @@ -2,26 +2,31 @@ DESCRIPTION = "Web server"
>  SECTION = "net"
>  LICENSE = "BSD"
>  DEPENDS = "libpcre"
> -PR = "r3"
> -
> -SRC_URI = "http://www.lighttpd.net/download/lighttpd-${PV}.tar.gz \
> -	   file://configure.in.patch;patch=1 \
> -	   file://mod_redirect.c.patch;patch=1 \
> -	   file://src-server.c.patch;patch=1 \
> -	   file://index.html \
> -	   file://lighttpd.conf \
> -	   file://lighttpd"
> -
> -EXTRA_OECONF="--without-bzip2 \
> -		--without-ldap \
> -		--without-lua \
> -		--without-memcache \
> -		--with-pcre \
> -		--without-webdav-props \
> -		--without-webdav-locks \
> -		--without-openssl \
> -		--disable-nls \
> -		--disable-static"
> +PR = "r4"
> +
> +RDEPENDS_${PN} += " \
> +	lighttpd-module-indexfile"
> +
> +SRC_URI = " \
> +	http://www.lighttpd.net/download/lighttpd-${PV}.tar.gz \
> +	file://configure.in.patch;patch=1 \
> +	file://mod_redirect.c.patch;patch=1 \
> +	file://src-server.c.patch;patch=1 \
> +	file://index.html \
> +	file://lighttpd.conf \
> +	file://lighttpd"
> +
> +EXTRA_OECONF=" \
> +	--without-bzip2 \
> +	--without-ldap \
> +	--without-lua \
> +	--without-memcache \
> +	--with-pcre \
> +	--without-webdav-props \
> +	--without-webdav-locks \
> +	--without-openssl \
> +	--disable-nls \
> +	--disable-static"
>  
>  inherit autotools pkgconfig update-rc.d
>  
> @@ -44,6 +49,6 @@ FILES_${PN} += "${sysconfdir} /www"
>  PACKAGES_DYNAMIC = "lighttpd-module-*"
>  
>  python populate_packages_prepend () {
> -        lighttpd_libdir = bb.data.expand('${libdir}', d)
> -        do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$',
> 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
> +	lighttpd_libdir = bb.data.expand('${libdir}', d)
> +	do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$',
> 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
>  }
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



