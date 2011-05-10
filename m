Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJjPD-0002D9-V8
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 11:39:03 +0200
Received: by fxm19 with SMTP id 19so4691368fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 02:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=JMqz4KG5Y5ZaLn4S/yH8r9gD/rTrC9rcrwKDJ/LdB4g=;
	b=cGA97PD23rW0gO+rdlG3pFfB+tM0LUEDwbYUDzskyhygucg5ncbBy3Ba0++3CH8Hcc
	ynQLFHeSteyRs2PckFqcu/I5X1haM7eP9DodBdZvF4gw5hwXHjRbDtdlS81D1XJdPRYI
	bfjpAvA8k5lulM1FAC/VPE+ePWuR83A4ehtBg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fBPJnVFQI+B0zUn6I3Iyk+o0P/ygPGgxvbq/ZfU3nTepBkeRW6sKa3DrXaR8bWJTLv
	fCySS0qxO4sh8JsTo4pdV2GTD4XF/v0DWQhN4qjDDc2jZevSCJ9OrH1IUXOZ8LCny7bW
	E29WOauEIRlMNZxYRSCvsM5h2nEasWPHFzb0s=
Received: by 10.223.47.209 with SMTP id o17mr1433808faf.129.1305020178886;
	Tue, 10 May 2011 02:36:18 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id s17sm804631fau.37.2011.05.10.02.36.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 02:36:18 -0700 (PDT)
Date: Tue, 10 May 2011 11:36:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110510093616.GB3673@jama.jama.net>
References: <1305013151-17485-1-git-send-email-Martin.Jansa@gmail.com>
	<1305019695.8000.132.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1305019695.8000.132.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] recipes: fix LICENSE fields
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
X-List-Received-Date: Tue, 10 May 2011 09:39:04 -0000
X-Groupsio-MsgNum: 31836
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline

--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 10:28:15AM +0100, Phil Blundell wrote:
> On Tue, 2011-05-10 at 09:39 +0200, Martin Jansa wrote:
> >   | /OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/pixman-0.22.0-r5.0/temp=
/run.SRC_DISTRIBUTECOMMAND.17340: line 95: /pixman: No such file or directo=
ry
>=20
> If '&' in ${LICENSE} is breaking SRC_DISTRIBUTECOMMAND then that
> suggests there is a bug in that code (probably some sort of missing
> quotes).  Removing the &s might be a fine thing to do anyway, but it
> would also be a good idea to track down and fix the underlying bug.

it calls cd tmp/deploy/sources/$license/pixman
where with $license =3D=3D '&' (because LICENSE field is splitted by ' ' and
then '|'), it ends doing cd on background and then complaing about /pixman

Directory named & even when created with right backslash
is still hard to use, so I think it would be better to have QA check=20
that LICENSE field has sane value, even better when we have list of
possible values etc.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3JBxAACgkQN1Ujt2V2gBzB5ACfdAK6SWyvxYJHi+ZDbjxamj1v
QesAoJtiK5f1sFe/X0HAngR3jCA9AATo
=guJ6
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
