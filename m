Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KqvJJ-0004NJ-2P
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Oct 2008 21:48:33 +0200
Received: by rv-out-0708.google.com with SMTP id f25so794869rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Oct 2008 12:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=h4SbcDM4RXt4Brm+5QQIiQymThlQAHClgPK4tGMtyBs=;
	b=BLIVnw6GsC8g6HPZrAh464ukbh+w/SJw84Nw2dhdZ7ELMpT/f05KJxJmZjCOJsB+0q
	FVofU4smZhCbtGxkN50JUIQ9yPmSE18FpQBlz5lCutUDCofSw5XF/oLiPtK1dH3CqOMV
	ldRp/lt5E3rMFyzVhw9DoiAzu2NzB4ZnDTtkg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=Bh3ajvVXv5nXuaa8apzfrbrZjhmWrBdKFRs9uRT37XjceT0FLVpdX4K7HYMRC5RwCT
	HG2PqNmIOH4K8vGC/BK+B8GUK/0nCY987AJI53ZkeBXZ7+lKiuP9MgnGhnAAX1j0Df0j
	ZEM3uxG69FgGikPsN1CDQlmL6oBr4MrYo+OgE=
Received: by 10.140.177.15 with SMTP id z15mr2780535rve.98.1224272906579;
	Fri, 17 Oct 2008 12:48:26 -0700 (PDT)
Received: by 10.141.96.7 with HTTP; Fri, 17 Oct 2008 12:48:26 -0700 (PDT)
Message-ID: <19c1b8a90810171248n4c8bc46ax954a17e40caa812f@mail.gmail.com>
Date: Fri, 17 Oct 2008 12:48:26 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1224271803.4235.182.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
References: <1224271803.4235.182.camel@lenovo.internal.reciva.com>
Subject: Re: remove ld.so.conf from glibc?
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
X-List-Received-Date: Fri, 17 Oct 2008 19:48:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Oct 17, 2008 at 12:30 PM, Phil Blundell <pb@reciva.com> wrote:
> At present, the main glibc package (libc6 in most DISTROs) is shipping
> an /etc/ld.so.conf file which mentions /usr/local/lib
> and /usr/X11R6/lib.  I think it has basically been this way for all
> time, and I suspect the original file was probably imported from Chris's
> openzaurus installation way back when.
>
> As far as I can tell, this file is not serving any useful purpose on any
> contemporary DISTRO.  On the contrary, aside from contributing to
> filesystem clutter, its only real effect will be to slow down shared
> library loading.  So, I would propose to delete it from the libc6
> package.  Any DISTRO which does need this file can, of course, ship it
> in a separate package of their own.


I would say we fix it. Logically this file could belong to libc as it
is. but we edit it and make it load
sub conf files which are owned by different packages and it there is
none then it loads nothing. This is how it is on ubuntu and fedora.

$ cat /etc/ld.so.conf
include ld.so.conf.d/*.conf

any package can have there own .conf file which can be installed in

/etc/ld.so.conf.d/

/etc/ld.so.conf and /etc/ld.so.conf.d/ are packaged as part of libc

Thx

-Khem


