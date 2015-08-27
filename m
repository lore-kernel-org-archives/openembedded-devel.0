Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C724E60043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 11:00:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 27 Aug 2015 04:00:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="776660254"
Received: from djcarton-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.50])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2015 04:00:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Thu, 27 Aug 2015 12:00:24 +0100
Message-ID: <1590775.fS6PaZhfq4@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CALbNGRTyXco+x4NrbQkNSV6F+aA42r_8ZycgfBKPYuQcxyn6Kw@mail.gmail.com>
References: <1440583622-11664-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1721551.0sTJOXpHQ2@peggleto-mobl.ger.corp.intel.com>
	<CALbNGRTyXco+x4NrbQkNSV6F+aA42r_8ZycgfBKPYuQcxyn6Kw@mail.gmail.com>
MIME-Version: 1.0
Cc: Tanu Kaskinen <tanuk@iki.fi>,
	Alexander Kanavin <alexander.kanavin@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libnotify3: remove the recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Aug 2015 11:00:29 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 27 August 2015 12:49:27 Andreas M=FCller wrote:
> On Thu, Aug 27, 2015 at 10:23 AM, Paul Eggleton
>=20
> <paul.eggleton@linux.intel.com> wrote:
> > On Wednesday 26 August 2015 20:01:28 Andreas M=FCller wrote:
> >> On Wed, Aug 26, 2015 at 12:59 PM, Alexander Kanavin
> >>=20
> >> <alexander.kanavin@linux.intel.com> wrote:
> >> > On 08/26/2015 01:40 PM, Tanu Kaskinen wrote:
> >> >>>   # needs libnotify3 which conflicts with libnotify, mixing th=
em in
> >> >>>   build
> >> >>>=20
> >> >>> breaks couple of packages
> >> >>=20
> >> >> This last comment seems to be out of date after this patch.
> >> >=20
> >> > Actually, this whole thing can be removed:
> >> >=20
> >> > # needs libnotify3 which conflicts with libnotify, mixing them i=
n build
> >> > breaks couple of packages
> >> > EXCLUDE_FROM_WORLD =3D "1"
> >> >=20
> >> > Whoever applies this patch, please amend it accordingly.
> >> >=20
> >> >=20
> >> > Alex
> >>=20
> >> I think it's not that easy. We need an libnotify append here with =
some
> >> RREPLACES / RPOVIDES for libnotify3. Right?
> >=20
> > I was wondering about that myself. Really those RREPLACES + RPROVID=
ES +
> > RCONFLICTS need to go into the recipe in OE-Core though.
>=20
> Sorry to insist: I think it should be appended here: Users without
> meta-gnome in their layers have never seen libnotify3.

Does it matter? Adding these alone to the core recipe won't have any ef=
fect if=20
you've never seen it before; and we do have precedents for this kind of=
 thing.

In general I strongly believe that "software-only" layers such as the o=
nes in=20
meta-openembedded should not have any bbappends (with the possible exce=
ption=20
of toolchain-layer, assuming that's even still used) - the reason being=
, you=20
should be able to add any of those layers to your configuration and hav=
e=20
confidence that you won't experience any unexpected effects in your bui=
ld.=20
Adding RPROVIDES/RREPLACES/RCONFLICTS isn't exactly going to break the =
world,=20
I agree, but at the very least it will trigger repackaging of libnotify=
 if it=20
has already been built, which will also trigger repackaging of any othe=
r=20
dependent recipes; you might not expect that to happen just by adding t=
he=20
layer to your bblayers.conf. That's what I'd like to avoid.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

