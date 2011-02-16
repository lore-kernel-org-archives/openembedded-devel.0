Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpprA-00025p-46
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 23:28:20 +0100
Received: by gyd8 with SMTP id 8so826894gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 14:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=/9NX0m4S4xLCX0N56gXqcZrxFyYP7tq0098lyZEamn8=;
	b=ppiD+eAXe4uSgVxgxot/2gJ/HlKLLZycVSgI+mrg6Bx7vUnGoCbh0gKKSJ+Ke2O0nI
	+RGgqkp3Xg8h2Ai4hlz+VS8xXaBI/e5HYbrJLa76HoqmyB3655xJ2O8k8eQjHuzSMzrv
	0WzXj4OfYIw7yyvWjiX3UxbwjkMWPAUDA0tLI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=VVsQl35tVtU0fWfYiM0aR0E8ou6gfNBksmGAagrHBBelENKsvMAiH0//CGlEXDsuw5
	5RTEUIugPjSXmGuV2BUzYZRI14ZvcYr3Fw2EY3rPZRHrno/Yt8RmoKoO/YgkWILM6A1m
	qB6pYWCIC+3miPb3eSSIFFTj0QJcoWxDAIc/0=
Received: by 10.90.187.7 with SMTP id k7mr1465957agf.20.1297895226298;
	Wed, 16 Feb 2011 14:27:06 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 35sm261759ano.31.2011.02.16.14.27.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 14:27:05 -0800 (PST)
Date: Wed, 16 Feb 2011 14:27:07 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216222707.GF14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Chris Larson <chris_larson@mentor.com>
References: <1297894063-27374-1-git-send-email-kergoth@gmail.com>
	<1297894063-27374-4-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1297894063-27374-4-git-send-email-kergoth@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 4/4] autotools: avoid special casing autoconf/automake/help2man
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
X-List-Received-Date: Wed, 16 Feb 2011 22:28:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/02/11 15:07), Chris Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> Signed-off-by: Chris Larson <chris_larson@mentor.com>

we need to document INHIBIT_AUTOTOOLS_BOOTSTRAP

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  classes/autotools.bbclass           |    6 +-----
>  recipes/autoconf/autoconf.inc       |    3 ++-
>  recipes/automake/automake.inc       |    4 +---
>  recipes/help2man/help2man_1.36.4.bb |    6 +-----
>  recipes/help2man/help2man_1.38.2.bb |    6 +-----
>  5 files changed, 6 insertions(+), 19 deletions(-)
> 
> diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
> index dd52e03..eaeca7f 100644
> --- a/classes/autotools.bbclass
> +++ b/classes/autotools.bbclass
> @@ -13,13 +13,9 @@ def autotools_deps(d):
>      if oe.data.typed_value('INHIBIT_AUTOTOOLS_BOOTSTRAP', d):
>          return deps
>  
> -    pn = bb.data.getVar('PN', d, 1)
> -    if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
> -        return deps
> -
>      deps += ' autoconf-native automake-native help2man-native'
>  
> -    if pn not in ['libtool', 'libtool-native', 'libtool-cross']:
> +    if d.getVar('BPN', True) != 'libtool':
>          deps += ' libtool-native'
>          if (not oe.utils.inherits(d, 'native', 'nativesdk', 'cross',
>                                    'sdk') and
> diff --git a/recipes/autoconf/autoconf.inc b/recipes/autoconf/autoconf.inc
> index 7f22c2b..d13b61e 100644
> --- a/recipes/autoconf/autoconf.inc
> +++ b/recipes/autoconf/autoconf.inc
> @@ -5,8 +5,9 @@ HOMEPAGE = "http://www.gnu.org/software/autoconf/"
>  SECTION = "devel"
>  DEPENDS += "m4-native perl-native"
>  RDEPENDS_${PN} = "m4 perl gnu-config"
> -DEPENDS_virtclass-native = "m4-native gnu-config-native perl-native"
> +DEPENDS_virtclass-native = "m4-native perl-native"
>  RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native perl-native"
> +INHIBIT_AUTOTOOLS_BOOTSTRAP_virtclass-native = "true"
>  
>  INC_PR = "r13"
>  
> diff --git a/recipes/automake/automake.inc b/recipes/automake/automake.inc
> index de4df34..6ed21cd 100644
> --- a/recipes/automake/automake.inc
> +++ b/recipes/automake/automake.inc
> @@ -28,6 +28,7 @@ RDEPENDS_automake += "\
>      perl-module-strict \
>      perl-module-text-parsewords \
>      perl-module-vars "
> +INHIBIT_AUTOTOOLS_BOOTSTRAP_virtclass-native = "true"
>  SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2;name=automake"
>  INC_PR = "r4"
>  AUTOMAKE_API = "${@".".join(bb.data.getVar("PV",d,1).split(".")[0:2])}"
> @@ -36,9 +37,6 @@ inherit autotools
>  
>  FILES_${PN} += "${datadir}/automake* ${datadir}/aclocal*"
>  
> -do_configure_append() {
> -}
> -
>  do_install_append () {
>  	autotools_do_install
>  	# replace paths to STAGING_BINDIR_NATIVE/perl with ${bindir}/perl
> diff --git a/recipes/help2man/help2man_1.36.4.bb b/recipes/help2man/help2man_1.36.4.bb
> index 8cb5530..8cd4475 100644
> --- a/recipes/help2man/help2man_1.36.4.bb
> +++ b/recipes/help2man/help2man_1.36.4.bb
> @@ -5,6 +5,7 @@ LICENSE     = "GPLv2"
>  DEPENDS     = "gettext-native perl-native liblocale-gettext-perl-native"
>  DEPENDS_virtclass-native = "perl-native autoconf-native automake-native"
>  RDEPENDS_${PN}    = "gettext perl liblocale-gettext-perl"
> +INHIBIT_AUTOTOOLS_BOOTSTRAP = "true"
>  
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  
> @@ -16,11 +17,6 @@ BBCLASSEXTEND = "native"
>  
>  PR = "r3"
>  
> -# We don't want to reconfigure things
> -do_configure() {
> -	oe_runconf
> -}
> -
>  do_install_append () {
>  	# Make sure we use /usr/bin/env perl
>  	sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${D}${bindir}/help2man
> diff --git a/recipes/help2man/help2man_1.38.2.bb b/recipes/help2man/help2man_1.38.2.bb
> index ab06186..795bad6 100644
> --- a/recipes/help2man/help2man_1.38.2.bb
> +++ b/recipes/help2man/help2man_1.38.2.bb
> @@ -5,6 +5,7 @@ DEPENDS = "gettext-native perl-native liblocale-gettext-perl-native"
>  DEPENDS_virtclass-native = "perl-native autoconf-native automake-native"
>  RDEPENDS_${PN} = "gettext perl liblocale-gettext-perl"
>  RDEPENDS_${PN}_virtclass-native = ""
> +INHIBIT_AUTOTOOLS_BOOTSTRAP = "true"
>  PR = "r2"
>  
>  SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
> @@ -18,11 +19,6 @@ EXTRA_OECONF = "--disable-nls"
>  
>  BBCLASSEXTEND = "native"
>  
> -# We don't want to reconfigure things
> -do_configure() {
> -	oe_runconf
> -}
> -
>  do_install_append () {
>  	# Make sure we use /usr/bin/env perl
>  	sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${D}${bindir}/help2man
> -- 
> 1.7.2.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


