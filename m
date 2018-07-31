Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C50EE78CAE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 14:30:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6VEU3ip013439
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 31 Jul 2018 07:30:04 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.60.190) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Tue, 31 Jul 2018 07:30:02 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: William Delacre <williamdelacre@gmail.com>
Date: Tue, 31 Jul 2018 10:30:02 -0400
Message-ID: <2158826.FCmzKMqH1E@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CAOnRZEK6f6dJtHcxrOTZN1CE_w=4=VHRKkArM76=KtJY69EK0w@mail.gmail.com>
References: <CAOnRZELTeZbVDTo_eT_r6e6EG6et0vs7O_mT_fpqJ_RpoVhk2Q@mail.gmail.com>
	<20180727164420.GM20696@vctlabs.com>
	<CAOnRZEK6f6dJtHcxrOTZN1CE_w=4=VHRKkArM76=KtJY69EK0w@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 31 Jul 2018 14:30:04 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Tuesday, July 31, 2018 7:54:22 AM EDT William Delacre wrote:
> Le ven. 27 juil. 2018 =C3=A0 18:40, S. Lockwood-Childs <sjl@vctlabs.com> a
>=20
> =C3=A9crit :
> > It depends on the role of the particular dependency:
> >=20
> > * tool you need to run during build             <-- native dependency
> > * library you need to link against during build <-- target dependency
>=20
> Thanks for the precision :-)
>=20
> My question may seem a bit stupid but how do you know which is which ?
> Let=E2=80=99s say I want to write a recipe to install any specific softwa=
re on my
> target, how do I choose the dependencies ?
> I have to refer to the software Makefile/CMakeList ?

It is not always easy to see via code inspection. I would suggest keep a=20
second build for a different arch than your build host, possibly ARM. Start=
 by=20
using the non-native DEPENDS and only if there is an issue with the ARM bui=
ld=20
look at using -native for a DEPENDS.

To be honest I haven't had to worry about this too much as it is rare to ru=
n=20
into issues.

Mark

>=20
> William
>=20
> > --SJLC
> >=20
> > On Fri, Jul 27, 2018 at 06:25:27PM +0200, William Delacre wrote:
> > > Okay, it makes sense!
> > >=20
> > > My question may seem stupid but then why don=E2=80=99t we always use =
=E2=80=98-native=E2=80=99
> >=20
> > for
> >=20
> > > the dependencies ?
> > >=20
> > > Is it because sometimes we know that the behavior of =E2=80=98foo=E2=
=80=99 and
> >=20
> > =E2=80=98foo-native=E2=80=99
> >=20
> > > would be the same, independently of the architecture ?
> > >=20
> > > William
> > >=20
> > > Le ven. 27 juil. 2018 =C3=A0 18:16, Mark Asselstine <
> > >=20
> > > mark.asselstine@windriver.com> a =C3=A9crit :
> > > > On Friday, July 27, 2018 12:04:37 PM EDT William Delacre wrote:
> > > > > Thanks a lot for the answer, it worked perfectly !
> > > > >=20
> > > > > There is just one point I don=E2=80=99t really understand : why d=
o we need
> > > > > to
> > > >=20
> > > > add a
> > > >=20
> > > > > dependency to =E2=80=98python-incremental-NATIVE=E2=80=99 ?
> > > > >=20
> > > > > What would happen if I just add to the python-twisted recipe :
> > > > >=20
> > > > > DEPENDS +=3D =E2=80=9C${PYTHON_PN}-incremental=E2=80=9C
> > > >=20
> > > > This would assume that python is completely arch independent, which=
 it
