Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DB80871AC5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 18:41:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Nov 2016 10:41:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,574,1473145200"; 
	d="asc'?scan'208";a="11739777"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.5.146])
	([10.219.5.146])
	by orsmga002.jf.intel.com with ESMTP; 30 Nov 2016 10:41:20 -0800
To: openembedded-devel@lists.openembedded.org
References: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
	<20161129204327.GG2546@bill-the-cat>
	<d93f4841-0154-2232-1802-2b8fcc85a81c@linux.intel.com>
	<19E9BF3F-664F-42A4-A170-5B7BB473ED80@gmail.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <53ca2ead-1b75-ff6d-30c1-abb16330bad3@linux.intel.com>
Date: Wed, 30 Nov 2016 12:41:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <19E9BF3F-664F-42A4-A170-5B7BB473ED80@gmail.com>
Cc: Tom Rini <trini@konsulko.com>, Patrick Ohly <patrick.ohly@intel.com>,
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
X-List-Received-Date: Wed, 30 Nov 2016 18:41:28 -0000
X-Groupsio-MsgNum: 64166
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="uGS8ONqEX059lKlpuC0GNatUU4SUlinI3"

--uGS8ONqEX059lKlpuC0GNatUU4SUlinI3
Content-Type: multipart/mixed; boundary="ue67CtfILgbxD0k9GDIM3oLWV0orNFc1F";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Rini <trini@konsulko.com>, Patrick Ohly <patrick.ohly@intel.com>,
 Michael Halstead <michael@yoctoproject.org>
Message-ID: <53ca2ead-1b75-ff6d-30c1-abb16330bad3@linux.intel.com>
Subject: Re: [oe] meta-openembedded patchwork git hook
References: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
 <20161129204327.GG2546@bill-the-cat>
 <d93f4841-0154-2232-1802-2b8fcc85a81c@linux.intel.com>
 <19E9BF3F-664F-42A4-A170-5B7BB473ED80@gmail.com>
In-Reply-To: <19E9BF3F-664F-42A4-A170-5B7BB473ED80@gmail.com>

--ue67CtfILgbxD0k9GDIM3oLWV0orNFc1F
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 11/29/2016 07:50 PM, Khem Raj wrote:
>=20
>> On Nov 29, 2016, at 2:34 PM, Jose Lamego <jose.a.lamego@linux.intel.co=
m> wrote:
>>
>>
>>
>> On 11/29/2016 02:43 PM, Tom Rini wrote:
>>> On Wed, Nov 30, 2016 at 06:52:46AM +1300, Paul Eggleton wrote:
>>>
>>>> Hi folks,
>>>>
>>>> Martin just brought to my attention that the git hook for the=20
>>>> meta-openembedded repository that's supposed to update patchwork sti=
ll isn't=20
>>>> working and hasn't done so for a very long time. I thought we'd fixe=
d this so=20
>>>> that merged patches get marked as "Accepted", but at least for meta-=

>>>> openembedded it seems like that's not the case.
>>>>
>>>> Jose / Michael - can you look into this if you haven't already? Plea=
se let me=20
>>>> know if you need any help.
>>
>> The git hook was configured to update OE-core only, Michael will help =
us
>> to include meta-openembedded.
>>
>=20
> There are more repos using patchwork beyond OE-core and meta-opemebedde=
d
> please enable it for all of them  as well.
>=20

Now all of the projects are enabled to receive automatic updates from
the git-hook (Thanks Michael). Please let me know if any undesired
behavior is detected.

>>>
>>> Since I brought this up on IRC, I wanted to chime in here.  First, if=

>>> you want to use top-of-tree patchwork you'll also want to grab
>>> https://patchwork.ozlabs.org/bundle/stephenfin/post-receive%20fixes/
>>
>>
>> Hi Tom, nice meeting you. OE-Patchwork is using a fork in [1] from
>> freedesktop.org's patchwork at [2]. I will look at the hook fixes you
>> mentioned at the first chance, thanks for the tip.
>>
>>> (and fwiw, I also have been setting the DJANGO part to 'dev' rather t=
han
>>> production for my use-case).  Second, I think part of the problem is
>>> that there are just some cases where the hashing fails, which for me =
is
>>> around 10% of the time.  Depending on how much one uses bundles and
>>> tracks what ends up being committed this may or may not be a problem.=

>>> And I'm sure upstream patchwork would appreciate any changes to impro=
ve
>>> hashing success :)
>>>
>>
>> Regards
>> Jose
>>
>> --=20
>> Jose Lamego | OTC Embedded Platforms & Tools | GDC
>>
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--ue67CtfILgbxD0k9GDIM3oLWV0orNFc1F--

--uGS8ONqEX059lKlpuC0GNatUU4SUlinI3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJYPx1UAAoJEFJAtowlSEbnc6IIAIjc6AIF+EMiokE2B2dwMEO7
wYBLhPw05lB5FdqQkZRZaZDpHKqfuFluXuUJ3wZJYYyf3rXIlyCcCU6SRXZrA7kn
i2xOFVIbEM0NVXhSo0nu+QBVE3jhy9thIGOx9jl+pbPDdNrVTRc2BkEy4O6mCrj3
1IAYdYs94BoX4w2DjtHmF6HkxlNyhCWEh1kYC8hjksR12wCcOUTx/HCmEhS3wTxe
Jo+YBBIZwwvMgmILVo0eTU0BYq4K87jvRWkdzEissSXX6cWA/rtVxCaJEkg9mj+t
FeJ0SthmFags0jmhxA5aSaKLUgsm2mBJQxQmZNzIWhd3r9bS1wzTbgYXifiKiyk=
=YWzE
-----END PGP SIGNATURE-----

--uGS8ONqEX059lKlpuC0GNatUU4SUlinI3--
