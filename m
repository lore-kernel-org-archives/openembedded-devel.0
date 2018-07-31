Return-Path: <williamdelacre@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8F05E606B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 11:54:32 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id k82-v6so7342034vkd.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 04:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=2ILSQJ6TjISpOKUGw79eBva+CoUb3MrxB00nw3C8ZfY=;
	b=FwQm+1hEKTvyIH+NIVDCmYOP3EwqK1CeVk17hG9/kvVSOqpY7NRZz+tPwXL80NnWND
	mAZEML5H9bfnPeAzcrP5aU7R308QyeI4Zp+h9teG3nz1Mspi/JupgGeyThouyiF+5+zG
	PVGO/efUG4azbj0atptZdV4j8AFlkSLaAsVWKA7owYPFvgXls826qvq/3fjuTN2B73aX
	R+joEd1u9reWTjhADTmZnNS9OAaViZBhXXa85xP14/sLrI18xulwL8h2bwgvhlmjcZJY
	NQfeUoU1lGaElMqSZU+r1mr3zSsmIy2nM/Bd5mwta9CEsq3AeeC8vrNrHIb228jQhCWH
	p3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=2ILSQJ6TjISpOKUGw79eBva+CoUb3MrxB00nw3C8ZfY=;
	b=fCS1f/+7ohQMVBbhpWdIVTYzmRIgkzdV9VrMWUYdHvCBQbva3nTtUrMxH0S7CP/Byd
	T+SS5kD11YAOu8FqAKpZ6E0CKdicb3/+xDbvs9bjcXLMgovQ5utKBw1jBHgRUar2sz7m
	2JPlCvI7NSYN44TCKrsUroK25nY/U731uyeqB2q0ON0ru6U0rqv0TB5eDdKSFz06LW+K
	6LuOCJGToC/WMgKeUGS1O/XmxgWy9+ktZgPH0R7D+iRf/Xd+q5Q/TXE6jPFN/OhEolXV
	bKlBmAPgXWW3zFx6j5GnxVCKsg52sQPcoWrjEJurSNyMDyvO4kkwTD0c1GkDvx2w77UB
	vlKA==
X-Gm-Message-State: AOUpUlH3F1pqWnWDgdMqvScPsoaQBbcKVBecZTiA696uAGQbaa/SUpFl
	OS/v9Z4hfaBaNSwnhcU4zEKjLVGZ11SmDgH2Reg=
X-Google-Smtp-Source: AAOMgpdqBROvs3C0jKcEYeH9IafrPyMEUaW5UDUVFHXysjrssbNn3rCbdIoGhsseu4LTK85sVVK7FvQOvvJgkCQhP8o=
X-Received: by 2002:a1f:5107:: with SMTP id
	f7-v6mr11585825vkb.30.1533038073540; 
	Tue, 31 Jul 2018 04:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnRZELTeZbVDTo_eT_r6e6EG6et0vs7O_mT_fpqJ_RpoVhk2Q@mail.gmail.com>
	<CAPuovE+nMp9xaj_gusMTGM9_ChFuuHDzc9NKBRYZMX493DbU=Q@mail.gmail.com>
	<CAOnRZEJ7iVfFxr4e=6VcjCCpi4uERXhv-e8FZgMuAQv6XD2GXQ@mail.gmail.com>
	<1748388.J95ykxND2L@yow-masselst-lx1>
	<CAOnRZEKK9xiSzTFH0+RQJxPzu2=qaEuNhYHKv4jFY0MPh-eWtw@mail.gmail.com>
	<20180727164420.GM20696@vctlabs.com>
In-Reply-To: <20180727164420.GM20696@vctlabs.com>
From: William Delacre <williamdelacre@gmail.com>
Date: Tue, 31 Jul 2018 13:54:22 +0200
Message-ID: <CAOnRZEK6f6dJtHcxrOTZN1CE_w=4=VHRKkArM76=KtJY69EK0w@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>,
	"S. Lockwood-Childs" <sjl@vctlabs.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: (No subject)
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
X-List-Received-Date: Tue, 31 Jul 2018 11:54:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 27 juil. 2018 =C3=A0 18:40, S. Lockwood-Childs <sjl@vctlabs.com> a
=C3=A9crit :

> It depends on the role of the particular dependency:
>
> * tool you need to run during build             <-- native dependency
> * library you need to link against during build <-- target dependency


Thanks for the precision :-)

My question may seem a bit stupid but how do you know which is which ?
Let=E2=80=99s say I want to write a recipe to install any specific software=
 on my
target, how do I choose the dependencies ?
I have to refer to the software Makefile/CMakeList ?

William

