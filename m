Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QTw5p-0006rC-7y
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 15:13:13 +0200
Received: by bwz5 with SMTP id 5so4886631bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 06:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=FzoMyY1WLr+MDfav6EpLlD062LK2s2MFx62Im2CdLpw=;
	b=oenhMl1R2bcfFur3kVeeubLk4D1cw9g2H8tUrK7nUEfzfrVUeFxTfWbgqp4QNnhXWI
	ftosuDG1TwjmnfF/r6nRl9jQDA7ZQoNRl2C3MnAvuT58u7pfEAI+28yCaE0QJwmSsU43
	jFC5oh5jF9A4JphK4v5epnHWPoWppsJJ3C4Nw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Enqasv1vikCvEPEO5sIZDlyYv5LeDK7cACSb9f23XH7GwlQSZY+9falE/+QspPbIjq
	mASFwLIrzY7ex3VZ6ktiNLN8E15ZgTy/GqOcpXVYiMvOnTFx9JrCkxPm2rn+AuXvRKLt
	bZnbhenYC3zf50lPCGVjsH3DzEpPkpxrGKEYk=
Received: by 10.204.38.88 with SMTP id a24mr278385bke.130.1307452195897;
	Tue, 07 Jun 2011 06:09:55 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id g2sm4160589bkz.11.2011.06.07.06.09.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 06:09:55 -0700 (PDT)
Date: Tue, 7 Jun 2011 15:09:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Guillaume BERAUDO <guillaume.beraudo@belledonne-communications.com>
Message-ID: <20110607130953.GB23137@jama.jama.net>
References: <guillaume.beraudo@belledonne-communications.com>
	<1307448812-27299-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
	<20110607124151.GA23137@jama.jama.net>
	<20110607145713.4ff067a0@guibc>
MIME-Version: 1.0
In-Reply-To: <20110607145713.4ff067a0@guibc>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Tue, 07 Jun 2011 13:13:13 -0000
X-Groupsio-MsgNum: 32545
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline

--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2011 at 02:57:13PM +0200, Guillaume BERAUDO wrote:
> Hi Martin,
>=20
> > the 2 patches in linphone-3.1.0 look self-explanatory, are they
> > applied upstream?
> The doc patch seems long ago obsolete.
> I don't see any "ENABLE_GTK_DOC" in configure file.

I'm talking about those in linphone-3.1.0 dir
OE @ ~ $ ls dev/recipes/linphone/linphone-3.1.0/
fix.unused.variable.patch  preferences-segv.patch
=20
> The b64 is cryptic to me, could you explain it?

agreed it's cryptic and I guess we're fine without it (imho it was used
to handle newer gcc like there was special case for __WATCOMC__, but I
haven't look to whole source)

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3uIyEACgkQN1Ujt2V2gBwEDgCfR76zq6EQUtms9613cGcUm+uJ
l30AnRPQmBuPCaGfZtpkmU84E0b6Lui1
=uicj
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
