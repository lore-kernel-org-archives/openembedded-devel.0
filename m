Return-Path: <joe@deserted.net>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9531165D2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:01:04 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id as1so3204841iec.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=ytbx/D5gxBJvXDzEk/oDBkB9NbwOHiGr6U+yNw0cK0s=;
	b=PD+kdeqaNh2MVfL6AkgsW9blQf2IeuL9g1T5bDWuRoVU/YLnrV2iWp2RelGMypOcFq
	HRYRxZVLtqwyqB5h6QYA7W5GcKB3MZtVd+7F8cQMCRcmp1jzR7/GhLkGYCMuS1p27Yj+
	hfT6flqWq3WWynnifGcOHYOMzLoVXLV5kRMoApXDJ7FaiSD6aFxBGipvUMP8sFpffWeD
	Px4aAhO4etHeR8ofcn7U27cQW2KvLidzGFtQQEy+fKNp0oGLw605mekSBL2gaIJksLtJ
	6LpMh5jFbgeHN/ZDYteaLYtnmKyis9eIqqFUUpwgIcsGwf4pi+aN6xhm6/iSCbW9cvzE
	xG2w==
X-Gm-Message-State: ALoCoQmm7WWRiiAUbl3wmjez4O7Gr8tPgyJpjD3Q+EEty+4PjjIhsrSGZg2DA2+36fpmF1KzOnZ+
X-Received: by 10.50.79.161 with SMTP id k1mr1989022igx.31.1398387665135;
	Thu, 24 Apr 2014 18:01:05 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	vc5sm3665144igb.3.2014.04.24.18.01.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Apr 2014 18:01:04 -0700 (PDT)
Date: Thu, 24 Apr 2014 21:01:01 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425010059.GE10115@deserted.net>
References: <1398277829-23252-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1398277829-23252-1-git-send-email-philip@balister.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCHv2] ntp : Add cap to default PACKAGECONFIG options.
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
X-List-Received-Date: Fri, 25 Apr 2014 01:01:04 -0000
X-Groupsio-MsgNum: 49469
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uCPdOCrL+PnN2Vxy"
Content-Disposition: inline

--uCPdOCrL+PnN2Vxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCHv2] ntp : Add cap to default PACKAGECONFIG opt=
ions.] On 14.04.23 (Wed 11:30) Philip Balister wrote:

> If ntp is built without libcap, it refuses to start with the following
> message:
>=20
> Starting ntpd: /usr/sbin/ntpd: The ``user'' option has been disabled -- b=
uilt
> without --enable-clockctl or --enable-linuxcaps
> ntpd - NTP daemon program - Ver. 4.2.6p5
> USAGE:  ntpd [ -<flag> [<val>] | --<name>[{=3D| }<val>] ]...
>=20
> By adding cap to the PACKAGECONFIG the default runs. In the
> future, someone could add an option for using clockctl.
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-networking/recipes-support/ntp/ntp.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index 9c3e0d1..9861fd8 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -36,7 +36,7 @@ USERADD_PACKAGES =3D "${PN}"
>  USERADD_PARAM_${PN} =3D "--system --home-dir /var/lib/ntp \
>                         --shell /bin/false --user-group ntp"
> =20
> -PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG ??=3D "cap"
>  PACKAGECONFIG[openssl] =3D "--with-openssl-libdir=3D${STAGING_LIBDIR} \
>                            --with-openssl-incdir=3D${STAGING_INCDIR} \
>                            --with-crypto, \
> --=20
> 1.9.0
>=20
--=20
-Joe MacDonald.
:wq

--uCPdOCrL+PnN2Vxy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlNZs8sACgkQwFvcllog0Xy8vgCgplI2xxjVFU5pDw3Gvtx8Ufo4
G70AoIJslfE975sonkFYPdLJQz6BKkGS
=9MqI
-----END PGP SIGNATURE-----

--uCPdOCrL+PnN2Vxy--
