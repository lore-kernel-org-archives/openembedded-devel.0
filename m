Received: from [62.75.240.18] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <stefan@datenfreihafen.org>) id 1ISf4V-0001mK-Tk
	for openembedded-devel@openembedded.org; Tue, 04 Sep 2007 22:32:27 +0200
Received: from p3ee2eb07.dip.t-dialin.net ([62.226.235.7]
	helo=dodger.lab.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1ISf26-0006mb-Hb by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@openembedded.org>;
	Tue, 04 Sep 2007 22:30:04 +0200
Received: from stefan by dodger.lab.datenfreihafen.org with local (Exim 4.67)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1ISf25-00049w-Np
	for openembedded-devel@openembedded.org; Tue, 04 Sep 2007 22:29:57 +0200
Date: Tue, 4 Sep 2007 22:29:57 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@openembedded.org
Message-ID: <20070904202957.GD1429@dodger.lab.datenfreihafen.org>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.16 (2007-06-11)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
Subject: [RFC] How to handle external kernel patches in oe the right way?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2007 20:32:28 -0000
X-Groupsio-MsgNum: 2833
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x4pBfXISqBoDm8sr"
Content-Disposition: inline

--x4pBfXISqBoDm8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

Due to my work on OpenEZX (http://www.openezx.org) I'm in touch with
external kernel patches used in OE to build working kernels for
different Motorola mobile phones.

Talking with Koen about the best way to handle this we have some
slightly different opinions on this. So we like to get some more
opinions on this before pinning to a strategy.

Koen like to pull the patches from a known-good rev into oe to have
them all at one place for less fragile building and tweaking.

I prefer OE to use our svn server with a fixed SRCREV which gets
updated once a newer version is known good. I'm not a fan of
duplicating the patches in OE if some small tweaking patches can also
handle it.

For bleeding edge building and testing we will create a recipe with
DEFAULT = -1 anyway.

I'm not totally against Koens approach, just see not much sense, but
more problems in duplicating the patches in OE. If other people are
still for it we can of course go that route.

Comments?

regards
Stefan Schmidt

--x4pBfXISqBoDm8sr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: http://www.datenfreihafen.org/contact.html

iD8DBQFG3cBFbNSsvd31FmURAq8JAJ9FKm2WTfZiDw9z+NuD0Vw6nAI19wCgiXQd
KduXOYzoz1fWwYpizQdHjRs=
=9dfg
-----END PGP SIGNATURE-----

--x4pBfXISqBoDm8sr--
