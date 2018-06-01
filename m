Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4674C60017
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 16:35:39 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id p14-v6so12758111pfh.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2018 09:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=g/uprIK6EyAROm6f03fSdEKCN2fuM0cdYVTI/ptOXvc=;
	b=Jrohaz65xn3WwPGoI7hZSWavCoujHyVoV1tnO3l6Iij0YFW8x9P5wZyf1u0jUyAaeC
	P4OxvwKDqei0NSp1EbgEb/1hcmPGCDvJYcLfhoTO+E+p80WLpIRnomjTSnfQanTBQfuQ
	ZNVlb8EDSDZbwzlzeIvTOrQsMVmx3OfLED4V2iHCnJzumOCRj8VkLsVI55vZF/ZvtTzp
	o16TAei7SGhyAjyWp4NRudE2zJVuJQ+rv2eazeZcTLTwJmZovf1yO9tkarv58dWy8uW8
	1jmtL0g5KrgMFlEpCN80CaQ/2oB3dBF7hLkLiv7MpkVz4Z7EQeZgia0yY3uYMi6sMMr9
	+gDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=g/uprIK6EyAROm6f03fSdEKCN2fuM0cdYVTI/ptOXvc=;
	b=bwVPhdSZ/awyZf3x5HbFcfoIkiboxx3FTrofQW9scLLUJJ/kQMRqQYl4FnQpqlVOSv
	/+6Evq1SuTLyNfxDoA3U6qh7+GScuWJopcXUrEf+K4RG+R3O5NOEJqn7gpwAd7HDKF/9
	neS3pl9mUuLJ4Lt3bQZSAsYTU039YFojr6U+Rz4wQvttnYSXmGx/yqfQ3dck7wrNpT3U
	Scl9e1JTmSlNtbBQ84Fgchp/nVbM1CqHccptODYriHG8DiZ1c+yW54tZ4FBX71xQcYyK
	OjN/hMst6ae2wF1eogmW3hz2GDJ2lYKQlbMzuykDj64k0mMwfZa01zOb7D6ZufjbcgF1
	NYVA==
X-Gm-Message-State: ALKqPwdGcT1kZZ6Z0GoduYioBpcY900D1Um1KNzM9FgtahR/a39Efib6
	VRef+0DOWEnbi8Xp1bFUyII=
X-Google-Smtp-Source: ADUXVKL6HPR1MdI0gmyvER7K4nnIKqoE9FUgZr/OkByu7tWrfIygeArUU/1CS8MB+vlGGAAEBt6IxQ==
X-Received: by 2002:a62:8b9b:: with SMTP id
	e27-v6mr11684372pfl.82.1527870940057; 
	Fri, 01 Jun 2018 09:35:40 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:41f8:6b67:40cb:f15c?
	([2601:646:877f:9499:41f8:6b67:40cb:f15c])
	by smtp.gmail.com with ESMTPSA id
	c17-v6sm35290980pgw.11.2018.06.01.09.35.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 09:35:39 -0700 (PDT)
To: Nicola Lunghi <nick83ola@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180601103540.13159-1-nick83ola@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <f53e673f-fd88-596b-9982-2f28fe06ae25@gmail.com>
Date: Fri, 1 Jun 2018 09:35:26 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180601103540.13159-1-nick83ola@gmail.com>
Cc: Nicola Lunghi <nicola.lunghi@jci.com>
Subject: Re: [PATCH 1/2] mosquitto: remove example files from installation
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
X-List-Received-Date: Fri, 01 Jun 2018 16:35:39 -0000
X-Groupsio-MsgNum: 72563
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="2FsmkNb46NiqBuF7iBUXzoP3xPs0Ryj7t"

--2FsmkNb46NiqBuF7iBUXzoP3xPs0Ryj7t
Content-Type: multipart/mixed; boundary="vbZp7xHqy4enXGmdY8j2bMJRSMH6klyie";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Nicola Lunghi <nick83ola@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Nicola Lunghi <nicola.lunghi@jci.com>
Message-ID: <f53e673f-fd88-596b-9982-2f28fe06ae25@gmail.com>
Subject: Re: [oe] [PATCH 1/2] mosquitto: remove example files from
 installation
References: <20180601103540.13159-1-nick83ola@gmail.com>
In-Reply-To: <20180601103540.13159-1-nick83ola@gmail.com>

--vbZp7xHqy4enXGmdY8j2bMJRSMH6klyie
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/1/18 3:35 AM, Nicola Lunghi wrote:
> From: Nicola Lunghi <nicola.lunghi@jci.com>
>=20
> The mosquitto makefile install a lot of example configuration files
> on the image: remove those
>=20
> also move the creation of /etc/mosquitto into the recipe
>=20
> Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
> ---
>  ...move-example-files-from-installation.patch | 36 +++++++++++++++++++=

