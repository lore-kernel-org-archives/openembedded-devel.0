Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QGqme-0001YP-Qn
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 12:55:20 +0200
Received: by bwz5 with SMTP id 5so4968841bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 May 2011 03:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=syzZxH/sy+YGOhJbnDoVXLvAOvAtjL1sxoJcckJjfew=;
	b=IfnuFcILBgLflWY95kavZKXmGCv7M5EXqp8EpzWtJV3i4oCZEa8FoN233PO2k8EfU3
	QiqkyOgbq16pxyyy8BUQ8ydR10VkOeogf1gsiT/USze1D3PbxvQ17FTYyAjwonRe972i
	GcwoZxpMyRPMqAFGthb1xv0gZJZFhw09eYrf8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=jrCDq1swdJYlpnW7EzS5EtCnb8XYFCy/xoolq0xNNtdc0LJCK4UX1LHOCYJ/E3t28J
	kR9awIZhnkD1ZkjkiLshZ1uUqYskiSLwL0GkpuATahxqbLFBqbfLOPa6XDhw/o9ROJ5c
	1iPiDjS1Lo9EV/ojTjgTNZn14Vx45T0VBQoSw=
Received: by 10.204.20.74 with SMTP id e10mr4784242bkb.148.1304333564771;
	Mon, 02 May 2011 03:52:44 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id x6sm3207776bkv.12.2011.05.02.03.52.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2011 03:52:43 -0700 (PDT)
Date: Mon, 2 May 2011 12:52:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110502105241.GA3275@jama.jama.net>
References: <BANLkTik1xhYidSX6QugYpYv5BmXCL78JUA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTik1xhYidSX6QugYpYv5BmXCL78JUA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: buildindex is always 0, using BB_GIT_CLONE_FOR_SRCREV = "1"
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
X-List-Received-Date: Mon, 02 May 2011 10:55:20 -0000
X-Groupsio-MsgNum: 31551
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2011 at 01:18:08PM +0300, Radoslav Kolev wrote:
> Hi,
>=20
> I'm trying to make a recipe which gets the newest revision from a git
> repository.
>=20
> Also to get upgradable packages on different build machines I have the
>=20
> BB_GIT_CLONE_FOR_SRCREV =3D "1"

You need to set empty
BB_LOCALCOUNT_OVERRIDE =3D ""
with it.

Regards,

> option set in my local.conf.
>=20
> In the recipe I have
>=20
> SRCREV =3D "${AUTOREV}"
> PV =3D "0.4+gitr-${SRCPV}"
>=20
> but I always get a PV of the form
> 0.4+gitr-0+f5bb7404c351a08cf405fbe8d667b446ae8e0ef5-r10 where the
> buildindex stays at zero, even though new revisions are correctly
> checked out from the git repository.
>=20
> I added some print statements to bitbake/lib/bb/fetch/__init__.py and
> git.py and it seems to work fine until some point.
>=20
> The _sortable_buildindex in git.py returns the correct incrementing
> value, also the first invocation of get_srcrev() returns a correct
> value with incrementing buildindex like
> 168+f5bb7404c351a08cf405fbe8d667b446ae8e0ef5l. But then something
> happens and in all subsequent invocations by bitbakeit get_srcrev()
> always returns 0+f5bb7404c351a08cf405fbe8d667b446ae8e0ef5l.
>=20
> Any help or ideas how to further debug the issue are greatly
> appreciated.  I'm using bitbake 1.10.
>=20
> Best regards,
> Radoslav Kolev
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2+jPkACgkQN1Ujt2V2gByFhQCeOnS269iVezHA7xERcOdXO/ff
CfYAn35h1VkLTsIvXkSDIRMKekIeAkeA
=FNBF
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
