Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LytkO-0005J2-Lw
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 22:17:45 +0200
Received: by rv-out-0708.google.com with SMTP id f25so533092rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 13:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=gFdlvNu2GcZznZu6hCdeg2FhKInG/j3asMY1v1T17FY=;
	b=ivTQk++3ylZn0dYJ/GpONBOjIjF/jdu1m0Wld1z4jyP8ENLAP1mokS3sLwmxbpfSd0
	w2zhgL5QjivcZAQqJRsy0I7uFL5J4iMqzab/6oMwZ56XOKD38w6sJmCEcNuLalFmun+u
	im6ZCF4xtqxSnPRC9ElO28oFYREZGuTTapEaY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=AgMGda81WXhN19+YGoEWN7b5WNGdx62GPtUpBdDEGZt2y118xkP6+kFhq6QDUotwQF
	t0vILzArz5M2AJ63//nmxlqFgZQe5uFYcNonGYF4uvSuiR8p0xN/MGAMBXk9X4tc2ZZ+
	KNcxiTTT4u4cBSnVeALXqIAN51pEIxnqMzIrA=
Received: by 10.114.195.19 with SMTP id s19mr3648461waf.10.1240949553280;
	Tue, 28 Apr 2009 13:12:33 -0700 (PDT)
Received: from gmail.com (adsl-71-146-25-44.dsl.pltn13.sbcglobal.net
	[71.146.25.44])
	by mx.google.com with ESMTPS id j34sm218783waf.48.2009.04.28.13.12.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 28 Apr 2009 13:12:32 -0700 (PDT)
Date: Tue, 28 Apr 2009 13:12:28 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090428201228.GC26082@gmail.com>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-2-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-5-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-6-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-7-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-8-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-9-git-send-email-trini@kernel.crashing.org>
MIME-Version: 1.0
In-Reply-To: <1240589520-1104-9-git-send-email-trini@kernel.crashing.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [PATCH][STABLE] gcc-canadian-sdk: Fix C++ relocation, add	SYSROOT, use SDK_REALPATH_MINGW, bump PR.
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
X-List-Received-Date: Tue, 28 Apr 2009 20:17:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/04/09 09:11), Tom Rini wrote:
> From: Tom Rini <trini@embeddedalley.com>
> 
> 
> Signed-off-by: Tom Rini <trini@embeddedalley.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/gcc/gcc-canadian-sdk_4.2.4.bb      |    2 +-
>  recipes/gcc/gcc-configure-canadian-sdk.inc |    7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/gcc/gcc-canadian-sdk_4.2.4.bb b/recipes/gcc/gcc-canadian-sdk_4.2.4.bb
> index ae3245b..d78ab75 100644
> --- a/recipes/gcc/gcc-canadian-sdk_4.2.4.bb
> +++ b/recipes/gcc/gcc-canadian-sdk_4.2.4.bb
> @@ -1,6 +1,6 @@
>  inherit canadian-sdk
>  
> -PR = "r1"
> +PR = "r2"
>  
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gcc-${PV}"
>  
> diff --git a/recipes/gcc/gcc-configure-canadian-sdk.inc b/recipes/gcc/gcc-configure-canadian-sdk.inc
> index c95a6c4..738b120 100644
> --- a/recipes/gcc/gcc-configure-canadian-sdk.inc
> +++ b/recipes/gcc/gcc-configure-canadian-sdk.inc
> @@ -61,11 +61,12 @@ export WINDRES_FOR_TARGET="${TARGET_PREFIX}windres"
>  EXTRA_OECONF_DEP ?= ""
>  
>  EXTRA_OECONF += ""
> +# On MinGW hosts we want to prepend a drive letter, in ${SDK_REALPATH_MINGW}
> +# to the sysroot path.
> +SYSROOT = "${@['${SDK_REALPATH}/${TARGET_SYS}', '${SDK_REALPATH_MINGW}${SDK_REALPATH}/${TARGET_SYS}'][bb.data.getVar('SDK_OS', d, 1) in ['mingw32', 'mingw64']]}"
>  EXTRA_OECONF_PATHS = " \
> -	--with-local-prefix=$dollar{prefix}/local \
> -	--with-gxx-include-dir=$dollar{prefix}/${TARGET_SYS}/usr/include/c++/${BINV} \
>  	--with-build-sysroot=${STAGING_DIR_TARGET} \
> -	--with-sysroot=${SDK_REALPATH}/${TARGET_SYS} \
> +	--with-sysroot=${SYSROOT} \
>  "
>  
>  do_configure () {
> -- 
> 1.5.6.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


