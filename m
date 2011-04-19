Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QC6mF-0002Am-Ol
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 10:59:19 +0200
Received: from [2001:638:602:1183:41b:71ff:97b5:93d5] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QC6jy-00085r-Ke by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 10:57:00 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>) id 1QC6jx-0003fa-Mk
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 10:56:57 +0200
Date: Tue, 19 Apr 2011 10:56:57 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110419085657.GB13833@excalibur.local>
References: <1302898356-22075-1-git-send-email-GNUtoo@no-log.org>
	<20110418181707.GG24192@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20110418181707.GG24192@jama.jama.net>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: [PATCH] xserver-nodm-init 2.0: remove DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Tue, 19 Apr 2011 08:59:19 -0000
X-Groupsio-MsgNum: 31306
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

On Mon, 2011-04-18 at 20:17, Martin Jansa wrote:
> On Fri, Apr 15, 2011 at 10:12:36PM +0200, Denis 'GNUtoo' Carikli wrote:
> > That fix was made in order to prevent distributions like Angstrom2010
> >   from picking the 1.0 version:
> > Angstrom 2008 picked the 2.0 version while Angstrom 2010 use the 1.0 ve=
rsion.
> >   That can prevent Xorg session from starting on the target device(like=
 bug20 in my case):
> > The 1.0 lacks the following session start:
> >     xinit /etc/X11/Xsession -- `which $XSERVER` $ARGS >/var/log/Xsessio=
n.log 2>&1
> > And has that instead:
> >     /etc/X11/Xserver &
> > Which has the effect of starting Xorg only(and not the session,display =
manager etc...)
> >=20
> > Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
>=20
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Stefan Schmidt <stefan@buglabs.net>

I did run into this problem as well and pinned angstrom to this
version to avoid it. Removing the default preference makes more sense
to me. Allowing other to use it as well.

regards
Stefan Schmidt

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: http://www.datenfreihafen.org/contact.html

iEYEARECAAYFAk2tTlkACgkQbNSsvd31FmX4lgCgi5hhaX5h6Eccvuu/UAIuj0fZ
IQkAoKf0uBL+HrEL4CphjW6QD+l/Y8qc
=TQNr
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
