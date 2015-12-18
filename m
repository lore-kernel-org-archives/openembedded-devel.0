Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 331116FF77
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 04:11:25 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id n128so24106119pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 20:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=LI8usAQY01RuOnnL6DwwWKADqnZmTo1s2Bizl3xQX5I=;
	b=I8agA4BEMfCi7UKTP7JaDHU2e/rLyX3/rbriX6TeDx8Xn7Tm7X6CV7iRmgVfr+5w+1
	v3+AValQtS1sL6jEgRGkcvJvmdLyfP6+UQml2WgaegXBgEOg5X6wLQ0cFwBmmjEYmD42
	Mpk9jb/jbkSPyOFNr0MrBTDo3jU4h/sTHzEPCFVP5Q4yEA51j438uujAB/5xcL+3HdWf
	6mlfJLl+b/es5ZQmJPIMtHiEnKGPxYPFfSvwR4DgTb9ouuqp4StkqmT+VX/fIcTP5eEX
	nx+wJpfShRz+R3WPhYPPKntyypx+Uju16GtWPQoQuM0jIdULNRI6Z746bo5pbl7UZp02
	bVNg==
X-Received: by 10.98.65.67 with SMTP id o64mr2141656pfa.104.1450411886288;
	Thu, 17 Dec 2015 20:11:26 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:d8fc:4635:f3ea:21e6?
	([2601:646:8802:5d5c:d8fc:4635:f3ea:21e6])
	by smtp.gmail.com with ESMTPSA id
	tb8sm18762659pab.22.2015.12.17.20.11.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Dec 2015 20:11:24 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1450409989-3032-1-git-send-email-jackie.huang@windriver.com>
Date: Thu, 17 Dec 2015 20:11:23 -0800
Message-Id: <84CC13FA-C644-4A04-A188-2D66678C4329@gmail.com>
References: <1450409989-3032-1-git-send-email-jackie.huang@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-java][PATCH] openjdk-8-native: fix incorrect do_install
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
X-List-Received-Date: Fri, 18 Dec 2015 04:11:26 -0000
X-Groupsio-MsgNum: 59079
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4C7075AA-0CC9-40D8-A680-5DCD7821F5C9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4C7075AA-0CC9-40D8-A680-5DCD7821F5C9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 17, 2015, at 7:39 PM, jackie.huang@windriver.com wrote:
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> do_install should not install files directly into
> staging dirs, or the ${D} and sstate is empty and
> builds from sstate cache will fail.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
> recipes-core/openjdk/openjdk-8-native.inc | 12 +++++-------
> 1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/recipes-core/openjdk/openjdk-8-native.inc =
b/recipes-core/openjdk/openjdk-8-native.inc
> index 7813ec2..a75f9e0 100644
> --- a/recipes-core/openjdk/openjdk-8-native.inc
> +++ b/recipes-core/openjdk/openjdk-8-native.inc
> @@ -68,15 +68,13 @@ do_compile_append() {
> }
>=20
> do_install() {
> -    rm -rf ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
> -    mkdir -p ${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
> -    cp -rp ${B}/images/j2sdk-image/* =
${STAGING_LIBDIR_NATIVE}/jvm/${JDK_DIR}
> +    mkdir -p ${D}/${libdir_jvm}/${JDK_DIR}
> +    cp -rp ${B}/images/j2sdk-image/* ${D}/${libdir_jvm}/${JDK_DIR}

slash between D and libdir_jvm is not needed. Also on line above this =
one is same problem.

>=20
> -# clean up the mess from bootstrap
> +    # clean up the mess from bootstrap
> +    mkdir -p ${D}/${bindir}
>     for tool in jar java javac keytool pack200 unpack200
>     do
> -        rm -f ${STAGING_BINDIR_NATIVE}/$tool
> -
> -        ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" =
${STAGING_BINDIR_NATIVE}/$tool
> +        ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" ${D}/${bindir}/$tool
>     done
> }
> --
> 2.3.5
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_4C7075AA-0CC9-40D8-A680-5DCD7821F5C9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZzh24ACgkQuwUzVZGdMxR41QCglM+GXz8RMdweI3l/QS2/dSt1
n1MAn2+XldDSPHzTu8tNXmqJfiJ4kcD4
=sJkg
-----END PGP SIGNATURE-----

--Apple-Mail=_4C7075AA-0CC9-40D8-A680-5DCD7821F5C9--
