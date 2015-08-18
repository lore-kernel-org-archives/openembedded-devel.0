Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 71A1860043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 17:24:42 +0000 (UTC)
Received: by pawq9 with SMTP id q9so39906281paw.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 10:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=fkWl2ZJ8j840KSAVAkjfI9L2jYnSb1hqCyAN8oQ3m8A=;
	b=KXF5D+Z/US0pIgkLDS5IBWVfBk8tPPpeUDjW9c4djFub0U/o1j84Xd7mT4aHu5t+28
	cvvePxTiUhkK+Mr3Ffd/CJ/fiwcRtoRmyNu0ff2zs/s/l5J4yKvuNUIEOz+PZkjIB0Ut
	wRjOMH931SsK5+IiAFjO7T1kGdeM7B7/0q4vxAIAMgNl/IyiKmhrGIw9Ai/0vBXWlyFC
	TLCKp5cCjkEz7VpeAxIE1+koXhbUOdRVbafMOTpAb0qWsJjYLS4V9aFg2xRu76HomRWK
	Q3ptfCsqArSEVT9W/W57cTOhbyw4cGQeMwAmY6HwLFh1n4m05aLefV2wnGc+9pTbEE8C
	E3Xg==
X-Received: by 10.68.113.37 with SMTP id iv5mr15528821pbb.104.1439918683021;
	Tue, 18 Aug 2015 10:24:43 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e99e:512b:4006:2df1?
	([2601:646:8601:4580:e99e:512b:4006:2df1])
	by smtp.gmail.com with ESMTPSA id
	vx9sm16694041pab.21.2015.08.18.10.24.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Aug 2015 10:24:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1439916593-11597-1-git-send-email-jkrishnanjanappa@mvista.com>
Date: Tue, 18 Aug 2015 10:24:28 -0700
Message-Id: <868C0C7A-10F1-48D7-81EB-5429043F1295@gmail.com>
References: <1439916593-11597-1-git-send-email-jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-oe][PATCH] pmtools: add new recipe
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
X-List-Received-Date: Tue, 18 Aug 2015 17:24:45 -0000
X-Groupsio-MsgNum: 56777
Content-Type: multipart/signed;
	boundary="Apple-Mail=_85317997-FBB4-452B-9AE6-FEFC0310B868";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_85317997-FBB4-452B-9AE6-FEFC0310B868
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 18, 2015, at 9:49 AM, Jagadeesh Krishnanjanappa =
<jkrishnanjanappa@mvista.com> wrote:
>=20
> pmtools contains small collection of power management test and
> investigation tools,
> acpidump - dump a system=E2=80=99s ACPI tables to an ASCII file
> acpixtract - convert ASCII acpidump output to raw binary table
> madt -  parser for ACPI table
>=20
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
> .../recipes-devtools/pmtools/pmtools_20130209.bb   | 27 =
++++++++++++++++++++++
> 1 file changed, 27 insertions(+)
> create mode 100644 =
meta-oe/recipes-devtools/pmtools/pmtools_20130209.bb
>=20
> diff --git a/meta-oe/recipes-devtools/pmtools/pmtools_20130209.bb =
b/meta-oe/recipes-devtools/pmtools/pmtools_20130209.bb
> new file mode 100644
> index 0000000..1d278fc
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/pmtools/pmtools_20130209.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION =3D "This is a small collection of power management \
> +               test and investigation tools"
> +HOMEPAGE =3D "http://lesswatts.org/projects/acpi"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3"
> +
> +PR =3D =E2=80=9Cr0"

punt it.

> +
> +SRC_URI =3D "https://github.com/anyc/${BPN}/archive/${PV}.zip=E2=80=9D

are they consistent now ? github could regenerate archives and =
invalidate the checksums.
may be it would be better to use git fetcher

> +SRC_URI[md5sum] =3D "98b63903e61b1145b1b17bcfef6ac0b4"
> +SRC_URI[sha256sum] =3D =
"a043a959d44d616f06dedd30e2045e8e95fed93580e2c146818b6ed3a4b6e448"
> +
> +COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
> +
> +do_configure[noexec] =3D "1"
> +
> +do_compile() {
> +	oe_runmake
> +}
> +
> +do_install() {
> +	install -d ${D}${bindir} ${D}${docdir}
> +	install -m 755 ${S}/acpidump/acpidump ${D}${bindir}
> +	install -m 755 ${S}/acpixtract/acpixtract ${D}${bindir}
> +	install -m 755 ${S}/madt/madt ${D}${bindir}
> +	install -m 644 ${S}/README ${D}${docdir}
> +}
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_85317997-FBB4-452B-9AE6-FEFC0310B868
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEUEARECAAYFAlXTalUACgkQuwUzVZGdMxReEQCffPaJ46W9lqXMTmtyNdoGEpCG
QUIAmJ1m5+LWRdA2IA7TtVzAY8hA5ng=
=h8PD
-----END PGP SIGNATURE-----

--Apple-Mail=_85317997-FBB4-452B-9AE6-FEFC0310B868--
