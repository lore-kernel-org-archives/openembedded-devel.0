Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1PsTr5-0007Qq-Dt
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 06:35:11 +0100
Received: by gravedo.de (Postfix, from userid 5001)
	id A3A40799025; Thu, 24 Feb 2011 06:33:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (dslb-088-071-188-242.pools.arcor-ip.net
	[88.71.188.242]) by gravedo.de (Postfix) with ESMTPSA id 2F638798D67
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 06:33:48 +0100 (CET)
Date: Thu, 24 Feb 2011 06:33:47 +0100
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110224053346.GA15439@nirvana>
References: <1297199824-3712-1-git-send-email-morphis@gravedo.de>
	<4D51B81D.8000800@mentor.com>
	<AANLkTikbfyoZfnJq9k1fSkMVMkReNw0G8APuXjc_rTyY@mail.gmail.com>
	<iium4d$gau$1@dough.gmane.org> <20110209193129.GA15397@nirvana>
	<4D52EEE5.9030309@mentor.com>
	<AANLkTin0nJfcj1wFiYcbXLyLa9tk_Dy8yn8Lp3=PGNHC@mail.gmail.com>
	<4D53272F.1020400@mentor.com> <1298454891.3892.3.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1298454891.3892.3.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Thu, 24 Feb 2011 05:35:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02/23/11 at 10:54am, Paul Menzel wrote:
> Am Mittwoch, den 09.02.2011, 16:45 -0700 schrieb Tom Rini:
> > On 02/09/2011 01:44 PM, Khem Raj wrote:
> > > On Wed, Feb 9, 2011 at 11:45 AM, Tom Rini<tom_rini@mentor.com>  wro=
te:
> > >> On 02/09/2011 12:31 PM, Simon Busch wrote:
> > >>>
> > >>> On 02/09/11 at 07:24pm, Koen Kooi wrote:
> > >>>>
> > >>>> -----BEGIN PGP SIGNED MESSAGE-----
> > >>>> Hash: SHA1
> > >>>
> > >>>> On 09-02-11 19:16, Khem Raj wrote:
> > >>>>>
> > >>>>> On Tue, Feb 8, 2011 at 1:39 PM, Tom Rini<tom_rini@mentor.com>  =
  wrote:
> > >>>>>>
> > >>>>>> On 02/08/2011 02:17 PM, Simon Busch wrote:
> > >>>>>>>
> > >>>>>>> Neon support in evas is currently broken for the palmpre mach=
ine. If
> > >>>>>>> we
> > >>>>>>> enable neon
> > >>>>>>> support evas causes alignment trap errors and lets the device=
 freeze
> > >>>>>>> in
> > >>>>>>> the end. This
> > >>>>>>> should be reverted after the bug in evas code is found and fi=
xed.
> > >>>>>>>
> > >>>>>>> Signed-off-by: Simon Busch<morphis@gravedo.de>
> > >>>>>>> ---
> > >>>>>>>   recipes/efl1/evas.inc |    5 ++++-
> > >>>>>>>   1 files changed, 4 insertions(+), 1 deletions(-)
> > >>>>>>>
> > >>>>>>> diff --git a/recipes/efl1/evas.inc b/recipes/efl1/evas.inc
> > >>>>>>> index eb64d7a..ad30eba 100644
> > >>>>>>> --- a/recipes/efl1/evas.inc
> > >>>>>>> +++ b/recipes/efl1/evas.inc
> > >>>>>>> @@ -7,7 +7,7 @@ DEPENDS_virtclass-native =3D "freetype-native
> > >>>>>>> libxext-native
> > >>>>>>> libpng-native jpeg-na
> > >>>>>>>   inherit efl
> > >>>>>>>
> > >>>>>>>   BBCLASSEXTEND =3D "native"
> > >>>>>>> -INC_PR =3D "r0"
> > >>>>>>> +INC_PR =3D "r1"
> > >>>>>>>   FILESPATHPKG =3D. "${BPN}-${PV}:${BPN}:"
> > >>>>>>>
> > >>>>>>>   python populate_packages_prepend () {
> > >>>>>>> @@ -83,6 +83,9 @@ EVAS_CPU_TWEAKS =3D ""
> > >>>>>>>   # Disabled for now, see
> > >>>>>>>
> > >>>>>>> http://thread.gmane.org/gmane.comp.window-managers.enlightenm=
ent.devel/25194
> > >>>>>>>   #EVAS_CPU_TWEAKS_armv7a =3D "--enable-cpu-neon"
> > >>>>>>>
> > >>>>>>> +# Neon support for evas is broken on palmpre currently (caus=
es the device
> > >>>>>>> to freeze)
> > >>>>>>> +EVAS_CPU_TWEAKS_palmpre =3D "--disable-cpu-neon"
> > >>>>>>> +
> > >>>>>>>   # common options
> > >>>>>>>   EVAS_OECONF =3D " \
> > >>>>>>>                   --x-includes=3D${STAGING_INCDIR}/X11 \
> > >>>>>>
> > >>>>>> Shouldn't this be changing the armv7a EVAS_CPU_TWEAKS that's a=
bove
> > >>>>>> yours to
> > >>>>>> be uncommented and as a --disable?
> > >>>>>
> > >>>>> that would disable neon for all armv7a machines probably not wh=
at is
> > >>>>> needed here.
> > >>>
> > >>>> Actually, that was how I did it :) The NEON code that was added =
doesn't
> > >>>> build with gcc 4.3.x and binutils 2.18.x, so I disabled it by no=
t
> > >>>> enabling it. If it builds and works with gcc 4.3.x nowadays we s=
hould
> > >>>> enable it and find out why the palmpre breaks.
> > >>>
> > >>> Evas builds fine these days with neon support enabled but it enab=
les it by
> > >>> default. I really need to find the cause of the breakage on the p=
almpre
> > >>> but don't have too much time to debug it so this is a interim sol=
ution only
> > >>> until the bug is found and fixed.
> > >
> > > that would be nice because once we add machine override it can beco=
me
> > > a common escape for other machines
> > > and changing this to be a machine specific recipe is not desired
> > > unless absolutely needed
> > >
> > >>
> > >> My only concern is that are we sure other armv7a targets aren't al=
so having
> > >> fatal problems?
> > >
> > > we don't fix what we don't know is broken
> >=20
> > Right.  But it sounds like it shouldn't be too hard to see if it is=20
> > broken elsewhere :)

> This patch [1] is superseded by Koen=E2=80=99s commit d6729be1 [2].

I already saw Koen's commit but nevertheless someone should try to find o=
ut=20
why Neon makes such troubles on our arm targets.=20

regards,
SImon


