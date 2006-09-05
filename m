Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GKWKc-0002ek-Ns
	for openembedded-devel@openembedded.org; Tue, 05 Sep 2006 10:30:54 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k858S8kO006506 for <openembedded-devel@openembedded.org>;
	Tue, 5 Sep 2006 10:28:09 +0200
Message-ID: <44FD3519.7000000@dominion.kabel.utwente.nl>
Date: Tue, 05 Sep 2006 10:28:09 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.5 (Macintosh/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.0.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: gtk 2.6/2.8 vs 2.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Sep 2006 08:30:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

A while ago gtk 2.10 was added to OE with a negative default preference since not all the
patches have been forward ported yet. Gtk 2.10 also bumped their ABI version to 2.10,
which leads to some interesting problems:

* do_install for packages dependant on gtk+ breaks since ${libdir}/gtk-2.0/2.4.0/ is now
${libdir}/gtk-2.0/2.10.0/
* some package build against 2.8 but not against 2.10 and vice versa

A lot of these problems can be solved with 'preferred-gtk-2.8-versions.inc', but ideally
we'd want a way to get the gtk PV from inside other recipes (e.g. gtk-engines).

Does anyone have a good idea on how to handle all this?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFE/TUZMkyGM64RGpERAq9tAKCVdIPsK2OeEDbS2O5ClutsTZaTHgCdGNPz
UykeTPjT7Z5bCfrdKGPZGsM=
=ElKm
-----END PGP SIGNATURE-----


