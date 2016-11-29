Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7526F71A22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 22:34:42 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2016 14:34:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,570,1473145200"; 
	d="asc'?scan'208";a="36969024"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.5.146])
	([10.219.5.146])
	by orsmga005.jf.intel.com with ESMTP; 29 Nov 2016 14:34:43 -0800
To: Tom Rini <trini@konsulko.com>, openembedded-devel@lists.openembedded.org
References: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
	<20161129204327.GG2546@bill-the-cat>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <d93f4841-0154-2232-1802-2b8fcc85a81c@linux.intel.com>
Date: Tue, 29 Nov 2016 16:34:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161129204327.GG2546@bill-the-cat>
Cc: Patrick Ohly <patrick.ohly@intel.com>,
	Michael Halstead <michael@yoctoproject.org>
Subject: Re: meta-openembedded patchwork git hook
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
X-List-Received-Date: Tue, 29 Nov 2016 22:34:43 -0000
X-Groupsio-MsgNum: 64119
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="xrEqmDmKB4R7P7d2sl1jHRPL0Aem0rg8J"

--xrEqmDmKB4R7P7d2sl1jHRPL0Aem0rg8J
Content-Type: multipart/mixed; boundary="tExnTQSWeoB3WsSSLKmjliRk1WtV2oCRu";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: Tom Rini <trini@konsulko.com>, openembedded-devel@lists.openembedded.org
Cc: Michael Halstead <michael@yoctoproject.org>,
 Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <d93f4841-0154-2232-1802-2b8fcc85a81c@linux.intel.com>
Subject: Re: [oe] meta-openembedded patchwork git hook
References: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
 <20161129204327.GG2546@bill-the-cat>
In-Reply-To: <20161129204327.GG2546@bill-the-cat>

--tExnTQSWeoB3WsSSLKmjliRk1WtV2oCRu
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 11/29/2016 02:43 PM, Tom Rini wrote:
> On Wed, Nov 30, 2016 at 06:52:46AM +1300, Paul Eggleton wrote:
>=20
>> Hi folks,
>>
>> Martin just brought to my attention that the git hook for the=20
>> meta-openembedded repository that's supposed to update patchwork still=
 isn't=20
>> working and hasn't done so for a very long time. I thought we'd fixed =
this so=20
>> that merged patches get marked as "Accepted", but at least for meta-
>> openembedded it seems like that's not the case.
>>
>> Jose / Michael - can you look into this if you haven't already? Please=
 let me=20
>> know if you need any help.

The git hook was configured to update OE-core only, Michael will help us
to include meta-openembedded.

>=20
> Since I brought this up on IRC, I wanted to chime in here.  First, if
> you want to use top-of-tree patchwork you'll also want to grab
> https://patchwork.ozlabs.org/bundle/stephenfin/post-receive%20fixes/


Hi Tom, nice meeting you. OE-Patchwork is using a fork in [1] from
freedesktop.org's patchwork at [2]. I will look at the hook fixes you
mentioned at the first chance, thanks for the tip.

> (and fwiw, I also have been setting the DJANGO part to 'dev' rather tha=
n
> production for my use-case).  Second, I think part of the problem is
> that there are just some cases where the hashing fails, which for me is=

> around 10% of the time.  Depending on how much one uses bundles and
> tracks what ends up being committed this may or may not be a problem.
> And I'm sure upstream patchwork would appreciate any changes to improve=

> hashing success :)
>=20

Regards
Jose

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--tExnTQSWeoB3WsSSLKmjliRk1WtV2oCRu--

--xrEqmDmKB4R7P7d2sl1jHRPL0Aem0rg8J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJYPgKGAAoJEFJAtowlSEbnTYoH/Rw6jVOvW/r++iefTo1zS0UK
nDQ+AMnf4TaOrs5sCqRIzmknqORbxkQ0QpFQ35EFmAPEbtfwGD98q/Wq/Hcv1uiZ
QbUlDnqMwQNVNbccKR6AFdZCgzbhx3OJiMUhn0IzzxwOkZHIqwxnmNuInBrjyO0d
NqgpiTRtTT9XbJE7o3NmX9MJPOX7pzv+SDNKe/+IZGWvIJwEq9vxwYdO8D2yNCOG
lW5nTBigcA70paI1BbnF0EmgSC13/vJxdEykqUfpuk0M7FH13EmGAqWNksrDHMrC
kGdFgG/freb0xaAtylIPxLBDdZ1EsWr+b+5jR2R1r51vRRL9OWv6H6kFtzdxOOc=
=BQTe
-----END PGP SIGNATURE-----

--xrEqmDmKB4R7P7d2sl1jHRPL0Aem0rg8J--
