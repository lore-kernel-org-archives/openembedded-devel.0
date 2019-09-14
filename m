Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6C0C77C7A9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Sep 2019 12:05:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id q18so5281247wmq.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Sep 2019 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=gMmBW36XrYL/4tkYdGZZ/o27TKBa8enx1eWyoA0UsCE=;
	b=vcwIgg1BOso6NVyPawLNRBYT55BSBN45D0AO/CLfUbcPqUtjWJWtdfHwcwn1QsC8Vw
	a6u0CY7i48a77xgyL1ZLccWdXa2qh61IX0S6cUbpxwKvUkmIWJjIik47ExpwMRhYyRin
	TEJj2/NPRI6TmDR/ojfb/jCqpOEyHaQLAoWZAjuJ9TtLYtwGspC3D1T320X240iFvaay
	WAdhFhOMAC9N2Mswycs9AseX2VWNnF/k1Ehw2tMJ3hSHF6U9Tdlq0t7tznGGP2mzbRUb
	Z+WesuMNzFdEhAeWCbi9FV/IZ3CCSzSqMJhdvlkCxsvRf1Zcmz+m4K09q5qpuJZh4h8S
	JTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=gMmBW36XrYL/4tkYdGZZ/o27TKBa8enx1eWyoA0UsCE=;
	b=s0UArzd/ptK6JMy0gHNke8P3IZzOv+Xrnr59NiVCeF4/WGiXCpuXrvXgOd/Oky83Y9
	XEMMiqJTH0fzdG3Jx+8O3PrI5CCyli4zAFI/p0J4ppFAomOmSLqkHDNj5oCGKMZuQVit
	Y0QOmWYrL9WCaW+79huDfBItWCufRx7PtyH2A3MuoCoe+N05d23MLLN7RnZCoSkA5Qnd
	MHAQf+F3HWWlPpiU+xqh+ssr+3drQUsH5LRpGuV2lXi+W/mQA2kqcBeEWfNInEei1lf9
	4QncKrlHTlorfkHaGc/a8Bc0ovGFYDB+eUECjmOCa9bpE8xqXMmfA4XorqMTTDB+PV5u
	73nQ==
X-Gm-Message-State: APjAAAUIwLpiX6Je2O1CdS2ubCqA1KUs4Fnemriuu7JC0xH8IMREmahr
	oCiE+yrFj0F6SludfmNjO/4=
X-Google-Smtp-Source: APXvYqznuqdT71zpNPoqpDcuCBnSjGEZjKrKeg7pldGcKn+MiVmXoR7KipDFCMgfoYNYS7MC3426Xg==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr7548338wmj.44.1568462722066; 
	Sat, 14 Sep 2019 05:05:22 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p5B25B936.dip0.t-ipconnect.de.
	[91.37.185.54]) by smtp.gmail.com with ESMTPSA id
	u68sm10955197wmu.12.2019.09.14.05.05.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Sep 2019 05:05:20 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <FBF5DE5C-344D-4F54-982E-113D0229F025@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Sat, 14 Sep 2019 14:05:16 +0200
In-Reply-To: <CAMKF1soMXNPLopyXTV9t3M5f1KVpBOJCAa2TutCdJ7PL2Uv+2g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
References: <20190913140533.7328-1-sno@netbsd.org>
	<CAMKF1soMXNPLopyXTV9t3M5f1KVpBOJCAa2TutCdJ7PL2Uv+2g@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libstatgrab: add recipe for libstatgrab-0.92
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
X-List-Received-Date: Sat, 14 Sep 2019 12:05:21 -0000
X-Groupsio-MsgNum: 79693
Content-Type: multipart/signed;
	boundary="Apple-Mail=_01E67465-E83D-4633-A5A0-00B26163035B";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_01E67465-E83D-4633-A5A0-00B26163035B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 13.09.2019 um 20:04 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
> Fails
>=20
> https://errors.yoctoproject.org/Errors/Details/270231/ =
<https://errors.yoctoproject.org/Errors/Details/270231/>

Thanks - sending update soon ;)

