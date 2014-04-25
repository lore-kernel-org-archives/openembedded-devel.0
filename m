Return-Path: <joe@deserted.net>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 23F8965D6C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:21:57 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id h3so1636753igd.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=97i26noqpYDiUW2RfyDJZZVERuBL/k7+YkkybN0+e4Y=;
	b=YyxnqxHQJ+zUS+dtYMPfvg99bNFfQ2fpZd3467x0YxUoBGVbmbf7jp0vedsdXMg2+p
	jniYHFaoRuLh44l2eknJaxddNiy1YtQQFVHaJdnU2mp2MPhEhxPX8tgmIzzSw+f++l+R
	x3/P6AjMPyaIipBYcsgDKrV/Ima2EmNhN3dBpuvtagEyuZPSwNv59sPdhYwWor4u+Jsp
	b7R+akewp+old7EJqXf7RRcRBIjQAGKEziL9wZxFnwfzthvXtolO9eo3x1/vaIPoORye
	jrvBluMazbK/GtR3l2UBTtMHUTX5Uvv+Xn01UixGsBzT4AllHei3cRjD3C1iLbA02tcF
	z/PA==
X-Gm-Message-State: ALoCoQlWUgGyLc78Xa6Y+4P8oiyq1okgWJ7tl7OWDZTnstu6K3JeCHZ7/iJ197+OC2E2+GkXA/ll
X-Received: by 10.42.4.201 with SMTP id 9mr4693989ict.57.1398388918950;
	Thu, 24 Apr 2014 18:21:58 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	hi8sm3783427igb.8.2014.04.24.18.21.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Apr 2014 18:21:58 -0700 (PDT)
Date: Thu, 24 Apr 2014 21:21:55 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425012153.GJ10115@deserted.net>
References: <cover.1398058983.git.wenzong.fan@windriver.com>
	<ae7e61e82cf2c9f9f35eff905aa79e941d86a8ee.1398058983.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <ae7e61e82cf2c9f9f35eff905aa79e941d86a8ee.1398058983.git.wenzong.fan@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH 2/2] ntp: fix hardcode to /usr/bin/perl
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
X-List-Received-Date: Fri, 25 Apr 2014 01:22:00 -0000
X-Groupsio-MsgNum: 49475
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4vpci17Ql0Nrbul2"
Content-Disposition: inline

--4vpci17Ql0Nrbul2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged this piece, we'll sort out the 1/2 soon I hope.  :-)

-J.

[[oe] [meta-networking][PATCH 2/2] ntp: fix hardcode to /usr/bin/perl] On 1=
4.04.21 (Mon 01:53) wenzong.fan@windriver.com wrote:

> From: Wenzong Fan <wenzong.fan@windriver.com>
>=20
> This patch properly uses the path variables and fixes ntptrace and
> ntp-wait, just in case perl is not installed with the hardcode path.
>=20
> Signed-off-by: Rahat Mahbub <rahat.mahbub@windriver.com>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta-networking/recipes-support/ntp/ntp.inc |    4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index 9c3e0d1..d4adfd8 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -58,6 +58,10 @@ do_install_append() {
>      sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}=
${bindir}/ntpdate-sync
>      sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/ntpd $=
{D}${bindir}/ntpdate-sync
>      sed -i 's!^PATH=3D.*!PATH=3D${base_sbindir}:${base_bindir}:${sbindir=
}:${bindir}!' ${D}${bindir}/ntpdate-sync
> +    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${sbindir}/ntptra=
ce
> +    sed -i '/use/i use warnings;' ${D}${sbindir}/ntptrace
> +    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${sbindir}/ntp-wa=
it
> +    sed -i '/use/i use warnings;' ${D}${sbindir}/ntp-wait
> =20
>      install -d ${D}/${sysconfdir}/default
>      install -m 644 ${WORKDIR}/ntpdate.default ${D}${sysconfdir}/default/=
ntpdate
> --=20
> 1.7.9.5
>=20
--=20
-Joe MacDonald.
:wq

--4vpci17Ql0Nrbul2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlNZuLEACgkQwFvcllog0Xwr0QCgiOXyiQfRXAjgtS902rVHy/V2
624AoLoamoJWwgmaWjHGkVw0fB9Byaxz
=rFLg
-----END PGP SIGNATURE-----

--4vpci17Ql0Nrbul2--
