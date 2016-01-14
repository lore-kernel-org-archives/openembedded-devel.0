Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 78513731A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 18:19:06 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id uo6so365197203pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 10:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=xf7owb00QMsoPvgexxP/3YS9vj4GGOhKyWLHJTy1WAE=;
	b=CZ1HcS8I+MCGiTEI3Jslpe1W2xK7cwPpQxWfIZrMdZtScnd0ejcCZleTQI0LcanZUN
	euRhhSDxySzdQAZT7feXHr45Z5nrZB90TPbu59c5qp8mcvf7UKUy6OBOTDQ2r+3WAzbZ
	zEA+qYiwBylSo0GBFFX9RbA+AAC7mwHhIRfrDfQGc3a3rA/4mXVV0LoXf24eqYTL50nq
	XthgHzB6IDvA08Fh37KmYfoE0ZgFuAvT3AsfmRdgPziacWezpnd2l42sAXTo8eoXeYcc
	B7uacEVzx1CjND/jiQLTaC5HuHcTO9//gd9gWev8+WtmL+IiAdhQyDBfmq/pmVir0ifZ
	6NHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=xf7owb00QMsoPvgexxP/3YS9vj4GGOhKyWLHJTy1WAE=;
	b=eZ/66Tzca2H4hZiY1bUVPkWbJsBEyN3wdkj96gW53YnLNLdrQvIoTROXL38mzKSYLk
	d8POl6qsXFpVtUuPWwBB9WArH08RH423hrUXQMPGseZGrz4TV/xHSSxV2BH3ReD2L9NA
	g6jefqykas6yUMQ9dxlyYqUikcKzV/VLS/zot2WjrrrOqVglRwK7cK+BDP7rbAAK3maq
	HUMtFS1dpnA+bcOmidlhHu+MvSYN0/mAonHEE7hI/CMND+g/VvU/5jLkA6JYyfrP8D50
	GFeT/ojbDSHcU6fua3XF2RHxMam9LCgRlVSvUNg+Y2WUFHTtx1Jia28gZT5cHhHNKl/j
	Xjjw==
X-Gm-Message-State: ALoCoQlEoqo3AeGadhcIFwpwrOKFnHquFaxh3kLhECoDZ7rLUOiepnbFjOINE1R4+2i5lU+drGDe9p47xzxg55iRWRwPuVAcqg==
X-Received: by 10.66.148.99 with SMTP id tr3mr8100785pab.19.1452795547523;
	Thu, 14 Jan 2016 10:19:07 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:4c4c:5f92:7d4d:1d28?
	([2601:646:8802:5d5c:4c4c:5f92:7d4d:1d28])
	by smtp.gmail.com with ESMTPSA id
	p20sm10734628pfi.86.2016.01.14.10.19.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jan 2016 10:19:06 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAF3KAoTy2xZ6a2KC3ci95fQ1QnH9-KSAuD2jpZ4vLeoqAc_ZQw@mail.gmail.com>
Date: Thu, 14 Jan 2016 10:19:05 -0800
Message-Id: <CA1094E9-AA29-4D48-9025-D3CC6E5A7C68@gmail.com>
References: <CAF3KAoQkwWWr=xfifeqP_bK25_ysY_7+B2h7xT6L9P1Pf34KhQ@mail.gmail.com>
	<CAF3KAoS1+0fy16WjorADA3cqTjCPZwSJGOmjex6b1mKcEQw7oA@mail.gmail.com>
	<CAF3KAoTLPCK3NMm-NfVgJq80mvQBzz2WYw92p5jM6t2ySi0fAw@mail.gmail.com>
	<CAF3KAoRyD7EXhOBjECXnyZzTWAW8P65=GJScxr1TGtoveH_HTA@mail.gmail.com>
	<DC79C3D6-8838-4EEE-B607-84BAAF5B519D@gmail.com>
	<CAF3KAoTy2xZ6a2KC3ci95fQ1QnH9-KSAuD2jpZ4vLeoqAc_ZQw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-oe] OpenLDAP modules
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
X-List-Received-Date: Thu, 14 Jan 2016 18:19:11 -0000
X-Groupsio-MsgNum: 59540
Content-Type: multipart/signed;
	boundary="Apple-Mail=_87DC2919-4151-4C3D-A610-EC2033DF9A13";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_87DC2919-4151-4C3D-A610-EC2033DF9A13
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 14, 2016, at 9:22 AM, Bruno Vernay <brunovern.a@gmail.com> =
wrote:
>=20
> Thanks it works also.
>=20
> The second issue, that I still cannot resolve is that OpenLDAP =
requires a
> .la or .so to load its modules.
> The openldap config specify a file name like "back_mdb" and expect =
either a
> back_mdb.la or back_mdb.so
>=20
> but both la or so are limited to -dev in Yocto, I don't see how to =
overcome
> this rule???

you can reset e.g. FILES_SOLIBSDEV =3D =E2=80=9C"

>=20
> Regards
>=20
>=20
> On Wed, Jan 13, 2016 at 7:36 PM Khem Raj <raj.khem@gmail.com> wrote:
>=20
>>=20
>>> On Jan 13, 2016, at 8:46 AM, Bruno Vernay <brunovern.a@gmail.com> =
wrote:
>>>=20
>>> Adding this to my bbappend did the trick ...
>>>=20
>>> TARGET_CC_ARCH +=3D "-lpthread=E2=80=9D
>>=20
>> make it -pthread and add it to LDFLAGS
>>=20
>>>=20
>>> I may submit a patch
>>>=20
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_87DC2919-4151-4C3D-A610-EC2033DF9A13
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaX5pkACgkQuwUzVZGdMxRCmACeLMiQnOd5o3VgnQE2DxwTdTep
4eQAmwUAVYgNFwUyh647HSg0Nt8Expdg
=Nrs+
-----END PGP SIGNATURE-----

--Apple-Mail=_87DC2919-4151-4C3D-A610-EC2033DF9A13--