>
>
> --SJLC
>
> On Fri, Jul 27, 2018 at 06:25:27PM +0200, William Delacre wrote:
> > Okay, it makes sense!
> >
> > My question may seem stupid but then why don=E2=80=99t we always use =
=E2=80=98-native=E2=80=99
> for
> > the dependencies ?
> >
> > Is it because sometimes we know that the behavior of =E2=80=98foo=E2=80=
=99 and
> =E2=80=98foo-native=E2=80=99
> > would be the same, independently of the architecture ?
> >
> > William
> >
> > Le ven. 27 juil. 2018 =C3=A0 18:16, Mark Asselstine <
> > mark.asselstine@windriver.com> a =C3=A9crit :
> >
> > > On Friday, July 27, 2018 12:04:37 PM EDT William Delacre wrote:
> > > > Thanks a lot for the answer, it worked perfectly !
> > > >
> > > > There is just one point I don=E2=80=99t really understand : why do =
we need to
> > > add a
> > > > dependency to =E2=80=98python-incremental-NATIVE=E2=80=99 ?
> > > >
> > > > What would happen if I just add to the python-twisted recipe :
> > > >
> > > > DEPENDS +=3D =E2=80=9C${PYTHON_PN}-incremental=E2=80=9C
> > >
> > > This would assume that python is completely arch independent, which i=
t
> is
> > > not.
> > > Assume for example python-incremental had some C extensions, using
> DEPENDS
> > > would build them for the target arch yet possibly attempt to run them
> on
> > > your
> > > build host. -native takes care of this.
> > >
> > > Some may say this is a bit of a hack since the difference in ARCH
> *might*
> > > equate to a difference in behavior. But I have dealt with many python
> > > recipes
> > > and have yet to run into any scenario where this potential issue
> exists.
> > >
> > > At least that is what I can recall at the moment. Unfortunately I hav=
e
> > > forgotten some of the subtleties that might be in play.
> > >
> > > Mark
> > >
> > > >
> > > > William
> > > >
> > > > Le ven. 27 juil. 2018 =C3=A0 17:03, Mark Asselstine <
> > > >
> > > > mark.asselstine@windriver.com> a =C3=A9crit :
> > > > > On Thu, Jul 26, 2018 at 3:40 PM, Mark Asselstine
> > > > >
> > > > > <mark.asselstine@windriver.com> wrote:
> > > > > > On Mon, Jul 23, 2018 at 8:28 AM, William Delacre
> > > > > >
> > > > > > <williamdelacre@gmail.com> wrote:
> > > > > >> Hi ! :-)
> > > > > >>
> > > > > >> I=E2=80=99m facing issues when trying to run =E2=80=98bitbake =
python-twisted=E2=80=99
> > > > >
> > > > > (do_compile
> > > > >
> > > > > >> error)
> > > > > >>
> > > > > >> Log says :
> > > > > >> =E2=80=9CDownload error on https://pypi.python.org/simple/incr=
emental/:
> > > [Errno
> > > > >
> > > > > -3]
> > > > >
> > > > > >> Temporary failure in name resolution
> > > > >
> > > > > With the additional info you sent me along with a second look at
> the
> > > > > error I can fairly confidently say I know what the issue is.
> > > > >
> > > > > Python, like some other languages (ruby, go...) will attempt to
> > > > > download dependencies/requirements if they are not present. This =
is
> > > > > done "outside" of the bitbake system and thus will ignore
> > > > > BB_NO_NETWORK and is generally a bad thing. It isn't quite host
> > > > > contamination but it is very similar. What we do with our python
> > > > > recipes in bitbake is review a python package's source setup.py,
> > > > > requirements.txt...files in order to determine what other python
> > > > > packages are needed, add them as RDEPENDS or similar in order to
> avoid
> > > > > the python attempting to complete a download such as this.
> > > > >
> > > > > In this case python-twisted 'requires' python-incremental but the
> > > > > Rocko version of the python-twisted recipe lacks the needed
> assignment
> > > > > to ensure this is available in the recipe sysroot and thus the
> > > > > attempted download.
> > > > >
> > > > > Cherry pick commit b08b570c8624303acbb6bb064a7bda466a679df4
> > > > > [python-twisted: avoid downloading build dependencies] to Rocko a=
nd
> > > > > you will be good to go. You should also follow up this thread wit=
h
> a
> > > > > request to have this commit put onto Rocko to avoid others hittin=
g
> the
> > > > > same issue.
> > > > >
> > > > > Mark
> > > > >
> > > > > >> ............
> > > > > >>
> > > > > >> distutils.errors.DistutilsError : Could not find suitable
> > > distribution
> > > > >
> > > > > for
> > > > >
> > > > > >> Requirement.parse(=E2=80=98incremental>=3D16.10.1=E2=80=99)=E2=
=80=9D
> > > > > >>
> > > > > >> First of all I=E2=80=99m not connected to internet, so I=E2=80=
=99ve
> pre-downloaded
> > > all
> > > > >
> > > > > the
> > > > >
> > > > > >> required packages (twisted-17.9.0.tar.bz2 &
> > > incremental-17.5.0.tar.gz
> > > > >
> > > > > are
> > > > >
> > > > > >> present in my build/downloads folder)
> > > > > >>
> > > > > >> It=E2=80=99s the first time I have some =E2=80=9Cdownloading i=
ssues=E2=80=9D and I=E2=80=99m
> stuck
> > > on
> > > > > >> it
> > > > > >> for a few hours now..
> > > > > >>
> > > > > >> Any tips for me ?
> > > > > >
> > > > > > Check all aspects of what you have manually downloaded and
> populated
> > > > > > in your downloads. My guess is that a checksum or some other
> detail
> > > > > > isn't matching and it is rejecting what you have and thus
> attempting
> > > > > > to re-download the file.
> > > > > >
> > > > > > Mark
> > > > > >
> > > > > >> Thanks in advance !
> > > > > >> --
> > > > > >> _______________________________________________
> > > > > >> Openembedded-devel mailing list
> > > > > >> Openembedded-devel@lists.openembedded.org
> > > > > >>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > >
> > >
> > >
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

