Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id DB93B77D0C;
	Mon, 10 Jul 2017 22:17:37 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id k14so56317749pgr.0;
	Mon, 10 Jul 2017 15:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=COQ4JwFhK2S+lLsJrtGqIAMbDYZfFs/GrSvrUeH6QPk=;
	b=K+Qcni/C2xCK7mvO2RmxAqQ03+AeIH8N6FGs9aBe+Vdt+lajewWCed4T8yo8PWxOod
	QV8mvXbVALQxpzM6b9k1yTsr7YZTP8gZiHYQLAbM/doAf59JbEJP6tz0QThrzW+SsxfG
	XTioiXSkYoaPX3FhCuj+POFODv8o0bUtWP9tGH2/whBQ3OIwfRn0zAyRH+IJSZstWe2V
	BZLjju4MP6SBGIASy3YMDIfbLvAWUGjZHPbyzIbDz54Mh3j+pfQM5NmDatunWrjbFzye
	Dcxw33NkwfnVp1AbNy5MhN4tZFM5teE6QepNGdQeASXlqJ7RmiEIaoiEoMke7b68Kkc4
	v3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=COQ4JwFhK2S+lLsJrtGqIAMbDYZfFs/GrSvrUeH6QPk=;
	b=XZ6/t1B1FO/B8LZEMRF4+14ptkb0dIQ2mKLAeaUykuwIts+7GNebGJefGxLxJQUX13
	gCCOsdAsD51vUA8pVg/XngwpQKpHt6Ai42jZPiTWNshayXFmSRxOGtYWqlE96j8gXch4
	yk8aB8kuh2ONAK/eE4ye834DMq2YLJF87bnQYbTFD2M6+8+onnI46THIjUrObZLxPPQy
	tzEKiKGPtqXi53g/e0h5xRU7+1HWBGxz1WI4y1pwOPRyA/NuR3LPAc2eJP+QDwIoqDUE
	8FjecjzUchEasBlnhnYG0tMPTP5iFTmds3zBL1XxkCyym0taqiIT/a41GdrCHMGmThPF
	c13g==
X-Gm-Message-State: AIVw111pbsTU2NfI0e61tnWKQ8RlUvDnZmjhAtvw3Swo+saUJVjpzRAX
	3dHA8+QG4M5CjEgJkjE=
X-Received: by 10.99.2.213 with SMTP id 204mr16598429pgc.180.1499725058700;
	Mon, 10 Jul 2017 15:17:38 -0700 (PDT)
Received: from Khems-MacBook-Pro.local
	([2601:646:8882:b8c:352a:619c:ce9e:b9b7])
	by smtp.gmail.com with ESMTPSA id
	w125sm13401066pfb.117.2017.07.10.15.17.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 15:17:37 -0700 (PDT)
To: Denys Dmytriyenko <denis@denix.org>, Phil Blundell <pb@pbcl.net>
References: <20170710203642.GB26405@denix.org>
	<20170710204751.GC26405@denix.org>
	<598b8f59-0d75-314e-6f18-7f5daa24fa07@gmail.com>
	<20170710210903.GD26405@denix.org> <1499722526.27415.1.camel@pbcl.net>
	<20170710220707.GE26405@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <77972c4b-87e4-6369-5b20-6490a929f149@gmail.com>
Date: Mon, 10 Jul 2017 15:16:54 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:54.0)
	Gecko/20100101 Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <20170710220707.GE26405@denix.org>
Cc: openembedded-architecture@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [Openembedded-architecture] [meta-browser] Chromium and gold linker
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
X-List-Received-Date: Mon, 10 Jul 2017 22:17:38 -0000
X-Groupsio-MsgNum: 67545
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="JXAlWMhmr6xDO1JvEGgmhlq2PRAsCNhJv"

--JXAlWMhmr6xDO1JvEGgmhlq2PRAsCNhJv
Content-Type: multipart/mixed; boundary="eWjgsW6Tb1LicFtDW9s9FgvngEERaO2sm";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>, Phil Blundell <pb@pbcl.net>
Cc: openembedded-architecture@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org
Message-ID: <77972c4b-87e4-6369-5b20-6490a929f149@gmail.com>
Subject: Re: [Openembedded-architecture] [oe] [meta-browser] Chromium and gold
 linker
