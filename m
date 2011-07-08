Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QfDSn-0002Hy-Ql for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 17:59:33 +0200
Received: from f053043179.adsl.alicedsl.de ([78.53.43.179]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QfDPR-0003wH-MB for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 15:56:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAD=GYpZX9Y5JbQH9YQ7Ozu6Kp6uf72ooFiys-2Ga_aR_q29R6A@mail.gmail.com>
References: <1310017138-8936-1-git-send-email-agnel.joel@gmail.com>
	<1310022018.4532.21.camel@mattotaupa>
	<CAD=GYpaAHX=RiS98pXAqE3bRbBs6gsbXQoSCdcs8+9u=2F267w@mail.gmail.com>
	<CAD=GYpZX9Y5JbQH9YQ7Ozu6Kp6uf72ooFiys-2Ga_aR_q29R6A@mail.gmail.com>
Date: Fri, 08 Jul 2011 17:55:40 +0200
Message-ID: <1310140540.4517.1.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v2] pulseaudio: Run as system-wide instance instead of per-user
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
X-List-Received-Date: Fri, 08 Jul 2011 15:59:33 -0000
X-Groupsio-MsgNum: 33077
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qKrE4HiRxvOWkpRGUcSe"

--=-qKrE4HiRxvOWkpRGUcSe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 07.07.2011, 21:55 -0500 schrieb Joel A Fernandes:
> >> As far as I understood system mode can sometimes be the right thing to
> >> do but most of the time it is just a configuration error. Running PA a=
nd
> >> printing out the debug messages should give you a clue.
> >
> > Pulseaudio isn't printing any debug messages to syslog or stdout ( -vv
> > -log-level pulseaudio options )
> >
> > Here was the thread on BeagleBoard mailing list that discusses this iss=
ue:
> > http://groups.google.com/group/beagleboard/browse_thread/thread/4dc8248=
3a8d000fb/ccbd0e21fa5e89a0
> >
> > I will post the details of the problem on the pulseaudio mailing list
> > and try to get some other alternatives.
> >
> > For now, can we temporarily merge this patch while I followup with them=
?
>=20
> Here is a discussion I started on the pulseaudio list:
> http://lists.freedesktop.org/archives/pulseaudio-discuss/2011-July/010565=
.html

Thank you very much for bringing this issue to upstreams attention.

Regarding to pushing this patch, I am still a little confused since you
wrote to the PA list you are using PA 0.9.15 and your patch is against
0.9.22.


Thanks,

Paul

--=-qKrE4HiRxvOWkpRGUcSe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4XKHYACgkQPX1aK2wOHVhjowCfb094I2WrBtBNmJVUkob92v1a
KBcAnAjEFzD+R9SgeQJnuE9d2tDv1t4P
=bK9E
-----END PGP SIGNATURE-----

--=-qKrE4HiRxvOWkpRGUcSe--
