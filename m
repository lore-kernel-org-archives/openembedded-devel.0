Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 984357277D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jan 2015 17:41:04 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id x13so6503379wgg.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jan 2015 09:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zKnQ2Sm6mCOLtrn98ljuuXE99BtycI4LjZoNnvoyPq0=;
	b=prhma7vJrxl24xV6KO2fkk8KpnRvQrtdKBrHwMfD8mP7oFZa4om2OLgT6AMMeuuGmy
	ViLN9gAg8gzWJkqLX+datxyfzCdQNOMs84Tl7G4Yhs0ZtBbJZSb1AEpX2n/gJ3u7SddY
	hOUEBuhB5175Hm+7hRgHfLGVnSz6QGAcN4GUdp2ZipOvfdIfDuEJFB5YXkoO9adatHn8
	W1MGeEOnLdPDdkTmR+AgHhKrIlocFeFcw05W5HvVQ8wFIAkvGKELE1bRXr/c65rELExJ
	BdRUn5Jyc0V2ZOD+hmriKlHaR7kA3O8ooJrI280zflg8B5EZ/RP9brS9ybloP/BMBFIh
	fExA==
X-Received: by 10.194.20.67 with SMTP id l3mr72443238wje.94.1420220464561;
	Fri, 02 Jan 2015 09:41:04 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	qg11sm54813983wic.17.2015.01.02.09.41.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jan 2015 09:41:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 2 Jan 2015 18:41:08 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150102174108.GI2469@jama>
References: <cover.1420190530.git.paul.eggleton@linux.intel.com>
	<5a7e4d1f909cba9ca5ff38262fcf638fc880028a.1420190530.git.paul.eggleton@linux.intel.com>
	<20150102124942.GH2469@jama>
	<loom.20150102T180131-945@post.gmane.org>
MIME-Version: 1.0
In-Reply-To: <loom.20150102T180131-945@post.gmane.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 03/11] php: integrate modphp
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
X-List-Received-Date: Fri, 02 Jan 2015 17:41:09 -0000
X-Groupsio-MsgNum: 53569
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dCSxeJc5W8HZXZrD"
Content-Disposition: inline

--dCSxeJc5W8HZXZrD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 02, 2015 at 05:10:34PM +0000, Paul Eggleton wrote:
> Martin Jansa <martin.jansa <at> gmail.com> writes:
> > On Fri, Jan 02, 2015 at 09:31:58AM +0000, Paul Eggleton wrote:
> > > Build the mod-php Apache module within the main php recipe; this avoi=
ds
> > > files in the sysroot from stepping on eachother and therefore avoids =
the
> > > resulting build failure.
> > >=20
> > > Changes made:
> > > * Add an "apache2" PACKAGECONFIG, default enabled. This does mean that
> > >   apache2 is a build dependency by default; if you don't want this,
> > >   set your own PACKAGECONFIG value for the php recipe.
> >=20
> > I think it should be disabled by default, because meta-oe layer doesn't
> > depend on meta-webserver layer where apache2 lives.
>=20
> You're right, somehow I completely missed that - sorry. I'll fix in v2 on
> Monday.
> =20
> > meta-webserver can have .bbappend which will add it to PACKAGECONFIG for
> > xdebug to work with default php recipe.
>=20
> As you may recall I'm of the opinion that software layers should not be
> setting the policy of other layers, so I don't think this is really
> appropriate; I'll just have to live with the fact that users who want it
> will need to enable it themselves. In any case by the end of the patchset,
> xdebug depends on php rather than modphp so it should still build fine
> without apache2 in PACKAGECONFIG.

Ah, ok, I was assuming that xdebug depends on php with apache2
PACKAGECONFIG enabled.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dCSxeJc5W8HZXZrD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSm2DQACgkQN1Ujt2V2gBy+agCfb2JBG+G8NvnWcpR7fo4eREoU
OHgAn1urHcjbLox8QSehDrtgI6gnBh2S
=te6W
-----END PGP SIGNATURE-----

--dCSxeJc5W8HZXZrD--
