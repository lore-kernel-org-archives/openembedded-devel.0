Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NwUHf-0006Ij-5i for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 07:46:39 +0200
Received: from f053036078.adsl.alicedsl.de ([78.53.36.78]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NwUEY-0008KV-Lc for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 05:43:26 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Mar 2010 07:43:25 +0200
Message-ID: <1269927805.3142.7.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: BitBake: Always fails the first time with Mercuarial/hg repository in `SRC_URI`.
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
X-List-Received-Date: Tue, 30 Mar 2010 05:46:39 -0000
X-Groupsio-MsgNum: 18243
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-pi1AV6/Fw09U280CaHQN"

--=-pi1AV6/Fw09U280CaHQN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


        $ bitbake --version
        BitBake Build Tool Core version 1.8.19, bitbake version 1.8.19

For example if I do

        $ bitbake -b /oe/recipes/libvalhalla/libvalhalla_hg.bb

`do_fetch` is then failing for me when `hg update`(?) is run.

Running the command again works then.

Can you reproduce this and do you know a fix for it?


Thanks,

Paul

--=-pi1AV6/Fw09U280CaHQN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuxj3cACgkQPX1aK2wOHVgwHgCZAcpbWf8Et0JlRCM6Za6pzIQG
cPMAn3TqJoyNscZzZsHn+b3SzpCvu0n7
=HS07
-----END PGP SIGNATURE-----

--=-pi1AV6/Fw09U280CaHQN--
