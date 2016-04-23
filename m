Return-Path: <ryanelkholy@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 916BC6FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Apr 2016 14:36:14 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id 2so145710814ioy.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Apr 2016 07:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=SKBpcJMY3a7fJPGDXbTwDkxhfXYiKqAoBAxledb9Mj4=;
	b=JlFjiBN+pscO7a30bBl8CPEQluBg+/HG2mLRWy2Tzvm191MgMDNqj6pXYAgOg853Ch
	eUNoa3T2c8tc9jlCcXBLfnH18lBAJX1HoC0IkGtr8lTrFh21juqOI1ilNeeZhD7pIjQP
	OxuPjzrYTz4T+qKxQsZAyTKkh6ZrdRcYyRii0tnWd/+RExjfCFjz+XHL8tREETb8+Qhr
	RbyP9uMnXslx5iUjr33O33SrtrrMe7sD31U5Dn2LejbT1ewBn00euTuYr+zlIWwpNXvK
	IEmOphdJQA6UcrX/44i4/B8D9Wwg7Ag+0ClSBUil9nDgOudTmczT6dR05xM9/9lkFiCH
	+wYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=SKBpcJMY3a7fJPGDXbTwDkxhfXYiKqAoBAxledb9Mj4=;
	b=fpOkPYebnPUBHFEpAgxbvygY8keqD6v7wgra8C0QhD1EAQ8KUcvmhnmXdzLpP7DM9p
	akcalCKi9MagdtQeFns/uofLBI9xdBKaiqjKbRK1w53sdi0UtTOzrJwh18g9OIj8iJvv
	7a6HKQwqgAYEGMN4BWkBccRjPPZmYslKbX7ablTdhp9s13ySMkRBUIfOUjJ3wyIv1bSY
	B5yXSw/5skwylgF/HmueJhLiSiTIs4xAmfURSl0buaGd4CUAld4KDWbpk2SIYprjabJr
	CVvsKYrJ7Bhpi1QvrJ17Joxo/1vVlG/DnWiggC70LbLG/y0QMRQsOg0PcPnwdK4NnRMV
	4rRA==
X-Gm-Message-State: AOPr4FU2xNo7zxH4fEDztrn4hNiAlJTbvZ3NqgGkvXfaz0FzK8l4svmG9v7hp4UONJo2L1aw5cswaeIWPQlbYA==
MIME-Version: 1.0
X-Received: by 10.107.36.198 with SMTP id k189mr10619707iok.176.1461422174932; 
	Sat, 23 Apr 2016 07:36:14 -0700 (PDT)
Received: by 10.64.78.105 with HTTP; Sat, 23 Apr 2016 07:36:14 -0700 (PDT)
In-Reply-To: <AF020D52-486E-40B4-BE5D-5F4CAB2E9130@gmail.com>
References: <CAMZfsd6f7-s4pVyiNPs2sVmi+EC6yMyjCJeYTPobm0f6ffE2_w@mail.gmail.com>
	<AF020D52-486E-40B4-BE5D-5F4CAB2E9130@gmail.com>
Date: Sat, 23 Apr 2016 10:36:14 -0400
Message-ID: <CAMZfsd57OovKqm6fV3oR85s2yTVy_5fy4qGX6nft4-ffFHcEaQ@mail.gmail.com>
From: "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yocto Project <yocto@yoctoproject.org>
Subject: Re: [meta-qt5] EGL Error : Could not create the egl surface: error = 0x300b
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Apr 2016 14:36:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Yes, I do have directfb in DISTRO_FEATURES. The following is in my
local.conf:

http://pastebin.com/8vmN0r7Z

Furthermore, to even get this to build I had to alter the libva recipe
because it caused conflicts. Even though I was excluding x11 it would still
try to build libva-x11 due to the following RDEPENDS for egl in
libva_1.5.0_bb:

RDEPENDS_${PN}-egl =3D+ "${PN}-x11"

I changed this to

RDEPENDS_${PN}-egl =3D+ "${PN}"

in order for it to build. I know I probably should definitely not be doing
this, but it is for the purpose of testing.

All of this gets pulled in due to my images inclusion of hardware codecs
for hardware acceleration:

IMAGE_FEATURES +=3D "splash package-management ssh-server-openssh hwcodecs"

where hwcodecs is defined by the Intel BSP as the following:

MACHINE_HWCODECS ?=3D "va-intel gstreamer-vaapi-1.0"

So in the end, I can get the app to run without error by including x11
which allows me to fully include the Intel hardware acceleration, but I do
not want x11. I feel like there is the aforementioned dependency that
should not exist, but I am not in the position to know how to work around
this. As I said, if I alter the dependency of libva-egl on libva-x11 it
will build, but I get the EGL surface error.

Any insight is greatly appreciated.



On Fri, Apr 22, 2016 at 9:22 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Apr 22, 2016, at 6:07 PM, Ryan Elkholy, PhD, PE <
> ryanelkholy@gmail.com> wrote:
> >
> > Hello,
> >
> > I am am trying to make a build that includes meta-qt5 without x11 or
> > wayland on the Minnowboard Turbot (x86-64). I was successful in buildin=
g
> my
> > image but the problem occurred when testing my basic qt app on the imag=
e.
> > When trying to run the app I get the following error:
> >
> > EGL Error : Could not create the egl surface: error =3D 0x300
>
>
> Do you have =E2=80=98directfb=E2=80=99 in DISTRO_FEATURES
> >
> > I have been trying to find a solution for this for weeks with no luck. =
I
> am
> > able tu run my application when including x11, but I am trying to avoid
> it.
> > Does anyone know any solution for this? Any insight will be helpful
> because
> > I have been stumped for weeks. If nobody knows of a solution is it
> possible
> > to dig deeper into this error and see what is causing it? If so, how?
> >
> > Thanks
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

