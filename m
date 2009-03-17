Received: from [209.85.200.174] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LjP5Z-0001nO-8j
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 03:31:35 +0100
Received: by wf-out-1314.google.com with SMTP id 28so3684416wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2009 19:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=oFZkrLvuI6IeWCS4T05dwqyvikdrKwQ5SzCdck8NA/o=;
	b=kGpSuxPisxuioi1+23d5LzHhBZQSHmmqsHRM+yaOjpHwlC2mb8LGSin5Zp0fS/8y1U
	D9vm/J+i10gT4JkWZKcck7BbBFI7qaZXilcRqeBZUaffdvgGi0SM1wusHqy+DLbqpM/f
	QHAm/1mAKN0kGMThIKGwHaLAAbf2hEiCWaL5M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=NDjk++WaZX/ZaUSQA05OraniR2o4oBEbddQzvBmdFL7ugJ8uKkXKevUV+hnkSOfDIW
	da4dd8ulCHydNir8Yv55b5pVYrIh4kLsy1rV7MpOiW+2TBCLLK2XnZ4hdmOWBp4iKpYw
	/ZbGB0sMZFqD2c2WDbWrQXLrmGet6fP+gls5c=
Received: by 10.142.157.9 with SMTP id f9mr2488036wfe.341.1237257051279;
	Mon, 16 Mar 2009 19:30:51 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-2-112.dsl.pltn13.sbcglobal.net
	[71.146.2.112])
	by mx.google.com with ESMTPS id 27sm12669967wff.28.2009.03.16.19.30.50
	(version=SSLv3 cipher=RC4-MD5); Mon, 16 Mar 2009 19:30:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2009 19:30:42 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-10-generic; KDE/4.2.1; x86_64; ; )
References: <20090316195707.GA3793@sourdiere> <20090316202219.GA4160@sourdiere>
In-Reply-To: <20090316202219.GA4160@sourdiere>
MIME-Version: 1.0
Message-Id: <200903161930.49305.raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.200.174
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] qwo input method recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Mar 2009 02:31:35 -0000
X-Groupsio-MsgNum: 8469
Content-Type: multipart/signed; boundary="nextPart2570610.0jn5dQLEbr";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2570610.0jn5dQLEbr
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 16 March 2009 13:22:19 Charles Cl=E9ment wrote:
> Library libconfig is needed for package qwo.
>=20
> ---
>  packages/libconfig/libconfig_1.3.1.bb |   22 ++++++++++++++++++++++
>  1 files changed, 22 insertions(+), 0 deletions(-)
>  create mode 100644 packages/libconfig/libconfig_1.3.1.bb
>=20
> diff --git a/packages/libconfig/libconfig_1.3.1.bb b/packages/libconfig/l=
ibconfig_1.3.1.bb
> new file mode 100644
> index 0000000..cae25f4
> --- /dev/null
> +++ b/packages/libconfig/libconfig_1.3.1.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "Library for manipulating structured configuration files"
> +AUTHOR =3D "Mark Lindner"
> +HOMEPAGE =3D "http://www.hyperrealm.com/libconfig/"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +LICENSE =3D "LGPLv2"
> +DEPENDS =3D ""
> +PV =3D "1.3.1"
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://www.hyperrealm.com/libconfig/libconfig-${PV}.tar.gz"
> +
> +S =3D "${WORKDIR}/libconfig-${PV}"
> +
> +inherit autotools
> +
> +do_stage() {

snip ...

> +	install -m 644 libconfig.h ${STAGING_INCDIR}
> +	install -m 644 libconfig.h++ ${STAGING_INCDIR}
> +	oe_libinstall -a -so libconfig ${STAGING_LIBDIR}
> +	oe_libinstall -a -so libconfig++ ${STAGING_LIBDIR}

can you use autotools_stage_all instead.

> +}
> --=20
> 1.6.2
>=20

=2D-=20
Khem Raj

--nextPart2570610.0jn5dQLEbr
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkm/C1MACgkQHnJKy6V6em7JmQCbBAv6OWSrnHjpsATg3Gg9wL0u
q3YAmgJYOK/Zt3S81kSF5Rf3dCus+J/u
=wcYh
-----END PGP SIGNATURE-----

--nextPart2570610.0jn5dQLEbr--
