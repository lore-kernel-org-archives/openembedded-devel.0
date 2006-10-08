Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GWgMv-0000jg-BY
	for openembedded-devel@openembedded.org; Sun, 08 Oct 2006 23:39:33 +0200
Received: from [130.89.7.86] (vpn007086.vpn.utwente.nl [130.89.7.86])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k98LXTfd020262 for <openembedded-devel@openembedded.org>;
	Sun, 8 Oct 2006 23:33:29 +0200
Message-ID: <45296EB8.7070704@dominion.kabel.utwente.nl>
Date: Sun, 08 Oct 2006 23:33:44 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: [RFC] Removing MAINTAINER field from recipes
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
X-List-Received-Date: Sun, 08 Oct 2006 21:39:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

After some discussion about the actual meaning of the MAINTAINER field in OE we have
formulated a proposal:

  'All MAINTAINER fields will be removed from the recipes in org.openembedded.dev, and
will only be valid in a distro config file'

We have a number of reasons for doing this:

 * A lot of the MAINTAINER fields are stale
 * Not all people listed in the MAINTAINER fields (want to) have commit access
 * People have blindly copied recipes without contacting the respective MAINTAINER
 * Certain MAINTAINER only care about supporting their $DISTRO
 * The SCM (monotone) holds all the information about who added the recipes and who edited
them.

For monotone-challenged people and tarball snapshots we will add a file into the metadata
that will like names, contact information and interested areas, for example:

- ---

Koen Kooi <koen@openembedded.org>

	* abiword, abiword-plugins
	* angstrom distro and task files
	* h2200, hx4700, efika, ep93xx, netbook-pro machines

Michael 'mickeyl' Lauer <mickeyl@openembedded.org>

	* everything python related
- ---

You can view the patch implementing said proposal at
http://www.openembedded.org/~koen/OE/remove-maintainers.patch

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFKW6PMkyGM64RGpERAk25AJ0bzxc8HfJSvZxLGklgMm6Ewy9CggCfU1jp
z+tRO3+ZMjepQ3oXPUKRGs4=
=Ar2h
-----END PGP SIGNATURE-----


