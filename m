Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3F973175
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 09:49:02 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id b14so16005013wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 01:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=O/QqgYia8GFNwhrpuwuYL1xkXBGtMz5fKqQ00A5jiYQ=;
	b=jQakBwJXj4rNt7tvXoMWdTwr2cxXITxERsH6tNwqqfWMZB9HLcdBn4BgY6zpNcFAt0
	sqdISd3Y8GGZgMSQy8O2cLYenqPgpA9Mxt+wV3ewb0ZcfjcNAjp1M+pLBCzm9/ngnJ6G
	S51bWoHhtn7eNfRs081z8/NYwpXRsh0L3IQm4KWOD0S17WKcGQMu58reJ41cONMw+GVP
	rbNtIC8yDb+lPEPyX5vX9E1VMXxexhcYIE2SHZeWUFf0MwC26twPO963E8h7OmGIpFrg
	yWnNloHnlGYacJ8sJ9J56m/vqGbFilEmDNzrePcqFUDu0KfXbB+xVxIEev5UZSE3huJJ
	ko2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=O/QqgYia8GFNwhrpuwuYL1xkXBGtMz5fKqQ00A5jiYQ=;
	b=UBXAQRNG+2xgUATS3TiXAc0AYmHxI0z1SmTpbr6R7gwUn6aHbpo3H7Ktz7E7yWFcfi
	pRimLAKUI+IYJ1RrpIXiRcGFvSRdAAhlgABfCEtxIZb8NCrE5AgAl6IliPbf32kAwnhR
	hZ/KEhTiklNu3NhlAG/62sxF1xWSTLlz2ewjdHKUDKzhIAdCKuheJ8/wfpd0emdoVHwK
	WHQyJ5na2qGxUVXmSsexBb875Y0f6St29Jsfe5XRQ9M7GylmvCuHXbNs3zSSP7odKAph
	zi9x/MndS9NZ3K+ad1deRQZIDizqJkt4TT3wyPkSpQARHuQz0AHaVLrNogBlEBvfWUFg
	4gEA==
X-Gm-Message-State: AG10YOTfmnoOBe7/nmI4IBOIuoq1YzTC4xhAeFL8cpg7gyonEFLQNVXqwcFrQTCTgmlypw==
X-Received: by 10.28.227.6 with SMTP id a6mr2281427wmh.68.1452851342938;
	Fri, 15 Jan 2016 01:49:02 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	z137sm1775161wmc.8.2016.01.15.01.49.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jan 2016 01:49:02 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C7772BF@ALA-MBA.corp.ad.wrs.com>
Date: Fri, 15 Jan 2016 10:49:00 +0100
Message-Id: <29B6954A-6E43-4700-B6B1-E06F921C1F61@gmail.com>
References: <1450423916-4811-1-git-send-email-jackie.huang@windriver.com>
	<1450423916-4811-2-git-send-email-jackie.huang@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C7772BF@ALA-MBA.corp.ad.wrs.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-java][PATCH 2/2] openjdk-8: skip the dev-so test
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
X-List-Received-Date: Fri, 15 Jan 2016 09:49:03 -0000
X-Groupsio-MsgNum: 59555
Content-Type: multipart/signed;
	boundary="Apple-Mail=_905A7EFE-919D-4E66-9134-DA55642A27AD";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_905A7EFE-919D-4E66-9134-DA55642A27AD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 22.12.2015 um 08:33 schrieb Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com>:
>=20
> Please ignore this since openjre-8 also has same issue, I will =
re-patch in
> a .inc. But a question I have is, why do we needs a different =
packaging
> strategy for openjdk-8 and there are two recipes: on for openjdk-8 and
> another for openjre-8? Openjdk-7 is using one recipe to provide
> openjdk-7-jdk and opendk-7-jre.

That's easy to answer - openjdk-7-jre installs a part from an j2dk =
build, which
includes more that just the jre. Since size matters on some embedded =
platforms,
I decided to Do the right thing (tm) for Java8.

