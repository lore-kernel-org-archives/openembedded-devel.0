Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1UYHzB-0001fG-Go
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 17:33:27 +0200
Received: (qmail 17993 invoked by uid 1003); 3 May 2013 15:15:29 -0000
Received: from unknown (HELO ?192.168.1.106?)
	(philip@opensdr.com@71.171.26.125)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	3 May 2013 15:15:29 -0000
Message-ID: <5183D490.8050804@balister.org>
Date: Fri, 03 May 2013 11:15:28 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<576F47F5-73BA-4369-9A2E-666939097E0A@dominion.thruhere.net>
	<CAP71WjwFFivLQ1NaMtudjCZyv1D_Xtodf5utigWPACAg=OA5dw@mail.gmail.com>
	<2863767.6XU4RXlosl@helios> <20130503150917.GB3187@jama>
In-Reply-To: <20130503150917.GB3187@jama>
X-Enigmail-Version: 1.5.1
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] smartmontools: import from OE classic
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
X-List-Received-Date: Fri, 03 May 2013 15:33:27 -0000
X-Groupsio-MsgNum: 44587
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="----enig2IIRDTDSDXLKJMFSDPQQI"

------enig2IIRDTDSDXLKJMFSDPQQI
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 05/03/2013 11:09 AM, Martin Jansa wrote:
> On Fri, May 03, 2013 at 03:42:30PM +0100, Paul Eggleton wrote:
>> On Friday 03 May 2013 16:30:17 Nicolas Dechesne wrote:
>>> On Fri, May 3, 2013 at 4:10 PM, Koen Kooi <koen@dominion.thruhere.net=
>wrote:
>>>>> I agree we should try to keep only one version of each recipe in
>>>>> software
>>>>> layers, however I figure it makes it easier for people to carry the=
ir
>>>>> own
>>>>> versions of recipes in distro layers (particularly older, which may=
 be
>>>>> required in certain circumstances) if we do keep inc files where th=
ey
>>>>> already exist.
>>>
>>>> Can people raise their hand if they want to have a different version=
 of
>>>> smartmontools in their layer?
>>>
>>> i think it would be nice to have a policy for that. i am going to sen=
d a
>>> couple of recipes for new components, and it would be good to know wh=
at's
>>> the agreed 'policy' for .inc file.=20
>>
>> We probably should have a stated policy, yes. AFAIK the current perhap=
s=20
>> unstated policy is to keep the inc file if it existed in OE-Classic.
>=20
> I don't have strong opinion about keeping/loosing .inc files, but
> I've removed couple of .inc files when importing stuff from OE-Classic
> in cases where .inc is relatively short (like in smartmontools).=20
>=20
> I would keep .inc when it's reused in different recipes or really
> long/complicated (like mesa.inc).
>=20
> We also have policy that there is only one version per recipe if
> possible.

I agree with Martin. I've dropped some .inc files for recipes I worry
about also.

Philip

>=20
>>> in fact, it's not even clear to me why
>>> have .inc file is easier to carry different version in distro layers.=
 well
>>> it's just a 'large' recipe to carry over..
>>
>> If you carry over the whole recipe rather than "require recipes-
>> xyz/foo/foo.inc", then you won't get any improvements to the non-versi=
on-
>> specific parts of the recipe when the base layer updates in the future=
=2E
>>
>> Alternatively if you "require recipes-xyz/foo/foo_6.5.bb" because ther=
e is no=20
>> .inc, then your recipe will definitely break the next time the recipe =
in the=20
>> base layer is upgraded, plus you may have to override more parts of th=
e recipe=20
>> that are specific to a different version than the one you are building=
=2E
>>
>> Cheers,
>> Paul
>>
>> --=20
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=

>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20


------enig2IIRDTDSDXLKJMFSDPQQI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJRg9SQAAoJEMDJd4rr0merchkH/jj6tSTc20zCbLSveZ2YELrD
DPD+PLJCV72fCTzQJXzqEvGrkFBc0BhrTZVmvyKGGWK3Lj6c1ND1P0ushqFm+3FB
uDKD+HDok8/ynnDliWq3jVPCnd32EOiwQfCYraYfFnLEPKouNzPAjn8DvL7tYfsC
oJfblZEY/3O3fFlDDFZgfBYpbjaFkOKdIiWiLQO/nv+xKGx+Ib0HSE75Y21wvcoI
VIleAbBEEjVoNhnCwIBlwa+Ctgih/YdR3PU/gxX8j+dbpGy35c0cAqIlMfqD+10/
68ggyxYQxwyNNcr8DjZKwkyJHA0taV4azTH7XwlPvs0ttA5xFAwGIr/cXbvS2Og=
=0zpM
-----END PGP SIGNATURE-----

------enig2IIRDTDSDXLKJMFSDPQQI--
