Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P9OYz-0000T8-4q
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 22:50:17 +0200
Received: by gxk22 with SMTP id 22so1033457gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 13:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=uuC0QxRd+LUZtDjaFYNFrOIqJF0S3O0I7dzXBAJmMnk=;
	b=CkLdrwrVJxqDB7EAATCosZYZ1e7JfBnyCjkvIWu81NLwMydz0NBYhjLTHrAl/PvH7W
	rj9JR/Mp/R1hoRvV1rJanqOrvjdiWVENgDNE+GiEwTgxHuYyVZxyHdcC6Sb+c7HPmAGd
	evbBP8gLB6RbpzVpAsUWmr3bwbVt4PgHQjm8s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=b/RCJXaRIvGyMnxmfXnxh4pGu9Ld2aiYMh3qCWoZzuSjGZd5qMwQM7YoeSXE6lWfqM
	vcD3UXgMj9ysBznU+jh8v73t6N7I9Tbtu5WGZNoipYsrrmtLsmnzBrvsCwyHTGCHzQDk
	hZnFXfa06V65iqSgyWcLhC8YZTuL84tDjJ1iY=
Received: by 10.42.176.194 with SMTP id bf2mr2312500icb.435.1287780567158;
	Fri, 22 Oct 2010 13:49:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Fri, 22 Oct 2010 13:49:07 -0700 (PDT)
In-Reply-To: <4CC0C67C.6060806@phoenixsoftware.it>
References: <4CC0C67C.6060806@phoenixsoftware.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Oct 2010 13:49:07 -0700
Message-ID: <AANLkTi=ir567dGvzgOTgwvba3M0k1wyWmAJiwG4HNeJG@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: external-toolchain-csl and libtool 2.4
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
X-List-Received-Date: Fri, 22 Oct 2010 20:50:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 21, 2010 at 4:02 PM, Pierluigi Passaro
<pierluigi.passaro@phoenixsoftware.it> wrote:
> Hi all,
> LIBTOOL_HAS_SYSROOT feature has been recently enabled on Angstom 2010.x
> distro.
>
> However, using CodeSourcery toolchain, this feature lead to use CSL sysroot
> as search path, that is generally different from
> ${STAGING_DIR_TARGET}${libdir} folder used for packages.

hmmm yes I see the problem. Right now its left upto the compile to provide
the sysroot which works well with internal toolchain but will not work with
external toolchains or the compilers which dont support --print-sysroot option

I will come up with a patch so specify the sysroot for libtool so that it
does not rely upon the compiler to compute it.

>
> At present I worked around the problem with the attached patch, but I was
> wondering if this could be a misconfiguration or a bug.
>
> Any suggestion will be appreciated.
>

With libtool 2.4 I dont see a reason to disable sysroot. The variable is only
provided to keep libtool 2.2.6 functional as same time. So when using 2.4 please
do not disable the sysroot feature.

> Regards
> Gigi
>
> --
> Ing. Pierluigi Passaro
> Viale Don Luigi Sturzo 34
> 30174 Venezia Mestre
> Cel: +39 348 355 4119
> Tel: +39 041 862 3373
> Fax: +39 041 862 3173
> Web: www.phoenixsoftware.it
> P.IVA 03884060272
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


