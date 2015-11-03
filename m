Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 211B071633
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 19:32:03 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so2490442pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 11:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=uiLt2+rUdPK9Q64CvX05CChoI9m5LjJC5kEASdLvIQc=;
	b=IY7DaR+uficBHM+OVyathV1y5lL31aB5ZQN25BKrpSrez4+fUOetabUWxdr7b83Cyw
	QmbQjgx3/h7ITYLuORDGKCSizdLlSqYhjikAd1/XlLM7ipIB/gWPkJWJYaHDZdkObFxp
	zZi859PhiiyUxPLu2sO2e4qEhuVsGhlO/19upNJRCodXOeA7ckoSwbZG01FCdqI9SaMK
	o69dQFJwWvSo9U1gDNJDQJwoE9cTSUuE5CQ+7pk3qpFW7ktwfyyVg7SGYVG9GPy4X7Nj
	Zg2OH+g3T0G1uJE5Yv19qRRWYNgAjVrnUMJWpSUyv11Lg8utnGch+bRSyse8rOTLGQjU
	DYNA==
X-Received: by 10.66.161.73 with SMTP id xq9mr35594019pab.0.1446579124140;
	Tue, 03 Nov 2015 11:32:04 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:440f:8649:8a1c:baf6?
	([2601:646:8601:4580:440f:8649:8a1c:baf6])
	by smtp.gmail.com with ESMTPSA id
	ey2sm30884922pbd.77.2015.11.03.11.32.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Nov 2015 11:32:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3106\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1446574645.32751.9.camel@intel.com>
Date: Tue, 3 Nov 2015 11:32:02 -0800
Message-Id: <E01AAF5B-5430-4028-948C-767910413B51@gmail.com>
References: <F81DC1078564A34BB4DA30CAE03814D12D4EB65D@ORSMSX104.amr.corp.intel.com>
	<CAMKF1sqT-fxjZ5TPMrDEGjMq7MVttucqjDxUf7vp4zVdwusw2A@mail.gmail.com>
	<1446574645.32751.9.camel@intel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3106)
Subject: Re: openjdk-7 and gcc v5
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
X-List-Received-Date: Tue, 03 Nov 2015 19:32:04 -0000
X-Groupsio-MsgNum: 58272
Content-Type: multipart/signed;
	boundary="Apple-Mail=_01C67E7D-AB1D-4699-AC7A-6D46FC26996D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_01C67E7D-AB1D-4699-AC7A-6D46FC26996D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Nov 3, 2015, at 10:18 AM, Bruce, Henry <henry.bruce@intel.com> =
wrote:
>=20
> On Thu, 2015-10-29 at 17:43 -0700, Khem Raj wrote:
>> On Thu, Oct 29, 2015 at 4:00 PM, Bruce, Henry <henry.bruce@intel.com>
>> wrote:
>>> Many thanks to contributors who fixed openjdk build issues
>>> introduced by gcc v5 and for maintainers for pushing the updates.
>>> However one problem remains: openjdk build fails in
>>> openjdk/jdk/make/java/nio due to -static compiler flag being used
>>> in conjunction with -pthread giving error
>>> /usr/bin/ld: cannot find -lpthread
>>> /usr/bin/ld: cannot find -lc
>>>=20
>>=20
>> its not clear how the -static flag can cause this. may be its using
>> CC for LD or wise versa ?
>=20
> Not clear to me either, but if you create a simple file, say test.c
>=20
> int main()
> {
>  return 0;
> }
>=20
> and compile with gcc test.c -pthread -static
> it fails as follows with gcc v5
> /usr/bin/ld: cannot find -lpthread
> /usr/bin/ld: cannot find -lc
>=20
> but compiles OK with earlier versions of gcc.

isn=E2=80=99t this gcc on your build host ?


>=20
>>=20
>>> I fixed this by removing -static flag from Makefile. Not sure of
>>> this was the right thing to do (so I didn't submit patch) but it
>>> worked for me.
>>> I added the following to the an openjdk bbappend and it fixed the
>>> build and resulting jre is running OK.
>>>=20
>>> do_configure_append() {
>>>        gcc -v 2>&1 | grep 5\..
>>>        if [ "$?" =3D=3D "0" ]; then
>>=20
>> why this check for gcc ?
>=20
> It only fails with gcc v5, so if it's not broken, don't fix it...
>=20
>>=20
>>>                sed -i s/-static//
>>> ${B}/openjdk/jdk/make/java/nio/Makefile
>>>        fi
>>> }
>>>=20
>>> Regards,
>>>=20
>>> Henry Bruce
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_01C67E7D-AB1D-4699-AC7A-6D46FC26996D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY5C7IACgkQuwUzVZGdMxTZpQCffWeokOTLITy56uPgWjPCjyVE
GQcAn2eXth7wKgAgW6ODEiFWV4TPf6F1
=afEz
-----END PGP SIGNATURE-----

--Apple-Mail=_01C67E7D-AB1D-4699-AC7A-6D46FC26996D--
