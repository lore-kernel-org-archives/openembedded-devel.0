Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id EAF1373454
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 22:24:26 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so13130392wes.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 14:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oEJW3X0EQE4qq2BjRQ22O/CfW5GiaSmjogQWF9gD8l8=;
	b=yrUN42VqzpzUoNb2USVvNcAXLM/Rng486KZjkK68V/nFdPefrXgTcSjnkQig+eBD6B
	ARxSdX9OT/3zahMtiWdz8phN/hgA7WOC4u2IMDCNtlfpSJI6QvbQj72ysj+x7hyJjHFD
	dpbwa14waPRdi9jHfB4kZ4BqhqqcuQm8QJz2gNjGTGeQY19CbffRFEGhLRDEnR9DzNWH
	bGsQZh2IGnswYwZ8kHNaVn42R55bAUJ5Mfad7Co4oV7h9Szu0wPHu277V+Igsmxw0gSH
	ZelaUPJuSnPuCtZKeUk7qCYWx7Hg91FYDqXagyfcb14kpYXagdmrOXcMCMhSicww3mLL
	s2Qg==
X-Received: by 10.194.185.68 with SMTP id fa4mr11796175wjc.111.1423779867743; 
	Thu, 12 Feb 2015 14:24:27 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	er13sm7446826wjc.11.2015.02.12.14.24.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 14:24:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Feb 2015 23:24:31 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150212222431.GN2272@jama>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
	<1423776119-14981-17-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1423776119-14981-17-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 16/19] xfce4-timer-plugin: initial add 1.6.0
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
X-List-Received-Date: Thu, 12 Feb 2015 22:24:27 -0000
X-Groupsio-MsgNum: 54243
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fpolVoprVozDR81Y"
Content-Disposition: inline

--fpolVoprVozDR81Y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2015 at 10:21:56PM +0100, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb      | 9 +++=
++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plu=
gin_1.6.0.bb
>=20
> diff --git a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6=
=2E0.bb b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb
> new file mode 100644
> index 0000000..67da684
> --- /dev/null
> +++ b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb
> @@ -0,0 +1,9 @@
> +SUMMARY =3D "This is a simple plugin that lets the user run an alarm at =
a specified time or at the end of a specified countdown period"

SUMMARY should be short, please change to short SUMMARY + longer=20
DESCRIPTION.

> +HOMEPAGE =3D "http://goodies.xfce.org/projects/panel-plugins/xfce4-timer=
-plugin"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dae39271267fd63eb7619432ff24e7=
ff1"
> +
> +inherit xfce-panel-plugin
> +
> +SRC_URI[md5sum] =3D "3be2a4ccfb2af20441b1d25c2cea5f28"
> +SRC_URI[sha256sum] =3D "39d7d21f099bc4219f6a6156142f0bbb8374986ee1970a9c=
0c8dc138b87f867c"
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fpolVoprVozDR81Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTdKB8ACgkQN1Ujt2V2gBy65gCgtbNkBRk10d3yB2A/a77s82xE
VbkAoITE23NqkoRaORLzrSggG0jbMI6b
=q3mH
-----END PGP SIGNATURE-----

--fpolVoprVozDR81Y--
