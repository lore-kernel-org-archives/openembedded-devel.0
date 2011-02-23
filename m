Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PsBS5-00005q-G3 for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 10:56:10 +0100
Received: from f053038013.adsl.alicedsl.de ([78.53.38.13]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PsBQq-0004G5-E0 for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 09:54:52 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D53272F.1020400@mentor.com>
References: <1297199824-3712-1-git-send-email-morphis@gravedo.de>
	<4D51B81D.8000800@mentor.com>
	<AANLkTikbfyoZfnJq9k1fSkMVMkReNw0G8APuXjc_rTyY@mail.gmail.com>
	<iium4d$gau$1@dough.gmane.org> <20110209193129.GA15397@nirvana>
	<4D52EEE5.9030309@mentor.com>
	<AANLkTin0nJfcj1wFiYcbXLyLa9tk_Dy8yn8Lp3=PGNHC@mail.gmail.com>
	<4D53272F.1020400@mentor.com>
Date: Wed, 23 Feb 2011 10:54:51 +0100
Message-ID: <1298454891.3892.3.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] evas: disable cpu neon support for palmpre machine
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
X-List-Received-Date: Wed, 23 Feb 2011 09:56:10 -0000
X-Groupsio-MsgNum: 29592
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-w1Js/8oVBmDQkjWYCoUa"

--=-w1Js/8oVBmDQkjWYCoUa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 09.02.2011, 16:45 -0700 schrieb Tom Rini:
> On 02/09/2011 01:44 PM, Khem Raj wrote:
> > On Wed, Feb 9, 2011 at 11:45 AM, Tom Rini<tom_rini@mentor.com>  wrote:
> >> On 02/09/2011 12:31 PM, Simon Busch wrote:
> >>>
> >>> On 02/09/11 at 07:24pm, Koen Kooi wrote:
> >>>>
> >>>> -----BEGIN PGP SIGNED MESSAGE-----
> >>>> Hash: SHA1
> >>>
> >>>> On 09-02-11 19:16, Khem Raj wrote:
> >>>>>
> >>>>> On Tue, Feb 8, 2011 at 1:39 PM, Tom Rini<tom_rini@mentor.com>    wr=
ote:
> >>>>>>
> >>>>>> On 02/08/2011 02:17 PM, Simon Busch wrote:
> >>>>>>>
> >>>>>>> Neon support in evas is currently broken for the palmpre machine.=
 If
> >>>>>>> we
> >>>>>>> enable neon
> >>>>>>> support evas causes alignment trap errors and lets the device fre=
eze
> >>>>>>> in
> >>>>>>> the end. This
> >>>>>>> should be reverted after the bug in evas code is found and fixed.
> >>>>>>>
> >>>>>>> Signed-off-by: Simon Busch<morphis@gravedo.de>
> >>>>>>> ---
> >>>>>>>   recipes/efl1/evas.inc |    5 ++++-
> >>>>>>>   1 files changed, 4 insertions(+), 1 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/recipes/efl1/evas.inc b/recipes/efl1/evas.inc
> >>>>>>> index eb64d7a..ad30eba 100644
> >>>>>>> --- a/recipes/efl1/evas.inc
> >>>>>>> +++ b/recipes/efl1/evas.inc
> >>>>>>> @@ -7,7 +7,7 @@ DEPENDS_virtclass-native =3D "freetype-native
> >>>>>>> libxext-native
> >>>>>>> libpng-native jpeg-na
> >>>>>>>   inherit efl
> >>>>>>>
> >>>>>>>   BBCLASSEXTEND =3D "native"
> >>>>>>> -INC_PR =3D "r0"
> >>>>>>> +INC_PR =3D "r1"
> >>>>>>>   FILESPATHPKG =3D. "${BPN}-${PV}:${BPN}:"
> >>>>>>>
> >>>>>>>   python populate_packages_prepend () {
> >>>>>>> @@ -83,6 +83,9 @@ EVAS_CPU_TWEAKS =3D ""
> >>>>>>>   # Disabled for now, see
> >>>>>>>
> >>>>>>> http://thread.gmane.org/gmane.comp.window-managers.enlightenment.=
devel/25194
> >>>>>>>   #EVAS_CPU_TWEAKS_armv7a =3D "--enable-cpu-neon"
> >>>>>>>
> >>>>>>> +# Neon support for evas is broken on palmpre currently (causes t=
he device
> >>>>>>> to freeze)
> >>>>>>> +EVAS_CPU_TWEAKS_palmpre =3D "--disable-cpu-neon"
> >>>>>>> +
> >>>>>>>   # common options
> >>>>>>>   EVAS_OECONF =3D " \
> >>>>>>>                   --x-includes=3D${STAGING_INCDIR}/X11 \
> >>>>>>
> >>>>>> Shouldn't this be changing the armv7a EVAS_CPU_TWEAKS that's above
> >>>>>> yours to
> >>>>>> be uncommented and as a --disable?
> >>>>>
> >>>>> that would disable neon for all armv7a machines probably not what i=
s
> >>>>> needed here.
> >>>
> >>>> Actually, that was how I did it :) The NEON code that was added does=
n't
> >>>> build with gcc 4.3.x and binutils 2.18.x, so I disabled it by not
> >>>> enabling it. If it builds and works with gcc 4.3.x nowadays we shoul=
d
> >>>> enable it and find out why the palmpre breaks.
> >>>
> >>> Evas builds fine these days with neon support enabled but it enables =
it by
> >>> default. I really need to find the cause of the breakage on the palmp=
re
> >>> but don't have too much time to debug it so this is a interim solutio=
n only
> >>> until the bug is found and fixed.
> >
> > that would be nice because once we add machine override it can become
> > a common escape for other machines
> > and changing this to be a machine specific recipe is not desired
> > unless absolutely needed
> >
> >>
> >> My only concern is that are we sure other armv7a targets aren't also h=
aving
> >> fatal problems?
> >
> > we don't fix what we don't know is broken
>=20
> Right.  But it sounds like it shouldn't be too hard to see if it is=20
> broken elsewhere :)

This patch [1] is superseded by Koen=E2=80=99s commit d6729be1 [2].


Thanks,

Paul


[1] http://patches.openembedded.org/patch/497/
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dd6729be=
1fd7f2e82e7535a854e2aae006aaec5ee

--=-w1Js/8oVBmDQkjWYCoUa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1k2WUACgkQPX1aK2wOHVg0LQCeOMSqHtatSSto6uWztmN+1szf
Mo4AniApzcFSB6b+6Q5lddE0RIBSkflF
=aVnc
-----END PGP SIGNATURE-----

--=-w1Js/8oVBmDQkjWYCoUa--
