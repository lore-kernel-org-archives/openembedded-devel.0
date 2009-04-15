Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LuAqc-0002ch-Eh
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 21:32:40 +0200
Received: by rv-out-0708.google.com with SMTP id b17so45339rvf.0
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 12:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=LSmy4ir5pAGmoyuedKdxdYrFH2KVlF3PpzpSwzUpx4c=;
	b=icqffmksxNidrpaiOqVKDZrW91YTGOKxlpyd9WP5jAnxT1UxugcXKvFkWWnMFtN1Ir
	iGnjgOPzoiOn+XfnRP/QVvKp1Ro5+h+PeytNrs5/yED9twzcc5jwkOypdFBWv3lCSaFb
	SXJLL3TIU76dQXBd4KaZpoDplv33d5qWuLxEY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=RfJ0FPw+phDs2149hYY6t+zztmra6Tjf+kkA2/2MqhXr4Gc7t4YcRn1f5q9a+JpgNy
	+aG9kmPK5NmJRjqARf3FLQRaZGAuX3RVS8Shj9F6T6cEMfEuyk8tD14lQ9CWpnnJAqmp
	O0L2L0a6z3/dHVizDYtQsn/vpJwXDwcKv+JTQ=
Received: by 10.142.166.7 with SMTP id o7mr187473wfe.270.1239823729405;
	Wed, 15 Apr 2009 12:28:49 -0700 (PDT)
Received: from gmail.com (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id 29sm434428wfg.33.2009.04.15.12.28.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Apr 2009 12:28:48 -0700 (PDT)
Date: Wed, 15 Apr 2009 12:28:45 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090415192845.GD29623@gmail.com>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-1-git-send-email-khimov@altell.ru>
	<1239798960-3586-2-git-send-email-khimov@altell.ru>
	<1239798960-3586-3-git-send-email-khimov@altell.ru>
	<1239798960-3586-4-git-send-email-khimov@altell.ru>
	<1239798960-3586-5-git-send-email-khimov@altell.ru>
	<1239798960-3586-6-git-send-email-khimov@altell.ru>
	<1239798960-3586-7-git-send-email-khimov@altell.ru>
	<1239798960-3586-8-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1239798960-3586-8-git-send-email-khimov@altell.ru>
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
Subject: Re: [PATCH 08/11] glibc: move get_glibc_fpu_setting to	glibc.inc
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
X-List-Received-Date: Wed, 15 Apr 2009 19:32:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/04/09 16:35), Roman I Khimov wrote:
> ---
>  recipes/glibc/glibc-package.bbclass |    5 -----
>  recipes/glibc/glibc.inc             |    5 +++++
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
> index 89fbd1c..1690a30 100644
> --- a/recipes/glibc/glibc-package.bbclass
> +++ b/recipes/glibc/glibc-package.bbclass
> @@ -58,11 +58,6 @@ DESCRIPTION_ldd = "glibc: print shared library dependencies"
>  DESCRIPTION_localedef = "glibc: compile locale definition files"
>  DESCRIPTION_glibc-utils = "glibc: misc utilities like iconf, local, gencat, tzselect, rpcinfo, ..."
>  
> -def get_glibc_fpu_setting(bb, d):
> -    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
> -        return "--without-fp"
> -    return ""
> -
>  EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
>  
>  OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
> diff --git a/recipes/glibc/glibc.inc b/recipes/glibc/glibc.inc
> index c2ee531..1bdd62b 100644
> --- a/recipes/glibc/glibc.inc
> +++ b/recipes/glibc/glibc.inc
> @@ -17,6 +17,11 @@ LEAD_SONAME = "libc.so"
>  GLIBC_EXTRA_OECONF ?= ""
>  INHIBIT_DEFAULT_DEPS = "1"
>  
> +def get_glibc_fpu_setting(bb, d):
> +	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
> +		return "--without-fp"
> +	return ""
> +
>  ARM_INSTRUCTION_SET = "arm"
>  
>  PACKAGES = "glibc catchsegv sln nscd ldd localedef glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
> -- 

why is this patch required. Can you also do multilib stuff for eglibc
too
 

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


