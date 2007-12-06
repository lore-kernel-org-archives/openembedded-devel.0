Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J0Fcl-0000Iv-V3
	for openembedded-devel@openembedded.org; Thu, 06 Dec 2007 13:14:40 +0100
Received: from Powerbook-2.local (vpn006011.vpn.utwente.nl [130.89.6.11])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lB6CApnk008644 for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Dec 2007 13:10:51 +0100
Message-ID: <4757E6CB.5010000@student.utwente.nl>
Date: Thu, 06 Dec 2007 13:10:51 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: RFC: make do_deploy operate on packages instead of ${S}
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
X-List-Received-Date: Thu, 06 Dec 2007 12:14:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Richard recently merged packaged-staging2, which highlighted a
fundamental problem in how we implement do_deploy.

But let me define do_deploy first:

  do_deploy puts files somewhere in ${DEPLOY_DIR} for the users
convenience and/or for further do_deploy steps.

With packaged-staging2 all build steps of recipes in DEPENDS are skipped
except for do_populate_staging, which in essence only unpacks an
archive. Which means do_deploy can't fish in ${S} anymore to find the
stuff it needs.

If we look at two of the heaviest do_deploy users (linux kernels and
uboot) we see than do_deploy can be implemented by unpacking the
kernel-image and u-boot packages.  If it would need files that aren't
packaged for good reasons, those files should be moved to staging and
accessed from there.

Note that these problems only surface when doing a clean build using
existing packages and pstage packages. The first build will succeed
because staging hasn't been packaged yet.

Comments?

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHV+bLMkyGM64RGpERAo2rAJ4glb/q44M65LTJj5PgrnrN1p1EMACaAxAZ
XEYFjIgo2fvcq5A1yDw69oo=
=Bwg0
-----END PGP SIGNATURE-----


