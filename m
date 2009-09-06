Received: from [209.85.216.196] (helo=mail-px0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <juanbackson@gmail.com>) id 1MkC3S-0006BQ-Vu
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 09:20:56 +0200
Received: by pxi34 with SMTP id 34so1653311pxi.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Sep 2009 00:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=kRNOZyEcp4OSN3Mx0qS8Mv+uZgCKIzDPtkelG5vgZRE=;
	b=ANPGLORxGSj7q9/eknHcwOTbI2W1pFoi3u00odPAcpGK41Zjtm3Y6/760iWY+ZsK8x
	TUjzqFZYQWNGzuEIZnB+XwyK0KAD0hw3WAizqXrI7hXMBFtBEJrqrxLMvDPXi9O+EQ4k
	MSwzkOtWHsovxhSjZ1inyuScYmbV8r+Py74rM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=cqTl3qqiNRowuya3RJo2h6Mf4jmvSrEXp+kb9alJYQCTP0ss0xTgJ9bl+PTvn5QZoE
	VdquFkv0jzfhFAWuRFNLrBJmQhXUMzEKdfsaLk211eCaFT/kCRG9wrt/x82F5RV/gQvj
	FRrxKVxaj3d1GwQCJOw5lSM17M5Esqjr5K77M=
MIME-Version: 1.0
Received: by 10.143.24.37 with SMTP id b37mr407445wfj.183.1252220503981; Sun, 
	06 Sep 2009 00:01:43 -0700 (PDT)
In-Reply-To: <19c1b8a90909051341w882f41aj9ed35a381eb3377a@mail.gmail.com>
References: <27c25bc40909050924o3632ba7dp8dd84e950a689617@mail.gmail.com>
	<19c1b8a90909051050s382dcbf1of5aed8482cfd25aa@mail.gmail.com>
	<1252181231.4490.148.camel@lenovo.internal.reciva.com>
	<19c1b8a90909051341w882f41aj9ed35a381eb3377a@mail.gmail.com>
Date: Sun, 6 Sep 2009 15:01:43 +0800
Message-ID: <27c25bc40909060001w4e236953v4503216cac29a12f@mail.gmail.com>
From: Juan Backson <juanbackson@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: unable to bitbake ortp
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
X-List-Received-Date: Sun, 06 Sep 2009 07:20:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

I have the following in my ortp0.7 recipe.  How should I change it to get
bitbake to work?

DESCRIPTION = "An LGPL implementation of RTP - RFC3550"
LICENSE = "LGPL"
DEPENDS = "glibc"

PR = "r1"

inherit autotools pkgconfig

SRC_URI = "
http://download.savannah.nongnu.org/releases/linphone/${PN}/sources/${P}.tar.gz
"

do_compile_append() {
        sed -i -e s:${STAGING_DIR_TARGET}::g \
               -e s:/${TARGET_SYS}::g \
                  ortp.pc

}



On Sun, Sep 6, 2009 at 4:41 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Sep 5, 2009 at 1:07 PM, Phil Blundell<philb@gnu.org> wrote:
> > On Sat, 2009-09-05 at 10:50 -0700, Khem Raj wrote:
> >> If you are using .dev then there is ortp-0.13 which I built here
> >> without any problem
> >> on a sidenote it says DEPENDS = "glibc " which I think should be
> >> changed to virtual/libc
> >> but as long as you are using glibc/eglibc based system it should not
> >> be a problem.
> >
> > Specifying virtual/libc in a recipe's DEPENDS would usually be a bit
> > silly since base.bbclass adds it automatically.  Specifying glibc there
> > would perhaps be legitimate for packages that actually require features
> > of glibc itself, but I doubt that is the case here.
> >
>
> > I suspect that the line in question is probably a slightly mangled
> > attempt to depend on either glib-1.2 or glib-2.0, which would be
> > consistent with the original poster's complaint that glib.h was missing.
> >
>
> Seems right. Looking at ortp 0.13 sources glib dependency is removed
> but if you look at changelog
>
> Wednesday March 8 2006  : ortp-0.9.0
>        - a lot of cleanups, glib dropped, win32 port reactivated
>
> so it seems prior to 0.9 one needs to depend on glib.
>
> And I was building 0.13 and I was not getting this error.
>
> So I think right fix is to add glib dependency in 0.7 recipe.
> and remove it from 0.13
>
> > p.
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

