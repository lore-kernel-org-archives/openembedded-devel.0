Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id D89CD73454
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 22:23:23 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id l18so13147321wgh.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 14:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9xLC7m0RKjGbAOdcV2MAUbXWtxPID65NqIwcwIFcXJ8=;
	b=tv36Utlu31YfWgV1fDYjXrRuGgyx/IdhIOOj5av6ESaKlWJ6AhehVYZ9yarE0ewGDY
	yz3ZBcwVfV1lJawujIyZ+XBhkA6T0S723a2q2zKO0F3YXnrdGMj5AX0lFL5iLEDdPolH
	rhJett4G5IuuZBs/Zo9s3/CdVCWag6m4Kd6TXE+xaubDTVpnaEVocyzBBid9Zd8iJyt4
	MoOYhU32ymln5TRyKu/CsARg1QWaJ3HR2lL0MuDOgdEgZnmRZJbgzzqbXtVlnD7ILLmH
	ETgKq9OObDmJfT0vtLXUksSCqSM2Br0/tXeBJ0RB6wZwd0e312jYT+FiaVlvHRCd3ydy
	XL+A==
X-Received: by 10.180.207.237 with SMTP id lz13mr1113148wic.15.1423779804769; 
	Thu, 12 Feb 2015 14:23:24 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id hs7sm313543wib.4.2015.02.12.14.23.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 14:23:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Feb 2015 23:23:28 +0100
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20150212222328.GM2272@jama>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
	<1423776119-14981-7-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1423776119-14981-7-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 06/19] xfce4-kbdleds-plugin: Initial add 0.0.6
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
X-List-Received-Date: Thu, 12 Feb 2015 22:23:24 -0000
X-Groupsio-MsgNum: 54242
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HL3CiL6n73+IAdG4"
Content-Disposition: inline

--HL3CiL6n73+IAdG4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2015 at 10:21:46PM +0100, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../kbdleds/xfce4-kbdleds-plugin_0.0.6.bb                  | 14 ++++++++=
++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds=
-plugin_0.0.6.bb
>=20
> diff --git a/meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin=
_0.0.6.bb b/meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.=
0.6.bb
> new file mode 100644
> index 0000000..b2b9627
> --- /dev/null
> +++ b/meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.=
bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "This plugin shows the state of your keyboard LEDs: Caps, Sc=
roll and Num Lock in Xfce panel"

SUMMARY should be short, please change to short SUMMARY + longer=20
DESCRIPTION.

> +HOMEPAGE =3D "http://goodies.xfce.org/projects/panel-plugins/xfce4-kbdle=
ds-plugin"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f \
> +    file://COPYING.LIB;md5=3D252890d9eee26aab7b432e8b8a616475 \
> +"
> +
> +inherit xfce-panel-plugin
> +
> +SRC_URI[md5sum] =3D "db6ad8e3502f3373f087ba2034141552"
> +SRC_URI[sha256sum] =3D "6d280ad7207bcb9cc87c279dc3ab9084fd93325e87f67858=
e8917729b50201cd"
> +
> +FILES_${PN} +=3D "${libdir}/xfce4/panel-plugins/xfce4-kbdleds-plugin"
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

--HL3CiL6n73+IAdG4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTdJ+AACgkQN1Ujt2V2gBxTKgCgklaS6wIKf9YIAC6RJmFdu6WF
obIAn1gU9vp9GzQQsBgH0JMmZOODnbsm
=bdRA
-----END PGP SIGNATURE-----

--HL3CiL6n73+IAdG4--
