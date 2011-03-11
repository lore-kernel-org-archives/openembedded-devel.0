Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PxxUu-00068B-FH
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 09:14:56 +0100
Received: by yia13 with SMTP id 13so1070143yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 00:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=0pLok5c8E/GGkHablfcKd4vgHrdwm5dtdugcT6R3Y1M=;
	b=vSb8l2rXV+zL3agDBUMK7s0bok60Vlm9fjEU5WWPswCttA1dTosAY+mSnK397s4CEn
	DCVuTLH9OfFQkwSH8/MSVcsoGFp8TjasHnaAK2GWJG74AYuK+ByAidi8/aThQVlyQITx
	ILwX7qJPHNv0/SsVJ2mOvvIIMBJCJ8zzM3KZw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=UA5V19DFZB53Yjf67mbdlsVw6h4xFt04RyLOZuOK4hyjZ4eu+beOy0aI1uRfw8Pu53
	YigjV5Cuq6nIRe6qph/ocNmfl3jb1Ck5TGvkIyHDRFRo2MJTFzaF9AozbMIfinH3ZKAc
	aGey+l3gdVtFuAVaOvUztRcOZrCQ9D5dTID+g=
Received: by 10.101.112.11 with SMTP id p11mr869276anm.106.1299831198384;
	Fri, 11 Mar 2011 00:13:18 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id u13sm5055422ank.23.2011.03.11.00.13.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 00:13:17 -0800 (PST)
Date: Fri, 11 Mar 2011 00:13:40 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110311081340.GD2478@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1299762656-4872-1-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1299762656-4872-1-git-send-email-GNUtoo@no-log.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] autoconf.inc: check if files exist before using sed on them
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
X-List-Received-Date: Fri, 11 Mar 2011 08:14:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/03/11 14:10), Denis 'GNUtoo' Carikli wrote:
> Without the that fix we have
>   | + sed -i '-es,^SUBDIRS = .*,SUBDIRS = bin . lib,' .../work/x86_64-linux/autoconf213-native-2.13-r14.0/autoconf-2.13/Makefile.am
>   | sed: can't read .../work/x86_64-linux/autoconf213-native-2.13-r14.0/autoconf-2.13/Makefile.am: No such file or directory
> and:
>   | + sed -i -e '1s:#!.*:#! /usr/bin/env perl:' '.../work/x86_64-linux/autoconf213-native-2.13-r14.0/autoconf-2.13/bin/*.in'
>   | sed: can't read .../work/x86_64-linux/autoconf213-native-2.13-r14.0/autoconf-2.13/bin/*.in: No such file or directory
>   NOTE: package autoconf213-native-2.13-r14.0: task do_configure: Failed
> 
> Thanks a lot for all help in #oe on Freenode on irc for telling me
>   which command to use for the *.in at the end pb__ found the best command:
> <pb__> or ls ${S} | grep -q '\.in$'
> 
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Did you do a build from scratch ? This change might impact other autconf
recipes besids autoconf213-native.

> ---
>  recipes/autoconf/autoconf.inc |   14 ++++++++++----
>  1 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/autoconf/autoconf.inc b/recipes/autoconf/autoconf.inc
> index 7f22c2b..e0eecd3 100644
> --- a/recipes/autoconf/autoconf.inc
> +++ b/recipes/autoconf/autoconf.inc
> @@ -8,7 +8,7 @@ RDEPENDS_${PN} = "m4 perl gnu-config"
>  DEPENDS_virtclass-native = "m4-native gnu-config-native perl-native"
>  RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native perl-native"
>  
> -INC_PR = "r13"
> +INC_PR = "r14"
>  
>  SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2;name=autoconf \
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


