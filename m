Received: from [212.75.37.82] (helo=dottedmag.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dottedmag@dottedmag.net>) id 1Jc7kU-0004XJ-Of
	for openembedded-devel@openembedded.org; Thu, 20 Mar 2008 00:31:12 +0100
Received: from frontier.dottedmag.net (unknown [92.125.214.233])
	by dottedmag.net (Postfix) with ESMTP id F35BA8C005
	for <openembedded-devel@openembedded.org>;
	Thu, 20 Mar 2008 05:29:18 +0000 (UTC)
Received: from frontier.dottedmag.net (localhost [127.0.0.1])
	by frontier.dottedmag.net (Postfix) with ESMTP id D54B41C4C2
	for <openembedded-devel@openembedded.org>;
	Thu, 20 Mar 2008 05:31:08 +0600 (NOVT)
From: Mikhail Gusarov <dottedmag@dottedmag.net>
To: openembedded-devel@openembedded.org
Date: Thu, 20 Mar 2008 05:31:08 +0600
Message-ID: <878x0emgub.fsf@frontier.dottedmag.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.60 (gnu/linux)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.75.37.82
X-SA-Exim-Mail-From: dottedmag@dottedmag.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DNS_FROM_RFC_BOGUSMX, RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Default SRCREV value
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
X-List-Received-Date: Wed, 19 Mar 2008 23:31:12 -0000
X-Groupsio-MsgNum: 4708
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=-=-=
Content-Transfer-Encoding: quoted-printable

Hello,

I've stumbled upon SRCREV=3D"1" setting if bitbake.conf today, debugging
misterious mis-build of pkg-native.

Shouldn't SRCREV default to ${AUTOREV} or something like
${sys.write("Please define SRCREV"}; sys.exit(1)} ? Default value of "1"
is hardly useful.

=2D-=20

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH4aI8vse/O6JvVMgRAuh/AJ9oZcyrHy1dyI1YH/xXXbiwYy1vbwCglCa/
WliB5W61eZI9jGHF9BB+ijI=
=wSJ6
-----END PGP SIGNATURE-----

--=-=-=--
