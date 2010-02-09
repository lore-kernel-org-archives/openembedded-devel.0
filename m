Received: from mail-bw0-f215.google.com ([209.85.218.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NexNE-0007pR-MD
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 22:12:00 +0100
Received: by bwz7 with SMTP id 7so2347517bwz.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 13:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=dI492R/ZE09PmJTIYgVGGb+ctLszMdBZ6YG+LqSrd+g=;
	b=Js1g09AOP5/4P+xWfTDi1eBvRS+ahneZELwJUmEBPmSCugB8T1yZNIZKg5vYgLvOUf
	4h5omgAZE4ZXkXWIQxlr4KOxc/KbOqMHVtlfim8fECjAjlIi9AB+DsfSobsjYeAJB7ZC
	SmNyOJfk+0/E9XrqW0H8nDmQSGGiERgS+5S7M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=EGfUy64Cars0oI1Jdkjc1wFgx6bo/I+aUxhBh+sq/j/eCtphzyoYGdVkq0S7tDNhYU
	rLFW7lM3PkSlsnmQZYmycr/3m8P86zo5xYAQMeosVWItLXT9Sx+62Kmdj7+UZrr5fgts
	QIosAOZ35+/nRO6iffsSxztqrB11eiw2ks8Q0=
Received: by 10.204.33.196 with SMTP id i4mr4185196bkd.155.1265749763020;
	Tue, 09 Feb 2010 13:09:23 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 13sm245490bwz.10.2010.02.09.13.09.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 09 Feb 2010 13:09:21 -0800 (PST)
Date: Tue, 9 Feb 2010 13:09:15 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100209210915.GC3142@gmail.com>
References: <1265737098-5430-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <1265737098-5430-1-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.215
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/3] glibc 2.5: do not use asm/page.h header (taken from glibc 2.6.1)
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
X-List-Received-Date: Tue, 09 Feb 2010 21:12:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (09/02/10 18:38), Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/glibc/glibc_2.5.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/glibc/glibc_2.5.bb b/recipes/glibc/glibc_2.5.bb
> index 6792c58..56e7745 100644
> --- a/recipes/glibc/glibc_2.5.bb
> +++ b/recipes/glibc/glibc_2.5.bb
> @@ -1,5 +1,5 @@
>  require glibc.inc
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  ARM_INSTRUCTION_SET = "arm"
>  
> @@ -49,6 +49,7 @@ SRC_URI = "\
>    file://zecke-sane-readelf.patch;patch=1 \
>    file://ldd-unbash.patch;patch=1 \
>    file://glibc-2.6.1-use-short-for-fnstsw.patch;patch=1 \
> +  file://glibc-arm-no-asm-page.patch;patch=1 \
>    file://generic-bits_select.h \
>    file://generic-bits_types.h \
>    file://generic-bits_typesizes.h \
> -- 
> 1.6.6.1
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