> Thanks,
> Jackie
>=20
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-
>> bounces@lists.openembedded.org] On Behalf Of =
jackie.huang@windriver.com
>> Sent: Friday, December 18, 2015 3:32 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-java][PATCH 2/2] openjdk-8: skip the dev-so test
>>=20
>> From: Jackie Huang <jackie.huang@windriver.com>
>>=20
>> Fixed:
>> ERROR: QA Issue: non -dev/-dbg/nativesdk- package contains symlink =
.so:
>> openjdk-8 path
>> =
'work/core2-64-poky-linux/openjdk-8/72b05-r0/packages-split/openjdk-8/usr/=
lib/jvm/openjdk-
>> 8/jre/lib/amd64/server/libjsig.so'
>> [dev-so]
>>=20
>> The symlink .so is valid so we just skip the test
>> just like what we does in openjdk-7.
>>=20
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>> recipes-core/openjdk/openjdk-8_72b05.bb | 3 +++
>> 1 file changed, 3 insertions(+)
>>=20
>> diff --git a/recipes-core/openjdk/openjdk-8_72b05.bb =
b/recipes-core/openjdk/openjdk-8_72b05.bb
>> index d962b1f..8aa9f9f 100644
>> --- a/recipes-core/openjdk/openjdk-8_72b05.bb
>> +++ b/recipes-core/openjdk/openjdk-8_72b05.bb
>> @@ -92,6 +92,9 @@ PROVIDES_${PN} =3D "java2-vm"
>> RPROVIDES_${PN} =3D "java2-runtime"
>> PROVIDES_${PN} =3D "java2-runtime"
>>=20
>> +# There is a symlink to a .so but this one is valid.
>> +INSANE_SKIP_${PN} =3D "dev-so"
>> +
>> inherit update-alternatives
>>=20
>> ALTERNATIVE_PRIORITY =3D "100"
>> --
>> 2.3.5
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_905A7EFE-919D-4E66-9134-DA55642A27AD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWmMCNAAoJEESZlq7c5QqdA9MP/2p7MIV01FZBEQPxZJ09VZup
g3ogs+oFiFT7ZSAOsur3TA76bPWq/+enVTCr5tikGQ+B2whLgnPjy8k9ySAAmHZ+
QzCbFn3w4vKrYPSqu/52ObeyKYt7r0yX5pa0u0eSmRiU2sBkolw5BOQmPDXCD9Pr
zPNPJsNIx2uMKsoukSoeLQNqoZA++pos4jQVsiHPUnZwTI57baMQpk+oRuxthWXd
Lnkbe1PWL31/6yseBAr45lsgHHn2FKqgjjyirPHV4DLXuEj27eYXRMyU85ZKIYn4
2CwyO1prkvKur/1BWQ6EoS8x85zY8kAL7s092I3uxBwxbrgFXUmPPvjn0/jOpsMR
HyGsARGBruk+mdeuCTa5ZkqRXGpQe1Mn84Dq5NQ6+rEVJt9yivve+SUBR1DcQDeF
ZaVDcQrrjH76Ttc0jnylTcvUgyOowY4rS+c/XzMtpUWD/ehoHsND9EidCWQ3AnAW
iqFL+wQhVKT8IJlBWtnozJSLyYAv+H82vTKhZtUta6gGo/z7bxEOoqJtaYvmklkK
6iKUsM3b+JWiFKOuj8URzVk2w/PGlCSynRENSh/czK0WDnaabPIp344XRWg40Iec
WKy+106d8LAdUN3yNqGdx8vw12Cn6iVL/w+8x8bajJOBeac3TE9i7wsHrT4/H+19
LYRbLUMb7QGL0MqvzF94
=cOj2
-----END PGP SIGNATURE-----

--Apple-Mail=_905A7EFE-919D-4E66-9134-DA55642A27AD--
