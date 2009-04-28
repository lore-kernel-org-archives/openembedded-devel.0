Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lytri-0002jP-LI
	for openembedded-devel@openembedded.org; Tue, 28 Apr 2009 22:25:19 +0200
Received: by rv-out-0708.google.com with SMTP id b17so485335rvf.0
	for <openembedded-devel@openembedded.org>;
	Tue, 28 Apr 2009 13:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=/idDE54NoInPMvD+y2TevD63DgSAqhR1Zf6Df7BmJ0I=;
	b=p+0dNNqM0QM6ZPjwKRKBG1w63wYpNJJ9lypky5gygUBoshBl/BjflAM6ei/aIYe4F0
	KiuPDQ0C79ukeoziBfOAo6F+b3CCDiJgeykpMGJktDgtCHZtaA4TOEWE3pMokwm8fs+f
	OIBAJPKSja1vzzDQ7ZCgveHD4l1F1GvljAc0Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fK2FSQ0h+fy4LcFfpbW//1tIUQ9SPvexvxqhejVjEU9F1H8DpI4f5vK/McCyPZagQy
	QADDQSLTIBk1zxhJ956HVSj1t6ZsiS/VbrhEDxLb3NyBWSe26iFYnXkyr8kEY/YOBq0y
	kQncnVYXvMrhZWT0QywdYdiiufUXT4iARo8U8=
Received: by 10.114.154.1 with SMTP id b1mr3466551wae.77.1240950007133;
	Tue, 28 Apr 2009 13:20:07 -0700 (PDT)
Received: from gmail.com (adsl-71-146-25-44.dsl.pltn13.sbcglobal.net
	[71.146.25.44])
	by mx.google.com with ESMTPS id n33sm233598wag.21.2009.04.28.13.20.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 28 Apr 2009 13:20:06 -0700 (PDT)
Date: Tue, 28 Apr 2009 13:20:03 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090428202003.GG26082@gmail.com>
References: <1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-5-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-6-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-7-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-8-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-9-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-10-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-11-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-12-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-13-git-send-email-trini@kernel.crashing.org>
MIME-Version: 1.0
In-Reply-To: <1240589520-1104-13-git-send-email-trini@kernel.crashing.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [PATCH][STABLE] SlugOS: toolchain/sdk - add a number of	missing components
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
X-List-Received-Date: Tue, 28 Apr 2009 20:25:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/04/09 09:12), Tom Rini wrote:
> From: Mike Westerhof <mwester@dls.net>
> 
> 
> Signed-off-by: Tom Rini <trini@embeddedalley.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/tasks/task-slugos-toolchain-target.bb |   20 +++++---------------
>  1 files changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/recipes/tasks/task-slugos-toolchain-target.bb b/recipes/tasks/task-slugos-toolchain-target.bb
> index 489a412..fb0418f 100644
> --- a/recipes/tasks/task-slugos-toolchain-target.bb
> +++ b/recipes/tasks/task-slugos-toolchain-target.bb
> @@ -2,31 +2,21 @@ DESCRIPTION = "Packages for a standalone SDK or external toolchain"
>  LICENSE = "MIT"
>  ALLOW_EMPTY = "1"
>  
> -PR = "r1"
> +PR = "r3"
>  
>  PACKAGES = "${PN}"
>  
> -# Stuff contained in this SDK is largely taken from task-sdk-base.bb.
> +DEPENDS = "task-sdk-bare"
> +
>  # This is a starting point, and nothing more at present -- please fill
>  # this out with a reasonable set of development tools for a SlugOS image.
>  # Also feel free to remove stuff that's silly.
>  
>  RDEPENDS_${PN} = "\
> -    libgcc \
> +    task-sdk-bare \
>      linux-libc-headers-dev \
>      libssl \
>      libcrypto \
>      openssl-dev \
> -    libstdc++ \
> -    "
> -
> -# Not sure if we need these or not...
> -NOT_SURE_ABOUT = "\
> -    libsegfault \
> -    "
> -
> -# This one needs further investigation; seems to be some sort
> -# of naming problem that breaks the SDK when it is added directly.
> -ODDLY_BROKEN_PACKAGES ="\
> -    libz-dev \
> +    zlib-dev \
>      "
> -- 
> 1.5.6.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


