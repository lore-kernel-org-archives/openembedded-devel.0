Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OdIWr-0007ot-Ls for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 09:55:19 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OdIWd-0001AN-R2 for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 09:55:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 09:55:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 09:55:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Jul 2010 09:50:59 +0200
Message-ID: <i2jep3$pqe$2@dough.gmane.org>
References: <1280075525-31322-1-git-send-email-fransmeulenbroeks@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <1280075525-31322-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cpan.bbclass: removed legacy staging
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
X-List-Received-Date: Mon, 26 Jul 2010 07:55:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-07-10 18:32, Frans Meulenbroeks wrote:
> bumped PR for the main perl recipes so this change takes effect
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
> 
> removed legacy staging
> 
> as QA compared with the poky version.
> Also build all perl/lib* recipes with it (using perl 5.8.8).
> 5 of these fail:
> ERROR: 'virtual:native:/home/frans/oe/openembedded/recipes/perl/libcurses-perl_1.28.bb' failed
> ERROR: '/home/frans/oe/openembedded/recipes/perl/libcurses-perl_1.28.bb' failed
> ERROR: '/home/frans/oe/openembedded/recipes/perl/libsocket6-perl_0.23.bb' failed
> ERROR: '/home/frans/oe/openembedded/recipes/perl/libdbd-mysql-perl-native_4.010.bb' failed
> ERROR: '/home/frans/oe/openembedded/recipes/perl/libencode-detect-perl_1.01.bb' failed
> However these 5 also failed before making the change.
> These recipes are broken and I did not see an apparent fix
> 
> please ack as this affects all perl cpan recipes.
> 
>  classes/cpan.bbclass        |   15 ++++-----------
>  recipes/perl/perl_5.10.1.bb |    2 +-
>  recipes/perl/perl_5.8.8.bb  |    2 +-
>  3 files changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/classes/cpan.bbclass b/classes/cpan.bbclass
> index dfc0926..24e0c6e 100644
> --- a/classes/cpan.bbclass
> +++ b/classes/cpan.bbclass
> @@ -13,6 +13,8 @@ export PERL_INC = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}/CORE"
>  export PERL_LIB = "${STAGING_DATADIR}/perl/${@get_perl_version(d)}"
>  export PERL_ARCHLIB = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}"
>  
> +NATIVE_INSTALL_WORKS = "1"
> +
>  cpan_do_configure () {
>  	yes '' | perl Makefile.PL ${EXTRA_CPANFLAGS}
>  	if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
> @@ -31,16 +33,7 @@ cpan_do_compile () {
>  }
>  
>  cpan_do_install () {
> -	if [ ${@is_target(d)} = "yes" ]; then
> -		oe_runmake install_vendor
> -	fi
> -}
> -
> -cpan_do_stage () {
> -	if [ ${@is_target(d)} = "no" ]; then
> -		oe_runmake install_vendor
> -	fi
> +	oe_runmake DESTDIR="${D}" install_vendor
>  }
> -								
>  
> -EXPORT_FUNCTIONS do_configure do_compile do_install do_stage
> +EXPORT_FUNCTIONS do_configure do_compile do_install
> diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
> index 86b08dc..e7c90d8 100644
> --- a/recipes/perl/perl_5.10.1.bb
> +++ b/recipes/perl/perl_5.10.1.bb
> @@ -5,7 +5,7 @@ LICENSE = "Artistic|GPL"
>  PRIORITY = "optional"
>  # We need gnugrep (for -I)
>  DEPENDS = "virtual/db perl-native grep-native"
> -PR = "r7"
> +PR = "r8"
>  
>  # Not tested enough
>  DEFAULT_PREFERENCE = "-1"
> diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
> index c73fe4e..29ae66c 100644
> --- a/recipes/perl/perl_5.8.8.bb
> +++ b/recipes/perl/perl_5.8.8.bb
> @@ -5,7 +5,7 @@ LICENSE = "Artistic|GPL"
>  PRIORITY = "optional"
>  # We need gnugrep (for -I)
>  DEPENDS = "virtual/db perl-native grep-native"
> -PR = "r34"
> +PR = "r35"
>  
>  # Major part of version
>  PVM = "5.8"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMTT5jMkyGM64RGpERAmVFAJ0X3198XhL9ReCP0qWglOSu6rB4dgCghdOX
1sUnckvbCx8xrX63kAMRCYM=
=ZPjp
-----END PGP SIGNATURE-----



