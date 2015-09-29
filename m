Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 196B877035
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 17:05:12 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so11320488pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=xppltLFdgWFjlt7+Ac833h64PlJucOez4GE8KuMDrO4=;
	b=GsE5x0bRNXG6GOunD0UQYngVJrKkGInrBTsrhWz8CZzrYgCx8tJTXH/CAPpUNCHmuH
	Gn/h6qAyoRQgnCbhmhUe7OLJF9twru9K7Ej9OIpfFhU0quqGydgy095Og08SR3TWEaLS
	4/iBq2Ns70kWyF5/FSPuY9J+zq1p1wGASwLNgicN5FR+yGPXjrjhvKo8QNvRgytW0/cQ
	8imTp4RWedILIJ3fBjht6bgjKh3iinl1x1+tPT+s/xLCxa15b9QWwW5NxC2ZA9hq1nVD
	GHM6vmcWFMVH1xgHQ6ipYwVrPVIjOj0HVUT8GEZWMbDlD46nYvtKtYRF+vhJKt/8kL12
	kgVQ==
X-Received: by 10.66.66.167 with SMTP id g7mr20422283pat.152.1443546312847;
	Tue, 29 Sep 2015 10:05:12 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f90b:6fa0:21f7:85bc?
	([2601:646:8601:4580:f90b:6fa0:21f7:85bc])
	by smtp.gmail.com with ESMTPSA id
	uc1sm21292943pab.20.2015.09.29.10.05.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Sep 2015 10:05:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <560AA9BF.10703@streamunlimited.com>
Date: Tue, 29 Sep 2015 10:05:11 -0700
Message-Id: <3D222848-8306-43E1-BD45-3D106F04AD70@gmail.com>
References: <560AA635.30407@streamunlimited.com>
	<560AA9BF.10703@streamunlimited.com>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3094)
Subject: Re: Cmake + qt4 = linker error
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
X-List-Received-Date: Tue, 29 Sep 2015 17:05:16 -0000
X-Groupsio-MsgNum: 57571
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E3CFF4F2-1FAD-49B3-A499-13B591BADEF7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E3CFF4F2-1FAD-49B3-A499-13B591BADEF7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 29, 2015, at 8:09 AM, Radek Dost=C3=A1l =
<radek.dostal@streamunlimited.com> wrote:
>=20
> Hi,
>=20
> I have a very simple (hello world style) program which uses cmake for
> compilation and depends on qt4. I am trying to put together bitbake
> recipe for this program. See attached.
>=20
> When compiling it fail with following error:
> /tmp/oe-work/sysroots/x86_64-linux/usr/lib/libQtCore.so: file not
> recognized: File format not recognized
>=20
> I suspect it is looking for libraries in native sysroot due to =
following message in log.do_configure: "Found Qt4:
> /tmp/oe-work/sysroots/x86_64-linux/usr/bin/qmake2 (found version =
"4.8.5")"
>=20
> Obviously it can only find qmake2 binary in the native sysroot and not
> in the target sysroot as it does not make any sense to build qmake2 =
for
> target.
>=20
> I checked meta-openembedded and openembedded-core and could not find =
any  example I could use for inspiration.
>=20
> 1) Is there something I am missing?
>=20
> 2) Is this a known problem?

may be you should inherit qt4e in your recipe as well

>=20
> Thanks,
> Radek
>=20
>=20
>=20
> <nsdktoolbox.bb><CMakeLists.txt>--
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_E3CFF4F2-1FAD-49B3-A499-13B591BADEF7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYKxMcACgkQuwUzVZGdMxRB0QCeKz5om2VSIyGua/iTPu44H/TH
llIAn0BGzF/ctGpzk5ACxQGKHrb2JhDS
=cOmt
-----END PGP SIGNATURE-----

--Apple-Mail=_E3CFF4F2-1FAD-49B3-A499-13B591BADEF7--
