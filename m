Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC93731A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 09:27:00 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id u188so15217032wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 01:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=pEYNgQghCvFvg5Gz13OnWml/Pwj1Rd30VmIoD2RAW8M=;
	b=ZQ81TeGiuy1x8MADFtF2AZaf79s3BxJ5UUJOX+JRBheAMPy1RRcvIF7zSlbc627V8G
	k0GkuhgNcv+Ja8gadR+ZYRmGSZFd5U6wUmGvZ/F6UabaLQkQ8y8CJIUcTnG9xy5IjcGQ
	qToblhYu2l+9KJxkyXFAsvemja2awV84611p1v8d0STAUIh3Ga3bHRpYGiXjznJQ8n/j
	zPBvIu3Izjk6L1dP1I8tpxakKNg7KK3DfNu6XC1jlUsjH4GIymC+JWOyRtyGrlNeQL38
	vcY7euJFftGCasplGN44+BlZxBJZswm0vSXR/WUT2M+l2ReFBS/juYgIoBNntvkbogV4
	iMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=pEYNgQghCvFvg5Gz13OnWml/Pwj1Rd30VmIoD2RAW8M=;
	b=K2YYyrTJHcB4s4iIqYsF6Hw5ku2fr5kvCThWqOuuQkIqteB2y6Ddy7R6msslD+kMRV
	zjgJY3JFRf5xzEEkK6M3mHHoX3Rg1Ju3i19w5DoVO5Qm8fNJkK5M0+WRzOKzoXithHDK
	NhmmnGa0hPnPW4dDEqBZErQ1GoBwFB2G8n03NUESOvW5qQ+hxj00rgh0+o8eBFILVaTF
	x4oPqt76n2lzI7CVp54M5v4fDz2JUkVVoNQUEZpyTwAh3y8DmnjZxJLsB0HvM8X8OHCT
	LNHsKMHKcLOBvPgWLcaAfzx+gBFeOBxi7Z4DGPUY99PHgAD65IX3b9XyTD96WH8DOWoZ
	46nw==
X-Gm-Message-State: AG10YORUElsVHwB7yahS7MB2nZA7PyXnVTZbNGs/+I2HLj0IRwPPGo5q4Mlsi1Wcw+Cx+g==
X-Received: by 10.28.136.148 with SMTP id k142mr2298816wmd.41.1452850020270;
	Fri, 15 Jan 2016 01:27:00 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	c15sm1651203wmd.19.2016.01.15.01.26.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jan 2016 01:26:59 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAP9ODKrKZABvZvEkmDdska_t9JgnWLCT8MM6kzov=HqsCc16Hw@mail.gmail.com>
Date: Fri, 15 Jan 2016 10:26:57 +0100
Message-Id: <B4843A50-9CB6-4FF5-8354-8FCB821D74B1@gmail.com>
References: <315045FB-F742-4125-826E-210A07B68780@gmail.com>
	<CAP9ODKrKZABvZvEkmDdska_t9JgnWLCT8MM6kzov=HqsCc16Hw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: meta-java Workflow
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
X-List-Received-Date: Fri, 15 Jan 2016 09:27:01 -0000
X-Groupsio-MsgNum: 59554
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2A1328C5-9B02-4968-B056-E92BF46C0667";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_2A1328C5-9B02-4968-B056-E92BF46C0667
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 13.01.2016 um 19:38 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>=20
> Hello Jens,
>=20
> On Wed, Jan 13, 2016 at 4:03 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>> to avoid such a problem as it occurred with ec7b984f, 04d5d0bf and =
dfb21b44, I strongly suggest that meta-java follows the merge-workflow =
from other meta-layers:
>>=20
>> cherry-pick new stuff into master-next, when settled - merge to =
master
>> Branch releases as other layers do and same, push back-ported patches =
into ${rel_branch}-next and merge the behaving ones into ${rel_branch}.
>>=20
>> The current way - pushing to master and live only there result in the =
happened revert - and to continue my work I would have to revert the =
reverts without any nice word in the commit message as I did in =
reverting 24b98ac3 with a88718b6.
>=20
> I understand your frustation but I think you are exagerating on this.

I don't think so ;)
I'm not frustrated - I think no one benefits from quick shots. If there
were staging branches, the regression would have been found before it
bothers users like Jackie.

Lot's of jethro users wanting to build openjdk-8 asking for trouble
(still? is autotools-patch in jethro meanwhile) because of missing
patch (for good reason - stability of the release, as we figured out).

My goal is not to make Jackie or me more happy, my goal is to find
regressions before they hit users to avoid pressure (regardless whether
you, me or an innocent user is affected).

> The fix you provide (and was reverted by causing regression at that
> moment) is a great improvement and those should be brought back. To
> bring it back, as I explained on the Hangout, you can revert those and
> apply the fix for the sstate. Doing this, we can integrate those
> changes back and everyone is happy.

No, because I can't do the tests discovered the regression, because they
come from forcing rebuilds in the bootstrap phase. Precisely because
of the challenge to test excessively so much circumstances I highly
appreciate the opportunity of a CI alerting on integration. Regardless
of the root cause that allows to fix problems before they hit common
folk like everyone except Otavio :D

> To make all this setup you are asking for, I need to reserve resources
> in our autobuilder to properly excercize it and provide useful
> feedback otherwise it is useless. To be honest, I am not being an
> active user of this and been acting as maintainer just due the lack of
> someone more active so I am willing to give the maintenance for
> someone more commited to Java use than me, if desired.

I was unsure whether I mention that: I see what you are doing in
excellence for so many parts of Yocto - and because of this, when
you're doing something just great, it feels as a performance degrade :D

I don't see any personal mistake in the situation - from none of
the involved parties.

Maybe

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_2A1328C5-9B02-4968-B056-E92BF46C0667
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWmLtiAAoJEESZlq7c5Qqdo2gP/iGe79b54QGr9t5wKq0kzn20
pw8R4kGudSUxd8CI7DKsTJhE9MiyjdqiohX9DrC3O234Hp24Bc5BYe/bIpGjjOlX
BjnRuqdXohft/k8G4KIzfPax1mmfxlny3EVBv7A7DVhWWDHutWANmJ+goyeo0bJr
pEThjtxfbVqWEN2iG+RTQ/ktBqQtgmbNtTJXnQTW5M8hDzNj4Q9hVqu2GdLZ+cEo
CdRVboO+htRXtyGOdrQ+X7KdaoBk2ebelVnkMLjYfnv/9H/mqDuhtgvbdxL2AT8u
9qI5+3PtrwoXpiWYsgy2q0+oU4MHMgHl/z7bp3BWPvZ22QQhxfSsy5BbrEGk0JjY
paWDnckrLB1PG+TV03H/BRTT+b3OHiX8AB4CKMelhMozlOgiKeRXVoFV07sYTfiJ
y6VteEO+0EWipMyxJ2F7mgS0FVTvZIl7GZ3mKl7WLFyUQQrThEptaMs2WiJkmJgE
DRH1hdJpnkZAfXRLopNdUTmEwi3MixkvHMnQf2tLn4rno+c6dYc2aVQgq/V/hCjk
HxernTJN2FeX7Wc7abxEKIaYycCFYYtAcgeDrM+zZKA5znuy0nffadDoLi67RoPE
yuE3uyAuV0pPJoKw/cPkQXrtrISs5ojCt8a45DJOON4oaAGtE5mQAwUFjX65wzxC
GckiigrgqYy31FMQJmr3
=MzFK
-----END PGP SIGNATURE-----

--Apple-Mail=_2A1328C5-9B02-4968-B056-E92BF46C0667--
