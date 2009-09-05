Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mk2N0-0006DM-NR
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Sep 2009 23:00:27 +0200
Received: by qw-out-1920.google.com with SMTP id 4so407058qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Sep 2009 13:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4T8Di8KTkMVfMPb71QR6O4oPnIDMhNjUhaILa0bSimk=;
	b=ixdRHLAuPZXLWZWWuAXI5bk26FCA/KSVfy9iNXDh3s33YiJd2UblIlmMniNXbO3PfP
	vT9e8lx7EPb3vzwyd5blR4ydaDqqRvFSXLR8RG0+aIUfb04jyrm0/dA2cWBhbxEAye6+
	fjYiiNIDyndymPkJG/SqsQhRh4txPkJycGPNg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nt+9bqgbC0XxDyKzbknXmnriFdNOYharVEP+hOLz8Y51I3IA3XLQUIWU1FYahkdn7W
	ubPB9NFnaOmTR7XbVnBuUYN1TmO3Bv5aruPFC0wwWPWP3dz/riqvPPxn0OYPCXWBEvnI
	zh1KF5/MJKye9olXQIK6XKSS90M76ZZTDeQug=
MIME-Version: 1.0
Received: by 10.229.39.201 with SMTP id h9mr3515132qce.4.1252183280907; Sat, 
	05 Sep 2009 13:41:20 -0700 (PDT)
In-Reply-To: <1252181231.4490.148.camel@lenovo.internal.reciva.com>
References: <27c25bc40909050924o3632ba7dp8dd84e950a689617@mail.gmail.com>
	<19c1b8a90909051050s382dcbf1of5aed8482cfd25aa@mail.gmail.com>
	<1252181231.4490.148.camel@lenovo.internal.reciva.com>
Date: Sat, 5 Sep 2009 13:41:16 -0700
Message-ID: <19c1b8a90909051341w882f41aj9ed35a381eb3377a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sat, 05 Sep 2009 21:00:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2009 at 1:07 PM, Phil Blundell<philb@gnu.org> wrote:
> On Sat, 2009-09-05 at 10:50 -0700, Khem Raj wrote:
>> If you are using .dev then there is ortp-0.13 which I built here
>> without any problem
>> on a sidenote it says DEPENDS =3D "glibc " which I think should be
>> changed to virtual/libc
>> but as long as you are using glibc/eglibc based system it should not
>> be a problem.
>
> Specifying virtual/libc in a recipe's DEPENDS would usually be a bit
> silly since base.bbclass adds it automatically. =C2=A0Specifying glibc th=
ere
> would perhaps be legitimate for packages that actually require features
> of glibc itself, but I doubt that is the case here.
>

> I suspect that the line in question is probably a slightly mangled
> attempt to depend on either glib-1.2 or glib-2.0, which would be
> consistent with the original poster's complaint that glib.h was missing.
>

Seems right. Looking at ortp 0.13 sources glib dependency is removed
but if you look at changelog

Wednesday March 8 2006  : ortp-0.9.0
        - a lot of cleanups, glib dropped, win32 port reactivated

so it seems prior to 0.9 one needs to depend on glib.

And I was building 0.13 and I was not getting this error.

So I think right fix is to add glib dependency in 0.7 recipe.
and remove it from 0.13

> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


