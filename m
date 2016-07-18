Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4627A606D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 09:52:14 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id q2so10769530pap.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 02:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=EbLkvanXGNERA41xBXLSO4L9MzQLJQ2GesJlFDIEQMw=;
	b=GqFafhEpBplBsa4lGVDZJfnlxXeoUQe9DvXuQHO4ZPup4qLpIe9DQWx4L9xa78EE4C
	EeR2c5nUl6P7/vVPcEZMhO0zAEkGRdSD5mNk1yW7vETWnamKY27Albwavu0PACpdho2P
	d7TX5pGsl0vZOpPOOQHgaNBwSG1JsTyEsQIceB47X0c9NN0wPbzhuymUd3p5A9ls8Q8r
	Mla57ari60IE+W3/apq3lbT2RC7FvFWsZ2TK7w79ga+NsVbgvZV4kXt/rbcp3iI4qasZ
	4s0y/V7wwIzYchqD3lzqBFuOc9xkSZP4v7y0RSafaxCSMPCuVVCrwWgO3X02SPY6zMJ3
	jBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=EbLkvanXGNERA41xBXLSO4L9MzQLJQ2GesJlFDIEQMw=;
	b=PPABld+s0q9VXqpiRzwzPpoKf7M3gNUoCgv05Y3iYHQyXM5FRMgkg9oq/BvC0htIMS
	N0pkrUhqligmU+tKh6Lnh44XpX1R41MGs1lGdm/pcSm1cnCrUsAd9/LDkmsctLnNvKOY
	aeuhGbQDh9d54LKOGFBpEu7qztw0sYXzJDJ0AE8EgDZFxh/lIAZE5K/8JCtH3algacjT
	oZ97vgh7g3oZiurbYBctvXXzgC7krGV886VWCf3EDgee69wfZvshaPUcryBBwplbyYW2
	SJqf1ZJA2RKG+VbCIc3TbUeayERATiACr7cReqHuC2ZXNu0Kaj6CCwrVNu8QURK85c/c
	J/cg==
X-Gm-Message-State: ALyK8tJMPrWQVOK22wUWi57/VePJvkiSyoVYIFF+nEZ7WJscbhJIsH8Uv2WK+3qX2M5hZA==
X-Received: by 10.66.227.194 with SMTP id sc2mr54905460pac.120.1468835535289; 
	Mon, 18 Jul 2016 02:52:15 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:1d56:d1b3:ecb4:c8c5?
	([2601:646:8882:b8c:1d56:d1b3:ecb4:c8c5])
	by smtp.gmail.com with ESMTPSA id
	p64sm3636350pfd.11.2016.07.18.02.52.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jul 2016 02:52:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1468835203.4658.12.camel@andred.net>
Date: Mon, 18 Jul 2016 02:52:08 -0700
Message-Id: <68B4CABC-D2D5-46F3-817C-6C7462E3E5A2@gmail.com>
References: <1468828968-19388-1-git-send-email-git@andred.net>
	<1468828968-19388-2-git-send-email-git@andred.net>
	<CAMKF1spStNbUubBvO1DLq86wdHRVbGvOVB7LRUVa2be0Mdes3Q@mail.gmail.com>
	<CAJ86T=XnuktZ1DB6_Cco+0NnjFOAaa6F4+=dCW8+Pw1t_Yo4nA@mail.gmail.com>
	<1468835203.4658.12.camel@andred.net>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-networking][PATCH v2 2/2] meta-networking: override SECURITY_CFLAGS for c-ares
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
X-List-Received-Date: Mon, 18 Jul 2016 09:52:16 -0000
X-Groupsio-MsgNum: 62228
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9AF8760F-8F53-4E12-B139-843345398101";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9AF8760F-8F53-4E12-B139-843345398101
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 18, 2016, at 2:46 AM, Andr=C3=A9 Draszik <git@andred.net> =
wrote:
>=20
> On Mo, 2016-07-18 at 01:37 -0700, Andre McCurdy wrote:
>> On Mon, Jul 18, 2016 at 1:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>=20
>>> On Mon, Jul 18, 2016 at 1:03 AM <git@andred.net> wrote:
>>>=20
>>>>=20
>>>> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>>>>=20
>>>> c-ares doesn't build if the distro has enabled usage of the
>>>> security_flags.inc file as it is picky about what is placed
>>>> into CPPFLAGS and CFLAGS. It complains and errors out if any
>>>> preprocessor options appear in CFLAGS.
>>=20
>> Curl (on which c-ares's configure files seem to be based) used to =
have
>> the same problem but was fixed upstream by:
>>=20
>>=20
>> =
https://github.com/curl/curl/commit/5d3cbde72ece7d83c280492957a26e26ab4e5c=

>> ca
>=20
> I must say I agree with c-ares' error here, and this really highlights =
a bug
> in how OE handles the security flags. By convention, preprocessor =
flags
> belong into CPPFLAGS, not CFLAGS.
>=20
> The real solution hence should be to have OE place -D flags (including
> ${lcl_maybe_fortify} into CPPFLAGS, not CFLAGS in the first place.

right. Would you might sending a patch for OE-core

>=20
> But that'd be a change I am not in a position to test, as it would =
touch
> everything. E.g. there might be build-environments that (silently) =
ignore
> user-supplied CPPFLAGS completely (cmake being one of those [1]).

Auto builders can help. Do whatever testing you can do. On minimum add =
the flags
to CPPFLAGS

>=20
> a.
>=20
> [1]
> https://gitlab.kitware.com/cmake/cmake/issues/12928
> https://cmake.org/Bug/view.php?id=3D12928
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_9AF8760F-8F53-4E12-B139-843345398101
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleMps0ACgkQuwUzVZGdMxQ5EwCfQSueldCN+/qb2GXCYontjLmY
JRwAoI8wX4EkEg+gGE1YMCjDsZJvDHjL
=M0DC
-----END PGP SIGNATURE-----

--Apple-Mail=_9AF8760F-8F53-4E12-B139-843345398101--
