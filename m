Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id AABDE60088
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 21:29:20 +0000 (UTC)
Received: by pdbmi9 with SMTP id mi9so19306679pdb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 14:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=FeSXz1CGGQ1Q0JNKxxm+SE43QP0AvCiUjtpSyoyaTt4=;
	b=JaPpv3Htfx65JrsIhVPx2MI6ujlOvoiLor4s6Oer8KF6nZOCmOzxoHBEdt1aGv7Tul
	QWWudHNd9WUH7sudqbt+6WeNgMJMck6Bg0nftnrNBCutE3w9iFe/jar5GtZJqH6B7RXI
	iDyXp7c6iB786DMFr/dqBuOlTP35Fyk1wCsCvX5gScSnVuZvVGo1nGaVUoVLq+IlqYV5
	Y+fMMzk0rQLp3LZPg3E3mue+borBK/vIWAnEvRKr7X0VIZgYhay+hloVTDlPZHlKRNJB
	iMx3RWWKb1sy43auDnX/dTZ6lswxZdeHYFAIlNJrWVe4GjA/oomvoLxJp2i5xKrb9RnW
	yu9g==
X-Received: by 10.70.43.163 with SMTP id x3mr6376121pdl.151.1439846960547;
	Mon, 17 Aug 2015 14:29:20 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4c2b:aa36:d301:5329?
	([2601:646:8601:4580:4c2b:aa36:d301:5329])
	by smtp.gmail.com with ESMTPSA id
	ud2sm15656924pbc.57.2015.08.17.14.29.19
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Aug 2015 14:29:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55D24E83.7080508@windriver.com>
Date: Mon, 17 Aug 2015 14:29:15 -0700
Message-Id: <748F943A-BD6C-4678-95AE-66194317F32B@gmail.com>
References: <1439345155-27884-1-git-send-email-kai.kang@windriver.com>
	<55D179C1.5010402@windriver.com> <20150817150349.GD8518@mentor.com>
	<55D24E83.7080508@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-networking][PATCH] inetutils: 1.9.2 -> 1.9.4
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
X-List-Received-Date: Mon, 17 Aug 2015 21:29:22 -0000
X-Groupsio-MsgNum: 56754
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6CE27997-CC77-45E1-8836-428F7BF8B62B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6CE27997-CC77-45E1-8836-428F7BF8B62B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 17, 2015, at 2:13 PM, Randy MacLeod =
<randy.macleod@windriver.com> wrote:
>=20
> On 2015-08-17 11:03 AM, Joe MacDonald wrote:
>> [Re: [oe] [meta-networking][PATCH] inetutils: 1.9.2 -> 1.9.4] On =
15.08.17 (Mon 14:05) Kang Kai wrote:
>>=20
>>> On 2015=E5=B9=B408=E6=9C=8812=E6=97=A5 10:05, kai.kang@windriver.com =
wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>=20
>>>> Upgrade inetutils from 1.9.2 to 1.9.4.
>>>=20
>>> Ping?
>>=20
>> Since I'm seeing a lot of these lately I thought I might explain my
>> current workflow.
>=20
> Thanks for the background.
>=20
>> For build or security issues, I'm trying to stay on
>> top of them and be as responsive as possible,
>=20
> okay.
>=20
>> but for general recipe
>> updates, particularly ones like this where the log shows essentially
>> nothing critical has changed, I'm holding off until at least my
>> autobuilders get to chew on them and reassure me we're not bringing =
in
>> new QA (or worse) issues,
>=20
> I'd hope that means a day or two and not a week, right?

its about a week. Reason is the machines capacity/power vs. number of =
recipes to build.

>=20
>> and ideally I prefer to see a pass in one of
>> Martin's "state of the world" builds.
>=20
> I assumed that the state-of-the-world builds would be for master
> and the release branches but no:
>   http://www.openembedded.org/wiki/Bitbake_World_Status_Setup
>=20
>   "It's not using "master" branches,
>     but "jansa/master" branches in ..."
>=20
> They appear to happen every day:
>   http://logs.nslu2-linux.org/buildlogs/oe/world/
> And the stats are published once or twice a week, most of the time...
>   http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> Hmmm, would newer build systems be useful:
>   "Usually I build for 3 MACHINE qemuarm, qemux86, qemux86-64.
>    Each MACHINE takes about 20-24hours so sometimes there is
>    bigger delay."
>=20
>> I also try to give everyone on
>> the list a reasonable amount of time to respond to anything as well, =
but
>> that's not a gating factor.
>=20
> What's a reasonable time? ~ 1-2 days?
>=20
> Just trying ensure that our ping time is reasonable. :)


Wait for a week at-least.



--Apple-Mail=_6CE27997-CC77-45E1-8836-428F7BF8B62B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXSUi8ACgkQuwUzVZGdMxSXNQCfdKw1Pp+ppkVKsqb/6xnam1L0
8dYAn3I9oasBpBh8PfNMzElNM1ODWbdY
=Jo2o
-----END PGP SIGNATURE-----

--Apple-Mail=_6CE27997-CC77-45E1-8836-428F7BF8B62B--