References: <20170710203642.GB26405@denix.org>
 <20170710204751.GC26405@denix.org>
 <598b8f59-0d75-314e-6f18-7f5daa24fa07@gmail.com>
 <20170710210903.GD26405@denix.org> <1499722526.27415.1.camel@pbcl.net>
 <20170710220707.GE26405@denix.org>
In-Reply-To: <20170710220707.GE26405@denix.org>

--eWjgsW6Tb1LicFtDW9s9FgvngEERaO2sm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/10/17 3:07 PM, Denys Dmytriyenko wrote:
> On Mon, Jul 10, 2017 at 10:35:26PM +0100, Phil Blundell wrote:
>> On Mon, 2017-07-10 at 17:09 -0400, Denys Dmytriyenko wrote:
>>> On Mon, Jul 10, 2017 at 02:00:35PM -0700, Khem Raj wrote:
>>>> On 7/10/17 1:47 PM, Denys Dmytriyenko wrote:
>>>>> On Mon, Jul 10, 2017 at 04:36:42PM -0400, Denys Dmytriyenko
>>>>> wrote:
>>>>>> Khem, et al,
>>>>>>
>>>>>> I couldn't find below patch being discussed on this mailing
>>>>>> list before it got=20
>>>>>> merged:
>>>>>>
>>>>>> https://github.com/OSSystems/meta-browser/commit/62e323848f569c
>>>>>> 4cdea5567b1917ce006d7705af
>>>>>
>>>>> https://github.com/OSSystems/meta-browser/commit/55a74501bc65c90c
>>>>> 86e3236b51ec2dc2fc0145fb
>>>>>
>>>>> "ld-is-gold just means that my default linker is gold, however we
>>>>> build
>>>>> both linkers, so one should be able to enable gold just for
>>>>> linking
>>>>> chromium even if default ld is bfd linker."
>>>>>
>>>>> I strongly disagree with such interpretation - this would mean
>>>>> there's NO way=20
>>>>> to disable gold linker completely, e.g. for when external
>>>>> toolchain doesn't=20
>>>>> support it.
>>>
>>> Copying OE architecture list for further discussion of "ld-is-gold"
>>> meaning.
>>
>> The attribution above is a bit confusing so I'm not quite sure who
>> wrote what.  But it is certainly true that "ld-is-gold" in
>> DISTRO_FEATURES means, and always has meant, simply that gold is to be=

>> installed as the default linker.  In other words, if you invoke plain
>> "ld", you will get gold, and if you need the BFD linker - usually
>> because you are using linker scripts that gold doesn't understand -
>> then you must invoke ld.bfd.  See
>> 207a9013670560d62c793a66f01e19f4760a71a8 from some six years ago for
>> the place that it was originally added.
>>
>> As far as I know, we do not have (and never have had) any
>> DISTRO_FEATURE that will inhibit gold from being installed altogether,=

>=20
> It is not about being installed, but about being supported by the toolc=
hain=20
> in use - think of external toolchains not built by OE-Core... The origi=
nal=20
> question was whether it's appropriate to force gold linker in recipes, =
if=20
> ld-is-gold is not set by the distro.

We do not have a set API for external toolchains, and thats also wy
external toolchains have to contantly adjust with newer OE release.
however, in this case external toolchains could provide ld.gold that
symlinks to bfd linker

>=20
>=20
>> nor can I immediately think of a reason why this would be generally
>> useful.  Obviously, any DISTRO that wants to do this is welcome to
>> provide a bbappend for binutils.
>>
>> p.
>>


--eWjgsW6Tb1LicFtDW9s9FgvngEERaO2sm--

--JXAlWMhmr6xDO1JvEGgmhlq2PRAsCNhJv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAllj/N4ACgkQuwUzVZGdMxTu7wCfbK3mllHPSg+fa0fvEwZ41UTU
XEIAnAmetHQwh5Dl/io4ULYXPI5IETrI
=vv/Y
-----END PGP SIGNATURE-----

--JXAlWMhmr6xDO1JvEGgmhlq2PRAsCNhJv--