> >=20
> > is
> >=20
> > > > not.
> > > > Assume for example python-incremental had some C extensions, using
> >=20
> > DEPENDS
> >=20
> > > > would build them for the target arch yet possibly attempt to run th=
em
> >=20
> > on
> >=20
> > > > your
> > > > build host. -native takes care of this.
> > > >=20
> > > > Some may say this is a bit of a hack since the difference in ARCH
> >=20
> > *might*
> >=20
> > > > equate to a difference in behavior. But I have dealt with many pyth=
on
> > > > recipes
> > > > and have yet to run into any scenario where this potential issue
> >=20
> > exists.
> >=20
> > > > At least that is what I can recall at the moment. Unfortunately I h=
ave
> > > > forgotten some of the subtleties that might be in play.
> > > >=20
> > > > Mark
> > > >=20
> > > > > William
> > > > >=20
> > > > > Le ven. 27 juil. 2018 =C3=A0 17:03, Mark Asselstine <
> > > > >=20
> > > > > mark.asselstine@windriver.com> a =C3=A9crit :
> > > > > > On Thu, Jul 26, 2018 at 3:40 PM, Mark Asselstine
> > > > > >=20
> > > > > > <mark.asselstine@windriver.com> wrote:
> > > > > > > On Mon, Jul 23, 2018 at 8:28 AM, William Delacre
> > > > > > >=20
> > > > > > > <williamdelacre@gmail.com> wrote:
> > > > > > >> Hi ! :-)
> > > > > > >>=20
> > > > > > >> I=E2=80=99m facing issues when trying to run =E2=80=98bitbak=
e python-twisted=E2=80=99
> > > > > >=20
> > > > > > (do_compile
> > > > > >=20
> > > > > > >> error)
> > > > > > >>=20
> > > > > > >> Log says :
> > > >=20
> > > > > > >> =E2=80=9CDownload error on https://pypi.python.org/simple/in=
cremental/:
> > > > [Errno
> > > >=20
> > > > > > -3]
> > > > > >=20
> > > > > > >> Temporary failure in name resolution
> > > > > >=20
> > > > > > With the additional info you sent me along with a second look at
> >=20
> > the
> >=20
> > > > > > error I can fairly confidently say I know what the issue is.
> > > > > >=20
> > > > > > Python, like some other languages (ruby, go...) will attempt to
> > > > > > download dependencies/requirements if they are not present. This
> > > > > > is
> > > > > > done "outside" of the bitbake system and thus will ignore
> > > > > > BB_NO_NETWORK and is generally a bad thing. It isn't quite host
> > > > > > contamination but it is very similar. What we do with our python
> > > > > > recipes in bitbake is review a python package's source setup.py,
> > > > > > requirements.txt...files in order to determine what other python
> > > > > > packages are needed, add them as RDEPENDS or similar in order to
> >=20
> > avoid
> >=20
> > > > > > the python attempting to complete a download such as this.
> > > > > >=20
> > > > > > In this case python-twisted 'requires' python-incremental but t=
he
> > > > > > Rocko version of the python-twisted recipe lacks the needed
> >=20
> > assignment
> >=20
> > > > > > to ensure this is available in the recipe sysroot and thus the
> > > > > > attempted download.
> > > > > >=20
> > > > > > Cherry pick commit b08b570c8624303acbb6bb064a7bda466a679df4
> > > > > > [python-twisted: avoid downloading build dependencies] to Rocko
> > > > > > and
> > > > > > you will be good to go. You should also follow up this thread w=
ith
> >=20
> > a
> >=20
> > > > > > request to have this commit put onto Rocko to avoid others hitt=
ing
> >=20
> > the
> >=20
> > > > > > same issue.
> > > > > >=20
> > > > > > Mark
> > > > > >=20
> > > > > > >> ............
> > > > > > >>=20
> > > > > > >> distutils.errors.DistutilsError : Could not find suitable
> > > >=20
> > > > distribution
> > > >=20
> > > > > > for
> > > > > >=20
> > > > > > >> Requirement.parse(=E2=80=98incremental>=3D16.10.1=E2=80=99)=
=E2=80=9D
> > > > > > >>=20
> > > > > > >> First of all I=E2=80=99m not connected to internet, so I=E2=
=80=99ve
> >=20
> > pre-downloaded
> >=20
> > > > all
> > > >=20
> > > > > > the
> > > > > >=20
> > > > > > >> required packages (twisted-17.9.0.tar.bz2 &
> > > >=20
> > > > incremental-17.5.0.tar.gz
> > > >=20
> > > > > > are
> > > > > >=20
> > > > > > >> present in my build/downloads folder)
> > > > > > >>=20
> > > > > > >> It=E2=80=99s the first time I have some =E2=80=9Cdownloading=
 issues=E2=80=9D and I=E2=80=99m
> >=20
> > stuck
> >=20
> > > > on
> > > >=20
> > > > > > >> it
> > > > > > >> for a few hours now..
> > > > > > >>=20
> > > > > > >> Any tips for me ?
> > > > > > >=20
> > > > > > > Check all aspects of what you have manually downloaded and
> >=20
> > populated
> >=20
> > > > > > > in your downloads. My guess is that a checksum or some other
> >=20
> > detail
> >=20
> > > > > > > isn't matching and it is rejecting what you have and thus
> >=20
> > attempting
> >=20
> > > > > > > to re-download the file.
> > > > > > >=20
> > > > > > > Mark
> > > > > > >=20
> > > > > > >> Thanks in advance !
> > > > > > >> --
> > > > > > >> _______________________________________________
> > > > > > >> Openembedded-devel mailing list
> > > > > > >> Openembedded-devel@lists.openembedded.org
> >=20
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel





