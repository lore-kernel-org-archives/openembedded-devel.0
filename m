Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0Y5b-0007UZ-Ky
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:48:03 +0100
Received: by eaal10 with SMTP id l10so518986eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:39:42 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.119.194 as permitted sender) client-ip=10.14.119.194; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.119.194 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.119.194])
	by 10.14.119.194 with SMTP id n42mr745879eeh.113.1330000782576
	(num_hops = 1); Thu, 23 Feb 2012 04:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SSVjg/HlsDsSSIJKeV9uHMEmzcDXND8LxEUObOs4GHE=;
	b=NxzmCAnmzLK1dYDGRvV4tCcFusx3WhPrh7AEogITtX+i+7opwz0vVV2eMlZlkEDp1E
	GKxsDkmKuomR1XpYhyYAxee46H6A5KRfkiKKyj2OXCUc3OOo/p1axsisCMfvktRY0DEv
	vSdV5NZI4C9eDqCodL8ZkiaKfc648YGqbotmE=
Received: by 10.14.119.194 with SMTP id n42mr589563eeh.113.1330000782474;
	Thu, 23 Feb 2012 04:39:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v51sm5016409eef.2.2012.02.23.04.39.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:39:41 -0800 (PST)
Date: Thu, 23 Feb 2012 13:39:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120223123938.GQ3769@jama.jama.net>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKoFvg4s4Omew3pdtw3GVZyvpAF+cZCKKP6StJkjWhua9A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoFvg4s4Omew3pdtw3GVZyvpAF+cZCKKP6StJkjWhua9A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe V3 00/23] systemd rework
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
X-List-Received-Date: Thu, 23 Feb 2012 12:48:03 -0000
X-Groupsio-MsgNum: 37394
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="90KBcPA0h13nTGdQ"
Content-Disposition: inline

--90KBcPA0h13nTGdQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 10:31:26AM -0200, Otavio Salvador wrote:
> On Thu, Feb 23, 2012 at 10:10, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > V2 -> V3:
> > (Hopefully) all suggestions and comments were incorporated =A0/ rebased
>=20
> This patchset is ready for merging IMO.

Agreed, just tested in my build and looks good.

Great work Andreas!

> Checking remaining recipes that might be change to use
> ${systemd_unitdir} I found:

I have patch for few:=20
> meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
> meta-oe/recipes-connectivity/gateone/gateone_git.bb
> meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
and networkmanager

but the rest doesn't inherit systemd (yet), so we should update it when
changing them to use systemd.bbclass.
=20
> meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
> meta-oe/recipes-connectivity/cherokee/cherokee.inc
> meta-oe/recipes-core/systemd/systemd-compat-units.bb
> meta-oe/recipes-core/systemd/systemd-serialgetty.bb
> meta-oe/recipes-core/systemd/systemd_git.bb
> meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
> meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
> meta-oe/recipes-graphics/slim/slim_1.3.2.bb
>=20
> I dropped udev ones as I am working on them :-)
>=20
> --=20
> Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.oss=
ystems.com.br
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--90KBcPA0h13nTGdQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9GM4oACgkQN1Ujt2V2gBy+SQCdFa1mU4o38zaEX1otYEhn8cGD
AyIAn16Xvy9oFJkT9HvxlWos4+/mNXkx
=EXLw
-----END PGP SIGNATURE-----

--90KBcPA0h13nTGdQ--
