Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LytqK-0002ae-Fb
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 22:23:52 +0200
Received: by rv-out-0708.google.com with SMTP id f25so534972rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 13:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=kLJ1bYZMW7kbL1FIBkyYONfTILAqrLIETmUyK9hdeas=;
	b=bd5d2Mz9i+fDqkinI05rDzASl/gMfcY2gHrLe8+TAu3j+yrn+BZbOSKvMAQhQB1zmp
	WbpavMg00WaoyuJAsIU3uFbLEkn0PGxgBFZfMrlFmWhVeWhsK5ZlrEh8NreTOkKIgp8U
	5oX67rZQGydrSNEbVSxY+5wZcSJqMpxTsEBJo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ButehKHHoM6LNNlG7Y+v1wVCv84twClA7gystFI8PbfSyi10dSn2JleMBi0TiAHM5T
	UwOzQKIcmudU3ryyweXmcSEL232MAbIVk6OmBXwnJ9N/kwAC7VsEsiD0dFJsQxWIEH0E
	+KnfQbuyhg+VZ7I6QOVUCjksuFwIQ8OTRwE88=
Received: by 10.142.212.21 with SMTP id k21mr1491581wfg.125.1240949920979;
	Tue, 28 Apr 2009 13:18:40 -0700 (PDT)
Received: from gmail.com (adsl-71-146-25-44.dsl.pltn13.sbcglobal.net
	[71.146.25.44])
	by mx.google.com with ESMTPS id 30sm428280wfa.35.2009.04.28.13.18.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 28 Apr 2009 13:18:36 -0700 (PDT)
Date: Tue, 28 Apr 2009 13:18:29 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090428201829.GF26082@gmail.com>
References: <1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-5-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-6-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-7-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-8-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-9-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-10-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-11-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-12-git-send-email-trini@kernel.crashing.org>
MIME-Version: 1.0
In-Reply-To: <1240589520-1104-12-git-send-email-trini@kernel.crashing.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [PATCH][STABLE] mingw-gcc, mingw-runtime, mingw-w32api:	Fix DEFAULT_PREFERENCES to be correct
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
X-List-Received-Date: Tue, 28 Apr 2009 20:23:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/04/09 09:11), Tom Rini wrote:
> From: Tom Rini <trini@embeddedalley.com>
> 
> 
> Signed-off-by: Tom Rini <trini@embeddedalley.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/gcc/mingw-gcc_3.4.5-20060117-2.bb |    4 ++--
>  recipes/mingw/mingw-runtime.inc           |    4 ++--
>  recipes/mingw/mingw-w32api.inc            |    4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes/gcc/mingw-gcc_3.4.5-20060117-2.bb b/recipes/gcc/mingw-gcc_3.4.5-20060117-2.bb
> index 22f9170..fd45e9f 100644
> --- a/recipes/gcc/mingw-gcc_3.4.5-20060117-2.bb
> +++ b/recipes/gcc/mingw-gcc_3.4.5-20060117-2.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "http://www.mingw.org/"
>  SECTION = "devel"
>  LICENSE = "GPL"
>  
> -DEFAULT_PREFERENCE = "0"
> -DEFAULT_PREFERENCE_sdk-mingw32 = "1"
> +DEFAULT_PREFERENCE = "-1"
> +DEFAULT_PREFERENCE_mingw32 = "1"
>  
>  inherit autotools gettext
>  
> diff --git a/recipes/mingw/mingw-runtime.inc b/recipes/mingw/mingw-runtime.inc
> index d984911..5820e99 100644
> --- a/recipes/mingw/mingw-runtime.inc
> +++ b/recipes/mingw/mingw-runtime.inc
> @@ -5,8 +5,8 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial mingw-w32api"
>  
>  PROVIDES = "virtual/${TARGET_PREFIX}libc virtual/${TARGET_PREFIX}libc-for-gcc"
>  
> -DEFAULT_PREFERENCE = "0"
> -DEFAULT_PREFERENCE_sdk-mingw32 = "1"
> +DEFAULT_PREFERENCE = "-1"
> +DEFAULT_PREFERENCE_mingw32 = "1"
>  
>  PACKAGES = ""
>  
> diff --git a/recipes/mingw/mingw-w32api.inc b/recipes/mingw/mingw-w32api.inc
> index ecb1cd2..ac2ede9 100644
> --- a/recipes/mingw/mingw-w32api.inc
> +++ b/recipes/mingw/mingw-w32api.inc
> @@ -5,8 +5,8 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial"
>  
>  PROVIDES = "mingw-w32api"
>  
> -DEFAULT_PREFERENCE = "0"
> -DEFAULT_PREFERENCE_sdk-mingw32 = "1"
> +DEFAULT_PREFERENCE = "-1"
> +DEFAULT_PREFERENCE_mingw32 = "1"
>  
>  PACKAGES = ""
>  
> -- 
> 1.5.6.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


