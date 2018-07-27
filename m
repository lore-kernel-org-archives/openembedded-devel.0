Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1851378D35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 16:16:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6RGGNxT030247
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Jul 2018 09:16:23 -0700
Received: from yow-masselst-lx1.localnet (128.224.20.96) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Fri, 27 Jul 2018 09:16:23 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: William Delacre <williamdelacre@gmail.com>
Date: Fri, 27 Jul 2018 12:16:22 -0400
Message-ID: <1748388.J95ykxND2L@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CAOnRZEJ7iVfFxr4e=6VcjCCpi4uERXhv-e8FZgMuAQv6XD2GXQ@mail.gmail.com>
References: <CAOnRZELTeZbVDTo_eT_r6e6EG6et0vs7O_mT_fpqJ_RpoVhk2Q@mail.gmail.com>
	<CAPuovE+nMp9xaj_gusMTGM9_ChFuuHDzc9NKBRYZMX493DbU=Q@mail.gmail.com>
	<CAOnRZEJ7iVfFxr4e=6VcjCCpi4uERXhv-e8FZgMuAQv6XD2GXQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 27 Jul 2018 16:16:24 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Friday, July 27, 2018 12:04:37 PM EDT William Delacre wrote:
> Thanks a lot for the answer, it worked perfectly !
>=20
> There is just one point I don=E2=80=99t really understand : why do we nee=
d to add a
> dependency to =E2=80=98python-incremental-NATIVE=E2=80=99 ?
>=20
> What would happen if I just add to the python-twisted recipe :
>=20
> DEPENDS +=3D =E2=80=9C${PYTHON_PN}-incremental=E2=80=9C

This would assume that python is completely arch independent, which it is n=
ot.=20
Assume for example python-incremental had some C extensions, using DEPENDS=
=20
would build them for the target arch yet possibly attempt to run them on yo=
ur=20
build host. -native takes care of this.

Some may say this is a bit of a hack since the difference in ARCH *might*=20
equate to a difference in behavior. But I have dealt with many python recip=
es=20
and have yet to run into any scenario where this potential issue exists.

At least that is what I can recall at the moment. Unfortunately I have=20
forgotten some of the subtleties that might be in play.

Mark

>=20
> William
>=20
> Le ven. 27 juil. 2018 =C3=A0 17:03, Mark Asselstine <
>=20
> mark.asselstine@windriver.com> a =C3=A9crit :
> > On Thu, Jul 26, 2018 at 3:40 PM, Mark Asselstine
> >=20
> > <mark.asselstine@windriver.com> wrote:
> > > On Mon, Jul 23, 2018 at 8:28 AM, William Delacre
> > >=20
> > > <williamdelacre@gmail.com> wrote:
> > >> Hi ! :-)
> > >>=20
> > >> I=E2=80=99m facing issues when trying to run =E2=80=98bitbake python=
=2Dtwisted=E2=80=99
> >=20
> > (do_compile
> >=20
> > >> error)
> > >>=20
> > >> Log says :
> > >> =E2=80=9CDownload error on https://pypi.python.org/simple/incrementa=
l/: [Errno
> >=20
> > -3]
> >=20
> > >> Temporary failure in name resolution
> >=20
> > With the additional info you sent me along with a second look at the
> > error I can fairly confidently say I know what the issue is.
> >=20
> > Python, like some other languages (ruby, go...) will attempt to
> > download dependencies/requirements if they are not present. This is
> > done "outside" of the bitbake system and thus will ignore
> > BB_NO_NETWORK and is generally a bad thing. It isn't quite host
> > contamination but it is very similar. What we do with our python
> > recipes in bitbake is review a python package's source setup.py,
> > requirements.txt...files in order to determine what other python
> > packages are needed, add them as RDEPENDS or similar in order to avoid
> > the python attempting to complete a download such as this.
> >=20
> > In this case python-twisted 'requires' python-incremental but the
> > Rocko version of the python-twisted recipe lacks the needed assignment
> > to ensure this is available in the recipe sysroot and thus the
> > attempted download.
> >=20
> > Cherry pick commit b08b570c8624303acbb6bb064a7bda466a679df4
> > [python-twisted: avoid downloading build dependencies] to Rocko and
> > you will be good to go. You should also follow up this thread with a
> > request to have this commit put onto Rocko to avoid others hitting the
> > same issue.
> >=20
> > Mark
> >=20
> > >> ............
> > >>=20
> > >> distutils.errors.DistutilsError : Could not find suitable distributi=
on
> >=20
> > for
> >=20
> > >> Requirement.parse(=E2=80=98incremental>=3D16.10.1=E2=80=99)=E2=80=9D
> > >>=20
> > >> First of all I=E2=80=99m not connected to internet, so I=E2=80=99ve =
pre-downloaded all
> >=20
> > the
> >=20
> > >> required packages (twisted-17.9.0.tar.bz2 & incremental-17.5.0.tar.gz
> >=20
> > are
> >=20
> > >> present in my build/downloads folder)
> > >>=20
> > >> It=E2=80=99s the first time I have some =E2=80=9Cdownloading issues=
=E2=80=9D and I=E2=80=99m stuck on
> > >> it
> > >> for a few hours now..
> > >>=20
> > >> Any tips for me ?
> > >=20
> > > Check all aspects of what you have manually downloaded and populated
> > > in your downloads. My guess is that a checksum or some other detail
> > > isn't matching and it is rejecting what you have and thus attempting
> > > to re-download the file.
> > >=20
> > > Mark
> > >=20
> > >> Thanks in advance !
> > >> --
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel





