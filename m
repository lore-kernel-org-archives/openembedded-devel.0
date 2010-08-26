Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoY6K-0004NJ-Mh for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 10:46:25 +0200
Received: from f053041083.adsl.alicedsl.de ([78.53.41.83]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OoY5v-0005JS-1G for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 08:45:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=gHjEM7eFzNEsZOq9b3y9X06NRq4amF9h0_yhG@mail.gmail.com>
References: <1282754957-7589-1-git-send-email-norguhtar@gmail.com>
	<1282775656.3711.22.camel@mattotaupa>
	<AANLkTi=gHjEM7eFzNEsZOq9b3y9X06NRq4amF9h0_yhG@mail.gmail.com>
Date: Thu, 26 Aug 2010 10:45:56 +0200
Message-ID: <1282812356.3726.33.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] upstart: fix sysvinit compat
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
X-List-Received-Date: Thu, 26 Aug 2010 08:46:25 -0000
X-Groupsio-MsgNum: 22667
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-nLQLsymczI1ax0hXWkLv"

--=-nLQLsymczI1ax0hXWkLv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 26.08.2010, 09:14 +0600 schrieb Anatoly Shipitsin:
> On Thu, Aug 26, 2010 at 04:34, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
> > Am Mittwoch, den 25.08.2010, 22:49 +0600 schrieb Anatoly Shipitsin:
> >
> > Where did you take those from?
> Need more info?

I mean, did you write the those rc, rcS and rcS-default scripts
yourself? (Probably not judging from the copyright in the header.) So
where did you those from? From another distribution? Are they included
somewhere?

> > Small commits =E2=80=93 like changing the package name =E2=80=93 make i=
t easier to
> > review.
> Okey. May be i'm split patch to 5 small patches?

If it is possible, yes!

> > Is not that picked up automatically?
> No.

Please do not cut the lines out I referred to, because I already forget
it ;-) and other would not have to look up the old message too but just
the latest one.

Just to be clear that a meant the following line.

> +EXTRA_OEMAKE +=3D "'bindir=3D${base_bindir}' \
> +              'sbindir=3D${base_sbindir}' \
> +              'usrbindir=3D${bindir}' \
> +              'usrsbindir=3D${sbindir}' \
> +              'includedir=3D${includedir}' \
> +              'mandir=3D${mandir}'"

> Automatically  upstart installed in /usr but for simple and right
> switching with update-alternatives
> it's move to root.

Sorry, I do not understand. What is =C2=BBroot=C2=AB? If it is =C2=BB/=C2=
=AB I do not see in
which line it is used.

> I'm got this additional parameters from sysvinit.

Are you referring to those two?

> +USE_VT ?=3D "1"
> +SYSVINIT_ENABLED_GETTYS ?=3D "1"

But why don=E2=80=99t you add them to `recipes/upstart/upstart_0.3.8.bb`. Y=
ou
could add them to the inc file then.


Thanks,

Paul

--=-nLQLsymczI1ax0hXWkLv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx2Kb4ACgkQPX1aK2wOHVgL0wCfUGuog+BsfxO9oTMXQUfi9In6
ShEAn385O69WRqI0MyoAvVMHOgpNbPl1
=DTFn
-----END PGP SIGNATURE-----

--=-nLQLsymczI1ax0hXWkLv--
