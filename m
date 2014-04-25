Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8D27365D67
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 13:45:42 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b57so2807976eek.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 06:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Zvyy/H1oDq6b05QsdDe6mR5qQOJbGm0xmAfV2vh/NB8=;
	b=xohmOI0ui0RHGBfUMwgiez8qPS6LmhfcYsEMDFPXl5JdD4xK1B8ISPlZEYKDduBmPv
	2+mo18yFhXMMxvCSF/T4qtHN+ZfEZJY1he7R94/nubj8HSiGpqJXp6s//HYRUrQvJ+7d
	jtCCq7txdvZVuomTJBan5UoCTfMaqpWT3KfxIxuPyQsO38Y6v41Psu1yFg46Fxcq/A4y
	Ncxsc1gQtEcmm70fqWK1l6fIfgPXBxopnz2DJDXJakRpom9OyARcKvaO5QBW7OJz3FgD
	zWY6gVqzry+6Cz8Y5Q7+gnDb5Hdv2/1yoJiEoOH/fI+rvRW0v1htuVOVjaIkBWfgUGjw
	MlqQ==
X-Received: by 10.14.202.201 with SMTP id d49mr3116793eeo.69.1398433542474;
	Fri, 25 Apr 2014 06:45:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y51sm24992569eeu.0.2014.04.25.06.45.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 06:45:41 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Apr 2014 15:45:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425134551.GY2486@jama>
References: <ljcuj9$fuc$1@ger.gmane.org>
	<CAPbeDCmCodtS+O8tBJwjGyhr0FsiWCd9Sffv9JGsU+p6J1EE2w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPbeDCmCodtS+O8tBJwjGyhr0FsiWCd9Sffv9JGsU+p6J1EE2w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5]remove -reduce-relocations on arm platform
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
X-List-Received-Date: Fri, 25 Apr 2014 13:45:46 -0000
X-Groupsio-MsgNum: 49497
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f1Ot4QhJn5dlG2/n"
Content-Disposition: inline

--f1Ot4QhJn5dlG2/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 03:02:17PM +0200, Jacob Kroon wrote:
> On Fri, Apr 25, 2014 at 8:16 AM, Neuer User <auslands-kv@gmx.de> wrote:
>=20
> > On arm platform the compiler does not implement "-reduce-relocations",
> > see here: https://bugreports.qt-project.org/browse/QTBUG-36129
> >
> > The meta-qt5 layer, however, uses this option, so configure will fail
> > for qtbase.
> >
> >
> I'm building for Wandboard, ARM Cortex-A9, but I haven't had any problems
> building qtbase.
> Is this more of a runtime bug ?

It's catched in configure in 5.3.* version - not sure if it influences
older versions as well - we were seeing runtime issues with older gcc
and 5.2.1 (but we've upgraded gcc and haven't tried to remove
-reduce-relocations).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f1Ot4QhJn5dlG2/n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNaZw8ACgkQN1Ujt2V2gBwxzwCgmcALPBPsfCOvgK/6RfhDnPvJ
HHkAn39w55E5GZIxYzWccTSwb9u75Chq
=PiG3
-----END PGP SIGNATURE-----

--f1Ot4QhJn5dlG2/n--
