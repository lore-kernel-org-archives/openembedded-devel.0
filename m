Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1F3336BC9C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 18:06:08 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so631943eei.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2014 10:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XHWiqSJXQ9bleTPPj4S0k2MhWNS5WcKisUJhNtkMbh8=;
	b=eaG2592OXY0bI/2CuFdmRe8OiiepdsElvIgZfX0X8qo06nXLCVB0ccMM+V4srQ9Two
	9fJQpCAWs9n5EHIQCylCaRbbTdWCmWmowj1u7m+swdELO5+ULFgSO1a1c10P8F//Eyim
	Gg5fMlwkkyxajfVpGqzcEzdXDMvDHwsGGm8MYhXz0JL7VImZ4prTPHaoXSR4QHo1pNOe
	W4jKrlEnoOKUYfGshmsY7fH+CrropzyB9JHKuwvtXslF2wyalpQLXxCXj0G+n9XNyhN0
	rdkaLdbMSm6Qo15j9LLC81KN74Mf/Yp9IXPrQU4i3ORK7syuRPIDm7n9FwNo1aTDEcrE
	Ek1A==
X-Received: by 10.14.47.133 with SMTP id t5mr4254098eeb.96.1394042769145;
	Wed, 05 Mar 2014 10:06:09 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f45sm11833473eeg.5.2014.03.05.10.06.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 10:06:07 -0800 (PST)
Date: Wed, 5 Mar 2014 19:06:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140305180614.GZ26981@jama>
References: <1393471102-14702-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1393471102-14702-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH v2] xterm: split out resize into a separate package
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
X-List-Received-Date: Wed, 05 Mar 2014 18:06:09 -0000
X-Groupsio-MsgNum: 48526
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g2cxGlaq+3AsTAfB"
Content-Disposition: inline

--g2cxGlaq+3AsTAfB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2014 at 02:18:22PM +1100, Jonathan Liu wrote:
> The resize program is useful on its own without xterm. For example, it
> may be used to resize a serial console.
>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/xterm_293.bb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_293.bb b/meta-oe/rec=
ipes-graphics/xorg-app/xterm_293.bb
> index 67853b9..61bf71e 100644
> --- a/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
> +++ b/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
> @@ -20,4 +20,13 @@ do_configure() {
>      oe_runconf
>  }
> =20
> -FILES_${PN} +=3D " /usr/lib/X11"
> +PACKAGES =3D+ "${PN}-resize ${PN}-resize-dbg ${PN}-resize-doc"

I don't remember the reason now, but IIRC there should be just one -dbg
package per recipe (not sure about -doc), please check oe-core ML.

> +
> +FILES_${PN} +=3D "${libdir}/X11"
> +FILES_${PN}-resize +=3D "${bindir}/resize"
> +FILES_${PN}-resize-dbg +=3D "${bindir}/.debug/resize"
> +FILES_${PN}-resize-doc +=3D "${mandir}/man1/resize.1"
> +
> +RRECOMMENDS_${PN} +=3D "${PN}-resize"
> +RRECOMMENDS_${PN}-dbg +=3D "${PN}-resize-dbg"
> +RRECOMMENDS_${PN}-doc +=3D "${PN}-resize-doc"
> --=20
> 1.9.0
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--g2cxGlaq+3AsTAfB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMXZ5YACgkQN1Ujt2V2gBw8kgCgsfG7RJpxFYJOk9XB0MNG8LYv
4Y0An1LJUMu+OiqBmj25Lf8/aXD3u4E8
=aDbN
-----END PGP SIGNATURE-----

--g2cxGlaq+3AsTAfB--
