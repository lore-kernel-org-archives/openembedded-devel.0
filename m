Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LuAXx-0005BQ-8a
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 21:13:26 +0200
Received: by rv-out-0708.google.com with SMTP id b17so39207rvf.0
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 12:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=oIiVehnIfFSf1ytmizeK9f/iYaACqtz5D/+W9si7f+0=;
	b=elchesFCsNPYwxo8fTwwXTM8qdNAh78nntB9QH/k56y6h1WRxEY1d8AVMsCfu32+7a
	kyrFmCSPwNXs7CxbiCATd5a7+iomD5vQi4hp3K5tsieTJEj28rEqGlQEeD8MVootj8G8
	zuGIw5HEVK56mkbbf4g9Kjt+nAGR7EfeoTy98=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=kI2F5cU70GL/lN91GrHfW6l4D9vKcz52PkHOECQFwK6Kna5tvbxcrSTjZjaq3zMcYd
	qYla9ha1UvVwIp15ANPMLIEwA2fPzDISp1djNZ16gavxdvSYAol6+LbSb0UrZDXnDAoO
	mGxchax9f7FJfGXPkXtl7/T5ahOuCfNS1Uc7c=
Received: by 10.141.48.6 with SMTP id a6mr444165rvk.36.1239822572272;
	Wed, 15 Apr 2009 12:09:32 -0700 (PDT)
Received: from gmail.com (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id g14sm327679rvb.17.2009.04.15.12.09.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Apr 2009 12:09:26 -0700 (PDT)
Date: Wed, 15 Apr 2009 12:09:13 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090415190913.GA29623@gmail.com>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-1-git-send-email-khimov@altell.ru>
	<1239798960-3586-2-git-send-email-khimov@altell.ru>
	<1239798960-3586-3-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1239798960-3586-3-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
X-SA-Exim-Connect-IP: 209.85.198.249
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 03/11] linux-libc-headers 2.6.23: fix amd64 headers
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
X-List-Received-Date: Wed, 15 Apr 2009 19:13:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/04/09 16:35), Roman I Khimov wrote:
> Taken from http://bugs.openembedded.net/show_bug.cgi?id=1728
> ---
>  .../linux-libc-headers_2.6.23.bb                   |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> index 13579f9..db13a45 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> @@ -63,4 +63,16 @@ do_stage () {
>  	cp -pfLR ${STAGE_TEMP}${includedir}/linux ${STAGING_INCDIR}/
>  	cp -pfLR ${STAGE_TEMP}${includedir}/asm ${STAGING_INCDIR}/
>  	cp -pfLR ${STAGE_TEMP}${includedir}/asm-generic ${STAGING_INCDIR}/
> +        if [ "${ARCH}" == "x86_64" ]; then
> +		cp -pfLR ${STAGE_TEMP}${includedir}/asm-x86_64 ${STAGING_INCDIR}/
> +		cp -pfLR ${STAGE_TEMP}${includedir}/asm-i386 ${STAGING_INCDIR}/
> +	fi
> +}
> +
> +do_stage_append_multilib () {
> +	mkdir ${STAGING_INCDIR}/${TARGET_SYS_MULTILIB}
> +	ln -s ../linux ${STAGING_INCDIR}/${TARGET_SYS_MULTILIB}/linux
> +	ln -s ../asm ${STAGING_INCDIR}/${TARGET_SYS_MULTILIB}/asm
> +	ln -s ../asm-generic ${STAGING_INCDIR}/${TARGET_SYS_MULTILIB}/asm-generic
> +	ln -s ../asm-i386 ${STAGING_INCDIR}/${TARGET_SYS_MULTILIB}/asm-i386
>  }

is there any reason not to use sanitized header like we do in do_install
even for do_stage

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


