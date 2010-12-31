Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PYeLI-0001y9-NM for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 13:44:24 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PYeL2-0004Y0-Uh for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 13:44:08 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 13:44:08 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 13:44:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 31 Dec 2010 13:43:57 +0100
Message-ID: <ifkj6d$hfl$1@dough.gmane.org>
References: <1293793886.6161.7.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1293793886.6161.7.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] hamlib: fix indentation and whitespace; move `SRC_URI[*sum]` to common place
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
X-List-Received-Date: Fri, 31 Dec 2010 12:44:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

applied, thanks!

On 31-12-10 12:11, Paul Menzel wrote:
> Date: Fri, 31 Dec 2010 12:02:46 +0100
> 
> With this patch using these recipes as templates in the future will not pass on these cosmetic errors.
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  recipes/sdr/hamlib_1.2.10.bb |   10 ++++------
>  recipes/sdr/hamlib_1.2.12.bb |    6 ++----
>  2 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/recipes/sdr/hamlib_1.2.10.bb b/recipes/sdr/hamlib_1.2.10.bb
> index 311eb44..76b8dda 100644
> --- a/recipes/sdr/hamlib_1.2.10.bb
> +++ b/recipes/sdr/hamlib_1.2.10.bb
> @@ -4,6 +4,8 @@ LICENSE = "GPLv2"
>  DEPENDS = "swig-native perl python virtual/libusb0 tcl gnuradio"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/hamlib/hamlib-${PV}.tar.gz"
> +SRC_URI[md5sum] = "29f0d30779a8ffe0444eb523a6ad8344"
> +SRC_URI[sha256sum] = "9b50825666519b0b86469f1988a0de09ce2ffc08fa221f9aa40d18c7b7f6c651"
>  
>  inherit autotools
>  
> @@ -19,8 +21,8 @@ do_compile_prepend() {
>  	for i in $(find ${S} -name "Makefile") ; do
>  		sed -i -e 's:${STAGING_LIBDIR_NATIVE}:${STAGING_LIBDIR}:g' \
>  		       -e s:-L/usr/local/lib::g \
> -			   -e 's:\"$(CC)\":\"${CC}\" LD=\"${LD}\" LDFLAGS=\"${LDFLAGS}\":g' \
> -		       -e s:${STAGING_INCDIR_NATIVE}/python2.6:${STAGING_INCDIR}/python2.6:g $i 
> +		       -e 's:\"$(CC)\":\"${CC}\" LD=\"${LD}\" LDFLAGS=\"${LDFLAGS}\":g' \
> +		       -e s:${STAGING_INCDIR_NATIVE}/python2.6:${STAGING_INCDIR}/python2.6:g $i
>  	done
>  }
>  
> @@ -37,7 +39,3 @@ python populate_packages_prepend () {
>  	do_split_packages(d, hamlib_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'hamlib %s development package', extra_depends='${PN}-dev')
>  	do_split_packages(d, hamlib_libdir, '^lib(.*)\.so\.*', 'lib%s', 'hamlib %s library', extra_depends='', allow_links=True)
>  }
> -
> -
> -SRC_URI[md5sum] = "29f0d30779a8ffe0444eb523a6ad8344"
> -SRC_URI[sha256sum] = "9b50825666519b0b86469f1988a0de09ce2ffc08fa221f9aa40d18c7b7f6c651"
> diff --git a/recipes/sdr/hamlib_1.2.12.bb b/recipes/sdr/hamlib_1.2.12.bb
> index 69e5e6e..f2774bf 100644
> --- a/recipes/sdr/hamlib_1.2.12.bb
> +++ b/recipes/sdr/hamlib_1.2.12.bb
> @@ -17,8 +17,8 @@ do_compile_prepend() {
>  	for i in $(find ${S} -name "Makefile") ; do
>  		sed -i -e 's:${STAGING_LIBDIR_NATIVE}:${STAGING_LIBDIR}:g' \
>  		       -e s:-L/usr/local/lib::g \
> -			   -e 's:\"$(CC)\":\"${CC}\" LD=\"${LD}\" LDFLAGS=\"${LDFLAGS}\":g' \
> -		       -e s:${STAGING_INCDIR_NATIVE}/python2.6:${STAGING_INCDIR}/python2.6:g $i 
> +		       -e 's:\"$(CC)\":\"${CC}\" LD=\"${LD}\" LDFLAGS=\"${LDFLAGS}\":g' \
> +		       -e s:${STAGING_INCDIR_NATIVE}/python2.6:${STAGING_INCDIR}/python2.6:g $i
>  	done
>  }
>  
> @@ -35,5 +35,3 @@ python populate_packages_prepend () {
>  	do_split_packages(d, hamlib_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'hamlib %s development package', extra_depends='${PN}-dev')
>  	do_split_packages(d, hamlib_libdir, '^lib(.*)\.so\.*', 'lib%s', 'hamlib %s library', extra_depends='', allow_links=True)
>  }
> -
> -
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNHdAMMkyGM64RGpERAvJOAJ99Q0G6aBDAsm31BoCEro0a9iJLbwCdEhB6
RaVoVeYESIZxE72vXLSqJ50=
=7TcE
-----END PGP SIGNATURE-----



