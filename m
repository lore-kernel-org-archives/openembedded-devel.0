Received: from [209.85.198.241] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lyu1W-0003Jy-2f
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 22:35:26 +0200
Received: by rv-out-0708.google.com with SMTP id f25so538307rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 13:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=V4ucbZEK6GSQ2LGX20qUdKFirT+3lrGOLs/D0Hj4Tmw=;
	b=YH69A+WGaWLstKSbq/3cNVpWruXFb46+ZKnH6Z5azZ3AJeRVYZS10zQAbPzFTRZXpd
	fj0b39gbC/2QyqiBOOuQPSEOwitERSpN4vXNwk7tdfzmKy4aY3Oe3paX550f4/DWDdNn
	/Mdx8XzspsICcuQdt8GAvTKWCuMEp9AyDVG38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=QE0oLXG7CHzwa16iAKKsPMGHnfjKPFwoluptzshOjPx8LApOHUyM9tY1YR0Gti040l
	FJ3pw5iseWukicSJcJEUE6RcxdHVKpmpkI7XJGBsc4t5qpsp8zjY/BI7TobahoCG5bsY
	x7IdEDf6ePDDroUvvHvfJpz+oR4Hr9KuSZBDc=
Received: by 10.114.182.15 with SMTP id e15mr3530273waf.17.1240950614042;
	Tue, 28 Apr 2009 13:30:14 -0700 (PDT)
Received: from gmail.com (adsl-71-146-25-44.dsl.pltn13.sbcglobal.net
	[71.146.25.44])
	by mx.google.com with ESMTPS id q18sm964291pog.19.2009.04.28.13.30.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 28 Apr 2009 13:30:13 -0700 (PDT)
Date: Tue, 28 Apr 2009 13:30:09 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090428203009.GH26082@gmail.com>
References: <20090427141943.GG18788@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090427141943.GG18788@smtp.west.cox.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Tue, 28 Apr 2009 20:35:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (27/04/09 07:19), Tom Rini wrote:
> Hey all.  I've created a new branch, trini/add-libc-overrides which does
> the following:
> - Make every distro declare PREFERRED_LIBC, either outright or
>   overridable.

may be you should call it something like SYSTEM_LIBC

> - For Angstrom/foonas have DISTROVAR ?= ${PREFERRED_LIBC},
>   PREFERRED_LIBC ?= default
> - Add conf/distro/include/{eglibc,glibc,uclibc}.inc that have:
>   - Add 'glibc' to OVERRIDES for eglibc/glibc and 'uclibc' for
>     uclibc.inc

what about klibc so some distro's use klibc too ?

>   - Default providers.
>   NOTE: ${TARGET_PREFIX} includes ${TARGET_VENDOR} so ...
> - Switch all distros to have:
>   require conf/distro/include/${PREFERED_LIBC}.inc
>   - Clean up distro-specific includes, and sane-toolchain.inc a little
>     bit by removing all of the PREFERRED_PROVIDER stuff it no longer
>     needs.
> - For glibc*.bb older than 2.5, add in some missing RPROVIDES.

OK

> 
> That last change was required so that a number of distros would parse
> without trying to build say both glibc_2.3.3 and glibc_2.9 (for
> virtual-libc-dev) when I ran bitbake -g meta-toolchain minimal-image.
> 
> The next step, once something like this goes in, would be to change all
> of the overrides that test for uclibc (or glibc) from
> linux/linux-gnueabi vs linux-uclibc/linux-uclibcgnueabi to just
> linux_glibc vs linux_uclibc.

only those two ? or one for each libc we have.

> 
> That branch has been tested with bitbake -g meta-toolchain minimal image
> for every distro for nslu2be nslu2le and beagleboard (arm/armeb/newer
> arm) before and after, and the only differences are the stuff that now
> parses thanks to the glibc changes.  I've got a loop going now with
> qemux86 db1200 and mpc8313e-rdb but don't expect any problems.  I'll be
> following up with the patches shortly.


general approach is good.

> 
> -- 
> Tom Rini
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


