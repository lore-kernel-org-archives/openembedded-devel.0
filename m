Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8676460043
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 06:11:04 +0000 (UTC)
Received: by pacgr6 with SMTP id gr6so14785642pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 23:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=z9mX6AWDiCQZ/UEu85PFtPtSVB+R7gc/phrAsZ/gZpE=;
	b=rohiPPIHq1JVvR1+fWHaU3NpcOwo9mUrVKj6yHIY7XKUpGEROmLIWGmHAN6dex8diz
	P2AP3/HH/PzLXZXO7rmDepTYQRtxFNbxNf+G9EZPRAeU4ihawgRnIO3IHTSgvLo9wpDp
	Ko/7eVhzlqqSaKVulwDP6urpdEPsQpSEUlQ5ADDcxt9v3lXbHTWCqmvst05Y9hL1Rpxy
	tPy81VswSpj3lDcC5JwEU9zGlTsSn+MVjZmXd1etTCMIhd9n0s4SrZX0uar77a5b1yCz
	b9Bc7/i5QmkEADhFPFpej+8Y5MVa5Ic5tLxN+fsYfBkywzjcbs3isihCAW7r7XIaHUcA
	MJ2A==
X-Received: by 10.66.190.99 with SMTP id gp3mr12288758pac.113.1440742265067;
	Thu, 27 Aug 2015 23:11:05 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e943:4351:71e0:b332?
	([2601:646:8601:4580:e943:4351:71e0:b332])
	by smtp.gmail.com with ESMTPSA id y5sm1689570pdc.4.2015.08.27.23.11.03
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Aug 2015 23:11:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CALbNGRTyXco+x4NrbQkNSV6F+aA42r_8ZycgfBKPYuQcxyn6Kw@mail.gmail.com>
Date: Thu, 27 Aug 2015 23:11:02 -0700
Message-Id: <913B6413-8869-4669-B9E0-EB8B80A45B09@gmail.com>
References: <1440583622-11664-1-git-send-email-alexander.kanavin@linux.intel.com>
	<55DD9BFE.6050807@linux.intel.com>
	<CALbNGRR_j3f-KzA4iPQsdGsYe_VcqZYhhGBZ-8+FiHHRuwiDbA@mail.gmail.com>
	<1721551.0sTJOXpHQ2@peggleto-mobl.ger.corp.intel.com>
	<CALbNGRTyXco+x4NrbQkNSV6F+aA42r_8ZycgfBKPYuQcxyn6Kw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Alexander Kanavin <alexander.kanavin@intel.com>,
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
X-List-Received-Date: Fri, 28 Aug 2015 06:11:05 -0000
X-Groupsio-MsgNum: 57096
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DF96042B-9FE2-4C89-85F0-BB10E48AA8FB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DF96042B-9FE2-4C89-85F0-BB10E48AA8FB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 27, 2015, at 3:49 AM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>=20
> On Thu, Aug 27, 2015 at 10:23 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Wednesday 26 August 2015 20:01:28 Andreas M=C3=BCller wrote:
>>> On Wed, Aug 26, 2015 at 12:59 PM, Alexander Kanavin
>>>=20
>>> <alexander.kanavin@linux.intel.com> wrote:
>>>> On 08/26/2015 01:40 PM, Tanu Kaskinen wrote:
>>>>>>  # needs libnotify3 which conflicts with libnotify, mixing them =
in
>>>>>>  build
>>>>>>=20
>>>>>> breaks couple of packages
>>>>>=20
>>>>> This last comment seems to be out of date after this patch.
>>>>=20
>>>> Actually, this whole thing can be removed:
>>>>=20
>>>> # needs libnotify3 which conflicts with libnotify, mixing them in =
build
>>>> breaks couple of packages
>>>> EXCLUDE_FROM_WORLD =3D "1"
>>>>=20
>>>> Whoever applies this patch, please amend it accordingly.
>>>>=20
>>>>=20
>>>> Alex
>>>=20
>>> I think it's not that easy. We need an libnotify append here with =
some
>>> RREPLACES / RPOVIDES for libnotify3. Right?
>>=20
>> I was wondering about that myself. Really those RREPLACES + RPROVIDES =
+
>> RCONFLICTS need to go into the recipe in OE-Core though.
>>=20
>> Cheers,
>> Paul
>>=20
> Sorry to insist: I think it should be appended here: Users without
> meta-gnome in their layers have never seen libnotify3.

while thats right. Lets put it into recipe in OE-Core, just avoid a =
bbappend here.

>=20
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_DF96042B-9FE2-4C89-85F0-BB10E48AA8FB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXf+3YACgkQuwUzVZGdMxQtOwCgjw/C2b8XMcWZNLiiy5U9lK5q
vJ0AnR1BMMm5lU4PyBkq3nRkDPzbSAGo
=ZIJT
-----END PGP SIGNATURE-----

--Apple-Mail=_DF96042B-9FE2-4C89-85F0-BB10E48AA8FB--