>  .../mosquitto/mosquitto_1.4.14.bb             |  3 ++
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/mosquitto/file=
s/0003-makefile-remove-example-files-from-installation.patch
>=20
> diff --git a/meta-networking/recipes-connectivity/mosquitto/files/0003-=
makefile-remove-example-files-from-installation.patch b/meta-networking/r=
ecipes-connectivity/mosquitto/files/0003-makefile-remove-example-files-fr=
om-installation.patch
> new file mode 100644
> index 0000000000..ebe9044523
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/0003-makefil=
e-remove-example-files-from-installation.patch
> @@ -0,0 +1,36 @@
> +From 79627479a30a96ed2326b680eb575306b621eeb9 Mon Sep 17 00:00:00 2001=

> +From: Nicola Lunghi <nicola.lunghi@jci.com>
> +Date: Fri, 1 Jun 2018 11:11:45 +0100
> +Subject: [PATCH] Makefile: remove example files from installation
> +
> +also remove /etc/mosquitto directory

perhaps its better to not change the original makefile instead create a
new package in OE recipe to sweep these examples into it.
something like below

PACKAGES +=3D "${PN}-examples"

FILES_${PN}-examples =3D+ "${sysconfdir}/mosquitto/*.examples"



> +---
> + Makefile | 9 ---------
> + 1 file changed, 9 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1fc0805..76f81b1 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -39,18 +39,9 @@ install : mosquitto
> + ifeq ($(WITH_DOCS),yes)
> + 	set -e; for d in ${DOCDIRS}; do $(MAKE) -C $${d} install; done
> + endif
> +-	$(INSTALL) -d ${DESTDIR}/etc/mosquitto
> +-	$(INSTALL) -m 644 mosquitto.conf ${DESTDIR}/etc/mosquitto/mosquitto.=
conf.example
> +-	$(INSTALL) -m 644 aclfile.example ${DESTDIR}/etc/mosquitto/aclfile.e=
xample
> +-	$(INSTALL) -m 644 pwfile.example ${DESTDIR}/etc/mosquitto/pwfile.exa=
mple
> +-	$(INSTALL) -m 644 pskfile.example ${DESTDIR}/etc/mosquitto/pskfile.e=
xample
> +=20
> + uninstall :
> + 	set -e; for d in ${DIRS}; do $(MAKE) -C $${d} uninstall; done
> +-	rm -f ${DESTDIR}/etc/mosquitto/mosquitto.conf
> +-	rm -f ${DESTDIR}/etc/mosquitto/aclfile.example
> +-	rm -f ${DESTDIR}/etc/mosquitto/pwfile.example
> +-	rm -f ${DESTDIR}/etc/mosquitto/pskfile.example
> +=20
> + dist : reallyclean
> + 	set -e; for d in ${DISTDIRS}; do $(MAKE) -C $${d} dist; done
> +--=20
> +2.17.0
> +
> diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1=
=2E4.14.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4=
=2E14.bb
> index 13ce3811d4..ea76c36e61 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.14.b=
b
> +++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.14.b=
b
> @@ -13,6 +13,7 @@ DEPENDS =3D "uthash"
>  SRC_URI =3D "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz =
\
>             file://0001-config.mk-allow-prefix-mandir-localedir-from-en=
viron.patch \
>             file://0002-uthash-remove-in-tree-version.patch \
> +           file://0003-makefile-remove-example-files-from-installation=
=2Epatch \
>             file://mosquitto.service \
>             file://mosquitto.init \
>  "
> @@ -47,6 +48,8 @@ do_install() {
>      install -d ${D}${systemd_unitdir}/system/
>      install -m 0644 ${WORKDIR}/mosquitto.service ${D}${systemd_unitdir=
}/system/
> =20
> +    install -d ${D}${sysconfdir}/mosquitto
> +
>      install -d ${D}${sysconfdir}/init.d/
>      install -m 0755 ${WORKDIR}/mosquitto.init ${D}${sysconfdir}/init.d=
/mosquitto
>      sed -i -e 's,@SBINDIR@,${sbindir},g' \
>=20



--vbZp7xHqy4enXGmdY8j2bMJRSMH6klyie--

--2FsmkNb46NiqBuF7iBUXzoP3xPs0Ryj7t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWxF11AAKCRC7BTNVkZ0z
FNk7AJ4uVevCKWnBpJFcVxjL/poNR0WPBQCgk6vEmX2wQAEEQjIwwd4zP4yA19k=
=8Him
-----END PGP SIGNATURE-----

--2FsmkNb46NiqBuF7iBUXzoP3xPs0Ryj7t--
