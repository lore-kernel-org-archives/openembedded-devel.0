Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPolt-0006JU-Fx
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 07:40:09 +0200
Received: by wibhj13 with SMTP id hj13so1209796wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 22:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oz+0DKwwk47Djng46vrUz/59iEV1mp9Ar2wwex8KD9U=;
	b=xOGFDwrmk5B850AkJNDkzk9A28/GnlOd1pnjpn23NBjvFpVzFLy0fdNVklsb9w4iE9
	H7E3ZGqIH0BFvpOTfgx4trnBlaXr+dSzcw7XEYivkF0fXBmFP/wK6tvbZu1oi9QqzcPl
	ZsqUX2+UfKgo8ER70g/YxIWzDwRSk+t2JvZV//EJGlpOdu+TTB2LWrIqGclC4lTydsJB
	kFD58Ex9BGpl1wfqEV/MJhLODBAbNZlBRUGd9nVXB5lXGuiQ+274XL2/AbomkmHHD7xN
	UjWACXO4ImZl161n7Ko7mZxCobDAZhyNw3dqCDRFn7jnud94dhcUfcy+/V1X3CCs6eJk
	giYA==
Received: by 10.180.90.102 with SMTP id bv6mr20425280wib.6.1336023024389;
	Wed, 02 May 2012 22:30:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm49192180wiy.7.2012.05.02.22.30.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 22:30:22 -0700 (PDT)
Date: Thu, 3 May 2012 07:30:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120503053023.GB4658@jama.jama.net>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
	<1335951932-6143-4-git-send-email-koen@dominion.thruhere.net>
	<20120502095150.GA3682@jama.jama.net>
	<CAMKF1spM9urWo1VBXG=qdWOcC_5_2kw-vBGqWv3Lg0xBPWiADA@mail.gmail.com>
	<788719CB-F74E-4219-85AC-82BE71D2068F@dominion.thruhere.net>
	<20120502182913.GA4658@jama.jama.net> <4FA1A48A.2040605@gmail.com>
	<20120502221055.GB4581@denix.org>
	<CAMKF1so1Qi3D==OqBFjLo6AEaJR6318NdJs7vVuqYb=T=c-xHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so1Qi3D==OqBFjLo6AEaJR6318NdJs7vVuqYb=T=c-xHQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe/denzil][PATCH 4/6] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
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
X-List-Received-Date: Thu, 03 May 2012 05:40:09 -0000
X-Groupsio-MsgNum: 38548
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 02, 2012 at 05:04:42PM -0700, Khem Raj wrote:
> On Wed, May 2, 2012 at 3:10 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >> good and as Koen is nodding I assume angstrom is fine too. So I think
> >> we should drop the layer from master.
> >
> > Yes, but not immediately - give one or two week notice, please :) Actua=
lly,
> > this should be considered as a notice and the actual commit to remove s=
hould
> > be executed later, if nobody says otherwise... Basically, sending an RF=
C patch
> > for review that deletes gcc-4.5 and waiting few days should do it.
>=20
> OK consider that as notice then

Maybe keep empty layer (without recipes) at least for a while so that
people doesn't have to update bblayers.conf immediately with next update.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+iF+8ACgkQN1Ujt2V2gByVqwCggEWj04pEKPFwbMgA32PdkBwG
PBUAoIqqjKCENILkT66vUgyBirXeWgmA
=TaGo
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
