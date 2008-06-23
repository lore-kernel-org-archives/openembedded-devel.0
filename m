Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KApSz-0006mY-17
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jun 2008 19:04:33 +0200
Received: (qmail invoked by alias); 23 Jun 2008 17:02:42 -0000
Received: from e178110057.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.110.57]
	by mail.gmx.net (mp002) with SMTP; 23 Jun 2008 19:02:42 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX186DMFwOQY6SNbRXYhMYb7ISFqUpPPMBJn83Qt1/n
	Aae5F4EaB4Nq5E
Message-ID: <485FD730.5090301@gmx.net>
Date: Mon, 23 Jun 2008 19:02:40 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: rfc: olsrd recipe cleanup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 23 Jun 2008 17:04:33 -0000
X-Groupsio-MsgNum: 5419
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigE36FA9224105487FDAFF5CB2"

--------------enigE36FA9224105487FDAFF5CB2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I recently stumbled upon our olsrd recipes and thought that they could
be cleaned up a bit.

I am planning to remove all version of the 0.4.x series, 0.5.3 and add
0.5.5 instead. There is also an additional folder named "olsr" instead
of "olsrd" containing an ancient 0.3.something version.

I small patch is needed to fix the makefile in the 0.5.x series. I will
ask upstream if they could merge it.

The only distro defining some version preference is OpenMoko. I updated
it as well. I have olsrd 0.5.5 running with some plugins nicely on the
gta02 here.

Please comment on the bug report I opened for this:
http://bugs.openembedded.net/show_bug.cgi?id=3D4384

Regards
Robert


--------------enigE36FA9224105487FDAFF5CB2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD4DBQFIX9cwG9cfwmwwEtoRCDjLAJjoi3JWF+cJm6VcSWbqyGmiE7TjAJ44tICi
ld1hf4AXO5CkzD9EJL4RVg==
=qnap
-----END PGP SIGNATURE-----

--------------enigE36FA9224105487FDAFF5CB2--
