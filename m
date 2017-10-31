Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D885D60766
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 13:29:43 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1e9Wbx-0003qE-Bx from Joe_MacDonald@mentor.com ;
	Tue, 31 Oct 2017 06:29:45 -0700
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	svr-orw-fem-04.mgc.mentorg.com (147.34.97.41) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 31 Oct 2017 06:29:44 -0700
Received: by burninator.cal.mentorg.com (Postfix, from userid 1000)	id
	D7886592667; Tue, 31 Oct 2017 09:29:43 -0400 (EDT)
Date: Tue, 31 Oct 2017 09:29:43 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20171031132943.pidvmprs575jemse@mentor.com>
References: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
	<1509387073-21934-3-git-send-email-joe_macdonald@mentor.com>
	<CAMKF1sqR75pr0HCO93hmyzRffDPJcDUECvvQLSUih0AUbsh1SA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqR75pr0HCO93hmyzRffDPJcDUECvvQLSUih0AUbsh1SA@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/6] lksctp-tools: update and remove from blacklist
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
X-List-Received-Date: Tue, 31 Oct 2017 13:29:44 -0000
X-Groupsio-MsgNum: 69410
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="avkerqt47sw74awi"
Content-Disposition: inline

--avkerqt47sw74awi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 2/6] lksctp-tools: update and remove from=
 blacklist] On 17.10.30 (Mon 16:21) Khem Raj wrote:

> On Mon, Oct 30, 2017 at 11:11 AM, Joe MacDonald
> <joe_macdonald@mentor.com> wrote:
> > Switching lksctp-tools to build from the upstream git repository rather
> > than a source tarball.  At the same time we'll un-blacklist it since it
> > appears the gold-as-ld issue has been resolved underneath us, probably
> > related to a Debian bug of the same form that was also resolved with a
> > binutils update.
> >
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > ---
> >  .../recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb  | 16 +++++---=
--------
> >  1 file changed, 5 insertions(+), 11 deletions(-)
> >
> > diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_=
1.0.17.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.1=
7.bb
> > index 11c43ff..9166aa5 100644
> > --- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.=
bb
> > +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.=
bb
> > @@ -8,22 +8,16 @@ LIC_FILES_CHKSUM =3D " \
> >      file://COPYING;md5=3D0c56db0143f4f80c369ee3af7425af6e \
> >  "
> >
> > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz \
> > +SRCREV =3D "736b91d340e3f2519714f2930ed63b164d363511"
> > +
>=20
> perhaps we need to reflect it in PV as well.
>=20
> PV .=3D "+git${SRCPV}"

I was less inclined to decorate the PV with the git hash since the
SRCREV points at the release tag for 1.0.17, but I suppose if upstream
chose to move the tag then this would be out of sync, so it's worth it.

-J.

>=20
> > +SRC_URI =3D " \
> > +    git://github.com/sctp/lksctp-tools.git \
> >      file://run-ptest \
> >      file://v4test.sh \
> >      file://v6test.sh \
> >  "
> >
> > -SRC_URI[md5sum] =3D "68e9b8fa4d4e331029b247b72d46d7a5"
> > -SRC_URI[sha256sum] =3D "1aeb204cdb2befc94d9eb3037d1609c9d1d2cd5379d6dd=
2c0a8ca9b10533aa15"
> > -
> > -#| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc  -marc=
h=3Darmv5te -marm -mthumb-interwork --sysroot=3D/home/jenkins/oe/world/shr-=
core/tmp-eglibc/sysroots/qemuarm -shared  -fPIC -DPIC  .libs/bindx.o .libs/=
connectx.o .libs/peeloff.o .libs/opt_info.o .libs/addrs.o .libs/sendmsg.o .=
libs/recvmsg.o    -march=3Darmv5te -marm -mthumb-interwork --sysroot=3D/hom=
e/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm -O2 -Wl,--version-s=
cript=3D/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gn=
ueabi/lksctp-tools/1.0.16-r0/lksctp-tools-1.0.16/src/lib/Versions.map -Wl,-=
O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed   -Wl,-soname -Wl,libsctp.so.1 -o=
 .libs/libsctp.so.1.0.16
> > -#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/us=
r/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.0/ld: error: sy=
mbol sctp_connectx has undefined version
> > -#| collect2: error: ld returned 1 exit status
> > -#| make[4]: *** [libsctp.la] Error 1
> > -PNBLACKLIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES'=
, 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d=
)}"
> > -
> > -S =3D "${WORKDIR}/${BP}"
> > +S =3D "${WORKDIR}/git"
> >
> >  BBCLASSEXTEND =3D "native"
> >
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--avkerqt47sw74awi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAln4escACgkQSfx99yw5
9par1Qf9HnxkFuJXLc6iXiUkThEfX3tc7dtdIVIJvqCzMRKxnETL3hUXhZC69rSY
lSfkdSOq3RqHEQYV/1gCgP1YzX1cTaJEGD77fMFaAQp2JA9+3s0/Csv5PiJOrMtZ
HkzNpElKzmt3Toc+sSZDU3ZDfLh8emBBf17QjOSCRTGP6h+FrLTLWorsZlFtwWNl
sHiPbA/C/TozzUGrn7gYf8BKiYW0Pw46Sgla7jCZzzHV5mOksmvpX0ffyvyiJUJw
tXMp9KFsafTHtGt+nJ1IHlIDOctW/Xx4l0Ru2I67SmPff+kX6Frg/ScSm4Ehvj/Z
s0b7+AsFuV93SHMwNuykMN3Xd+A4/A==
=F08E
-----END PGP SIGNATURE-----

--avkerqt47sw74awi--
