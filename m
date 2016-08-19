Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id D51147318F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 16:48:42 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id cf3so3650267pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 09:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=K1fPD8aAB1PB+cqky/WmcSFw/Itm2cE9+vO/oV85MV8=;
	b=fASGHQ8nubdrFKTVRiCA97hzpuVAUfk7JJqo3HzGqZ5sKdE65HJX8qGa3ac9dlASRL
	sGFFBhVeA1Rd/4SRAVG0Gv/oPxm5KGJHkZMNb6UxaA9WVpOdDbuCZM6q0/0lCAJPe7Xr
	FUE3aV7zlOSuxBh0KkfhW3gyHdoXVTdChT4AbFDjMkba2QYULK0q9/zX8t/yiLGy40Yv
	22PNvpcaRVb+S1jX4rGyUlSzUDJS9U2bbN2mutKQlPg5B2tNgLE8XiguexLLNkSDcAC+
	/lWpePXoJLavs/U+XKatzhLEUW1DwNylYhSLPmwSEyNyo7p6ne9UEfDVbDIfpYT6Ono8
	+JLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=K1fPD8aAB1PB+cqky/WmcSFw/Itm2cE9+vO/oV85MV8=;
	b=Vjbp3ITLa7inYcQnKQmIXg9ZaLZuEHThbYdCzRMV+vUQhDxO2G2BO4WQsNLLbINs3s
	lS+nOvQ+A0NcJ4gKVY+cjYAIs5oZG/j5y/P88Z1TdctjCCVUHElO64iZ06epx3FVaKv6
	etmRbZQUrgabNYzXbQpC00KwLWWap1kA0iTmaKmFFuJCKVR+diP+RpUUq8rsTJFnbQi9
	LKSB2xjRVbuoD8Ab5+o8pXSFzAtRP5g3UKYdCT5L1A0xbM+Lo7HD0uSn/YfASl514n6i
	T0ymH93jVpdYKkVjYwFQG3xANnIVxplioKT973YLwlWuhz9Z3eo2IKLD7TNiDlfvpO3E
	GG0Q==
X-Gm-Message-State: AEkoouvokU6i7cNSvCSrTminfIFttYni/3HSJjxA4LWu+ZK3rmeQgZ4XsEovgD+PLtvLWA==
X-Received: by 10.66.2.135 with SMTP id 7mr15461121pau.136.1471625323295;
	Fri, 19 Aug 2016 09:48:43 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4?
	([2601:647:4c00:3edf:8c96:6cf1:33a0:ccf4])
	by smtp.gmail.com with ESMTPSA id
	ra13sm12828258pac.29.2016.08.19.09.48.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Aug 2016 09:48:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1471613076-15965-1-git-send-email-erkka.kaaria@intel.com>
Date: Fri, 19 Aug 2016 09:48:44 -0700
Message-Id: <4EB05253-E7E3-41E3-BAFD-EAB96A807989@gmail.com>
References: <1471613076-15965-1-git-send-email-erkka.kaaria@intel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-java][PATCH] openjdk-8-cross.inc: Fix QA error caused by missing hash
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
X-List-Received-Date: Fri, 19 Aug 2016 16:48:45 -0000
X-Groupsio-MsgNum: 62758
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7E412AFE-5175-4ECB-BC9E-CF834442CC3A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7E412AFE-5175-4ECB-BC9E-CF834442CC3A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 19, 2016, at 6:24 AM, Erkka K=C3=A4=C3=A4ri=C3=A4 =
<erkka.kaaria@intel.com> wrote:
>=20
> Some openjdk makefiles (e.g. vm.make) only use CFLAGS as their linker
> flags. This means that the oe-specific linker flags are lost. This in
> particular causes issues with the recent oe-core commit a98a81808, =
which
> intentionally poisons the linker hash style, so that any recipes that =
do
> not use the oe LDFLAGS fail to build.
>=20
> Signed-off-by: Erkka K=C3=A4=C3=A4ri=C3=A4 <erkka.kaaria@intel.com>
> ---
> recipes-core/openjdk/openjdk-8-cross.inc | 10 ++++++----
> 1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-core/openjdk/openjdk-8-cross.inc =
b/recipes-core/openjdk/openjdk-8-cross.inc
> index 11e94ce..6097afc 100644
> --- a/recipes-core/openjdk/openjdk-8-cross.inc
> +++ b/recipes-core/openjdk/openjdk-8-cross.inc
> @@ -39,21 +39,23 @@ SRC_URI_append =3D "\
>     file://jvm.cfg \
> "
>=20
> +# Some makefiles pick the linker flags from the CFLAGS variable, so =
add
> +# the LDFLAGS to CFLAGS
> +CFLAGS_append =3D " \
> +  ${LDFLAGS} \
> +=E2=80=9D

This could break non, gcc compilers, where they will warn about linker =
options being unused
during compile step etc. and if we use -Werror this may fail to build =
too. The change belongs
to openjdk build system, if its not that invasive and complex, I would =
suggest to patch openjdk
and upstream the change, since that will be upstream worthy

> +
> EXTRA_OECONF_append =3D "\
>     --with-jobs=3D${@get_jdk8_native_jobs(d)} \
> -    \
>     --with-sys-root=3D${STAGING_DIR} \
>     --with-tools-dir=3D${STAGING_DIR_NATIVE} \
>     --with-boot-jdk=3D${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native \
>     =
--with-cacerts-file=3D${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/jre/li=
b/security/cacerts \
> -    \
>     --disable-precompiled-headers \
>     --disable-zip-debug-info \
> -    \
>     --with-extra-cflags=3D'${CFLAGS}' \
>     --with-extra-cxxflags=3D'${CXXFLAGS}' \
>     --with-extra-ldflags=3D'${LDFLAGS}' \
> -    \
>     ${@jdk_configure_options(d)} \
> "
>=20
> --
> 2.7.4
>=20
> ---------------------------------------------------------------------
> Intel Finland Oy
> Registered Address: PL 281, 00181 Helsinki
> Business Identity Code: 0357606 - 4
> Domiciled in Helsinki
>=20
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_7E412AFE-5175-4ECB-BC9E-CF834442CC3A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle3OG0ACgkQuwUzVZGdMxTK4gCeOXg5QRVh2OS2gPVyMiOKJ6A5
RWMAn3O/EE31IrZI3Kj3CQOl0uRRnqpn
=GtlO
-----END PGP SIGNATURE-----

--Apple-Mail=_7E412AFE-5175-4ECB-BC9E-CF834442CC3A--
