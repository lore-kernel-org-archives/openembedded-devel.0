Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LuAlD-0002Jm-4H
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 21:27:05 +0200
Received: by rv-out-0708.google.com with SMTP id b17so43589rvf.0
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 12:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=tuNkDMVUc+JQ1KgBxNVNXQzxVYVLBnwiikVGEKXfT4s=;
	b=mjUPQMBG71n+6W1RwduCE8APXyiC6JP0g/SZLGF3uXLHfjOKh4XN7EHkNj1jBGw3SF
	RpDtomSeJ8Gna7RRJH4Yo2ZTrqzudJzFrmrHxPkiOdxvU8gMyiAD7T6U9bwnBGUq2Xa0
	8XLykSTdoiT8aePlk4Lrh9mVW5BQaoF0Ev/j4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=m1992EmqPBrA8QFl3JQmGtdRTXJEhJ/xb/OcYKZrIg85XQXxQTb8eM6aJ3h8Yj2a5x
	77oHNKdpC0Bp+ZAFHTBezi1vTLKGncB8zWwkcphq4qEvfOJ9ODzRrQ3O9OJ8rEymFYOT
	1h4In1lOFVKGDkDfz3N+Fg+2MYQDyc8If8wJ0=
Received: by 10.114.154.1 with SMTP id b1mr241403wae.77.1239823394112;
	Wed, 15 Apr 2009 12:23:14 -0700 (PDT)
Received: from gmail.com (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id m34sm143196waf.36.2009.04.15.12.23.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Apr 2009 12:23:13 -0700 (PDT)
Date: Wed, 15 Apr 2009 12:23:10 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090415192310.GB29623@gmail.com>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-1-git-send-email-khimov@altell.ru>
	<1239798960-3586-2-git-send-email-khimov@altell.ru>
	<1239798960-3586-3-git-send-email-khimov@altell.ru>
	<1239798960-3586-4-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1239798960-3586-4-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
X-SA-Exim-Connect-IP: 209.85.198.245
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 04/11] gcc 4.2.4: add gcc-multilib64dir.patch
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
X-List-Received-Date: Wed, 15 Apr 2009 19:27:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/04/09 16:35), Roman I Khimov wrote:
> ---
>  recipes/gcc/files/gcc-multilib64dir.patch |   43 +++++++++++++++++++++++++++++
>  recipes/gcc/gcc-4.2.4.inc                 |    1 +
>  2 files changed, 44 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/gcc/files/gcc-multilib64dir.patch
> 
> diff --git a/recipes/gcc/files/gcc-multilib64dir.patch b/recipes/gcc/files/gcc-multilib64dir.patch
> new file mode 100644
> index 0000000..301e596
> --- /dev/null
> +++ b/recipes/gcc/files/gcc-multilib64dir.patch
> @@ -0,0 +1,43 @@
> +#! /bin/sh -e
> +
> +# DP: Use lib instead of lib64 as multilibdir on amd64 and ppc64.
> +#
> +# Taken from Debian, fixed to apply with quilt
> +
> +Index: gcc/config/i386/t-linux64
> +===================================================================
> +--- gcc/config/i386/t-linux64	(revision 130706)
> ++++ gcc/config/i386/t-linux64	(working copy)
> +@@ -13,7 +13,7 @@
> + 
> + MULTILIB_OPTIONS = m64/m32
> + MULTILIB_DIRNAMES = 64 32 
> +-MULTILIB_OSDIRNAMES = ../lib64 $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
> ++MULTILIB_OSDIRNAMES = ../lib $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
> + 
> + LIBGCC = stmp-multilib
> + INSTALL_LIBGCC = install-multilib
> +Index: gcc/config/rs6000/t-linux64
> +===================================================================
> +--- gcc/config/rs6000/t-linux64	(revision 130706)
> ++++ gcc/config/rs6000/t-linux64	(working copy)
> +@@ -14,13 +14,13 @@
> + # it doesn't tell anything about the 32bit libraries on those systems.  Set
> + # MULTILIB_OSDIRNAMES according to what is found on the target.
> + 
> +-MULTILIB_OPTIONS        = m64/m32 msoft-float
> +-MULTILIB_DIRNAMES       = 64 32 nof
> ++MULTILIB_OPTIONS        = m64/m32
> ++MULTILIB_DIRNAMES       = 64 32
> + MULTILIB_EXTRA_OPTS     = fPIC mstrict-align
> +-MULTILIB_EXCEPTIONS     = m64/msoft-float
> +-MULTILIB_EXCLUSIONS     = m64/!m32/msoft-float
> +-MULTILIB_OSDIRNAMES	= ../lib64 $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib) nof
> +-MULTILIB_MATCHES        = $(MULTILIB_MATCHES_FLOAT)
> ++MULTILIB_EXCEPTIONS     =
> ++MULTILIB_EXCLUSIONS     =
> ++MULTILIB_OSDIRNAMES	= ../lib $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
> ++MULTILIB_MATCHES        =
> + 
> + softfp_wrap_start := '\#ifndef __powerpc64__'
> + softfp_wrap_end := '\#endif'
> diff --git a/recipes/gcc/gcc-4.2.4.inc b/recipes/gcc/gcc-4.2.4.inc
> index 085f241..20bdfef 100644
> --- a/recipes/gcc/gcc-4.2.4.inc
> +++ b/recipes/gcc/gcc-4.2.4.inc
> @@ -37,6 +37,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://gcc-4.0.2-e300c2c3.patch;patch=1 \
>  	file://fortran-static-linking.patch;patch=1 \
>  	file://intermask-bigendian.patch;patch=1 \
> +	file://gcc-multilib64dir.patch;patch=1;pnum=0 \
>  "
>  
>  SRC_URI_append_ep93xx = " \


which multilib are you chosing as default? if it is 64 bit then the
patch is ok.

> -- 
> 1.6.2.1
> 
> 
> -- 
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