> On Fri, Sep 13, 2019 at 7:05 AM Jens Rehsack <sno@netbsd.org> wrote:
>>=20
>> With the recent update at begin of summer, which includes the fix
>> for nxp bsp issues, it's time to bring libstatgrab to more people
>> than the few who use it in datacenter monitoring.
>>=20
>> Language bindings will follow once base library is settled.
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> .../libstatgrab/libstatgrab_0.92.bb           | 26 =
+++++++++++++++++++
>> 1 file changed, 26 insertions(+)
>> create mode 100644 =
meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
>>=20
>> diff --git a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb =
b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
>> new file mode 100644
>> index 000000000..ab08d8bb2
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
>> @@ -0,0 +1,26 @@
>> +DESCRIPTION =3D "Utilities to collect and visualise system =
statistics"
>> +HOMEPAGE =3D "http://www.i-scream.org/libstatgrab/"
>> +
>> +LICENSE =3D "GPL-2.0+"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +DEPENDS =3D "ncurses"
>> +
>> +PACKAGES_prepend =3D "statgrab statgrab-dbg saidar saidar-dbg =
${PN}-mrtg "
>> +
>> +SRCREV =3D "fa7e1d9fe76c3a1a7ade264c746b3f5edc566f3b"
>> +SRC_URI =3D "git://github.com/libstatgrab/libstatgrab.git \
>> +          "
>> +# Perl5 is for tests only
>> +EXTRA_OECONF =3D "--without-perl5 --with-mnttab=3D/proc/mounts"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit autotools pkgconfig
>> +
>> +FILES_statgrab =3D "${bindir}/statgrab"
>> +FILES_statgrab-dbg =3D "${bindir}/.debug/statgrab"
>> +FILES_saidar =3D "${bindir}/saidar"
>> +FILES_saidar-dbg =3D "${bindir}/.debug/saidar"
>> +FILES_${PN}-mrtg =3D "${bindir}/statgrab-make-mrtg-config =
${bindir}/statgrab-make-mrtg-index"
>> +RDEPENDS_${PN}-mrtg_append =3D "perl statgrab"
>> --
>> 2.17.1
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_01E67465-E83D-4633-A5A0-00B26163035B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl1813wACgkQRJmWrtzl
Cp2Wrg//f1HSXDQx16mhfju/wGN/rBr/1g+DUXzGHXrRh2E9iRV2mAd7FV8c1GwP
qIrf7VmuUqPvjZgOgIBkcVnzF0Y4CvZb2YnLpgfg2Cu09mFiK3sqjSXfkmk0OTGV
+SaSIyZJscg5H/OCb8S9K2ahzWt4tmUo/GnXtDTwu+xkPp6GDvc3q1asm0g0WlVc
ND6hgEo/NKnlJC4IbHOh92e5IWc6lhG6nU/Qnc9zwNHMxAXxS9yyemDWlzgdrfMG
OV9JVlQchtER8Mk4UTIWHhheyoziFEFyrbhhks2IOnyHSL+Jfi9txRPT5R47DqH+
xb4ZyfhoGM3QNKY0LkYb1Ntw8bxpLHMwQSb+hV9D87vCeT1BzyF4vWGKoNS8oUIW
r16R+KTxX4CrWpZKcWBcc5nYn3U7YMjE+lRQ7dFwG6xtgT2MZISwVds7ivgnNfL4
2n9qsSFZ4DKqSpuM1PtXqYonB3uf8SMk3krIXM2a2+7DDbYQIvQJyavpAivpp0+Z
iUyIsdtxa1tEuN5tmLInPRqw6fjt5xIT3OeppUNm7vSkO7bk1gpi7Xmh6Od0dRzk
NuAqXje5oGVESwE4QsZ2I34kHY5xErNZIHctjS9zJrz2Jm9lDeOOj2VT1Iha50Xv
kGD+mYBfSsFPgy9v2ZxlXuMfkzc76K4Q6Axeyhjnj2Q5YCIVxLk=
=Ywv0
-----END PGP SIGNATURE-----

--Apple-Mail=_01E67465-E83D-4633-A5A0-00B26163035B--
