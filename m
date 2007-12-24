Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J6iIE-0004ir-Sg
	for openembedded-devel@openembedded.org; Mon, 24 Dec 2007 09:04:10 +0100
Received: from Powerbook-2.local (vpn006136.vpn.utwente.nl [130.89.6.136])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBO7wb0k010449 for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2007 08:58:38 +0100
Message-ID: <476F66AE.40601@student.utwente.nl>
Date: Mon, 24 Dec 2007 08:58:38 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <476F07C6.7010308@whitby.id.au>
In-Reply-To: <476F07C6.7010308@whitby.id.au>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: DISTRO_FEED_CONFIGS
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
X-List-Received-Date: Mon, 24 Dec 2007 08:04:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rod Whitby schreef:
> I would like to propose a new standard OE variable called
> DISTRO_FEED_CONFIGS which is a list of packages to be installed in a
> rootfs to enable the corresponding DISTRO_PACKAGE_MANAGER to actually
> access the feeds associated with the distro.  A distro which did not
> have feed config packages could leave it as the default empty string and
> remain unchanged in the face of this RFC.
> 
> This variable would be set in the respective distro.conf, along with
> DISTRO_PACKAGE_MANAGER.  It would initially be used in base-image.bb
> (see that file for an example of use), and then elsewhere as desired.
> 
> For example, in Angstrom, it would replace the existing
> ANGSTROM_FEED_CONFIGS variable.

+1 from me.

As a side note: this won't touch how the FEED_URIs for static feeds are
used, but will only affect distros that want to put them under
package-management.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHb2auMkyGM64RGpERAvyQAJ4tFxwOU5hvhO6RuvUNhTZywXDQBwCeLiDr
IxBBYAK2LRWcG0Y1Ief8wGA=
=CVj6
-----END PGP SIGNATURE-----


