Received: from ns.awellconnected.net ([83.167.180.132]
	helo=edison.awellconnected.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas@htc-linux.org>) id 1PyWeu-0008Tu-SN
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 22:47:37 +0100
Received: from ip-80-226-0-1.vodafone-net.de ([80.226.0.1] helo=[10.225.81.7])
	by edison.awellconnected.net with esmtp (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1PyWdF-0002yd-1h
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 21:45:53 +0000
From: Lukas-David Gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1299936162.3518.7.camel@computer>
References: <1299933388.3518.2.camel@computer>
	<1299936162.3518.7.camel@computer>
Date: Sat, 12 Mar 2011 22:45:48 +0100
Message-ID: <1299966348.1322.3.camel@computer>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: autoconf213: do_configure fails
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
X-List-Received-Date: Sat, 12 Mar 2011 21:47:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Samstag, den 12.03.2011, 14:22 +0100 schrieb Lukas-David Gorris: 
> Am Samstag, den 12.03.2011, 13:36 +0100 schrieb Lukas-David Gorris:
> 

> I am doing such a clean build now (with new tmpdir) and will update
> about the results.
> 
> Denis' patch:
> 
> diff --git a/recipes/autoconf/autoconf.inc
> b/recipes/autoconf/autoconf.inc
> index 7f22c2b..e0eecd3 100644
> --- a/recipes/autoconf/autoconf.inc
> +++ b/recipes/autoconf/autoconf.inc
> @@ -8,7 +8,7 @@ RDEPENDS_${PN} = "m4 perl gnu-config"
>  DEPENDS_virtclass-native = "m4-native gnu-config-native perl-native"
>  RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native
> perl-native"
>  
> -INC_PR = "r13"
> +INC_PR = "r14"
>  
>  SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2;name=autoconf
> \
>  	   file://program_prefix.patch"
> @@ -25,13 +25,19 @@ do_configure_prepend () {
>  		export ac_cv_path_M4="${ac_cv_path_M4=${bindir}/m4}"
>  		export ac_cv_prog_gnu_m4="${ac_cv_prog_gnu_m4=yes}"
>  	fi
> -
> -	sed -i -e's,^SUBDIRS = .*,SUBDIRS = ${SUBDIRS},' ${S}/Makefile.am
> +	if [ -e ${S}/Makefile.am ]
> +	then
> +		sed -i -e's,^SUBDIRS = .*,SUBDIRS = ${SUBDIRS},' ${S}/Makefile.am
> +	fi
>  }
>  
>  do_configure_append() {
>  	# replace paths to STAGING_BINDIR_NATIVE/perl with ${bindir}/perl
> -	sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${S}/bin/*.in
> +	ls ${S} | grep -q '\.in$'
> +	if [ $? -eq 0 ]
> +	then
> +		sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${S}/bin/*.in
> +	fi
>  }
>  
>  PARALLEL_MAKE = ""

Ok I rebuilt from scratch with that patch. Turns out it doesn't affect
other autoconf versions:  recipes/autoconf/autoconf_2.65.bb builds
fine. 
But it doesn't fix autoconf213 and autoconf213-native . It will still
fail, now with following error:

| + sed -i -e '1s:#!.*:#! /usr/bin/env perl:'
'/home/luke/linux/openembedded/tmp/work/armv7a-oe-linux-gnueabi/autoconf213-2.13-r14.0/autoconf-2.13/bin/*.in'
| sed: can't
read /home/luke/linux/openembedded/tmp/work/armv7a-oe-linux-gnueabi/autoconf213-2.13-r14.0/autoconf-2.13/bin/*.in: No such file or directory

The problem is autoconf213 lacks Makefile.in (all other autoconf recipes
in OE have it).
Any sed magicians who know how to solve this ?

Best,

Lukas



