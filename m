Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 05B5B75794
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 06:34:46 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so13553153pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 23:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=CLn1Ib37EbDrPJ4GyfLUtxCofLR4KJiOREHHXDcCgxE=;
	b=U4o+NquwJFaPDC0E4ryS4SSwfTipdBE4mqXl4LqdjCG28I2HLQGSUIQVh/QIRAxjkP
	HCq+P4Se81cJqKSrbVtUcmh8StTPj7X5ITpkL8ohOgIJpkP6nxPWC9YwxXZvuhBCTwb/
	BEwXv67WZi0ogNSCNGvlB513uiakhSppy7SWB+ux9Xg7M9ZZ4mfer1A/ddzUxEo+SEjZ
	DsCyQtq0fTC6YpQiLpWkQB46DXm3q6LwXydXMP3JYo0Lx6KBKPFO3fpMq+IYf/nc50br
	VrrXUZvGL/HIOzB6ULS+OM9Tc/mWOCPjCuus85G+BuAPAHcoKfFkD0CVmHvMDP9Qmdda
	xSjQ==
X-Received: by 10.68.96.197 with SMTP id du5mr13170591pbb.32.1440743687043;
	Thu, 27 Aug 2015 23:34:47 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e943:4351:71e0:b332?
	([2601:646:8601:4580:e943:4351:71e0:b332])
	by smtp.gmail.com with ESMTPSA id v2sm4503842pda.34.2015.08.27.23.34.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Aug 2015 23:34:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1440667573-1822-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Thu, 27 Aug 2015 23:34:45 -0700
Message-Id: <EEE9503B-655A-414F-9BCB-F2A97DAA7B06@gmail.com>
References: <1440667573-1822-1-git-send-email-lixin.fnst@cn.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-oe][PATCH] networkmanager: disable service by default and WARNING Fix
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
X-List-Received-Date: Fri, 28 Aug 2015 06:34:47 -0000
X-Groupsio-MsgNum: 57098
Content-Type: multipart/signed;
	boundary="Apple-Mail=_45EE538B-0962-4E81-A6F4-1696D1F62102";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_45EE538B-0962-4E81-A6F4-1696D1F62102
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 27, 2015, at 2:26 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
>=20
> * Disable NetworkManager.service by default,otherwise,the
>  Root file system using the method of NFS mount can't boot =
successfully.
>  Also it is disabled on Fedora.
>=20
> * WARNING Fix:
>  WARNING: QA Issue: networkmanager: Files/directories were installed =
but not shipped in any package:
>  /run
>  /run/NetworkManager
>  Please set FILES such that these items are packaged. Alternatively if =
they are unneeded,
>  avoid installing them or delete them within do_install. =
[installed-vs-shipped]
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
> meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb | =
2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git =
a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb =
b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
> index 62debe9..4e2ca28 100644
> --- =
a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
> +++ =
b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
> @@ -58,6 +58,7 @@ FILES_${PN} +=3D " \
>     ${datadir}/dbus-1 \
>     ${base_libdir}/udev/* \
>     ${systemd_unitdir}/system \
> +    /run \

/run is generated at runtime so this won=E2=80=99t be right thing to do. =
You should remove this packaging instead you should
ensure that this file which is put into /run is generated as part of =
runtime tmp files service.

> "
>=20
> RRECOMMENDS_${PN} +=3D "iptables dnsmasq"
> @@ -84,3 +85,4 @@ FILES_${PN}-tests =3D " \
> FILES_${PN}-bash-completion =3D "${datadir}/bash-completion"
>=20
> SYSTEMD_SERVICE_${PN} =3D "NetworkManager.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> --
> 1.8.4.2
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_45EE538B-0962-4E81-A6F4-1696D1F62102
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXgAQUACgkQuwUzVZGdMxS4kACeObo9iN4w7PJo789dRMk1ANmG
yeAAniOsDISVoAHIyOHBgRon7NESP6LO
=1iiE
-----END PGP SIGNATURE-----

--Apple-Mail=_45EE538B-0962-4E81-A6F4-1696D1F62102--
