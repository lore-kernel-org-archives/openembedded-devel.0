Return-Path: <williamdelacre@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 40FE778D70
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 16:42:53 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id h1-v6so1426921uao.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=KM7vXYBV2EBgtvcO78UNoxSk9LAYvJRNV08bRerwU2Y=;
	b=JLtFuaSYUul0Jd0fCErbl/L/fff9Pj8pbK+CbhNytzCaa0hoeAr4SIqrLnv7oyYn0G
	aNpUftq68h+NZ9xdjsExtcrdYCcdsRjop4sW+rtol/MsSbZ56+fs9oFV8tCxPf4+QVDL
	LNOlTV1n3Kb/Q0fjs7KsQJwFGVMDJk2iDCtJcT04Whg7Qlz7B8m7O5HnjmZUExiSDSUb
	oLIaDV8XTeSpkAb2nrScpIHNuMi1u5Y5ekJNh08uF/edstjN41F8EJbVvjJrcRTrHt6B
	6aHzB+PoCtg8SDYMfwuMkWUcheK68NQ5A8PPAA6nh+IYqlWfZH+7fspXacKi5j8uYkv1
	vFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=KM7vXYBV2EBgtvcO78UNoxSk9LAYvJRNV08bRerwU2Y=;
	b=Jrn39FEv7EbScog14u99OF9J64eMXghUQZIq3r9GrPVnqINbRoK/+84BD2YZ3VokmO
	YENcDgBCNu2nOYmOprl3VmgY+vhmaDru72UiCT6ijvZf6UrIkifKSeMdnneZ5X9xTpNt
	dIuiDlshU0edwbkUZ4zAun/bzIEy9GfKhEdiriKehV2tSLb4TIbBMl2qD5AOPOZPsf03
	iI3fVlGqwzFFH/Q6xFAMEpFyQ3IaSVHD7MRQjcx6QtMbyxe0yKUJoKa2r+5Mz5rFUYnz
	bmqahp2/q7PJH50gK2WtFq4qemp5W0eKFmTsz+3xJqF9ttk/6i6Wv91w4YrH1k/ekIxr
	Nliw==
X-Gm-Message-State: AOUpUlEbH2dfHvigd17LiFWvjpGBqonI0d/Wl+bX3LWqCH552s0/EbKN
	wNrBZCvAJ0rwiwJQNXzwse91zy80D85aQqbm4TE=
X-Google-Smtp-Source: AAOMgpfMODtqhBvdBhNzWZYHhoWcE9w4ZXLmYab/oq0Tj6URRNZ9D/YFQtjjHZ3MjTJQwFVilxix9yYcqcDM1fDaWjM=
X-Received: by 2002:ab0:1861:: with SMTP id
	j33-v6mr4996043uag.119.1532709774906; 
	Fri, 27 Jul 2018 09:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnRZELTeZbVDTo_eT_r6e6EG6et0vs7O_mT_fpqJ_RpoVhk2Q@mail.gmail.com>
	<CAPuovE+nMp9xaj_gusMTGM9_ChFuuHDzc9NKBRYZMX493DbU=Q@mail.gmail.com>
	<CAOnRZEJ7iVfFxr4e=6VcjCCpi4uERXhv-e8FZgMuAQv6XD2GXQ@mail.gmail.com>
	<1748388.J95ykxND2L@yow-masselst-lx1>
	<CAOnRZEKK9xiSzTFH0+RQJxPzu2=qaEuNhYHKv4jFY0MPh-eWtw@mail.gmail.com>
	<20180727164420.GM20696@vctlabs.com>
In-Reply-To: <20180727164420.GM20696@vctlabs.com>
From: William Delacre <williamdelacre@gmail.com>
Date: Fri, 27 Jul 2018 18:42:44 +0200
Message-ID: <CAOnRZEJ3zDK4aAAEfD2Rrj2b03opfks36rywZZbresK6vcha+g@mail.gmail.com>
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
X-List-Received-Date: Fri, 27 Jul 2018 16:42:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alright, thabks !

And I guess if it=E2=80=99s a tool I need during runtime on the target, I a=
dd it in
the RDPENDS variable ?

Le ven. 27 juil. 2018 =C3=A0 18:40, S. Lockwood-Childs <sjl@vctlabs.com> a
=C3=A9crit :

> It depends on the role of the particular dependency:
>
> * tool you need to run during build             <-- native dependency
> * library you need to link against during build <-- target dependency
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

