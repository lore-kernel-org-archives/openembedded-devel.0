Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 25FE66EE39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 11:48:25 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h10so7904494eak.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 03:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GvuU6IVVKmpdmtgfe4BKl8OlS4EPGmjTek4oVe4XMSA=;
	b=FYIMBwa9KALSEBTfIrexHtMLqVp5gJ5+aYBHTwjlEyEutxFRs8W03Vc6T28XNiFzIR
	oVsSCSDAfXDVQ87C97SvEw0SOui/Wa4jGNHtGP+0wG4VNk+aHknKcdW+ACWaUp+0SBQ3
	z0cKPDqKtrSuQuW+3dB8AKaI55L0InhQwp52A/9lKjIARk6jhADsLjjuCLxQj2UPuzpy
	uZHo0UfZwfy2fDjrkO+dSmcDLII+0eVizqitWfVWhyRC17LoqmgAn6TQJo6VRK7NH97a
	0VMh+gfuNjyijKgwt+eDSxoe6bogSX9YK09Lz/c3IvJ7ZpbRJRD2U4pEN2s9HzNxHZ9p
	HzVA==
X-Received: by 10.15.43.141 with SMTP id x13mr32781301eev.35.1392724106395;
	Tue, 18 Feb 2014 03:48:26 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y47sm69287555eel.14.2014.02.18.03.48.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Feb 2014 03:48:24 -0800 (PST)
Date: Tue, 18 Feb 2014 12:48:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140218114855.GH4067@jama>
References: <CAMCfZKFpTVoRJJ68m+vLdD_Pv-WkocXWKcxh6F0DnwP_sJ4t0Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKFpTVoRJJ68m+vLdD_Pv-WkocXWKcxh6F0DnwP_sJ4t0Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: libao build fails on dora and master
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
X-List-Received-Date: Tue, 18 Feb 2014 11:48:27 -0000
X-Groupsio-MsgNum: 48193
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g3RkK9jYN81zD2N+"
Content-Disposition: inline

--g3RkK9jYN81zD2N+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2014 at 08:29:31AM -0300, Diego Sueiro wrote:
> Folks,
>=20
> libao compiling is failing because of a dependency on esound.
> Adding EXTRA_OECONF +=3D "--disable-esd" to recipe fix the issue.

Please add PACKAGECONFIG for esound and send such patch, thanks.

> Should I have to send a patch?
>=20
> Regards,
>=20
> --
> *dS
> Diego Sueiro
>=20
> Administrador do Embarcados
> www.embarcados.com.br
>=20
> /*long live rock 'n roll*/
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--g3RkK9jYN81zD2N+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMDSKcACgkQN1Ujt2V2gBwMaQCfSZ5L3YxyKCdl1nZBu571DFPx
ce0AnRSXeyzJB5UmLPrambLNKZHWunfZ
=hrSG
-----END PGP SIGNATURE-----

--g3RkK9jYN81zD2N+--
