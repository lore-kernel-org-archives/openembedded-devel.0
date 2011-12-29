Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RgDXD-0004ee-4z
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Dec 2011 11:48:31 +0100
Received: by wibhq7 with SMTP id hq7so6287067wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2011 02:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9mSirXrf8A98LkopA+5NAbeVzplMMFYbBPckfQGmfy0=;
	b=fplDR3BsTqU0BwZPQnkX5JeKEm4TVfdOso+0CxHJYtPZvQ2G3ArfDZDpMh6/qhSTn+
	5Y+vySzwzOzemP/PywquyzTAvjBua9kOHC0eK2CCEdXVQvv3YC8I99/uNJHV3+C5ZWCM
	EBapr2xhuZjmdzVtVT2dNhzGeowLp3KXn7YHw=
Received: by 10.216.136.20 with SMTP id v20mr19672179wei.14.1325155277022;
	Thu, 29 Dec 2011 02:41:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fq5sm13373779wbb.17.2011.12.29.02.41.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Dec 2011 02:41:16 -0800 (PST)
Date: Thu, 29 Dec 2011 11:41:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111229104114.GB16885@jama.jama.net>
References: <1324447304-4874-1-git-send-email-b19537@freescale.com>
	<20111223100335.GO12791@jama.jama.net>
	<CAEsOVNc05t2eoOqYo8U1Ktz4O4cKNgnve2qMLgB0_qn+7H4JDA@mail.gmail.com>
	<20111229102439.GA16885@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111229102439.GA16885@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2 meta-oe 1/7] xmlto: add version 0.0.25
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
X-List-Received-Date: Thu, 29 Dec 2011 10:48:31 -0000
X-Groupsio-MsgNum: 36301
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline

--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 29, 2011 at 11:24:39AM +0100, Martin Jansa wrote:
> On Wed, Dec 28, 2011 at 01:32:24AM +0000, McClintock Matthew-B29882 wrote:
> > On Fri, Dec 23, 2011 at 4:03 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> > > Is there plan to provide native stylesheets too? Because after buildi=
ng
> > > xmlto-native some packages are failing because they detect xmlto-nati=
ve
> > > available but don't check if all needed stylesheets are installed.
> >=20
> > Can you help us out here and tell us what package would provide these?
>=20
> In gentoo they are provided by packages like this
> app-text/docbook-xml-dtd
> but because each docs build can ask for different dtd version then it's
> common to have more than one version installed at the same time (e.g. 4.1,
> 4.2 and 4.3 are mostly used at my gentoo installation)
>=20
> That's why OE-classic and OE-core has those PV already in PN:
> ./recipes/docbook-sgml-dtd
> ./recipes/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
> ./recipes/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native.bb
> ./recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
> ./recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.4-native.bb
> ./recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
> and
> ./meta/recipes-devtools/docbook-sgml-dtd
> ./meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
> ./meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native.bb
> ./meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
> ./meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
>=20
> But those xorg recipes seems to be using dtd-4.3.

To be more clear about the issue:=20

1) now there is also target xmlto without any dtds for target
2) xmlto-native is autodetected as available (ie for xorg stuff) but
   then fails to build docs because cannot find dtds even with
   4.3-native added and installed
   meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb is
   doing some magic to find correct dtd files, not sure if it works
3) xorg builds have xmlto support autodetected, I have patches to
   disable it (to build them on host without stylessheets already
   installed), but if xmlto is fixed and stylesheets available then we
   can force it enabled instead.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk78Q8oACgkQN1Ujt2V2gBzcEwCfVN2G+t6oobsktvRocEOHEQ5b
VLIAoLFQFfvw71LUMxVWuNJbOiAXddQg
=WeDt
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
