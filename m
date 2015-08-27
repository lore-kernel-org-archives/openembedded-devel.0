Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 931C47665D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 08:23:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 27 Aug 2015 01:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,421,1437462000"; d="scan'208";a="549423695"
Received: from djcarton-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.50])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Aug 2015 01:23:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2015 09:23:18 +0100
Message-ID: <1721551.0sTJOXpHQ2@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CALbNGRR_j3f-KzA4iPQsdGsYe_VcqZYhhGBZ-8+FiHHRuwiDbA@mail.gmail.com>
References: <1440583622-11664-1-git-send-email-alexander.kanavin@linux.intel.com>
	<55DD9BFE.6050807@linux.intel.com>
	<CALbNGRR_j3f-KzA4iPQsdGsYe_VcqZYhhGBZ-8+FiHHRuwiDbA@mail.gmail.com>
MIME-Version: 1.0
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	Tanu Kaskinen <tanuk@iki.fi>
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
X-List-Received-Date: Thu, 27 Aug 2015 08:23:24 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday 26 August 2015 20:01:28 Andreas M=FCller wrote:
> On Wed, Aug 26, 2015 at 12:59 PM, Alexander Kanavin
>=20
> <alexander.kanavin@linux.intel.com> wrote:
> > On 08/26/2015 01:40 PM, Tanu Kaskinen wrote:
> >>>   # needs libnotify3 which conflicts with libnotify, mixing them =
in
> >>>   build
> >>>=20
> >>> breaks couple of packages
> >>=20
> >> This last comment seems to be out of date after this patch.
> >=20
> > Actually, this whole thing can be removed:
> >=20
> > # needs libnotify3 which conflicts with libnotify, mixing them in b=
uild
> > breaks couple of packages
> > EXCLUDE_FROM_WORLD =3D "1"
> >=20
> > Whoever applies this patch, please amend it accordingly.
> >=20
> >=20
> > Alex
>=20
> I think it's not that easy. We need an libnotify append here with som=
e
> RREPLACES / RPOVIDES for libnotify3. Right?

I was wondering about that myself. Really those RREPLACES + RPROVIDES +=
=20
RCONFLICTS need to go into the recipe in OE-Core though.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

