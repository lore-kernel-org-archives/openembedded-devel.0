Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 970567199B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 19:45:38 +0000 (UTC)
Received: (qmail 12756 invoked by uid 1003); 17 Feb 2017 19:45:38 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.116.166)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	17 Feb 2017 19:45:38 -0000
To: openembedded-devel@lists.openembedded.org
References: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
	<CALbNGRSPZw+LL3JXv4+D+k2C3DAV=5_U=44M8fcSU50V_-7KEw@mail.gmail.com>
	<20170217180254.GA3276@jama> <20170217182816.GD8436@mentor.com>
From: Philip Balister <philip@balister.org>
Message-ID: <3870658c-01ec-252b-9940-a6af3fb1f529@balister.org>
Date: Fri, 17 Feb 2017 14:45:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170217182816.GD8436@mentor.com>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Fri, 17 Feb 2017 19:45:38 -0000
X-Groupsio-MsgNum: 65292
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="4i4s8nVvlNcFeOFmf7thDKCO3djRAEJLt"

--4i4s8nVvlNcFeOFmf7thDKCO3djRAEJLt
Content-Type: multipart/mixed; boundary="XDIGiheh4uNRi9QUqSgplrdpU1CFj4tUs";
 protected-headers="v1"
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <3870658c-01ec-252b-9940-a6af3fb1f529@balister.org>
Subject: Re: [oe] Splitting meta-oe?
References: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
 <CALbNGRSPZw+LL3JXv4+D+k2C3DAV=5_U=44M8fcSU50V_-7KEw@mail.gmail.com>
 <20170217180254.GA3276@jama> <20170217182816.GD8436@mentor.com>
In-Reply-To: <20170217182816.GD8436@mentor.com>

--XDIGiheh4uNRi9QUqSgplrdpU1CFj4tUs
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 02/17/2017 01:28 PM, Joe MacDonald wrote:
> [Re: [oe] Splitting meta-oe?] On 17.02.17 (Fri 19:02) Martin Jansa wrot=
e:
>=20
>> On Fri, Feb 17, 2017 at 06:24:09PM +0100, Andreas M=FCller wrote:
>>> On Fri, Feb 17, 2017 at 6:07 PM, Burton, Ross <ross.burton@intel.com>=
 wrote:
>>>> The recent storm of breakage in meta-oe caused by recipe specific sy=
sroots
>>>> was quite dramatic:
>>>>
>>>> ross@flashheart ~/Yocto/meta-oe ((044e518...))
>>>> $ git grep PNBLACKLIST| wc -l
>>>> 320
>>>>
>>>> Is it time to talk about splitting meta-oe into smaller real reposit=
ories
>>>> so they can be maintained at their own pace by more maintainers?
>>>>
>>>> Ross
>>> What exactly gets better by splitting?
>>
>> I agree with Andreas.
>=20
> And I agree with both of you.
>=20
>> 1) RSS is good thing.
>>
>> 2) The breakage wasn't caused by lack of maintainers (at least I don't=

>>    think that I or Joe were the bottleneck for integrating the fixes).=

>=20
> My schedule is highly variable but I do try to be responsive to
> breakages and I do my best to watch and digest the state of the world
> messages, those are extremely valuable IMO.
>=20
>> 3) More maintainers doesn't mean more contributions from people actual=
ly
>>    using now broken components, it's actually easier to just send a fi=
x
>>    than to be a maintainer of some layer just to be able to also merge=

>>    your fix yourself.
>>
>> 4) It doesn't look so dramatic if it turns out that 200 of those
>>    blacklisted recipes weren't actually used by anyone still active in=

>>    OE ecosystem.
>=20
> Agreed.  And if those blacklisted recipes are something that someone
> in the ecosystem cares about, they really should be sending fixes back
> upstream.  Breaking meta-oe up into smaller parts doesn't seem likely t=
o
> make them more likely to send patches, AFAICT.  Probably won't make the=
m
> less-so, either, but I don't see changing the structure to be a
> significant win.
>=20
> And do note that when we first created meta-networking I was proposing
> it be separate from meta-oe, I'm now completely on the other side of
> that argument, for what that's worth.
>=20
>> 5) If someone wants to replace me as meta-oe maintainer, go ahead, it
>>    stopped being fun for me long time ago, now it's just slightly anno=
ying
>>    routine which takes my free time I would rather invest in something=

>>    cooler
>=20
> I frankly think that'd be a loss for everyone, but it's understandable.=

> That's a big, largely thankless job you've taken on.  Obviously I can't=

> offer to take on more of the job than I already have with
> meta-networking or I would, but maybe someone else with a similarly "bi=
g
> picture" view will be able to share some of the workload.

And I'm with these gyus. Splitting the git repository doesn't solve any
underlying problems. The real problem from my point of view is very few
of use are actually paid to maintain the layers we maintain.

Employers want to pay things they profit from, and that is not paying
someone to maintain "core infrastructure".

Layer maintainers interests change over time, and you burn out
supporting people who get to do all the cool stuff with the layers you
maintain. In the end, you get all the crap and non of the glory. Within
this list, most people appreciate your work. Outside the community,
people completely underestimate the amount of work required to keep the
ecosystem running.

Yeah, add my name to the list of cranky people.

Philip

>=20
> -J.
>=20
>>
>> Regards,
>>
>>> Splitting =3D Rotting to death due to unmanageable maintenance burden=

>>> caused by oe? Don't misunderstand me recipe specific sysroot is
>>> basically a good thing. But I am tired of this game. As you can see i=
n
>>> meta-qt5-extra: I am interested in having cool images not in a cool
>>> build system. Long live core-image-sato!
>>>
>>> Andreas
>>> --=20
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> --=20
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
>=20
>=20


--XDIGiheh4uNRi9QUqSgplrdpU1CFj4tUs--

--4i4s8nVvlNcFeOFmf7thDKCO3djRAEJLt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQExBAEBCAAbBQJYp1LhFBxwaGlsaXBAYmFsaXN0ZXIub3JnAAoJEMDJd4rr0mer
GOIIAIpE0Qf39sCyIMBbAwvUUXTWaybYNLrAzaiY9/iL1zjaIHIxGV3hBLRdge8t
qBXLwt/4D45EDBRyA03z//N01to9YbsI/vPJcP+MPCQCcQqEiN+XrvSpkSl0P77O
adyOZ9umXmhDs0JHkbWE6wkrQB/+WE1cLXQsTgMzzNdcgTMCk1OEJrPYo8EG7e1b
8AQMPWmrvrO9GudHSglTqhabOqu9m7u1qQG/4W80SPmWU/kvjb88XqmdkPfSHHUw
EqiV8m0+MHc+IqvCdY/POx2xuD/xEeuor15VSxnq3PODnDq6bix63JNHWhuP7YUd
svqObxwdAqgMIgsPUKuztCMSuQs=
=M676
-----END PGP SIGNATURE-----

--4i4s8nVvlNcFeOFmf7thDKCO3djRAEJLt--
